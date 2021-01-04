-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 03 déc. 2020 à 08:40
-- Version du serveur :  10.4.16-MariaDB
-- Version de PHP : 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `video`
--
CREATE DATABASE IF NOT EXISTS `video` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `video`;

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

CREATE TABLE `adherent` (
  `NUM_ADHERENT` int(4) NOT NULL,
  `NOM_ADHERENT` varchar(25) NOT NULL DEFAULT '',
  `PRENOM_ADHERENT` varchar(20) NOT NULL DEFAULT '',
  `ADR_ADHERENT` varchar(32) NOT NULL DEFAULT '',
  `ADR2_ADHERENT` varchar(32) DEFAULT NULL,
  `CODEPOSTAL_ADHERENT` varchar(5) DEFAULT NULL,
  `VILLE_ADHERENT` varchar(25) DEFAULT NULL,
  `TEL_ADHERENT` varchar(15) DEFAULT NULL,
  `DATE_ADHESION` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `REF_PIECE_IDENTITE` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adherent`
--

INSERT INTO `adherent` (`NUM_ADHERENT`, `NOM_ADHERENT`, `PRENOM_ADHERENT`, `ADR_ADHERENT`, `ADR2_ADHERENT`, `CODEPOSTAL_ADHERENT`, `VILLE_ADHERENT`, `TEL_ADHERENT`, `DATE_ADHESION`, `REF_PIECE_IDENTITE`) VALUES
(1, 'Adh1', 'Pr?nomAdh1', 'adrAdh1', '', '06300', 'Nice', '0102030405', '2005-12-15 12:01:41', ''),
(2, 'Adh2', 'Pr?nomadh2', '32, adr adh 2', NULL, '06500', 'Menton', NULL, '2006-10-03 00:00:00', 'CNI 542345678');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `ID_FILM` int(6) NOT NULL,
  `CODE_TYPE_FILM` char(3) NOT NULL DEFAULT '',
  `ID_REALIS` int(4) NOT NULL DEFAULT 0,
  `TITRE_FILM` varchar(20) NOT NULL DEFAULT '',
  `ANNEE_FILM` int(4) NOT NULL DEFAULT 0,
  `REF_IMAGE` varchar(50) DEFAULT NULL,
  `RESUME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`ID_FILM`, `CODE_TYPE_FILM`, `ID_REALIS`, `TITRE_FILM`, `ANNEE_FILM`, `REF_IMAGE`, `RESUME`) VALUES
(1, 'AVE', 1, 'Mon premier film', 2005, 'lamome.jpg', 'r?sum? film 1'),
(2, 'POL', 3, 'Mon 2? film', 2007, 'coeurdeshommes2.jpg', 'r?sum? 2? film'),
(3, 'AVE', 1, 'Mon 3? film', 2003, 'bigmovie.jpg', 'r?sum? 3? film');

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE `location` (
  `NUM_ADHERENT` int(4) NOT NULL DEFAULT 0,
  `ID_FILM` int(6) NOT NULL DEFAULT 0,
  `CODE_SUPPORT` char(1) NOT NULL DEFAULT '',
  `DEBUT_LOCATION` date NOT NULL DEFAULT '0000-00-00',
  `DATE_RETOUR` date DEFAULT NULL,
  `TARIF_APPLIQUE` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `star`
--

CREATE TABLE `star` (
  `ID_STAR` int(4) NOT NULL,
  `NOM_STAR` varchar(25) NOT NULL DEFAULT '',
  `PRENOM_STAR` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `star`
--

INSERT INTO `star` (`ID_STAR`, `NOM_STAR`, `PRENOM_STAR`) VALUES
(4, 'Allen', 'Woody'),
(3, 'Binoche', 'Juliette'),
(2, 'De Niro', 'Robert'),
(1, 'Pitt', 'Brad');

-- --------------------------------------------------------

--
-- Structure de la table `support`
--

CREATE TABLE `support` (
  `CODE_SUPPORT` char(1) NOT NULL DEFAULT '',
  `LIB_SUPPORT` varchar(12) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `support`
--

INSERT INTO `support` (`CODE_SUPPORT`, `LIB_SUPPORT`) VALUES
('B', 'Blue Ray'),
('D', 'DVD'),
('K', 'K7 Vid?o');

-- --------------------------------------------------------

--
-- Structure de la table `typefilm`
--

CREATE TABLE `typefilm` (
  `CODE_TYPE_FILM` char(3) NOT NULL DEFAULT '',
  `LIB_TYPE_FILM` varchar(25) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `typefilm`
--

INSERT INTO `typefilm` (`CODE_TYPE_FILM`, `LIB_TYPE_FILM`) VALUES
('AVE', 'Aventure'),
('COM', 'Com?die'),
('DES', 'Dessin anim?'),
('POL', 'Policier');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD PRIMARY KEY (`NUM_ADHERENT`),
  ADD KEY `NOM_ADHERENT` (`NOM_ADHERENT`,`PRENOM_ADHERENT`);

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`ID_FILM`),
  ADD KEY `CODE_TYPE_FILM` (`CODE_TYPE_FILM`),
  ADD KEY `fk-film-star` (`ID_REALIS`);

--
-- Index pour la table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`NUM_ADHERENT`,`ID_FILM`,`CODE_SUPPORT`,`DEBUT_LOCATION`),
  ADD KEY `fk-location-film` (`ID_FILM`);

--
-- Index pour la table `star`
--
ALTER TABLE `star`
  ADD PRIMARY KEY (`ID_STAR`),
  ADD KEY `NOM_STAR` (`NOM_STAR`,`PRENOM_STAR`);

--
-- Index pour la table `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`CODE_SUPPORT`);

--
-- Index pour la table `typefilm`
--
ALTER TABLE `typefilm`
  ADD PRIMARY KEY (`CODE_TYPE_FILM`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adherent`
--
ALTER TABLE `adherent`
  MODIFY `NUM_ADHERENT` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `ID_FILM` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `star`
--
ALTER TABLE `star`
  MODIFY `ID_STAR` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `fk-film-star` FOREIGN KEY (`ID_REALIS`) REFERENCES `star` (`ID_STAR`),
  ADD CONSTRAINT `fk-film_typefilm` FOREIGN KEY (`CODE_TYPE_FILM`) REFERENCES `typefilm` (`CODE_TYPE_FILM`);

--
-- Contraintes pour la table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `fk-location-adherent` FOREIGN KEY (`NUM_ADHERENT`) REFERENCES `adherent` (`NUM_ADHERENT`),
  ADD CONSTRAINT `fk-location-film` FOREIGN KEY (`ID_FILM`) REFERENCES `film` (`ID_FILM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
