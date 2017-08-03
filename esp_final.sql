-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 01 Juin 2017 à 14:32
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `esp_final`
--

-- --------------------------------------------------------

--
-- Structure de la table `arch_feature`
--

CREATE TABLE `arch_feature` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `indice` int(11) NOT NULL DEFAULT '-1',
  `tests` text COLLATE utf8_unicode_ci,
  `prefix` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `postfix` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `arch_feature`
--

INSERT INTO `arch_feature` (`id`, `nom`, `product_id`, `type`, `indice`, `tests`, `prefix`, `postfix`, `value`) VALUES
(16, 'Finition pll', 5, 0, 3, '{}', '', '', ''),
(15, 'eclairage pll', 5, 0, 2, '{}', '', '', ''),
(14, 'longueur pll', 5, 1, -1, '{}', '', '', ''),
(13, 'type pll', 5, 0, 1, '{}', '', '', ''),
(17, 'type potence', 6, 0, 1, '{}', '', '', ''),
(18, 'longueur potence', 6, 0, 2, '{"../f17":"==52,==53,==54,==55,==56"}', '', '', ''),
(19, 'nombre potence par pll', 6, 1, -1, '{"../f17":"==52,==53,==54,==55,==56,==57"}', '', '', ''),
(20, 'nbre source par pll', 11, 1, -1, '{}', '', '', ''),
(21, 'nombre de PLL', 5, 1, -1, '{}', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `arch_option`
--

CREATE TABLE `arch_option` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `feature_id` bigint(20) UNSIGNED NOT NULL,
  `tests` text COLLATE utf8_unicode_ci,
  `value` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `prefix` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postfix` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `typeException` int(11) NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `arch_option`
--

INSERT INTO `arch_option` (`id`, `nom`, `feature_id`, `tests`, `value`, `prefix`, `postfix`, `typeException`) VALUES
(50, 'Anodise', 16, '{}', 'ANS', NULL, NULL, -1),
(49, 'Laque Noir', 16, '{}', 'N', NULL, NULL, -1),
(48, 'Laque Blanc', 16, '{}', '', NULL, NULL, -1),
(47, 'Laque Ral', 16, '{}', '', NULL, NULL, -1),
(46, 'Street Liner', 15, '{"../f13":"==39"}', 'STLINER2', NULL, NULL, 2),
(45, 'LED Liner', 15, '{"../f13":"==39"}', 'LEDLINE', NULL, NULL, 2),
(44, 'Tube LED', 15, '{}', 'TUBLED', NULL, NULL, -1),
(43, 'T5-Electronique', 15, '{}', 'T5', NULL, NULL, -1),
(42, 'T8-Ferromagnétique', 15, '{}', 'T8', NULL, NULL, -1),
(41, 'T8-Electronique', 15, '{}', 'T8E', NULL, NULL, -1),
(40, 'PLL145', 13, '{}', 'PLL145-2', NULL, NULL, -1),
(39, 'PLL100', 13, '{}', 'PLL100-1', NULL, NULL, -1),
(51, 'Sans Potence', 17, '{}', '', NULL, NULL, 1),
(52, 'Standard', 17, '{}', '', NULL, NULL, -1),
(53, 'New Higth Tech', 17, '{}', 'NHT', NULL, NULL, -1),
(54, 'New Desing', 17, '{}', 'ND', NULL, NULL, -1),
(55, 'New Design pour les panneau', 17, '{}', 'NDP', NULL, NULL, -1),
(56, 'New Standard', 17, '{}', 'NS', NULL, NULL, -1),
(57, 'Fixation murale', 17, '{}', 'FIXMURINC', NULL, NULL, 1),
(58, '125', 18, '{}', '125', NULL, NULL, -1),
(59, '200', 18, '{}', '200', NULL, NULL, -1),
(60, '400', 18, '{"../f17":"==52,==54,==55,==56"}', '400', NULL, NULL, -1),
(61, '500', 18, '{"../f17":"==53"}', '500', NULL, NULL, -1);

-- --------------------------------------------------------

--
-- Structure de la table `arch_product`
--

CREATE TABLE `arch_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED DEFAULT NULL,
  `mandatory` tinyint(1) DEFAULT '0',
  `tests` text COLLATE utf8_unicode_ci,
  `prefix` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `postfix` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `strategy` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `equation` text COLLATE utf8_unicode_ci,
  `equation_qte` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `arch_product`
--

INSERT INTO `arch_product` (`id`, `nom`, `parent`, `mandatory`, `tests`, `prefix`, `postfix`, `strategy`, `equation`, `equation_qte`) VALUES
(6, 'potence', 5, 0, '{}', 'P', 'BC', 'BasicPrefixPostfixWithExceptionStrategy', 'fg(21)*fg(19)', 'fg(19)*fg(21)'),
(5, 'PLL', NULL, 1, '{}', '', '', 'BasicPrefixPostfixWithExceptionStrategy', 'fg(21)*fg(14)/1000', 'fg(21)'),
(7, 'Peinte Potence ', 6, 1, '{"../../f16":"==47,==49,==50","../f17":"==52,==53,==54,==55,==56,==57"}', 'PEINTPOT', '', 'BasicPrefixStrategy', 'fg(21)*fg(19)', 'fg(19)*fg(21)'),
(8, 'Peinture PLL', 5, 1, '{"../f16":"==47"}', 'PEINTPLLML', '', 'BasicPrefixStrategy', 'fg(21)*fg(14)/1000', 'fg(21)'),
(9, 'Forfait Peinture', 5, 1, '{"../f16":"==47"}', 'PEINTPLLFOR', '', 'BasicPrefixStrategy', '1', '1'),
(10, 'Fiole offerte', 5, 1, '{"../f16":"==47"}', 'FIOLE', '', 'BasicPrefixStrategy', '1', '1'),
(11, ' Source PLL STREET LINER ', 5, 1, '{"../f15":"==46"}', 'PLL100STREET-SOURC', '', 'BasicPrefixStrategy', 'fg(21)*fg(20)', 'fg(20)*fg(21)');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fname` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client` bigint(20) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_shipped` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande_feature`
--

CREATE TABLE `commande_feature` (
  `id_commande` bigint(20) UNSIGNED NOT NULL,
  `id_feature` bigint(20) UNSIGNED NOT NULL,
  `id_parent` bigint(20) UNSIGNED NOT NULL,
  `value` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande_produit`
--

CREATE TABLE `commande_produit` (
  `id_produit` bigint(20) UNSIGNED NOT NULL,
  `id_commande` bigint(20) UNSIGNED NOT NULL,
  `id_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `data`
--

CREATE TABLE `data` (
  `ref` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `prix_u` float NOT NULL,
  `poids_u` float NOT NULL,
  `id` int(11) NOT NULL,
  `designation` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `data`
--

INSERT INTO `data` (`ref`, `prix_u`, `poids_u`, `id`, `designation`) VALUES
('PLL100-1T8EANS', 55.65, 2, 18, 'PLL100 - IP43 - 1 rangée T8 HR - 6500K - Ballasts électronique'),
('PLL100-1T8EN', 55.65, 2, 17, 'PLL100 - IP43 - 1 rangée T8 HR - 6500K - Ballasts électronique'),
('PLL100-1T8E', 55.65, 2, 16, 'PLL100 - IP43 - 1 rangée T8 HR - 6500K - Ballasts électronique'),
('PLL145-2T8E', 73.5, 3, 15, 'PLL145 - IP43 - 2 rangées T8 HR - 6500K - Ballasts électronique'),
('PLL145-2T8EANS', 73.5, 3, 14, 'PLL145 - IP43 - 2 rangées T8 HR - 6500K - Ballasts électronique'),
('PLL145-2T8EN', 73.5, 3, 13, 'PLL145 - IP43 - 2 rangées T8 HR - 6500K - Ballasts électronique'),
('PLL145-2T8E', 73.5, 3, 12, 'PLL145 - IP43 - 2 rangées T8 HR - 6500K - Ballasts électronique'),
('PEINTPLLML', 25, 0, 10, 'Finition : LAQUE '),
('PEINTPLLFOR', 62.5, 0, 11, 'Mise à la teinte :  '),
('PLL100-1T8E', 55.65, 2, 19, 'PLL100 - IP43 - 1 rangée T8 HR - 6500K - Ballasts électronique'),
('PLL145-2T8', 63, 3, 20, 'PLL145 - IP43 - 2 rangées T8 HR - 6500K - Ballasts ferromagnetiques'),
('PLL145-2T8N', 63, 3, 21, 'PLL145 - IP43 - 2 rangées T8 HR - 6500K - Ballasts ferromagnetiques'),
('PLL145-2T8ANS', 63, 3, 22, 'PLL145 - IP43 - 2 rangées T8 HR - 6500K - Ballasts ferromagnetiques'),
('PLL145-2T8', 63, 3, 23, 'PLL145 - IP43 - 2 rangées T8 HR - 6500K - Ballasts ferromagnetiques'),
('PLL100-1T8', 50.4, 2, 24, 'PLL100 - IP43 - 1 rangées T8 HR - 6500K - Ballasts ferromagnetiques'),
('PLL100-1T8N', 50.4, 2, 25, 'PLL100 - IP43 - 1 rangées T8 HR - 6500K - Ballasts ferromagnetiques'),
('PLL100-1T8ANS', 50.4, 2, 26, 'PLL100 - IP43 - 1 rangées T8 HR - 6500K - Ballasts ferromagnetiques'),
('PLL100-1T8', 50.4, 2, 27, 'PLL100 - IP43 - 1 rangées T8 HR - 6500K - Ballasts ferromagnetiques'),
('PLL100-1T5', 57.75, 2, 28, 'PLL100 - IP43 - 1 rangée T5 HR - 6500K - Ballasts électronique'),
('PLL100-1T5N', 57.75, 2, 29, 'PLL100 - IP43 - 1 rangée T5 HR - 6500K - Ballasts électronique'),
('PLL100-1T5ANS', 57.75, 2, 30, 'PLL100 - IP43 - 1 rangée T5 HR - 6500K - Ballasts électronique'),
('PLL100-1T5', 57.75, 2, 31, 'PLL100 - IP43 - 1 rangée T5 HR - 6500K - Ballasts électronique'),
('PLL145-2T5', 78.75, 2, 32, 'PLL100 - IP43 - 2 rangée T5 HR - 6500K - Ballasts électronique'),
('PLL145-2T5N', 78.75, 2, 33, 'PLL100 - IP43 - 2 rangée T5 HR - 6500K - Ballasts électronique'),
('PLL145-2T5ANS', 78.75, 2, 34, 'PLL100 - IP43 - 2 rangée T5 HR - 6500K - Ballasts électronique'),
('PLL145-2T5', 78.75, 2, 35, 'PLL100 - IP43 - 2 rangée T5 HR - 6500K - Ballasts électronique'),
('PLL100-1TUBLED', 84, 2, 36, 'PLL100 - IP43 - 1 rangée de Tubes LED - 22 W/m - 2200 Lm/m - 6500 K '),
('PLL100-1TUBLEDN', 84, 2, 37, 'PLL100 - IP43 - 1 rangée de Tubes LED - 22 W/m - 2200 Lm/m - 6500 K '),
('PLL100-1TUBLEDANS', 84, 2, 38, 'PLL100 - IP43 - 1 rangée de Tubes LED - 22 W/m - 2200 Lm/m - 6500 K'),
('PLL100-1TUBLED', 84, 2, 39, 'PLL100 - IP43 - 1 rangée de Tubes LED - 22 W/m - 2200 Lm/m - 6500 K '),
('PLL145-2TUBLED', 126, 3, 40, 'PLL145 - IP43 - 2 rangée de Tubes LED - 44 W/m - 4400 Lm/m - 6500 K '),
('PLL145-2TUBLEDN', 126, 3, 41, 'PLL145 - IP43 - 2 rangée de Tubes LED - 44 W/m - 4400 Lm/m - 6500 K '),
('PLL145-2TUBLEDANS', 126, 3, 42, 'PLL145 - IP43 - 2 rangée de Tubes LED - 44 W/m - 4400 Lm/m - 6500 K'),
('PLL145-2TUBLED', 126, 3, 43, 'PLL145 - IP43 - 2 rangée de Tubes LED - 44 W/m - 4400 Lm/m - 6500 K'),
('PLL100-LEDLINE', 131.25, 2, 44, 'PLL100 - IP43 - LEDLINE- 20 W/m- 2400 Lm/m-  4000K + convertisseur'),
('PLL100-LEDLINEN', 131.25, 2, 45, 'PLL100 - IP43 - LEDLINE- 20 W/m- 2400 Lm/m-  4000K + convertisseur'),
('PLL100-LEDLINEANS', 131.25, 2, 46, 'PLL100 - IP43 - LEDLINE- 20 W/m- 2400 Lm/m-  4000K + convertisseur'),
('PLL100-LEDLINE', 131.25, 2, 47, 'PLL100 - IP43 - LEDLINE- 20 W/m- 2400 Lm/m-  4000K + convertisseur'),
('PLL100-STLINER2', 42, 2, 48, 'PLL100- IP67 -  '),
('PLL100-STLINER2N', 42, 2, 49, 'PLL100- IP67 -  '),
('PLL100-STLINER2ANS', 42, 2, 50, 'PLL100- IP67 -'),
('PLL100-STLINER2', 42, 2, 51, 'PLL100- IP67 -  '),
('PLL100STREET-SOURC', 120.75, 2, 52, 'Sources par PLL STREET LINER 2 - (35W - 3000Lm - 5000K), / source'),
('PNHT125BC', 14.7, 0.08125, 53, 'Potence New High-Tech 125 mm'),
('PNHT200BC', 15.225, 0.13, 54, 'Potence New High-Tech 200 mm '),
('PNHT500BC', 15.75, 0.325, 55, 'Potence New High-Tech 500 mm '),
('PNS125BC', 11.55, 0.08125, 56, 'Potence New Standard 125 mm '),
('PNS200BC', 12.6, 0.13, 57, 'Potence New Standard 200 mm '),
('PNS400BC', 13.65, 0.26, 58, 'Potence New Standard 400 mm'),
('P125BC', 11.55, 0.08125, 59, 'Potence Standard 125 mm'),
('P200BC', 12.6, 0.13, 60, 'Potence Standard 200 mm '),
('P400BC', 13.65, 0.26, 61, 'Potence Standard 400 mm '),
('PND125BC', 14.7, 0.08125, 62, 'Potence New Design 125 mm'),
('PND200BC', 15.225, 0.13, 63, 'Potence New Design 200 mm'),
('PND400BC', 15.75, 0.26, 64, 'Potence New Design 400 mm'),
('PNDP125BC', 14.7, 0.08125, 65, 'Potence New Design PANNEAU 125 mm'),
('PNDP200BC', 15.225, 0.13, 66, 'Potence New Design PANNEAU 200 mm'),
('PNDP400BC', 15.75, 0.26, 67, 'Potence New Design PANNEAU 400 mm'),
('FIXMURINC', 2.625, 0.025, 68, 'Fixation murale Easy en aluminium Lg 100 mm '),
('PEINTPOT', 6, 0, 69, 'Laquage des Potences en'),
('FIOLE', 0, 0, 70, 'FIOLE DE PEINTURE OFFERTE');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `arch_feature`
--
ALTER TABLE `arch_feature`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rel_archf_archp` (`product_id`);

--
-- Index pour la table `arch_option`
--
ALTER TABLE `arch_option`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `arch_product`
--
ALTER TABLE `arch_product`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rel_commande_client` (`client`);

--
-- Index pour la table `commande_feature`
--
ALTER TABLE `commande_feature`
  ADD PRIMARY KEY (`id_commande`,`id_feature`,`id_parent`);

--
-- Index pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD PRIMARY KEY (`id_produit`,`id_commande`,`id_parent`);

--
-- Index pour la table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `arch_feature`
--
ALTER TABLE `arch_feature`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT pour la table `arch_option`
--
ALTER TABLE `arch_option`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT pour la table `arch_product`
--
ALTER TABLE `arch_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `data`
--
ALTER TABLE `data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
