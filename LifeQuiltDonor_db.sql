# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.5.5-10.1.9-MariaDB-log)
# Database: donation_manager
# Generation Time: 2017-05-24 08:09:53 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table campaigns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaigns`;

CREATE TABLE `campaigns` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CampaignName` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `OrgId` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_campaigns` (`OrgId`),
  CONSTRAINT `fk_campaigns` FOREIGN KEY (`OrgId`) REFERENCES `org` (`OrgId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `campaigns` WRITE;

/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;

INSERT INTO `campaigns` (`id`, `CampaignName`, `Description`, `StartDate`, `OrgId`)
VALUES
	(1,'Fundraiser Gala','Our annual gala fundraiser','2014-11-01',1),
	(2,'Capital Campaign Marathon','Marathon raising money for our capital campaign','2014-10-01',2),
	(3,'Miscellaneous Donations','Direct donations unaffiliated with a specific campaign.','2014-11-19',3),
	(4,'Bake Sale','Gourmet Bake Sale (to end all bake sales)!','2013-12-04',4),
	(5,'test','test','2017-03-03',NULL);

/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table donations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `donations`;

CREATE TABLE `donations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CampaignId` int(11) unsigned NOT NULL,
  `Amount` decimal(64,0) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `DonorId` int(11) unsigned NOT NULL,
  `OrgId` int(11) DEFAULT NULL,  
  PRIMARY KEY (`id`),
  KEY `idx_donations` (`CampaignId`),
  KEY `idx_donations_0` (`DonorId`),
  CONSTRAINT `fk_donations` FOREIGN KEY (`CampaignId`) REFERENCES `campaigns` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_donations_0` FOREIGN KEY (`DonorId`) REFERENCES `donor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `donations` WRITE;
/*!40000 ALTER TABLE `donations` DISABLE KEYS */;

INSERT INTO `donations` (`id`, `CampaignId`, `Amount`, `Date`, `Notes`, `DonorId`)
VALUES
	(1,4,5000,'2014-01-01','Lyda loved the bake sale! Wants to do more next year.',6),
	(2,2,10000,'2014-02-01','John sponsored 200 runners!',5),
	(3,1,25000,'2014-03-11','Pam is a gold sponsor of the gala',2),
	(4,3,15000,'2014-05-01','A disbursement from his trust',4),
	(5,4,2500,'2014-03-03','He didn\'t even buy any baked good, just donated!',1),
	(6,3,50000,'2014-11-03','A foundation grant',1),
	(7,1,20000,'2014-09-01','Sponsors Table',3),
	(8,1,10000,'2013-09-02','Two plates',5),
	(9,2,10000,'2014-10-09','Sponsored T-shirts',1),
	(10,4,25000,'2015-03-03','Finish Line Donor',3),
	(11,3,20000,'2015-03-11','Foundation Grant',1),
	(12,4,10000,'2015-12-04','Table Sponsor',4),
	(13,4,300000,'2015-12-06','sample',4),
	(14,3,330000,'2016-02-03','',6),
	(15,1,0,'2016-05-09','Bbb',4),
	(16,5,123450,'2016-08-08','',6),
	(17,3,2000,'2016-11-11','Golf fund',6),
	(18,3,1200,'2017-03-01','test',6);

/*!40000 ALTER TABLE `donations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table donor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `donor`;

CREATE TABLE `donor` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `MiddleName` char(1) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Occupation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;

INSERT INTO `donor` (`id`, `Name`, `FirstName`, `MiddleName`, `LastName`, `Occupation`)
VALUES
	(1,'Bill Gates','Bill','','Gates','Software'),
	(2,'Pam Omidyar','Pam','','Omidyar','Entrepreneur'),
	(3,'Millicent Atkins','Millicent','','Atkins','Retired'),
	(4,'George Mitchell','George','','Mitchell','CEO'),
	(5,'John Arrillaga','John','','Arrillaga','Developer'),
	(6,'Lyda Hill','Lyda','','Hill','Entrepreneur');

/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `eaddr`;

CREATE TABLE `eaddr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Type` int(1) unsigned DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `eaddr` WRITE;
/*!40000 ALTER TABLE `eaddr` DISABLE KEYS */;

INSERT INTO `eaddr` (`id`, `Type`, `Email`)
VALUES
	(1,2,'bill@hotmail.com'),
	(2,2,'p.omidyar@gmail.com'),
	(3,1,'millicent@atkins.com'),
	(4,2,'g.mitchel@yahoo.com'),
	(5,3,'john.a@gmail.com'),
	(6,2,'lyda@hill.com');

/*!40000 ALTER TABLE `eaddr` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `phonenum`;

CREATE TABLE `phonenum` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Type` int(1) unsigned DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `phonenum` WRITE;
/*!40000 ALTER TABLE `phonenum` DISABLE KEYS */;

INSERT INTO `phonenum` (`id`, `Type`, `Phone`)
VALUES
	(1,1,'443.332.5231'),
	(2,2,'877.326.4332'),
	(3,1,'443.225.3267'),
	(4,1,''),
	(5,3,'774.338.2545'),
	(6,2,'554.856.3241');

/*!40000 ALTER TABLE `phonenum` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `addresses`;

CREATE TABLE `addresses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Type` int(1) unsigned DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Address_Street_1` varchar(255) DEFAULT NULL,
  `Address_Street_2` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `Zip` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;

INSERT INTO `addresses` (`id`, `Type`, `Address`, `Address_Street_1`, `Address_Street_2`, `City`, `State`, `Zip`, `Country`)
VALUES
	(1,'2','1 Microsoft Way Redmond, WA 98052','1 Microsoft Way','','Redmond','WA','98052',''),
	(2,'1','Honolulu, HI ','','','Honolulu','HI','',''),
	(3,'1','Ipswich, SD ','','','Ipswich','SD','',''),
	(4,'2','Galveston, TX ','','','Galveston','TX','',''),
	(5,'2','star, CA ','','','star','CA','',''),
	(6,'3','Dallas, TX ','','','Dallas','TX','','');

/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `org`;

CREATE TABLE `org` (
  `OrgId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Org_Name` varchar(255) DEFAULT NULL,
  `Org_URL` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `MiddleName` char(1) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Address_Street_1` varchar(255) DEFAULT NULL,
  `Address_Street_2` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `Zip` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Orgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `org` WRITE;
/*!40000 ALTER TABLE `org` DISABLE KEYS */;

INSERT INTO `org` (`OrgId`, `Org_Name`, `Org_URL`, `FirstName`, `MiddleName`, `LastName`, `Email`, `Phone`, `Address`, `Address_Street_1`, `Address_Street_2`, `City`, `State`, `Zip`, `Country`)
VALUES
	(1,'Microsoft','www.microsoft.com','Bill','','Gates','bill@outlook.com','443.332.5231','1 Microsoft Way Redmond, WA 98052','1 Microsoft Way','','Redmond','WA','98052',''),
	(2,'Pam Omidyar, LTD','www.pamomidyar.com','Pam','','Omidyar','p.omidyar@gmail.com','877.326.4332','Honolulu, HI ','','','Honolulu','HI','',''),
	(3,'Retired Coots of America','www.retiredcootsusa.com','Millicent','','Atkins','millicent@atkins.com','443.225.3267','Ipswich, SD ','','','Ipswich','SD','',''),
	(4,'ABC Corporation','www.abccorp.com','George','','Mitchell','g.mitchel@yahoo.com','','Galveston, TX ','','','Galveston','TX','',''),
	(5,'Software Einsteins, Inc','www.softwareeinsteins.com','John','','Arrillaga','john.a@gmail.com','774.338.2545','star, CA ','','','star','CA','',''),
	(6,'Lyda Hill','www.microsoft.com','Lyda','','Hill','lyda@hill.com','554.856.3241','Dallas, TX ','','','Dallas','TX','','');

/*!40000 ALTER TABLE `org` ENABLE KEYS */;
UNLOCK TABLES;

# Dump of table Type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Type`;

CREATE TABLE `Type` (
  `Type` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Type` WRITE;
/*!40000 ALTER TABLE `Type` DISABLE KEYS */;

INSERT INTO `Type` (`Type`, `Name`)
VALUES
	(1,'Home'),
	(2,'Work'),
	(3,'Other');

/*!40000 ALTER TABLE `Type` ENABLE KEYS */;
UNLOCK TABLES;


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
