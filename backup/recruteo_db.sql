-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Listage des données de la table recruteo_db.developpeur : ~11 rows (environ)
DELETE FROM `developpeur`;
/*!40000 ALTER TABLE `developpeur` DISABLE KEYS */;
INSERT INTO `developpeur` (`id`, `nom`, `bio`, `created_at`) VALUES
	(1, 'vincent', 'j\'aime les tic tac', '2019-05-15 16:06:55'),
	(2, 'alain', 'j\'aime m\'entrainer', '2019-05-15 16:06:55'),
	(3, 'ozan', 'j\'aime les mangas', '2019-05-15 16:06:55'),
	(4, 'marie-line', 'j\'aime la moto', '2019-05-15 16:06:55'),
	(5, 'serge', 'j\'aime l\'amour véritable', '2019-05-15 16:06:55'),
	(6, 'jamal', 'j\'aime la sieste', '2019-05-15 16:06:55'),
	(7, 'said', 'j\'aime la grasse mat\'', '2019-05-15 16:06:55'),
	(8, 'benjamin', 'j\'aime le hockey sur glace', '2019-05-15 16:06:55'),
	(9, 'julien', 'j\'aime tinder', '2019-05-15 16:06:55'),
	(10, 'marie', 'j\'aime just dance', '2019-05-15 16:06:55'),
	(11, 'majid', 'j\'aime bien me reposer à la maison', '2019-05-15 16:06:55');
/*!40000 ALTER TABLE `developpeur` ENABLE KEYS */;

-- Listage des données de la table recruteo_db.equipe : ~1 rows (environ)
DELETE FROM `equipe`;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
INSERT INTO `equipe` (`id`, `nom`, `created_at`, `id_societe`) VALUES
	(2, 'DWWM', '2019-05-15 15:15:47', 2);
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;

-- Listage des données de la table recruteo_db.equipe_developpeur : ~11 rows (environ)
DELETE FROM `equipe_developpeur`;
/*!40000 ALTER TABLE `equipe_developpeur` DISABLE KEYS */;
INSERT INTO `equipe_developpeur` (`id_developpeur`, `id_equipe`, `date_inscription`) VALUES
	(1, 2, '2019-05-15 16:20:56'),
	(2, 2, '2019-05-15 16:20:56'),
	(3, 2, '2019-05-15 16:20:56'),
	(4, 2, '2019-05-15 16:20:56'),
	(5, 2, '2019-05-15 16:20:56'),
	(6, 2, '2019-05-15 16:20:56'),
	(7, 2, '2019-05-15 16:20:56'),
	(8, 2, '2019-05-15 16:20:56'),
	(9, 2, '2019-05-15 16:20:56'),
	(10, 2, '2019-05-15 16:20:56'),
	(11, 2, '2019-05-15 16:20:56');
/*!40000 ALTER TABLE `equipe_developpeur` ENABLE KEYS */;

-- Listage des données de la table recruteo_db.langage : ~11 rows (environ)
DELETE FROM `langage`;
/*!40000 ALTER TABLE `langage` DISABLE KEYS */;
INSERT INTO `langage` (`id`, `nom`) VALUES
	(1, 'php'),
	(2, 'javascript'),
	(3, 'node.js'),
	(4, 'html'),
	(5, 'css'),
	(6, 'laravel'),
	(7, 'symfony'),
	(8, 'react'),
	(9, 'react native'),
	(10, 'vue.js'),
	(11, 'angular');
/*!40000 ALTER TABLE `langage` ENABLE KEYS */;

-- Listage des données de la table recruteo_db.langage_developpeur : ~51 rows (environ)
DELETE FROM `langage_developpeur`;
/*!40000 ALTER TABLE `langage_developpeur` DISABLE KEYS */;
INSERT INTO `langage_developpeur` (`id_developpeur`, `id_langage`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(1, 2),
	(2, 2),
	(3, 2),
	(4, 2),
	(5, 2),
	(6, 2),
	(7, 2),
	(8, 2),
	(9, 2),
	(10, 2),
	(11, 2),
	(1, 3),
	(2, 3),
	(9, 3),
	(10, 3),
	(2, 4),
	(9, 4),
	(11, 4),
	(2, 5),
	(3, 5),
	(8, 5),
	(9, 5),
	(3, 6),
	(8, 6),
	(11, 6),
	(3, 7),
	(4, 7),
	(7, 7),
	(8, 7),
	(4, 8),
	(7, 8),
	(4, 9),
	(5, 9),
	(6, 9),
	(7, 9),
	(11, 9),
	(5, 10),
	(6, 10),
	(5, 11),
	(6, 11);
/*!40000 ALTER TABLE `langage_developpeur` ENABLE KEYS */;

-- Listage des données de la table recruteo_db.langage_requis_equipe : ~2 rows (environ)
DELETE FROM `langage_requis_equipe`;
/*!40000 ALTER TABLE `langage_requis_equipe` DISABLE KEYS */;
INSERT INTO `langage_requis_equipe` (`id_equipe`, `id_langage`) VALUES
	(2, 1),
	(2, 2);
/*!40000 ALTER TABLE `langage_requis_equipe` ENABLE KEYS */;

-- Listage des données de la table recruteo_db.societe : ~1 rows (environ)
DELETE FROM `societe`;
/*!40000 ALTER TABLE `societe` DISABLE KEYS */;
INSERT INTO `societe` (`id`, `nom`, `adresse`, `code_postal`, `ville`) VALUES
	(2, 'Next-Formation', '6-8 rue Firmin Gillot', '75015', 'paris');
/*!40000 ALTER TABLE `societe` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
