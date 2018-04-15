-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Dim 15 Avril 2018 à 12:32
-- Version du serveur :  5.7.21-0ubuntu0.16.04.1
-- Version de PHP :  7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cours_iot_python_pour_le_web`
--

-- --------------------------------------------------------

--
-- Structure de la table `historic`
--

CREATE TABLE `historic` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_web` int(11) NOT NULL,
  `last_request` datetime DEFAULT NULL,
  `answer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `historic`
--

INSERT INTO `historic` (`id`, `id_web`, `last_request`, `answer`) VALUES
(1, 22, '2018-04-15 12:27:50', 200),
(2, 28, '2018-04-15 12:27:50', 999),
(3, 22, '2018-04-15 12:27:50', 999),
(4, 28, '2018-04-15 12:27:50', 999),
(5, 22, '2018-04-15 12:27:58', 200),
(6, 28, '2018-04-15 12:27:58', 999),
(7, 22, '2018-04-15 12:27:58', 200),
(8, 28, '2018-04-15 12:27:58', 999),
(9, 22, '2018-04-15 12:28:07', 200),
(10, 28, '2018-04-15 12:28:07', 999),
(11, 22, '2018-04-15 12:28:08', 999),
(12, 28, '2018-04-15 12:28:08', 999),
(13, 22, '2018-04-15 12:28:15', 200),
(14, 28, '2018-04-15 12:28:15', 999),
(15, 22, '2018-04-15 12:28:16', 200),
(16, 28, '2018-04-15 12:28:16', 999),
(17, 22, '2018-04-15 12:28:24', 200),
(18, 28, '2018-04-15 12:28:24', 999),
(19, 22, '2018-04-15 12:28:25', 200),
(20, 28, '2018-04-15 12:28:25', 999),
(21, 22, '2018-04-15 12:28:32', 200),
(22, 28, '2018-04-15 12:28:32', 999),
(23, 22, '2018-04-15 12:28:32', 200),
(24, 28, '2018-04-15 12:28:32', 999),
(25, 22, '2018-04-15 12:28:41', 200),
(26, 22, '2018-04-15 12:28:41', 200),
(27, 28, '2018-04-15 12:28:41', 999),
(28, 28, '2018-04-15 12:28:41', 999),
(29, 22, '2018-04-15 12:28:49', 200),
(30, 28, '2018-04-15 12:28:49', 999),
(31, 22, '2018-04-15 12:28:50', 200),
(32, 28, '2018-04-15 12:28:50', 999),
(33, 22, '2018-04-15 12:28:54', 999),
(34, 28, '2018-04-15 12:28:54', 999),
(35, 22, '2018-04-15 12:29:00', 200),
(36, 28, '2018-04-15 12:29:00', 999),
(37, 22, '2018-04-15 12:29:02', 200),
(38, 28, '2018-04-15 12:29:02', 999),
(39, 22, '2018-04-15 12:29:09', 200),
(40, 28, '2018-04-15 12:29:09', 999),
(41, 22, '2018-04-15 12:29:12', 999),
(42, 28, '2018-04-15 12:29:12', 999),
(43, 22, '2018-04-15 12:29:17', 200),
(44, 28, '2018-04-15 12:29:17', 999),
(45, 22, '2018-04-15 12:29:22', 200),
(46, 28, '2018-04-15 12:29:22', 999),
(47, 22, '2018-04-15 12:29:26', 200),
(48, 28, '2018-04-15 12:29:26', 999),
(49, 22, '2018-04-15 12:29:31', 200),
(50, 28, '2018-04-15 12:29:31', 999),
(51, 22, '2018-04-15 12:29:35', 200),
(52, 28, '2018-04-15 12:29:35', 999),
(53, 22, '2018-04-15 12:29:40', 200),
(54, 28, '2018-04-15 12:29:40', 999),
(55, 22, '2018-04-15 12:29:43', 200),
(56, 28, '2018-04-15 12:29:43', 999),
(57, 22, '2018-04-15 12:29:48', 200),
(58, 28, '2018-04-15 12:29:48', 999),
(59, 22, '2018-04-15 12:29:52', 200),
(60, 28, '2018-04-15 12:29:52', 999),
(61, 22, '2018-04-15 12:29:56', 200),
(62, 28, '2018-04-15 12:29:56', 999),
(63, 22, '2018-04-15 12:30:01', 200),
(64, 28, '2018-04-15 12:30:01', 999),
(65, 22, '2018-04-15 12:30:07', 200),
(66, 28, '2018-04-15 12:30:07', 999),
(67, 22, '2018-04-15 12:30:11', 200),
(68, 28, '2018-04-15 12:30:11', 999),
(69, 22, '2018-04-15 12:30:16', 200),
(70, 28, '2018-04-15 12:30:16', 999),
(71, 22, '2018-04-15 12:30:21', 200),
(72, 28, '2018-04-15 12:30:21', 999),
(73, 22, '2018-04-15 12:30:24', 200),
(74, 28, '2018-04-15 12:30:24', 999),
(75, 22, '2018-04-15 12:30:28', 200),
(76, 28, '2018-04-15 12:30:28', 999),
(77, 22, '2018-04-15 12:30:30', 200),
(78, 28, '2018-04-15 12:30:30', 999),
(79, 22, '2018-04-15 12:30:34', 200),
(80, 28, '2018-04-15 12:30:34', 999),
(81, 22, '2018-04-15 12:30:36', 200),
(82, 28, '2018-04-15 12:30:36', 999),
(83, 22, '2018-04-15 12:30:42', 999),
(84, 28, '2018-04-15 12:30:42', 999),
(85, 22, '2018-04-15 12:30:43', 200),
(86, 28, '2018-04-15 12:30:43', 999),
(87, 22, '2018-04-15 12:30:50', 200),
(88, 28, '2018-04-15 12:30:50', 999),
(89, 22, '2018-04-15 12:30:51', 200),
(90, 28, '2018-04-15 12:30:51', 999),
(91, 22, '2018-04-15 12:30:59', 200),
(92, 28, '2018-04-15 12:30:59', 999),
(93, 22, '2018-04-15 12:30:59', 200),
(94, 28, '2018-04-15 12:30:59', 999),
(95, 22, '2018-04-15 12:31:07', 200),
(96, 28, '2018-04-15 12:31:07', 999),
(97, 22, '2018-04-15 12:31:08', 200),
(98, 28, '2018-04-15 12:31:08', 999),
(99, 22, '2018-04-15 12:31:14', 200),
(100, 28, '2018-04-15 12:31:14', 999),
(101, 22, '2018-04-15 12:31:16', 200),
(102, 28, '2018-04-15 12:31:16', 999),
(103, 22, '2018-04-15 12:31:22', 200),
(104, 28, '2018-04-15 12:31:22', 999),
(105, 22, '2018-04-15 12:31:23', 200),
(106, 28, '2018-04-15 12:31:23', 999),
(107, 22, '2018-04-15 12:31:30', 200),
(108, 28, '2018-04-15 12:31:30', 999),
(109, 22, '2018-04-15 12:31:31', 200),
(110, 28, '2018-04-15 12:31:31', 999),
(111, 22, '2018-04-15 12:31:39', 200),
(112, 28, '2018-04-15 12:31:39', 999),
(113, 22, '2018-04-15 12:31:40', 200),
(114, 28, '2018-04-15 12:31:40', 999),
(115, 22, '2018-04-15 12:31:48', 200),
(116, 28, '2018-04-15 12:31:48', 999),
(117, 22, '2018-04-15 12:31:48', 200),
(118, 28, '2018-04-15 12:31:48', 999);

-- --------------------------------------------------------

--
-- Structure de la table `sites`
--

CREATE TABLE `sites` (
  `id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sites`
--

INSERT INTO `sites` (`id`, `url`) VALUES
(22, 'http://youtube.com'),
(28, 'toto');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(500) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `is_admin`) VALUES
(1, 'someone@yopmail.com', '$argon2i$v=19$m=512,t=2,p=2$07qXMsb4P4fQ+p9T6l3rvQ$hWU817VMNDP/E9l21rYOKQ', 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `historic`
--
ALTER TABLE `historic`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `historic`
--
ALTER TABLE `historic`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
--
-- AUTO_INCREMENT pour la table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
