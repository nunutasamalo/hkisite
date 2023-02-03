/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.8.3-MariaDB : Database - hkidb
***********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hkidb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hkidb`;

/*Table structure for table `contribution_types` */

DROP TABLE IF EXISTS `contribution_types`;

CREATE TABLE `contribution_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `contribution_types` */

insert  into `contribution_types`(`id`,`name`) values
(1,'offering'),
(2,'donation');

/*Table structure for table `contributions` */

DROP TABLE IF EXISTS `contributions`;

CREATE TABLE `contributions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `contribution_date` date DEFAULT NULL,
  `contribution_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `contribution_id` (`contribution_id`),
  CONSTRAINT `contributions_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `ms_members` (`id`),
  CONSTRAINT `contributions_ibfk_2` FOREIGN KEY (`contribution_id`) REFERENCES `contribution_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `contributions` */

insert  into `contributions`(`id`,`member_id`,`amount`,`contribution_date`,`contribution_id`) values
(1,4,500000,'2023-01-01',1);

/*Table structure for table `daily_devotions` */

DROP TABLE IF EXISTS `daily_devotions`;

CREATE TABLE `daily_devotions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `morning_verse` varchar(255) NOT NULL,
  `afternoon_verse` varchar(255) NOT NULL,
  `evening_verse` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `daily_devotions` */

/*Table structure for table `family` */

DROP TABLE IF EXISTS `family`;

CREATE TABLE `family` (
  `FamilyID` int(11) NOT NULL AUTO_INCREMENT,
  `FamilyName` varchar(100) NOT NULL,
  `Nik` varchar(100) NOT NULL,
  PRIMARY KEY (`FamilyID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `family` */

insert  into `family`(`FamilyID`,`FamilyName`,`Nik`) values
(1,'Bp.Joseph Manalu','123456789'),
(2,'Bp.Fery Simamora','987654321');

/*Table structure for table `family_ori` */

DROP TABLE IF EXISTS `family_ori`;

CREATE TABLE `family_ori` (
  `FamilyID` int(11) NOT NULL AUTO_INCREMENT,
  `FamilyName` varchar(100) NOT NULL,
  `NIK` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FamilyID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `family_ori` */

insert  into `family_ori`(`FamilyID`,`FamilyName`,`NIK`) values
(1,'Pa Joseph Manalu','123456789');

/*Table structure for table `members` */

DROP TABLE IF EXISTS `members`;

CREATE TABLE `members` (
  `MemberID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `FamilyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`MemberID`),
  KEY `FamilyID` (`FamilyID`),
  CONSTRAINT `members_ibfk_1` FOREIGN KEY (`FamilyID`) REFERENCES `family` (`FamilyID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `members` */

insert  into `members`(`MemberID`,`FirstName`,`LastName`,`FamilyID`) values
(1,'Jairo','Manalu',1),
(2,'Gonti','Manalu',2);

/*Table structure for table `members_ori` */

DROP TABLE IF EXISTS `members_ori`;

CREATE TABLE `members_ori` (
  `MemberID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  `DateOfMembership` date DEFAULT NULL,
  `FamilyID` int(11) DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  `HubunganKeluarga` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MemberID`),
  KEY `FamilyID` (`FamilyID`),
  CONSTRAINT `members_ori_ibfk_1` FOREIGN KEY (`FamilyID`) REFERENCES `family_ori` (`FamilyID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `members_ori` */

insert  into `members_ori`(`MemberID`,`FirstName`,`LastName`,`Email`,`PhoneNumber`,`Address`,`City`,`State`,`ZipCode`,`DateOfMembership`,`FamilyID`,`Notes`,`HubunganKeluarga`) values
(1,'Jairo Budimantua','Manalu','jairo Manalu','08119942582 ','Tomang','Cibinong','Jawa Barat','18144','2023-01-01',1,NULL,NULL);

/*Table structure for table `ms_districs` */

DROP TABLE IF EXISTS `ms_districs`;

CREATE TABLE `ms_districs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `ms_districs` */

insert  into `ms_districs`(`id`,`name`,`description`) values
(1,'I','Kranji, Bintara'),
(2,'II','Cibinong, Cilengsi');

/*Table structure for table `ms_groups` */

DROP TABLE IF EXISTS `ms_groups`;

CREATE TABLE `ms_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `decription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `ms_groups` */

insert  into `ms_groups`(`id`,`name`,`decription`) values
(1,'Marturia',NULL),
(2,'Diakonia',NULL),
(3,'Koinonia',NULL),
(4,'Pembangunan',NULL),
(5,'Litbang',NULL),
(6,'Keuangan',NULL),
(7,'Umum',NULL);

/*Table structure for table `ms_liturgy` */

DROP TABLE IF EXISTS `ms_liturgy`;

CREATE TABLE `ms_liturgy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `liturgy_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `ms_liturgy` */

insert  into `ms_liturgy`(`id`,`liturgy_name`) values
(1,'Votum'),
(2,'Bernyanyi'),
(3,'Hukum Taurat'),
(4,'Epistel'),
(5,'Koor'),
(6,'Kolekte 1$2'),
(7,'Kotbah'),
(8,'Penutup'),
(9,'Kolekte 3&4'),
(10,'Kosong');

/*Table structure for table `ms_members` */

DROP TABLE IF EXISTS `ms_members`;

CREATE TABLE `ms_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` enum('female','male') DEFAULT NULL,
  `baptism_date` date NOT NULL,
  `confirmation_date` date NOT NULL,
  `member_status` enum('active','inactive') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `ms_members` */

insert  into `ms_members`(`id`,`first_name`,`last_name`,`email`,`phone`,`address`,`city`,`state`,`zipcode`,`birthdate`,`gender`,`baptism_date`,`confirmation_date`,`member_status`) values
(1,'Berton','Sialaban','berton@gamil.com','08119942582','Jl.Permata No 11 Blok A2','Pulo Mas','Jakarta Timur','1144','1969-01-01','male','1969-06-11','1970-01-01','active'),
(2,'Reynold','Manalu','reynold@gmail.comq','08119942222','Jl. Katiak Sari No 12','Cibinong ','Jawa Barat','1122','0000-00-00',NULL,'0000-00-00','0000-00-00',NULL),
(3,'Arnol','Manurung','arnold@gamil.com','01777777777','Jl. Kramat','Bogor','Jawa Barat ','11111','0000-00-00',NULL,'0000-00-00','0000-00-00',NULL),
(4,'Samuel','Sialalahi','samuel@gamil.com','01111111111','Jl.Citatah','Bogor','Jakarta Barat','11111','0000-00-00',NULL,'0000-00-00','0000-00-00',NULL),
(5,'Eldwin ','Sinurat','siburian@gamail.com','14444444444','Jl.Mandiri','Bogor','Jakarta Timur','11111','0000-00-00',NULL,'0000-00-00','0000-00-00',NULL),
(6,'Michael','Simamora','michael@gami.com','11111111111','Jl.Macet','Jakarta Timur','Jakarta Timur','22222','0000-00-00',NULL,'0000-00-00','0000-00-00',NULL),
(7,'Jeni','Sinaga','jeni@sinaga.com','11111111111','Jl.Kelatoon','Jakarta Barat','Jakarta','22222','0000-00-00',NULL,'0000-00-00','0000-00-00',NULL);

/*Table structure for table `ms_news` */

DROP TABLE IF EXISTS `ms_news`;

CREATE TABLE `ms_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `ms_news` */

insert  into `ms_news`(`id`,`name`) values
(1,'Marturia'),
(2,'Diakonia'),
(3,'Koinonia'),
(4,'Pembangunan'),
(5,'Litbang'),
(6,'Webinar'),
(7,'Pembinaan Warga Gereja'),
(8,'Gerakan Sepuluh Ribu');

/*Table structure for table `ms_roles` */

DROP TABLE IF EXISTS `ms_roles`;

CREATE TABLE `ms_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `ms_roles` */

insert  into `ms_roles`(`id`,`name`) values
(1,'Pengkotbah'),
(2,'Liturgist'),
(3,'Doa Syafaat'),
(4,'Persembahan'),
(5,'Penerima Jemaat'),
(6,'Pemusik'),
(7,'Pemimpin Pujian'),
(8,'Ketertiban'),
(9,'Keybord'),
(10,'Gitar'),
(11,'Bass'),
(12,'Drum'),
(14,'Pemandu Lagu'),
(15,'MC'),
(16,'Guru kelas Kecil'),
(17,'Gur kelas Sedang'),
(18,'Guru kelas Besar'),
(19,'Guru Muda Mudi');

/*Table structure for table `ms_service_type` */

DROP TABLE IF EXISTS `ms_service_type`;

CREATE TABLE `ms_service_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `ms_service_type` */

insert  into `ms_service_type`(`id`,`name`,`time`) values
(4,'Ibadah Pagi','07:00:00'),
(5,'Ibadah Siang','09:00:00'),
(6,'Ibadah Sore','17:00:00'),
(7,'Ibadah Sekolah Minggu','09:00:00'),
(8,'Conseling Pastoral','00:00:00');

/*Table structure for table `ms_thema` */

DROP TABLE IF EXISTS `ms_thema`;

CREATE TABLE `ms_thema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `service_date` date DEFAULT NULL,
  `sunday_school_thema` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `ms_thema` */

insert  into `ms_thema`(`id`,`name`,`description`,`service_date`,`sunday_school_thema`) values
(1,'Ephiphanias ','Penampakan Allah/ Allah menjadi Manusia (Hapapatar)','2023-01-22','Berdamai'),
(2,'Septuagesima','Artinya tujuh puluh hari sebelum Paskah atau Kebangkitan Yesus Kristus. Pitu pulu ari dijolo ni ari Haheheon ni Tuhan Jesus Kristus.','2023-01-15','Bersukacita'),
(3,'Sexagesima','Artinya enam puluh hari sebelum Paskah atau Kebangkitan Yesus Kristus. Onom pulu ari dijolo ni ari Haheheon ni Tuhan Jesus Kristus.',NULL,'Bersorak sorai '),
(4,'Estomihi ','Tuhanlah gunung batu dan kubu pertahananku (Sai Ho ma gabe Partanobatoan di ahu)',NULL,NULL),
(5,'Invocavit ',' Berserulah kepadaKu (Jouon na ma Ahu)',NULL,NULL),
(6,'Reminiscere ','Ingatlah segala rahmat dan kasih setiaMu, ya TUHAN (Sai  ingot  ma ale Jahowa denggan ni basaM)',NULL,NULL),
(7,'Okuli ','Mataku tetap terarah kepada TUHAN (Sai tong  mangaranapi matangku tu Jahowa)',NULL,NULL),
(8,'Letare ','Bersukacitalah dan bersoraklah (Marlas ni roha ma hamu)',NULL,NULL),
(9,'Judika','Berilah keadilan kepadaku (Luluhon ahu ale Jahowa)',NULL,NULL),
(10,'Palmarum ','Pesta Palma (Maremare)',NULL,NULL),
(11,'Quasimodogeniti ','Seperti bayi yang baru lahir (Songon posoposo naimbaru tubu)',NULL,NULL),
(12,'Micericordias Domini','Nyanyikanlah kasih setia TUHAN (Sai endehon ma angka asi ni roha ni Jahowa)',NULL,NULL),
(13,'Jubilate ','Bersorak-sorailah bagi Allah hai seluruh bumi (Marolopolop tu Debata ma sandok tano on)',NULL,NULL),
(14,'Kantate ','Nyanyikanlah  nyanyian baru bagi TUHAN (Endehon hamu ma ende naimbaru di Jahowa)',NULL,NULL),
(15,'Rogate ','Lat. rogate artinya meminta – Berdoa/ Martangiang (lih. Matius 7:7-8).',NULL,NULL),
(16,'Exaudi ',' Lat. Exaudi, Domine, vocem meam, qua clamavi ad te artinya dengarlah, Tuhan, seruan yang kusampaikan/ sai tangihon ma soarangku, ale Jahowa, molo joujou ahu (lih. Mazmur 27:7a).',NULL,NULL),
(17,'Trinitatis','Ketritunggalan Allah (Hasitolusadaon ni TUHAN)',NULL,NULL),
(18,'Advent ','Penantian kedatangan Kristus (Haroro (panomunomuon) ni Sipalua i)',NULL,NULL),
(19,'Natal ','Kelahiran Juruselamat (Hatutubu ni Sipalua)',NULL,NULL),
(20,'Tahun Baru ','Beribadah pada Tahun baru',NULL,NULL);

/*Table structure for table `tb_attendees` */

DROP TABLE IF EXISTS `tb_attendees`;

CREATE TABLE `tb_attendees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `member_id` (`member_id`),
  KEY `tb_attendees_ibfk_1` (`service_id`),
  CONSTRAINT `tb_attendees_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `tb_services` (`id`),
  CONSTRAINT `tb_attendees_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `ms_roles` (`id`),
  CONSTRAINT `tb_attendees_ibfk_3` FOREIGN KEY (`member_id`) REFERENCES `ms_members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `tb_attendees` */

insert  into `tb_attendees`(`id`,`service_id`,`role_id`,`member_id`) values
(20,9,1,1),
(21,9,2,2),
(22,9,3,3),
(23,9,4,4),
(24,9,5,5),
(25,9,6,6),
(26,9,7,7);

/*Table structure for table `tb_liturgy_detail` */

DROP TABLE IF EXISTS `tb_liturgy_detail`;

CREATE TABLE `tb_liturgy_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `liturgy_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `liturgy_value` varchar(255) DEFAULT NULL,
  `urutan` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `liturgy_id` (`liturgy_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `tb_liturgy_detail_ibfk_1` FOREIGN KEY (`liturgy_id`) REFERENCES `ms_liturgy` (`id`),
  CONSTRAINT `tb_liturgy_detail_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `tb_services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `tb_liturgy_detail` */

/*Table structure for table `tb_member_districs` */

DROP TABLE IF EXISTS `tb_member_districs`;

CREATE TABLE `tb_member_districs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `distric_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `distric_id` (`distric_id`),
  CONSTRAINT `tb_member_districs_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `ms_members` (`id`),
  CONSTRAINT `tb_member_districs_ibfk_2` FOREIGN KEY (`distric_id`) REFERENCES `ms_districs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tb_member_districs` */

insert  into `tb_member_districs`(`id`,`member_id`,`distric_id`) values
(1,1,1);

/*Table structure for table `tb_member_groups` */

DROP TABLE IF EXISTS `tb_member_groups`;

CREATE TABLE `tb_member_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `tb_member_groups_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `ms_members` (`id`),
  CONSTRAINT `tb_member_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `ms_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tb_member_groups` */

insert  into `tb_member_groups`(`id`,`member_id`,`group_id`) values
(1,3,2);

/*Table structure for table `tb_news_details` */

DROP TABLE IF EXISTS `tb_news_details`;

CREATE TABLE `tb_news_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `news_value` text NOT NULL,
  `service_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`),
  CONSTRAINT `tb_news_details_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `ms_news` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tb_news_details` */

insert  into `tb_news_details`(`id`,`news_id`,`news_value`,`service_date`) values
(1,1,'1.Sermon Resort.\r\nSermon Resort akan dilaksanakan setiap hari kamis mulai pukul\r\n2.Yang akan menyampaikan Firman Tuhan\r\n3.Mari kita bawa dalam Doa anak- anak\r\n4.Hari Minggu, 22 Mei 2023','2023-01-22'),
(2,2,'1.Berita Duka Cita\r\nTelah meninggal dunia ibu\r\n2. Hari ini kita akan mengumpulkan persembahan\r\n3. Kepada jemaat\r\n','2023-01-22');

/*Table structure for table `tb_services` */

DROP TABLE IF EXISTS `tb_services`;

CREATE TABLE `tb_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_type` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_type` (`service_type`),
  CONSTRAINT `tb_services_ibfk_1` FOREIGN KEY (`service_type`) REFERENCES `ms_service_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `tb_services` */

insert  into `tb_services`(`id`,`service_type`,`date`) values
(9,4,'2023-01-01'),
(10,5,'2023-01-01'),
(11,6,NULL),
(12,8,'2023-01-31');

/* Procedure structure for procedure `tata_ibadah` */

/*!50003 DROP PROCEDURE IF EXISTS  `tata_ibadah` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `tata_ibadah`()
BEGIN
SELECT
  r.`NAME`, m.`first_name`, m.`last_name`
FROM
  ms_roles r
  INNER JOIN `tb_attendees` a
    ON a.`role_id` = r.`id`
  INNER JOIN ms_members m
    ON a.`role_id` = m.`id`
WHERE a.`service_id` ="1";
	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
