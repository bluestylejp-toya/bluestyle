-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: chain
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dtb_api_account`
--

DROP TABLE IF EXISTS `dtb_api_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_api_account` (
  `api_account_id` int NOT NULL,
  `api_access_key` text NOT NULL,
  `api_secret_key` text NOT NULL,
  `enable` smallint NOT NULL DEFAULT '0',
  `del_flg` smallint NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  PRIMARY KEY (`api_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_api_account`
--

LOCK TABLES `dtb_api_account` WRITE;
/*!40000 ALTER TABLE `dtb_api_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_api_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_api_account_api_account_id_seq`
--

DROP TABLE IF EXISTS `dtb_api_account_api_account_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_api_account_api_account_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_api_account_api_account_id_seq`
--

LOCK TABLES `dtb_api_account_api_account_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_api_account_api_account_id_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_api_account_api_account_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_api_config`
--

DROP TABLE IF EXISTS `dtb_api_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_api_config` (
  `api_config_id` int NOT NULL,
  `operation_name` text NOT NULL,
  `operation_description` text,
  `auth_types` text NOT NULL,
  `enable` smallint NOT NULL DEFAULT '0',
  `is_log` smallint NOT NULL DEFAULT '0',
  `sub_data` text,
  `del_flg` smallint NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  PRIMARY KEY (`api_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_api_config`
--

LOCK TABLES `dtb_api_config` WRITE;
/*!40000 ALTER TABLE `dtb_api_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_api_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_api_config_api_config_id_seq`
--

DROP TABLE IF EXISTS `dtb_api_config_api_config_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_api_config_api_config_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_api_config_api_config_id_seq`
--

LOCK TABLES `dtb_api_config_api_config_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_api_config_api_config_id_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_api_config_api_config_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_baseinfo`
--

DROP TABLE IF EXISTS `dtb_baseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_baseinfo` (
  `id` int NOT NULL,
  `company_name` text,
  `company_kana` text,
  `zip01` text,
  `zip02` text,
  `zipcode` text,
  `country_id` int DEFAULT NULL,
  `pref` smallint DEFAULT NULL,
  `addr01` text,
  `addr02` text,
  `tel01` text,
  `tel02` text,
  `tel03` text,
  `fax01` text,
  `fax02` text,
  `fax03` text,
  `business_hour` text,
  `law_company` text,
  `law_manager` text,
  `law_zip01` text,
  `law_zip02` text,
  `law_zipcode` text,
  `law_country_id` int DEFAULT NULL,
  `law_pref` smallint DEFAULT NULL,
  `law_addr01` text,
  `law_addr02` text,
  `law_tel01` text,
  `law_tel02` text,
  `law_tel03` text,
  `law_fax01` text,
  `law_fax02` text,
  `law_fax03` text,
  `law_email` text,
  `law_url` text,
  `law_term01` text,
  `law_term02` text,
  `law_term03` text,
  `law_term04` text,
  `law_term05` text,
  `law_term06` text,
  `law_term07` text,
  `law_term08` text,
  `law_term09` text,
  `law_term10` text,
  `email01` text,
  `email02` text,
  `email03` text,
  `email04` text,
  `free_rule` decimal(10,0) DEFAULT NULL,
  `shop_name` text,
  `shop_kana` text,
  `shop_name_eng` text,
  `point_rate` decimal(10,0) NOT NULL DEFAULT '0',
  `welcome_point` decimal(10,0) NOT NULL DEFAULT '0',
  `update_date` timestamp NOT NULL,
  `top_tpl` text,
  `product_tpl` text,
  `detail_tpl` text,
  `mypage_tpl` text,
  `good_traded` text,
  `message` text,
  `regular_holiday_ids` text,
  `latitude` text,
  `longitude` text,
  `downloadable_days` decimal(10,0) DEFAULT '30',
  `downloadable_days_unlimited` smallint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_baseinfo`
--

LOCK TABLES `dtb_baseinfo` WRITE;
/*!40000 ALTER TABLE `dtb_baseinfo` DISABLE KEYS */;
INSERT INTO `dtb_baseinfo` VALUES (1,NULL,NULL,NULL,NULL,NULL,392,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'webmaster@bluestyle.jp','webmaster@bluestyle.jp','webmaster@bluestyle.jp','webmaster@bluestyle.jp',NULL,'EC-CUBE BASE',NULL,NULL,0,0,'2021-01-13 01:40:44','default1','default1','default1','default1',NULL,NULL,NULL,NULL,NULL,30,NULL);
/*!40000 ALTER TABLE `dtb_baseinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_best_products`
--

DROP TABLE IF EXISTS `dtb_best_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_best_products` (
  `best_id` int NOT NULL,
  `category_id` int NOT NULL,
  `RANK` int NOT NULL DEFAULT '0',
  `product_id` int NOT NULL,
  `title` text,
  `comment` text,
  `creator_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `del_flg` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`best_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_best_products`
--

LOCK TABLES `dtb_best_products` WRITE;
/*!40000 ALTER TABLE `dtb_best_products` DISABLE KEYS */;
INSERT INTO `dtb_best_products` VALUES (1,0,1,2,NULL,'たまには鍋でもどうでしょう。',2,'2021-01-13 01:40:23','2021-01-13 01:40:23',0);
INSERT INTO `dtb_best_products` VALUES (2,0,2,1,NULL,'お口直しに。',2,'2021-01-13 01:40:23','2021-01-13 01:40:23',0);
/*!40000 ALTER TABLE `dtb_best_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_best_products_best_id_seq`
--

DROP TABLE IF EXISTS `dtb_best_products_best_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_best_products_best_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_best_products_best_id_seq`
--

LOCK TABLES `dtb_best_products_best_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_best_products_best_id_seq` DISABLE KEYS */;
INSERT INTO `dtb_best_products_best_id_seq` VALUES (2);
/*!40000 ALTER TABLE `dtb_best_products_best_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_bkup`
--

DROP TABLE IF EXISTS `dtb_bkup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_bkup` (
  `bkup_name` text NOT NULL,
  `bkup_memo` text,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bkup_name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_bkup`
--

LOCK TABLES `dtb_bkup` WRITE;
/*!40000 ALTER TABLE `dtb_bkup` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_bkup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_bloc`
--

DROP TABLE IF EXISTS `dtb_bloc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_bloc` (
  `device_type_id` int NOT NULL,
  `bloc_id` int NOT NULL,
  `bloc_name` text,
  `tpl_path` text,
  `filename` text NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `php_path` text,
  `deletable_flg` smallint NOT NULL DEFAULT '1',
  `plugin_id` int DEFAULT NULL,
  PRIMARY KEY (`device_type_id`,`bloc_id`),
  UNIQUE KEY `device_type_id` (`device_type_id`,`filename`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_bloc`
--

LOCK TABLES `dtb_bloc` WRITE;
/*!40000 ALTER TABLE `dtb_bloc` DISABLE KEYS */;
INSERT INTO `dtb_bloc` VALUES (1,1,'サイトロゴ','site_logo.tpl','site_logo','2021-01-13 01:40:18','2021-01-13 01:40:18',NULL,0,NULL);
INSERT INTO `dtb_bloc` VALUES (1,2,'新着情報','news.tpl','news','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/news.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (1,3,'おすすめ商品','recommend.tpl','recommend','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/recommend.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (1,4,'カテゴリ','category.tpl','category','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/category.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (1,5,'ログイン','login.tpl','login','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/login.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (1,6,'【ヘッダー】ログイン','login_header.tpl','login_header','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/login_header.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (1,7,'クレジットカード決済入力フォーム','sln_credit.tpl','sln_credit','2021-09-16 09:35:11','2021-09-16 09:35:11',NULL,0,1);
INSERT INTO `dtb_bloc` VALUES (1,8,'登録済みクレジットカード決済入力フォーム','sln_regist_credit.tpl','sln_regist_credit','2021-09-16 09:35:11','2021-09-16 09:35:11',NULL,0,1);
INSERT INTO `dtb_bloc` VALUES (2,1,'新着情報','news.tpl','news','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/news.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (2,2,'ログイン','login.tpl','login','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/login.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (2,3,'おすすめ商品','recommend.tpl','recommend','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/recommend.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (2,4,'カテゴリ','category.tpl','category','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/category.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (2,5,'【ヘッダー】ログイン','login_header.tpl','login_header','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/login_header.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (2,6,'【ヘッダー】ナビ','navi_header.tpl','navi_header','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/navi_header.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (2,7,'【フッター】ログイン','login_footer.tpl','login_footer','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/login_footer.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (2,8,'【フッター】ナビ','navi_footer.tpl','navi_footer','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/navi_footer.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (2,9,'クレジットカード決済入力フォーム','sln_credit.tpl','sln_credit','2021-09-16 09:35:11','2021-09-16 09:35:11',NULL,0,1);
INSERT INTO `dtb_bloc` VALUES (2,10,'登録済みクレジットカード決済入力フォーム','sln_regist_credit.tpl','sln_regist_credit','2021-09-16 09:35:11','2021-09-16 09:35:11',NULL,0,1);
INSERT INTO `dtb_bloc` VALUES (10,1,'カテゴリ','category.tpl','category','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/category.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (10,2,'利用ガイド','guide.tpl','guide','2021-01-13 01:40:18','2021-01-13 01:40:18',NULL,0,NULL);
INSERT INTO `dtb_bloc` VALUES (10,3,'カゴの中','cart.tpl','cart','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/cart.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (10,4,'商品検索','search_products.tpl','search_products','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/search_products.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (10,5,'新着情報','news.tpl','news','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/news.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (10,6,'ログイン','login.tpl','login','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/login.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (10,7,'おすすめ商品','recommend.tpl','recommend','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/recommend.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (10,8,'カレンダー','calendar.tpl','calendar','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/calendar.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (10,9,'【ヘッダー】ログイン','login_header.tpl','login_header','2021-01-13 01:40:18','2021-01-13 01:40:18','frontparts/bloc/login_header.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (10,10,'新着アイテム','new_item.tpl','new_item','2021-07-28 00:00:00','2021-07-28 00:00:00','frontparts/bloc/new_item.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (10,11,'閲覧履歴','check_item.tpl','check_item','2021-08-08 00:00:00','2021-08-08 00:00:00','frontparts/bloc/check_item.php',0,NULL);
INSERT INTO `dtb_bloc` VALUES (10,12,'クレジットカード決済入力フォーム','sln_credit.tpl','sln_credit','2021-09-16 09:35:11','2021-09-16 09:35:11',NULL,0,1);
INSERT INTO `dtb_bloc` VALUES (10,13,'登録済みクレジットカード決済入力フォーム','sln_regist_credit.tpl','sln_regist_credit','2021-09-16 09:35:11','2021-09-16 09:35:11',NULL,0,1);
/*!40000 ALTER TABLE `dtb_bloc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_blocposition`
--

DROP TABLE IF EXISTS `dtb_blocposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_blocposition` (
  `device_type_id` int NOT NULL,
  `page_id` int NOT NULL,
  `target_id` int NOT NULL,
  `bloc_id` int NOT NULL,
  `bloc_row` int DEFAULT NULL,
  `anywhere` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`device_type_id`,`page_id`,`target_id`,`bloc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_blocposition`
--

LOCK TABLES `dtb_blocposition` WRITE;
/*!40000 ALTER TABLE `dtb_blocposition` DISABLE KEYS */;
INSERT INTO `dtb_blocposition` VALUES (1,1,2,2,1,0);
INSERT INTO `dtb_blocposition` VALUES (1,1,2,3,2,0);
INSERT INTO `dtb_blocposition` VALUES (1,1,2,4,3,0);
INSERT INTO `dtb_blocposition` VALUES (1,1,10,1,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,1,4,1,4,0);
INSERT INTO `dtb_blocposition` VALUES (2,1,4,2,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,1,4,3,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,1,4,4,3,0);
INSERT INTO `dtb_blocposition` VALUES (2,1,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,1,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,1,10,5,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,2,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,2,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,2,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,3,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,3,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,3,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,4,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,4,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,4,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,5,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,5,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,5,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,6,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,6,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,6,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,7,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,7,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,7,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,8,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,8,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,8,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,9,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,9,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,9,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,10,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,10,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,10,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,11,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,11,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,11,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,12,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,12,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,12,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,13,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,13,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,13,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,14,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,14,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,14,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,15,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,15,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,15,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,16,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,16,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,16,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,17,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,17,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,17,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,18,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,18,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,18,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,19,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,19,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,19,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,20,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,20,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,20,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,21,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,21,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,21,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,22,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,22,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,22,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,23,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,23,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,23,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,24,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,24,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,24,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,25,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,25,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,25,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,26,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,26,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,26,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,27,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,27,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,27,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,28,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,28,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,28,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,29,6,7,2,0);
INSERT INTO `dtb_blocposition` VALUES (2,29,6,8,1,0);
INSERT INTO `dtb_blocposition` VALUES (2,29,10,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,1,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,1,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,1,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,1,3,4,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,1,3,6,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,1,3,8,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,1,4,10,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,1,10,9,1,1);
INSERT INTO `dtb_blocposition` VALUES (10,2,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,2,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,2,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,2,2,4,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,2,4,11,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,3,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,3,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,3,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,3,4,11,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,4,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,4,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,4,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,5,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,5,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,5,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,6,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,6,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,6,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,7,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,7,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,7,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,8,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,8,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,8,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,9,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,9,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,9,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,10,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,10,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,10,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,11,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,11,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,11,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,12,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,12,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,12,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,13,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,13,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,13,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,14,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,14,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,14,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,15,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,15,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,15,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,16,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,16,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,16,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,17,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,17,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,17,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,18,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,18,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,18,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,19,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,19,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,19,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,20,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,20,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,20,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,21,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,21,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,21,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,22,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,22,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,22,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,23,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,23,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,23,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,24,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,24,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,24,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,25,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,25,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,25,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,26,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,26,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,26,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,27,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,27,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,27,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,28,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,28,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,28,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,29,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,29,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,29,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,31,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,31,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,31,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,32,1,1,2,0);
INSERT INTO `dtb_blocposition` VALUES (10,32,1,2,3,0);
INSERT INTO `dtb_blocposition` VALUES (10,32,1,3,1,0);
INSERT INTO `dtb_blocposition` VALUES (10,47,4,5,1,0);
/*!40000 ALTER TABLE `dtb_blocposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_category`
--

DROP TABLE IF EXISTS `dtb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_category` (
  `category_id` int NOT NULL,
  `category_name` text,
  `parent_category_id` int NOT NULL DEFAULT '0',
  `level` int NOT NULL,
  `RANK` int DEFAULT NULL,
  `creator_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `del_flg` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_category`
--

LOCK TABLES `dtb_category` WRITE;
/*!40000 ALTER TABLE `dtb_category` DISABLE KEYS */;
INSERT INTO `dtb_category` VALUES (1,'食品',0,1,5,2,'2021-01-13 01:40:19','2021-01-13 01:40:19',0);
INSERT INTO `dtb_category` VALUES (2,'雑貨',0,1,6,2,'2021-01-13 01:40:19','2021-01-13 01:40:19',0);
INSERT INTO `dtb_category` VALUES (3,'お菓子',1,2,3,2,'2021-01-13 01:40:19','2021-01-13 01:40:19',0);
INSERT INTO `dtb_category` VALUES (4,'なべ',1,2,4,2,'2021-01-13 01:40:19','2021-01-13 01:40:19',0);
INSERT INTO `dtb_category` VALUES (6,'レシピ',0,1,1,2,'2021-01-13 01:40:20','2021-01-13 01:40:20',0);
/*!40000 ALTER TABLE `dtb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_category_category_id_seq`
--

DROP TABLE IF EXISTS `dtb_category_category_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_category_category_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_category_category_id_seq`
--

LOCK TABLES `dtb_category_category_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_category_category_id_seq` DISABLE KEYS */;
INSERT INTO `dtb_category_category_id_seq` VALUES (6);
/*!40000 ALTER TABLE `dtb_category_category_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_category_count`
--

DROP TABLE IF EXISTS `dtb_category_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_category_count` (
  `category_id` int NOT NULL,
  `product_count` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_category_count`
--

LOCK TABLES `dtb_category_count` WRITE;
/*!40000 ALTER TABLE `dtb_category_count` DISABLE KEYS */;
INSERT INTO `dtb_category_count` VALUES (3,1,'2021-08-19 08:39:07');
INSERT INTO `dtb_category_count` VALUES (4,2,'2021-08-19 08:39:07');
INSERT INTO `dtb_category_count` VALUES (6,0,'2021-10-02 06:47:03');
/*!40000 ALTER TABLE `dtb_category_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_category_total_count`
--

DROP TABLE IF EXISTS `dtb_category_total_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_category_total_count` (
  `category_id` int NOT NULL,
  `product_count` int DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_category_total_count`
--

LOCK TABLES `dtb_category_total_count` WRITE;
/*!40000 ALTER TABLE `dtb_category_total_count` DISABLE KEYS */;
INSERT INTO `dtb_category_total_count` VALUES (1,3,'2021-08-19 08:39:07');
INSERT INTO `dtb_category_total_count` VALUES (3,1,'2021-08-19 08:39:07');
INSERT INTO `dtb_category_total_count` VALUES (4,2,'2021-08-19 08:39:07');
INSERT INTO `dtb_category_total_count` VALUES (6,0,'2021-10-02 06:47:03');
/*!40000 ALTER TABLE `dtb_category_total_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_class`
--

DROP TABLE IF EXISTS `dtb_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_class` (
  `class_id` int NOT NULL,
  `name` text,
  `RANK` int DEFAULT NULL,
  `creator_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `del_flg` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_class`
--

LOCK TABLES `dtb_class` WRITE;
/*!40000 ALTER TABLE `dtb_class` DISABLE KEYS */;
INSERT INTO `dtb_class` VALUES (1,'味',1,2,'2021-01-13 01:40:20','2021-01-13 01:40:20',0);
INSERT INTO `dtb_class` VALUES (2,'大きさ',2,2,'2021-01-13 01:40:20','2021-01-13 01:40:20',0);
/*!40000 ALTER TABLE `dtb_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_class_class_id_seq`
--

DROP TABLE IF EXISTS `dtb_class_class_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_class_class_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_class_class_id_seq`
--

LOCK TABLES `dtb_class_class_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_class_class_id_seq` DISABLE KEYS */;
INSERT INTO `dtb_class_class_id_seq` VALUES (2);
/*!40000 ALTER TABLE `dtb_class_class_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_classcategory`
--

DROP TABLE IF EXISTS `dtb_classcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_classcategory` (
  `classcategory_id` int NOT NULL,
  `name` text,
  `class_id` int NOT NULL,
  `RANK` int DEFAULT NULL,
  `creator_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `del_flg` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`classcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_classcategory`
--

LOCK TABLES `dtb_classcategory` WRITE;
/*!40000 ALTER TABLE `dtb_classcategory` DISABLE KEYS */;
INSERT INTO `dtb_classcategory` VALUES (0,NULL,0,0,0,'2021-01-13 01:40:20','2021-01-13 01:40:20',0);
INSERT INTO `dtb_classcategory` VALUES (1,'バニラ',1,1,2,'2021-01-13 01:40:20','2021-01-13 01:40:20',0);
INSERT INTO `dtb_classcategory` VALUES (2,'チョコ',1,2,2,'2021-01-13 01:40:20','2021-01-13 01:40:20',0);
INSERT INTO `dtb_classcategory` VALUES (3,'抹茶',1,3,2,'2021-01-13 01:40:20','2021-01-13 01:40:20',0);
INSERT INTO `dtb_classcategory` VALUES (4,'L',2,1,2,'2021-01-13 01:40:20','2021-01-13 01:40:20',0);
INSERT INTO `dtb_classcategory` VALUES (5,'M',2,2,2,'2021-01-13 01:40:20','2021-01-13 01:40:20',0);
INSERT INTO `dtb_classcategory` VALUES (6,'S',2,3,2,'2021-01-13 01:40:20','2021-01-13 01:40:20',0);
/*!40000 ALTER TABLE `dtb_classcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_classcategory_classcategory_id_seq`
--

DROP TABLE IF EXISTS `dtb_classcategory_classcategory_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_classcategory_classcategory_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_classcategory_classcategory_id_seq`
--

LOCK TABLES `dtb_classcategory_classcategory_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_classcategory_classcategory_id_seq` DISABLE KEYS */;
INSERT INTO `dtb_classcategory_classcategory_id_seq` VALUES (6);
/*!40000 ALTER TABLE `dtb_classcategory_classcategory_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_csv`
--

DROP TABLE IF EXISTS `dtb_csv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_csv` (
  `no` int NOT NULL,
  `csv_id` int NOT NULL,
  `col` text,
  `disp_name` text,
  `RANK` int DEFAULT NULL,
  `rw_flg` smallint DEFAULT '1',
  `status` smallint NOT NULL DEFAULT '1',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `mb_convert_kana_option` text,
  `size_const_type` text,
  `error_check_types` text,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_csv`
--

LOCK TABLES `dtb_csv` WRITE;
/*!40000 ALTER TABLE `dtb_csv` DISABLE KEYS */;
INSERT INTO `dtb_csv` VALUES (1,1,'product_id','商品ID',1,3,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (2,1,'product_class_id','商品規格ID',2,3,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (3,1,'parent_classcategory_id','親規格分類ID',3,2,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (4,1,'classcategory_id','規格分類ID',4,2,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (5,1,'parent_classcategory_name','親規格分類名',5,2,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','STEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (6,1,'classcategory_name','規格分類名',6,2,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','STEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (7,1,'maker_id','メーカーID',7,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (8,1,'(SELECT name as maker_name FROM dtb_maker WHERE prdcls.maker_id = dtb_maker.maker_id) as maker_name','メーカー名',8,2,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','STEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (9,1,'name','商品名',9,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','STEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,EXIST_CHECK');
INSERT INTO `dtb_csv` VALUES (10,1,'status','表示ステータス(公開・非公開)',10,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (11,1,'comment1','メーカーURL(コメント1)',11,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','URL_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,URL_CHECK');
INSERT INTO `dtb_csv` VALUES (12,1,'comment2','コメント2',12,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LLTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (13,1,'comment3','検索ワード(コメント3)',13,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LLTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (14,1,'comment4','コメント4',14,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LLTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (15,1,'comment5','コメント5',15,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LLTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (16,1,'comment6','コメント6',16,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LLTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (17,1,'note','備考欄(SHOP専用)',17,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LLTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (18,1,'main_list_comment','一覧-メインコメント',18,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','MTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,EXIST_CHECK');
INSERT INTO `dtb_csv` VALUES (19,1,'main_list_image','一覧-メイン画像',19,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,'LTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,FILE_EXISTS');
INSERT INTO `dtb_csv` VALUES (20,1,'main_comment','詳細-メインコメント',20,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LLTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,EXIST_CHECK,HTML_TAG_CHECK');
INSERT INTO `dtb_csv` VALUES (21,1,'main_image','詳細-メイン画像',21,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,'LTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,FILE_EXISTS');
INSERT INTO `dtb_csv` VALUES (22,1,'main_large_image','詳細-メイン拡大画像 ',22,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,'LTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,FILE_EXISTS');
INSERT INTO `dtb_csv` VALUES (23,1,'sub_title1','詳細-サブタイトル(1)',23,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','STEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (24,1,'sub_comment1','詳細-サブコメント(1)',24,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LLTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,HTML_TAG_CHECK');
INSERT INTO `dtb_csv` VALUES (25,1,'sub_image1','詳細-サブ画像(1)',25,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,'LTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,FILE_EXISTS');
INSERT INTO `dtb_csv` VALUES (26,1,'sub_large_image1','詳細-サブ拡大画像(1)',26,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,'LTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,FILE_EXISTS');
INSERT INTO `dtb_csv` VALUES (27,1,'sub_title2','詳細-サブタイトル(2)',27,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','STEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (28,1,'sub_comment2','詳細-サブコメント(2)',28,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LLTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (29,1,'sub_image2','詳細-サブ画像(2)',29,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,'LTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,FILE_EXISTS');
INSERT INTO `dtb_csv` VALUES (30,1,'sub_large_image2','詳細-サブ拡大画像(2)',30,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,'LTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,FILE_EXISTS');
INSERT INTO `dtb_csv` VALUES (31,1,'sub_title3','詳細-サブタイトル(3)',31,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,'STEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (32,1,'sub_comment3','詳細-サブコメント(3)',32,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LLTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (33,1,'sub_image3','詳細-サブ画像(3)',33,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,'LTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,FILE_EXISTS');
INSERT INTO `dtb_csv` VALUES (34,1,'sub_large_image3','詳細-サブ拡大画像(3)',34,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,'LTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,FILE_EXISTS');
INSERT INTO `dtb_csv` VALUES (35,1,'sub_title4','詳細-サブタイトル(4)',35,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','STEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (36,1,'sub_comment4','詳細-サブコメント(4)',36,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LLTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (37,1,'sub_image4','詳細-サブ画像(4)',37,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,'LTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,FILE_EXISTS');
INSERT INTO `dtb_csv` VALUES (38,1,'sub_large_image4','詳細-サブ拡大画像(4)',38,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,'LTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,FILE_EXISTS');
INSERT INTO `dtb_csv` VALUES (39,1,'sub_title5','詳細-サブタイトル(5)',39,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','STEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (40,1,'sub_comment5','詳細-サブコメント(5)',40,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LLTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (41,1,'sub_image5','詳細-サブ画像(5)',41,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,'LTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,FILE_EXISTS');
INSERT INTO `dtb_csv` VALUES (42,1,'sub_large_image5','詳細-サブ拡大画像(5)',42,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,'LTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,FILE_EXISTS');
INSERT INTO `dtb_csv` VALUES (43,1,'deliv_date_id','発送日目安ID',43,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (44,1,'del_flg','削除フラグ',44,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (45,1,'product_type_id','商品種別ID',45,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (46,1,'product_code','商品コード',46,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','STEXT_LEN','EXIST_CHECK,SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (47,1,'stock','在庫数',47,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','AMOUNT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (48,1,'stock_unlimited','在庫無制限フラグ',48,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (49,1,'sale_limit','販売制限数',49,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','AMOUNT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (50,1,'price01','通常価格',50,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','PRICE_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (51,1,'price02','販売価格',51,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','PRICE_LEN','NUM_CHECK,MAX_LENGTH_CHECK,EXIST_CHECK');
INSERT INTO `dtb_csv` VALUES (52,1,'deliv_fee','送料',52,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','PRICE_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (53,1,'point_rate','ポイント付与率',53,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','PERCENTAGE_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (54,1,'down_filename','ダウンロードファイル名',54,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','STEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (55,1,'down_realfilename','ダウンロード実ファイル',55,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,'LTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,DOWN_FILE_EXISTS');
INSERT INTO `dtb_csv` VALUES (56,1,'(SELECT recommend_product_id FROM dtb_recommend_products WHERE prdcls.product_id = dtb_recommend_products.product_id ORDER BY `RANK` DESC, recommend_product_id DESC limit 1 offset 0) AS recommend_product_id1','関連商品ID(1)',56,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (57,1,'(SELECT comment FROM dtb_recommend_products WHERE prdcls.product_id = dtb_recommend_products.product_id ORDER BY `RANK` DESC, recommend_product_id DESC limit 1 offset 0) AS recommend_comment1','関連商品コメント(1)',57,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LLTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (58,1,'(SELECT recommend_product_id FROM dtb_recommend_products WHERE prdcls.product_id = dtb_recommend_products.product_id ORDER BY `RANK` DESC, recommend_product_id DESC limit 1 offset 1) AS recommend_product_id2','関連商品ID(2)',58,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (59,1,'(SELECT comment FROM dtb_recommend_products WHERE prdcls.product_id = dtb_recommend_products.product_id ORDER BY `RANK` DESC, recommend_product_id DESC limit 1 offset 1) AS recommend_comment2','関連商品コメント(2)',59,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LLTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (60,1,'(SELECT recommend_product_id FROM dtb_recommend_products WHERE prdcls.product_id = dtb_recommend_products.product_id ORDER BY `RANK` DESC, recommend_product_id DESC limit 1 offset 2) AS recommend_product_id3','関連商品ID(3)',60,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (61,1,'(SELECT comment FROM dtb_recommend_products WHERE prdcls.product_id = dtb_recommend_products.product_id ORDER BY `RANK` DESC, recommend_product_id DESC limit 1 offset 2) AS recommend_comment3','関連商品コメント(3)',61,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LLTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (62,1,'(SELECT recommend_product_id FROM dtb_recommend_products WHERE prdcls.product_id = dtb_recommend_products.product_id ORDER BY `RANK` DESC, recommend_product_id DESC limit 1 offset 3) AS recommend_product_id4','関連商品ID(4)',62,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (63,1,'(SELECT comment FROM dtb_recommend_products WHERE prdcls.product_id = dtb_recommend_products.product_id ORDER BY `RANK` DESC, recommend_product_id DESC limit 1 offset 3) AS recommend_comment4','関連商品コメント(4)',63,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LLTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (64,1,'(SELECT recommend_product_id FROM dtb_recommend_products WHERE prdcls.product_id = dtb_recommend_products.product_id ORDER BY `RANK` DESC, recommend_product_id DESC limit 1 offset 4) AS recommend_product_id5','関連商品ID(5)',64,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (65,1,'(SELECT comment FROM dtb_recommend_products WHERE prdcls.product_id = dtb_recommend_products.product_id ORDER BY `RANK` DESC, recommend_product_id DESC limit 1 offset 4) AS recommend_comment5','関連商品コメント(5)',65,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LLTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (66,1,'(SELECT recommend_product_id FROM dtb_recommend_products WHERE prdcls.product_id = dtb_recommend_products.product_id ORDER BY `RANK` DESC, recommend_product_id DESC limit 1 offset 5) AS recommend_product_id6','関連商品ID(6)',66,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (67,1,'(SELECT comment FROM dtb_recommend_products WHERE prdcls.product_id = dtb_recommend_products.product_id ORDER BY `RANK` DESC, recommend_product_id DESC limit 1 offset 5) AS recommend_comment6','関連商品コメント(6)',67,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LLTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (68,1,'(SELECT ARRAY_TO_STRING(ARRAY(SELECT product_status_id FROM dtb_product_status WHERE dtb_product_status.product_id = prdcls.product_id and del_flg = 0 ORDER BY dtb_product_status.product_status_id), \',\')) as product_statuses','商品ステータス',68,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','STEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (69,1,'(SELECT ARRAY_TO_STRING(ARRAY(SELECT name FROM dtb_product_status LEFT JOIN mtb_status ON  dtb_product_status.product_status_id = mtb_status.id  WHERE dtb_product_status.product_id = prdcls.product_id and del_flg = 0 ORDER BY dtb_product_status.product_status_id), \',\')) as product_status_names','商品ステータス名',69,2,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (70,1,'(SELECT ARRAY_TO_STRING(ARRAY(SELECT category_id FROM dtb_product_categories WHERE dtb_product_categories.product_id = prdcls.product_id ORDER BY dtb_product_categories.`RANK`), \',\')) as category_ids','カテゴリID',70,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,EXIST_CHECK');
INSERT INTO `dtb_csv` VALUES (71,1,'(SELECT ARRAY_TO_STRING(ARRAY(SELECT category_name FROM dtb_product_categories LEFT JOIN dtb_category ON dtb_product_categories.category_id = dtb_category.category_id WHERE dtb_product_categories.product_id = prdcls.product_id ORDER BY dtb_product_categories.`RANK`), \',\')) as category_names','カテゴリ名',71,2,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','LTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (72,2,'customer_id','会員ID',1,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (73,2,'name01','お名前(姓)',2,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (74,2,'name02','お名前(名)',3,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (75,2,'kana01','お名前(フリガナ・姓)',4,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (76,2,'kana02','お名前(フリガナ・名)',5,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (77,2,'company_name','会社名',6,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa',NULL,NULL);
INSERT INTO `dtb_csv` VALUES (78,2,'zip01','郵便番号1',7,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (79,2,'zip02','郵便番号2',8,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (80,2,'zipcode','ZIP CODE',9,1,0,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (81,2,'(SELECT name FROM mtb_country WHERE mtb_country.id = dtb_customer.country_id) as country','国',10,1,0,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (82,2,'(SELECT name FROM mtb_pref WHERE mtb_pref.id = dtb_customer.pref) as pref','都道府県',11,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (83,2,'addr01','住所1',12,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (84,2,'addr02','住所2',13,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (85,2,'email','E-MAIL',14,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (86,2,'tel01','TEL1',15,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (87,2,'tel02','TEL2',16,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (88,2,'tel03','TEL3',17,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (89,2,'fax01','FAX1',18,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (90,2,'fax02','FAX2',19,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (91,2,'fax03','FAX3',20,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (92,2,'(SELECT name FROM mtb_sex WHERE mtb_sex.id = dtb_customer.sex) as sex','性別',21,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (93,2,'(SELECT name FROM mtb_job WHERE mtb_job.id = dtb_customer.job) as job','職業',22,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (94,2,'birth','誕生日',23,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (95,2,'first_buy_date','初回購入日',24,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (96,2,'last_buy_date','最終購入日',25,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (97,2,'buy_times','購入回数',26,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (98,2,'point','ポイント残高',27,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (99,2,'note','備考',28,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (100,2,'create_date','登録日',29,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (101,2,'update_date','更新日',30,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20',NULL,NULL,NULL);
INSERT INTO `dtb_csv` VALUES (102,3,'order_id','注文番号',1,3,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (103,3,'customer_id','会員ID',2,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (104,3,'message','要望等',3,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','STEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (105,3,'order_name01','お名前(姓)',4,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','STEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,EXIST_CHECK');
INSERT INTO `dtb_csv` VALUES (106,3,'order_name02','お名前(名)',5,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','STEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,EXIST_CHECK');
INSERT INTO `dtb_csv` VALUES (107,3,'order_kana01','お名前(フリガナ・姓)',6,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVCa','STEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (108,3,'order_kana02','お名前(フリガナ名)',7,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVCa','STEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (109,3,'order_company_name','会社名',8,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa',NULL,NULL);
INSERT INTO `dtb_csv` VALUES (110,3,'order_email','メールアドレス',9,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','a','null','NO_SPTAB,EMAIL_CHECK,EMAIL_CHAR_CHECK');
INSERT INTO `dtb_csv` VALUES (111,3,'order_tel01','電話番号1',10,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','TEL_ITEM_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (112,3,'order_tel02','電話番号2',11,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','TEL_ITEM_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (113,3,'order_tel03','電話番号3',12,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','TEL_ITEM_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (114,3,'order_fax01','FAX1',13,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','TEL_ITEM_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (115,3,'order_fax02','FAX2',14,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','TEL_ITEM_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (116,3,'order_fax03','FAX3',15,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','TEL_ITEM_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (117,3,'order_zip01','郵便番号1',16,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','ZIP01_LEN','MAX_LENGTH_CHECK,NUM_CHECK,NUM_COUNT_CHECK');
INSERT INTO `dtb_csv` VALUES (118,3,'order_zip02','郵便番号2',17,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','ZIP02_LEN','MAX_LENGTH_CHECK,NUM_CHECK,NUM_COUNT_CHECK');
INSERT INTO `dtb_csv` VALUES (119,3,'order_zipcode','ZIP CODE',18,1,0,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','STEXT_LEN','GRAPH_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (120,3,'(SELECT name FROM mtb_country WHERE mtb_country.id = dtb_order.order_country_id) as country','国',19,1,0,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (121,3,'(SELECT name FROM mtb_pref WHERE mtb_pref.id = dtb_order.order_pref) as pref','都道府県',20,2,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','n','INT_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (122,3,'order_addr01','住所1',21,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','MTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (123,3,'order_addr02','住所2',23,1,1,'2021-01-13 01:40:20','2021-01-13 01:40:20','KVa','MTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (124,3,'order_sex','性別',23,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','INT_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (125,3,'order_birth','生年月日',24,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','INT_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (126,3,'order_job','職種',25,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','INT_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (127,3,'subtotal','小計',38,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','PRICE_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (128,3,'discount','値引き',39,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','PRICE_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (129,3,'deliv_fee','送料',40,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','PRICE_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (130,3,'charge','手数料',41,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','PRICE_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (131,3,'use_point','使用ポイント',42,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','PRICE_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (132,3,'add_point','加算ポイント',43,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','PRICE_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (133,3,'tax','税金',44,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','PRICE_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (134,3,'total','合計',45,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','PRICE_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (135,3,'payment_total','お支払い合計',46,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','PRICE_LEN','MAX_LENGTH_CHECK,NUM_CHECK');
INSERT INTO `dtb_csv` VALUES (136,3,'deliv_id','配送業者ID',47,2,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (137,3,'payment_method','支払い方法',48,2,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','KVa','STEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (138,3,'note','SHOPメモ',50,2,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','KVa','LLTEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (139,3,'status','対応状況',51,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','KVa','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (140,3,'create_date','注文日時',52,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','a','','CHECK_DATE');
INSERT INTO `dtb_csv` VALUES (141,3,'update_date','更新日時',53,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','a','','CHECK_DATE');
INSERT INTO `dtb_csv` VALUES (142,3,'commit_date','発送完了日時',54,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','a','','CHECK_DATE');
INSERT INTO `dtb_csv` VALUES (143,3,'device_type_id','端末種別ID',55,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (144,3,'(SELECT ARRAY_TO_STRING(ARRAY(SELECT shipping_id FROM dtb_shipping WHERE dtb_shipping.order_id = dtb_order.order_id), \',\')) as shipping_ids','配送情報ID',57,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','KVa','STEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (145,4,'B.name','商品名',1,2,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','KVa','STEXT_LEN','MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (146,4,'(SELECT name FROM mtb_disp WHERE mtb_disp.id = A.status) as status','レビュー表示',2,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','KVa','STEXT_LEN','MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (147,4,'A.create_date','投稿日',3,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','a','','CHECK_DATE,EXIST_CHECK');
INSERT INTO `dtb_csv` VALUES (148,4,'A.reviewer_name','投稿者名',4,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','KVa','STEXT_LEN','MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (149,4,'A.reviewer_url','投稿者URL',5,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','KVas','STEXT_LEN','MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (150,4,'(SELECT name FROM mtb_sex WHERE mtb_sex.id = A.sex) as sex','性別',6,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','KVa','STEXT_LEN','MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (151,4,'(SELECT name FROM mtb_recommend WHERE mtb_recommend.id = A.recommend_level) as recommend_level','おすすめレベル',7,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (152,4,'A.title','タイトル',8,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','KVa','STEXT_LEN','MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (153,4,'A.comment','コメント',9,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','KVa','LTEXT_LEN','MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (154,5,'category_id','カテゴリID',1,3,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (155,5,'category_name','カテゴリ名',2,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','KVa','STEXT_LEN','SPTAB_CHECK,MAX_LENGTH_CHECK,EXIST_CHECK');
INSERT INTO `dtb_csv` VALUES (156,5,'parent_category_id','親カテゴリID',3,1,1,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (157,5,'level','階層',NULL,2,2,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (158,5,'`RANK`','表示ランク',NULL,2,2,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
INSERT INTO `dtb_csv` VALUES (159,5,'del_flg','削除フラグ',NULL,1,2,'2021-01-13 01:40:21','2021-01-13 01:40:21','n','INT_LEN','NUM_CHECK,MAX_LENGTH_CHECK');
/*!40000 ALTER TABLE `dtb_csv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_csv_sql`
--

DROP TABLE IF EXISTS `dtb_csv_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_csv_sql` (
  `sql_id` int NOT NULL,
  `sql_name` text NOT NULL,
  `csv_sql` text,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  PRIMARY KEY (`sql_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_csv_sql`
--

LOCK TABLES `dtb_csv_sql` WRITE;
/*!40000 ALTER TABLE `dtb_csv_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_csv_sql` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_csv_sql_sql_id_seq`
--

DROP TABLE IF EXISTS `dtb_csv_sql_sql_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_csv_sql_sql_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_csv_sql_sql_id_seq`
--

LOCK TABLES `dtb_csv_sql_sql_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_csv_sql_sql_id_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_csv_sql_sql_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_customer`
--

DROP TABLE IF EXISTS `dtb_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_customer` (
  `customer_id` int NOT NULL,
  `name01` text NOT NULL,
  `name02` text NOT NULL,
  `kana01` text,
  `kana02` text,
  `company_name` text,
  `zip01` text,
  `zip02` text,
  `zipcode` text,
  `country_id` int DEFAULT NULL,
  `pref` smallint DEFAULT NULL,
  `addr01` text,
  `addr02` text,
  `email` text NOT NULL,
  `email_mobile` text,
  `tel01` text,
  `tel02` text,
  `tel03` text,
  `fax01` text,
  `fax02` text,
  `fax03` text,
  `sex` smallint DEFAULT NULL,
  `job` smallint DEFAULT NULL,
  `birth` datetime DEFAULT NULL,
  `password` text,
  `reminder` smallint DEFAULT NULL,
  `reminder_answer` text,
  `salt` text,
  `secret_key` text NOT NULL,
  `first_buy_date` datetime DEFAULT NULL,
  `last_buy_date` datetime DEFAULT NULL,
  `buy_times` decimal(10,0) DEFAULT '0',
  `buy_total` decimal(10,0) DEFAULT '0',
  `point` decimal(10,0) NOT NULL DEFAULT '0',
  `note` text,
  `status` smallint NOT NULL DEFAULT '1',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `del_flg` smallint NOT NULL DEFAULT '0',
  `mobile_phone_id` text,
  `mailmaga_flg` smallint DEFAULT NULL,
  `default_payment_id` smallint DEFAULT NULL,
  `nickname` text,
  `self_introduction` text,
  `hobbies` text,
  `profile_image` text,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `secret_key` (`secret_key`(255)),
  KEY `dtb_customer_mobile_phone_id_key` (`mobile_phone_id`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_customer`
--

LOCK TABLES `dtb_customer` WRITE;
/*!40000 ALTER TABLE `dtb_customer` DISABLE KEYS */;
INSERT INTO `dtb_customer` VALUES (1,'テストA','テスト','テスト','テスト',NULL,'111','1111',NULL,392,1,'テスト','テスト','a@localhost',NULL,'011','111','1111',NULL,NULL,NULL,NULL,NULL,'2001-01-01 00:00:00','7c11d8dd22dd53774fa9513648ea968c69f5b732f0de7f42b78d41343df01ef7',NULL,NULL,'claihaiwae','test0001',NULL,NULL,0,0,0,NULL,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,NULL,NULL,6,'Aさん','テスト\r\nテスト',NULL,NULL);
INSERT INTO `dtb_customer` VALUES (2,'テストB','テスト','テスト','テスト',NULL,'222','2222',NULL,392,2,'テスト','テスト','b@localhost',NULL,'022','222','2222',NULL,NULL,NULL,NULL,NULL,'2002-02-02 00:00:00','7c11d8dd22dd53774fa9513648ea968c69f5b732f0de7f42b78d41343df01ef7',NULL,NULL,'claihaiwae','test0002',NULL,NULL,0,0,0,NULL,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,NULL,NULL,6,'Bさん','テスト\r\nテスト',NULL,NULL);
INSERT INTO `dtb_customer` VALUES (3,'テストC','テスト','テスト','テスト',NULL,'333','3333',NULL,392,3,'テスト','テスト','c@localhost',NULL,'033','333','3333',NULL,NULL,NULL,NULL,NULL,'2003-03-03 00:00:00','7c11d8dd22dd53774fa9513648ea968c69f5b732f0de7f42b78d41343df01ef7',NULL,NULL,'claihaiwae','test0003',NULL,NULL,0,0,0,NULL,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,NULL,NULL,6,'Cさん','テスト\r\nテスト',NULL,NULL);
INSERT INTO `dtb_customer` VALUES (4,'テストD','テスト','テスト','テスト',NULL,'444','4444',NULL,392,4,'テスト','テスト','d@localhost',NULL,'044','444','4444',NULL,NULL,NULL,NULL,NULL,'2004-04-04 00:00:00','7c11d8dd22dd53774fa9513648ea968c69f5b732f0de7f42b78d41343df01ef7',NULL,NULL,'claihaiwae','test0004',NULL,NULL,0,0,0,NULL,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,NULL,NULL,6,'Dさん','テスト\r\nテスト',NULL,NULL);
INSERT INTO `dtb_customer` VALUES (5,'テストE','テスト','テスト','テスト',NULL,'555','5555',NULL,392,5,'テスト','テスト','e@localhost',NULL,'055','555','5555',NULL,NULL,NULL,NULL,NULL,'2005-05-05 00:00:00','7c11d8dd22dd53774fa9513648ea968c69f5b732f0de7f42b78d41343df01ef7',NULL,NULL,'claihaiwae','test0005',NULL,NULL,0,0,0,NULL,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,NULL,NULL,6,'Eさん','テスト\r\nテスト',NULL,NULL);
INSERT INTO `dtb_customer` VALUES (6,'テストF','テスト','テスト','テスト',NULL,'666','6666',NULL,392,6,'テスト','テスト','f@localhost',NULL,'066','666','6666',NULL,NULL,NULL,NULL,NULL,'2006-06-06 00:00:00','7c11d8dd22dd53774fa9513648ea968c69f5b732f0de7f42b78d41343df01ef7',NULL,NULL,'claihaiwae','test0006',NULL,NULL,0,0,0,NULL,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,NULL,NULL,6,'Fさん','テスト\r\nテスト',NULL,NULL);
INSERT INTO `dtb_customer` VALUES (7,'テストG','テスト','テスト','テスト',NULL,'777','7777',NULL,392,7,'テスト','テスト','g@localhost',NULL,'077','777','7777',NULL,NULL,NULL,NULL,NULL,'2007-07-07 00:00:00','7c11d8dd22dd53774fa9513648ea968c69f5b732f0de7f42b78d41343df01ef7',NULL,NULL,'claihaiwae','test0007',NULL,NULL,0,0,0,NULL,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,NULL,NULL,6,'Gさん','テスト\r\nテスト',NULL,NULL);
INSERT INTO `dtb_customer` VALUES (8,'テストH','テスト','テスト','テスト',NULL,'888','8888',NULL,392,8,'テスト','テスト','h@localhost',NULL,'088','888','8888',NULL,NULL,NULL,NULL,NULL,'2008-08-08 00:00:00','7c11d8dd22dd53774fa9513648ea968c69f5b732f0de7f42b78d41343df01ef7',NULL,NULL,'claihaiwae','test0008',NULL,NULL,0,0,0,NULL,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,NULL,NULL,6,'Hさん','テスト\r\nテスト',NULL,NULL);
INSERT INTO `dtb_customer` VALUES (9,'テストI','テスト','テスト','テスト',NULL,'999','9999',NULL,392,9,'テスト','テスト','i@localhost',NULL,'099','999','9999',NULL,NULL,NULL,NULL,NULL,'2009-09-09 00:00:00','7c11d8dd22dd53774fa9513648ea968c69f5b732f0de7f42b78d41343df01ef7',NULL,NULL,'claihaiwae','test0009',NULL,NULL,0,0,0,NULL,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,NULL,NULL,6,'Iさん','テスト\r\nテスト',NULL,NULL);
INSERT INTO `dtb_customer` VALUES (10,'テストJ','テスト','テスト','テスト',NULL,'000','0000',NULL,392,0,'テスト','テスト','j@localhost',NULL,'000','000','0000',NULL,NULL,NULL,NULL,NULL,'2010-10-10 00:00:00','7c11d8dd22dd53774fa9513648ea968c69f5b732f0de7f42b78d41343df01ef7',NULL,NULL,'claihaiwae','test0010',NULL,NULL,0,0,0,NULL,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,NULL,NULL,6,'Jさん','テスト\r\nテスト',NULL,NULL);
/*!40000 ALTER TABLE `dtb_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_customer_customer_id_seq`
--

DROP TABLE IF EXISTS `dtb_customer_customer_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_customer_customer_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_customer_customer_id_seq`
--

LOCK TABLES `dtb_customer_customer_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_customer_customer_id_seq` DISABLE KEYS */;
INSERT INTO `dtb_customer_customer_id_seq` VALUES (10);
/*!40000 ALTER TABLE `dtb_customer_customer_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_customer_favorite_products`
--

DROP TABLE IF EXISTS `dtb_customer_favorite_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_customer_favorite_products` (
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `target_id` int NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`,`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_customer_favorite_products`
--

LOCK TABLES `dtb_customer_favorite_products` WRITE;
/*!40000 ALTER TABLE `dtb_customer_favorite_products` DISABLE KEYS */;
INSERT INTO `dtb_customer_favorite_products` VALUES (1,1,'2021-10-06 00:00:00','2021-10-06 00:00:00',8);
INSERT INTO `dtb_customer_favorite_products` VALUES (1,1,'2021-10-06 00:00:00','2021-10-06 00:00:00',9);
INSERT INTO `dtb_customer_favorite_products` VALUES (3,3,'2021-10-06 00:00:00','2021-10-06 00:00:00',2);
INSERT INTO `dtb_customer_favorite_products` VALUES (4,5,'2021-10-06 00:00:00','2021-10-06 00:00:00',3);
INSERT INTO `dtb_customer_favorite_products` VALUES (5,7,'2021-10-06 00:00:00','2021-10-06 00:00:00',5);
INSERT INTO `dtb_customer_favorite_products` VALUES (5,7,'2021-10-06 00:00:00','2021-10-06 00:00:00',13);
INSERT INTO `dtb_customer_favorite_products` VALUES (6,8,'2021-10-06 00:00:00','2021-10-06 00:00:00',7);
INSERT INTO `dtb_customer_favorite_products` VALUES (7,9,'2021-10-06 00:00:00','2021-10-06 00:00:00',7);
INSERT INTO `dtb_customer_favorite_products` VALUES (8,10,'2021-10-06 00:00:00','2021-10-06 00:00:00',3);
INSERT INTO `dtb_customer_favorite_products` VALUES (9,11,'2021-10-06 00:00:00','2021-10-06 00:00:00',10);
INSERT INTO `dtb_customer_favorite_products` VALUES (9,12,'2021-10-06 00:00:00','2021-10-06 00:00:00',10);
INSERT INTO `dtb_customer_favorite_products` VALUES (10,13,'2021-10-06 00:00:00','2021-10-06 00:00:00',11);
INSERT INTO `dtb_customer_favorite_products` VALUES (10,13,'2021-10-06 00:00:00','2021-10-06 00:00:00',12);
/*!40000 ALTER TABLE `dtb_customer_favorite_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_deliv`
--

DROP TABLE IF EXISTS `dtb_deliv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_deliv` (
  `deliv_id` int NOT NULL,
  `product_type_id` int DEFAULT NULL,
  `name` text,
  `service_name` text,
  `remark` text,
  `confirm_url` text,
  `RANK` int DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1',
  `del_flg` smallint NOT NULL DEFAULT '0',
  `creator_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  PRIMARY KEY (`deliv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_deliv`
--

LOCK TABLES `dtb_deliv` WRITE;
/*!40000 ALTER TABLE `dtb_deliv` DISABLE KEYS */;
INSERT INTO `dtb_deliv` VALUES (1,1,'ネコポス','ネコポス',NULL,NULL,2,1,0,2,'2021-01-13 01:40:21','2021-07-15 08:01:59');
INSERT INTO `dtb_deliv` VALUES (2,2,'配送無し(ダウンロード商品用)','なし',NULL,NULL,1,1,0,2,'2021-01-13 01:40:21','2021-01-13 01:40:21');
/*!40000 ALTER TABLE `dtb_deliv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_deliv_deliv_id_seq`
--

DROP TABLE IF EXISTS `dtb_deliv_deliv_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_deliv_deliv_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_deliv_deliv_id_seq`
--

LOCK TABLES `dtb_deliv_deliv_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_deliv_deliv_id_seq` DISABLE KEYS */;
INSERT INTO `dtb_deliv_deliv_id_seq` VALUES (2);
/*!40000 ALTER TABLE `dtb_deliv_deliv_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_delivfee`
--

DROP TABLE IF EXISTS `dtb_delivfee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_delivfee` (
  `deliv_id` int NOT NULL,
  `fee_id` int NOT NULL,
  `fee` decimal(10,0) NOT NULL,
  `pref` smallint DEFAULT NULL,
  PRIMARY KEY (`deliv_id`,`fee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_delivfee`
--

LOCK TABLES `dtb_delivfee` WRITE;
/*!40000 ALTER TABLE `dtb_delivfee` DISABLE KEYS */;
INSERT INTO `dtb_delivfee` VALUES (1,1,350,1);
INSERT INTO `dtb_delivfee` VALUES (1,2,350,2);
INSERT INTO `dtb_delivfee` VALUES (1,3,350,3);
INSERT INTO `dtb_delivfee` VALUES (1,4,350,4);
INSERT INTO `dtb_delivfee` VALUES (1,5,350,5);
INSERT INTO `dtb_delivfee` VALUES (1,6,350,6);
INSERT INTO `dtb_delivfee` VALUES (1,7,350,7);
INSERT INTO `dtb_delivfee` VALUES (1,8,350,8);
INSERT INTO `dtb_delivfee` VALUES (1,9,350,9);
INSERT INTO `dtb_delivfee` VALUES (1,10,350,10);
INSERT INTO `dtb_delivfee` VALUES (1,11,350,11);
INSERT INTO `dtb_delivfee` VALUES (1,12,350,12);
INSERT INTO `dtb_delivfee` VALUES (1,13,350,13);
INSERT INTO `dtb_delivfee` VALUES (1,14,350,14);
INSERT INTO `dtb_delivfee` VALUES (1,15,350,15);
INSERT INTO `dtb_delivfee` VALUES (1,16,350,16);
INSERT INTO `dtb_delivfee` VALUES (1,17,350,17);
INSERT INTO `dtb_delivfee` VALUES (1,18,350,18);
INSERT INTO `dtb_delivfee` VALUES (1,19,350,19);
INSERT INTO `dtb_delivfee` VALUES (1,20,350,20);
INSERT INTO `dtb_delivfee` VALUES (1,21,350,21);
INSERT INTO `dtb_delivfee` VALUES (1,22,350,22);
INSERT INTO `dtb_delivfee` VALUES (1,23,350,23);
INSERT INTO `dtb_delivfee` VALUES (1,24,350,24);
INSERT INTO `dtb_delivfee` VALUES (1,25,350,25);
INSERT INTO `dtb_delivfee` VALUES (1,26,350,26);
INSERT INTO `dtb_delivfee` VALUES (1,27,350,27);
INSERT INTO `dtb_delivfee` VALUES (1,28,350,28);
INSERT INTO `dtb_delivfee` VALUES (1,29,350,29);
INSERT INTO `dtb_delivfee` VALUES (1,30,350,30);
INSERT INTO `dtb_delivfee` VALUES (1,31,350,31);
INSERT INTO `dtb_delivfee` VALUES (1,32,350,32);
INSERT INTO `dtb_delivfee` VALUES (1,33,350,33);
INSERT INTO `dtb_delivfee` VALUES (1,34,350,34);
INSERT INTO `dtb_delivfee` VALUES (1,35,350,35);
INSERT INTO `dtb_delivfee` VALUES (1,36,350,36);
INSERT INTO `dtb_delivfee` VALUES (1,37,350,37);
INSERT INTO `dtb_delivfee` VALUES (1,38,350,38);
INSERT INTO `dtb_delivfee` VALUES (1,39,350,39);
INSERT INTO `dtb_delivfee` VALUES (1,40,350,40);
INSERT INTO `dtb_delivfee` VALUES (1,41,350,41);
INSERT INTO `dtb_delivfee` VALUES (1,42,350,42);
INSERT INTO `dtb_delivfee` VALUES (1,43,350,43);
INSERT INTO `dtb_delivfee` VALUES (1,44,350,44);
INSERT INTO `dtb_delivfee` VALUES (1,45,350,45);
INSERT INTO `dtb_delivfee` VALUES (1,46,350,46);
INSERT INTO `dtb_delivfee` VALUES (1,47,350,47);
INSERT INTO `dtb_delivfee` VALUES (2,1,0,1);
INSERT INTO `dtb_delivfee` VALUES (2,2,0,2);
INSERT INTO `dtb_delivfee` VALUES (2,3,0,3);
INSERT INTO `dtb_delivfee` VALUES (2,4,0,4);
INSERT INTO `dtb_delivfee` VALUES (2,5,0,5);
INSERT INTO `dtb_delivfee` VALUES (2,6,0,6);
INSERT INTO `dtb_delivfee` VALUES (2,7,0,7);
INSERT INTO `dtb_delivfee` VALUES (2,8,0,8);
INSERT INTO `dtb_delivfee` VALUES (2,9,0,9);
INSERT INTO `dtb_delivfee` VALUES (2,10,0,10);
INSERT INTO `dtb_delivfee` VALUES (2,11,0,11);
INSERT INTO `dtb_delivfee` VALUES (2,12,0,12);
INSERT INTO `dtb_delivfee` VALUES (2,13,0,13);
INSERT INTO `dtb_delivfee` VALUES (2,14,0,14);
INSERT INTO `dtb_delivfee` VALUES (2,15,0,15);
INSERT INTO `dtb_delivfee` VALUES (2,16,0,16);
INSERT INTO `dtb_delivfee` VALUES (2,17,0,17);
INSERT INTO `dtb_delivfee` VALUES (2,18,0,18);
INSERT INTO `dtb_delivfee` VALUES (2,19,0,19);
INSERT INTO `dtb_delivfee` VALUES (2,20,0,20);
INSERT INTO `dtb_delivfee` VALUES (2,21,0,21);
INSERT INTO `dtb_delivfee` VALUES (2,22,0,22);
INSERT INTO `dtb_delivfee` VALUES (2,23,0,23);
INSERT INTO `dtb_delivfee` VALUES (2,24,0,24);
INSERT INTO `dtb_delivfee` VALUES (2,25,0,25);
INSERT INTO `dtb_delivfee` VALUES (2,26,0,26);
INSERT INTO `dtb_delivfee` VALUES (2,27,0,27);
INSERT INTO `dtb_delivfee` VALUES (2,28,0,28);
INSERT INTO `dtb_delivfee` VALUES (2,29,0,29);
INSERT INTO `dtb_delivfee` VALUES (2,30,0,30);
INSERT INTO `dtb_delivfee` VALUES (2,31,0,31);
INSERT INTO `dtb_delivfee` VALUES (2,32,0,32);
INSERT INTO `dtb_delivfee` VALUES (2,33,0,33);
INSERT INTO `dtb_delivfee` VALUES (2,34,0,34);
INSERT INTO `dtb_delivfee` VALUES (2,35,0,35);
INSERT INTO `dtb_delivfee` VALUES (2,36,0,36);
INSERT INTO `dtb_delivfee` VALUES (2,37,0,37);
INSERT INTO `dtb_delivfee` VALUES (2,38,0,38);
INSERT INTO `dtb_delivfee` VALUES (2,39,0,39);
INSERT INTO `dtb_delivfee` VALUES (2,40,0,40);
INSERT INTO `dtb_delivfee` VALUES (2,41,0,41);
INSERT INTO `dtb_delivfee` VALUES (2,42,0,42);
INSERT INTO `dtb_delivfee` VALUES (2,43,0,43);
INSERT INTO `dtb_delivfee` VALUES (2,44,0,44);
INSERT INTO `dtb_delivfee` VALUES (2,45,0,45);
INSERT INTO `dtb_delivfee` VALUES (2,46,0,46);
INSERT INTO `dtb_delivfee` VALUES (2,47,0,47);
/*!40000 ALTER TABLE `dtb_delivfee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_delivtime`
--

DROP TABLE IF EXISTS `dtb_delivtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_delivtime` (
  `deliv_id` int NOT NULL,
  `time_id` int NOT NULL,
  `deliv_time` text NOT NULL,
  PRIMARY KEY (`deliv_id`,`time_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_delivtime`
--

LOCK TABLES `dtb_delivtime` WRITE;
/*!40000 ALTER TABLE `dtb_delivtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_delivtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_holiday`
--

DROP TABLE IF EXISTS `dtb_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_holiday` (
  `holiday_id` int NOT NULL,
  `title` text NOT NULL,
  `month` smallint NOT NULL,
  `day` smallint NOT NULL,
  `RANK` int NOT NULL DEFAULT '0',
  `creator_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `del_flg` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`holiday_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_holiday`
--

LOCK TABLES `dtb_holiday` WRITE;
/*!40000 ALTER TABLE `dtb_holiday` DISABLE KEYS */;
INSERT INTO `dtb_holiday` VALUES (1,'元日(1月1日)',1,1,100,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_holiday` VALUES (2,'成人の日(1月第2月曜日)',1,14,99,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_holiday` VALUES (3,'建国記念の日(2月11日)',2,11,98,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_holiday` VALUES (4,'春分の日(3月21日)',3,21,97,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_holiday` VALUES (5,'昭和の日(4月29日)',4,29,96,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_holiday` VALUES (6,'憲法記念日(5月3日)',5,3,95,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_holiday` VALUES (7,'みどりの日(5月4日)',5,4,94,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_holiday` VALUES (8,'こどもの日(5月5日)',5,5,93,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_holiday` VALUES (9,'海の日(7月第3月曜日)',7,21,92,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_holiday` VALUES (10,'敬老の日(9月第3月曜日)',9,15,91,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_holiday` VALUES (11,'秋分の日(9月23日)',9,23,90,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_holiday` VALUES (12,'体育の日(10月第2月曜日)',10,13,89,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_holiday` VALUES (13,'文化の日(11月3日)',11,3,88,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_holiday` VALUES (14,'勤労感謝の日(11月23日)',11,23,87,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_holiday` VALUES (15,'天皇誕生日(12月23日)',12,23,86,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
/*!40000 ALTER TABLE `dtb_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_holiday_holiday_id_seq`
--

DROP TABLE IF EXISTS `dtb_holiday_holiday_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_holiday_holiday_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_holiday_holiday_id_seq`
--

LOCK TABLES `dtb_holiday_holiday_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_holiday_holiday_id_seq` DISABLE KEYS */;
INSERT INTO `dtb_holiday_holiday_id_seq` VALUES (15);
/*!40000 ALTER TABLE `dtb_holiday_holiday_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_index_list`
--

DROP TABLE IF EXISTS `dtb_index_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_index_list` (
  `table_name` text NOT NULL,
  `column_name` text NOT NULL,
  `recommend_flg` smallint NOT NULL DEFAULT '0',
  `recommend_comment` text,
  PRIMARY KEY (`table_name`(255),`column_name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_index_list`
--

LOCK TABLES `dtb_index_list` WRITE;
/*!40000 ALTER TABLE `dtb_index_list` DISABLE KEYS */;
INSERT INTO `dtb_index_list` VALUES ('dtb_customer','email_mobile',0,'会員数増加時のログイン処理速度を向上させたいときに試してみてください');
INSERT INTO `dtb_index_list` VALUES ('dtb_customer','mobile_phone_id',1,'');
INSERT INTO `dtb_index_list` VALUES ('dtb_mobile_ext_session_id','create_date',1,'');
INSERT INTO `dtb_index_list` VALUES ('dtb_mobile_ext_session_id','param_key',1,'');
INSERT INTO `dtb_index_list` VALUES ('dtb_mobile_ext_session_id','param_value',1,'');
INSERT INTO `dtb_index_list` VALUES ('dtb_mobile_ext_session_id','url',1,'');
INSERT INTO `dtb_index_list` VALUES ('dtb_mobile_kara_mail','create_date',1,'');
INSERT INTO `dtb_index_list` VALUES ('dtb_mobile_kara_mail','receive_date',1,'');
INSERT INTO `dtb_index_list` VALUES ('dtb_mobile_kara_mail','token',1,'');
INSERT INTO `dtb_index_list` VALUES ('dtb_order','order_email',2,'注文数が多いときに試してみてください。');
INSERT INTO `dtb_index_list` VALUES ('dtb_order','order_name01',2,'注文数が多いときに試してみてください。');
INSERT INTO `dtb_index_list` VALUES ('dtb_order','order_name02',0,'注文数が多いときに試してみてください。');
INSERT INTO `dtb_index_list` VALUES ('dtb_order','order_tel01',0,'注文数が多いときに試してみてください。');
INSERT INTO `dtb_index_list` VALUES ('dtb_order','order_tel02',0,'注文数が多いときに試してみてください。');
INSERT INTO `dtb_index_list` VALUES ('dtb_order','order_tel03',0,'注文数が多いときに試してみてください。');
INSERT INTO `dtb_index_list` VALUES ('dtb_order','status',2,'注文数が多いときに試してみてください。');
INSERT INTO `dtb_index_list` VALUES ('dtb_order_detail','product_id',1,'');
INSERT INTO `dtb_index_list` VALUES ('dtb_order_temp','order_temp_id',0,'注文数が多いときに試してみてください。');
INSERT INTO `dtb_index_list` VALUES ('dtb_product_categories','category_id',2,'カテゴリが多いときに試してみてください。');
INSERT INTO `dtb_index_list` VALUES ('dtb_products','name',2,'商品名検索速度を向上させたいときに試してみてください');
INSERT INTO `dtb_index_list` VALUES ('dtb_products_class','product_id',1,'');
INSERT INTO `dtb_index_list` VALUES ('dtb_send_customer','customer_id',1,'');
INSERT INTO `dtb_index_list` VALUES ('mtb_zip','zipcode',2,'郵便番号検索が遅いときに試してみてください。郵便番号データの更新時には無効にしていることをおすすめします。');
/*!40000 ALTER TABLE `dtb_index_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_kiyaku`
--

DROP TABLE IF EXISTS `dtb_kiyaku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_kiyaku` (
  `kiyaku_id` int NOT NULL,
  `kiyaku_title` text NOT NULL,
  `kiyaku_text` text NOT NULL,
  `RANK` int NOT NULL DEFAULT '0',
  `creator_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `del_flg` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`kiyaku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_kiyaku`
--

LOCK TABLES `dtb_kiyaku` WRITE;
/*!40000 ALTER TABLE `dtb_kiyaku` DISABLE KEYS */;
INSERT INTO `dtb_kiyaku` VALUES (1,'第1条 (会員)','1. 「会員」とは、当社が定める手続に従い本規約に同意の上、入会の申し込みを行う個人をいいます。\n2. 「会員情報」とは、会員が当社に開示した会員の属性に関する情報および会員の取引に関する履歴等の情報をいいます。\n3. 本規約は、全ての会員に適用され、登録手続時および登録後にお守りいただく規約です。',12,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_kiyaku` VALUES (2,'第2条 (登録)','1. 会員資格\n本規約に同意の上、所定の入会申込みをされたお客様は、所定の登録手続完了後に会員としての資格を有します。会員登録手続は、会員となるご本人が行ってください。代理による登録は一切認められません。なお、過去に会員資格が取り消された方やその他当社が相応しくないと判断した方からの会員申込はお断りする場合があります。\n\n2. 会員情報の入力\n会員登録手続の際には、入力上の注意をよく読み、所定の入力フォームに必要事項を正確に入力してください。会員情報の登録において、特殊記号・旧漢字・ローマ数字などはご使用になれません。これらの文字が登録された場合は当社にて変更致します。\n\n3. パスワードの管理\n(1)パスワードは会員本人のみが利用できるものとし、第三者に譲渡・貸与できないものとします。\n(2)パスワードは、他人に知られることがないよう定期的に変更する等、会員本人が責任をもって管理してください。\n(3)パスワードを用いて当社に対して行われた意思表示は、会員本人の意思表示とみなし、そのために生じる支払等は全て会員の責任となります。',11,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_kiyaku` VALUES (3,'第3条 (変更)','1. 会員は、氏名、住所など当社に届け出た事項に変更があった場合には、速やかに当社に連絡するものとします。\n2. 変更登録がなされなかったことにより生じた損害について、当社は一切責任を負いません。また、変更登録がなされた場合でも、変更登録前にすでに手続がなされた取引は、変更登録前の情報に基づいて行われますのでご注意ください。',10,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_kiyaku` VALUES (4,'第4条 (退会)','会員が退会を希望する場合には、会員本人が退会手続きを行ってください。所定の退会手続の終了後に、退会となります。',9,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_kiyaku` VALUES (5,'第5条 (会員資格の喪失及び賠償義務)','1. 会員が、会員資格取得申込の際に虚偽の申告をしたとき、通信販売による代金支払債務を怠ったとき、その他当社が会員として不適当と認める事由があるときは、当社は、会員資格を取り消すことができることとします。\n2. 会員が、以下の各号に定める行為をしたときは、これにより当社が被った損害を賠償する責任を負います。\n(1)会員番号、パスワードを不正に使用すること\n(2)当ホームページにアクセスして情報を改ざんしたり、当ホームページに有害なコンピュータープログラムを送信するなどして、当社の営業を妨害すること\n(3)当社が扱う商品の知的所有権を侵害する行為をすること\n(4)その他、この利用規約に反する行為をすること',8,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_kiyaku` VALUES (6,'第6条 (会員情報の取扱い)','1. 当社は、原則として会員情報を会員の事前の同意なく第三者に対して開示することはありません。ただし、次の各号の場合には、会員の事前の同意なく、当社は会員情報その他のお客様情報を開示できるものとします。\n(1)法令に基づき開示を求められた場合\n(2)当社の権利、利益、名誉等を保護するために必要であると当社が判断した場合\n2. 会員情報につきましては、当社の「個人情報保護への取組み」に従い、当社が管理します。当社は、会員情報を、会員へのサービス提供、サービス内容の向上、サービスの利用促進、およびサービスの健全かつ円滑な運営の確保を図る目的のために、当社おいて利用することができるものとします。\n3. 当社は、会員に対して、メールマガジンその他の方法による情報提供(広告を含みます)を行うことができるものとします。会員が情報提供を希望しない場合は、当社所定の方法に従い、その旨を通知して頂ければ、情報提供を停止します。ただし、本サービス運営に必要な情報提供につきましては、会員の希望により停止をすることはできません。',7,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_kiyaku` VALUES (7,'第7条 (禁止事項)','本サービスの利用に際して、会員に対し次の各号の行為を行うことを禁止します。\n\n1. 法令または本規約、本サービスご利用上のご注意、本サービスでのお買い物上のご注意その他の本規約等に違反すること\n2. 当社、およびその他の第三者の権利、利益、名誉等を損ねること\n3. 青少年の心身に悪影響を及ぼす恐れがある行為、その他公序良俗に反する行為を行うこと\n4. 他の利用者その他の第三者に迷惑となる行為や不快感を抱かせる行為を行うこと\n5. 虚偽の情報を入力すること\n6. 有害なコンピュータープログラム、メール等を送信または書き込むこと\n7. 当社のサーバーその他のコンピューターに不正にアクセスすること\n8. パスワードを第三者に貸与・譲渡すること、または第三者と共用すること\n9. その他当社が不適切と判断すること',6,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_kiyaku` VALUES (8,'第8条 (サービスの中断・停止等)','1. 当社は、本サービスの稼動状態を良好に保つために、次の各号の一に該当する場合、予告なしに、本サービスの提供全てあるいは一部を停止することがあります。\n(1)システムの定期保守および緊急保守のために必要な場合\n(2)システムに負荷が集中した場合\n(3)火災、停電、第三者による妨害行為などによりシステムの運用が困難になった場合\n(4)その他、止むを得ずシステムの停止が必要と当社が判断した場合',5,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_kiyaku` VALUES (9,'第9条 (サービスの変更・廃止)','当社は、その判断によりサービスの全部または一部を事前の通知なく、適宜変更・廃止できるものとします。',4,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_kiyaku` VALUES (10,'第10条 (免責)','1. 通信回線やコンピューターなどの障害によるシステムの中断・遅滞・中止・データの消失、データへの不正アクセスにより生じた損害、その他当社のサービスに関して会員に生じた損害について、当社は一切責任を負わないものとします。\n2. 当社は、当社のウェブページ・サーバー・ドメインなどから送られるメール・コンテンツに、コンピューター・ウィルスなどの有害なものが含まれていないことを保証いたしません。\n3. 会員が本規約等に違反したことによって生じた損害については、当社は一切責任を負いません。',3,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_kiyaku` VALUES (11,'第11条 (本規約の改定)','当社は、本規約を任意に改定できるものとし、また、当社において本規約を補充する規約(以下「補充規約」といいます)を定めることができます。本規約の改定または補充は、改定後の本規約または補充規約を当社所定のサイトに掲示したときにその効力を生じるものとします。この場合、会員は、改定後の規約および補充規約に従うものと致します。',2,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
INSERT INTO `dtb_kiyaku` VALUES (12,'第12条 (準拠法、管轄裁判所)','本規約に関して紛争が生じた場合、当社本店所在地を管轄する地方裁判所を第一審の専属的合意管轄裁判所とします。 ',1,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
/*!40000 ALTER TABLE `dtb_kiyaku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_kiyaku_kiyaku_id_seq`
--

DROP TABLE IF EXISTS `dtb_kiyaku_kiyaku_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_kiyaku_kiyaku_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_kiyaku_kiyaku_id_seq`
--

LOCK TABLES `dtb_kiyaku_kiyaku_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_kiyaku_kiyaku_id_seq` DISABLE KEYS */;
INSERT INTO `dtb_kiyaku_kiyaku_id_seq` VALUES (12);
/*!40000 ALTER TABLE `dtb_kiyaku_kiyaku_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_mail_history`
--

DROP TABLE IF EXISTS `dtb_mail_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_mail_history` (
  `send_id` int NOT NULL,
  `order_id` int NOT NULL,
  `send_date` datetime DEFAULT NULL,
  `template_id` int DEFAULT NULL,
  `creator_id` int NOT NULL,
  `subject` text,
  `mail_body` text,
  PRIMARY KEY (`send_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_mail_history`
--

LOCK TABLES `dtb_mail_history` WRITE;
/*!40000 ALTER TABLE `dtb_mail_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_mail_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_mail_history_send_id_seq`
--

DROP TABLE IF EXISTS `dtb_mail_history_send_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_mail_history_send_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_mail_history_send_id_seq`
--

LOCK TABLES `dtb_mail_history_send_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_mail_history_send_id_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_mail_history_send_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_mailmaga_template`
--

DROP TABLE IF EXISTS `dtb_mailmaga_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_mailmaga_template` (
  `template_id` int NOT NULL,
  `subject` text,
  `mail_method` int DEFAULT NULL,
  `body` text,
  `del_flg` smallint NOT NULL DEFAULT '0',
  `creator_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_mailmaga_template`
--

LOCK TABLES `dtb_mailmaga_template` WRITE;
/*!40000 ALTER TABLE `dtb_mailmaga_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_mailmaga_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_mailmaga_template_template_id_seq`
--

DROP TABLE IF EXISTS `dtb_mailmaga_template_template_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_mailmaga_template_template_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_mailmaga_template_template_id_seq`
--

LOCK TABLES `dtb_mailmaga_template_template_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_mailmaga_template_template_id_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_mailmaga_template_template_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_mailtemplate`
--

DROP TABLE IF EXISTS `dtb_mailtemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_mailtemplate` (
  `template_id` int NOT NULL,
  `subject` text,
  `header` text,
  `footer` text,
  `creator_id` int NOT NULL,
  `del_flg` smallint NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_mailtemplate`
--

LOCK TABLES `dtb_mailtemplate` WRITE;
/*!40000 ALTER TABLE `dtb_mailtemplate` DISABLE KEYS */;
INSERT INTO `dtb_mailtemplate` VALUES (1,'ご注文ありがとうございます','この度はご注文いただき誠にありがとうございます。\n下記ご注文内容にお間違えがないかご確認下さい。\n\n','\n============================================\n\n\nこのメッセージはお客様へのお知らせ専用ですので、\nこのメッセージへの返信としてご質問をお送りいただいても回答できません。\nご了承ください。\n\nご質問やご不明な点がございましたら、こちらからお願いいたします。\n\n',0,0,'2021-01-13 01:40:22','2021-01-13 01:40:22');
INSERT INTO `dtb_mailtemplate` VALUES (5,'お問い合わせを受け付けました',NULL,NULL,0,0,'2021-01-13 01:40:22','2021-01-13 01:40:22');
/*!40000 ALTER TABLE `dtb_mailtemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_maker`
--

DROP TABLE IF EXISTS `dtb_maker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_maker` (
  `maker_id` int NOT NULL,
  `name` text NOT NULL,
  `RANK` int NOT NULL DEFAULT '0',
  `creator_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `del_flg` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`maker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_maker`
--

LOCK TABLES `dtb_maker` WRITE;
/*!40000 ALTER TABLE `dtb_maker` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_maker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_maker_count`
--

DROP TABLE IF EXISTS `dtb_maker_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_maker_count` (
  `maker_id` int NOT NULL,
  `product_count` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`maker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_maker_count`
--

LOCK TABLES `dtb_maker_count` WRITE;
/*!40000 ALTER TABLE `dtb_maker_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_maker_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_maker_maker_id_seq`
--

DROP TABLE IF EXISTS `dtb_maker_maker_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_maker_maker_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_maker_maker_id_seq`
--

LOCK TABLES `dtb_maker_maker_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_maker_maker_id_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_maker_maker_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_member`
--

DROP TABLE IF EXISTS `dtb_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_member` (
  `member_id` int NOT NULL,
  `name` text,
  `department` text,
  `login_id` text NOT NULL,
  `password` text NOT NULL,
  `salt` text NOT NULL,
  `authority` smallint NOT NULL,
  `RANK` int NOT NULL DEFAULT '0',
  `work` smallint NOT NULL DEFAULT '1',
  `del_flg` smallint NOT NULL DEFAULT '0',
  `creator_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `login_date` datetime DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_member`
--

LOCK TABLES `dtb_member` WRITE;
/*!40000 ALTER TABLE `dtb_member` DISABLE KEYS */;
INSERT INTO `dtb_member` VALUES (1,'dummy',NULL,'dummy','dummy','dummy',0,0,1,1,0,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_member` VALUES (2,'管理者',NULL,'admin','2de7f6d45a5c5fae9c54a08e272ea0bc4101cd485d48705d55d60dfd8d04d5fe','chionotrok',0,1,1,0,0,'2021-01-13 01:40:44','2021-01-13 01:40:44','2021-10-04 11:52:53');
/*!40000 ALTER TABLE `dtb_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_member_member_id_seq`
--

DROP TABLE IF EXISTS `dtb_member_member_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_member_member_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_member_member_id_seq`
--

LOCK TABLES `dtb_member_member_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_member_member_id_seq` DISABLE KEYS */;
INSERT INTO `dtb_member_member_id_seq` VALUES (2);
/*!40000 ALTER TABLE `dtb_member_member_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_mobile_ext_session_id`
--

DROP TABLE IF EXISTS `dtb_mobile_ext_session_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_mobile_ext_session_id` (
  `session_id` text NOT NULL,
  `param_key` text,
  `param_value` text,
  `url` text,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`session_id`(255)),
  KEY `dtb_mobile_ext_session_id_param_key_key` (`param_key`(255)),
  KEY `dtb_mobile_ext_session_id_param_value_key` (`param_value`(255)),
  KEY `dtb_mobile_ext_session_id_url_key` (`url`(255)),
  KEY `dtb_mobile_ext_session_id_create_date_key` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_mobile_ext_session_id`
--

LOCK TABLES `dtb_mobile_ext_session_id` WRITE;
/*!40000 ALTER TABLE `dtb_mobile_ext_session_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_mobile_ext_session_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_module`
--

DROP TABLE IF EXISTS `dtb_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_module` (
  `module_id` int NOT NULL,
  `module_code` text NOT NULL,
  `module_name` text NOT NULL,
  `sub_data` text,
  `auto_update_flg` smallint NOT NULL DEFAULT '0',
  `del_flg` smallint NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_module`
--

LOCK TABLES `dtb_module` WRITE;
/*!40000 ALTER TABLE `dtb_module` DISABLE KEYS */;
INSERT INTO `dtb_module` VALUES (0,'0','patch',NULL,0,0,'2021-01-13 01:40:22','2021-01-13 01:40:22');
INSERT INTO `dtb_module` VALUES (2073,'mdl_sln','e-SCOTT Smart light for EC-CUBE(2.17系)','a:5:{s:15:\"master_settings\";a:0:{}s:13:\"user_settings\";a:55:{s:19:\"enable_payment_type\";a:2:{i:0;s:2:\"10\";i:1;s:2:\"11\";}s:10:\"MerchantId\";s:8:\"00012997\";s:12:\"MerchantPass\";s:8:\"wj8tntdW\";s:8:\"TenantId\";s:0:\"\";s:23:\"credit_connection_place\";s:0:\"\";s:24:\"credit_connection_place1\";s:49:\"https://www.test.e-scott.jp/online/aut/OAUT002.do\";s:24:\"credit_connection_place2\";s:49:\"https://www.test.e-scott.jp/online/crp/OCRP005.do\";s:24:\"credit_connection_place3\";s:37:\"https://link.kessai.info/JLPCT/JLPcon\";s:24:\"credit_connection_place4\";s:0:\"\";s:24:\"credit_connection_place5\";s:49:\"https://www.test.e-scott.jp/online/cnv/OCNV005.do\";s:24:\"credit_connection_place6\";s:49:\"https://www.test.e-scott.jp/online/tds/OTDS010.do\";s:24:\"credit_connection_place7\";s:56:\"https://www.test.e-scott.jp/euser/stn/CdGetJavaScript.do\";s:17:\"token_ninsyo_code\";s:32:\"dHkXyPMRsW3wC56J7ky8p4eGABJmHBV4\";s:14:\"credit_aes_key\";s:0:\"\";s:13:\"credit_aes_iv\";s:0:\"\";s:11:\"payKbnKaisu\";a:1:{i:0;s:2:\"01\";}s:5:\"SecCd\";s:1:\"1\";s:22:\"attestation_assistance\";a:0:{}s:9:\"OperateId\";s:10:\"1Gathering\";s:18:\"card_order_pre_end\";s:1:\"0\";s:13:\"member_regist\";s:1:\"1\";s:6:\"3d_pay\";s:1:\"1\";s:14:\"quick_accounts\";s:1:\"1\";s:19:\"OnlinePaymentMethod\";s:0:\"\";s:5:\"Free1\";s:0:\"\";s:5:\"Free2\";s:0:\"\";s:5:\"Free3\";s:0:\"\";s:5:\"Free4\";s:0:\"\";s:5:\"Free5\";s:0:\"\";s:5:\"Free6\";s:0:\"\";s:5:\"Free7\";s:0:\"\";s:7:\"Comment\";s:0:\"\";s:5:\"Free8\";s:0:\"\";s:5:\"Free9\";s:0:\"\";s:6:\"Free10\";s:0:\"\";s:6:\"Free11\";s:0:\"\";s:6:\"Free12\";s:0:\"\";s:6:\"Free13\";s:0:\"\";s:6:\"Free14\";s:0:\"\";s:6:\"Free15\";s:0:\"\";s:6:\"Free16\";s:0:\"\";s:6:\"Free17\";s:0:\"\";s:6:\"Free18\";s:0:\"\";s:6:\"Free19\";s:0:\"\";s:5:\"Title\";s:0:\"\";s:16:\"payOnlineWording\";s:0:\"\";s:29:\"credit_connection_destination\";s:1:\"1\";s:29:\"threed_connection_destination\";s:1:\"1\";s:26:\"cvs_connection_destination\";s:1:\"1\";s:22:\"creditConnectionPlace1\";N;s:22:\"creditConnectionPlace2\";N;s:22:\"creditConnectionPlace7\";N;s:22:\"creditConnectionPlace6\";N;s:22:\"creditConnectionPlace3\";N;s:22:\"creditConnectionPlace5\";N;}s:12:\"page_setting\";a:1:{s:32:\"shopping/load_sln_payment_module\";a:3:{i:10;s:2:\"50\";i:2;s:2:\"30\";i:1;s:2:\"38\";}}s:12:\"bloc_setting\";a:2:{s:10:\"sln_credit\";a:3:{i:10;s:2:\"12\";i:2;s:1:\"9\";i:1;s:1:\"7\";}s:17:\"sln_regist_credit\";a:3:{i:10;s:2:\"13\";i:2;s:2:\"10\";i:1;s:1:\"8\";}}s:18:\"add_card_mem_table\";i:1;}',0,0,'2021-09-16 09:26:30','2021-09-16 09:26:30');
/*!40000 ALTER TABLE `dtb_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_module_update_logs`
--

DROP TABLE IF EXISTS `dtb_module_update_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_module_update_logs` (
  `log_id` int NOT NULL,
  `module_id` int NOT NULL,
  `buckup_path` text,
  `error_flg` smallint DEFAULT '0',
  `error` text,
  `ok` text,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_module_update_logs`
--

LOCK TABLES `dtb_module_update_logs` WRITE;
/*!40000 ALTER TABLE `dtb_module_update_logs` DISABLE KEYS */;
INSERT INTO `dtb_module_update_logs` VALUES (1,2073,'/var/www/html/../data/downloads/backup/update_1631784390/',0,NULL,'ファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/config.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/defines.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/deldirlist.txt\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/delfilelist.txt\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/errors.txt\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/payment.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/CryptAES.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/GetErrorMsg.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/SLN.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/SLN_CVS.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/SLN_C_3DCredit.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/SLN_C_Base.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/SLN_C_CVS.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/SLN_C_Credit.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/SLN_C_Member.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/SLN_C_RegistCredit.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/SLN_C_Util.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/SLN_ChangeCard.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/SLN_Config.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/SLN_Core.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/SLN_Credit.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/SLN_Helper.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/SLN_Recv.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/SLN_RegistCredit.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/SLN_Util.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/class/SLN_Utils_Payment_Status.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/copy/SLNCore.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/copy/btn_bloc_buy.jpg\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/copy/btn_bloc_buy_on.jpg\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/copy/btn_quick.png\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/copy/btn_quick_on.png\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/copy/card_info.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/copy/payment_status.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/copy/plugin_info.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/copy/security_code.jpg\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/copy/sln_3d.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/copy/sln_3d_post.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/copy/sln_card_3d.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/copy/sln_recv.php\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/admin/sln_admin_addmenu.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/admin/sln_config.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/admin/sln_order_edit_changealert.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/admin/sln_order_edit_top.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/admin/sln_order_index_baseoneactionmenu.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/admin/sln_order_index_list.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/admin/sln_order_index_list_colwidth.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/admin/sln_order_index_oneactionmenu.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/admin/sln_order_payment_body.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/admin/sln_order_status_colwidth.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/admin/sln_order_status_head.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/admin/sln_order_status_js.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/admin/sln_order_status_oneactionmenu.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/admin/sln_order_status_status.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/default/sln_card_info.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/default/sln_cart_index_quickbtn.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/default/sln_mypage_navi_changecard.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/default/sln_payment.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/default/sln_shopping_confirm_quick.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/default/bloc/sln_credit.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/default/bloc/sln_cvs.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/default/bloc/sln_regist_credit.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/mail/sln_no_order.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/mobile/sln_cart_index_quickbtn.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/mobile/sln_payment.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/mobile/bloc/sln_credit.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/mobile/bloc/sln_cvs.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/mobile/bloc/sln_regist_credit.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/sphone/sln_card_info.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/sphone/sln_cart_index_quickbtn.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/sphone/sln_mypage_navi_changecard.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/sphone/sln_payment.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/sphone/bloc/sln_credit.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/sphone/bloc/sln_cvs.tpl\nファイルのコピーに成功しました: /var/www/html/../data/downloads/module/mdl_sln/templates/sphone/bloc/sln_regist_credit.tpl','2021-09-16 09:26:30','2021-09-16 09:26:30');
/*!40000 ALTER TABLE `dtb_module_update_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_module_update_logs_log_id_seq`
--

DROP TABLE IF EXISTS `dtb_module_update_logs_log_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_module_update_logs_log_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_module_update_logs_log_id_seq`
--

LOCK TABLES `dtb_module_update_logs_log_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_module_update_logs_log_id_seq` DISABLE KEYS */;
INSERT INTO `dtb_module_update_logs_log_id_seq` VALUES (1);
/*!40000 ALTER TABLE `dtb_module_update_logs_log_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_news`
--

DROP TABLE IF EXISTS `dtb_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_news` (
  `news_id` int NOT NULL,
  `news_date` datetime DEFAULT NULL,
  `RANK` int DEFAULT NULL,
  `news_title` text NOT NULL,
  `news_comment` text,
  `news_url` text,
  `news_select` smallint NOT NULL DEFAULT '0',
  `link_method` text,
  `creator_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `del_flg` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_news`
--

LOCK TABLES `dtb_news` WRITE;
/*!40000 ALTER TABLE `dtb_news` DISABLE KEYS */;
INSERT INTO `dtb_news` VALUES (1,'2021-01-13 01:40:22',1,'サイトオープンいたしました!','一人暮らしからオフィスなどさまざまなシーンで あなたの生活をサポートするグッズをご家庭へお届けします！一人暮らしからオフィスなどさまざまなシーンで あなたの生活をサポートするグッズをご家庭へお届けします！一人暮らしからオフィスなどさまざまなシーンで あなたの生活をサポートするグッズをご家庭へお届けします！',NULL,0,NULL,1,'2021-01-13 01:40:22','2021-01-13 01:40:22',0);
/*!40000 ALTER TABLE `dtb_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_news_news_id_seq`
--

DROP TABLE IF EXISTS `dtb_news_news_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_news_news_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_news_news_id_seq`
--

LOCK TABLES `dtb_news_news_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_news_news_id_seq` DISABLE KEYS */;
INSERT INTO `dtb_news_news_id_seq` VALUES (1);
/*!40000 ALTER TABLE `dtb_news_news_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_order`
--

DROP TABLE IF EXISTS `dtb_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_order` (
  `order_id` int NOT NULL,
  `order_temp_id` text,
  `customer_id` int NOT NULL,
  `message` text,
  `order_name01` text,
  `order_name02` text,
  `order_kana01` text,
  `order_kana02` text,
  `order_company_name` text,
  `order_email` text,
  `order_tel01` text,
  `order_tel02` text,
  `order_tel03` text,
  `order_fax01` text,
  `order_fax02` text,
  `order_fax03` text,
  `order_zip01` text,
  `order_zip02` text,
  `order_zipcode` text,
  `order_country_id` int DEFAULT NULL,
  `order_pref` smallint DEFAULT NULL,
  `order_addr01` text,
  `order_addr02` text,
  `order_sex` smallint DEFAULT NULL,
  `order_birth` datetime DEFAULT NULL,
  `order_job` int DEFAULT NULL,
  `subtotal` decimal(10,0) DEFAULT NULL,
  `discount` decimal(10,0) NOT NULL DEFAULT '0',
  `deliv_id` int DEFAULT NULL,
  `deliv_fee` decimal(10,0) DEFAULT NULL,
  `charge` decimal(10,0) DEFAULT NULL,
  `use_point` decimal(10,0) NOT NULL DEFAULT '0',
  `add_point` decimal(10,0) NOT NULL DEFAULT '0',
  `birth_point` decimal(10,0) NOT NULL DEFAULT '0',
  `tax` decimal(10,0) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `payment_total` decimal(10,0) DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `payment_method` text,
  `note` text,
  `status` smallint DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `commit_date` datetime DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `device_type_id` int DEFAULT NULL,
  `del_flg` smallint NOT NULL DEFAULT '0',
  `memo01` text,
  `memo02` text,
  `memo03` text,
  `memo04` text,
  `memo05` text,
  `memo06` text,
  `memo07` text,
  `memo08` text,
  `memo09` text,
  `memo10` text,
  PRIMARY KEY (`order_id`),
  KEY `dtb_order_customer_id_key` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_order`
--

LOCK TABLES `dtb_order` WRITE;
/*!40000 ALTER TABLE `dtb_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_order_detail`
--

DROP TABLE IF EXISTS `dtb_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_order_detail` (
  `order_detail_id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_class_id` int NOT NULL,
  `product_name` text NOT NULL,
  `product_code` text,
  `classcategory_name1` text,
  `classcategory_name2` text,
  `price` decimal(10,0) DEFAULT NULL,
  `quantity` decimal(10,0) DEFAULT NULL,
  `point_rate` decimal(10,0) NOT NULL DEFAULT '0',
  `tax_rate` decimal(10,0) DEFAULT NULL,
  `tax_rule` smallint DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `dtb_order_detail_order_id_key` (`order_id`),
  KEY `dtb_order_detail_product_id_key` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_order_detail`
--

LOCK TABLES `dtb_order_detail` WRITE;
/*!40000 ALTER TABLE `dtb_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_order_detail_order_detail_id_seq`
--

DROP TABLE IF EXISTS `dtb_order_detail_order_detail_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_order_detail_order_detail_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_order_detail_order_detail_id_seq`
--

LOCK TABLES `dtb_order_detail_order_detail_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_order_detail_order_detail_id_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_order_detail_order_detail_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_order_order_id_seq`
--

DROP TABLE IF EXISTS `dtb_order_order_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_order_order_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_order_order_id_seq`
--

LOCK TABLES `dtb_order_order_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_order_order_id_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_order_order_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_order_temp`
--

DROP TABLE IF EXISTS `dtb_order_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_order_temp` (
  `order_temp_id` text NOT NULL,
  `customer_id` int NOT NULL,
  `message` text,
  `order_name01` text,
  `order_name02` text,
  `order_kana01` text,
  `order_kana02` text,
  `order_company_name` text,
  `order_email` text,
  `order_tel01` text,
  `order_tel02` text,
  `order_tel03` text,
  `order_fax01` text,
  `order_fax02` text,
  `order_fax03` text,
  `order_zip01` text,
  `order_zip02` text,
  `order_zipcode` text,
  `order_country_id` int DEFAULT NULL,
  `order_pref` smallint DEFAULT NULL,
  `order_addr01` text,
  `order_addr02` text,
  `order_sex` smallint DEFAULT NULL,
  `order_birth` datetime DEFAULT NULL,
  `order_job` int DEFAULT NULL,
  `subtotal` decimal(10,0) DEFAULT NULL,
  `discount` decimal(10,0) NOT NULL DEFAULT '0',
  `deliv_id` int DEFAULT NULL,
  `deliv_fee` decimal(10,0) DEFAULT NULL,
  `charge` decimal(10,0) DEFAULT NULL,
  `use_point` decimal(10,0) NOT NULL DEFAULT '0',
  `add_point` decimal(10,0) NOT NULL DEFAULT '0',
  `birth_point` decimal(10,0) NOT NULL DEFAULT '0',
  `tax` decimal(10,0) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `payment_total` decimal(10,0) DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `payment_method` text,
  `note` text,
  `mail_flag` smallint DEFAULT NULL,
  `status` smallint DEFAULT NULL,
  `deliv_check` smallint DEFAULT NULL,
  `point_check` smallint DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `device_type_id` int DEFAULT NULL,
  `del_flg` smallint NOT NULL DEFAULT '0',
  `order_id` int DEFAULT NULL,
  `memo01` text,
  `memo02` text,
  `memo03` text,
  `memo04` text,
  `memo05` text,
  `memo06` text,
  `memo07` text,
  `memo08` text,
  `memo09` text,
  `memo10` text,
  `session` longtext,
  PRIMARY KEY (`order_temp_id`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_order_temp`
--

LOCK TABLES `dtb_order_temp` WRITE;
/*!40000 ALTER TABLE `dtb_order_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_order_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_other_deliv`
--

DROP TABLE IF EXISTS `dtb_other_deliv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_other_deliv` (
  `other_deliv_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `name01` text,
  `name02` text,
  `kana01` text,
  `kana02` text,
  `company_name` text,
  `zip01` text,
  `zip02` text,
  `zipcode` text,
  `country_id` int DEFAULT NULL,
  `pref` smallint DEFAULT NULL,
  `addr01` text,
  `addr02` text,
  `tel01` text,
  `tel02` text,
  `tel03` text,
  `fax01` text,
  `fax02` text,
  `fax03` text,
  PRIMARY KEY (`other_deliv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_other_deliv`
--

LOCK TABLES `dtb_other_deliv` WRITE;
/*!40000 ALTER TABLE `dtb_other_deliv` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_other_deliv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_other_deliv_other_deliv_id_seq`
--

DROP TABLE IF EXISTS `dtb_other_deliv_other_deliv_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_other_deliv_other_deliv_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_other_deliv_other_deliv_id_seq`
--

LOCK TABLES `dtb_other_deliv_other_deliv_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_other_deliv_other_deliv_id_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_other_deliv_other_deliv_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_ownersstore_settings`
--

DROP TABLE IF EXISTS `dtb_ownersstore_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_ownersstore_settings` (
  `public_key` text NOT NULL,
  PRIMARY KEY (`public_key`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_ownersstore_settings`
--

LOCK TABLES `dtb_ownersstore_settings` WRITE;
/*!40000 ALTER TABLE `dtb_ownersstore_settings` DISABLE KEYS */;
INSERT INTO `dtb_ownersstore_settings` VALUES ('443f1c96a11f9f573116aaae7e755d9d2e8e3764');
/*!40000 ALTER TABLE `dtb_ownersstore_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_pagelayout`
--

DROP TABLE IF EXISTS `dtb_pagelayout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_pagelayout` (
  `device_type_id` int NOT NULL,
  `page_id` int NOT NULL,
  `page_name` text,
  `url` text NOT NULL,
  `filename` text,
  `header_chk` smallint DEFAULT '1',
  `footer_chk` smallint DEFAULT '1',
  `edit_flg` smallint DEFAULT '1',
  `author` text,
  `description` text,
  `keyword` text,
  `update_url` text,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `meta_robots` text,
  PRIMARY KEY (`device_type_id`,`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_pagelayout`
--

LOCK TABLES `dtb_pagelayout` WRITE;
/*!40000 ALTER TABLE `dtb_pagelayout` DISABLE KEYS */;
INSERT INTO `dtb_pagelayout` VALUES (1,0,NULL,'preview','preview',1,1,1,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,1,'TOPページ','index.php','index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,2,'商品一覧ページ','products/list.php','products/list',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,3,'商品検索ページ','products/search.php','products/search',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,4,'商品カテゴリページ','products/category_list.php','products/category_list',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,5,'商品詳細ページ','products/detail.php','products/detail',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,6,'MYページ','mypage/index.php','mypage/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (1,7,'MYページ/会員登録内容変更(入力ページ)','mypage/change.php','mypage/change',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (1,8,'MYページ/会員登録内容変更(完了ページ)','mypage/change_complete.php','mypage/change_complete',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (1,9,'MYページ/お届け先追加･変更','mypage/delivery.php','mypage/delivery',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (1,10,'MYページ/お気に入り一覧','mypage/favorite.php','mypage/favorite',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (1,11,'MYページ/購入履歴詳細','mypage/history.php','mypage/history',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (1,12,'MYページ/ログイン','mypage/login.php','mypage/login',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (1,13,'MYページ/退会手続き(入力ページ)','mypage/refusal.php','mypage/refusal',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (1,14,'MYページ/退会手続き(完了ページ)','mypage/refusal_complete.php','mypage/refusal_complete',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (1,16,'現在のカゴの中','cart/index.php','cart/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (1,17,'お問い合わせ(入力ページ)','contact/index.php','contact/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,18,'お問い合わせ(完了ページ)','contact/complete.php','contact/complete',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,19,'会員登録(入力ページ)','entry/index.php','entry/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,20,'ご利用規約','entry/kiyaku.php','entry/kiyaku',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,21,'会員登録(完了ページ)','entry/complete.php','entry/complete',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,22,'携帯メール登録','entry/email_mobile.php','entry/email_mobile',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,23,'特定商取引に関する法律に基づく表記','order/index.php','order/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,24,'本会員登録(完了ページ)','regist/complete.php','regist/complete',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,25,'商品購入/ログイン','shopping/index.php','shopping/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23','noindex');
INSERT INTO `dtb_pagelayout` VALUES (1,26,'商品購入/お届け先の指定','shopping/deliv.php','shopping/deliv',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23','noindex');
INSERT INTO `dtb_pagelayout` VALUES (1,27,'商品購入/お届け先の複数指定','shopping/multiple.php','shopping/multiple',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23','noindex');
INSERT INTO `dtb_pagelayout` VALUES (1,28,'商品購入/お支払方法・お届け時間等の指定','shopping/payment.php','shopping/payment',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23','noindex');
INSERT INTO `dtb_pagelayout` VALUES (1,29,'商品購入/ご入力内容のご確認','shopping/confirm.php','shopping/confirm',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23','noindex');
INSERT INTO `dtb_pagelayout` VALUES (1,30,'商品購入/ご注文完了','shopping/complete.php','shopping/complete',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23','noindex');
INSERT INTO `dtb_pagelayout` VALUES (1,31,'非対応デバイス','unsupported/index.php','unsupported/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23','noindex');
INSERT INTO `dtb_pagelayout` VALUES (1,32,'ご利用ガイド','guide/index.php','guide/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,33,'ご利用ガイド/ご利用方法','guide/usage.php','guide/usage',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,34,'ご利用ガイド/プライバシーポリシー','guide/privacy.php','guide/privacy',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,35,'ご利用ガイド/通信料について','guide/charge.php','guide/charge',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,36,'ご利用ガイド/ご利用規約','guide/kiyaku.php','guide/kiyaku',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,37,'ご利用ガイド/運営会社紹介','guide/about.php','guide/about',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:23','2021-01-13 01:40:23',NULL);
INSERT INTO `dtb_pagelayout` VALUES (1,38,'商品購入/決済画面','shopping/load_sln_payment_module.php','shopping/load_sln_payment_module',1,1,2,NULL,NULL,NULL,'http://localhost:8080/chainadmin/load_module_config.php?module_id=2073','2021-09-16 09:35:11','2021-09-16 09:35:11',NULL);
INSERT INTO `dtb_pagelayout` VALUES (2,0,NULL,'preview','preview',1,1,1,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (2,1,'TOPページ','index.php','index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (2,2,'商品一覧ページ','products/list.php','products/list',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (2,3,'商品詳細ページ','products/detail.php','products/detail',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (2,4,'MYページ','mypage/index.php','mypage/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (2,5,'MYページ/会員登録内容変更(入力ページ)','mypage/change.php','mypage/change',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (2,6,'MYページ/会員登録内容変更(完了ページ)','mypage/change_complete.php','mypage/change_complete',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (2,7,'MYページ/お届け先追加･変更','mypage/delivery.php','mypage/delivery',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (2,8,'MYページ/お気に入り一覧','mypage/favorite.php','mypage/favorite',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (2,9,'MYページ/購入履歴詳細','mypage/history.php','mypage/history',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (2,10,'MYページ/ログイン','mypage/login.php','mypage/login',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (2,11,'MYページ/退会手続き(入力ページ)','mypage/refusal.php','mypage/refusal',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (2,12,'MYページ/退会手続き(完了ページ)','mypage/refusal_complete.php','mypage/refusal_complete',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (2,13,'当サイトについて','abouts/index.php','abouts/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (2,14,'現在のカゴの中','cart/index.php','cart/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (2,15,'お問い合わせ(入力ページ)','contact/index.php','contact/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (2,16,'お問い合わせ(完了ページ)','contact/complete.php','contact/complete',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (2,17,'会員登録(入力ページ)','entry/index.php','entry/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (2,18,'ご利用規約','entry/kiyaku.php','entry/kiyaku',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (2,19,'会員登録(完了ページ)','entry/complete.php','entry/complete',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (2,20,'特定商取引に関する法律に基づく表記','order/index.php','order/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (2,21,'本会員登録(完了ページ)','regist/complete.php','regist/complete',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (2,22,'商品購入/ログイン','shopping/index.php','shopping/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (2,23,'商品購入/お届け先の指定','shopping/deliv.php','shopping/deliv',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (2,24,'商品購入/お届け先の複数指定','shopping/multiple.php','shopping/multiple',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (2,25,'商品購入/お支払方法・お届け時間等の指定','shopping/payment.php','shopping/payment',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (2,26,'商品購入/ご入力内容のご確認','shopping/confirm.php','shopping/confirm',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (2,27,'商品購入/ご注文完了','shopping/complete.php','shopping/complete',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (2,28,'プライバシーポリシー','guide/privacy.php','guide/privacy',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (2,29,'パスワードを忘れた方','forgot/index.php','forgot/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (2,30,'商品購入/決済画面','shopping/load_sln_payment_module.php','shopping/load_sln_payment_module',1,1,2,NULL,NULL,NULL,'http://localhost:8080/chainadmin/load_module_config.php?module_id=2073','2021-09-16 09:35:11','2021-09-16 09:35:11',NULL);
INSERT INTO `dtb_pagelayout` VALUES (2,31,'MYページ/登録済カード情報変更','mypage/card_info.php','mypage/card_info',1,1,2,NULL,NULL,NULL,'http://localhost:8080/chainadmin/load_module_config.php?module_id=2073','2021-09-16 09:35:11','2021-09-16 09:35:11',NULL);
INSERT INTO `dtb_pagelayout` VALUES (10,0,'プレビューデータ','preview',NULL,1,1,1,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (10,1,'TOPページ','index.php','index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (10,2,'商品一覧ページ','products/list.php','products/list',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (10,3,'商品詳細ページ','products/detail.php','products/detail',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (10,4,'MYページ','mypage/index.php','mypage/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,5,'MYページ/会員登録内容変更(入力ページ)','mypage/change.php','mypage/change',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,6,'MYページ/会員登録内容変更(完了ページ)','mypage/change_complete.php','mypage/change_complete',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,7,'MYページ/お届け先追加･変更','mypage/delivery.php','mypage/delivery',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,8,'MYページ/お気に入り一覧','mypage/favorite.php','mypage/favorite',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,9,'MYページ/購入履歴詳細','mypage/history.php','mypage/history',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,10,'MYページ/ログイン','mypage/login.php','mypage/login',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,11,'MYページ/退会手続き(入力ページ)','mypage/refusal.php','mypage/refusal',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,12,'MYページ/退会手続き(完了ページ)','mypage/refusal_complete.php','mypage/refusal_complete',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,13,'当サイトについて','abouts/index.php','abouts/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (10,14,'現在のカゴの中','cart/index.php','cart/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,15,'お問い合わせ(入力ページ)','contact/index.php','contact/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (10,16,'お問い合わせ(完了ページ)','contact/complete.php','contact/complete',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (10,17,'会員登録(入力ページ)','entry/index.php','entry/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (10,18,'ご利用規約','entry/kiyaku.php','entry/kiyaku',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (10,19,'会員登録(完了ページ)','entry/complete.php','entry/complete',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (10,20,'特定商取引に関する法律に基づく表記','order/index.php','order/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (10,21,'本会員登録(完了ページ)','regist/complete.php','regist/complete',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (10,22,'商品購入/ログイン','shopping/index.php','shopping/index',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,23,'商品購入/お届け先の指定','shopping/deliv.php','shopping/deliv',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,24,'商品購入/お届け先の複数指定','shopping/multiple.php','shopping/multiple',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,25,'商品購入/お支払方法・お届け時間等の指定','shopping/payment.php','shopping/payment',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,26,'商品購入/ご入力内容のご確認','shopping/confirm.php','shopping/confirm',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,27,'商品購入/ご注文完了','shopping/complete.php','shopping/complete',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,28,'プライバシーポリシー','guide/privacy.php','guide/privacy',1,1,2,NULL,NULL,NULL,NULL,'2021-01-13 01:40:22','2021-01-13 01:40:22',NULL);
INSERT INTO `dtb_pagelayout` VALUES (10,29,'MYページ/プロフィール編集','mypage/profile.php','mypage/profile',1,1,2,NULL,NULL,NULL,NULL,'2021-07-23 00:00:00','2021-07-23 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,30,'プロフィール','profile.php','profile',1,1,2,NULL,NULL,NULL,NULL,'2021-07-23 00:00:00','2021-07-23 00:00:00',NULL);
INSERT INTO `dtb_pagelayout` VALUES (10,31,'MYページ/アイテム登録','mypage/item_edit.php','mypage/item_edit',1,1,2,NULL,NULL,NULL,NULL,'2021-07-31 00:00:00','2021-07-31 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,32,'MYページ/出品中アイテム一覧','mypage/item-list.php','mypage/item-list',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,33,'MYページ/アイテムトップナビ','mypage/myitem/myitem_list.php','mypage/myitem/myitem_list',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,34,'MYページ/リクエストアイテム','mypage/myitem/request_item.php','mypage/myitem/request_item',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,35,'MYページ/Chainの状況','mypage/myitem/status_list.php','mypage/myitem/status_list',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,36,'MYページ/Chainの状況/詳細','mypage/myitem/status.php','mypage/myitem/status',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,37,'MYページ/選択待ちアイテム','mypage/myitem/unselected_item.php','mypage/myitem/unselected_item',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,38,'MYページ/受け取り待ちのアイテム','mypage/myitem/unreceived_item.php','mypage/myitem/unreceived_item',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,39,'MYページ/交換済みのアイテム','mypage/myitem/history.php','mypage/myitem/history',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,40,'MYページ/交換済みのアイテム/詳細','mypage/myitem/history_detail.php','mypage/myitem/history_detail',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,41,'その他','other/index.php','other/index',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,42,'ご利用規約','terms/kiyaku.php','terms/kiyaku',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,43,'違反行為','terms/prohibited_activities.php','terms/prohibited_activities',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,44,'違反出品物','terms/prohibited_items.php','terms/prohibited_items',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,45,'支払い方法','guide/payment.php','guide/payment',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,46,'配送の流れ','guide/flow.php','guide/flow',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,47,'お知らせ','news/index.php','news/index',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,48,'ご利用方法','guide/guide.php','guide/guide',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,49,'ヘルプ','guide/help.php','guide/help',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,50,'商品購入/決済画面','shopping/load_sln_payment_module.php','shopping/load_sln_payment_module',1,1,2,NULL,NULL,NULL,'http://localhost:8080/chainadmin/load_module_config.php?module_id=2073','2021-09-16 09:35:11','2021-09-16 09:35:11',NULL);
INSERT INTO `dtb_pagelayout` VALUES (10,51,'MYページ/登録済カード情報変更','mypage/card_info.php','mypage/card_info',1,1,2,NULL,NULL,NULL,'http://localhost:8080/chainadmin/load_module_config.php?module_id=2073','2021-09-16 09:35:11','2021-09-16 09:35:11',NULL);
INSERT INTO `dtb_pagelayout` VALUES (10,52,'MYページ/送付状QR','mypage/myitem/qr.php','mypage/myitem/qr',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,53,'MYページ/マイアイテム詳細','mypage/myitem/myitem_detail.php','mypage/myitem/myitem_detail',1,1,2,NULL,NULL,NULL,NULL,'2021-08-15 00:00:00','2021-08-15 00:00:00','noindex');
INSERT INTO `dtb_pagelayout` VALUES (10,54,'マイアイテム一覧','user_data/myitem_list.php','user_data/myitem_list',2,1,1,NULL,NULL,NULL,'http://localhost:8080/chainadmin/design/main_edit.php?device_type_id=10','2021-10-04 02:53:32','2021-10-04 02:53:32',NULL);
/*!40000 ALTER TABLE `dtb_pagelayout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_payment`
--

DROP TABLE IF EXISTS `dtb_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_payment` (
  `payment_id` int NOT NULL,
  `payment_method` text,
  `charge` decimal(10,0) DEFAULT NULL,
  `rule_max` decimal(10,0) DEFAULT NULL,
  `RANK` int DEFAULT NULL,
  `note` text,
  `fix` smallint DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1',
  `del_flg` smallint NOT NULL DEFAULT '0',
  `creator_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `payment_image` text,
  `upper_rule` decimal(10,0) DEFAULT NULL,
  `charge_flg` smallint DEFAULT '1',
  `rule_min` decimal(10,0) DEFAULT NULL,
  `upper_rule_max` decimal(10,0) DEFAULT NULL,
  `module_id` int DEFAULT NULL,
  `module_path` text,
  `memo01` text,
  `memo02` text,
  `memo03` text,
  `memo04` text,
  `memo05` text,
  `memo06` text,
  `memo07` text,
  `memo08` text,
  `memo09` text,
  `memo10` text,
  `module_code` text,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_payment`
--

LOCK TABLES `dtb_payment` WRITE;
/*!40000 ALTER TABLE `dtb_payment` DISABLE KEYS */;
INSERT INTO `dtb_payment` VALUES (1,'郵便振替',0,NULL,4,NULL,2,1,0,1,'2021-01-13 01:40:23','2021-01-13 01:40:23',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `dtb_payment` VALUES (2,'現金書留',0,NULL,3,NULL,2,1,0,1,'2021-01-13 01:40:23','2021-01-13 01:40:23',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `dtb_payment` VALUES (3,'銀行振込',0,NULL,2,NULL,2,1,0,1,'2021-01-13 01:40:23','2021-01-13 01:40:23',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `dtb_payment` VALUES (4,'代金引換',0,NULL,1,NULL,2,1,0,1,'2021-01-13 01:40:23','2021-01-13 01:40:23',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `dtb_payment` VALUES (5,'クレジットカード決済',0,1,5,NULL,3,1,0,2,'2021-09-16 09:35:11','2021-09-16 09:35:11',NULL,NULL,1,NULL,NULL,NULL,'/var/www/html/../data/downloads/module/mdl_sln/payment.php',NULL,NULL,'10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mdl_sln');
INSERT INTO `dtb_payment` VALUES (6,'登録済みクレジットカード決済',0,1,6,NULL,3,1,0,2,'2021-09-16 09:35:11','2021-09-16 09:35:11',NULL,NULL,1,NULL,NULL,NULL,'/var/www/html/../data/downloads/module/mdl_sln/payment.php',NULL,NULL,'11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mdl_sln');
/*!40000 ALTER TABLE `dtb_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_payment_options`
--

DROP TABLE IF EXISTS `dtb_payment_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_payment_options` (
  `deliv_id` int NOT NULL,
  `payment_id` int NOT NULL,
  `RANK` int DEFAULT NULL,
  PRIMARY KEY (`deliv_id`,`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_payment_options`
--

LOCK TABLES `dtb_payment_options` WRITE;
/*!40000 ALTER TABLE `dtb_payment_options` DISABLE KEYS */;
INSERT INTO `dtb_payment_options` VALUES (1,1,1);
INSERT INTO `dtb_payment_options` VALUES (1,2,2);
INSERT INTO `dtb_payment_options` VALUES (1,3,3);
INSERT INTO `dtb_payment_options` VALUES (1,4,4);
INSERT INTO `dtb_payment_options` VALUES (2,3,1);
/*!40000 ALTER TABLE `dtb_payment_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_payment_payment_id_seq`
--

DROP TABLE IF EXISTS `dtb_payment_payment_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_payment_payment_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_payment_payment_id_seq`
--

LOCK TABLES `dtb_payment_payment_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_payment_payment_id_seq` DISABLE KEYS */;
INSERT INTO `dtb_payment_payment_id_seq` VALUES (6);
/*!40000 ALTER TABLE `dtb_payment_payment_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_plugin`
--

DROP TABLE IF EXISTS `dtb_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_plugin` (
  `plugin_id` int NOT NULL,
  `plugin_name` text NOT NULL,
  `plugin_code` text NOT NULL,
  `class_name` text NOT NULL,
  `author` text,
  `author_site_url` text,
  `plugin_site_url` text,
  `plugin_version` text,
  `compliant_version` text,
  `plugin_description` text,
  `priority` int NOT NULL DEFAULT '0',
  `enable` smallint NOT NULL DEFAULT '0',
  `free_field1` text,
  `free_field2` text,
  `free_field3` text,
  `free_field4` text,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  PRIMARY KEY (`plugin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_plugin`
--

LOCK TABLES `dtb_plugin` WRITE;
/*!40000 ALTER TABLE `dtb_plugin` DISABLE KEYS */;
INSERT INTO `dtb_plugin` VALUES (1,'ソニーペイメントサービス決済プラグイン','SLNCore','SLNCore','ソニーペイメントサービス','http://www.sonypaymentservices.jp/','http://www.sonypaymentservices.jp/','1.0','2.17.0','ソニーペイメントサービス決済モジュールの動作に必要なプラグインです。決済を利用する場合に、本プラグインの無効化や削除はしないで下さい。',0,1,NULL,NULL,NULL,NULL,'2021-09-16 09:35:11','2021-09-16 09:35:11');
/*!40000 ALTER TABLE `dtb_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_plugin_hookpoint`
--

DROP TABLE IF EXISTS `dtb_plugin_hookpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_plugin_hookpoint` (
  `plugin_hookpoint_id` int NOT NULL,
  `plugin_id` int NOT NULL,
  `hook_point` text NOT NULL,
  `callback` text,
  `use_flg` smallint NOT NULL DEFAULT '1',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  PRIMARY KEY (`plugin_hookpoint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_plugin_hookpoint`
--

LOCK TABLES `dtb_plugin_hookpoint` WRITE;
/*!40000 ALTER TABLE `dtb_plugin_hookpoint` DISABLE KEYS */;
INSERT INTO `dtb_plugin_hookpoint` VALUES (1,1,'LC_Page_Admin_Basis_PaymentInput_action_after','hookActionAfter',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
INSERT INTO `dtb_plugin_hookpoint` VALUES (2,1,'LC_Page_Shopping_Payment_action_after','hookActionAfter',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
INSERT INTO `dtb_plugin_hookpoint` VALUES (3,1,'LC_Page_Shopping_Payment_action_before','hookActionBefore',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
INSERT INTO `dtb_plugin_hookpoint` VALUES (4,1,'LC_Page_Shopping_Complete_action_before','hookActionBefore',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
INSERT INTO `dtb_plugin_hookpoint` VALUES (5,1,'LC_Page_Admin_Order_Status_action_before','hookActionBefore',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
INSERT INTO `dtb_plugin_hookpoint` VALUES (6,1,'LC_Page_Admin_Order_Edit_action_before','hookActionBefore',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
INSERT INTO `dtb_plugin_hookpoint` VALUES (7,1,'LC_Page_Admin_Order_Edit_action_after','hookActionAfter',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
INSERT INTO `dtb_plugin_hookpoint` VALUES (8,1,'LC_Page_Admin_Order_action_before','hookActionBefore',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
INSERT INTO `dtb_plugin_hookpoint` VALUES (9,1,'LC_Page_Admin_Order_action_after','hookActionAfter',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
INSERT INTO `dtb_plugin_hookpoint` VALUES (10,1,'LC_Page_Mypage_Refusal_action_before','hookActionBefore',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
INSERT INTO `dtb_plugin_hookpoint` VALUES (11,1,'LC_Page_Admin_Customer_action_after','hookActionAfter',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
INSERT INTO `dtb_plugin_hookpoint` VALUES (12,1,'LC_Page_Products_Detail_action_before','hookActionBefore',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
INSERT INTO `dtb_plugin_hookpoint` VALUES (13,1,'LC_Page_Products_List_action_before','hookActionBefore',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
INSERT INTO `dtb_plugin_hookpoint` VALUES (14,1,'LC_Page_Cart_action_before','hookActionBefore',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
INSERT INTO `dtb_plugin_hookpoint` VALUES (15,1,'LC_Page_Shopping_action_before','hookActionBefore',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
INSERT INTO `dtb_plugin_hookpoint` VALUES (16,1,'LC_Page_Shopping_Payment_action_before','hookActionBefore',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
INSERT INTO `dtb_plugin_hookpoint` VALUES (17,1,'LC_Page_Shopping_Deliv_action_before','hookActionBefore',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
INSERT INTO `dtb_plugin_hookpoint` VALUES (18,1,'LC_Page_Shopping_Confirm_action_before','hookActionBefore',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
INSERT INTO `dtb_plugin_hookpoint` VALUES (19,1,'LC_Page_Shopping_Confirm_action_after','hookActionAfter',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
INSERT INTO `dtb_plugin_hookpoint` VALUES (20,1,'prefilterTransform','prefilterTransform',1,'2021-09-16 09:35:11','2021-09-16 09:35:11');
/*!40000 ALTER TABLE `dtb_plugin_hookpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_plugin_hookpoint_plugin_hookpoint_id_seq`
--

DROP TABLE IF EXISTS `dtb_plugin_hookpoint_plugin_hookpoint_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_plugin_hookpoint_plugin_hookpoint_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_plugin_hookpoint_plugin_hookpoint_id_seq`
--

LOCK TABLES `dtb_plugin_hookpoint_plugin_hookpoint_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_plugin_hookpoint_plugin_hookpoint_id_seq` DISABLE KEYS */;
INSERT INTO `dtb_plugin_hookpoint_plugin_hookpoint_id_seq` VALUES (20);
/*!40000 ALTER TABLE `dtb_plugin_hookpoint_plugin_hookpoint_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_plugin_plugin_id_seq`
--

DROP TABLE IF EXISTS `dtb_plugin_plugin_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_plugin_plugin_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_plugin_plugin_id_seq`
--

LOCK TABLES `dtb_plugin_plugin_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_plugin_plugin_id_seq` DISABLE KEYS */;
INSERT INTO `dtb_plugin_plugin_id_seq` VALUES (1);
/*!40000 ALTER TABLE `dtb_plugin_plugin_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_product_categories`
--

DROP TABLE IF EXISTS `dtb_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_product_categories` (
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  `RANK` int NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_product_categories`
--

LOCK TABLES `dtb_product_categories` WRITE;
/*!40000 ALTER TABLE `dtb_product_categories` DISABLE KEYS */;
INSERT INTO `dtb_product_categories` VALUES (1,1,1);
INSERT INTO `dtb_product_categories` VALUES (2,2,1);
INSERT INTO `dtb_product_categories` VALUES (3,3,1);
INSERT INTO `dtb_product_categories` VALUES (4,4,1);
INSERT INTO `dtb_product_categories` VALUES (5,6,1);
INSERT INTO `dtb_product_categories` VALUES (6,1,2);
INSERT INTO `dtb_product_categories` VALUES (7,2,2);
INSERT INTO `dtb_product_categories` VALUES (8,3,2);
INSERT INTO `dtb_product_categories` VALUES (9,4,2);
INSERT INTO `dtb_product_categories` VALUES (10,6,2);
INSERT INTO `dtb_product_categories` VALUES (11,1,3);
INSERT INTO `dtb_product_categories` VALUES (12,2,3);
INSERT INTO `dtb_product_categories` VALUES (13,3,3);
/*!40000 ALTER TABLE `dtb_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_product_status`
--

DROP TABLE IF EXISTS `dtb_product_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_product_status` (
  `product_status_id` smallint NOT NULL,
  `product_id` int NOT NULL,
  `creator_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `del_flg` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_status_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_product_status`
--

LOCK TABLES `dtb_product_status` WRITE;
/*!40000 ALTER TABLE `dtb_product_status` DISABLE KEYS */;
INSERT INTO `dtb_product_status` VALUES (1,1,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0);
INSERT INTO `dtb_product_status` VALUES (1,6,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0);
INSERT INTO `dtb_product_status` VALUES (1,11,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0);
INSERT INTO `dtb_product_status` VALUES (2,2,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0);
INSERT INTO `dtb_product_status` VALUES (2,7,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0);
INSERT INTO `dtb_product_status` VALUES (2,12,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0);
INSERT INTO `dtb_product_status` VALUES (3,3,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0);
INSERT INTO `dtb_product_status` VALUES (3,8,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0);
INSERT INTO `dtb_product_status` VALUES (3,13,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0);
INSERT INTO `dtb_product_status` VALUES (4,4,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0);
INSERT INTO `dtb_product_status` VALUES (4,9,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0);
INSERT INTO `dtb_product_status` VALUES (5,5,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0);
INSERT INTO `dtb_product_status` VALUES (5,10,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0);
/*!40000 ALTER TABLE `dtb_product_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_products`
--

DROP TABLE IF EXISTS `dtb_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_products` (
  `product_id` int NOT NULL,
  `name` text NOT NULL,
  `maker_id` int DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '2',
  `comment1` text,
  `comment2` text,
  `comment3` mediumtext,
  `comment4` text,
  `comment5` text,
  `comment6` text,
  `note` text,
  `main_list_comment` text,
  `main_list_image` text,
  `main_comment` mediumtext,
  `main_image` text,
  `main_large_image` text,
  `sub_title1` text,
  `sub_comment1` mediumtext,
  `sub_image1` text,
  `sub_large_image1` text,
  `sub_title2` text,
  `sub_comment2` mediumtext,
  `sub_image2` text,
  `sub_large_image2` text,
  `sub_title3` text,
  `sub_comment3` mediumtext,
  `sub_image3` text,
  `sub_large_image3` text,
  `sub_title4` text,
  `sub_comment4` mediumtext,
  `sub_image4` text,
  `sub_large_image4` text,
  `sub_title5` text,
  `sub_comment5` mediumtext,
  `sub_image5` text,
  `sub_large_image5` text,
  `sub_title6` text,
  `sub_comment6` mediumtext,
  `sub_image6` text,
  `sub_large_image6` text,
  `sub_title7` text,
  `sub_comment7` mediumtext,
  `sub_image7` text,
  `sub_large_image7` text,
  `sub_title8` text,
  `sub_comment8` mediumtext,
  `sub_image8` text,
  `sub_large_image8` text,
  `sub_title9` text,
  `sub_comment9` mediumtext,
  `sub_image9` text,
  `sub_large_image9` text,
  `sub_title10` text,
  `sub_comment10` mediumtext,
  `sub_image10` text,
  `sub_large_image10` text,
  `del_flg` smallint NOT NULL DEFAULT '0',
  `creator_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `deliv_date_id` int DEFAULT NULL,
  `customer_id` int NOT NULL,
  `withdrawal_flg` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_products`
--

LOCK TABLES `dtb_products` WRITE;
/*!40000 ALTER TABLE `dtb_products` DISABLE KEYS */;
INSERT INTO `dtb_products` VALUES (1,'Aバッグ',0,1,'','','','','','','','','','テスト\nテスト','','','','','','ice500.jpg','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',0,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,1,0);
INSERT INTO `dtb_products` VALUES (2,'B時計',0,1,'','','','','','','','','','テスト\nテスト','','','','','','nabe500.jpg','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',0,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,2,0);
INSERT INTO `dtb_products` VALUES (3,'C服',0,1,'','','','','','','','','','テスト\nテスト','','','','','','recipe500.jpg','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',0,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,3,0);
INSERT INTO `dtb_products` VALUES (4,'C時計',0,1,'','','','','','','','','','テスト\nテスト','','','','','','ice500.jpg','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',0,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,3,0);
INSERT INTO `dtb_products` VALUES (5,'D時計',0,1,'','','','','','','','','','テスト\nテスト','','','','','','nabe500.jpg','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',0,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,4,0);
INSERT INTO `dtb_products` VALUES (6,'D本',0,1,'','','','','','','','','','テスト\nテスト','','','','','','recipe500.jpg','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',0,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,4,0);
INSERT INTO `dtb_products` VALUES (7,'E時計',0,1,'','','','','','','','','','テスト\nテスト','','','','','','ice500.jpg','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',0,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,5,0);
INSERT INTO `dtb_products` VALUES (8,'F服',0,1,'','','','','','','','','','テスト\nテスト','','','','','','nabe500.jpg','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',0,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,6,0);
INSERT INTO `dtb_products` VALUES (9,'G本',0,1,'','','','','','','','','','テスト\nテスト','','','','','','recipe500.jpg','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',0,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,7,0);
INSERT INTO `dtb_products` VALUES (10,'Hバッグ',0,1,'','','','','','','','','','テスト\nテスト','','','','','','ice500.jpg','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',0,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,8,0);
INSERT INTO `dtb_products` VALUES (11,'I時計',0,1,'','','','','','','','','','テスト\nテスト','','','','','','nabe500.jpg','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',0,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,9,0);
INSERT INTO `dtb_products` VALUES (12,'I服',0,1,'','','','','','','','','','テスト\nテスト','','','','','','recipe500.jpg','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',0,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,9,0);
INSERT INTO `dtb_products` VALUES (13,'Jバッグ',0,1,'','','','','','','','','','テスト\nテスト','','','','','','ice500.jpg','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',0,0,'2021-10-06 00:00:00','2021-10-06 00:00:00',0,10,0);
/*!40000 ALTER TABLE `dtb_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_products_class`
--

DROP TABLE IF EXISTS `dtb_products_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_products_class` (
  `product_class_id` int NOT NULL,
  `product_id` int NOT NULL,
  `classcategory_id1` int NOT NULL DEFAULT '0',
  `classcategory_id2` int NOT NULL DEFAULT '0',
  `product_type_id` int NOT NULL DEFAULT '0',
  `product_code` text,
  `stock` decimal(10,0) DEFAULT NULL,
  `stock_unlimited` smallint NOT NULL DEFAULT '0',
  `sale_limit` decimal(10,0) DEFAULT NULL,
  `price01` decimal(10,0) DEFAULT NULL,
  `price02` decimal(10,0) NOT NULL,
  `deliv_fee` decimal(10,0) DEFAULT NULL,
  `point_rate` decimal(10,0) NOT NULL DEFAULT '0',
  `creator_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `down_filename` text,
  `down_realfilename` text,
  `del_flg` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_class_id`),
  UNIQUE KEY `dtb_products_class_unique_key` (`product_id`,`classcategory_id1`,`classcategory_id2`),
  KEY `dtb_products_class_product_id_key` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_products_class`
--

LOCK TABLES `dtb_products_class` WRITE;
/*!40000 ALTER TABLE `dtb_products_class` DISABLE KEYS */;
INSERT INTO `dtb_products_class` VALUES (1,1,0,0,1,'test-1',1,0,NULL,NULL,0,NULL,10,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',NULL,NULL,0);
INSERT INTO `dtb_products_class` VALUES (2,2,0,0,1,'test-2',1,0,NULL,NULL,0,NULL,10,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',NULL,NULL,0);
INSERT INTO `dtb_products_class` VALUES (3,3,0,0,1,'test-3',1,0,NULL,NULL,0,NULL,10,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',NULL,NULL,0);
INSERT INTO `dtb_products_class` VALUES (4,4,0,0,1,'test-4',1,0,NULL,NULL,0,NULL,10,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',NULL,NULL,0);
INSERT INTO `dtb_products_class` VALUES (5,5,0,0,1,'test-5',1,0,NULL,NULL,0,NULL,10,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',NULL,NULL,0);
INSERT INTO `dtb_products_class` VALUES (6,6,0,0,1,'test-6',1,0,NULL,NULL,0,NULL,10,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',NULL,NULL,0);
INSERT INTO `dtb_products_class` VALUES (7,7,0,0,1,'test-7',1,0,NULL,NULL,0,NULL,10,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',NULL,NULL,0);
INSERT INTO `dtb_products_class` VALUES (8,8,0,0,1,'test-8',1,0,NULL,NULL,0,NULL,10,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',NULL,NULL,0);
INSERT INTO `dtb_products_class` VALUES (9,9,0,0,1,'test-9',1,0,NULL,NULL,0,NULL,10,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',NULL,NULL,0);
INSERT INTO `dtb_products_class` VALUES (10,10,0,0,1,'test-10',1,0,NULL,NULL,0,NULL,10,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',NULL,NULL,0);
INSERT INTO `dtb_products_class` VALUES (11,11,0,0,1,'test-11',1,0,NULL,NULL,0,NULL,10,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',NULL,NULL,0);
INSERT INTO `dtb_products_class` VALUES (12,12,0,0,1,'test-12',1,0,NULL,NULL,0,NULL,10,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',NULL,NULL,0);
INSERT INTO `dtb_products_class` VALUES (13,13,0,0,1,'test-13',1,0,NULL,NULL,0,NULL,10,2,'2021-10-06 00:00:00','2021-10-06 00:00:00',NULL,NULL,0);
/*!40000 ALTER TABLE `dtb_products_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_products_class_product_class_id_seq`
--

DROP TABLE IF EXISTS `dtb_products_class_product_class_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_products_class_product_class_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_products_class_product_class_id_seq`
--

LOCK TABLES `dtb_products_class_product_class_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_products_class_product_class_id_seq` DISABLE KEYS */;
INSERT INTO `dtb_products_class_product_class_id_seq` VALUES (13);
/*!40000 ALTER TABLE `dtb_products_class_product_class_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_products_product_id_seq`
--

DROP TABLE IF EXISTS `dtb_products_product_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_products_product_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_products_product_id_seq`
--

LOCK TABLES `dtb_products_product_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_products_product_id_seq` DISABLE KEYS */;
INSERT INTO `dtb_products_product_id_seq` VALUES (13);
/*!40000 ALTER TABLE `dtb_products_product_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_recommend_products`
--

DROP TABLE IF EXISTS `dtb_recommend_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_recommend_products` (
  `product_id` int NOT NULL,
  `recommend_product_id` int NOT NULL,
  `RANK` int NOT NULL,
  `comment` text,
  `status` smallint NOT NULL DEFAULT '0',
  `creator_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  PRIMARY KEY (`product_id`,`recommend_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_recommend_products`
--

LOCK TABLES `dtb_recommend_products` WRITE;
/*!40000 ALTER TABLE `dtb_recommend_products` DISABLE KEYS */;
INSERT INTO `dtb_recommend_products` VALUES (2,1,4,'お口直しに。',0,2,'2021-01-13 01:40:23','2021-01-13 01:40:23');
/*!40000 ALTER TABLE `dtb_recommend_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_review`
--

DROP TABLE IF EXISTS `dtb_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_review` (
  `review_id` int NOT NULL,
  `product_id` int NOT NULL,
  `reviewer_name` text NOT NULL,
  `reviewer_url` text,
  `sex` smallint DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `recommend_level` smallint NOT NULL,
  `title` text NOT NULL,
  `comment` text NOT NULL,
  `status` smallint DEFAULT '2',
  `creator_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `del_flg` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_review`
--

LOCK TABLES `dtb_review` WRITE;
/*!40000 ALTER TABLE `dtb_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_review_review_id_seq`
--

DROP TABLE IF EXISTS `dtb_review_review_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_review_review_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_review_review_id_seq`
--

LOCK TABLES `dtb_review_review_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_review_review_id_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_review_review_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_send_customer`
--

DROP TABLE IF EXISTS `dtb_send_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_send_customer` (
  `customer_id` int NOT NULL,
  `send_id` int NOT NULL,
  `email` text,
  `name` text,
  `send_flag` smallint DEFAULT NULL,
  PRIMARY KEY (`send_id`,`customer_id`),
  KEY `dtb_send_customer_customer_id_key` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_send_customer`
--

LOCK TABLES `dtb_send_customer` WRITE;
/*!40000 ALTER TABLE `dtb_send_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_send_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_send_history`
--

DROP TABLE IF EXISTS `dtb_send_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_send_history` (
  `send_id` int NOT NULL,
  `mail_method` smallint DEFAULT NULL,
  `subject` text,
  `body` text,
  `send_count` int DEFAULT NULL,
  `complete_count` int NOT NULL DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `search_data` text,
  `del_flg` smallint NOT NULL DEFAULT '0',
  `creator_id` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  PRIMARY KEY (`send_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_send_history`
--

LOCK TABLES `dtb_send_history` WRITE;
/*!40000 ALTER TABLE `dtb_send_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_send_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_send_history_send_id_seq`
--

DROP TABLE IF EXISTS `dtb_send_history_send_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_send_history_send_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_send_history_send_id_seq`
--

LOCK TABLES `dtb_send_history_send_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_send_history_send_id_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_send_history_send_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_session`
--

DROP TABLE IF EXISTS `dtb_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_session` (
  `sess_id` text NOT NULL,
  `sess_data` longtext,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  PRIMARY KEY (`sess_id`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_session`
--

LOCK TABLES `dtb_session` WRITE;
/*!40000 ALTER TABLE `dtb_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_shipment_item`
--

DROP TABLE IF EXISTS `dtb_shipment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_shipment_item` (
  `shipping_id` int NOT NULL,
  `product_class_id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_name` text NOT NULL,
  `product_code` text,
  `classcategory_name1` text,
  `classcategory_name2` text,
  `price` decimal(10,0) DEFAULT NULL,
  `quantity` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`shipping_id`,`product_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_shipment_item`
--

LOCK TABLES `dtb_shipment_item` WRITE;
/*!40000 ALTER TABLE `dtb_shipment_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_shipment_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_shipping`
--

DROP TABLE IF EXISTS `dtb_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_shipping` (
  `shipping_id` int NOT NULL,
  `order_id` int NOT NULL,
  `shipping_name01` text,
  `shipping_name02` text,
  `shipping_kana01` text,
  `shipping_kana02` text,
  `shipping_company_name` text,
  `shipping_tel01` text,
  `shipping_tel02` text,
  `shipping_tel03` text,
  `shipping_fax01` text,
  `shipping_fax02` text,
  `shipping_fax03` text,
  `shipping_country_id` int DEFAULT NULL,
  `shipping_pref` smallint DEFAULT NULL,
  `shipping_zip01` text,
  `shipping_zip02` text,
  `shipping_zipcode` text,
  `shipping_addr01` text,
  `shipping_addr02` text,
  `time_id` int DEFAULT NULL,
  `shipping_time` text,
  `shipping_date` datetime DEFAULT NULL,
  `shipping_commit_date` datetime DEFAULT NULL,
  `RANK` int DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `del_flg` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`,`shipping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_shipping`
--

LOCK TABLES `dtb_shipping` WRITE;
/*!40000 ALTER TABLE `dtb_shipping` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_tax_rule`
--

DROP TABLE IF EXISTS `dtb_tax_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_tax_rule` (
  `tax_rule_id` int NOT NULL,
  `country_id` int NOT NULL DEFAULT '0',
  `pref_id` int NOT NULL DEFAULT '0',
  `product_id` int NOT NULL DEFAULT '0',
  `product_class_id` int NOT NULL DEFAULT '0',
  `calc_rule` smallint NOT NULL DEFAULT '1',
  `tax_rate` decimal(10,0) NOT NULL DEFAULT '8',
  `tax_adjust` decimal(10,0) NOT NULL DEFAULT '0',
  `apply_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `member_id` int NOT NULL,
  `del_flg` smallint NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL,
  `update_date` timestamp NOT NULL,
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_tax_rule`
--

LOCK TABLES `dtb_tax_rule` WRITE;
/*!40000 ALTER TABLE `dtb_tax_rule` DISABLE KEYS */;
INSERT INTO `dtb_tax_rule` VALUES (0,0,0,0,0,1,8,0,'2021-01-13 01:40:27',1,0,'2021-01-13 01:40:27','2021-01-13 01:40:27');
/*!40000 ALTER TABLE `dtb_tax_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_tax_rule_tax_rule_id_seq`
--

DROP TABLE IF EXISTS `dtb_tax_rule_tax_rule_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_tax_rule_tax_rule_id_seq` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_tax_rule_tax_rule_id_seq`
--

LOCK TABLES `dtb_tax_rule_tax_rule_id_seq` WRITE;
/*!40000 ALTER TABLE `dtb_tax_rule_tax_rule_id_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_tax_rule_tax_rule_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_templates`
--

DROP TABLE IF EXISTS `dtb_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_templates` (
  `template_code` text NOT NULL,
  `device_type_id` int NOT NULL,
  `template_name` text,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  PRIMARY KEY (`template_code`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_templates`
--

LOCK TABLES `dtb_templates` WRITE;
/*!40000 ALTER TABLE `dtb_templates` DISABLE KEYS */;
INSERT INTO `dtb_templates` VALUES ('default',10,'デフォルト','2021-01-13 01:40:23','2021-01-13 01:40:23');
INSERT INTO `dtb_templates` VALUES ('mobile',1,'モバイル','2021-01-13 01:40:23','2021-01-13 01:40:23');
INSERT INTO `dtb_templates` VALUES ('sphone',2,'スマートフォン','2021-01-13 01:40:23','2021-01-13 01:40:23');
/*!40000 ALTER TABLE `dtb_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dtb_update`
--

DROP TABLE IF EXISTS `dtb_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtb_update` (
  `module_id` int NOT NULL,
  `module_name` text NOT NULL,
  `now_version` text,
  `latest_version` text NOT NULL,
  `module_explain` text,
  `main_php` text NOT NULL,
  `extern_php` text NOT NULL,
  `install_sql` text,
  `uninstall_sql` text,
  `other_files` text,
  `del_flg` smallint NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `release_date` datetime NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtb_update`
--

LOCK TABLES `dtb_update` WRITE;
/*!40000 ALTER TABLE `dtb_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtb_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_allowed_tag`
--

DROP TABLE IF EXISTS `mtb_allowed_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_allowed_tag` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_allowed_tag`
--

LOCK TABLES `mtb_allowed_tag` WRITE;
/*!40000 ALTER TABLE `mtb_allowed_tag` DISABLE KEYS */;
INSERT INTO `mtb_allowed_tag` VALUES (0,'table',0);
INSERT INTO `mtb_allowed_tag` VALUES (1,'tr',1);
INSERT INTO `mtb_allowed_tag` VALUES (2,'td',2);
INSERT INTO `mtb_allowed_tag` VALUES (3,'a',3);
INSERT INTO `mtb_allowed_tag` VALUES (4,'b',4);
INSERT INTO `mtb_allowed_tag` VALUES (5,'blink',5);
INSERT INTO `mtb_allowed_tag` VALUES (6,'br',6);
INSERT INTO `mtb_allowed_tag` VALUES (7,'center',7);
INSERT INTO `mtb_allowed_tag` VALUES (8,'font',8);
INSERT INTO `mtb_allowed_tag` VALUES (9,'span',9);
INSERT INTO `mtb_allowed_tag` VALUES (10,'hr',10);
INSERT INTO `mtb_allowed_tag` VALUES (11,'img',11);
INSERT INTO `mtb_allowed_tag` VALUES (12,'li',12);
INSERT INTO `mtb_allowed_tag` VALUES (13,'strong',13);
INSERT INTO `mtb_allowed_tag` VALUES (14,'p',14);
INSERT INTO `mtb_allowed_tag` VALUES (15,'div',15);
INSERT INTO `mtb_allowed_tag` VALUES (16,'i',16);
INSERT INTO `mtb_allowed_tag` VALUES (17,'u',17);
INSERT INTO `mtb_allowed_tag` VALUES (18,'s',18);
INSERT INTO `mtb_allowed_tag` VALUES (19,'h1',19);
INSERT INTO `mtb_allowed_tag` VALUES (20,'h2',20);
INSERT INTO `mtb_allowed_tag` VALUES (21,'h3',21);
INSERT INTO `mtb_allowed_tag` VALUES (22,'h4',22);
INSERT INTO `mtb_allowed_tag` VALUES (23,'h5',23);
INSERT INTO `mtb_allowed_tag` VALUES (24,'h6',24);
INSERT INTO `mtb_allowed_tag` VALUES (25,'tbody',25);
INSERT INTO `mtb_allowed_tag` VALUES (26,'thead',26);
INSERT INTO `mtb_allowed_tag` VALUES (27,'tfoot',27);
INSERT INTO `mtb_allowed_tag` VALUES (28,'th',28);
INSERT INTO `mtb_allowed_tag` VALUES (29,'ul',29);
INSERT INTO `mtb_allowed_tag` VALUES (30,'ol',30);
INSERT INTO `mtb_allowed_tag` VALUES (31,'dl',31);
INSERT INTO `mtb_allowed_tag` VALUES (32,'dt',32);
INSERT INTO `mtb_allowed_tag` VALUES (33,'dd',33);
/*!40000 ALTER TABLE `mtb_allowed_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_auth_excludes`
--

DROP TABLE IF EXISTS `mtb_auth_excludes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_auth_excludes` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_auth_excludes`
--

LOCK TABLES `mtb_auth_excludes` WRITE;
/*!40000 ALTER TABLE `mtb_auth_excludes` DISABLE KEYS */;
INSERT INTO `mtb_auth_excludes` VALUES (0,'index.php',0);
INSERT INTO `mtb_auth_excludes` VALUES (1,'logout.php',1);
/*!40000 ALTER TABLE `mtb_auth_excludes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_authority`
--

DROP TABLE IF EXISTS `mtb_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_authority` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_authority`
--

LOCK TABLES `mtb_authority` WRITE;
/*!40000 ALTER TABLE `mtb_authority` DISABLE KEYS */;
INSERT INTO `mtb_authority` VALUES (0,'システム管理者',0);
INSERT INTO `mtb_authority` VALUES (1,'店舗オーナー',1);
/*!40000 ALTER TABLE `mtb_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_constants`
--

DROP TABLE IF EXISTS `mtb_constants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_constants` (
  `id` text NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  `remarks` text,
  PRIMARY KEY (`id`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_constants`
--

LOCK TABLES `mtb_constants` WRITE;
/*!40000 ALTER TABLE `mtb_constants` DISABLE KEYS */;
INSERT INTO `mtb_constants` VALUES ('ADMIN_HOME_URLPATH','ROOT_URLPATH . ADMIN_DIR . \"home.php\"',165,'ホーム');
INSERT INTO `mtb_constants` VALUES ('ADMIN_ID','\"1\"',74,'管理ユーザID(メンテナンス用表示されない。)');
INSERT INTO `mtb_constants` VALUES ('ADMIN_LOG_REALFILE','DATA_REALDIR . \"logs/admin.log\"',144,'管理機能ログファイル');
INSERT INTO `mtb_constants` VALUES ('ADMIN_LOGIN_URLPATH','ROOT_URLPATH . ADMIN_DIR . DIR_INDEX_PATH',166,'ログインページ');
INSERT INTO `mtb_constants` VALUES ('ADMIN_LOGOUT_URLPATH','ROOT_URLPATH . ADMIN_DIR . \"logout.php\"',171,'ログアウトページ');
INSERT INTO `mtb_constants` VALUES ('ADMIN_MODE','0',90,'管理モード 1:有効　0:無効(納品時)');
INSERT INTO `mtb_constants` VALUES ('ADMIN_NEWS_STARTYEAR','2005',264,'新着情報管理画面 開始年(西暦) ');
INSERT INTO `mtb_constants` VALUES ('ADMIN_ORDER_EDIT_URLPATH','ROOT_URLPATH . ADMIN_DIR . \"order/edit.php\"',168,'注文編集ページ');
INSERT INTO `mtb_constants` VALUES ('ADMIN_ORDER_MAIL_URLPATH','ROOT_URLPATH . ADMIN_DIR . \"order/mail.php\"',170,'注文編集ページ');
INSERT INTO `mtb_constants` VALUES ('ADMIN_ORDER_URLPATH','ROOT_URLPATH . ADMIN_DIR . \"order/\" . DIR_INDEX_PATH',169,'注文編集ページ');
INSERT INTO `mtb_constants` VALUES ('ADMIN_PRODUCTS_URLPATH','ROOT_URLPATH . ADMIN_DIR . \"products/\" . DIR_INDEX_PATH',167,'商品検索ページ');
INSERT INTO `mtb_constants` VALUES ('ADMIN_SYSTEM_URLPATH','ROOT_URLPATH . ADMIN_DIR . \"system/\" . DIR_INDEX_PATH',159,'システム管理トップ');
INSERT INTO `mtb_constants` VALUES ('ADMIN_TITLE','\"EC-CUBE 管理機能\"',134,'管理機能タイトル');
INSERT INTO `mtb_constants` VALUES ('AMOUNT_LEN','6',199,'在庫数、販売制限数');
INSERT INTO `mtb_constants` VALUES ('API_ENABLE_FLAG','false',1420,'API機能を有効にする(true:する false:しない)');
INSERT INTO `mtb_constants` VALUES ('AUTH_TYPE','\"HMAC\"',10,'認証方式');
INSERT INTO `mtb_constants` VALUES ('BIRTH_MONTH_POINT','0',98,'誕生日月ポイント');
INSERT INTO `mtb_constants` VALUES ('BIRTH_YEAR','1901',83,'生年月日登録開始年');
INSERT INTO `mtb_constants` VALUES ('BLOC_DIR','\"frontparts/bloc/\"',311,'ブロックファイル保存先');
INSERT INTO `mtb_constants` VALUES ('CART_URL','HTTP_URL . \"cart/\" . DIR_INDEX_PATH',240,'カートトップ');
INSERT INTO `mtb_constants` VALUES ('CATEGORY_HEAD','\">\"',138,'親カテゴリ表示文字');
INSERT INTO `mtb_constants` VALUES ('CATEGORY_MAX','1000',133,'最大カテゴリ登録数');
INSERT INTO `mtb_constants` VALUES ('CERT_STRING','\"7WDhcBTF\"',80,'認証文字列');
INSERT INTO `mtb_constants` VALUES ('CHAR_CODE','\"UTF-8\"',39,'文字コード');
INSERT INTO `mtb_constants` VALUES ('CLOSE_DAY','31',45,'締め日の指定(末日の場合は、31を指定してください。)');
INSERT INTO `mtb_constants` VALUES ('COMPILE_ADMIN_REALDIR','DATA_REALDIR . \"Smarty/templates_c/admin/\"',310,'SMARTYコンパイル(管理機能)');
INSERT INTO `mtb_constants` VALUES ('COMPILE_REALDIR','DATA_REALDIR . \"Smarty/templates_c/\" . TEMPLATE_NAME . \"/\"',309,'SMARTYコンパイル');
INSERT INTO `mtb_constants` VALUES ('COOKIE_EXPIRE','365',212,'クッキー保持期限(日)');
INSERT INTO `mtb_constants` VALUES ('CREDIT_ADD_YEAR','10',85,'クレジットカードの期限＋何年');
INSERT INTO `mtb_constants` VALUES ('CREDIT_NO_LEN','4',207,'クレジットカードの文字数 (*モジュールで使用)');
INSERT INTO `mtb_constants` VALUES ('CSV_LINE_MAX','10000',128,'CSVアップロード1行あたりの最大文字数');
INSERT INTO `mtb_constants` VALUES ('CSV_SIZE','2000',127,'CSVサイズ制限(KB)');
INSERT INTO `mtb_constants` VALUES ('CSV_TEMP_REALDIR','DATA_REALDIR . \"upload/csv/\"',156,'エンコードCSVの一時保存先');
INSERT INTO `mtb_constants` VALUES ('CUSTOMER_CONFIRM_MAIL','true',75,'会員登録時に仮会員確認メールを送信するか (true:仮会員、false:本会員)');
INSERT INTO `mtb_constants` VALUES ('CUSTOMER_LOG_REALFILE','DATA_REALDIR . \"logs/customer.log\"',143,'会員ログイン ログファイル');
INSERT INTO `mtb_constants` VALUES ('CV_PAYMENT_LIMIT','14',275,'支払期限 (*モジュールで使用)');
INSERT INTO `mtb_constants` VALUES ('DB_LOG_REALFILE','DATA_REALDIR . \"logs/db.log\"',147,'DBログファイル');
INSERT INTO `mtb_constants` VALUES ('DEBUG_LOG_REALFILE','\"\"',145,'デバッグログファイル(未入力:標準ログファイル・管理画面ログファイル)');
INSERT INTO `mtb_constants` VALUES ('DEBUG_MODE','false',72,'デバッグモード(true：sfPrintRやDBのエラーメッセージ、ログレベルがDebugのログを出力する、false：出力しない)');
INSERT INTO `mtb_constants` VALUES ('DEFAULT_COUNTRY_ID','392',1413,'デフォルト国コード ISO_3166-1に準拠');
INSERT INTO `mtb_constants` VALUES ('DEFAULT_PASSWORD','\"******\"',66,'会員登録変更(マイページ)パスワード用');
INSERT INTO `mtb_constants` VALUES ('DEFAULT_PRODUCT_DISP','2',56,'1:公開 2:非公開');
INSERT INTO `mtb_constants` VALUES ('DEFAULT_PRODUCT_DOWN','1',703,'1:実商品 2:ダウンロード');
INSERT INTO `mtb_constants` VALUES ('DEFAULT_TEMPLATE_NAME','\"default\"',300,'デフォルトテンプレート名(PC)');
INSERT INTO `mtb_constants` VALUES ('DELIV_ADDR_MAX','20',67,'別のお届け先最大登録数');
INSERT INTO `mtb_constants` VALUES ('DELIV_DATE_END_MAX','21',272,'お届け可能日以降のプルダウン表示最大日数');
INSERT INTO `mtb_constants` VALUES ('DELIV_FREE_AMOUNT','0',57,'送料無料購入数量 (0の場合は、いくつ買っても無料にならない)');
INSERT INTO `mtb_constants` VALUES ('DELIV_URLPATH','ROOT_URLPATH . \"shopping/deliv.php\"',241,'お届け先設定');
INSERT INTO `mtb_constants` VALUES ('DELIVFEE_MAX','47',187,'配送料金の最大表示数');
INSERT INTO `mtb_constants` VALUES ('DELIVTIME_MAX','16',186,'お届け時間の最大表示数');
INSERT INTO `mtb_constants` VALUES ('DEVICE_TYPE_ADMIN','99',1103,'端末種別: 管理画面');
INSERT INTO `mtb_constants` VALUES ('DEVICE_TYPE_MOBILE','1',1100,'端末種別: モバイル');
INSERT INTO `mtb_constants` VALUES ('DEVICE_TYPE_PC','10',1102,'端末種別: PC');
INSERT INTO `mtb_constants` VALUES ('DEVICE_TYPE_SMARTPHONE','2',1101,'端末種別: スマートフォン');
INSERT INTO `mtb_constants` VALUES ('DISABLED_RGB','\"#C9C9C9\"',136,'入力項目無効時の表示色');
INSERT INTO `mtb_constants` VALUES ('DOWN_SAVE_REALDIR','DATA_REALDIR . \"download/save/\"',705,'ダウンロードファイル保存先');
INSERT INTO `mtb_constants` VALUES ('DOWN_SIZE','50000',702,'ダウンロード販売ファイル用サイズ制限(KB)');
INSERT INTO `mtb_constants` VALUES ('DOWN_TEMP_REALDIR','DATA_REALDIR . \"download/temp/\"',704,'ダウンロードファイル一時保存');
INSERT INTO `mtb_constants` VALUES ('DOWNLOAD_BLOCK','1024',708,'ダウンロード販売機能 ダウンロードファイル読み込みバイト(KB)');
INSERT INTO `mtb_constants` VALUES ('DOWNLOAD_DAYS_LEN','3',700,'日数桁数');
INSERT INTO `mtb_constants` VALUES ('DOWNLOAD_EXTENSION','\"zip,lzh,jpg,jpeg,gif,png,mp3,pdf,csv\"',701,'ダウンロードファイル登録可能拡張子(カンマ区切り)');
INSERT INTO `mtb_constants` VALUES ('DOWNLOADS_TEMP_PLUGIN_INSTALL_DIR','DATA_REALDIR . \"downloads/tmp/plugin_install/\"',613,'プラグイン一時展開用ディレクトリ（インストール用）');
INSERT INTO `mtb_constants` VALUES ('DOWNLOADS_TEMP_PLUGIN_UPDATE_DIR','DATA_REALDIR . \"downloads/tmp/plugin_update/\"',612,'プラグイン一時展開用ディレクトリ（アップデート用）');
INSERT INTO `mtb_constants` VALUES ('ECCUBE_INFO','true',1218,'EC-CUBE更新情報取得 (true:取得する false:取得しない)');
INSERT INTO `mtb_constants` VALUES ('ECCUBE_PAYMENT','\"EC-CUBE\"',41,'決済モジュール付与文言');
INSERT INTO `mtb_constants` VALUES ('ENTRY_LIMIT_HOUR','1',267,'再入会制限時間 (単位: 時間)');
INSERT INTO `mtb_constants` VALUES ('ENTRY_URL','HTTPS_URL . \"entry/\" . DIR_INDEX_PATH',238,'会員登録ページTOP');
INSERT INTO `mtb_constants` VALUES ('ERR_COLOR','\"#ffe8e8\"',137,'エラー時表示色');
INSERT INTO `mtb_constants` VALUES ('ERROR_LOG_REALFILE','DATA_REALDIR . \"logs/error.log\"',146,'エラーログファイル(未入力:標準ログファイル・管理画面ログファイル)');
INSERT INTO `mtb_constants` VALUES ('FAVORITE_ERROR','13',46,'一般サイトエラー');
INSERT INTO `mtb_constants` VALUES ('FILE_NAME_LEN','10',209,'ファイル名表示文字数');
INSERT INTO `mtb_constants` VALUES ('FILE_SIZE','10000',130,'ファイル管理画面アップ制限(KB)');
INSERT INTO `mtb_constants` VALUES ('FORGOT_MAIL','0',95,'パスワード忘れの確認メールを送付するか否か。(0:送信しない、1:送信する)');
INSERT INTO `mtb_constants` VALUES ('FORM_COUNTRY_ENABLE','false',1415,'各種フォームで国の指定を有効にする(true:有効 false:無効)');
INSERT INTO `mtb_constants` VALUES ('GRAPH_LABEL_MAX','40',52,'グラフのラベルの文字数');
INSERT INTO `mtb_constants` VALUES ('GRAPH_PIE_MAX','10',51,'円グラフ最大表示数');
INSERT INTO `mtb_constants` VALUES ('GRAPH_REALDIR','HTML_REALDIR . \"upload/graph_image/\"',49,'グラフ格納ディレクトリ');
INSERT INTO `mtb_constants` VALUES ('GRAPH_URLPATH','ROOT_URLPATH . \"upload/graph_image/\"',50,'グラフURL');
INSERT INTO `mtb_constants` VALUES ('HOOK_POINT_PREPROCESS','\"LC_Page_preProcess\"',1301,'フックポイント(プレプロセス)');
INSERT INTO `mtb_constants` VALUES ('HOOK_POINT_PROCESS','\"LC_Page_process\"',1302,'フックポイント(プロセス)');
INSERT INTO `mtb_constants` VALUES ('HTTP_REQUEST_TIMEOUT','\"5\"',1219,'外部サイトHTTP取得タイムアウト時間(秒)');
INSERT INTO `mtb_constants` VALUES ('ID_MAX_LEN','STEXT_LEN',195,'管理画面用：ID・パスワードの最大文字数');
INSERT INTO `mtb_constants` VALUES ('ID_MIN_LEN','4',196,'管理画面用：ID・パスワードの最小文字数');
INSERT INTO `mtb_constants` VALUES ('IMAGE_RENAME','true',525,'画像リネーム設定 (商品画像のみ) (true:リネームする、false:リネームしない)');
INSERT INTO `mtb_constants` VALUES ('IMAGE_SAVE_REALDIR','HTML_REALDIR . \"upload/save_image/\"',151,'画像保存先');
INSERT INTO `mtb_constants` VALUES ('IMAGE_SAVE_RSS_URL','HTTP_URL . \"upload/save_image/\"',155,'RSS用画像保存先URL');
INSERT INTO `mtb_constants` VALUES ('IMAGE_SAVE_URLPATH','ROOT_URLPATH . \"upload/save_image/\"',153,'画像保存先URL');
INSERT INTO `mtb_constants` VALUES ('IMAGE_SIZE','10240',126,'画像サイズ制限(KB)');
INSERT INTO `mtb_constants` VALUES ('IMAGE_TEMP_REALDIR','HTML_REALDIR . \"upload/temp_image/\"',150,'画像一時保存');
INSERT INTO `mtb_constants` VALUES ('IMAGE_TEMP_RSS_URL','HTTP_URL . \"upload/temp_image/\"',154,'RSS用画像一時保存URL');
INSERT INTO `mtb_constants` VALUES ('IMAGE_TEMP_URLPATH','ROOT_URLPATH . \"upload/temp_image/\"',152,'画像一時保存URL');
INSERT INTO `mtb_constants` VALUES ('INPUT_DELIV_FEE','1',58,'配送料の設定画面表示(有効:1 無効:0)');
INSERT INTO `mtb_constants` VALUES ('INPUT_ZIP_URLPATH','ROOT_URLPATH . \"input_zip.php\"',161,'郵便番号入力');
INSERT INTO `mtb_constants` VALUES ('INT_LEN','9',206,'検査数値用桁数(INT)');
INSERT INTO `mtb_constants` VALUES ('LARGE_IMAGE_HEIGHT','500',111,'拡大画像縦');
INSERT INTO `mtb_constants` VALUES ('LARGE_IMAGE_WIDTH','500',110,'拡大画像横');
INSERT INTO `mtb_constants` VALUES ('LARGE_SUBIMAGE_HEIGHT','500',119,'拡大サブ画像縦');
INSERT INTO `mtb_constants` VALUES ('LARGE_SUBIMAGE_WIDTH','500',118,'拡大サブ画像横');
INSERT INTO `mtb_constants` VALUES ('LEVEL_MAX','2',132,'カテゴリの最大階層');
INSERT INTO `mtb_constants` VALUES ('LLTEXT_LEN','99999',193,'超長文の文字数 (メルマガなど)');
INSERT INTO `mtb_constants` VALUES ('LOCALE','\"ja_JP.UTF-8\"',40,'ロケール設定');
INSERT INTO `mtb_constants` VALUES ('LOG_REALFILE','DATA_REALDIR . \"logs/site.log\"',142,'標準ログファイル');
INSERT INTO `mtb_constants` VALUES ('LOGIN_FRAME','\"login_frame.tpl\"',77,'ログイン画面フレーム');
INSERT INTO `mtb_constants` VALUES ('LOGIN_RETRY_INTERVAL','0',1411,'ログイン失敗時の遅延時間(秒)(ブルートフォースアタック対策)');
INSERT INTO `mtb_constants` VALUES ('LTEXT_LEN','3000',192,'長文の文字数');
INSERT INTO `mtb_constants` VALUES ('MAIN_FRAME','\"main_frame.tpl\"',78,'管理画面フレーム');
INSERT INTO `mtb_constants` VALUES ('MASTER_DATA_REALDIR','DATA_REALDIR . \"cache/\"',27,'マスターデータキャッシュディレクトリ');
INSERT INTO `mtb_constants` VALUES ('MAX_LIFETIME','7776000',26,'DBセッションの有効期限(秒)');
INSERT INTO `mtb_constants` VALUES ('MAX_LOG_QUANTITY','5',92,'ログファイル最大数(ログテーション)');
INSERT INTO `mtb_constants` VALUES ('MAX_LOG_SIZE','\"1000000\"',93,'1つのログファイルに保存する最大容量(byte)');
INSERT INTO `mtb_constants` VALUES ('MEMBER_PMAX','10',182,'メンバー管理ページ表示行数');
INSERT INTO `mtb_constants` VALUES ('MLTEXT_LEN','1000',191,'長中文の文字数 (問い合わせなど)');
INSERT INTO `mtb_constants` VALUES ('MOBILE_CART_URLPATH','ROOT_URLPATH . \"cart/\" . DIR_INDEX_PATH',411,'カートトップ');
INSERT INTO `mtb_constants` VALUES ('MOBILE_COMPILE_REALDIR','DATA_REALDIR . \"Smarty/templates_c/\" . MOBILE_TEMPLATE_NAME . \"/\"',313,'SMARTYコンパイル(mobile)');
INSERT INTO `mtb_constants` VALUES ('MOBILE_DEFAULT_TEMPLATE_NAME','\"mobile\"',301,'デフォルトテンプレート名(モバイル)');
INSERT INTO `mtb_constants` VALUES ('MOBILE_IMAGE_REALDIR','HTML_REALDIR . \"upload/mobile_image/\"',408,'携帯電話向け変換画像保存ディレクトリ');
INSERT INTO `mtb_constants` VALUES ('MOBILE_IMAGE_URLPATH','ROOT_URLPATH . \"upload/mobile_image/\"',409,'携帯電話向け変換画像保存ディレクトリ');
INSERT INTO `mtb_constants` VALUES ('MOBILE_P_DETAIL_URLPATH','ROOT_URLPATH . \"products/detail.php?product_id=\"',415,'商品詳細(HTML出力)');
INSERT INTO `mtb_constants` VALUES ('MOBILE_SESSION_LIFETIME','1800',402,'モバイルサイトのセッションの存続時間 (秒)');
INSERT INTO `mtb_constants` VALUES ('MOBILE_SHOPPING_COMPLETE_URLPATH','ROOT_URLPATH . \"shopping/complete.php\"',416,'購入完了画面 (*モジュールで使用)');
INSERT INTO `mtb_constants` VALUES ('MOBILE_SHOPPING_CONFIRM_URLPATH','ROOT_URLPATH . \"shopping/confirm.php\"',413,'購入確認ページ');
INSERT INTO `mtb_constants` VALUES ('MOBILE_SHOPPING_PAYMENT_URLPATH','ROOT_URLPATH . \"shopping/payment.php\"',414,'お支払い方法選択ページ');
INSERT INTO `mtb_constants` VALUES ('MOBILE_TEMPLATE_NAME','\"mobile\"',304,'モバイルテンプレート名');
INSERT INTO `mtb_constants` VALUES ('MOBILE_TEMPLATE_REALDIR','SMARTY_TEMPLATES_REALDIR . MOBILE_TEMPLATE_NAME . \"/\"',312,'SMARTYテンプレート(mobile)');
INSERT INTO `mtb_constants` VALUES ('MOBILE_TOP_URLPATH','ROOT_URLPATH . DIR_INDEX_PATH',410,'モバイルURL');
INSERT INTO `mtb_constants` VALUES ('MODULE_DIR','\"downloads/module/\"',22,'ダウンロードモジュール保存ディレクトリ');
INSERT INTO `mtb_constants` VALUES ('MODULE_REALDIR','DATA_REALDIR . MODULE_DIR',23,'ダウンロードモジュール保存ディレクトリ');
INSERT INTO `mtb_constants` VALUES ('MTEXT_LEN','200',190,'長い項目の文字数 (住所など)');
INSERT INTO `mtb_constants` VALUES ('MULTIPLE_URLPATH','ROOT_URLPATH . \"shopping/multiple.php\"',242,'複数お届け先設定');
INSERT INTO `mtb_constants` VALUES ('MYPAGE_DELIVADDR_URLPATH','ROOT_URLPATH . \"mypage/delivery.php\"',254,'マイページお届け先URL');
INSERT INTO `mtb_constants` VALUES ('MYPAGE_ORDER_STATUS_DISP_FLAG','true',1412,'MYページ：ご注文状況表示フラグ');
INSERT INTO `mtb_constants` VALUES ('NAVI_PMAX','4',184,'ページ番号の最大表示数量');
INSERT INTO `mtb_constants` VALUES ('NO_IMAGE_REALFILE','USER_TEMPLATE_REALDIR . \"default/img/picture/img_blank.gif\"',158,'画像がない場合に表示');
INSERT INTO `mtb_constants` VALUES ('NORMAL_IMAGE_HEIGHT','260',115,'通常画像縦');
INSERT INTO `mtb_constants` VALUES ('NORMAL_IMAGE_WIDTH','260',114,'通常画像横');
INSERT INTO `mtb_constants` VALUES ('NORMAL_PRICE_TITLE','\"通常価格\"',140,'価格名称');
INSERT INTO `mtb_constants` VALUES ('NORMAL_SUBIMAGE_HEIGHT','200',117,'通常サブ画像縦');
INSERT INTO `mtb_constants` VALUES ('NORMAL_SUBIMAGE_WIDTH','200',116,'通常サブ画像横');
INSERT INTO `mtb_constants` VALUES ('NOSTOCK_HIDDEN','false',291,'在庫無し商品の非表示(true:非表示、false:表示)');
INSERT INTO `mtb_constants` VALUES ('OPTION_CLASS_REGIST','1',62,'商品規格登録(有効:1 無効:0)');
INSERT INTO `mtb_constants` VALUES ('OPTION_DELIV_FEE','1',60,'配送業者ごとの配送料を加算する(有効:1 無効:0)');
INSERT INTO `mtb_constants` VALUES ('OPTION_FAVORITE_PRODUCT','1',523,'お気に入り商品登録(有効:1 無効:0)');
INSERT INTO `mtb_constants` VALUES ('OPTION_PRODUCT_DELIV_FEE','0',59,'商品ごとの送料設定(有効:1 無効:0)');
INSERT INTO `mtb_constants` VALUES ('OPTION_PRODUCT_TAX_RULE','0',1416,'商品ごとの税率設定(軽減税率対応 有効:1 無効:0) ');
INSERT INTO `mtb_constants` VALUES ('OPTION_RECOMMEND','1',61,'おすすめ商品登録(有効:1 無効:0)');
INSERT INTO `mtb_constants` VALUES ('ORDER_BACK_ORDER','4',804,'取り寄せ中');
INSERT INTO `mtb_constants` VALUES ('ORDER_CANCEL','3',803,'キャンセル');
INSERT INTO `mtb_constants` VALUES ('ORDER_DELIV','5',805,'発送済み');
INSERT INTO `mtb_constants` VALUES ('ORDER_NEW','1',800,'新規注文');
INSERT INTO `mtb_constants` VALUES ('ORDER_PAY_WAIT','2',801,'入金待ち');
INSERT INTO `mtb_constants` VALUES ('ORDER_PENDING','7',806,'決済処理中');
INSERT INTO `mtb_constants` VALUES ('ORDER_PRE_END','6',802,'入金済み');
INSERT INTO `mtb_constants` VALUES ('ORDER_STATUS_MAX','50',70,'対応状況管理画面の一覧表示件数');
INSERT INTO `mtb_constants` VALUES ('OSTORE_LOG_REALFILE','DATA_REALDIR . \"logs/ownersstore.log\"',502,'オーナーズストアログパス');
INSERT INTO `mtb_constants` VALUES ('OSTORE_SSLURL','\"https://www.ec-cube.net/\"',501,'オーナーズストアURL');
INSERT INTO `mtb_constants` VALUES ('OSTORE_URL','\"http://www.ec-cube.net/\"',500,'オーナーズストアURL');
INSERT INTO `mtb_constants` VALUES ('P_DETAIL_URLPATH','ROOT_URLPATH . \"products/detail.php?product_id=\"',253,'商品詳細(HTML出力)');
INSERT INTO `mtb_constants` VALUES ('PAGE_DISPLAY_TIME_LOG_MIN_EXEC_TIME','2',1003,'ページ表示時間のログを取得する時間設定(設定値以上かかった場合に取得)');
INSERT INTO `mtb_constants` VALUES ('PAGE_DISPLAY_TIME_LOG_MODE','1',1002,'ページ表示時間のログを取得するフラグ(1:表示, 0:非表示)');
INSERT INTO `mtb_constants` VALUES ('PASSWORD_MAX_LEN','SMTEXT_LEN',205,'フロント画面用：パスワードの最大文字数');
INSERT INTO `mtb_constants` VALUES ('PASSWORD_MIN_LEN','8',204,'フロント画面用：パスワードの最小文字数');
INSERT INTO `mtb_constants` VALUES ('PEAR_DB_DEBUG','0',42,'PEAR::DBのデバッグモード');
INSERT INTO `mtb_constants` VALUES ('PEAR_DB_PERSISTENT','false',43,'PEAR::DBの持続的接続オプション');
INSERT INTO `mtb_constants` VALUES ('PENDING_ORDER_CANCEL_FLAG','true',1419,'決済処理中ステータスのロールバックをするか(true:する false:しない)');
INSERT INTO `mtb_constants` VALUES ('PENDING_ORDER_CANCEL_TIME','900',1418,'決済処理中ステータスのロールバックを行う時間の設定(秒) ');
INSERT INTO `mtb_constants` VALUES ('PERCENTAGE_LEN','3',198,'率桁数');
INSERT INTO `mtb_constants` VALUES ('PLUGIN_ACTIVATE_FLAG','true',1303,'プラグインのロード可否フラグ)');
INSERT INTO `mtb_constants` VALUES ('PLUGIN_DIR','\"plugins/\"',600,'(2.11用)プラグインディレクトリ(モジュールで使用)');
INSERT INTO `mtb_constants` VALUES ('PLUGIN_EXTENSION','\"tar,tar.gz\"',611,'プラグインファイル登録可能拡張子(カンマ区切り)');
INSERT INTO `mtb_constants` VALUES ('PLUGIN_HTML_REALDIR','HTML_REALDIR . \"plugin/\"',605,'プラグイン保存先ディレクトリ(html)');
INSERT INTO `mtb_constants` VALUES ('PLUGIN_HTML_URLPATH','ROOT_URLPATH . \"plugin/\"',614,'プラグインURL');
INSERT INTO `mtb_constants` VALUES ('PLUGIN_LOG_REALFILE','DATA_REALDIR . \"logs/plugin.log\"',148,'プラグインログファイル');
INSERT INTO `mtb_constants` VALUES ('PLUGIN_REALDIR','USER_REALDIR . PLUGIN_DIR',601,'(2.11用)プラグイン保存先(モジュールで使用)');
INSERT INTO `mtb_constants` VALUES ('PLUGIN_TEMP_REALDIR','HTML_REALDIR . \"upload/temp_plugin/\"',608,'プラグインファイル一時保存先');
INSERT INTO `mtb_constants` VALUES ('PLUGIN_UPLOAD_REALDIR','DATA_REALDIR . \"downloads/plugin/\"',604,'プラグイン保存先ディレクトリ');
INSERT INTO `mtb_constants` VALUES ('POINT_RULE','2',88,'ポイントの計算ルール(1:四捨五入、2:切り捨て、3:切り上げ)');
INSERT INTO `mtb_constants` VALUES ('POINT_VALUE','1',89,'1ポイント当たりの値段(円)');
INSERT INTO `mtb_constants` VALUES ('PRICE_LEN','8',197,'金額桁数');
INSERT INTO `mtb_constants` VALUES ('PRODUCT_TYPE_DOWNLOAD','2',901,'ダウンロード商品');
INSERT INTO `mtb_constants` VALUES ('PRODUCT_TYPE_NORMAL','1',900,'通常商品');
INSERT INTO `mtb_constants` VALUES ('PRODUCTS_TOTAL_MAX','15',55,'商品集計で何位まで表示するか');
INSERT INTO `mtb_constants` VALUES ('PRODUCTSUB_MAX','10',185,'商品サブ情報最大数');
INSERT INTO `mtb_constants` VALUES ('RECOMMEND_NUM','8',269,'おすすめ商品表示数');
INSERT INTO `mtb_constants` VALUES ('RECOMMEND_PRODUCT_MAX','6',268,'関連商品表示数');
INSERT INTO `mtb_constants` VALUES ('RELEASE_YEAR','2005',84,'本システムの稼働開始年');
INSERT INTO `mtb_constants` VALUES ('REVIEW_ALLOW_URL','0',277,'商品レビューでURL書き込みを許可するか否か');
INSERT INTO `mtb_constants` VALUES ('REVIEW_REGIST_MAX','5',71,'フロントレビュー書き込み最大数');
INSERT INTO `mtb_constants` VALUES ('RFC_COMPLIANT_EMAIL_CHECK','false',401,'EメールアドレスチェックをRFC準拠にするか(true:準拠する、false:準拠しない)');
INSERT INTO `mtb_constants` VALUES ('SALE_PRICE_TITLE','\"販売価格\"',141,'価格名称');
INSERT INTO `mtb_constants` VALUES ('SAMPLE_ADDRESS1','\"市区町村名 (例：千代田区神田神保町)\"',1,'フロント表示関連');
INSERT INTO `mtb_constants` VALUES ('SAMPLE_ADDRESS2','\"番地・ビル名 (例：1-3-5)\"',2,'フロント表示関連');
INSERT INTO `mtb_constants` VALUES ('SEARCH_CATEGORY_LEN','18',208,'検索カテゴリ最大表示文字数(byte)');
INSERT INTO `mtb_constants` VALUES ('SEARCH_PMAX','10',183,'検索ページ表示行数');
INSERT INTO `mtb_constants` VALUES ('SELECT_RGB','\"#ffffdf\"',135,'編集時強調表示色');
INSERT INTO `mtb_constants` VALUES ('SEPA_CATNAVI','\" > \"',235,'カテゴリ区切り文字');
INSERT INTO `mtb_constants` VALUES ('SESSION_KEEP_METHOD','\"useCookie\"',418,'セッション維持方法：\"useCookie\"|\"useRequest\"');
INSERT INTO `mtb_constants` VALUES ('SESSION_LIFETIME','1800',419,'セッションの存続時間 (秒)');
INSERT INTO `mtb_constants` VALUES ('SHOPPING_COMPLETE_URLPATH','ROOT_URLPATH . \"shopping/complete.php\"',246,'購入完了画面');
INSERT INTO `mtb_constants` VALUES ('SHOPPING_CONFIRM_URLPATH','ROOT_URLPATH . \"shopping/confirm.php\"',244,'購入確認ページ');
INSERT INTO `mtb_constants` VALUES ('SHOPPING_MODULE_URLPATH','ROOT_URLPATH . \"shopping/load_payment_module.php\"',249,'モジュール追加用画面');
INSERT INTO `mtb_constants` VALUES ('SHOPPING_PAYMENT_URLPATH','ROOT_URLPATH . \"shopping/payment.php\"',245,'お支払い方法選択ページ');
INSERT INTO `mtb_constants` VALUES ('SHOPPING_URL','HTTPS_URL . \"shopping/\" . DIR_INDEX_PATH',237,'会員情報入力');
INSERT INTO `mtb_constants` VALUES ('SITE_FRAME','\"site_frame.tpl\"',79,'一般サイト画面フレーム');
INSERT INTO `mtb_constants` VALUES ('SLTEXT_LEN','500',294,'短文の文字数');
INSERT INTO `mtb_constants` VALUES ('SMALL_IMAGE_HEIGHT','130',113,'一覧画像縦');
INSERT INTO `mtb_constants` VALUES ('SMALL_IMAGE_WIDTH','130',112,'一覧画像横');
INSERT INTO `mtb_constants` VALUES ('SMARTPHONE_COMPILE_REALDIR','DATA_REALDIR . \"Smarty/templates_c/\" . SMARTPHONE_TEMPLATE_NAME . \"/\"',315,'SMARTYコンパイル(smartphone)');
INSERT INTO `mtb_constants` VALUES ('SMARTPHONE_DEFAULT_TEMPLATE_NAME','\"sphone\"',302,'デフォルトテンプレート名(スマートフォン)');
INSERT INTO `mtb_constants` VALUES ('SMARTPHONE_TEMPLATE_NAME','\"sphone\"',305,'スマートフォンテンプレート名');
INSERT INTO `mtb_constants` VALUES ('SMARTPHONE_TEMPLATE_REALDIR','SMARTY_TEMPLATES_REALDIR . SMARTPHONE_TEMPLATE_NAME . \"/\"',314,'SMARTYテンプレート(smart phone)');
INSERT INTO `mtb_constants` VALUES ('SMARTY_FORCE_COMPILE_MODE','false',1401,'SMARTYコンパイルモード');
INSERT INTO `mtb_constants` VALUES ('SMARTY_TEMPLATES_REALDIR',' DATA_REALDIR . \"Smarty/templates/\"',306,'SMARTYテンプレート');
INSERT INTO `mtb_constants` VALUES ('SMTEXT_LEN','100',189,NULL);
INSERT INTO `mtb_constants` VALUES ('SQL_QUERY_LOG_MIN_EXEC_TIME','2',1001,'DBログで遅延とみなす実行時間(秒)');
INSERT INTO `mtb_constants` VALUES ('SQL_QUERY_LOG_MODE','1',1000,'DBログの記録モード (0:記録しない, 1:遅延時のみ記録する, 2:常に記録する)');
INSERT INTO `mtb_constants` VALUES ('START_BIRTH_YEAR','1970',139,'生年月日初期選択年');
INSERT INTO `mtb_constants` VALUES ('STEXT_LEN','50',188,'短い項目の文字数 (名前など)');
INSERT INTO `mtb_constants` VALUES ('SUBSTITUTE_CHAR','63',1421,'UTF-8依存文字が入力された際に表示する文字(Unicode値の整数 デフォルト: ?)');
INSERT INTO `mtb_constants` VALUES ('TAX_RULE_PRIORITY','\"product_id,product_class_id,pref_id,country_id\"',1417,'複数箇所の税率設定時における優先度設定。カンマ区切りスペース不可で記述。後に書いてあるキーに一致するほど優先される。デフォルト：\'product_id,product_class_id,pref_id,country_id\'（国＞地域（県）＞規格単位＞商品単位）');
INSERT INTO `mtb_constants` VALUES ('TEL_ITEM_LEN','6',202,'電話番号各項目制限');
INSERT INTO `mtb_constants` VALUES ('TEL_LEN','12',203,'電話番号総数');
INSERT INTO `mtb_constants` VALUES ('TEMPLATE_ADMIN_REALDIR','SMARTY_TEMPLATES_REALDIR . \"admin/\"',308,'SMARTYテンプレート(管理機能)');
INSERT INTO `mtb_constants` VALUES ('TEMPLATE_NAME','\"default\"',303,'テンプレート名');
INSERT INTO `mtb_constants` VALUES ('TEMPLATE_REALDIR','SMARTY_TEMPLATES_REALDIR . TEMPLATE_NAME . \"/\"',307,'SMARTYテンプレート(PC)');
INSERT INTO `mtb_constants` VALUES ('TEMPLATE_SIZE','10000',131,'アップできるテンプレートファイル制限(KB)');
INSERT INTO `mtb_constants` VALUES ('TEMPLATE_TEMP_REALDIR','HTML_REALDIR . \"upload/temp_template/\"',19,'テンプレートファイル一時保存先');
INSERT INTO `mtb_constants` VALUES ('TOP_URL','HTTP_URL . DIR_INDEX_PATH',239,'サイトトップ');
INSERT INTO `mtb_constants` VALUES ('TRANSACTION_ID_NAME','\"transactionid\"',94,'トランザクションID の名前');
INSERT INTO `mtb_constants` VALUES ('UPDATE_HTTP','\"http://www.ec-cube.net/info/index.php\"',28,'アップデート管理用ファイル格納場所');
INSERT INTO `mtb_constants` VALUES ('UPDATE_SEND_SITE_INFO','false',289,'アップデート時にサイト情報を送出するか');
INSERT INTO `mtb_constants` VALUES ('URL_LEN','1024',194,'URLの文字長');
INSERT INTO `mtb_constants` VALUES ('USE_MOBILE','true',292,'モバイルサイトを利用するか(true:利用する、false:利用しない) (false は一部対応) (*モジュールで使用)');
INSERT INTO `mtb_constants` VALUES ('USE_MULTIPLE_SHIPPING','true',293,'複数配送先指定機能を利用するか(true:利用する、false:利用しない)');
INSERT INTO `mtb_constants` VALUES ('USE_NORMALIZE_HOSTNAME','true',1414,'ホスト名を正規化するか (true:する false:しない)');
INSERT INTO `mtb_constants` VALUES ('USE_POINT','true',290,'ポイントを利用するか(true:利用する、false:利用しない) (false は一部対応)');
INSERT INTO `mtb_constants` VALUES ('USE_VERBOSE_LOG','DEBUG_MODE',73,'ログを冗長とするか(true:利用する、false:利用しない)');
INSERT INTO `mtb_constants` VALUES ('USER_DEF_PHP_REALFILE','DATA_REALDIR . \"__default.php\"',20,'ユーザー作成画面のデフォルトPHPファイル');
INSERT INTO `mtb_constants` VALUES ('USER_DIR','\"user_data/\"',3,'ユーザファイル保存先');
INSERT INTO `mtb_constants` VALUES ('USER_PACKAGE_DIR','\"packages/\"',17,'テンプレートファイル保存先');
INSERT INTO `mtb_constants` VALUES ('USER_REALDIR','HTML_REALDIR . USER_DIR',4,'ユーザファイル保存先');
INSERT INTO `mtb_constants` VALUES ('USER_TEMPLATE_REALDIR','USER_REALDIR . USER_PACKAGE_DIR',18,'テンプレートファイル保存先');
INSERT INTO `mtb_constants` VALUES ('USER_URL','HTTP_URL . USER_DIR',9,'ユーザー作成ページ等');
INSERT INTO `mtb_constants` VALUES ('ZIP_DOWNLOAD_URL','\"https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip\"',1224,'郵便番号CSVのZIPアーカイブファイルの取得元');
INSERT INTO `mtb_constants` VALUES ('ZIP01_LEN','3',200,'郵便番号1');
INSERT INTO `mtb_constants` VALUES ('ZIP02_LEN','4',201,'郵便番号2');
/*!40000 ALTER TABLE `mtb_constants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_country`
--

DROP TABLE IF EXISTS `mtb_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_country` (
  `id` int NOT NULL,
  `name` text,
  `RANK` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_country`
--

LOCK TABLES `mtb_country` WRITE;
/*!40000 ALTER TABLE `mtb_country` DISABLE KEYS */;
INSERT INTO `mtb_country` VALUES (4,'アフガニスタン',4);
INSERT INTO `mtb_country` VALUES (8,'アルバニア',12);
INSERT INTO `mtb_country` VALUES (10,'南極',149);
INSERT INTO `mtb_country` VALUES (12,'アルジェリア',9);
INSERT INTO `mtb_country` VALUES (16,'アメリカ領サモア',7);
INSERT INTO `mtb_country` VALUES (20,'アンドラ',17);
INSERT INTO `mtb_country` VALUES (24,'アンゴラ',15);
INSERT INTO `mtb_country` VALUES (28,'アンティグア・バーブーダ',16);
INSERT INTO `mtb_country` VALUES (31,'アゼルバイジャン',3);
INSERT INTO `mtb_country` VALUES (32,'アルゼンチン',10);
INSERT INTO `mtb_country` VALUES (36,'オーストラリア',39);
INSERT INTO `mtb_country` VALUES (40,'オーストリア',40);
INSERT INTO `mtb_country` VALUES (44,'バハマ',167);
INSERT INTO `mtb_country` VALUES (48,'バーレーン',161);
INSERT INTO `mtb_country` VALUES (50,'バングラデシュ',175);
INSERT INTO `mtb_country` VALUES (51,'アルメニア',13);
INSERT INTO `mtb_country` VALUES (52,'バルバドス',172);
INSERT INTO `mtb_country` VALUES (56,'ベルギー',201);
INSERT INTO `mtb_country` VALUES (60,'バミューダ諸島|バミューダ',169);
INSERT INTO `mtb_country` VALUES (64,'ブータン',181);
INSERT INTO `mtb_country` VALUES (68,'ボリビア|ボリビア多民族国',206);
INSERT INTO `mtb_country` VALUES (70,'ボスニア・ヘルツェゴビナ',203);
INSERT INTO `mtb_country` VALUES (72,'ボツワナ',204);
INSERT INTO `mtb_country` VALUES (74,'ブーベ島',182);
INSERT INTO `mtb_country` VALUES (76,'ブラジル',186);
INSERT INTO `mtb_country` VALUES (84,'ベリーズ',199);
INSERT INTO `mtb_country` VALUES (86,'イギリス領インド洋地域',20);
INSERT INTO `mtb_country` VALUES (90,'ソロモン諸島',121);
INSERT INTO `mtb_country` VALUES (92,'イギリス領ヴァージン諸島',21);
INSERT INTO `mtb_country` VALUES (96,'ブルネイ|ブルネイ・ダルサラーム',193);
INSERT INTO `mtb_country` VALUES (100,'ブルガリア',191);
INSERT INTO `mtb_country` VALUES (104,'ミャンマー',224);
INSERT INTO `mtb_country` VALUES (108,'ブルンジ',194);
INSERT INTO `mtb_country` VALUES (112,'ベラルーシ',198);
INSERT INTO `mtb_country` VALUES (116,'カンボジア',55);
INSERT INTO `mtb_country` VALUES (120,'カメルーン',53);
INSERT INTO `mtb_country` VALUES (124,'カナダ',51);
INSERT INTO `mtb_country` VALUES (132,'カーボベルデ',45);
INSERT INTO `mtb_country` VALUES (136,'ケイマン諸島',75);
INSERT INTO `mtb_country` VALUES (140,'中央アフリカ共和国',130);
INSERT INTO `mtb_country` VALUES (144,'スリランカ',108);
INSERT INTO `mtb_country` VALUES (148,'チャド',129);
INSERT INTO `mtb_country` VALUES (152,'チリ',134);
INSERT INTO `mtb_country` VALUES (156,'中華人民共和国|中国',131);
INSERT INTO `mtb_country` VALUES (158,'台湾',125);
INSERT INTO `mtb_country` VALUES (162,'クリスマス島 (オーストラリア)|クリスマス島',71);
INSERT INTO `mtb_country` VALUES (166,'ココス諸島|ココス（キーリング）諸島',78);
INSERT INTO `mtb_country` VALUES (170,'コロンビア',81);
INSERT INTO `mtb_country` VALUES (174,'コモロ',80);
INSERT INTO `mtb_country` VALUES (175,'マヨット',214);
INSERT INTO `mtb_country` VALUES (178,'コンゴ共和国',82);
INSERT INTO `mtb_country` VALUES (180,'コンゴ民主共和国',83);
INSERT INTO `mtb_country` VALUES (184,'クック諸島',69);
INSERT INTO `mtb_country` VALUES (188,'コスタリカ',79);
INSERT INTO `mtb_country` VALUES (191,'クロアチア',74);
INSERT INTO `mtb_country` VALUES (192,'キューバ',60);
INSERT INTO `mtb_country` VALUES (196,'キプロス',59);
INSERT INTO `mtb_country` VALUES (203,'チェコ',128);
INSERT INTO `mtb_country` VALUES (204,'ベナン',196);
INSERT INTO `mtb_country` VALUES (208,'デンマーク',136);
INSERT INTO `mtb_country` VALUES (212,'ドミニカ国',141);
INSERT INTO `mtb_country` VALUES (214,'ドミニカ共和国',140);
INSERT INTO `mtb_country` VALUES (218,'エクアドル',33);
INSERT INTO `mtb_country` VALUES (222,'エルサルバドル',38);
INSERT INTO `mtb_country` VALUES (226,'赤道ギニア',113);
INSERT INTO `mtb_country` VALUES (231,'エチオピア',36);
INSERT INTO `mtb_country` VALUES (232,'エリトリア',37);
INSERT INTO `mtb_country` VALUES (233,'エストニア',35);
INSERT INTO `mtb_country` VALUES (234,'フェロー諸島',184);
INSERT INTO `mtb_country` VALUES (238,'フォークランド諸島|フォークランド（マルビナス）諸島',185);
INSERT INTO `mtb_country` VALUES (239,'サウスジョージア・サウスサンドウィッチ諸島',85);
INSERT INTO `mtb_country` VALUES (242,'フィジー',178);
INSERT INTO `mtb_country` VALUES (246,'フィンランド',180);
INSERT INTO `mtb_country` VALUES (248,'オーランド諸島',41);
INSERT INTO `mtb_country` VALUES (250,'フランス',187);
INSERT INTO `mtb_country` VALUES (254,'フランス領ギアナ',188);
INSERT INTO `mtb_country` VALUES (258,'フランス領ポリネシア',189);
INSERT INTO `mtb_country` VALUES (260,'フランス領南方・南極地域',190);
INSERT INTO `mtb_country` VALUES (262,'ジブチ',94);
INSERT INTO `mtb_country` VALUES (266,'ガボン',52);
INSERT INTO `mtb_country` VALUES (268,'グルジア',72);
INSERT INTO `mtb_country` VALUES (270,'ガンビア',54);
INSERT INTO `mtb_country` VALUES (275,'パレスチナ',173);
INSERT INTO `mtb_country` VALUES (276,'ドイツ',137);
INSERT INTO `mtb_country` VALUES (288,'ガーナ',44);
INSERT INTO `mtb_country` VALUES (292,'ジブラルタル',95);
INSERT INTO `mtb_country` VALUES (296,'キリバス',63);
INSERT INTO `mtb_country` VALUES (300,'ギリシャ',62);
INSERT INTO `mtb_country` VALUES (304,'グリーンランド',70);
INSERT INTO `mtb_country` VALUES (308,'グレナダ',73);
INSERT INTO `mtb_country` VALUES (312,'グアドループ',66);
INSERT INTO `mtb_country` VALUES (316,'グアム',67);
INSERT INTO `mtb_country` VALUES (320,'グアテマラ',65);
INSERT INTO `mtb_country` VALUES (324,'ギニア',57);
INSERT INTO `mtb_country` VALUES (328,'ガイアナ',47);
INSERT INTO `mtb_country` VALUES (332,'ハイチ',162);
INSERT INTO `mtb_country` VALUES (334,'ハード島とマクドナルド諸島',160);
INSERT INTO `mtb_country` VALUES (336,'バチカン|バチカン市国',164);
INSERT INTO `mtb_country` VALUES (340,'ホンジュラス',209);
INSERT INTO `mtb_country` VALUES (344,'香港',208);
INSERT INTO `mtb_country` VALUES (348,'ハンガリー',174);
INSERT INTO `mtb_country` VALUES (352,'アイスランド',1);
INSERT INTO `mtb_country` VALUES (356,'インド',26);
INSERT INTO `mtb_country` VALUES (360,'インドネシア',27);
INSERT INTO `mtb_country` VALUES (364,'イラン|イラン・イスラム共和国',25);
INSERT INTO `mtb_country` VALUES (368,'イラク',24);
INSERT INTO `mtb_country` VALUES (372,'アイルランド',2);
INSERT INTO `mtb_country` VALUES (376,'イスラエル',22);
INSERT INTO `mtb_country` VALUES (380,'イタリア',23);
INSERT INTO `mtb_country` VALUES (384,'コートジボワール',77);
INSERT INTO `mtb_country` VALUES (388,'ジャマイカ',97);
INSERT INTO `mtb_country` VALUES (392,'日本',153);
INSERT INTO `mtb_country` VALUES (398,'カザフスタン',48);
INSERT INTO `mtb_country` VALUES (400,'ヨルダン',236);
INSERT INTO `mtb_country` VALUES (404,'ケニア',76);
INSERT INTO `mtb_country` VALUES (408,'朝鮮民主主義人民共和国',133);
INSERT INTO `mtb_country` VALUES (410,'大韓民国',124);
INSERT INTO `mtb_country` VALUES (414,'クウェート',68);
INSERT INTO `mtb_country` VALUES (417,'キルギス',64);
INSERT INTO `mtb_country` VALUES (418,'ラオス|ラオス人民民主共和国',237);
INSERT INTO `mtb_country` VALUES (422,'レバノン',247);
INSERT INTO `mtb_country` VALUES (426,'レソト',246);
INSERT INTO `mtb_country` VALUES (428,'ラトビア',238);
INSERT INTO `mtb_country` VALUES (430,'リベリア',242);
INSERT INTO `mtb_country` VALUES (434,'リビア',240);
INSERT INTO `mtb_country` VALUES (438,'リヒテンシュタイン',241);
INSERT INTO `mtb_country` VALUES (440,'リトアニア',239);
INSERT INTO `mtb_country` VALUES (442,'ルクセンブルク',244);
INSERT INTO `mtb_country` VALUES (446,'マカオ',211);
INSERT INTO `mtb_country` VALUES (450,'マダガスカル',213);
INSERT INTO `mtb_country` VALUES (454,'マラウイ',215);
INSERT INTO `mtb_country` VALUES (458,'マレーシア',219);
INSERT INTO `mtb_country` VALUES (462,'モルディブ',230);
INSERT INTO `mtb_country` VALUES (466,'マリ共和国|マリ',216);
INSERT INTO `mtb_country` VALUES (470,'マルタ',217);
INSERT INTO `mtb_country` VALUES (474,'マルティニーク',218);
INSERT INTO `mtb_country` VALUES (478,'モーリタニア',227);
INSERT INTO `mtb_country` VALUES (480,'モーリシャス',226);
INSERT INTO `mtb_country` VALUES (484,'メキシコ',225);
INSERT INTO `mtb_country` VALUES (492,'モナコ',229);
INSERT INTO `mtb_country` VALUES (496,'モンゴル国|モンゴル',233);
INSERT INTO `mtb_country` VALUES (498,'モルドバ|モルドバ共和国',231);
INSERT INTO `mtb_country` VALUES (499,'モンテネグロ',234);
INSERT INTO `mtb_country` VALUES (500,'モントセラト',235);
INSERT INTO `mtb_country` VALUES (504,'モロッコ',232);
INSERT INTO `mtb_country` VALUES (508,'モザンビーク',228);
INSERT INTO `mtb_country` VALUES (512,'オマーン',42);
INSERT INTO `mtb_country` VALUES (516,'ナミビア',148);
INSERT INTO `mtb_country` VALUES (520,'ナウル',147);
INSERT INTO `mtb_country` VALUES (524,'ネパール',157);
INSERT INTO `mtb_country` VALUES (528,'オランダ',43);
INSERT INTO `mtb_country` VALUES (531,'キュラソー島|キュラソー',61);
INSERT INTO `mtb_country` VALUES (533,'アルバ',11);
INSERT INTO `mtb_country` VALUES (534,'シント・マールテン|シント・マールテン（オランダ領）',100);
INSERT INTO `mtb_country` VALUES (535,'BES諸島|ボネール、シント・ユースタティウスおよびサバ',205);
INSERT INTO `mtb_country` VALUES (540,'ニューカレドニア',155);
INSERT INTO `mtb_country` VALUES (548,'バヌアツ',166);
INSERT INTO `mtb_country` VALUES (554,'ニュージーランド',156);
INSERT INTO `mtb_country` VALUES (558,'ニカラグア',151);
INSERT INTO `mtb_country` VALUES (562,'ニジェール',152);
INSERT INTO `mtb_country` VALUES (566,'ナイジェリア',146);
INSERT INTO `mtb_country` VALUES (570,'ニウエ',150);
INSERT INTO `mtb_country` VALUES (574,'ノーフォーク島',158);
INSERT INTO `mtb_country` VALUES (578,'ノルウェー',159);
INSERT INTO `mtb_country` VALUES (580,'北マリアナ諸島',56);
INSERT INTO `mtb_country` VALUES (581,'合衆国領有小離島',50);
INSERT INTO `mtb_country` VALUES (583,'ミクロネシア連邦',221);
INSERT INTO `mtb_country` VALUES (584,'マーシャル諸島',210);
INSERT INTO `mtb_country` VALUES (585,'パラオ',170);
INSERT INTO `mtb_country` VALUES (586,'パキスタン',163);
INSERT INTO `mtb_country` VALUES (591,'パナマ',165);
INSERT INTO `mtb_country` VALUES (598,'パプアニューギニア',168);
INSERT INTO `mtb_country` VALUES (600,'パラグアイ',171);
INSERT INTO `mtb_country` VALUES (604,'ペルー',200);
INSERT INTO `mtb_country` VALUES (608,'フィリピン',179);
INSERT INTO `mtb_country` VALUES (612,'ピトケアン諸島|ピトケアン',177);
INSERT INTO `mtb_country` VALUES (616,'ポーランド',202);
INSERT INTO `mtb_country` VALUES (620,'ポルトガル',207);
INSERT INTO `mtb_country` VALUES (624,'ギニアビサウ',58);
INSERT INTO `mtb_country` VALUES (626,'東ティモール',176);
INSERT INTO `mtb_country` VALUES (630,'プエルトリコ',183);
INSERT INTO `mtb_country` VALUES (634,'カタール',49);
INSERT INTO `mtb_country` VALUES (638,'レユニオン',248);
INSERT INTO `mtb_country` VALUES (642,'ルーマニア',243);
INSERT INTO `mtb_country` VALUES (643,'ロシア|ロシア連邦',249);
INSERT INTO `mtb_country` VALUES (646,'ルワンダ',245);
INSERT INTO `mtb_country` VALUES (652,'サン・バルテルミー島|サン・バルテルミー',88);
INSERT INTO `mtb_country` VALUES (654,'セントヘレナ・アセンションおよびトリスタンダクーニャ',118);
INSERT INTO `mtb_country` VALUES (659,'セントクリストファー・ネイビス',116);
INSERT INTO `mtb_country` VALUES (660,'アンギラ',14);
INSERT INTO `mtb_country` VALUES (662,'セントルシア',119);
INSERT INTO `mtb_country` VALUES (663,'サン・マルタン (西インド諸島)|サン・マルタン（フランス領）',92);
INSERT INTO `mtb_country` VALUES (666,'サンピエール島・ミクロン島',90);
INSERT INTO `mtb_country` VALUES (670,'セントビンセント・グレナディーン|セントビンセントおよびグレナディーン諸島',117);
INSERT INTO `mtb_country` VALUES (674,'サンマリノ',91);
INSERT INTO `mtb_country` VALUES (678,'サントメ・プリンシペ',87);
INSERT INTO `mtb_country` VALUES (682,'サウジアラビア',84);
INSERT INTO `mtb_country` VALUES (686,'セネガル',114);
INSERT INTO `mtb_country` VALUES (688,'セルビア',115);
INSERT INTO `mtb_country` VALUES (690,'セーシェル',112);
INSERT INTO `mtb_country` VALUES (694,'シエラレオネ',93);
INSERT INTO `mtb_country` VALUES (702,'シンガポール',99);
INSERT INTO `mtb_country` VALUES (703,'スロバキア',109);
INSERT INTO `mtb_country` VALUES (704,'ベトナム',195);
INSERT INTO `mtb_country` VALUES (705,'スロベニア',110);
INSERT INTO `mtb_country` VALUES (706,'ソマリア',120);
INSERT INTO `mtb_country` VALUES (710,'南アフリカ共和国|南アフリカ',222);
INSERT INTO `mtb_country` VALUES (716,'ジンバブエ',101);
INSERT INTO `mtb_country` VALUES (724,'スペイン',106);
INSERT INTO `mtb_country` VALUES (728,'南スーダン',223);
INSERT INTO `mtb_country` VALUES (729,'スーダン',104);
INSERT INTO `mtb_country` VALUES (732,'西サハラ',154);
INSERT INTO `mtb_country` VALUES (740,'スリナム',107);
INSERT INTO `mtb_country` VALUES (744,'スヴァールバル諸島およびヤンマイエン島',105);
INSERT INTO `mtb_country` VALUES (748,'スワジランド',111);
INSERT INTO `mtb_country` VALUES (752,'スウェーデン',103);
INSERT INTO `mtb_country` VALUES (756,'スイス',102);
INSERT INTO `mtb_country` VALUES (760,'シリア|シリア・アラブ共和国',98);
INSERT INTO `mtb_country` VALUES (762,'タジキスタン',126);
INSERT INTO `mtb_country` VALUES (764,'タイ王国|タイ',123);
INSERT INTO `mtb_country` VALUES (768,'トーゴ',138);
INSERT INTO `mtb_country` VALUES (772,'トケラウ',139);
INSERT INTO `mtb_country` VALUES (776,'トンガ',145);
INSERT INTO `mtb_country` VALUES (780,'トリニダード・トバゴ',142);
INSERT INTO `mtb_country` VALUES (784,'アラブ首長国連邦',8);
INSERT INTO `mtb_country` VALUES (788,'チュニジア',132);
INSERT INTO `mtb_country` VALUES (792,'トルコ',144);
INSERT INTO `mtb_country` VALUES (795,'トルクメニスタン',143);
INSERT INTO `mtb_country` VALUES (796,'タークス・カイコス諸島',122);
INSERT INTO `mtb_country` VALUES (798,'ツバル',135);
INSERT INTO `mtb_country` VALUES (800,'ウガンダ',29);
INSERT INTO `mtb_country` VALUES (804,'ウクライナ',30);
INSERT INTO `mtb_country` VALUES (807,'マケドニア共和国|マケドニア旧ユーゴスラビア共和国',212);
INSERT INTO `mtb_country` VALUES (818,'エジプト',34);
INSERT INTO `mtb_country` VALUES (826,'イギリス',19);
INSERT INTO `mtb_country` VALUES (831,'ガーンジー',46);
INSERT INTO `mtb_country` VALUES (832,'ジャージー',96);
INSERT INTO `mtb_country` VALUES (833,'マン島',220);
INSERT INTO `mtb_country` VALUES (834,'タンザニア',127);
INSERT INTO `mtb_country` VALUES (840,'アメリカ合衆国',5);
INSERT INTO `mtb_country` VALUES (850,'アメリカ領ヴァージン諸島',6);
INSERT INTO `mtb_country` VALUES (854,'ブルキナファソ',192);
INSERT INTO `mtb_country` VALUES (858,'ウルグアイ',32);
INSERT INTO `mtb_country` VALUES (860,'ウズベキスタン',31);
INSERT INTO `mtb_country` VALUES (862,'ベネズエラ|ベネズエラ・ボリバル共和国',197);
INSERT INTO `mtb_country` VALUES (876,'ウォリス・フツナ',28);
INSERT INTO `mtb_country` VALUES (882,'サモア',86);
INSERT INTO `mtb_country` VALUES (887,'イエメン',18);
INSERT INTO `mtb_country` VALUES (894,'ザンビア',89);
/*!40000 ALTER TABLE `mtb_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_customer_order_status`
--

DROP TABLE IF EXISTS `mtb_customer_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_customer_order_status` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_customer_order_status`
--

LOCK TABLES `mtb_customer_order_status` WRITE;
/*!40000 ALTER TABLE `mtb_customer_order_status` DISABLE KEYS */;
INSERT INTO `mtb_customer_order_status` VALUES (1,'注文受付',1);
INSERT INTO `mtb_customer_order_status` VALUES (2,'入金待ち',2);
INSERT INTO `mtb_customer_order_status` VALUES (3,'キャンセル',4);
INSERT INTO `mtb_customer_order_status` VALUES (4,'注文受付',5);
INSERT INTO `mtb_customer_order_status` VALUES (5,'発送済み',6);
INSERT INTO `mtb_customer_order_status` VALUES (6,'注文受付',3);
INSERT INTO `mtb_customer_order_status` VALUES (7,'注文未完了',0);
/*!40000 ALTER TABLE `mtb_customer_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_customer_status`
--

DROP TABLE IF EXISTS `mtb_customer_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_customer_status` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_customer_status`
--

LOCK TABLES `mtb_customer_status` WRITE;
/*!40000 ALTER TABLE `mtb_customer_status` DISABLE KEYS */;
INSERT INTO `mtb_customer_status` VALUES (1,'仮会員',0);
INSERT INTO `mtb_customer_status` VALUES (2,'本会員',1);
/*!40000 ALTER TABLE `mtb_customer_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_db`
--

DROP TABLE IF EXISTS `mtb_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_db` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_db`
--

LOCK TABLES `mtb_db` WRITE;
/*!40000 ALTER TABLE `mtb_db` DISABLE KEYS */;
INSERT INTO `mtb_db` VALUES (1,'PostgreSQL',0);
INSERT INTO `mtb_db` VALUES (2,'MySQL',1);
/*!40000 ALTER TABLE `mtb_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_delivery_date`
--

DROP TABLE IF EXISTS `mtb_delivery_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_delivery_date` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_delivery_date`
--

LOCK TABLES `mtb_delivery_date` WRITE;
/*!40000 ALTER TABLE `mtb_delivery_date` DISABLE KEYS */;
INSERT INTO `mtb_delivery_date` VALUES (1,'即日',0);
INSERT INTO `mtb_delivery_date` VALUES (2,'1～2日後',1);
INSERT INTO `mtb_delivery_date` VALUES (3,'3～4日後',2);
INSERT INTO `mtb_delivery_date` VALUES (4,'1週間以降',3);
INSERT INTO `mtb_delivery_date` VALUES (5,'2週間以降',4);
INSERT INTO `mtb_delivery_date` VALUES (6,'3週間以降',5);
INSERT INTO `mtb_delivery_date` VALUES (7,'1ヶ月以降',6);
INSERT INTO `mtb_delivery_date` VALUES (8,'2ヶ月以降',7);
INSERT INTO `mtb_delivery_date` VALUES (9,'お取り寄せ(商品入荷後)',8);
/*!40000 ALTER TABLE `mtb_delivery_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_device_type`
--

DROP TABLE IF EXISTS `mtb_device_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_device_type` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_device_type`
--

LOCK TABLES `mtb_device_type` WRITE;
/*!40000 ALTER TABLE `mtb_device_type` DISABLE KEYS */;
INSERT INTO `mtb_device_type` VALUES (1,'モバイル',0);
INSERT INTO `mtb_device_type` VALUES (2,'スマートフォン',1);
INSERT INTO `mtb_device_type` VALUES (10,'PC',2);
INSERT INTO `mtb_device_type` VALUES (99,'管理画面',3);
/*!40000 ALTER TABLE `mtb_device_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_disable_logout`
--

DROP TABLE IF EXISTS `mtb_disable_logout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_disable_logout` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_disable_logout`
--

LOCK TABLES `mtb_disable_logout` WRITE;
/*!40000 ALTER TABLE `mtb_disable_logout` DISABLE KEYS */;
INSERT INTO `mtb_disable_logout` VALUES (1,'/shopping/deliv.php',0);
INSERT INTO `mtb_disable_logout` VALUES (2,'/shopping/payment.php',1);
INSERT INTO `mtb_disable_logout` VALUES (3,'/shopping/confirm.php',2);
INSERT INTO `mtb_disable_logout` VALUES (4,'/shopping/card.php',3);
INSERT INTO `mtb_disable_logout` VALUES (5,'/shopping/loan.php',4);
/*!40000 ALTER TABLE `mtb_disable_logout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_disp`
--

DROP TABLE IF EXISTS `mtb_disp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_disp` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_disp`
--

LOCK TABLES `mtb_disp` WRITE;
/*!40000 ALTER TABLE `mtb_disp` DISABLE KEYS */;
INSERT INTO `mtb_disp` VALUES (1,'公開',0);
INSERT INTO `mtb_disp` VALUES (2,'非公開',1);
/*!40000 ALTER TABLE `mtb_disp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_job`
--

DROP TABLE IF EXISTS `mtb_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_job` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_job`
--

LOCK TABLES `mtb_job` WRITE;
/*!40000 ALTER TABLE `mtb_job` DISABLE KEYS */;
INSERT INTO `mtb_job` VALUES (1,'公務員',0);
INSERT INTO `mtb_job` VALUES (2,'コンサルタント',1);
INSERT INTO `mtb_job` VALUES (3,'コンピューター関連技術職',2);
INSERT INTO `mtb_job` VALUES (4,'コンピューター関連以外の技術職',3);
INSERT INTO `mtb_job` VALUES (5,'金融関係',4);
INSERT INTO `mtb_job` VALUES (6,'医師',5);
INSERT INTO `mtb_job` VALUES (7,'弁護士',6);
INSERT INTO `mtb_job` VALUES (8,'総務・人事・事務',7);
INSERT INTO `mtb_job` VALUES (9,'営業・販売',8);
INSERT INTO `mtb_job` VALUES (10,'研究・開発',9);
INSERT INTO `mtb_job` VALUES (11,'広報・宣伝',10);
INSERT INTO `mtb_job` VALUES (12,'企画・マーケティング',11);
INSERT INTO `mtb_job` VALUES (13,'デザイン関係',12);
INSERT INTO `mtb_job` VALUES (14,'会社経営・役員',13);
INSERT INTO `mtb_job` VALUES (15,'出版・マスコミ関係',14);
INSERT INTO `mtb_job` VALUES (16,'学生・フリーター',15);
INSERT INTO `mtb_job` VALUES (17,'主婦',16);
INSERT INTO `mtb_job` VALUES (18,'その他',17);
/*!40000 ALTER TABLE `mtb_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_magazine_type`
--

DROP TABLE IF EXISTS `mtb_magazine_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_magazine_type` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_magazine_type`
--

LOCK TABLES `mtb_magazine_type` WRITE;
/*!40000 ALTER TABLE `mtb_magazine_type` DISABLE KEYS */;
INSERT INTO `mtb_magazine_type` VALUES (1,'HTML',0);
INSERT INTO `mtb_magazine_type` VALUES (2,'テキスト',1);
/*!40000 ALTER TABLE `mtb_magazine_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_mail_magazine_type`
--

DROP TABLE IF EXISTS `mtb_mail_magazine_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_mail_magazine_type` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_mail_magazine_type`
--

LOCK TABLES `mtb_mail_magazine_type` WRITE;
/*!40000 ALTER TABLE `mtb_mail_magazine_type` DISABLE KEYS */;
INSERT INTO `mtb_mail_magazine_type` VALUES (1,'HTMLメール',0);
INSERT INTO `mtb_mail_magazine_type` VALUES (2,'テキストメール',1);
INSERT INTO `mtb_mail_magazine_type` VALUES (3,'希望しない',2);
/*!40000 ALTER TABLE `mtb_mail_magazine_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_mail_template`
--

DROP TABLE IF EXISTS `mtb_mail_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_mail_template` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_mail_template`
--

LOCK TABLES `mtb_mail_template` WRITE;
/*!40000 ALTER TABLE `mtb_mail_template` DISABLE KEYS */;
INSERT INTO `mtb_mail_template` VALUES (1,'注文受付メール',0);
INSERT INTO `mtb_mail_template` VALUES (2,'注文受付メール(携帯)',1);
INSERT INTO `mtb_mail_template` VALUES (3,'注文キャンセル受付メール',2);
INSERT INTO `mtb_mail_template` VALUES (4,'取り寄せ確認メール',3);
INSERT INTO `mtb_mail_template` VALUES (5,'お問い合わせ受付メール',4);
/*!40000 ALTER TABLE `mtb_mail_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_mail_tpl_path`
--

DROP TABLE IF EXISTS `mtb_mail_tpl_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_mail_tpl_path` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_mail_tpl_path`
--

LOCK TABLES `mtb_mail_tpl_path` WRITE;
/*!40000 ALTER TABLE `mtb_mail_tpl_path` DISABLE KEYS */;
INSERT INTO `mtb_mail_tpl_path` VALUES (1,'mail_templates/order_mail.tpl',0);
INSERT INTO `mtb_mail_tpl_path` VALUES (2,'mail_templates/order_mail.tpl',1);
INSERT INTO `mtb_mail_tpl_path` VALUES (3,'mail_templates/order_mail.tpl',2);
INSERT INTO `mtb_mail_tpl_path` VALUES (4,'mail_templates/order_mail.tpl',3);
INSERT INTO `mtb_mail_tpl_path` VALUES (5,'mail_templates/contact_mail.tpl',4);
/*!40000 ALTER TABLE `mtb_mail_tpl_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_mail_type`
--

DROP TABLE IF EXISTS `mtb_mail_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_mail_type` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_mail_type`
--

LOCK TABLES `mtb_mail_type` WRITE;
/*!40000 ALTER TABLE `mtb_mail_type` DISABLE KEYS */;
INSERT INTO `mtb_mail_type` VALUES (1,'PCメールアドレス',0);
INSERT INTO `mtb_mail_type` VALUES (2,'携帯メールアドレス',1);
INSERT INTO `mtb_mail_type` VALUES (3,'PCメールアドレス (携帯メールアドレスを登録している会員は除外)',2);
INSERT INTO `mtb_mail_type` VALUES (4,'携帯メールアドレス (PCメールアドレスを登録している会員は除外)',3);
/*!40000 ALTER TABLE `mtb_mail_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_mobile_domain`
--

DROP TABLE IF EXISTS `mtb_mobile_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_mobile_domain` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_mobile_domain`
--

LOCK TABLES `mtb_mobile_domain` WRITE;
/*!40000 ALTER TABLE `mtb_mobile_domain` DISABLE KEYS */;
INSERT INTO `mtb_mobile_domain` VALUES (1,'docomo.ne.jp',0);
INSERT INTO `mtb_mobile_domain` VALUES (2,'ezweb.ne.jp',1);
INSERT INTO `mtb_mobile_domain` VALUES (3,'softbank.ne.jp',2);
INSERT INTO `mtb_mobile_domain` VALUES (4,'vodafone.ne.jp',3);
INSERT INTO `mtb_mobile_domain` VALUES (5,'pdx.ne.jp',4);
INSERT INTO `mtb_mobile_domain` VALUES (6,'disney.ne.jp',5);
INSERT INTO `mtb_mobile_domain` VALUES (7,'willcom.com',6);
INSERT INTO `mtb_mobile_domain` VALUES (8,'emnet.ne.jp',7);
INSERT INTO `mtb_mobile_domain` VALUES (9,'i.softbank.jp',8);
INSERT INTO `mtb_mobile_domain` VALUES (10,'emobile.ne.jp',9);
INSERT INTO `mtb_mobile_domain` VALUES (11,'au.com',10);
/*!40000 ALTER TABLE `mtb_mobile_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_ngword`
--

DROP TABLE IF EXISTS `mtb_ngword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_ngword` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_ngword`
--

LOCK TABLES `mtb_ngword` WRITE;
/*!40000 ALTER TABLE `mtb_ngword` DISABLE KEYS */;
/*!40000 ALTER TABLE `mtb_ngword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_order_status`
--

DROP TABLE IF EXISTS `mtb_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_order_status` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_order_status`
--

LOCK TABLES `mtb_order_status` WRITE;
/*!40000 ALTER TABLE `mtb_order_status` DISABLE KEYS */;
INSERT INTO `mtb_order_status` VALUES (1,'新規受付',1);
INSERT INTO `mtb_order_status` VALUES (2,'入金待ち',2);
INSERT INTO `mtb_order_status` VALUES (3,'キャンセル',4);
INSERT INTO `mtb_order_status` VALUES (4,'取り寄せ中',5);
INSERT INTO `mtb_order_status` VALUES (5,'発送済み',6);
INSERT INTO `mtb_order_status` VALUES (6,'入金済み',3);
INSERT INTO `mtb_order_status` VALUES (7,'決済処理中',0);
/*!40000 ALTER TABLE `mtb_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_order_status_color`
--

DROP TABLE IF EXISTS `mtb_order_status_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_order_status_color` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_order_status_color`
--

LOCK TABLES `mtb_order_status_color` WRITE;
/*!40000 ALTER TABLE `mtb_order_status_color` DISABLE KEYS */;
INSERT INTO `mtb_order_status_color` VALUES (1,'#FFFFFF',0);
INSERT INTO `mtb_order_status_color` VALUES (2,'#FFDE9B',1);
INSERT INTO `mtb_order_status_color` VALUES (3,'#C9C9C9',2);
INSERT INTO `mtb_order_status_color` VALUES (4,'#FFD9D9',3);
INSERT INTO `mtb_order_status_color` VALUES (5,'#BFDFFF',4);
INSERT INTO `mtb_order_status_color` VALUES (6,'#FFFFAB',5);
INSERT INTO `mtb_order_status_color` VALUES (7,'#FFCCCC',6);
/*!40000 ALTER TABLE `mtb_order_status_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_ownersstore_err`
--

DROP TABLE IF EXISTS `mtb_ownersstore_err`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_ownersstore_err` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_ownersstore_err`
--

LOCK TABLES `mtb_ownersstore_err` WRITE;
/*!40000 ALTER TABLE `mtb_ownersstore_err` DISABLE KEYS */;
INSERT INTO `mtb_ownersstore_err` VALUES (1000,'不明なエラーが発生しました。',0);
INSERT INTO `mtb_ownersstore_err` VALUES (1001,'不正なパラメーターが送信されました。',1);
INSERT INTO `mtb_ownersstore_err` VALUES (1002,'認証に失敗しました。<br />・仮会員の方は、本会員登録を行ってください<br />・認証キーが正しく設定されているか確認してください',2);
INSERT INTO `mtb_ownersstore_err` VALUES (1003,'認証に失敗しました。<br />・仮会員の方は、本会員登録を行ってください<br />・認証キーが正しく設定されているか確認してください',3);
INSERT INTO `mtb_ownersstore_err` VALUES (1004,'購入済みの商品はありません。',4);
INSERT INTO `mtb_ownersstore_err` VALUES (1005,'ダウンロード可能なアップデータはありません。<br />・ステータスが「入金待ち」の可能性があります<br />・インストールされているモジュールが既に最新版の可能性があります。',5);
INSERT INTO `mtb_ownersstore_err` VALUES (1006,'配信サーバーでエラーが発生しました。',6);
INSERT INTO `mtb_ownersstore_err` VALUES (1007,'ダウンロード完了通知に失敗しました。',7);
INSERT INTO `mtb_ownersstore_err` VALUES (2001,'管理画面の認証に失敗しました。<br />管理画面トップページへ戻り、ログインし直してください。',8);
INSERT INTO `mtb_ownersstore_err` VALUES (2002,'配信サーバーへ接続できません。',9);
INSERT INTO `mtb_ownersstore_err` VALUES (2003,'配信サーバーへ接続できません。',10);
INSERT INTO `mtb_ownersstore_err` VALUES (2004,'配信サーバーでエラーが発生しました。',11);
INSERT INTO `mtb_ownersstore_err` VALUES (2005,'認証キーが設定されていません。<br />・「認証キー設定」で認証キーを設定してください。',12);
INSERT INTO `mtb_ownersstore_err` VALUES (2006,'不正なアクセスです。',13);
INSERT INTO `mtb_ownersstore_err` VALUES (2007,'不正なパラメーターが送信されました。',14);
INSERT INTO `mtb_ownersstore_err` VALUES (2008,'自動アップデートが無効です',15);
INSERT INTO `mtb_ownersstore_err` VALUES (2009,'ファイルの書き込みに失敗しました。<br />・書き込み権限が正しく設定されていません。<br />・data/downloads/tmpディレクトリに書き込み権限があるかどうか確認してください',16);
INSERT INTO `mtb_ownersstore_err` VALUES (2010,'ファイルの書き込みに失敗しました。<br />・「ログ管理」で詳細を確認してください。',17);
/*!40000 ALTER TABLE `mtb_ownersstore_err` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_page_max`
--

DROP TABLE IF EXISTS `mtb_page_max`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_page_max` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_page_max`
--

LOCK TABLES `mtb_page_max` WRITE;
/*!40000 ALTER TABLE `mtb_page_max` DISABLE KEYS */;
INSERT INTO `mtb_page_max` VALUES (10,'10',0);
INSERT INTO `mtb_page_max` VALUES (20,'20',1);
INSERT INTO `mtb_page_max` VALUES (30,'30',2);
INSERT INTO `mtb_page_max` VALUES (40,'40',3);
INSERT INTO `mtb_page_max` VALUES (50,'50',4);
INSERT INTO `mtb_page_max` VALUES (60,'60',5);
INSERT INTO `mtb_page_max` VALUES (70,'70',6);
INSERT INTO `mtb_page_max` VALUES (80,'80',7);
INSERT INTO `mtb_page_max` VALUES (90,'90',8);
INSERT INTO `mtb_page_max` VALUES (100,'100',9);
/*!40000 ALTER TABLE `mtb_page_max` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_permission`
--

DROP TABLE IF EXISTS `mtb_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_permission` (
  `id` text NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_permission`
--

LOCK TABLES `mtb_permission` WRITE;
/*!40000 ALTER TABLE `mtb_permission` DISABLE KEYS */;
INSERT INTO `mtb_permission` VALUES ('/admin/entry/delete.php','1',9);
INSERT INTO `mtb_permission` VALUES ('/admin/entry/index.php','1',8);
INSERT INTO `mtb_permission` VALUES ('/admin/entry/inputzip.php','1',10);
INSERT INTO `mtb_permission` VALUES ('/admin/search/delete_note.php','1',11);
INSERT INTO `mtb_permission` VALUES ('/admin/system/`RANK`.php','0',7);
INSERT INTO `mtb_permission` VALUES ('/admin/system/delete.php','0',1);
INSERT INTO `mtb_permission` VALUES ('/admin/system/index.php','0',0);
INSERT INTO `mtb_permission` VALUES ('/admin/system/input.php','0',2);
INSERT INTO `mtb_permission` VALUES ('/admin/system/master_delete.php','0',4);
INSERT INTO `mtb_permission` VALUES ('/admin/system/master_rank.php','0',5);
INSERT INTO `mtb_permission` VALUES ('/admin/system/master.php','0',3);
INSERT INTO `mtb_permission` VALUES ('/admin/system/mastercsv.php','0',6);
/*!40000 ALTER TABLE `mtb_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_pref`
--

DROP TABLE IF EXISTS `mtb_pref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_pref` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_pref`
--

LOCK TABLES `mtb_pref` WRITE;
/*!40000 ALTER TABLE `mtb_pref` DISABLE KEYS */;
INSERT INTO `mtb_pref` VALUES (1,'北海道',1);
INSERT INTO `mtb_pref` VALUES (2,'青森県',2);
INSERT INTO `mtb_pref` VALUES (3,'岩手県',3);
INSERT INTO `mtb_pref` VALUES (4,'宮城県',4);
INSERT INTO `mtb_pref` VALUES (5,'秋田県',5);
INSERT INTO `mtb_pref` VALUES (6,'山形県',6);
INSERT INTO `mtb_pref` VALUES (7,'福島県',7);
INSERT INTO `mtb_pref` VALUES (8,'茨城県',8);
INSERT INTO `mtb_pref` VALUES (9,'栃木県',9);
INSERT INTO `mtb_pref` VALUES (10,'群馬県',10);
INSERT INTO `mtb_pref` VALUES (11,'埼玉県',11);
INSERT INTO `mtb_pref` VALUES (12,'千葉県',12);
INSERT INTO `mtb_pref` VALUES (13,'東京都',13);
INSERT INTO `mtb_pref` VALUES (14,'神奈川県',14);
INSERT INTO `mtb_pref` VALUES (15,'新潟県',15);
INSERT INTO `mtb_pref` VALUES (16,'富山県',16);
INSERT INTO `mtb_pref` VALUES (17,'石川県',17);
INSERT INTO `mtb_pref` VALUES (18,'福井県',18);
INSERT INTO `mtb_pref` VALUES (19,'山梨県',19);
INSERT INTO `mtb_pref` VALUES (20,'長野県',20);
INSERT INTO `mtb_pref` VALUES (21,'岐阜県',21);
INSERT INTO `mtb_pref` VALUES (22,'静岡県',22);
INSERT INTO `mtb_pref` VALUES (23,'愛知県',23);
INSERT INTO `mtb_pref` VALUES (24,'三重県',24);
INSERT INTO `mtb_pref` VALUES (25,'滋賀県',25);
INSERT INTO `mtb_pref` VALUES (26,'京都府',26);
INSERT INTO `mtb_pref` VALUES (27,'大阪府',27);
INSERT INTO `mtb_pref` VALUES (28,'兵庫県',28);
INSERT INTO `mtb_pref` VALUES (29,'奈良県',29);
INSERT INTO `mtb_pref` VALUES (30,'和歌山県',30);
INSERT INTO `mtb_pref` VALUES (31,'鳥取県',31);
INSERT INTO `mtb_pref` VALUES (32,'島根県',32);
INSERT INTO `mtb_pref` VALUES (33,'岡山県',33);
INSERT INTO `mtb_pref` VALUES (34,'広島県',34);
INSERT INTO `mtb_pref` VALUES (35,'山口県',35);
INSERT INTO `mtb_pref` VALUES (36,'徳島県',36);
INSERT INTO `mtb_pref` VALUES (37,'香川県',37);
INSERT INTO `mtb_pref` VALUES (38,'愛媛県',38);
INSERT INTO `mtb_pref` VALUES (39,'高知県',39);
INSERT INTO `mtb_pref` VALUES (40,'福岡県',40);
INSERT INTO `mtb_pref` VALUES (41,'佐賀県',41);
INSERT INTO `mtb_pref` VALUES (42,'長崎県',42);
INSERT INTO `mtb_pref` VALUES (43,'熊本県',43);
INSERT INTO `mtb_pref` VALUES (44,'大分県',44);
INSERT INTO `mtb_pref` VALUES (45,'宮崎県',45);
INSERT INTO `mtb_pref` VALUES (46,'鹿児島県',46);
INSERT INTO `mtb_pref` VALUES (47,'沖縄県',47);
/*!40000 ALTER TABLE `mtb_pref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_product_list_max`
--

DROP TABLE IF EXISTS `mtb_product_list_max`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_product_list_max` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_product_list_max`
--

LOCK TABLES `mtb_product_list_max` WRITE;
/*!40000 ALTER TABLE `mtb_product_list_max` DISABLE KEYS */;
INSERT INTO `mtb_product_list_max` VALUES (15,'15件',0);
INSERT INTO `mtb_product_list_max` VALUES (30,'30件',1);
INSERT INTO `mtb_product_list_max` VALUES (50,'50件',2);
/*!40000 ALTER TABLE `mtb_product_list_max` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_product_status_color`
--

DROP TABLE IF EXISTS `mtb_product_status_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_product_status_color` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_product_status_color`
--

LOCK TABLES `mtb_product_status_color` WRITE;
/*!40000 ALTER TABLE `mtb_product_status_color` DISABLE KEYS */;
INSERT INTO `mtb_product_status_color` VALUES (1,'#FFFFFF',0);
INSERT INTO `mtb_product_status_color` VALUES (2,'#C9C9C9',1);
INSERT INTO `mtb_product_status_color` VALUES (3,'#DDE6F2',2);
/*!40000 ALTER TABLE `mtb_product_status_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_product_type`
--

DROP TABLE IF EXISTS `mtb_product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_product_type` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_product_type`
--

LOCK TABLES `mtb_product_type` WRITE;
/*!40000 ALTER TABLE `mtb_product_type` DISABLE KEYS */;
INSERT INTO `mtb_product_type` VALUES (1,'通常商品',0);
INSERT INTO `mtb_product_type` VALUES (2,'ダウンロード商品',1);
/*!40000 ALTER TABLE `mtb_product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_recommend`
--

DROP TABLE IF EXISTS `mtb_recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_recommend` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_recommend`
--

LOCK TABLES `mtb_recommend` WRITE;
/*!40000 ALTER TABLE `mtb_recommend` DISABLE KEYS */;
INSERT INTO `mtb_recommend` VALUES (1,'★',4);
INSERT INTO `mtb_recommend` VALUES (2,'★★',3);
INSERT INTO `mtb_recommend` VALUES (3,'★★★',2);
INSERT INTO `mtb_recommend` VALUES (4,'★★★★',1);
INSERT INTO `mtb_recommend` VALUES (5,'★★★★★',0);
/*!40000 ALTER TABLE `mtb_recommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_reminder`
--

DROP TABLE IF EXISTS `mtb_reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_reminder` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_reminder`
--

LOCK TABLES `mtb_reminder` WRITE;
/*!40000 ALTER TABLE `mtb_reminder` DISABLE KEYS */;
INSERT INTO `mtb_reminder` VALUES (1,'母親の旧姓は？',0);
INSERT INTO `mtb_reminder` VALUES (2,'お気に入りのマンガは？',1);
INSERT INTO `mtb_reminder` VALUES (3,'大好きなペットの名前は？',2);
INSERT INTO `mtb_reminder` VALUES (4,'初恋の人の名前は？',3);
INSERT INTO `mtb_reminder` VALUES (5,'面白かった映画は？',4);
INSERT INTO `mtb_reminder` VALUES (6,'尊敬していた先生の名前は？',5);
INSERT INTO `mtb_reminder` VALUES (7,'好きな食べ物は？',6);
/*!40000 ALTER TABLE `mtb_reminder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_review_deny_url`
--

DROP TABLE IF EXISTS `mtb_review_deny_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_review_deny_url` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_review_deny_url`
--

LOCK TABLES `mtb_review_deny_url` WRITE;
/*!40000 ALTER TABLE `mtb_review_deny_url` DISABLE KEYS */;
INSERT INTO `mtb_review_deny_url` VALUES (0,'http://',0);
INSERT INTO `mtb_review_deny_url` VALUES (1,'https://',1);
INSERT INTO `mtb_review_deny_url` VALUES (2,'ttp://',2);
INSERT INTO `mtb_review_deny_url` VALUES (3,'ttps://',3);
/*!40000 ALTER TABLE `mtb_review_deny_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_sex`
--

DROP TABLE IF EXISTS `mtb_sex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_sex` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_sex`
--

LOCK TABLES `mtb_sex` WRITE;
/*!40000 ALTER TABLE `mtb_sex` DISABLE KEYS */;
INSERT INTO `mtb_sex` VALUES (1,'男性',0);
INSERT INTO `mtb_sex` VALUES (2,'女性',1);
/*!40000 ALTER TABLE `mtb_sex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_status`
--

DROP TABLE IF EXISTS `mtb_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_status` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_status`
--

LOCK TABLES `mtb_status` WRITE;
/*!40000 ALTER TABLE `mtb_status` DISABLE KEYS */;
INSERT INTO `mtb_status` VALUES (1,'とても良い',0);
INSERT INTO `mtb_status` VALUES (2,'良い',1);
INSERT INTO `mtb_status` VALUES (3,'まあまあ',2);
INSERT INTO `mtb_status` VALUES (4,'悪い',3);
INSERT INTO `mtb_status` VALUES (5,'とても悪い',4);
/*!40000 ALTER TABLE `mtb_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_status_image`
--

DROP TABLE IF EXISTS `mtb_status_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_status_image` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_status_image`
--

LOCK TABLES `mtb_status_image` WRITE;
/*!40000 ALTER TABLE `mtb_status_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `mtb_status_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_target`
--

DROP TABLE IF EXISTS `mtb_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_target` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_target`
--

LOCK TABLES `mtb_target` WRITE;
/*!40000 ALTER TABLE `mtb_target` DISABLE KEYS */;
INSERT INTO `mtb_target` VALUES (0,'Unused',0);
INSERT INTO `mtb_target` VALUES (1,'LeftNavi',1);
INSERT INTO `mtb_target` VALUES (2,'MainHead',2);
INSERT INTO `mtb_target` VALUES (3,'RightNavi',3);
INSERT INTO `mtb_target` VALUES (4,'MainFoot',4);
INSERT INTO `mtb_target` VALUES (5,'TopNavi',5);
INSERT INTO `mtb_target` VALUES (6,'BottomNavi',6);
INSERT INTO `mtb_target` VALUES (7,'HeadNavi',7);
INSERT INTO `mtb_target` VALUES (8,'HeaderTopNavi',8);
INSERT INTO `mtb_target` VALUES (9,'FooterBottomNavi',9);
INSERT INTO `mtb_target` VALUES (10,'HeaderInternalNavi',10);
/*!40000 ALTER TABLE `mtb_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_taxrule`
--

DROP TABLE IF EXISTS `mtb_taxrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_taxrule` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_taxrule`
--

LOCK TABLES `mtb_taxrule` WRITE;
/*!40000 ALTER TABLE `mtb_taxrule` DISABLE KEYS */;
INSERT INTO `mtb_taxrule` VALUES (1,'四捨五入',0);
INSERT INTO `mtb_taxrule` VALUES (2,'切り捨て',1);
INSERT INTO `mtb_taxrule` VALUES (3,'切り上げ',2);
/*!40000 ALTER TABLE `mtb_taxrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_wday`
--

DROP TABLE IF EXISTS `mtb_wday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_wday` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_wday`
--

LOCK TABLES `mtb_wday` WRITE;
/*!40000 ALTER TABLE `mtb_wday` DISABLE KEYS */;
INSERT INTO `mtb_wday` VALUES (0,'日',0);
INSERT INTO `mtb_wday` VALUES (1,'月',1);
INSERT INTO `mtb_wday` VALUES (2,'火',2);
INSERT INTO `mtb_wday` VALUES (3,'水',3);
INSERT INTO `mtb_wday` VALUES (4,'木',4);
INSERT INTO `mtb_wday` VALUES (5,'金',5);
INSERT INTO `mtb_wday` VALUES (6,'土',6);
/*!40000 ALTER TABLE `mtb_wday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_work`
--

DROP TABLE IF EXISTS `mtb_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_work` (
  `id` smallint NOT NULL,
  `name` text,
  `RANK` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_work`
--

LOCK TABLES `mtb_work` WRITE;
/*!40000 ALTER TABLE `mtb_work` DISABLE KEYS */;
INSERT INTO `mtb_work` VALUES (0,'非稼働',0);
INSERT INTO `mtb_work` VALUES (1,'稼働',1);
/*!40000 ALTER TABLE `mtb_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtb_zip`
--

DROP TABLE IF EXISTS `mtb_zip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtb_zip` (
  `zip_id` int NOT NULL,
  `zipcode` text,
  `state` text,
  `city` text,
  `town` text,
  PRIMARY KEY (`zip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtb_zip`
--

LOCK TABLES `mtb_zip` WRITE;
/*!40000 ALTER TABLE `mtb_zip` DISABLE KEYS */;
/*!40000 ALTER TABLE `mtb_zip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sln_dtb_mem_card_id`
--

DROP TABLE IF EXISTS `sln_dtb_mem_card_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sln_dtb_mem_card_id` (
  `customer_id` int NOT NULL,
  `mem_id` int NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sln_dtb_mem_card_id`
--

LOCK TABLES `sln_dtb_mem_card_id` WRITE;
/*!40000 ALTER TABLE `sln_dtb_mem_card_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `sln_dtb_mem_card_id` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-11  2:45:12
