-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.6-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para tg
CREATE DATABASE IF NOT EXISTS `tg` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `tg`;

-- Copiando estrutura para tabela tg.address
CREATE TABLE IF NOT EXISTS `address` (
  `id_address` int(11) NOT NULL AUTO_INCREMENT,
  `id_city` int(11) NOT NULL,
  `street` varchar(50) NOT NULL,
  `neighborhood` varchar(50) NOT NULL,
  `house_number` varchar(5) NOT NULL,
  PRIMARY KEY (`id_address`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela tg.address: ~2 rows (aproximadamente)
DELETE FROM `address`;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` (`id_address`, `id_city`, `street`, `neighborhood`, `house_number`) VALUES
	(1, 1, 'R. Centenário', 'Jd. Santa Marta', 'S/N'),
	(2, 1, 'R. Joaquim Ant&ocirc;nio da Silva', 'Jd. S&otilde;o Jos&eacute;', '207');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;

-- Copiando estrutura para tabela tg.city
CREATE TABLE IF NOT EXISTS `city` (
  `id_city` int(11) NOT NULL AUTO_INCREMENT,
  `cep` varchar(9) NOT NULL,
  `name` varchar(50) NOT NULL,
  `uf` varchar(2) NOT NULL,
  PRIMARY KEY (`id_city`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela tg.city: ~1 rows (aproximadamente)
DELETE FROM `city`;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`id_city`, `cep`, `name`, `uf`) VALUES
	(1, '13880-000', 'Vargem Grande do Sul', 'SP');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;

-- Copiando estrutura para tabela tg.company
CREATE TABLE IF NOT EXISTS `company` (
  `id_company` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `id_address` int(11) NOT NULL,
  `manager` varchar(50) NOT NULL,
  `business_hour` text NOT NULL,
  PRIMARY KEY (`id_company`),
  KEY `FK_company_address` (`id_address`),
  CONSTRAINT `FK_company_address` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela tg.company: ~0 rows (aproximadamente)
DELETE FROM `company`;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;

-- Copiando estrutura para tabela tg.educational_level
CREATE TABLE IF NOT EXISTS `educational_level` (
  `id_educational_level` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id_educational_level`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela tg.educational_level: ~12 rows (aproximadamente)
DELETE FROM `educational_level`;
/*!40000 ALTER TABLE `educational_level` DISABLE KEYS */;
INSERT INTO `educational_level` (`id_educational_level`, `description`) VALUES
	(1, 'Ensino fundamental incompleto'),
	(2, 'Ensino fundamental completo'),
	(3, 'Ensino m&eacute;dio incompleto'),
	(4, 'Ensino m&eacute;dio completo'),
	(5, 'Ensino superior incompleto'),
	(6, 'Ensino superior completo'),
	(7, 'Especialização incompleta'),
	(8, 'Especialização completa'),
	(9, 'Mestrado incompleto'),
	(10, 'Mestrado completo'),
	(11, 'Doutorado incompleto'),
	(12, 'Doutorado completo');
/*!40000 ALTER TABLE `educational_level` ENABLE KEYS */;

-- Copiando estrutura para tabela tg.post
CREATE TABLE IF NOT EXISTS `post` (
  `id_post` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_post`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela tg.post: ~2 rows (aproximadamente)
DELETE FROM `post`;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`id_post`, `name`) VALUES
	(1, 'Atirador'),
	(2, 'Monitor');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;

-- Copiando estrutura para tabela tg.quarter
CREATE TABLE IF NOT EXISTS `quarter` (
  `id_quarter` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id_address` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_quarter`),
  KEY `FK_quarter_address` (`id_address`),
  CONSTRAINT `FK_quarter_address` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela tg.quarter: ~2 rows (aproximadamente)
DELETE FROM `quarter`;
/*!40000 ALTER TABLE `quarter` DISABLE KEYS */;
INSERT INTO `quarter` (`id_quarter`, `code`, `name`, `id_address`) VALUES
	(1, 'ALL', 'ALL', NULL),
	(2, 'TG 02-092', 'TG Vargem Grande do Sul', 1);
/*!40000 ALTER TABLE `quarter` ENABLE KEYS */;

-- Copiando estrutura para tabela tg.religion
CREATE TABLE IF NOT EXISTS `religion` (
  `id_religion` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_religion`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela tg.religion: ~8 rows (aproximadamente)
DELETE FROM `religion`;
/*!40000 ALTER TABLE `religion` DISABLE KEYS */;
INSERT INTO `religion` (`id_religion`, `name`) VALUES
	(1, 'Agn&oacute;stico'),
	(2, 'Ateu'),
	(3, 'Candomblecista'),
	(4, 'Cat&oacute;lico'),
	(5, 'Cient&oacute;logo'),
	(6, 'Crente'),
	(7, 'Esp&iacute;rita'),
	(8, 'Testemunha de Jeov&aacute;');
/*!40000 ALTER TABLE `religion` ENABLE KEYS */;

-- Copiando estrutura para tabela tg.school
CREATE TABLE IF NOT EXISTS `school` (
  `id_school` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_address` int(11) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`id_school`),
  KEY `FK_school_address` (`id_address`),
  CONSTRAINT `FK_school_address` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela tg.school: ~1 rows (aproximadamente)
DELETE FROM `school`;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` (`id_school`, `name`, `id_address`, `phone`) VALUES
	(1, 'ETEC de Vargem Grande do Sul', 2, '+55 (19) 3643-1364');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;

-- Copiando estrutura para tabela tg.skin
CREATE TABLE IF NOT EXISTS `skin` (
  `id_skin` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id_skin`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela tg.skin: ~4 rows (aproximadamente)
DELETE FROM `skin`;
/*!40000 ALTER TABLE `skin` DISABLE KEYS */;
INSERT INTO `skin` (`id_skin`, `description`) VALUES
	(1, 'Branco'),
	(2, 'Preto'),
	(3, '&Iacute;ndio'),
	(4, 'Amarelo');
/*!40000 ALTER TABLE `skin` ENABLE KEYS */;

-- Copiando estrutura para tabela tg.soldier
CREATE TABLE IF NOT EXISTS `soldier` (
  `id_soldier` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `rg` varchar(12) NOT NULL,
  `father` varchar(50) DEFAULT NULL,
  `mother` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `phone` varchar(20) NOT NULL,
  `id_address` int(11) NOT NULL,
  `id_company` int(11) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `eye_color` varchar(30) DEFAULT NULL,
  `hair_color` varchar(30) DEFAULT NULL,
  `call_number` int(11) NOT NULL,
  `height` float NOT NULL,
  `id_school` int(11) NOT NULL,
  `war_name` varchar(20) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_religion` int(11) NOT NULL,
  `id_skin` int(11) NOT NULL,
  `weight` float NOT NULL,
  `id_educational_level` int(11) NOT NULL,
  `id_vehicle` int(11) DEFAULT NULL,
  `picture` varchar(100) NOT NULL DEFAULT '_img/profiles/default.jpg',
  PRIMARY KEY (`id_soldier`),
  KEY `FK_soldier_address` (`id_address`),
  KEY `FK_soldier_company` (`id_company`),
  KEY `FK_soldier_school` (`id_school`),
  KEY `FK_soldier_post` (`id_post`),
  KEY `FK_soldier_religion` (`id_religion`),
  KEY `FK_soldier_skin` (`id_skin`),
  KEY `FK_soldier_educational_level` (`id_educational_level`),
  KEY `FK_soldier_vehicle` (`id_vehicle`),
  KEY `FK_soldier_user` (`id_user`),
  CONSTRAINT `FK_soldier_address` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`),
  CONSTRAINT `FK_soldier_company` FOREIGN KEY (`id_company`) REFERENCES `company` (`id_company`),
  CONSTRAINT `FK_soldier_educational_level` FOREIGN KEY (`id_educational_level`) REFERENCES `educational_level` (`id_educational_level`),
  CONSTRAINT `FK_soldier_post` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`),
  CONSTRAINT `FK_soldier_religion` FOREIGN KEY (`id_religion`) REFERENCES `religion` (`id_religion`),
  CONSTRAINT `FK_soldier_school` FOREIGN KEY (`id_school`) REFERENCES `school` (`id_school`),
  CONSTRAINT `FK_soldier_skin` FOREIGN KEY (`id_skin`) REFERENCES `skin` (`id_skin`),
  CONSTRAINT `FK_soldier_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `FK_soldier_vehicle` FOREIGN KEY (`id_vehicle`) REFERENCES `vehicle` (`id_vehicle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela tg.soldier: ~0 rows (aproximadamente)
DELETE FROM `soldier`;
/*!40000 ALTER TABLE `soldier` DISABLE KEYS */;
INSERT INTO `soldier` (`id_soldier`, `id_user`, `name`, `cpf`, `rg`, `father`, `mother`, `birthday`, `phone`, `id_address`, `id_company`, `job`, `eye_color`, `hair_color`, `call_number`, `height`, `id_school`, `war_name`, `id_post`, `id_religion`, `id_skin`, `weight`, `id_educational_level`, `id_vehicle`, `picture`) VALUES
	(1, 2, 'Guilherme Martinho Luiz', '457.431.518/06', '56.604.200-9', 'Ronildo da Silva Luiz', 'Maria Bernadete Tortelo Luiz', '2000-09-11', '+55 (19) 9-8394-7480', 1, NULL, 'Desenvolvedor Full Stack', 'Castanho escuro', 'Preto', 999, 1.82, 1, 'Nery', 1, 1, 1, 82, 5, NULL, '_img/profiles/default.png');
/*!40000 ALTER TABLE `soldier` ENABLE KEYS */;

-- Copiando estrutura para tabela tg.user
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id_quarter` int(11) NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `FK__quarter` (`id_quarter`),
  CONSTRAINT `FK__quarter` FOREIGN KEY (`id_quarter`) REFERENCES `quarter` (`id_quarter`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela tg.user: ~2 rows (aproximadamente)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id_user`, `username`, `email`, `password`, `id_quarter`) VALUES
	(1, 'admin', 'admin', 'admin', 1),
	(2, 'gm.luiz', 'guilherme@vssoft.com', 'senha', 2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Copiando estrutura para tabela tg.vehicle
CREATE TABLE IF NOT EXISTS `vehicle` (
  `id_vehicle` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `license_plate` varchar(30) NOT NULL,
  `color` varchar(20) NOT NULL,
  `title_number` int(11) NOT NULL,
  `section` varchar(50) NOT NULL,
  `zone` varchar(50) NOT NULL,
  PRIMARY KEY (`id_vehicle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela tg.vehicle: ~1 rows (aproximadamente)
DELETE FROM `vehicle`;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` (`id_vehicle`, `type`, `brand`, `license_plate`, `color`, `title_number`, `section`, `zone`) VALUES
	(1, 'Carro', 'Volkswagen', 'GTX1080', 'Chumbo', 1234, '12', '12');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
