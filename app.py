#! /usr/bin/python3.5
# -*- coding:utf-8 -*-

from flask import Flask, render_template, url_for, redirect, request, g, session
import mysql.connector
from passlib.hash import argon2
from apscheduler.schedulers.background import BackgroundScheduler
from apscheduler.triggers.interval import IntervalTrigger
import requests
import atexit
import datetime

app = Flask(__name__)
app.config.from_object('config')
app.config.from_object('secret_config')


def connect_db():
    g.mysql_connection = mysql.connector.connect(
        host=app.config['DATABASE_HOST'],
        user=app.config['DATABASE_USER'],
        password=app.config['DATABASE_PASSWORD'],
        database=app.config['DATABASE_NAME']
    )

    g.mysql_cursor = g.mysql_connection.cursor()
    return g.mysql_cursor


def get_db():
    if not hasattr(g, 'db'):
        g.db = connect_db()
    return g.db

@app.teardown_appcontext
def close_db (error):       
    if hasattr(g, 'db'):
        g.db.close()

def commit():
    g.mysql_connection.commit()

def get_status(url):
    status_code = 999
    try:
        r = requests.get(url, timeout=2)
        r.raise_for_status()
        status_code = r.status_code
    except requests.exceptions.HTTPError as errh:
        status_code = r.status_code
    except requests.exceptions.ConnectionError as errc:
        pass
    except requests.exceptions.Timeout as errt:
        pass
    except requests.exceptions.RequestException as err:
        pass
    return str(status_code)



def status_all():
    with app.app_context():
        db = get_db()
        db.execute('SELECT id, url FROM sites')
        sites = db.fetchall()
        for site in sites:
            id = site[0]
            url = site[1]
            status = get_status(url)
            test = datetime.datetime.now()
            date = test.strftime('%Y-%m-%d %H:%M:%S')
            db = get_db()
            db.execute('INSERT INTO historic (id_web, last_request, answer) VALUES (%(id)s, %(date)s, %(status)s)', {'id': id, 'date': date, 'status': status})
        commit()


scheduler = BackgroundScheduler()
scheduler.start()
scheduler.add_job(
    func=status_all,
    trigger=IntervalTrigger(seconds=2),
    id='status_all',
    name='Ajout status',
    replace_existing=True)
atexit.register(lambda: scheduler.shutdown())


@app.route('/')
def index():
    data = get_db()
    data.execute('SELECT s.id, s.url, h.answer FROM sites s, historic h WHERE s.id = h.id_web and h.last_request=(SELECT MAX(last_request) from historic h1 where h1.id_web = s.id) GROUP BY s.id, s.url, h.answer')
    page = data.fetchall()
    return render_template("index.html", sites = page)


@app.route('/historic/<int:id>')
def historic(id):
    data = get_db()
    data.execute('SELECT h.last_request, h.answer, s.url from historic h, sites s WHERE s.id = h.id_web AND s.id = %(id)s ORDER BY last_request DESC', {'id': id})
    histo = data.fetchall()
    return render_template("historic.html", histo = histo)


@app.route('/login/', methods=['GET', 'POST'])
def login():
    email = str(request.form.get('email'))
    password = str(request.form.get('password'))
    u_ok = False
    data = get_db()
    data.execute('SELECT email, password, is_admin FROM user WHERE email = %(email)s', {'email': email})
    user = data.fetchall()
    for user in user:
        if argon2.verify(password, user[1]):
            u_ok = user

    if u_ok:
        session['user'] = u_ok
        return redirect(url_for('admin'))
    return render_template('login.html')


@app.route('/admin/')
def admin():
    data = get_db()
    data.execute('SELECT id, url FROM sites')
    page = data.fetchall()
    if not session.get('user') or not session.get('user')[2]:
        return redirect(url_for('login'))
    return render_template('admin.html', user=session['user'], sites=page)

@app.route('/admin/logout/')
def logout():
    session.clear()
    return redirect(url_for('login'))


@app.route('/admin/add/',methods=['GET', 'POST'])
def add():
    if not session.get('user') or not session.get('user')[2]:
        return redirect(url_for('login'))
    if request.method == 'POST':
        temp = str(request.form.get('Page'))
        data = get_db()
        data.execute('INSERT INTO sites (url) VALUES (%(temp)s)', {'temp': temp})
        commit()
        return redirect(url_for('admin'))
    return render_template('admin_add.html')

@app.route('/admin/editer/<int:id>', methods=['GET', 'POST'])
def edit(id):
    if not session.get('user') or not session.get('user')[2]:
        return redirect(url_for('login'))
    data = get_db()
    if request.method == 'POST':
        temp = str(request.form.get('Page'))
        data.execute('UPDATE sites SET url = %(temp)s WHERE id = %(id)s', {'temp': temp, 'id': id})
        commit()
        return redirect(url_for('admin'))
    else:
        data.execute('SELECT id, url FROM sites WHERE id = %(id)s', {'id': id})
        page = data.fetchone()
        return render_template('admin_edit.html', user=session['user'], sites=page)

@app.route('/admin/supprimer/<int:id>', methods=['GET', 'POST'])
def delete(id):
    if not session.get('user') or not session.get('user')[2]:
        return redirect(url_for('login'))
    data = get_db()
    if request.method == 'POST':
        data.execute('DELETE FROM sites WHERE id = %(id)s', {'id': id})
        commit()
        return redirect(url_for('admin'))
    else:
        data.execute('SELECT id, url FROM sites WHERE id = %(id)s', {'id': id})
        page = data.fetchone()
        return render_template('admin_sup.html', user=session['user'], sites=page)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')