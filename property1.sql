/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.5-10.0.17-MariaDB : Database - property
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`property` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `property`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cid` int(200) NOT NULL AUTO_INCREMENT,
  `cname` varchar(200) DEFAULT NULL,
  `cimage` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`cid`,`cname`,`cimage`) values (5,'Home','2.jpg'),(6,'Appartment','1.jpg'),(7,'Villas','3.jpg'),(8,'Office Buildings','4.jpg');

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `cityid` int(10) NOT NULL AUTO_INCREMENT,
  `cityname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cityid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `city` */

insert  into `city`(`cityid`,`cityname`) values (1,'Pune'),(2,'Mumbai'),(4,'Thane'),(5,'Delhi');

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `cid` int(200) NOT NULL AUTO_INCREMENT,
  `complaintNo` int(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `reg_id` int(200) DEFAULT NULL,
  `pro_id` int(200) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `reg_id` (`reg_id`),
  KEY `pro_id` (`pro_id`),
  CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`reg_id`) REFERENCES `register` (`regid`),
  CONSTRAINT `complaint_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `property` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

/*Table structure for table `contactus` */

DROP TABLE IF EXISTS `contactus`;

CREATE TABLE `contactus` (
  `cid` int(200) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `msg` varchar(400) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `contactus` */

/*Table structure for table `enquiry` */

DROP TABLE IF EXISTS `enquiry`;

CREATE TABLE `enquiry` (
  `eid` int(200) NOT NULL AUTO_INCREMENT,
  `edate` datetime DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL,
  `regid` int(200) DEFAULT NULL,
  `proid` int(200) DEFAULT NULL,
  `rid` int(200) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `regid` (`regid`),
  KEY `proid` (`proid`),
  KEY `rid` (`rid`),
  CONSTRAINT `enquiry_ibfk_1` FOREIGN KEY (`regid`) REFERENCES `register` (`regid`),
  CONSTRAINT `enquiry_ibfk_2` FOREIGN KEY (`proid`) REFERENCES `property` (`pid`),
  CONSTRAINT `enquiry_ibfk_3` FOREIGN KEY (`rid`) REFERENCES `register` (`regid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `enquiry` */

insert  into `enquiry`(`eid`,`edate`,`message`,`regid`,`proid`,`rid`) values (1,'2019-05-24 15:54:12','I am interested in this property. please give me detail of that Property',10,3,2),(2,'2019-05-24 15:56:55','I am interested in this property. please give me detail of that Property',11,11,4),(3,'2019-05-24 15:58:13','I am interested in this property. please give me detail of that Property',11,2,2),(4,'2019-05-24 15:58:53','I am interested in this property. please give me detail of that Property',11,5,4),(5,'2019-05-24 16:36:09','I am interested in this property. please give me detail of that Property',10,6,4),(6,'2019-05-24 17:15:08','ruqsar1997@gmail.com',10,9,4),(7,'2019-05-25 11:44:09','I am interested in this property. please give me detail of that Property',10,9,4),(8,'2019-05-25 15:34:10','I am interested in this property. please give me detail of that Property',10,3,2),(9,'2019-05-25 23:33:27','I am interested in this property. please give me detail of that Property',11,7,4),(10,'2019-05-28 17:59:49','rgzdrhgdzfr',10,7,4),(14,'2019-05-28 18:01:42','dhfshshbdbsd',10,2,2);

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `fid` int(200) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

/*Table structure for table `property` */

DROP TABLE IF EXISTS `property`;

CREATE TABLE `property` (
  `pid` int(200) NOT NULL AUTO_INCREMENT,
  `propertyname` varchar(200) DEFAULT NULL,
  `size` varchar(200) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `bedroom` varchar(200) DEFAULT NULL,
  `bathroom` varchar(200) DEFAULT NULL,
  `pimage` varchar(200) DEFAULT NULL,
  `pdate` date DEFAULT NULL,
  `udated-date` date DEFAULT NULL,
  `reg_id` int(200) DEFAULT NULL,
  `cat_id` int(200) DEFAULT NULL,
  `cityid` int(100) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `reg_id` (`reg_id`),
  KEY `cat_id` (`cat_id`),
  KEY `cityid` (`cityid`),
  CONSTRAINT `property_ibfk_1` FOREIGN KEY (`reg_id`) REFERENCES `register` (`regid`),
  CONSTRAINT `property_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cid`),
  CONSTRAINT `property_ibfk_3` FOREIGN KEY (`cityid`) REFERENCES `city` (`cityid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `property` */

insert  into `property`(`pid`,`propertyname`,`size`,`price`,`address`,`description`,`bedroom`,`bathroom`,`pimage`,`pdate`,`udated-date`,`reg_id`,`cat_id`,`cityid`) values (2,'2 bhk New','1024 sq feet',2500000,'Nigadi',NULL,'6','3','4.jpg',NULL,NULL,2,5,1),(3,'Row House','3000 sq feet',100,'Pune swaragete',NULL,'2','1','5.jpg',NULL,NULL,2,6,2),(4,'NM Property','1024',2500000,'Baner','aaaaaaaaaaaaaaaaaaaaaaa','3','1','H.P.2.Chamber.of.Secrets.2002.DvD.RiP.Hindi.avi_snapshot_01.36.01_[2017.12.31_21.48.17].jpg','2019-03-14','2019-05-29',4,5,NULL),(5,'AH Property','2048',50000,'Kothrud','aaaaaaaaaaaaaaaaaaaaaaaa','4','2','5.jpg','2019-04-15','1970-01-01',4,8,1),(6,'AH Property','2048',2500000,'Baner','aaaaaaaaaaaaaaaaaaaaaa','2','1','sidebar-3.jpg','2019-04-15','1970-01-01',4,5,NULL),(7,'real estate','2000',500000,'bavdhan','sdfahssssssssfddsadd','3','1','11.jpg','2019-04-18',NULL,4,7,2),(9,'real estate','2048',600000,'bavdhan','agsdadafsagrea','4','1','contact.jpg','2019-05-02',NULL,4,6,2),(11,'abc','1000',50000,'Pune','aaaaaaaaaaaaaaaaaaaaaaaa','4','2','contact.jpg','2019-05-21',NULL,4,8,1),(12,'MURMUR Property','2048',150150150,'Nanded City','MURMURMURMURMURMUR','10','1','H.P.2.Chamber.of.Secrets.2002.DvD.RiP.Hindi.avi_snapshot_01.36.01_[2017.12.31_21.48.17].jpg','2019-05-27',NULL,6,6,1);

/*Table structure for table `register` */

DROP TABLE IF EXISTS `register`;

CREATE TABLE `register` (
  `regid` int(200) NOT NULL AUTO_INCREMENT,
  `fname` varchar(200) DEFAULT NULL,
  `lname` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `contact` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `rimage` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `role_id` int(200) DEFAULT NULL,
  PRIMARY KEY (`regid`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `register_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `register` */

insert  into `register`(`regid`,`fname`,`lname`,`email`,`password`,`address`,`contact`,`status`,`date`,`rimage`,`description`,`role_id`) values (1,'Amit','Patil','hulawale.amit7009@gmail.com','123','pune11','8805057007','Activate',NULL,'face-3.jpg','',1),(2,'Avinash','Kshirsagar','kshirsagaravinash1@gmail.com','123','pune','9970113773','Deactivate',NULL,NULL,NULL,2),(4,'Amit','Hulawale','hulawale.amit@gmail.com','123','kothrud',NULL,'Activate',NULL,NULL,NULL,2),(5,'Nikita','Murkute','nikitamurkute21@gmail.com','123','Baner','7020511865','Activate',NULL,'5.jpg','',2),(6,'kabir','shaikh','aaa@aa.aa','123','pune','1234567890','Activate',NULL,NULL,NULL,2),(10,'Ruqsar','S','ruqsar1997@gmail.com','123','bavdhan',NULL,'Activate',NULL,NULL,NULL,3),(11,'payal','bhandari','payal.bhandari@gmail.com','123','kothrud','1010101010','Activate','1970-01-01',NULL,NULL,3);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `rid` int(200) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `role` */

insert  into `role`(`rid`,`rolename`) values (1,'Admin'),(2,'Seller'),(3,'User');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
