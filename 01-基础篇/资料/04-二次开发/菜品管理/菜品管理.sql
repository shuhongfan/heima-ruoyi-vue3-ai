-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ry-vue
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `tb_dish`
--

DROP TABLE IF EXISTS `tb_dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_dish` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜品名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品价格',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '描述信息',
  `status` int DEFAULT '1' COMMENT '0 停售 1 起售',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dish_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dish`
--

LOCK TABLES `tb_dish` WRITE;
/*!40000 ALTER TABLE `tb_dish` DISABLE KEYS */;
INSERT INTO `tb_dish` VALUES (30,'干锅牛蛙',38.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681398849610-干锅牛蛙.jpg','干锅牛蛙',1,'2023-04-13 23:14:12','2023-04-16 22:04:25'),(50,'馒头',1.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/14/1681436083461-馒头.jpg','优质面粉',1,'2022-06-10 09:34:28','2023-04-14 09:34:45'),(74,'黑金鲍鱼',68.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681397045666-黑金鲍海鲜.jpg','新西兰黑金鲍鱼',1,'2023-02-16 09:48:28','2023-04-13 22:44:08'),(75,'波士顿龙虾',128.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681396948811-5b8d2da3-3744-4bb3-acdc-329056b8259d.jpeg','2斤重 波斯顿龙虾',1,'2023-02-16 09:50:06','2023-04-13 22:42:31'),(76,'香辣烤乌江鱼3斤',108.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681396881076-烤鱼2.jpg','香辣烤乌江鱼3斤',1,'2023-02-16 09:52:30','2023-04-13 22:41:29'),(77,'香辣烤鱼3斤',78.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681396752225-烤鱼1.jpg','香辣烤鱼3斤 草鱼',1,'2023-02-17 15:27:02','2023-04-13 22:39:20'),(80,'宽粉',8.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681397331911-宽粉.jpg','宽粉',0,'2023-04-13 22:48:57','2023-04-15 13:45:03'),(81,'青笋',10.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681397358593-青笋.jpg','青笋',1,'2023-04-13 22:49:21','2023-04-13 22:49:21'),(82,'鲜豆皮',8.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681397389673-鲜豆皮.jpg','鲜豆皮',1,'2023-04-13 22:49:52','2023-04-13 22:49:52'),(83,'娃娃菜',6.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681397423765-娃娃菜.jpg','娃娃菜',1,'2023-04-13 22:50:26','2023-04-13 22:50:26'),(84,'土豆片',6.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681397450872-土豆片.jpg','土豆片',1,'2023-04-13 22:50:59','2023-04-13 22:50:59'),(85,'鱼豆腐',6.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681397585037-鱼豆腐.jpg','鱼豆腐',1,'2023-04-13 22:53:07','2024-04-29 21:42:07'),(86,'重庆毛血旺',58.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681397774614-重庆毛血旺.jpg','重庆毛血旺',1,'2023-04-13 22:56:18','2023-04-13 22:56:18'),(87,'重庆辣子鸡',48.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681397813331-重庆辣子鸡.jpg','重庆辣子鸡',1,'2023-04-13 22:56:57','2023-04-13 22:56:57'),(88,'渝乡沸腾鱼片',79.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681397886462-沸腾鱼片.jpg','渝乡沸腾鱼片 草鱼',1,'2023-04-13 22:58:29','2023-04-13 22:58:29'),(89,'皮蛋豆腐',28.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681397971808-皮蛋豆腐.jpeg','皮蛋豆腐 鸭蛋 松花江皮蛋',1,'2023-04-13 22:59:45','2023-04-13 22:59:45'),(90,'果仁菠菜',18.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681398074872-果仁菠菜.jpg','果仁菠菜 花生 菠菜',1,'2023-04-13 23:01:32','2023-04-13 23:01:32'),(91,'蒜泥黄瓜',12.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681398142706-蒜泥黄瓜.jpg','蒜泥黄瓜 大蒜 剁椒',1,'2023-04-13 23:02:32','2023-04-13 23:02:32'),(92,'老醋花生',12.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681398185891-老醋花生.jpeg','老醋花生 老陈醋',1,'2023-04-13 23:03:15','2023-04-13 23:03:15'),(93,'干锅花菜',28.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681398621640-干锅花菜.jpg','干锅花菜',1,'2023-04-13 23:10:32','2023-04-13 23:10:32'),(94,'干锅千页豆腐',30.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681398665753-干锅千页豆腐.jpg','干锅千页豆腐',1,'2023-04-13 23:11:08','2023-04-13 23:11:08'),(95,'干锅鸡胗',38.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681398701510-干锅鸡胗.jpg','干锅鸡胗',1,'2023-04-13 23:11:46','2023-04-13 23:11:46'),(96,'干锅藕片',28.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681398783756-干锅藕片.jpg','干锅藕片',1,'2023-04-13 23:13:18','2023-04-13 23:13:18'),(98,'扬州炒饭',12.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681399057973-炒饭.jpg','扬州炒饭',1,'2023-04-13 23:17:52','2023-04-16 22:04:29'),(99,'腐竹',8.00,'https://sky-heima.oss-cn-beijing.aliyuncs.com/images/2023/04/13/1681399144535-腐竹.jpg','腐竹',0,'2023-04-13 23:19:18','2023-04-14 10:27:59');
/*!40000 ALTER TABLE `tb_dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_dish_flavor`
--

DROP TABLE IF EXISTS `tb_dish_flavor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_dish_flavor` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dish_id` bigint NOT NULL COMMENT '菜品',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味名称',
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味列表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品口味关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dish_flavor`
--

LOCK TABLES `tb_dish_flavor` WRITE;
/*!40000 ALTER TABLE `tb_dish_flavor` DISABLE KEYS */;
INSERT INTO `tb_dish_flavor` VALUES (1,63,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(111,63,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(112,60,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(113,60,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\"]'),(114,57,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(115,57,'辣度','[\"不辣\",\"微辣\",\"中辣\"]'),(116,56,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\"]'),(117,54,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\"]'),(118,52,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(119,52,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(122,73,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(136,77,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(137,77,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(138,76,'辣度','[\"微辣\",\"中辣\"]'),(139,76,'忌口','[\"不要葱\",\"不要香菜\",\"不要辣\"]'),(140,75,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(141,75,'辣度','[\"不辣\",\"微辣\",\"中辣\"]'),(142,74,'忌口','[\"不要葱\",\"不要蒜\"]'),(143,74,'甜味','[\"无糖\",\"少糖\",\"半糖\"]'),(144,86,'辣度','[\"微辣\",\"中辣\",\"重辣\"]'),(145,87,'辣度','[\"微辣\",\"中辣\",\"重辣\"]'),(146,88,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\"]'),(147,88,'辣度','[\"微辣\",\"中辣\"]'),(148,89,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\"]'),(149,89,'甜味','[\"无糖\",\"少糖\"]'),(150,90,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\"]'),(151,90,'辣度','[\"不辣\",\"微辣\"]'),(152,91,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(153,91,'辣度','[\"不辣\",\"微辣\"]'),(154,92,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\"]'),(155,51,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(156,51,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(157,72,'辣度','[\"微辣\"]'),(159,53,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(160,53,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(161,93,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(162,93,'辣度','[\"微辣\",\"中辣\"]'),(163,94,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\"]'),(164,94,'辣度','[\"不辣\",\"微辣\"]'),(165,95,'辣度','[\"微辣\",\"中辣\"]'),(166,96,'辣度','[\"微辣\",\"中辣\"]'),(167,97,'忌口','[\"不要蒜\",\"不要香菜\"]'),(168,97,'辣度','[\"微辣\",\"中辣\"]'),(169,67,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(170,66,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(172,65,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(182,85,'甜味','[\"全糖\",\"半糖\",\"少糖\"]');
/*!40000 ALTER TABLE `tb_dish_flavor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-07 20:15:19
