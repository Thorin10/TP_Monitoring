# Install

Commencez par cloner le projet :
git clone https://github.com/Thorin10/TP_Monitoring

 Utilisez la commande  **pip3 install**  pour installer les différents paquets :
```
pip3 install requests
pip3 install passlib
pip3 install mysql-connector
pip3 install apscheduler
pip3 install flask
```

il faut modifier secret_config.py_  Dans ce fichier vous y mettez vos identifiants d'accès à la base, ainsi que la base à utiliser... Vous trouverez un fichier sql dans les fichiers de manière a tester le programme avec ma base de donnée et vous éviter de créer la votre et modifier les différentes colonnes  dans lequel se trouve un exemple de base. (Je vous conseille de partir de cette base)

```
#Database config
DATABASE_HOST = 'host'
DATABASE_USER = 'username'
DATABASE_PASSWORD = 'password'
DATABASE_NAME = 'database'
SECRET_KEY = 'whatyouwant' 
```

## Exécuter le programme

Vous pouvez dès à présent lancer l'application avec la commande
```
chmod +x app.py
./app.py
```
## Telegram BOT

Vous pouvez discuter avec mon bot Telegram qui vous enverra un message vous notifiant si une erreur est survenue avec un/plusieurs site(s). Cliquer sur le liens si dessous puis sur "send message" pour entamer une conversation avec lui.
```
http://t.me/monitoring_status_web_iotbot
```
