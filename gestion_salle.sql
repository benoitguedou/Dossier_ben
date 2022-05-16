-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 16 mai 2022 à 19:43
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_salle`
--

-- --------------------------------------------------------

--
-- Structure de la table `artiste`
--

DROP TABLE IF EXISTS `artiste`;
CREATE TABLE IF NOT EXISTS `artiste` (
  `numartiste` int(11) NOT NULL AUTO_INCREMENT,
  `nomartiste` varchar(255) NOT NULL,
  PRIMARY KEY (`numartiste`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `detail_ticket`
--

DROP TABLE IF EXISTS `detail_ticket`;
CREATE TABLE IF NOT EXISTS `detail_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numrepresentation` int(11) NOT NULL,
  `codeticket` int(11) NOT NULL,
  `montant` decimal(10,0) NOT NULL,
  `nbticket` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `numrepresentation` (`numrepresentation`),
  KEY `codeticket` (`codeticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `representation`
--

DROP TABLE IF EXISTS `representation`;
CREATE TABLE IF NOT EXISTS `representation` (
  `numrepresentation` int(11) NOT NULL AUTO_INCREMENT,
  `numsalle` int(11) NOT NULL,
  `numspectacle` int(11) NOT NULL,
  `daterepresentation` datetime NOT NULL,
  `hdebrepresentation` timestamp NOT NULL,
  `hfinrepresentation` timestamp NOT NULL,
  PRIMARY KEY (`numrepresentation`),
  KEY `numsalle` (`numsalle`),
  KEY `numspectacle` (`numspectacle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `numsalle` int(11) NOT NULL AUTO_INCREMENT,
  `capacite` int(11) NOT NULL,
  `typesalle` varchar(255) NOT NULL,
  PRIMARY KEY (`numsalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `secondaire`
--

DROP TABLE IF EXISTS `secondaire`;
CREATE TABLE IF NOT EXISTS `secondaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numrepresentation` int(11) NOT NULL,
  `numartiste` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `numrepresentation` (`numrepresentation`),
  KEY `numartiste` (`numartiste`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `spectacle`
--

DROP TABLE IF EXISTS `spectacle`;
CREATE TABLE IF NOT EXISTS `spectacle` (
  `numspectacle` int(11) NOT NULL AUTO_INCREMENT,
  `nomspectacle` varchar(255) NOT NULL,
  PRIMARY KEY (`numspectacle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `codeticket` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`codeticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `detail_ticket`
--
ALTER TABLE `detail_ticket`
  ADD CONSTRAINT `detail_ticket_representation_numrepresentation` FOREIGN KEY (`numrepresentation`) REFERENCES `representation` (`numrepresentation`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_ticket_ticket_codeticket` FOREIGN KEY (`codeticket`) REFERENCES `ticket` (`codeticket`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `representation`
--
ALTER TABLE `representation`
  ADD CONSTRAINT `representation_salle_numsalle` FOREIGN KEY (`numsalle`) REFERENCES `salle` (`numsalle`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `representation_spectacle_numspectacle` FOREIGN KEY (`numspectacle`) REFERENCES `spectacle` (`numspectacle`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `secondaire`
--
ALTER TABLE `secondaire`
  ADD CONSTRAINT `secondaire_artiste_numartiste` FOREIGN KEY (`numartiste`) REFERENCES `artiste` (`numartiste`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `secondaire_representation_numrepresentation` FOREIGN KEY (`numrepresentation`) REFERENCES `representation` (`numrepresentation`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
