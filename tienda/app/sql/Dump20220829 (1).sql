CREATE DATABASE  IF NOT EXISTS `esquema_tienda_geek` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `esquema_tienda_geek`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: esquema_tienda_geek
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_prod` varchar(255) DEFAULT NULL,
  `description` text,
  `price_prod` float DEFAULT NULL,
  `category` varchar(150) DEFAULT NULL,
  `favorite` tinyint DEFAULT NULL,
  `url_img` varchar(255) DEFAULT NULL,
  `publication_expiration` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_users_idx` (`user_id`),
  CONSTRAINT `fk_products_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Figura Lego Mario Bross','Figura coleccionable de Mario Bross 20x12 version limitada',87500,'Diversos',1,'https://images.unsplash.com/photo-1612798725068-70093d7d3d56?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80','2022-09-10 00:00:00','2022-08-29 19:25:32','2022-08-29 19:25:32',8),(2,'Batman + Carrito armable','Juguete duo con excelente acabados y coleccionable',130000,'Diversos',0,'https://images.unsplash.com/photo-1594736797933-d0501ba2fe65?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=434&q=80','2022-09-20 00:00:00','2022-08-29 19:33:30','2022-08-29 19:33:30',8),(3,'Disfraz Iron man real fit','Perfecto disfraz para las ocasiones mas especiales cargadas de aventuras y para destacar con elegancia.',260300,'Marvel',1,'https://images.unsplash.com/photo-1636840438199-9125cd03c3b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80','2022-09-30 00:00:00','2022-08-29 19:43:02','2022-08-29 19:43:02',8),(5,'Control Xbox','Control inalambrico compatible con la consola XBox 360',89600,'Consolas',0,'https://images.unsplash.com/photo-1605640194512-2f7440046c2a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','2022-08-15 00:00:00','2022-08-29 20:02:16','2022-08-29 20:02:16',8),(6,'Control PS5','Control Inalámbrico para consola play station 5 ultima generación',98560,'Consolas',1,'https://images.unsplash.com/photo-1644571580854-114d7d8fa383?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80','2022-08-30 00:00:00','2022-08-29 20:09:19','2022-08-29 22:23:23',8),(7,'Juego Pacman','Juego Pacman version clasica',75630,'Consolas',0,'https://images.unsplash.com/photo-1640972040132-28b62b6b3718?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80','2022-09-20 00:00:00','2022-08-29 21:59:30','2022-08-29 22:00:21',10),(9,'Juego Pacman','Consola Arcade con Pacman en todas sus versiones. Disfruta de este grandioso juego y vuelve a vivir los mejores momentos en las consolas clasicas.',96300,'Consolas',0,'https://images.unsplash.com/photo-1640972040132-28b62b6b3718?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80','2022-09-03 00:00:00','2022-08-29 23:48:30','2022-08-29 23:49:56',8);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jonathan','Cardona','yotomc17@gmail.com','$2b$12$2vO1pl3np/x7ffSZE8a71equ8o7Qiga5nGRCqeHrq2Tom/q2qkMdu','2022-08-28 21:26:50','2022-08-28 21:26:50'),(2,'Jonathan','Hawkings','yc@code.com','$2b$12$7kANlz7aEvOGgO1PbDSOtu11Snm98/VmpP57b./GTcn7xaiff1QOy','2022-08-28 21:28:42','2022-08-28 21:28:42'),(3,'Anna','Frank','af@code.com','$2b$12$FYVPCx0tBUVQjloH7MxnD.IkIpVqWw79aurKjHjOVR.TvwlamjAma','2022-08-28 21:42:08','2022-08-28 21:42:08'),(4,'Elon','Musk','em@code.com','$2b$12$liMOP9e/8ZcKYZEydWotuuavhRIIlgwxc1Cav5DIlRSBfzbmbZm.S','2022-08-28 21:44:18','2022-08-28 21:44:18'),(5,'Jeff','Bezos','jb@code.com','$2b$12$3YV/aS5xMw7npIf.vx/3DuGb1mSy0gZGJCFK9HON8PyuL6GHPS5j.','2022-08-28 21:45:17','2022-08-28 21:45:17'),(6,'Jonathan','Cardona','jc@code.com','$2b$12$5SX2IZU8DlGEvduiDVzQdOftTLi4xqo.mMjqnaqpkuqI5sdjG5GCS','2022-08-28 21:46:14','2022-08-28 21:46:14'),(7,'Jupiter','Astro','ja@code.com','$2b$12$5.mTR2b9M9khwImUsTXWmem0l.cVsaqsdHpwtDVSn23LMXnQ4nqo.','2022-08-28 21:47:31','2022-08-28 21:47:31'),(8,'Linux','Trolbar','lt@code.com','$2b$12$KTHyOl7VO4zecXr5N4Y44ejsPgxwaJJEyoCdyHyn5.Z748hmfN7VW','2022-08-28 23:14:42','2022-08-28 23:14:42'),(9,'Gabriel','Garcia Marquez','hw@br.com','$2b$12$PZ03oSN7YxxbWUEY53dMmu3RjPKqTBMmTojUGyE1XPYwkIG/ajP0y','2022-08-29 20:05:16','2022-08-29 20:05:16'),(10,'Jacobo','Posada','jp@code.com','$2b$12$HWuwtotc/X3xlcYfrdAdDu9Rhe/pg9MeiEU1E76wW4qxMTh7q.W.K','2022-08-29 21:44:10','2022-08-29 21:44:10'),(11,'Mike','Towers','mt@code.com','$2b$12$yEqxKBR8CE10A6bN68QHp.dtgxVq9rE5sn3tsn2ffq0IZhmWH6ZgG','2022-08-29 22:29:53','2022-08-29 22:29:53'),(12,'Paula','Ocampo','po@code.com','$2b$12$pUAQe6udYuUqZZI1nC6FF.JyZNwLFBt7ngN2UQRjs3C/RhGUsjhLm','2022-08-29 23:14:46','2022-08-29 23:14:46');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-29 23:50:40
