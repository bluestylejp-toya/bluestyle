DROP TABLE IF EXISTS `plg_line_login_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plg_line_login_integration` (
  customer_id int NOT NULL,
  line_user_id text NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL,
  `del_flg` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_id`),
  KEY `plg_line_login_integration_customer_id_key` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `plg_line_login_integration_setting`;
CREATE TABLE plg_line_login_integration_setting (
   id int NOT NULL,
   line_channel_id text,
   line_channel_secret text,
   line_channel_access_token text
);