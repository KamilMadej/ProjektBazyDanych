-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: projekt_wypożyczalnia_samochodów
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `adres`
--

DROP TABLE IF EXISTS `adres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `miejscowość` varchar(25) NOT NULL,
  `kod_pocztowy` varchar(10) NOT NULL,
  `ulica` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adres`
--

LOCK TABLES `adres` WRITE;
/*!40000 ALTER TABLE `adres` DISABLE KEYS */;
INSERT INTO `adres` VALUES (99,'Groble','37-430','Nowa'),(100,'Lwów','45-234','Sosnowa'),(101,'Barszów','23-556','Kwiatowa'),(102,'Babin','12-235','Polna'),(103,'Nowa Wieś','32-435','Mickiewicza'),(104,'Kraków','13-123','Sosnowa'),(105,'Bory','35-425','Biesak'),(106,'Jeżowe','37-430','Lipowa'),(107,'Abisynia','34-546','Mazowiecka'),(108,'Adamczowice','37-432','Tłomackie'),(109,'Adamowo','55-532','Teatralny'),(110,'Kraśnik','43-123','Defilad'),(111,'Warszawa','34-942','Próżna'),(112,'Kraków','22-205','Zielona'),(113,'Szczecin','00-032','Mariańska'),(114,'Wrocław','12-234','Dzika'),(115,'Stalowa Wola','11-111','Błońska'),(116,'Nisko','19-197','Rybaki'),(117,'Katowice','34-543','Sosnowa'),(118,'Jata','34-466','Długa'),(119,'Zarzecze','45-435','Palmowa'),(120,'Chojnice','12-654','Kolejowa'),(121,'Sibigi','37-572','Dębowa');
/*!40000 ALTER TABLE `adres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cennik`
--

DROP TABLE IF EXISTS `cennik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cennik` (
  `id` int NOT NULL AUTO_INCREMENT,
  `segment_auta_id` int NOT NULL,
  `cena_za_dobe` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cennik_segment_auta_idx` (`segment_auta_id`),
  CONSTRAINT `fk_cennik_segment_auta` FOREIGN KEY (`segment_auta_id`) REFERENCES `segment_auta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cennik`
--

LOCK TABLES `cennik` WRITE;
/*!40000 ALTER TABLE `cennik` DISABLE KEYS */;
INSERT INTO `cennik` VALUES (1,1,100),(2,2,150),(3,3,200),(4,4,250),(5,5,300),(6,6,350),(7,7,400),(8,8,450),(9,9,500),(10,10,600);
/*!40000 ALTER TABLE `cennik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dostępność`
--

DROP TABLE IF EXISTS `dostępność`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dostępność` (
  `id` int NOT NULL,
  `Opis` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dostępność`
--

LOCK TABLES `dostępność` WRITE;
/*!40000 ALTER TABLE `dostępność` DISABLE KEYS */;
INSERT INTO `dostępność` VALUES (1,'Dostępny'),(2,'Niedostępny');
/*!40000 ALTER TABLE `dostępność` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klient`
--

DROP TABLE IF EXISTS `klient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prawo_jazdy` varchar(15) NOT NULL,
  `adres_id` int NOT NULL,
  `osoba_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_klient_osoba_idx` (`id`,`osoba_id`),
  KEY `fk_klient_osoba_idx1` (`osoba_id`),
  KEY `fk_klient_adres_idx` (`adres_id`),
  CONSTRAINT `fk_klient_adres` FOREIGN KEY (`adres_id`) REFERENCES `adres` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_klient_osoba` FOREIGN KEY (`osoba_id`) REFERENCES `osoba` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klient`
--

LOCK TABLES `klient` WRITE;
/*!40000 ALTER TABLE `klient` DISABLE KEYS */;
INSERT INTO `klient` VALUES (10,'Posiada',99,19),(11,'Posiada',101,21),(12,'Posiada',102,22),(13,'Posiada',103,23),(14,'Posiada',104,24),(15,'Posiada',105,25),(16,'Posiada',106,26),(17,'Posiada',107,27),(18,'Posiada',108,28),(19,'Posiada',109,29),(20,'Posiada',110,30),(21,'Posiada',111,31),(22,'Posiada',112,32),(23,'Posiada',113,33),(24,'Posiada',114,34),(25,'Posiada',115,35),(26,'Posiada',116,36),(27,'Posiada',117,37),(28,'Posiada',119,39),(29,'Posiada',121,41);
/*!40000 ALTER TABLE `klient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marka`
--

DROP TABLE IF EXISTS `marka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marka` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marka`
--

LOCK TABLES `marka` WRITE;
/*!40000 ALTER TABLE `marka` DISABLE KEYS */;
INSERT INTO `marka` VALUES (1,'Opel'),(2,'Ford'),(3,'Fiat'),(4,'Audi'),(5,'BMW'),(6,'Toyota'),(7,'Mazda'),(8,'Jaguar'),(9,'Volvo'),(10,'Nissan'),(11,'Seat'),(12,'Subaru'),(13,'Dodge');
/*!40000 ALTER TABLE `marka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(20) NOT NULL,
  `marka_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_model_idx` (`marka_id`),
  KEY `fk_marka_idx` (`marka_id`),
  KEY `fk_Model_marka_idx` (`marka_id`),
  KEY `fk_Model_marka2_idx` (`marka_id`),
  CONSTRAINT `fk_model_marka` FOREIGN KEY (`marka_id`) REFERENCES `marka` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,'astra',1),(2,'Signum',1),(3,'Corsa',1),(4,'Insygnia',1),(5,'Zafira',1),(6,'Edge',2),(7,'Fiesta',2),(8,'Escape',2),(9,'Mondeo',2),(10,'Focus',2),(11,'Panda',3),(12,'500',3),(13,'Tipo',3),(14,'Bravo',3),(15,'126p',3),(16,'80',4),(17,'A3 8P',4),(18,'A4 B8 ',4),(19,'A6 B8',4),(20,'100',4),(21,'E30',5),(22,'E34',5),(23,'E39',5),(24,'E46',5),(25,'E60',5),(26,'Camry',6),(27,'Corolla',6),(28,'GT86',6),(29,'Highlander',6),(30,'Hilux',6),(31,'CX-3',7),(32,'CX-30',7),(33,'MX-30',7),(34,'CX-5',7),(35,'CX-8',7),(36,'6',7),(39,'Ibiza',11),(40,'Cordoba',11),(41,'A4B7',4),(42,'A4B8',4),(43,'Impreza',12),(44,'F20',5),(45,'Charger',13),(46,'Viper',13),(47,'RX8',7),(48,'Flex',2);
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osoba`
--

DROP TABLE IF EXISTS `osoba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `osoba` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imie` varchar(20) NOT NULL,
  `nazwisko` varchar(20) NOT NULL,
  `data_urodzenia` date NOT NULL,
  `pesel` varchar(11) NOT NULL,
  `nr_telefonu` varchar(10) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osoba`
--

LOCK TABLES `osoba` WRITE;
/*!40000 ALTER TABLE `osoba` DISABLE KEYS */;
INSERT INTO `osoba` VALUES (19,'Kamil','Madej','1997-12-19','97121912345','123456789','kamil@gmail.com'),(20,'Andrzej','Nowak','1967-04-12','67031212345','879653456','andrzejnowak@gmail.com'),(21,'Jan','Banasik','1988-11-11','88111156794','86758395','JanBanasik@gmail.com'),(22,'Marian','Włodarczyk','1943-06-17','43061756794','7694037','MarianWłodarczyk@gmail.com'),(23,'Kazimierz','Lupa','1978-05-27','78052756794','876859403','KazimierzLupa@gmail.com'),(24,'Edward','Nożyc','1988-08-19','88081956794','769483756','EdwardNożyc@gmail.com'),(25,'Rafał','Iwanicki','1988-04-13','88041376854','654548975','RafałIwanicki@gmail.com'),(26,'Adam','Zarzycki','1995-07-29','95072998675','876940276','AdamZarzycki@gmail.com'),(27,'Konrad','Jankowski','1967-09-13','67091368436','345671235','KonradJankowski@gmail.com'),(28,'Krystian','Chmielewski','1975-07-06','75070609275','866343414','KrystianChmielewski@gmail.com'),(29,'Hubert','Makowski','1987-12-29','87122968236','987875214','HubertMakowski@gmail.com'),(30,'Konstanty','Tomaszewski','1989-01-06','89010623461','123567478','KonstanTomaszewski@gmail.com'),(31,'Radosław','Krupa','1967-06-29','67062967361','864577890','RadosławKrupa@gmail.com'),(32,'Kewin','Lis','1971-08-14','71081498410','875020586','KewinLis@gmail.com'),(33,'Artur','Kaczmarczyk','1955-08-29','55082972345','555666777','ArturKaczmarczyk@gmail.com'),(34,'Dobromiła','Sadowska','1958-11-17','58111765738','988355067','DobromiłaSadowska@gmail.com'),(35,'Amadeusz','Pawlak','1997-07-02','97070223856','609300165','AmadeuszPawlak@gmail.com'),(36,'Denis','Gajewski','2000-01-27','00012775923','568505436','DenisGajewski@gmail.com'),(37,'Aleksander','Stańko','1999-10-10','99101067584','867496846','AleksanderStańko@gmail.com'),(38,'Damian','Kuraś','1989-01-12','89011276854','765493867','DamianKuraś@gmail.com'),(39,'Oleksy','Kusiak','1956-10-29','56102987541','765937623','OleksyKusiak@gmail.com'),(40,'Edward','Chojnicki','1990-05-09','90050967584','567843978','EdwardChojnicki@gmail.com'),(41,'Waldemar','Perlak','1968-02-01','68020187554','456129867','WaldemarPerlak@gmail.com');
/*!40000 ALTER TABLE `osoba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pracownik`
--

DROP TABLE IF EXISTS `pracownik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pracownik` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stanowisko` varchar(25) NOT NULL,
  `pensja` int NOT NULL,
  `adres` int NOT NULL,
  `osoba` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_pracownik_osoba_idx` (`osoba`),
  KEY `fk_pracownik_adres_idx` (`adres`),
  CONSTRAINT `fk_pracownik_adres` FOREIGN KEY (`adres`) REFERENCES `adres` (`id`),
  CONSTRAINT `fk_pracownik_osoba` FOREIGN KEY (`osoba`) REFERENCES `osoba` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pracownik`
--

LOCK TABLES `pracownik` WRITE;
/*!40000 ALTER TABLE `pracownik` DISABLE KEYS */;
INSERT INTO `pracownik` VALUES (2,'Sprzedawca',5000,100,20),(3,'Sprzedawca',4000,118,38),(4,'Sprzedawca',2900,120,40);
/*!40000 ALTER TABLE `pracownik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `płatność`
--

DROP TABLE IF EXISTS `płatność`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `płatność` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wypożyczenia` int NOT NULL,
  `klient` int NOT NULL,
  `cennik` int NOT NULL,
  `cena` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_płatność_klient_idx` (`klient`),
  KEY `fk_płatność_cennik_idx` (`cennik`),
  KEY `fk_płatność_wypożyczenia_idx` (`wypożyczenia`),
  CONSTRAINT `fk_płatność_cennik` FOREIGN KEY (`cennik`) REFERENCES `cennik` (`id`),
  CONSTRAINT `fk_płatność_klient` FOREIGN KEY (`klient`) REFERENCES `klient` (`id`),
  CONSTRAINT `fk_płatność_wypożyczenia` FOREIGN KEY (`wypożyczenia`) REFERENCES `wypożyczenia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `płatność`
--

LOCK TABLES `płatność` WRITE;
/*!40000 ALTER TABLE `płatność` DISABLE KEYS */;
INSERT INTO `płatność` VALUES (8,1,10,1,300),(9,4,24,2,1500),(10,7,15,6,10500),(11,11,27,1,1000),(12,3,23,10,16200),(13,2,20,10,6000),(14,5,25,6,3500),(15,6,26,5,6600),(16,12,28,6,2450),(17,14,29,6,3150);
/*!40000 ALTER TABLE `płatność` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `samochód`
--

DROP TABLE IF EXISTS `samochód`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `samochód` (
  `nr_rejestracyjny` varchar(10) NOT NULL,
  `przebieg` varchar(15) NOT NULL,
  `pojemność_silnika` varchar(6) NOT NULL,
  `moc_silnika` varchar(4) NOT NULL,
  `rok_produkcji` varchar(4) NOT NULL,
  `typ_paliwa` varchar(10) NOT NULL,
  `kolor` varchar(20) NOT NULL,
  `model_id` int NOT NULL,
  `segment_auta_id` int NOT NULL,
  `dostępność` int NOT NULL,
  PRIMARY KEY (`nr_rejestracyjny`),
  UNIQUE KEY `id_UNIQUE` (`nr_rejestracyjny`),
  KEY `fk_dostępność_idx` (`dostępność`),
  KEY `fk_Samochód_Model1_idx` (`model_id`),
  KEY `fk_samochód_segment_auta_idx` (`segment_auta_id`),
  CONSTRAINT `fk_dostępność` FOREIGN KEY (`dostępność`) REFERENCES `dostępność` (`id`),
  CONSTRAINT `fk_samochód_model` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`),
  CONSTRAINT `fk_samochód_segment_auta` FOREIGN KEY (`segment_auta_id`) REFERENCES `segment_auta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `samochód`
--

LOCK TABLES `samochód` WRITE;
/*!40000 ALTER TABLE `samochód` DISABLE KEYS */;
INSERT INTO `samochód` VALUES ('FFF 5555','80000','2000','150','2010','Benzyna','Czarny',41,7,1),('GHD 9JK5','78000','1200','50','2013','Benzyna','Czarny',48,6,1),('KGU 0896','543535','3200','310','2010','Diesel','Czerwony',5,1,1),('MFG DVD1','250000','1800','133','2000','Benzyna','Granatowy',9,10,1),('RIO SD55','54660','1550','120','2029','Diesel','Srebrny',42,7,1),('RKL 9KGF','147200','2100','143','2006','Benzyna','Zielony',45,5,1),('RLE l0j7','125000','5000','4000','2012','Benzyna','Biały',46,5,1),('RLE LCD4','100000','1900','110','2012','Benzyna','Czarny',43,10,1),('RLU 4ULO','20000','1300','260','2017','Benzyna','Czarny',47,12,1),('RNI 12HJ','14300','2500','180','2019','Benzyna','brązowy',1,1,1),('RNI 2137','89000','2500','1570','2017','Benzyna','czerwony',17,2,1),('RNI 22OP','47000','2800','193','2015','Benzyna','żółty',13,3,1),('RNI 22TM','123000','1400','75','2015','Benzyna','czarny',5,1,1),('RNI 3H67','90000','1600','90','2016','Benzyna','srebrny',21,6,1),('RNI 41TL','102000','1600','105','2008','Diesel','grantaowy',12,7,1),('RNI 44TL','99000','1800','125','2008','benzyna','czarny',6,8,1),('RNI 456H','95600','1900','123','2013','Benzyna','zielony',17,5,1),('RNI 5HJ8','30000','3000','210','2019','Benzyna','czarny',7,6,1),('RNI 5J7F','2100000','1100','63','2010','Benzyna','czarny',4,3,1),('RNI 66LI','22000','1600','105','2017','Diesel','zielony',19,1,1),('RNI 66QR','180000','1800','125','2009','Benzyna','srebrny',22,2,1),('RNI 75TM','50000','2000','150','2015','Benzyna','czerwony',30,6,1),('RNI 9999','100000','1400','75','2005','Diesel','Łososiowy',40,3,1),('RNI 99TL','73000','2600','210','2004','Benzyna','czarny',5,5,1),('RNI I5TF','173000','900','40','2009','Benzyna','beżowy',1,2,1),('RNI KK55','50000','3000','220','2009','Benzyna','Fioletowy',25,11,1),('UFO TR86','80000','1400','86','2017','Diesel','Srebrny',40,6,1);
/*!40000 ALTER TABLE `samochód` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segment_auta`
--

DROP TABLE IF EXISTS `segment_auta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `segment_auta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segment_auta`
--

LOCK TABLES `segment_auta` WRITE;
/*!40000 ALTER TABLE `segment_auta` DISABLE KEYS */;
INSERT INTO `segment_auta` VALUES (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E'),(6,'F'),(7,'G'),(8,'H'),(9,'J'),(10,'M'),(11,'I'),(12,'K');
/*!40000 ALTER TABLE `segment_auta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_wypożyczenia`
--

DROP TABLE IF EXISTS `status_wypożyczenia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_wypożyczenia` (
  `id` int NOT NULL,
  `opis` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_wypożyczenia`
--

LOCK TABLES `status_wypożyczenia` WRITE;
/*!40000 ALTER TABLE `status_wypożyczenia` DISABLE KEYS */;
INSERT INTO `status_wypożyczenia` VALUES (1,'W trakcie realizacji'),(2,'Zrealizowane');
/*!40000 ALTER TABLE `status_wypożyczenia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wypożyczenia`
--

DROP TABLE IF EXISTS `wypożyczenia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wypożyczenia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `klient_id` int NOT NULL,
  `samochód_nr_rejestracyjny` varchar(10) NOT NULL,
  `pracownik_id` int NOT NULL,
  `data_wypożyczenia` date NOT NULL,
  `data_zwrotu` date DEFAULT NULL,
  `status_wypożyczenia_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_wypożyczenie_samochód1_idx` (`samochód_nr_rejestracyjny`),
  KEY `fk_wypożyczenie_status_wypożyczenia1_idx` (`status_wypożyczenia_id`),
  KEY `fk_wypożyczenia_klient_idx` (`klient_id`),
  KEY `fk_wypożyczenia_pracownik_idx` (`pracownik_id`),
  CONSTRAINT `fk_wypożyczenia_klient` FOREIGN KEY (`klient_id`) REFERENCES `klient` (`id`),
  CONSTRAINT `fk_wypożyczenia_pracownik` FOREIGN KEY (`pracownik_id`) REFERENCES `pracownik` (`id`),
  CONSTRAINT `fk_wypożyczenie_samochód1` FOREIGN KEY (`samochód_nr_rejestracyjny`) REFERENCES `samochód` (`nr_rejestracyjny`),
  CONSTRAINT `fk_wypożyczenie_status_wypożyczenia1` FOREIGN KEY (`status_wypożyczenia_id`) REFERENCES `status_wypożyczenia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wypożyczenia`
--

LOCK TABLES `wypożyczenia` WRITE;
/*!40000 ALTER TABLE `wypożyczenia` DISABLE KEYS */;
INSERT INTO `wypożyczenia` VALUES (1,10,'RNI 12HJ',2,'2020-01-01','2020-01-04',2),(2,20,'MFG DVD1',2,'2020-04-10','2020-04-20',2),(3,23,'RLE LCD4',2,'2019-12-19','2020-01-15',2),(4,24,'RNI 2137',2,'2020-01-09','2020-01-19',2),(5,25,'RNI 3H67',2,'2020-05-22','2020-06-01',2),(6,26,'RNI 456H',2,'2020-07-07','2020-07-29',2),(7,15,'GHD 9JK5',3,'2020-04-15','2020-05-15',2),(11,27,'RNI 12HJ',3,'2020-12-12','2020-12-22',2),(12,28,'GHD 9JK5',2,'2020-12-18','2020-12-25',2),(14,29,'RNI 3H67',2,'2020-12-16','2020-12-25',2);
/*!40000 ALTER TABLE `wypożyczenia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'projekt_wypożyczalnia_samochodów'
--
/*!50003 DROP FUNCTION IF EXISTS `zwróc_adresID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `zwróc_adresID`(
miejscowość varchar(25), kod_pocztowy varchar(10), ulica varchar(25)
) RETURNS int
BEGIN
	DECLARE idAdres INT DEFAULT 0;
    
	set idAdres = (select id from adres where adres.miejscowość = miejscowość AND adres.kod_pocztowy = kod_pocztowy AND adres.ulica = ulica LIMIT 1);

RETURN idAdres;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `zwróć_dostępność_pojazdu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `zwróć_dostępność_pojazdu`(nr_rejestracyjny varchar(10)) RETURNS int
BEGIN

    DECLARE idDostępność INT DEFAULT 0;
	set idDostępność = (select dostępność from samochód where samochód.nr_rejestracyjny = nr_rejestracyjny LIMIT 1);


RETURN idDostępność;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `zwróć_id_klienta_z_wypożyczenia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `zwróć_id_klienta_z_wypożyczenia`(id_wypożyczenia INT) RETURNS int
BEGIN
	DECLARE idKlient INT DEFAULT 0;
    
	set idKlient = (select klient_id from wypożyczenia where wypożyczenia.id = id_wypożyczenia LIMIT 1);
	
RETURN idKlient;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `zwróć_id_marka` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `zwróć_id_marka`(nazwa varchar(20)) RETURNS int
BEGIN
    DECLARE idMarka INT DEFAULT 0;
    
	set idMarka = (select id from marka where marka.nazwa = nazwa LIMIT 1);

RETURN idMarka;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `zwróć_id_model` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `zwróć_id_model`(nazwa varchar(20)) RETURNS int
BEGIN
	DECLARE idModel INT DEFAULT 0;
    
	set idModel = (select id from model where model.nazwa = nazwa LIMIT 1);
    
RETURN idModel;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `zwróć_id_osoba` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `zwróć_id_osoba`(
imie varchar(20), nazwisko varchar(20), data_urodzenia DATE, pesel varchar(11),nr_telefonu varchar(10), email varchar(45)
) RETURNS int
BEGIN
	DECLARE idOsoba INT DEFAULT 0;
    
    set idOsoba = (select id from osoba where osoba.imie = imie AND osoba.nazwisko = nazwisko AND osoba.data_urodzenia = data_urodzenia AND osoba.pesel = pesel AND osoba.nr_telefonu = nr_telefonu AND osoba.email = email LIMIT 1);
RETURN idOsoba;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `zwróć_id_segment_auta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `zwróć_id_segment_auta`(nazwa varchar(20)) RETURNS int
BEGIN
DECLARE idSegment INT DEFAULT 0;
    
	set idSegment = (select id from segment_auta where segment_auta.nazwa = nazwa LIMIT 1);
    
RETURN idSegment;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `zwróć_nr_rejestracyjny_z_wypożyczenia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `zwróć_nr_rejestracyjny_z_wypożyczenia`(id_wypożyczenia INT) RETURNS text CHARSET utf8mb4
BEGIN

	DECLARE nr_rejestracyjny TEXT DEFAULT '';
    
	set nr_rejestracyjny = (select samochód_nr_rejestracyjny from wypożyczenia where wypożyczenia.id = id_wypożyczenia LIMIT 1);

RETURN nr_rejestracyjny;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `zwróć_segment_auta_z_nr_rejestracyjnego` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `zwróć_segment_auta_z_nr_rejestracyjnego`(nr_rejestracyjny varchar(10)) RETURNS text CHARSET utf8mb4
BEGIN
	DECLARE segment_auta TEXT DEFAULT '';
    
    set segment_auta = (SELECT segment_auta_id FROM samochód WHERE samochód.nr_rejestracyjny = nr_rejestracyjny);

RETURN segment_auta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_klienta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_klienta`(
imie varchar(20), nazwisko varchar(20), data_urodzenia DATE, pesel varchar(11), nr_telefonu varchar(10), email varchar(45),
miejscowość varchar(25), kod_pocztowy varchar(10), ulica varchar(25),
prawo_jazdy varchar(15)
)
BEGIN
	DECLARE idAdres INT DEFAULT 0;
    DECLARE idOsoba INT DEFAULT 0;
    
    IF NOT EXISTS (SELECT pesel,nr_telefonu,email from osoba WHERE osoba.pesel = pesel OR osoba.nr_telefonu = nr_telefonu OR osoba.email = email) THEN
    
    INSERT INTO osoba(imie, nazwisko, data_urodzenia, pesel, nr_telefonu, email) VALUES(imie, nazwisko, data_urodzenia, pesel, nr_telefonu, email);
    INSERT INTO adres(miejscowość, kod_pocztowy, ulica) VALUES(miejscowość, kod_pocztowy, ulica);

    set idAdres = (select projekt_wypożyczalnia_samochodów.zwróc_adresID(miejscowość, kod_pocztowy, ulica) LIMIT 1);
    set idOsoba = (select projekt_wypożyczalnia_samochodów.zwróć_id_osoba(imie, nazwisko, data_urodzenia, pesel, nr_telefonu, email) LIMIT 1);
    
    INSERT INTO klient(prawo_jazdy, adres_id, osoba_id) VALUES(prawo_jazdy,idAdres, idOsoba);
    
    
    ELSE 
    SELECT 'Osoba o podanych danych widnieje w bazie';
    END IF;
    
    
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_pracownika` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_pracownika`(
imie varchar(20), nazwisko varchar(20), data_urodzenia DATE, pesel varchar(11), nr_telefonu varchar(10), email varchar(45),
miejscowość varchar(25), kod_pocztowy varchar(10), ulica varchar(25),
stanowisko varchar(25), pensja INT
)
BEGIN

	DECLARE idAdres INT DEFAULT 0;
    DECLARE idOsoba INT DEFAULT 0;
    
    IF NOT EXISTS (SELECT pesel,nr_telefonu,email from osoba WHERE osoba.pesel = pesel OR osoba.nr_telefonu = nr_telefonu OR osoba.email = email) THEN
    
    INSERT INTO osoba(imie, nazwisko, data_urodzenia, pesel, nr_telefonu, email) VALUES(imie, nazwisko, data_urodzenia, pesel, nr_telefonu, email);
    INSERT INTO adres(miejscowość, kod_pocztowy, ulica) VALUES(miejscowość, kod_pocztowy, ulica);

    set idAdres = (select projekt_wypożyczalnia_samochodów.zwróc_adresID(miejscowość, kod_pocztowy, ulica) LIMIT 1);
    set idOsoba = (select projekt_wypożyczalnia_samochodów.zwróć_id_osoba(imie, nazwisko, data_urodzenia, pesel, nr_telefonu, email) LIMIT 1);
    
    INSERT INTO pracownik(stanowisko, pensja, adres, osoba) VALUES(stanowisko, pensja,idAdres, idOsoba);
    
    
    ELSE 
    SELECT 'Osoba o podanych danych widnieje w bazie';
    END IF;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_płatność` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_płatność`(wypożyczenie_id INT, data_zwrotu DATE
)
BEGIN
	DECLARE idKlient INT DEFAULT 0;
	DECLARE idNrRejestracyjny TEXT DEFAULT '';
	DECLARE idSegmentAuta TEXT DEFAULT '';
    DECLARE idCennik INT DEFAULT 0;
    DECLARE różnicaDni INT DEFAULT 0;
    DECLARE cena INT DEFAULT 0;
    
    set idKlient = (select projekt_wypożyczalnia_samochodów.zwróć_id_klienta_z_wypożyczenia(wypożyczenie_id) LIMIT 1);
    set idNrRejestracyjny = (select projekt_wypożyczalnia_samochodów.zwróć_nr_rejestracyjny_z_wypożyczenia(wypożyczenie_id));
    set idSegmentAuta = (select projekt_wypożyczalnia_samochodów.zwróć_segment_auta_z_nr_rejestracyjnego(idNrRejestracyjny));
    set idCennik = (SELECT id FROM cennik WHERE cennik.segment_auta_id = idSegmentAuta LIMIT 1);
    
    set różnicaDni = datediff((select data_zwrotu from wypożyczenia where wypożyczenia.id = wypożyczenie_id),(select data_wypożyczenia from wypożyczenia where wypożyczenia.id = wypożyczenie_id));
    set cena = rożnicaDni * (select cena_za_dobe from cennik where cennik.id = idCennik);
    
	INSERT INTO płatność(wypożyczenia, klient, cennik,cena) VALUES(wypożyczenie_id, idKlient,idCennik, cena);
    
    call projekt_wypożyczalnia_samochodów.zmień_dostępność_samochodu(idNrRejestracyjny,1);
    
    UPDATE wypożyczenia
    SET data_zwrotu = data_zwrotu
    WHERE wypożyczenia.id = wypożyczenie_id; 
    
    UPDATE wypożyczenia
    SET status_wypożyczenia_id = 2
    WHERE wypożyczenia.id = wypożyczenie_id; 
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_samochód` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_samochód`(
	nr_rejestracyjny varchar(10),przebieg VARCHAR(15), pojemność_silnika varchar(6), moc_silnika varchar(4), rok_produkcji varchar(4), typ_paliwa varchar(10), kolor varchar(20),
	marka_nazwa varchar(20),
	model_nazwa varchar(20),
    segment_auta_nazwa varchar(20) 
)
BEGIN
	DECLARE idMarka INT DEFAULT 0;
    DECLARE idModel INT DEFAULT 0;
    DECLARE idSegmentAuta INT DEFAULT 0;
    
    IF NOT EXISTS (SELECT nazwa from segment_auta WHERE segment_auta.nazwa = segment_auta_nazwa ) THEN
		INSERT INTO segment_auta(nazwa) values (segment_auta_nazwa);
        END IF;
        
        set idSegmentAuta = (select projekt_wypożyczalnia_samochodów.zwróć_id_segment_auta(segment_auta_nazwa));
        
    
    IF NOT EXISTS (SELECT nazwa from marka WHERE marka.nazwa = marka_nazwa ) THEN
		INSERT INTO marka(nazwa) values(marka_nazwa);
        END IF;
    
	set idMarka = (select projekt_wypożyczalnia_samochodów.zwróć_id_marka(marka_nazwa));
    
    IF NOT EXISTS (SELECT nazwa from model WHERE model.nazwa = model_nazwa ) THEN
		INSERT INTO model(nazwa, marka_id) values(model_nazwa, idMarka);
        END IF;
        
        set idModel = (select projekt_wypożyczalnia_samochodów.zwróć_id_model(model_nazwa));
        
	IF NOT EXISTS (SELECT nr_rejestracyjny FROM samochód WHERE samochód.nr_rejestracyjny = nr_rejestracyjny) THEN
		INSERT INTO samochód(nr_rejestracyjny, przebieg, pojemność_silnika, moc_silnika, rok_produkcji, typ_paliwa, kolor, model_id, segment_auta_id, dostępność) VALUES(nr_rejestracyjny, przebieg, pojemność_silnika, moc_silnika, rok_produkcji, typ_paliwa, kolor, idModel, idSegmentAuta,1);
        END IF;
	
        

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_wypożyczenie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodaj_wypożyczenie`(
klient_id INT, samochód_nr_rejestracyjny VARCHAR(10), pracownik_id INT, data_wypożyczenia DATE
)
BEGIN
	DECLARE idDostępność INT DEFAULT 0;
    set idDostępność = (select projekt_wypożyczalnia_samochodów.zwróć_dostępność_pojazdu(samochód_nr_rejestracyjny));
	IF(idDostępność = 1)THEN
	
    INSERT INTO wypożyczenia(klient_id, samochód_nr_rejestracyjny, pracownik_id, data_wypożyczenia, status_wypożyczenia_id) VALUES (klient_id, samochód_nr_rejestracyjny, pracownik_id, data_wypożyczenia, 1);
    
	call projekt_wypożyczalnia_samochodów.zmień_dostępność_samochodu(samochód_nr_rejestracyjny,2);
    ELSE
    Select 'Samochód o podanym nr rejestracyjnym nie jest aktualnie dostępny';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usuń_adres` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usuń_adres`(id INT)
BEGIN
	delete from adres
    where adres.id = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usuń_klienta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usuń_klienta`(id INT)
BEGIN
    DELETE adres, osoba, klient
    FROM klient
    INNER JOIN adres on klient.adres_id = adres.id
    INNER JOIN osoba on klient.osoba_id = osoba.id
    WHERE klient.id = id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usuń_pracownika` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usuń_pracownika`(id INT)
BEGIN
	DELETE adres, osoba, pracownik
    FROM pracownik
    INNER JOIN adres on pracownik.adres = adres.id
    INNER JOIN osoba on pracownik.osoba = osoba.id
    WHERE pracownik.id = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usuń_samochód` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usuń_samochód`(nr_rejestracyjny varchar(10))
BEGIN
	DELETE SAMOCHÓD
	FROM samochód 
	WHERE (samochód.nr_rejestracyjny = nr_rejestracyjny);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `wyświetl_ilość_auta_wszystkich_marek` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `wyświetl_ilość_auta_wszystkich_marek`()
BEGIN

    SELECT COUNT(marka_id) as Ilość, marka.nazwa as 'Marka'
    FROM model
    INNER JOIN marka
    ON model.marka_id = marka.id
    group by marka.nazwa
    ORDER BY Ilość DESC;
    


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `wyświetl_płatności` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `wyświetl_płatności`()
BEGIN
	select płatność.id, wypożyczenia as "NR wypożyczenia", osoba.imie as 'Imię klienta', osoba.nazwisko as 'Nazwisko klienta',samochód.nr_rejestracyjny as 'NR rejestracyjnya smochodu', cennik.cena_za_dobe as 'Cena za dobę',płatność.cena as 'Cena'
    from płatność
    
    INNER JOIN klient
    on płatność.klient = klient.id
    
    INNER JOIN osoba
    on klient.osoba_id = osoba.id
    
    INNER JOIN cennik
    on płatność.cennik = cennik.id
    
    INNER JOIN wypożyczenia
    on płatność.wypożyczenia = wypożyczenia.id
    
    INNER JOIN samochód
    on wypożyczenia.samochód_nr_rejestracyjny = samochód.nr_rejestracyjny;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `wyświetl_samochód_na_podstawie_rejestracji` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `wyświetl_samochód_na_podstawie_rejestracji`(nr_rejestracyjny varchar(20))
BEGIN

SELECT  marka.nazwa as "Marka", model.nazwa as 'Model', rok_produkcji as 'Rok produkcji',przebieg as 'Przebieg',  moc_silnika as 'Moc',pojemność_silnika as 'Pojemność',  nr_rejestracyjny as 'Nr rejestracyjny',typ_paliwa as 'Typ paliwa', kolor as 'Kolor',  segment_auta.nazwa as 'Segment', dostępność.Opis
    FROM samochód
    
    INNER JOIN model 
    ON samochód.model_id = model.id
    
    INNER JOIN marka
    on model.marka_id = marka.id
    
    INNER JOIN dostępność 
    ON samochód.dostępność = dostępność.id
    
    INNER JOIN segment_auta
    ON samochód.segment_auta_id = segment_auta.id
    
    WHERE samochód.nr_rejestracyjny = nr_rejestracyjny;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `wyświetl_wszystkich_klientów` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `wyświetl_wszystkich_klientów`(
)
BEGIN
	SELECT klient.id, prawo_jazdy, osoba.imie, osoba.nazwisko, osoba.data_urodzenia, osoba.pesel,osoba.nr_telefonu, osoba.email, adres.miejscowość, adres.kod_pocztowy, adres.ulica
    FROM klient
    
    INNER JOIN osoba 
    ON klient.osoba_id = osoba.id
    
    INNER JOIN adres
    ON klient.adres_id = adres.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `wyświetl_wszystkich_pracowników` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `wyświetl_wszystkich_pracowników`()
BEGIN

	SELECT pracownik.id,stanowisko, pensja, osoba.imie, osoba.nazwisko, osoba.data_urodzenia, osoba.pesel,osoba.nr_telefonu, osoba.email, adres.miejscowość, adres.kod_pocztowy, adres.ulica
    FROM pracownik
    
    INNER JOIN osoba 
    ON pracownik.osoba = osoba.id
    
    INNER JOIN adres
    ON pracownik.adres = adres.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `wyświetl_wszystkie_aktywne_wypożyczenia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `wyświetl_wszystkie_aktywne_wypożyczenia`()
BEGIN
SELECT wypożyczenia.id, osoba.imie, osoba. nazwisko , marka.nazwa as marka, model.nazwa as model, samochód.nr_rejestracyjny,data_wypożyczenia,data_zwrotu, status_wypożyczenia.opis as status_wypożyczenia
    FROM wypożyczenia
    
	INNER JOIN samochód 
	ON wypożyczenia.samochód_nr_rejestracyjny = samochód.nr_rejestracyjny
    
    INNER JOIN model
    ON samochód.model_id = model.id
    
    INNER JOIN marka
    ON model.marka_id = marka.id
    
    INNER JOIN klient
    on wypożyczenia.klient_id = klient.id
    
    INNER JOIN osoba
    ON klient.osoba_id = osoba.id
    
    INNER JOIN status_wypożyczenia
    ON wypożyczenia.status_wypożyczenia_id = status_wypożyczenia.id
    
	WHERE wypożyczenia.status_wypożyczenia_id = 1
    ORDER BY data_wypożyczenia;
    
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `wyświetl_wszystkie_samochody` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `wyświetl_wszystkie_samochody`()
BEGIN

	SELECT  marka.nazwa as "Marka", model.nazwa as 'Model', rok_produkcji as 'Rok produkcji',przebieg as 'Przebieg',  moc_silnika as 'Moc',pojemność_silnika as 'Pojemność',  nr_rejestracyjny as 'Nr rejestracyjny',typ_paliwa as 'Typ paliwa', kolor as 'Kolor',  segment_auta.nazwa as 'Segment', dostępność.Opis
    FROM samochód
    
    INNER JOIN model 
    ON samochód.model_id = model.id
    
    INNER JOIN marka
    on model.marka_id = marka.id
    
    INNER JOIN dostępność 
    ON samochód.dostępność = dostępność.id
    
    INNER JOIN segment_auta
    ON samochód.segment_auta_id = segment_auta.id
    
    ORDER BY rok_produkcji DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `wyświetl_wszystkie_wypożyczenia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `wyświetl_wszystkie_wypożyczenia`()
BEGIN

SELECT wypożyczenia.id, osoba.imie, osoba. nazwisko , marka.nazwa as marka, model.nazwa as model, samochód.nr_rejestracyjny,data_wypożyczenia,data_zwrotu, status_wypożyczenia.opis as status_wypożyczenia
    FROM wypożyczenia
    
	INNER JOIN samochód 
	ON wypożyczenia.samochód_nr_rejestracyjny = samochód.nr_rejestracyjny
    
    INNER JOIN model
    ON samochód.model_id = model.id
    
    INNER JOIN marka
    ON model.marka_id = marka.id
    
    INNER JOIN klient
    on wypożyczenia.klient_id = klient.id
    
    INNER JOIN osoba
    ON klient.osoba_id = osoba.id
    
    INNER JOIN status_wypożyczenia
    ON wypożyczenia.status_wypożyczenia_id = status_wypożyczenia.id
    
    ORDER BY data_wypożyczenia;
    


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `wyświetl_wypożyczenia_w_trakcie_realizacji` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `wyświetl_wypożyczenia_w_trakcie_realizacji`()
BEGIN
SELECT wypożyczenia.id, osoba.imie, osoba. nazwisko , marka.nazwa as marka, model.nazwa as model, samochód.nr_rejestracyjny,data_wypożyczenia,data_zwrotu
    FROM wypożyczenia
    
	INNER JOIN samochód 
	ON wypożyczenia.samochód_nr_rejestracyjny = samochód.nr_rejestracyjny
    
    INNER JOIN model
    ON samochód.model_id = model.id
    
    INNER JOIN marka
    ON model.marka_id = marka.id
    
    
    INNER JOIN klient
    on wypożyczenia.klient_id = klient.id
    
    INNER JOIN osoba
    ON klient.osoba_id = osoba.id
    
    WHERE wypożyczenia.status_wypożyczenia_id = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `wyświetl_wypożyczenia_zrealizowane` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `wyświetl_wypożyczenia_zrealizowane`()
BEGIN
SELECT wypożyczenia.id, osoba.imie, osoba. nazwisko , marka.nazwa as marka, model.nazwa as model, samochód.nr_rejestracyjny,data_wypożyczenia,data_zwrotu
    FROM wypożyczenia
    
	INNER JOIN samochód 
	ON wypożyczenia.samochód_nr_rejestracyjny = samochód.nr_rejestracyjny
    
    INNER JOIN model
    ON samochód.model_id = model.id
    
    INNER JOIN marka
    ON model.marka_id = marka.id
    
    
    INNER JOIN klient
    on wypożyczenia.klient_id = klient.id
    
    INNER JOIN osoba
    ON klient.osoba_id = osoba.id
    
    WHERE wypożyczenia.status_wypożyczenia_id = 2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `wyświetl_wypożyczenie_na_podstawie_parametru` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `wyświetl_wypożyczenie_na_podstawie_parametru`(Wpisz_zrealizowane_lub_niezrealizowane varchar(20))
BEGIN

	IF(Wpisz_zrealizowane_lub_niezrealizowane = 'zrealizowane') THEN
	call projekt_wypożyczalnia_samochodów.wyświetl_wypożyczenia_zrealizowane();
	ELSEIF (Wpisz_zrealizowane_lub_niezrealizowane = 'niezrealizowane') THEN
    call projekt_wypożyczalnia_samochodów.wyświetl_wypożyczenia_w_trakcie_realizacji();
    ELSE 
    SELECT 'Wpisano złe dane';
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `zmień_dostępność_samochodu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `zmień_dostępność_samochodu`(nr_rejestracyjny varchar(10), parametr INT)
BEGIN

	IF(parametr = 1)THEN
		UPDATE samochód
		SET dostępność = 1
		WHERE samochód.nr_rejestracyjny = nr_rejestracyjny;
    ELSEIF(parametr = 2) THEN
		UPDATE samochód
		SET dostępność = 2
		WHERE samochód.nr_rejestracyjny = nr_rejestracyjny;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-18 11:24:29
