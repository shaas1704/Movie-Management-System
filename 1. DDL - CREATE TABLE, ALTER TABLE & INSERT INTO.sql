/* CREATE TABLE - INSERT DATA, ALTER */

CREATE DATABASE /*!32312 IF NOT EXISTS*/`music library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `music library`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `admin_id` INT NOT NULL AUTO_INCREMENT,
  `admin_username` VARCHAR(40) DEFAULT NULL,
  `admin_password` VARCHAR(60) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admin` */

INSERT  INTO `admin`(`admin_id`,`admin_username`,`admin_password`) VALUES 
(1,'Manan','manan0803'),
(2,'Sanil','sanil068'),
(3,'Kapes','kapes070');

/*Table structure for table `agent` */

DROP TABLE IF EXISTS `agent`;

CREATE TABLE `agent` (
  `agent_id` INT NOT NULL AUTO_INCREMENT,
  `agent_name` VARCHAR(40) DEFAULT NULL,
  `admin_id` INT DEFAULT NULL,
  PRIMARY KEY (`agent_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `agent_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `agent` */

INSERT  INTO `agent`(`agent_id`,`agent_name`,`admin_id`) VALUES 
(1,'Hard Rock Labels',1),
(2,'WCMT Records',3),
(3,'Paradigm Talent Agency',2),
(4,'Live Clefs Talent Hub',1);

/*Table structure for table `album` */

DROP TABLE IF EXISTS `album`;

CREATE TABLE `album` (
  `alb_id` INT NOT NULL AUTO_INCREMENT,
  `alb_name` VARCHAR(40) DEFAULT NULL,
  `alb_type` VARCHAR(30) DEFAULT NULL,
  `art_id` INT DEFAULT NULL,
  PRIMARY KEY (`alb_id`),
  KEY `art_id` (`art_id`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`art_id`) REFERENCES `artist` (`art_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `album` */

INSERT  INTO `album`(`alb_id`,`alb_name`,`alb_type`,`art_id`) VALUES 
(1,'Alas Ke Pedh','Indie Rock/Indian Folk',1),
(2,'Vaaqif','Alternative Indie/Folk',1),
(3,'Shehron Ke Raaz','Alternative/Indie/Country',3),
(4,'Izafa','Indie Pop',2),
(5,'Marz','Indie/Pop',2),
(6,'When We Feel Young','Indian Indie/Pop',4),
(7,'Believe','Indie Pop',4);

/*Table structure for table `artist` */

DROP TABLE IF EXISTS `artist`;

CREATE TABLE `artist` (
  `art_id` INT NOT NULL AUTO_INCREMENT,
  `art_name` VARCHAR(30) DEFAULT NULL,
  `location` VARCHAR(60) DEFAULT NULL,
  `stage_name` VARCHAR(20) DEFAULT NULL,
  `agent_id` INT DEFAULT NULL,
  PRIMARY KEY (`art_id`),
  KEY `agent_id` (`agent_id`),
  CONSTRAINT `artist_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `artist` */

INSERT  INTO `artist`(`art_id`,`art_name`,`location`,`stage_name`,`agent_id`) VALUES 
(1,'The Local Train','Chandigarh','Local Train',1),
(2,'The Yellow Diary','Mumbai','Yellow Diary',4),
(3,'Prateek Kuhad','Jaipur','Prateek Kuhad',3),
(4,'When Chai Met Toast','Kochi','Chai Met Toast',2);

/*Table structure for table `track` */

DROP TABLE IF EXISTS `track`;

CREATE TABLE `track` (
  `track_id` INT NOT NULL AUTO_INCREMENT,
  `track_name` VARCHAR(40) DEFAULT NULL,
  `genre` VARCHAR(25) DEFAULT NULL,
  `alb_id` INT DEFAULT NULL,
  `art_id` INT DEFAULT NULL,
  PRIMARY KEY (`track_id`),
  KEY `alb_id` (`alb_id`),
  KEY `art_id` (`art_id`),
  CONSTRAINT `track_ibfk_1` FOREIGN KEY (`alb_id`) REFERENCES `album` (`alb_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `track_ibfk_2` FOREIGN KEY (`art_id`) REFERENCES `artist` (`art_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `track` */

INSERT  INTO `track`(`track_id`,`track_name`,`genre`,`alb_id`,`art_id`) VALUES 
(1,'Dil Mere','Indie Rock/Indian Folk',1,1),
(2,'Choo Lo','Indie Rock/Indian Folk',1,1),
(3,'Yeh Zindagi Hai','Indie Rock/Indian Folk',1,1),
(4,'Aaftaab','Alternative Indie/Folk',2,1),
(5,'Mere Yaar','Alternative Indie/Folk',2,1),
(6,'Tere Hi Hum','Alternative/Indie/Country',3,3),
(7,'Kasoor','Alternative/Indie/Country',3,3),
(8,'Dheere Se','Indie Pop',4,2),
(9,'Tere Jeya Hor Disda','Indie Pop',4,2),
(10,'Marz','Indie/Pop',5,2),
(11,'Afzai','Indie/Pop',5,2),
(12,'Ocean Tide','Indian Indie/Pop',6,4),
(13,'Remember','Indian Indie/Pop',6,4),
(14,'When We Feel Young','Indian Indie/Pop',6,4),
(15,'Khoj (Passing By)','Indie Pop',7,4),
(16,'Forever','Indie Pop',7,4);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_fullname` VARCHAR(60) DEFAULT NULL,
  `user_email` VARCHAR(60) DEFAULT NULL,
  `username` VARCHAR(30) DEFAULT NULL,
  `password` VARCHAR(45) DEFAULT NULL,
  `genre` VARCHAR(60) DEFAULT NULL,
  `track_id` INT DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_ibfk_1` (`track_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

INSERT  INTO `user`(`user_id`,`user_fullname`,`user_email`,`username`,`password`,`genre`,`track_id`) VALUES 
(1,'Dushyant Betala','dushyantbetala2611@gmail.com','db1624','Db1624bt','Folk/Alternative',1),
(2,'Shubham Gore','shubhamgore@gmail.com','sg6969','Sg6969gt','Indie Rock/Pop',12),
(3,'Yuvraj Chibber','yuvrajchibber@gmail.com','yc2001','Yc2001gt','Indie Pop',9),
(4,'Shaswat Srivastava','shasshrivastava@gmail.com','ss4200','Ss4200gt','Country/Pop',6),
(5,'Rakesh Venkat','venkatrakesh@gmail.com','rv2204','Rv2204bt','Alternative Indie',15);

/*Table structure for table `user_playlist` */

DROP TABLE IF EXISTS `user_playlist`;

CREATE TABLE `user_playlist` (
  `playlist_id` INT NOT NULL AUTO_INCREMENT,
  `shared_with` VARCHAR(120) DEFAULT NULL,
  `track_id` INT DEFAULT NULL,
  `user_id` INT DEFAULT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `track_id` (`track_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_playlist_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_playlist_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user_playlist` */

INSERT  INTO `user_playlist`(`playlist_id`,`shared_with`,`track_id`,`user_id`) VALUES 
(1,'Dibyesh',10,5),
(2,'Katti',14,4);

/* ALTER TABLE Querries */
ALTER TABLE artist
ADD followers INT;

ALTER TABLE track
DROP COLUMN genre;