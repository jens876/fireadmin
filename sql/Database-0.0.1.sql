-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.9-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for fireadmin
CREATE DATABASE IF NOT EXISTS `fireadmin` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `fireadmin`;


-- Dumping structure for table fireadmin.organization
CREATE TABLE IF NOT EXISTS `organization` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `MasterOrganization` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_organization_organization_MasterOrganization` (`MasterOrganization`),
  CONSTRAINT `FK_organization_organization_MasterOrganization` FOREIGN KEY (`MasterOrganization`) REFERENCES `organization` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table fireadmin.user
CREATE TABLE IF NOT EXISTS `user` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `LoginName` varchar(50) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Organization` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `loginName` (`LoginName`),
  KEY `FK_user_organization_Organization` (`Organization`),
  CONSTRAINT `FK_user_organization_Organization` FOREIGN KEY (`Organization`) REFERENCES `organization` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table fireadmin.userroles
CREATE TABLE IF NOT EXISTS `userroles` (
  `LoginName` varchar(50) NOT NULL,
  `Role` varchar(50) NOT NULL,
  KEY `FK_userroles_user_LoginName` (`LoginName`),
  CONSTRAINT `FK_userroles_user_LoginName` FOREIGN KEY (`LoginName`) REFERENCES `user` (`LoginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
