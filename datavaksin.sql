/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 10.4.24-MariaDB : Database - datavaksin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`datavaksin` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `datavaksin`;

/*Table structure for table `antrian` */

DROP TABLE IF EXISTS `antrian`;

CREATE TABLE `antrian` (
  `id_vaksin` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_vaksin` varchar(11) NOT NULL,
  PRIMARY KEY (`id_vaksin`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `antrian` */

insert  into `antrian`(`id_vaksin`,`jenis_vaksin`) values 
(1,'Moderna'),
(2,'Sinovac'),
(3,'AstraZeneca'),
(4,'Sinopharm'),
(5,'Pfizer'),
(6,'Sputnik V'),
(7,'Janssen'),
(8,'Convidecia'),
(9,'Covovax'),
(10,'Zivivax');

/*Table structure for table `data_pasien` */

DROP TABLE IF EXISTS `data_pasien`;

CREATE TABLE `data_pasien` (
  `nik` varchar(200) NOT NULL,
  `id_vaksin` int(11) NOT NULL,
  `id_vaksinke` int(11) NOT NULL,
  `tanggal_vaksin` date NOT NULL,
  `id_pekerjaan` int(11) NOT NULL,
  `id_domisili` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `id_kelamin` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `tanggal_lahir` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `foto` varchar(200) NOT NULL,
  PRIMARY KEY (`nik`),
  KEY `antrian` (`id_vaksin`),
  KEY `pekerjaan` (`id_pekerjaan`),
  KEY `tempat_vaksin` (`id_domisili`),
  KEY `kelamin` (`id_kelamin`),
  KEY `status` (`id_status`),
  KEY `vaksinke` (`id_vaksinke`),
  CONSTRAINT `antrian` FOREIGN KEY (`id_vaksin`) REFERENCES `antrian` (`id_vaksin`),
  CONSTRAINT `kelamin` FOREIGN KEY (`id_kelamin`) REFERENCES `kelamin` (`id_kelamin`),
  CONSTRAINT `pekerjaan` FOREIGN KEY (`id_pekerjaan`) REFERENCES `pekerjaan` (`id_pekerjaan`),
  CONSTRAINT `status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `tempat_vaksin` FOREIGN KEY (`id_domisili`) REFERENCES `tempat_vaksin` (`id_domisili`),
  CONSTRAINT `vaksinke` FOREIGN KEY (`id_vaksinke`) REFERENCES `vaksinke` (`id_vaksinke`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `data_pasien` */

insert  into `data_pasien`(`nik`,`id_vaksin`,`id_vaksinke`,`tanggal_vaksin`,`id_pekerjaan`,`id_domisili`,`nama`,`id_kelamin`,`id_status`,`tanggal_lahir`,`alamat`,`foto`) values 
('202010370311009',1,2,'2022-07-05',3,1,'Aditya Fathurrahman',1,4,'Kalbar, 1 April 2001','JL.PARIT PANGERAN GANG KETO SIANTAN','DSC_8279 copy.jpg');

/*Table structure for table `kelamin` */

DROP TABLE IF EXISTS `kelamin`;

CREATE TABLE `kelamin` (
  `id_kelamin` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_kelamin` varchar(20) NOT NULL,
  PRIMARY KEY (`id_kelamin`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `kelamin` */

insert  into `kelamin`(`id_kelamin`,`jenis_kelamin`) values 
(1,'Laki - laki'),
(2,'Perempuan');

/*Table structure for table `pekerjaan` */

DROP TABLE IF EXISTS `pekerjaan`;

CREATE TABLE `pekerjaan` (
  `id_pekerjaan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pekerjaan` varchar(20) NOT NULL,
  PRIMARY KEY (`id_pekerjaan`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `pekerjaan` */

insert  into `pekerjaan`(`id_pekerjaan`,`nama_pekerjaan`) values 
(1,'PNS'),
(2,'Buruh'),
(3,'Pelajar'),
(4,'Swasta'),
(5,'Tidak Bekerja');

/*Table structure for table `status` */

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `status` */

insert  into `status`(`id_status`,`status`) values 
(3,'Belum Kawin'),
(4,'Sudah Kawin');

/*Table structure for table `tempat_vaksin` */

DROP TABLE IF EXISTS `tempat_vaksin`;

CREATE TABLE `tempat_vaksin` (
  `id_domisili` int(11) NOT NULL AUTO_INCREMENT,
  `domisili` varchar(11) NOT NULL,
  PRIMARY KEY (`id_domisili`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tempat_vaksin` */

insert  into `tempat_vaksin`(`id_domisili`,`domisili`) values 
(1,'Malang'),
(2,'Banjarmasin');

/*Table structure for table `vaksinke` */

DROP TABLE IF EXISTS `vaksinke`;

CREATE TABLE `vaksinke` (
  `id_vaksinke` int(11) NOT NULL AUTO_INCREMENT,
  `vaksinke` varchar(20) NOT NULL,
  PRIMARY KEY (`id_vaksinke`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `vaksinke` */

insert  into `vaksinke`(`id_vaksinke`,`vaksinke`) values 
(1,'Pertama'),
(2,'Kedua'),
(3,'Ketiga');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
