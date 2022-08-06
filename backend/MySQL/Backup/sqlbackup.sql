-- --------------------------------------------------------
-- Anfitrião:                    mext.mysql.database.azure.com
-- Versão do servidor:           8.0.28 - Source distribution
-- SO do servidor:               Linux
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- A despejar estrutura da base de dados para mext
CREATE DATABASE IF NOT EXISTS `mext` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mext`;

-- A despejar estrutura para tabela mext.achievement
CREATE TABLE IF NOT EXISTS `achievement` (
  `achievement_id` int NOT NULL AUTO_INCREMENT,
  `a_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`achievement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- A despejar dados para tabela mext.achievement: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `achievement` ENABLE KEYS */;

-- A despejar estrutura para tabela mext.challenge
CREATE TABLE IF NOT EXISTS `challenge` (
  `challenge_id` int NOT NULL AUTO_INCREMENT,
  `c_name` varchar(10) DEFAULT NULL,
  `c_result` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`challenge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- A despejar dados para tabela mext.challenge: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `challenge` DISABLE KEYS */;
INSERT INTO `challenge` (`challenge_id`, `c_name`, `c_result`) VALUES
	(3, 'teste', '2');
/*!40000 ALTER TABLE `challenge` ENABLE KEYS */;

-- A despejar estrutura para tabela mext.country
CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `region_id` int DEFAULT NULL,
  `country` char(20) DEFAULT NULL,
  PRIMARY KEY (`country_id`),
  KEY `FK_country_region` (`region_id`),
  CONSTRAINT `FK_country_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- A despejar dados para tabela mext.country: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`country_id`, `region_id`, `country`) VALUES
	(1, NULL, 'Portugal'),
	(2, NULL, 'Franca'),
	(3, NULL, 'Espanha'),
	(4, NULL, 'Itália'),
	(5, NULL, 'Sweden');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;

-- A despejar estrutura para tabela mext.evento
CREATE TABLE IF NOT EXISTS `evento` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `event_startLimit` date DEFAULT NULL,
  `event_finishLimit` date DEFAULT NULL,
  `event_distance` varchar(3) DEFAULT NULL,
  `event_description` varchar(50) DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- A despejar dados para tabela mext.evento: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` (`event_id`, `event_name`, `event_startLimit`, `event_finishLimit`, `event_distance`, `event_description`, `country_id`) VALUES
	(1, '10km_Agosto', '2022-08-19', '2022-08-21', '10', '', 1),
	(2, '15km_Agosto', '2022-08-25', '2022-08-28', '15', NULL, 1),
	(3, 'teste', '2023-08-01', '2023-08-07', '5', 'teste', 1);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;

-- A despejar estrutura para tabela mext.level
CREATE TABLE IF NOT EXISTS `level` (
  `level_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`level_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- A despejar dados para tabela mext.level: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` (`level_name`) VALUES
	('Beginner'),
	('Experienced'),
	('Intermediate'),
	('Professional');
/*!40000 ALTER TABLE `level` ENABLE KEYS */;

-- A despejar estrutura para tabela mext.race
CREATE TABLE IF NOT EXISTS `race` (
  `race_id` int NOT NULL AUTO_INCREMENT,
  `race_startDate` date DEFAULT NULL,
  `race_startTime` time DEFAULT NULL,
  `race_totalTime` int DEFAULT NULL,
  `race_maxSpeed` int DEFAULT NULL,
  `race_averageSpeed` int DEFAULT NULL,
  `race_calories` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  `weather_id` int DEFAULT NULL,
  `segment_id` int DEFAULT NULL,
  PRIMARY KEY (`race_id`),
  KEY `user_id` (`user_id`),
  KEY `event_id` (`event_id`),
  KEY `weather_id` (`weather_id`),
  KEY `segment_id` (`segment_id`),
  CONSTRAINT `race_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `race_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `evento` (`event_id`),
  CONSTRAINT `race_ibfk_3` FOREIGN KEY (`weather_id`) REFERENCES `weather` (`weather_id`),
  CONSTRAINT `race_ibfk_4` FOREIGN KEY (`segment_id`) REFERENCES `segment` (`segment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- A despejar dados para tabela mext.race: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `race` DISABLE KEYS */;
INSERT INTO `race` (`race_id`, `race_startDate`, `race_startTime`, `race_totalTime`, `race_maxSpeed`, `race_averageSpeed`, `race_calories`, `user_id`, `event_id`, `weather_id`, `segment_id`) VALUES
	(1, '2022-08-02', '17:06:35', 45, 14, 11, NULL, 1, NULL, NULL, 1);
/*!40000 ALTER TABLE `race` ENABLE KEYS */;

-- A despejar estrutura para tabela mext.raceachievement
CREATE TABLE IF NOT EXISTS `raceachievement` (
  `achievement_id` int DEFAULT NULL,
  `race_id` int DEFAULT NULL,
  KEY `achievement_id` (`achievement_id`),
  KEY `race_id` (`race_id`),
  CONSTRAINT `raceachievement_ibfk_1` FOREIGN KEY (`achievement_id`) REFERENCES `achievement` (`achievement_id`),
  CONSTRAINT `raceachievement_ibfk_2` FOREIGN KEY (`race_id`) REFERENCES `race` (`race_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- A despejar dados para tabela mext.raceachievement: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `raceachievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `raceachievement` ENABLE KEYS */;

-- A despejar estrutura para tabela mext.racechallenge
CREATE TABLE IF NOT EXISTS `racechallenge` (
  `challenge_id` int DEFAULT NULL,
  `race_id` int DEFAULT NULL,
  KEY `challenge_id` (`challenge_id`),
  KEY `race_id` (`race_id`),
  CONSTRAINT `racechallenge_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenge` (`challenge_id`),
  CONSTRAINT `racechallenge_ibfk_2` FOREIGN KEY (`race_id`) REFERENCES `race` (`race_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- A despejar dados para tabela mext.racechallenge: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `racechallenge` DISABLE KEYS */;
/*!40000 ALTER TABLE `racechallenge` ENABLE KEYS */;

-- A despejar estrutura para tabela mext.region
CREATE TABLE IF NOT EXISTS `region` (
  `region_id` int NOT NULL AUTO_INCREMENT,
  `region` char(20) DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- A despejar dados para tabela mext.region: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` (`region_id`, `region`) VALUES
	(1, 'Lisboa'),
	(2, 'Porto'),
	(5, 'Coimbra');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;

-- A despejar estrutura para tabela mext.segment
CREATE TABLE IF NOT EXISTS `segment` (
  `segment_id` int NOT NULL AUTO_INCREMENT,
  `s_map` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `s_distance` char(3) DEFAULT NULL,
  `s_description` varchar(50) DEFAULT NULL,
  `s_groundType` varchar(15) DEFAULT NULL,
  `s_totalElevation` char(3) DEFAULT NULL,
  PRIMARY KEY (`segment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- A despejar dados para tabela mext.segment: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `segment` DISABLE KEYS */;
INSERT INTO `segment` (`segment_id`, `s_map`, `s_distance`, `s_description`, `s_groundType`, `s_totalElevation`) VALUES
	(1, NULL, '8', 'Caxias - Alges', 'Asfalto', '0'),
	(2, NULL, '14', 'Alges - Lisboa', 'Asfalto', '0');
/*!40000 ALTER TABLE `segment` ENABLE KEYS */;

-- A despejar estrutura para tabela mext.user
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_firstname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_lastname` varchar(20) DEFAULT NULL,
  `user_sex` char(1) DEFAULT NULL,
  `user_birthdate` date DEFAULT NULL,
  `user_email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `user_level` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `country_id` (`country_id`),
  KEY `user_level` (`user_level`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`user_level`) REFERENCES `level` (`level_name`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;

-- A despejar dados para tabela mext.user: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `user_username`, `user_firstname`, `user_lastname`, `user_sex`, `user_birthdate`, `user_email`, `country_id`, `user_level`) VALUES
	(1, 'drodrigues', 'Daniel ', 'Rodrigues', 'M', '1987-10-01', 'daniel4rodrigues@gmail.com', NULL, 'Beginner'),
	(2, 'jmota', 'João ', 'Mota', 'M', '1997-01-10', 'joaomota@gmail.com', NULL, 'Experienced'),
	(3, 'dvicente', 'Daniel ', 'Vicente', 'M', '2000-01-01', 'danielvicente@gmail.com', NULL, 'Intermediate'),
	(4, 'mesteves', 'Marilia', 'Esteves', 'F', '1954-01-01', 'mariliaesteves@gmail.com', NULL, 'Professional'),
	(5, 'znabo', 'Ze ', 'Nabo', 'M', '2000-08-01', 'zanabo@hotmail.com', 1, 'Beginner'),
	(8, 'dgvicente', 'Daniel', 'Vicente', 'M', '1984-03-11', 'danielghvicente@gmail.com', 1, 'Beginner'),
	(39, NULL, 'João', 'Mota', 'M', NULL, NULL, NULL, NULL),
	(40, NULL, 'João', 'Mota', 'M', NULL, NULL, NULL, NULL),
	(41, NULL, 'João', 'Mota', 'M', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- A despejar estrutura para tabela mext.weather
CREATE TABLE IF NOT EXISTS `weather` (
  `weather_id` int NOT NULL AUTO_INCREMENT,
  `temperature` int DEFAULT NULL,
  `humidity` decimal(3,1) DEFAULT NULL,
  `precipitation` int DEFAULT NULL,
  PRIMARY KEY (`weather_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- A despejar dados para tabela mext.weather: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `weather` DISABLE KEYS */;
INSERT INTO `weather` (`weather_id`, `temperature`, `humidity`, `precipitation`) VALUES
	(1, 20, 10.0, 0);
/*!40000 ALTER TABLE `weather` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
