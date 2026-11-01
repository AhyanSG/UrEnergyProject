CREATE DATABASE  IF NOT EXISTS `urenergy` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `urenergy`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: urenergy
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `lamaran`
--

DROP TABLE IF EXISTS `lamaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lamaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_lowongan` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `link_cv` varchar(255) DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_lowongan` (`id_lowongan`),
  CONSTRAINT `lamaran_ibfk_1` FOREIGN KEY (`id_lowongan`) REFERENCES `lowongan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lamaran`
--

LOCK TABLES `lamaran` WRITE;
/*!40000 ALTER TABLE `lamaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `lamaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lowongan`
--

DROP TABLE IF EXISTS `lowongan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lowongan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) NOT NULL,
  `divisi` varchar(50) DEFAULT NULL,
  `lokasi` varchar(50) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `persyaratan` text DEFAULT NULL,
  `status` enum('buka','penuh') DEFAULT 'buka',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lowongan`
--

LOCK TABLES `lowongan` WRITE;
/*!40000 ALTER TABLE `lowongan` DISABLE KEYS */;
INSERT INTO `lowongan` VALUES (1,'Insinyur Produksi Migas','Hulu','Balikpapan, Kalimantan Timur','Memantau dan mengoptimalkan produksi minyak dan gas di lapangan.','Minimal S1 Teknik Perminyakan, Kimia, atau Mesin\nIPK minimal 3.00\nPengalaman di industri migas menjadi nilai plus\nBersedia ditempatkan di area operasi lapangan\nMemahami standar K3 dan keselamatan kerja','buka'),(2,'Geologis Eksplorasi','Hulu','Cepu, Jawa Tengah','Menganalisis data seismik dan batuan untuk menentukan titik pengeboran baru.','Minimal S1 Teknik Geologi atau Geofisika\nIPK minimal 3.00\nMampu menganalisis data seismik dan log sumur\nMenguasai software pemetaan geologi\nBersedia melakukan survei lapangan','penuh'),(3,'Operator Kilang','Hilir','Cilacap, Jawa Tengah','Mengoperasikan dan mengawasi unit pengolahan minyak mentah di kilang.','Lulusan D3 atau S1 Teknik Kimia\nIPK minimal 2.75\nBersedia bekerja dengan sistem shift\nSehat jasmani dan rohani\nTeliti dan disiplin terhadap prosedur keselamatan','penuh'),(4,'Staf Distribusi dan Logistik BBM','Hilir','Surabaya, Jawa Timur','Mengatur jadwal pengiriman BBM dan gas ke SPBU dan depot.','Minimal S1 Teknik Industri atau Manajemen Logistik\nIPK minimal 3.00\nMemahami perencanaan rute dan jadwal pengiriman\nMenguasai Microsoft Excel\nMampu bekerja di bawah tekanan target waktu','buka'),(5,'Engineer Pembangkit Surya','Energi Baru Terbarukan','Kupang, NTT','Merancang dan merawat PLTS di wilayah 3T.','Minimal S1 Teknik Elektro atau Teknik Energi\nIPK minimal 3.00\nMemahami sistem fotovoltaik dan inverter\nBersedia ditempatkan di wilayah 3T\nMampu membaca gambar teknik dan single line diagram','buka'),(6,'Peneliti Bioenergi','Riset & Inovasi','Jakarta','Meneliti pengembangan biofuel dan hidrogen hijau bersama kampus mitra.','Minimal S2 Teknik Kimia atau Teknik Energi\nMemiliki publikasi ilmiah\nPengalaman riset biofuel atau hidrogen hijau\nMampu menulis laporan dan jurnal berbahasa Inggris\nBersedia bekerja sama dengan tim peneliti kampus','penuh'),(7,'Spesialis HSE (Keselamatan dan Lingkungan)','Keberlanjutan','Jakarta','Memastikan operasi perusahaan memenuhi standar K3 dan aturan lingkungan.','Minimal S1 K3 atau Teknik Lingkungan\nIPK minimal 3.00\nMemahami regulasi K3 dan lingkungan hidup\nSertifikasi Ahli K3 menjadi nilai plus\nBersedia melakukan inspeksi ke lokasi operasi','buka'),(8,'Web Developer','Teknologi Informasi','Jakarta','Mengembangkan dan merawat portal digital perusahaan.','Minimal S1 Informatika atau Sistem Informasi\nMenguasai HTML, CSS, dan JavaScript\nMenguasai PHP dan MySQL\nMemahami Git dan GitHub\nMemiliki portofolio proyek web','buka');
/*!40000 ALTER TABLE `lowongan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-01 22:51:58
