# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 192.168.20.20 (MySQL 5.6.44)
# Database: cats
# Generation Time: 2019-09-16 15:54:45 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table breed
# ------------------------------------------------------------

DROP TABLE IF EXISTS `breed`;

CREATE TABLE `breed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `breed` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `breed` (`breed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table img
# ------------------------------------------------------------

DROP TABLE IF EXISTS `img`;

CREATE TABLE `img` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `img_src` varchar(255) NOT NULL,
  `breed_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `img_src` (`img_src`),
  KEY `breed_id` (`breed_id`),
  CONSTRAINT `breed_id` FOREIGN KEY (`breed_id`) REFERENCES `breed` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
