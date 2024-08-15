-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dkd-v3
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
-- Table structure for table `tb_vendout_running`
--

DROP TABLE IF EXISTS `tb_vendout_running`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_vendout_running` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_no` varchar(38) NOT NULL DEFAULT '' COMMENT '订单编号',
  `inner_code` varchar(15) NOT NULL COMMENT '售货机编号',
  `channel_code` varchar(10) DEFAULT NULL COMMENT '货道编号',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1665296081440129026 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='出货流水';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_vendout_running`
--

LOCK TABLES `tb_vendout_running` WRITE;
/*!40000 ALTER TABLE `tb_vendout_running` DISABLE KEYS */;
INSERT INTO `tb_vendout_running` VALUES (1640253535886454786,'A1000001972287294582300','A1000001',NULL,'1','2023-03-27 07:24:52','2023-03-27 07:24:52'),(1640294341087305730,'A1000001982025093546600','A1000001',NULL,'0','2023-03-27 10:07:01','2023-03-27 10:07:01'),(1640295508953505793,'A1000001982308461482000','A1000001',NULL,'0','2023-03-27 10:11:39','2023-03-27 10:11:39'),(1665193032268836866,'A10000011867384516930600','A1000001',NULL,'0','2023-06-04 03:05:31','2023-06-04 03:05:31'),(1665193181468618753,'A10000011867429590093200','A1000001',NULL,'0','2023-06-04 03:06:07','2023-06-04 03:06:07'),(1665194583502811137,'A10000011867548883835400','A1000001',NULL,'0','2023-06-04 03:11:41','2023-06-04 03:11:41'),(1665197927541698561,'A10000011868551878012500','A1000001',NULL,'0','2023-06-04 03:24:58','2023-06-04 03:24:58'),(1665200173490827265,'A10000011869054027266500','A1000001',NULL,'0','2023-06-04 03:33:54','2023-06-04 03:33:54'),(1665295023343058946,'A10000011891589370978600','A1000001',NULL,'1','2023-06-04 09:50:48','2023-06-04 09:51:34'),(1665296081440129025,'A10000011891956192562900','A1000001',NULL,'0','2023-06-04 09:55:00','2023-06-04 09:55:00');
/*!40000 ALTER TABLE `tb_vendout_running` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sku`
--

DROP TABLE IF EXISTS `tb_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_sku` (
  `sku_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sku_name` varchar(50) NOT NULL COMMENT '商品名称',
  `sku_image` varchar(500) NOT NULL COMMENT '商品图片',
  `brand_Name` varchar(50) NOT NULL COMMENT '品牌',
  `unit` varchar(20) DEFAULT NULL COMMENT '规格(净含量)',
  `price` int NOT NULL DEFAULT '1' COMMENT '商品价格，单位分',
  `class_id` int NOT NULL COMMENT '商品类型Id',
  `is_discount` tinyint(1) DEFAULT '0' COMMENT '是否打折促销',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`sku_id`),
  UNIQUE KEY `tb_sku_sku_name_uindex` (`sku_name`),
  KEY `sku_sku_class_ClassId_fk` (`class_id`),
  CONSTRAINT `tb_sku_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `tb_sku_class` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sku`
--

LOCK TABLES `tb_sku` WRITE;
/*!40000 ALTER TABLE `tb_sku` DISABLE KEYS */;
INSERT INTO `tb_sku` VALUES (1,'可口可乐','https://likede2-java.itheima.net/image/product1.png','可口可乐','550ML',200,1,1,'2020-09-14 01:14:17','2024-05-14 02:47:42'),(2,'康师傅','https://likede2-java.itheima.net/image/product2.png','可口可乐','330ML',200,1,0,'2020-09-14 01:15:43','2024-05-14 02:47:52'),(3,'统一奶茶','https://likede2-java.itheima.net/image/product3.png','可口可乐','500ML',100,1,0,'2020-09-16 06:41:50','2020-09-16 06:41:50'),(4,'青梅绿茶','https://likede2-java.itheima.net/image/product4.png','可口可乐','500ML',200,1,0,'2020-11-20 10:27:35','2020-11-20 10:27:35'),(5,'冰糖雪梨','https://likede2-java.itheima.net/image/product5.png','冰糖雪梨','500ML',250,1,0,'2020-12-18 06:03:41','2024-05-14 02:47:28'),(6,'怡宝至尊','https://likede2-java.itheima.net/image/product6.png','怡宝','500ML',200,1,0,'2020-12-18 06:04:02','2024-05-14 02:47:35'),(7,'一百橙汁','https://likede2-java.itheima.net/image/product7.png','100橙汁自然纯','500ML',100,1,0,'2020-12-18 06:04:26','2020-12-18 06:04:26'),(8,'魔力花茶','https://likede2-java.itheima.net/image/product8.png','茉莉花茶','500ML',100,1,0,'2020-12-18 06:04:45','2020-12-18 06:04:45'),(9,'新星巴克','https://likede2-java.itheima.net/image/product9.png','星巴克','500ML',100,1,0,'2020-12-18 06:05:01','2020-12-18 06:05:01');
/*!40000 ALTER TABLE `tb_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_collect`
--

DROP TABLE IF EXISTS `tb_order_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_order_collect` (
  `id` bigint NOT NULL COMMENT 'Id',
  `partner_id` int DEFAULT NULL COMMENT '合作商Id',
  `partner_name` varchar(100) DEFAULT NULL COMMENT '合作商名称',
  `order_total_money` bigint DEFAULT NULL COMMENT '日订单收入总金额(平台端总数)',
  `order_date` date DEFAULT NULL COMMENT '发生日期',
  `total_bill` int DEFAULT '0' COMMENT '分成总金额',
  `node_id` int DEFAULT NULL,
  `node_name` varchar(50) DEFAULT NULL COMMENT '点位',
  `order_count` int DEFAULT NULL COMMENT '订单数',
  `ratio` int DEFAULT NULL COMMENT '分成比例',
  `region_name` varchar(50) DEFAULT NULL COMMENT '区域名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_order_collect_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='合作商订单汇总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_collect`
--

LOCK TABLES `tb_order_collect` WRITE;
/*!40000 ALTER TABLE `tb_order_collect` DISABLE KEYS */;
INSERT INTO `tb_order_collect` VALUES (1701144293748969474,1,'金燕龙合作商',6,'2023-09-27',0,1,'龙门石窟',3,15,'昌平'),(1701167701270380546,1,'金燕龙合作商',1,'2023-09-27',0,1,'龙门石窟',3,15,'顺义'),(1701168456614256642,1,'金燕龙合作商',2,'2023-09-27',0,1,'龙门石窟',3,15,'海淀'),(1701168704594092033,1,'金燕龙合作商',4,'2023-09-27',0,1,'龙门石窟',3,15,'东城'),(1701168956252332033,1,'金燕龙合作商',5,'2023-09-27',0,1,'龙门石窟',3,15,'朝阳');
/*!40000 ALTER TABLE `tb_order_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_vending_machine`
--

DROP TABLE IF EXISTS `tb_vending_machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_vending_machine` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `inner_code` varchar(15) DEFAULT '000' COMMENT '设备编号',
  `channel_max_capacity` int DEFAULT NULL COMMENT '设备容量',
  `node_id` int NOT NULL COMMENT '点位Id',
  `addr` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `last_supply_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '上次补货时间',
  `business_type` int NOT NULL COMMENT '商圈类型',
  `region_id` int NOT NULL COMMENT '区域Id',
  `partner_id` int NOT NULL COMMENT '合作商Id',
  `vm_type_id` int NOT NULL DEFAULT '0' COMMENT '设备型号',
  `vm_status` int NOT NULL DEFAULT '0' COMMENT '设备状态，0:未投放;1-运营;3-撤机',
  `running_status` varchar(100) DEFAULT NULL COMMENT '运行状态',
  `longitudes` double DEFAULT '0' COMMENT '经度',
  `latitude` double DEFAULT '0' COMMENT '维度',
  `client_id` varchar(50) DEFAULT NULL COMMENT '客户端连接Id,做emq认证用',
  `policy_id` bigint DEFAULT NULL COMMENT '策略id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendingmachine_VmId_uindex` (`inner_code`),
  KEY `vendingmachine_node_Id_fk` (`node_id`),
  KEY `vendingmachine_vmtype_TypeId_fk` (`vm_type_id`),
  KEY `policy_id` (`policy_id`),
  CONSTRAINT `tb_vending_machine_ibfk_1` FOREIGN KEY (`vm_type_id`) REFERENCES `tb_vm_type` (`id`),
  CONSTRAINT `tb_vending_machine_ibfk_2` FOREIGN KEY (`node_id`) REFERENCES `tb_node` (`id`),
  CONSTRAINT `tb_vending_machine_ibfk_3` FOREIGN KEY (`policy_id`) REFERENCES `tb_policy` (`policy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='设备表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_vending_machine`
--

LOCK TABLES `tb_vending_machine` WRITE;
/*!40000 ALTER TABLE `tb_vending_machine` DISABLE KEYS */;
INSERT INTO `tb_vending_machine` VALUES (80,'A1000001',10,2,'顺义奥林匹克水上公园','2023-03-22 00:00:00',1,3,28,1,1,'{\"statusCode\":\"1001\",\"status\":true}',0,0,'70122567fcc13e7615e7239812c20448',1,'2020-12-18 07:49:03','2024-05-14 01:21:58'),(86,'aim5xu4I',10,2,'北京市海淀区西直门北大街32号','2000-01-01 00:00:00',2,1,1,2,1,'{\"statusCode\":\"1001\",\"status\":true}',0,0,'9d1d927b2651dba9f117a9801e7fd916',1,'2020-12-18 02:39:22','2024-05-14 01:24:53'),(87,'5cy5BdUs',10,2,'北京市海淀区西直门北大街32号','2022-12-05 00:00:00',2,1,1,2,1,'{\"statusCode\":\"1001\",\"status\":true}',0,0,'fdf33db4de889d6c31fe6351a7333072',2,'2020-12-18 02:39:22','2024-05-12 15:19:10'),(88,'tCeiyxLx',10,1,'北京市昌平区建材城西路22号','2000-01-01 00:00:00',2,1,1,1,1,'{\"statusCode\":\"1001\",\"status\":true}',0,0,'0805f7585e4366b021268f8850d1e091',1,'2020-09-10 01:41:02','2024-05-14 01:24:55'),(89,'bR1cfQRa',10,2,'北京市海淀区西直门北大街32号','2000-01-01 00:00:00',2,1,1,2,1,'{\"statusCode\":\"1001\",\"status\":true}',0,0,'e4e02a07b11865bf262afb5d4507e7b3',1,'2020-12-18 02:39:22','2024-05-14 01:24:56'),(90,'RhLWjaeR',10,1,'北京市昌平区建材城西路22号','2000-01-01 00:00:00',2,1,1,1,1,'{\"statusCode\":\"1001\",\"status\":true}',0,0,'0cc9e22badf6a0f41b5fad2c8b788fcd',2,'2020-09-10 01:41:02','2024-05-14 01:25:07'),(91,'qUObmvbM',10,2,'北京市海淀区西直门北大街32号','2022-12-06 00:00:00',2,1,1,2,1,'{\"statusCode\":\"1001\",\"status\":true}',0,0,'34a1779725b4e06edd7cac8a518474f1',2,'2020-12-18 02:39:22','2024-05-14 01:25:11'),(92,'tU6K5IHg',10,1,'北京市昌平区建材城西路22号','2000-01-01 00:00:00',2,1,1,2,1,'{\"statusCode\":\"1001\",\"status\":true}',0,0,'fbb7f7c0bfd38785866844f983b3a887',5,'2020-09-10 01:41:02','2024-05-14 01:25:14'),(93,'iSzMcQXJ',10,1,'北京市昌平区建材城西路22号','2000-01-01 00:00:00',2,1,1,1,1,'{\"statusCode\":\"1001\",\"status\":true}',0,0,'7c6f5ad6edd6e161d6ca8b94d0324fe5',2,'2020-09-10 01:41:02','2024-05-14 01:25:19'),(105,'nf2UVwi5',8,2,'北京顺义区国际鲜花港','2000-01-01 00:00:00',1,3,1,4,0,NULL,0,0,NULL,NULL,'2020-12-18 07:48:13','2024-05-13 10:47:32'),(106,'vWgqPhpu',10,1,'北京市昌平区建材城西路22号','2024-05-18 15:26:37',2,1,1,1,1,NULL,0,0,NULL,NULL,'2020-09-10 01:41:02','2024-05-12 15:20:41'),(107,'SFNuCUe8',8,1,'北京市昌平区建材城西路22号','2000-01-01 00:00:00',2,1,1,4,0,NULL,0,0,NULL,NULL,'2020-09-10 01:41:02','2024-05-12 15:20:41'),(111,'K6YYXHLY',10,2,'北京顺义区国际鲜花港','2000-01-01 00:00:00',1,3,1,1,0,'{\"statusCode\":\"1001\",\"status\":true}',0,0,NULL,NULL,'2020-12-18 07:48:13','2024-05-19 07:32:27');
/*!40000 ALTER TABLE `tb_vending_machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_task_collect`
--

DROP TABLE IF EXISTS `tb_task_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_task_collect` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `finish_count` int DEFAULT '0' COMMENT '当日工单完成数',
  `progress_count` int DEFAULT '0' COMMENT '当日进行中的工单数',
  `cancel_count` int DEFAULT '0' COMMENT '当日取消工单数',
  `collect_date` date DEFAULT NULL COMMENT '汇总的日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='工单按日统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_task_collect`
--

LOCK TABLES `tb_task_collect` WRITE;
/*!40000 ALTER TABLE `tb_task_collect` DISABLE KEYS */;
INSERT INTO `tb_task_collect` VALUES (89,NULL,0,0,0,NULL);
/*!40000 ALTER TABLE `tb_task_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_channel`
--

DROP TABLE IF EXISTS `tb_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_channel` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `channel_code` varchar(10) NOT NULL COMMENT '货道编号',
  `sku_id` bigint DEFAULT '0' COMMENT '商品Id',
  `vm_id` bigint NOT NULL COMMENT '售货机Id',
  `inner_code` varchar(15) NOT NULL COMMENT '售货机软编号',
  `max_capacity` int NOT NULL DEFAULT '0' COMMENT '货道最大容量',
  `current_capacity` int DEFAULT '0' COMMENT '货道当前容量',
  `last_supply_time` datetime DEFAULT NULL COMMENT '上次补货时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `channel_vendingmachine_Id_fk` (`vm_id`),
  KEY `tb_channel_inner_code_index` (`inner_code`),
  CONSTRAINT `tb_channel_ibfk_1` FOREIGN KEY (`vm_id`) REFERENCES `tb_vending_machine` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5209 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='售货机货道表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_channel`
--

LOCK TABLES `tb_channel` WRITE;
/*!40000 ALTER TABLE `tb_channel` DISABLE KEYS */;
INSERT INTO `tb_channel` VALUES (4703,'1-1',9,80,'A1000001',10,8,'2023-03-22 17:16:46','2022-05-11 12:12:40','2024-05-19 16:05:35'),(4704,'1-2',2,80,'A1000001',10,2,'2023-03-22 17:16:46','2022-05-11 12:12:40','2024-05-19 16:05:35'),(4705,'1-3',2,80,'A1000001',10,6,'2023-03-22 17:16:46','2022-05-11 12:12:40','2024-05-19 16:05:35'),(4706,'1-4',4,80,'A1000001',10,10,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4707,'1-5',3,80,'A1000001',10,9,'2023-03-22 17:16:46','2022-05-11 12:12:40','2024-05-19 16:05:35'),(4708,'1-6',4,80,'A1000001',10,4,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4709,'2-1',1,80,'A1000001',10,10,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4710,'2-2',6,80,'A1000001',10,10,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4711,'2-3',8,80,'A1000001',10,0,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4712,'2-4',9,80,'A1000001',10,9,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4713,'2-5',2,80,'A1000001',10,6,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4714,'2-6',4,80,'A1000001',10,10,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4715,'3-1',7,80,'A1000001',10,5,'2023-03-22 17:16:46','2022-05-11 12:12:40','2024-05-19 16:05:35'),(4716,'3-2',6,80,'A1000001',10,10,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4717,'3-3',3,80,'A1000001',10,10,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4718,'3-4',2,80,'A1000001',10,10,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4719,'3-5',2,80,'A1000001',10,10,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4720,'3-6',1,80,'A1000001',10,10,'2023-03-22 17:16:46','2022-05-11 12:12:40','2024-05-19 16:05:35'),(4721,'4-1',2,80,'A1000001',10,1,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4722,'4-2',4,80,'A1000001',10,10,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4723,'4-3',5,80,'A1000001',10,6,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4724,'4-4',6,80,'A1000001',10,10,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4725,'4-5',6,80,'A1000001',10,10,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4726,'4-6',6,80,'A1000001',10,10,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4727,'5-1',6,80,'A1000001',10,10,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4728,'5-2',6,80,'A1000001',10,10,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4729,'5-3',6,80,'A1000001',10,10,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4730,'5-4',6,80,'A1000001',10,10,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4731,'5-5',9,80,'A1000001',10,10,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4732,'5-6',6,80,'A1000001',10,10,NULL,'2022-05-11 12:12:40','2024-05-19 16:05:35'),(4883,'1-1',5,86,'aim5xu4I',10,10,NULL,'2022-12-05 17:01:38','2022-12-05 17:01:38'),(4884,'1-2',1,86,'aim5xu4I',10,10,NULL,'2022-12-05 17:01:38','2022-12-05 17:01:38'),(4885,'2-1',0,86,'aim5xu4I',10,10,NULL,'2022-12-05 17:01:38','2022-12-05 17:01:38'),(4886,'2-2',0,86,'aim5xu4I',10,10,NULL,'2022-12-05 17:01:38','2022-12-05 17:01:38'),(4887,'1-1',5,87,'5cy5BdUs',10,10,'2022-12-05 21:45:36','2022-12-05 21:35:56','2022-12-05 21:45:36'),(4888,'1-2',1,87,'5cy5BdUs',10,10,'2022-12-05 21:45:36','2022-12-05 21:35:56','2022-12-05 21:45:36'),(4889,'2-1',0,87,'5cy5BdUs',10,10,NULL,'2022-12-05 21:35:56','2022-12-05 21:35:56'),(4890,'2-2',0,87,'5cy5BdUs',10,10,NULL,'2022-12-05 21:35:56','2022-12-05 21:35:56'),(4891,'1-1',2,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4892,'1-2',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4893,'1-3',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4894,'1-4',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4895,'1-5',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4896,'1-6',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4897,'2-1',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4898,'2-2',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4899,'2-3',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4900,'2-4',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4901,'2-5',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4902,'2-6',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4903,'3-1',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4904,'3-2',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4905,'3-3',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4906,'3-4',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4907,'3-5',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4908,'3-6',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4909,'4-1',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4910,'4-2',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4911,'4-3',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4912,'4-4',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4913,'4-5',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4914,'4-6',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4915,'5-1',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4916,'5-2',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4917,'5-3',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4918,'5-4',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4919,'5-5',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4920,'5-6',0,88,'tCeiyxLx',10,10,NULL,'2022-12-05 22:39:26','2024-05-16 22:02:27'),(4921,'1-1',2,89,'bR1cfQRa',10,10,NULL,'2022-12-06 10:06:11','2023-09-22 15:43:44'),(4922,'1-2',0,89,'bR1cfQRa',10,10,NULL,'2022-12-06 10:06:11','2022-12-06 10:06:11'),(4923,'2-1',0,89,'bR1cfQRa',10,10,NULL,'2022-12-06 10:06:11','2022-12-06 10:06:11'),(4924,'2-2',0,89,'bR1cfQRa',10,10,NULL,'2022-12-06 10:06:11','2022-12-06 10:06:11'),(4925,'1-1',2,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4926,'1-2',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4927,'1-3',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4928,'1-4',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4929,'1-5',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4930,'1-6',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4931,'2-1',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4932,'2-2',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4933,'2-3',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4934,'2-4',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4935,'2-5',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4936,'2-6',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4937,'3-1',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4938,'3-2',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4939,'3-3',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4940,'3-4',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4941,'3-5',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4942,'3-6',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4943,'4-1',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4944,'4-2',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4945,'4-3',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4946,'4-4',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4947,'4-5',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4948,'4-6',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4949,'5-1',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4950,'5-2',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4951,'5-3',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4952,'5-4',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4953,'5-5',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4954,'5-6',0,90,'RhLWjaeR',10,10,NULL,'2022-12-06 10:17:32','2024-05-15 16:31:18'),(4955,'1-1',5,91,'qUObmvbM',10,10,'2022-12-06 15:11:20','2022-12-06 14:58:46','2022-12-06 15:11:20'),(4956,'1-2',1,91,'qUObmvbM',10,10,'2022-12-06 15:11:20','2022-12-06 14:58:46','2022-12-06 15:11:20'),(4957,'2-1',0,91,'qUObmvbM',10,10,NULL,'2022-12-06 14:58:46','2022-12-06 14:58:46'),(4958,'2-2',0,91,'qUObmvbM',10,10,NULL,'2022-12-06 14:58:46','2022-12-06 14:58:46'),(4959,'1-1',0,92,'tU6K5IHg',10,0,NULL,'2023-01-03 19:37:43','2023-01-03 19:37:43'),(4960,'1-2',0,92,'tU6K5IHg',10,0,NULL,'2023-01-03 19:37:43','2023-01-03 19:37:43'),(4961,'2-1',0,92,'tU6K5IHg',10,0,NULL,'2023-01-03 19:37:43','2023-01-03 19:37:43'),(4962,'2-2',0,92,'tU6K5IHg',10,0,NULL,'2023-01-03 19:37:43','2023-01-03 19:37:43'),(4963,'1-1',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4964,'1-2',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4965,'1-3',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4966,'1-4',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4967,'1-5',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4968,'1-6',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4969,'2-1',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4970,'2-2',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4971,'2-3',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4972,'2-4',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4973,'2-5',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4974,'2-6',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4975,'3-1',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4976,'3-2',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4977,'3-3',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4978,'3-4',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4979,'3-5',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4980,'3-6',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4981,'4-1',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4982,'4-2',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4983,'4-3',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4984,'4-4',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4985,'4-5',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4986,'4-6',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4987,'5-1',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4988,'5-2',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4989,'5-3',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4990,'5-4',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4991,'5-5',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(4992,'5-6',0,93,'iSzMcQXJ',10,0,NULL,'2023-02-01 11:16:02','2023-02-01 11:16:02'),(5027,'1-1',0,105,'nf2UVwi5',8,0,NULL,'2024-05-13 21:37:53',NULL),(5028,'1-2',0,105,'nf2UVwi5',8,0,NULL,'2024-05-13 21:37:53',NULL),(5029,'1-3',0,105,'nf2UVwi5',8,0,NULL,'2024-05-13 21:37:53',NULL),(5030,'1-4',0,105,'nf2UVwi5',8,0,NULL,'2024-05-13 21:37:53',NULL),(5031,'2-1',0,105,'nf2UVwi5',8,0,NULL,'2024-05-13 21:37:53',NULL),(5032,'2-2',0,105,'nf2UVwi5',8,0,NULL,'2024-05-13 21:37:53',NULL),(5033,'2-3',0,105,'nf2UVwi5',8,0,NULL,'2024-05-13 21:37:53',NULL),(5034,'2-4',0,105,'nf2UVwi5',8,0,NULL,'2024-05-13 21:37:53',NULL),(5035,'3-1',0,105,'nf2UVwi5',8,0,NULL,'2024-05-13 21:37:53',NULL),(5036,'3-2',0,105,'nf2UVwi5',8,0,NULL,'2024-05-13 21:37:53',NULL),(5037,'3-3',0,105,'nf2UVwi5',8,0,NULL,'2024-05-13 21:37:53',NULL),(5038,'3-4',0,105,'nf2UVwi5',8,0,NULL,'2024-05-13 21:37:53',NULL),(5039,'4-1',0,105,'nf2UVwi5',8,0,NULL,'2024-05-13 21:37:53',NULL),(5040,'4-2',0,105,'nf2UVwi5',8,0,NULL,'2024-05-13 21:37:53',NULL),(5041,'4-3',0,105,'nf2UVwi5',8,0,NULL,'2024-05-13 21:37:53',NULL),(5042,'4-4',0,105,'nf2UVwi5',8,0,NULL,'2024-05-13 21:37:53',NULL),(5043,'1-1',1,106,'vWgqPhpu',10,5,'2024-05-18 15:26:37','2024-05-15 14:26:08','2024-05-18 15:02:48'),(5044,'1-2',2,106,'vWgqPhpu',10,5,'2024-05-18 15:26:37','2024-05-15 14:26:08','2024-05-18 15:02:48'),(5045,'1-3',3,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5046,'1-4',8,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5047,'1-5',6,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5048,'1-6',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5049,'2-1',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5050,'2-2',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5051,'2-3',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5052,'2-4',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5053,'2-5',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5054,'2-6',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5055,'3-1',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5056,'3-2',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5057,'3-3',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5058,'3-4',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5059,'3-5',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5060,'3-6',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5061,'4-1',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5062,'4-2',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5063,'4-3',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5064,'4-4',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5065,'4-5',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5066,'4-6',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5067,'5-1',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5068,'5-2',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5069,'5-3',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5070,'5-4',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5071,'5-5',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5072,'5-6',0,106,'vWgqPhpu',10,0,NULL,'2024-05-15 14:26:08','2024-05-18 15:02:48'),(5073,'1-1',1,107,'SFNuCUe8',8,0,NULL,'2024-05-15 14:26:48','2024-05-15 16:19:18'),(5074,'1-2',2,107,'SFNuCUe8',8,0,NULL,'2024-05-15 14:26:48','2024-05-15 16:19:18'),(5075,'1-3',2,107,'SFNuCUe8',8,0,NULL,'2024-05-15 14:26:48','2024-05-15 16:19:18'),(5076,'1-4',4,107,'SFNuCUe8',8,0,NULL,'2024-05-15 14:26:48','2024-05-15 16:19:18'),(5077,'2-1',0,107,'SFNuCUe8',8,0,NULL,'2024-05-15 14:26:48','2024-05-15 16:19:18'),(5078,'2-2',0,107,'SFNuCUe8',8,0,NULL,'2024-05-15 14:26:48','2024-05-15 16:19:18'),(5079,'2-3',0,107,'SFNuCUe8',8,0,NULL,'2024-05-15 14:26:48','2024-05-15 16:19:18'),(5080,'2-4',0,107,'SFNuCUe8',8,0,NULL,'2024-05-15 14:26:48','2024-05-15 16:19:18'),(5081,'3-1',0,107,'SFNuCUe8',8,0,NULL,'2024-05-15 14:26:48','2024-05-15 16:19:18'),(5082,'3-2',0,107,'SFNuCUe8',8,0,NULL,'2024-05-15 14:26:48','2024-05-15 16:19:18'),(5083,'3-3',0,107,'SFNuCUe8',8,0,NULL,'2024-05-15 14:26:48','2024-05-15 16:19:18'),(5084,'3-4',0,107,'SFNuCUe8',8,0,NULL,'2024-05-15 14:26:48','2024-05-15 16:19:18'),(5085,'4-1',0,107,'SFNuCUe8',8,0,NULL,'2024-05-15 14:26:48','2024-05-15 16:19:18'),(5086,'4-2',0,107,'SFNuCUe8',8,0,NULL,'2024-05-15 14:26:48','2024-05-15 16:19:18'),(5087,'4-3',0,107,'SFNuCUe8',8,0,NULL,'2024-05-15 14:26:48','2024-05-15 16:19:18'),(5088,'4-4',0,107,'SFNuCUe8',8,0,NULL,'2024-05-15 14:26:48','2024-05-15 16:19:18'),(5179,'1-1',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5180,'1-2',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5181,'1-3',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5182,'1-4',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5183,'1-5',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5184,'1-6',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5185,'2-1',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5186,'2-2',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5187,'2-3',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5188,'2-4',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5189,'2-5',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5190,'2-6',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5191,'3-1',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5192,'3-2',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5193,'3-3',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5194,'3-4',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5195,'3-5',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5196,'3-6',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5197,'4-1',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5198,'4-2',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5199,'4-3',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5200,'4-4',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5201,'4-5',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5202,'4-6',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5203,'5-1',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5204,'5-2',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5205,'5-3',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5206,'5-4',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5207,'5-5',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27'),(5208,'5-6',0,111,'K6YYXHLY',10,0,NULL,'2024-05-19 15:28:27','2024-05-19 15:28:27');
/*!40000 ALTER TABLE `tb_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_month_collect`
--

DROP TABLE IF EXISTS `tb_order_month_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_order_month_collect` (
  `id` bigint NOT NULL COMMENT 'id',
  `partner_id` int DEFAULT NULL COMMENT '合作商Id',
  `partner_name` varchar(100) DEFAULT NULL COMMENT '合作商名称',
  `region_id` int DEFAULT NULL COMMENT '区域Id',
  `region_name` varchar(50) DEFAULT NULL COMMENT '地区名称',
  `order_total_money` bigint DEFAULT NULL COMMENT '订单总金额',
  `order_total_count` bigint DEFAULT NULL COMMENT '订单总数',
  `month` int DEFAULT NULL COMMENT '月份',
  `year` int DEFAULT NULL COMMENT '年份',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_order_month_collect_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='按月统计各公司销售情况表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_month_collect`
--

LOCK TABLES `tb_order_month_collect` WRITE;
/*!40000 ALTER TABLE `tb_order_month_collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order_month_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_policy`
--

DROP TABLE IF EXISTS `tb_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_policy` (
  `policy_id` bigint NOT NULL AUTO_INCREMENT COMMENT '策略id',
  `policy_name` varchar(30) DEFAULT NULL COMMENT '策略名称',
  `discount` int DEFAULT NULL COMMENT '策略方案，如：80代表8折',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`policy_id`),
  UNIQUE KEY `tb_policy_policy_name_uindex` (`policy_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='策略表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_policy`
--

LOCK TABLES `tb_policy` WRITE;
/*!40000 ALTER TABLE `tb_policy` DISABLE KEYS */;
INSERT INTO `tb_policy` VALUES (1,'九折优惠',90,'2020-09-14 02:51:05','2021-02-01 08:25:06'),(2,'八折优惠',80,'2020-12-18 06:10:39','2020-12-18 06:10:39'),(5,'冬季折扣',70,'2021-01-11 07:29:32','2024-05-13 14:15:32'),(9,'清爽夏日',50,'2021-02-01 08:23:10','2024-05-13 14:15:51');
/*!40000 ALTER TABLE `tb_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_task_details`
--

DROP TABLE IF EXISTS `tb_task_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_task_details` (
  `details_id` bigint NOT NULL AUTO_INCREMENT,
  `task_id` bigint DEFAULT NULL COMMENT '工单Id',
  `channel_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '货道编号',
  `expect_capacity` int NOT NULL DEFAULT '0' COMMENT '补货期望容量',
  `sku_id` bigint DEFAULT NULL COMMENT '商品Id',
  `sku_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`details_id`),
  KEY `taskdetails_task_TaskId_fk` (`task_id`),
  CONSTRAINT `taskdetails_task_TaskId_fk` FOREIGN KEY (`task_id`) REFERENCES `tb_task` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3770 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='工单详情，只有补货工单才有';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_task_details`
--

LOCK TABLES `tb_task_details` WRITE;
/*!40000 ALTER TABLE `tb_task_details` DISABLE KEYS */;
INSERT INTO `tb_task_details` VALUES (3750,526,'1-1',8,1,'可口可乐','https://likede2-java.itheima.net/image/product1.png'),(3751,526,'1-2',9,1,'可口可乐','https://likede2-java.itheima.net/image/product1.png'),(3752,526,'1-3',1,2,'小康师傅','https://likede2-java.itheima.net/image/product2.png'),(3753,526,'1-5',6,3,'统一奶茶','https://likede2-java.itheima.net/image/product3.png'),(3754,526,'3-1',1,7,'一百橙汁','https://likede2-java.itheima.net/image/product7.png'),(3755,526,'3-6',10,1,'可口可乐','https://likede2-java.itheima.net/image/product1.png'),(3768,542,'1-1',5,1,'可口可乐','https://likede2-java.itheima.net/image/product1.png'),(3769,542,'1-2',5,2,'康师傅','https://likede2-java.itheima.net/image/product2.png');
/*!40000 ALTER TABLE `tb_task_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_job`
--

DROP TABLE IF EXISTS `tb_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_job` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `alert_value` int DEFAULT '0' COMMENT '警戒值百分比',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自动补货任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_job`
--

LOCK TABLES `tb_job` WRITE;
/*!40000 ALTER TABLE `tb_job` DISABLE KEYS */;
INSERT INTO `tb_job` VALUES (1,80);
/*!40000 ALTER TABLE `tb_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_vm_type`
--

DROP TABLE IF EXISTS `tb_vm_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_vm_type` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(15) NOT NULL COMMENT '型号名称',
  `model` varchar(20) DEFAULT NULL COMMENT '型号编码',
  `image` varchar(500) DEFAULT NULL COMMENT '设备图片',
  `vm_row` int NOT NULL DEFAULT '1' COMMENT '货道行',
  `vm_col` int NOT NULL DEFAULT '1' COMMENT '货道列',
  `channel_max_capacity` int DEFAULT '0' COMMENT '设备容量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_vm_type_name_uindex` (`name`),
  UNIQUE KEY `tb_vm_type_model_uindex` (`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='设备类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_vm_type`
--

LOCK TABLES `tb_vm_type` WRITE;
/*!40000 ALTER TABLE `tb_vm_type` DISABLE KEYS */;
INSERT INTO `tb_vm_type` VALUES (1,'饮料机','CZ-10011','https://sy-192-ys.oss-cn-beijing.aliyuncs.com/images/2024/05/15/1715762932971.png',5,6,10),(2,'综合机','CZ-10012','https://sy-192-ys.oss-cn-beijing.aliyuncs.com/images/2024/05/15/1715762984492.png',2,2,10),(3,'零食机','CZ-10013','https://sy-192-ys.oss-cn-beijing.aliyuncs.com/images/2024/05/15/1715763009476.png',2,5,5),(4,'果蔬机','CZ-10014','https://sy-192-ys.oss-cn-beijing.aliyuncs.com/images/2024/05/15/1715763319518.png\n',4,4,8);
/*!40000 ALTER TABLE `tb_vm_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_task`
--

DROP TABLE IF EXISTS `tb_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_task` (
  `task_id` bigint NOT NULL AUTO_INCREMENT COMMENT '工单ID',
  `task_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '工单编号',
  `task_status` int DEFAULT NULL COMMENT '工单状态',
  `create_type` int DEFAULT NULL COMMENT '创建类型 0：自动 1：手动',
  `inner_code` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '售货机编码',
  `user_id` int DEFAULT NULL COMMENT '执行人id',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行人名称',
  `region_id` bigint DEFAULT NULL COMMENT '所属区域Id',
  `desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `product_type_id` int DEFAULT '1' COMMENT '工单类型id',
  `assignor_id` int DEFAULT NULL COMMENT '指派人Id',
  `addr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`task_id`),
  UNIQUE KEY `tb_task_task_code_uindex` (`task_code`),
  KEY `task_productiontype_TypeId_fk` (`product_type_id`),
  KEY `task_taskstatustype_StatusID_fk` (`task_status`),
  KEY `task_tasktype_TypeId_fk` (`create_type`)
) ENGINE=InnoDB AUTO_INCREMENT=544 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='工单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_task`
--

LOCK TABLES `tb_task` WRITE;
/*!40000 ALTER TABLE `tb_task` DISABLE KEYS */;
INSERT INTO `tb_task` VALUES (523,'202303220001',4,1,'RhLWjaeR',8,'许褚',1,'投放',1,1,'河南省-洛阳市-龙门石窟','2023-03-22 07:51:54','2023-03-22 07:57:05'),(524,'202303220002',4,1,'iSzMcQXJ',8,'许褚',1,'投放',1,1,'河南省-洛阳市-龙门石窟','2023-03-22 08:02:26','2023-03-22 08:13:24'),(525,'202303220003',4,1,'iSzMcQXJ',8,'许褚',1,'11',1,1,'河南省-洛阳市-龙门石窟','2023-03-22 09:11:22','2023-03-22 09:12:15'),(526,'202303220004',4,1,'A1000001',6,'曹操',1,'1',2,1,'河南省-洛阳市-龙门石窟','2023-03-22 09:14:45','2023-03-22 09:16:46'),(527,'202303240001',4,1,'A1000001',9,'张辽',1,'111',3,1,'河南省-洛阳市-龙门石窟','2023-03-24 02:41:10','2023-03-24 02:41:10'),(528,'202303240002',4,1,'Ut548Hpf',8,'许褚',1,'111',3,1,'河南省-洛阳市-洛阳白云山','2023-03-24 02:42:50','2023-03-24 02:42:50'),(529,'202303240003',4,1,'aim5xu4I',50,'孙一百',1,'111',3,1,'河南省-洛阳市-洛阳白云山','2023-03-24 02:43:43','2023-03-24 02:43:43'),(530,'202303240004',4,1,'5cy5BdUs',50,'孙一百',1,'111',3,1,'河南省-洛阳市-洛阳白云山','2023-03-24 02:44:26','2023-03-24 02:44:26'),(531,'202303240005',1,0,'A1000001',50,'孙一百',1,'{\"innerCode\":\"A1000001\",\"statusInfo\":[{\"statusCode\":\"1001\",\"status\":true},{\"statusCode\":\"1002\",\"status\":false},{\"statusCode\":\"1003\",\"status\":true}]}',3,0,'河南省-洛阳市-龙门石窟','2023-03-24 10:04:44','2023-03-24 10:04:44'),(533,'202309200001',3,1,'RhLWjaeR',8,'许褚',1,'',1,1,'河南省-洛阳市-龙门石窟','2023-09-20 08:30:53','2024-05-18 08:08:00'),(535,'202405170001',4,1,'vWgqPhpu',8,'许褚',1,'不想干了',1,1,'北京市昌平区建材城西路22号','2024-05-17 06:39:26',NULL),(542,'202405180001',4,1,'vWgqPhpu',6,'曹操',1,'卖完货了',2,1,'北京市昌平区建材城西路22号','2024-05-18 07:13:05',NULL),(543,'202405190001',1,1,'K6YYXHLY',13,'陆逊',3,'',1,1,'北京顺义区国际鲜花港','2024-05-19 10:45:06','2024-05-19 13:13:16');
/*!40000 ALTER TABLE `tb_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sku_class`
--

DROP TABLE IF EXISTS `tb_sku_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_sku_class` (
  `class_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `class_name` varchar(50) DEFAULT '' COMMENT '类别名称',
  `parent_id` int DEFAULT '0' COMMENT '上级id',
  PRIMARY KEY (`class_id`),
  UNIQUE KEY `tb_sku_class_class_name_uindex` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sku_class`
--

LOCK TABLES `tb_sku_class` WRITE;
/*!40000 ALTER TABLE `tb_sku_class` DISABLE KEYS */;
INSERT INTO `tb_sku_class` VALUES (1,'饮料',0),(2,'零食',0),(3,'食品',0),(4,'玩具',0),(14,'化妆品',0);
/*!40000 ALTER TABLE `tb_sku_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order`
--

DROP TABLE IF EXISTS `tb_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_order` (
  `id` bigint NOT NULL COMMENT '主键',
  `order_no` varchar(50) NOT NULL COMMENT '订单编号',
  `third_no` varchar(34) DEFAULT NULL COMMENT '第三方平台单号',
  `inner_code` varchar(15) DEFAULT NULL COMMENT '机器编号',
  `channel_code` varchar(10) DEFAULT NULL COMMENT '货道编号',
  `sku_id` bigint DEFAULT NULL COMMENT 'skuId',
  `sku_name` varchar(20) DEFAULT NULL COMMENT '商品名称',
  `class_id` int DEFAULT NULL COMMENT '商品类别Id',
  `status` int DEFAULT NULL COMMENT '订单状态:0-待支付;1-支付完成;2-出货成功;3-出货失败;4-已取消',
  `amount` int NOT NULL DEFAULT '0' COMMENT '支付金额',
  `price` int NOT NULL DEFAULT '0' COMMENT '商品金额',
  `pay_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '支付类型，1支付宝 2微信',
  `pay_status` int DEFAULT '0' COMMENT '支付状态，0-未支付;1-支付完成;2-退款中;3-退款完成',
  `bill` int DEFAULT '0' COMMENT '合作商账单金额',
  `addr` varchar(200) DEFAULT NULL COMMENT '点位地址',
  `region_id` bigint DEFAULT NULL COMMENT '所属区域Id',
  `region_name` varchar(50) DEFAULT NULL COMMENT '区域名称',
  `business_type` int DEFAULT NULL COMMENT '所属商圈',
  `partner_id` int DEFAULT NULL COMMENT '合作商Id',
  `open_id` varchar(200) DEFAULT NULL COMMENT '跨站身份验证',
  `node_id` bigint DEFAULT NULL COMMENT '点位Id',
  `node_name` varchar(50) DEFAULT NULL COMMENT '点位名称',
  `cancel_desc` varchar(200) DEFAULT '' COMMENT '取消原因',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Order_OrderNo_uindex` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order`
--

LOCK TABLES `tb_order` WRITE;
/*!40000 ALTER TABLE `tb_order` DISABLE KEYS */;
INSERT INTO `tb_order` VALUES (1639542977692344321,'A1000001802891882192300',NULL,'A1000001',NULL,3,'统一奶茶',1,1,1,1,'wxpay',1,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','1','2023-03-25 08:21:22','2023-03-25 08:21:51'),(1639551491689062401,'A1000001804921842908200',NULL,'A1000001',NULL,2,'小康师傅',1,4,1,1,'wxpay',0,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','2','2023-03-25 08:55:12','2023-03-25 09:00:13'),(1639551769091940353,'A1000001804987986430800',NULL,'A1000001',NULL,7,'一百橙汁',1,4,1,1,'wxpay',0,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-03-25 08:56:18','2023-03-25 09:01:19'),(1639570465608884226,'A1000001809445445129300',NULL,'A1000001',NULL,2,'小康师傅',1,4,1,1,'wxpay',0,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-03-25 10:10:35','2023-03-25 10:11:05'),(1640253438704431106,'A1000001972287294582300',NULL,'A1000001',NULL,1,'可口可乐',1,2,1,1,'wxpay',1,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-03-27 07:24:29','2023-03-27 07:24:52'),(1640291223389851650,'A1000001981295877562800',NULL,'A1000001',NULL,1,'可口可乐',1,4,1,1,'wxpay',0,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-03-27 09:54:37','2023-03-27 09:59:39'),(1640291496925581313,'A1000001981361996771600',NULL,'A1000001',NULL,1,'可口可乐',1,4,1,1,'wxpay',0,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-03-27 09:55:43','2023-03-27 10:00:44'),(1640292440643940353,'A1000001981586907029400',NULL,'A1000001',NULL,1,'可口可乐',1,4,1,1,'alipay',0,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-03-27 09:59:28','2023-03-27 10:04:29'),(1640294278558597121,'A1000001982025093546600',NULL,'A1000001',NULL,1,'可口可乐',1,1,1,1,'wxpay',1,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-03-27 10:06:46','2023-03-27 10:06:59'),(1640295466658119682,'A1000001982308461482000',NULL,'A1000001',NULL,1,'可口可乐',1,3,1,1,'wxpay',3,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-03-27 10:11:29','2023-03-27 10:11:56'),(1665192943211196418,'A10000011867384516930600',NULL,'A1000001',NULL,2,'小康师傅',1,1,1,1,'wxpay',1,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-06-04 03:05:10','2023-06-04 03:05:30'),(1665193128339386370,'A10000011867429590093200',NULL,'A1000001',NULL,3,'统一奶茶',1,1,1,1,'alipay',1,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-06-04 03:05:54','2023-06-04 03:06:07'),(1665193628363337730,'A10000011867548883835400',NULL,'A1000001',NULL,1,'可口可乐',1,1,1,1,'wxpay',1,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-06-04 03:07:53','2023-06-04 03:11:41'),(1665197835275415554,'A10000011868551878012500',NULL,'A1000001',NULL,2,'小康师傅',1,1,1,1,'wxpay',1,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'oJ9WJ5MhIS-hiwuUX0GmsHDzqTyQ',1,'龙门石窟','','2023-06-04 03:24:36','2023-06-04 03:24:58'),(1665199941424197633,'A10000011869054027266500',NULL,'A1000001',NULL,2,'小康师傅',1,1,1,1,'wxpay',1,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'oJ9WJ5MhIS-hiwuUX0GmsHDzqTyQ',1,'龙门石窟','','2023-06-04 03:32:59','2023-06-04 03:33:54'),(1665294465416785921,'A10000011891589370978600',NULL,'A1000001',NULL,9,'新星巴克',1,2,1,1,'wxpay',1,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-06-04 09:48:35','2023-06-04 09:51:34'),(1665296000083259393,'A10000011891956192562900',NULL,'A1000001',NULL,9,'新星巴克',1,3,1,1,'wxpay',3,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-06-04 09:54:41','2023-06-04 09:55:42'),(1699412789128679425,'A100000132363273473600',NULL,'A1000001',NULL,3,'统一奶茶',1,0,1,1,'wxpay',0,0,NULL,1,NULL,1,1,'',1,'龙门石窟','','2023-09-06 13:22:37','2023-09-06 13:22:37'),(1699413852900573185,'A100000132616927206000',NULL,'A1000001','1-8',3,'统一奶茶',1,1,1,1,'wxpay',1,0,NULL,1,NULL,1,1,'',1,'龙门石窟','','2023-09-06 13:26:51','2023-09-06 13:27:51'),(1699609497649393665,'A100000179261600800100',NULL,'A1000001','1-3',2,'小康师傅',NULL,1,1,1,'wxpay',1,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-09-07 02:24:16','2023-09-07 02:25:17'),(1699665320891179009,'A100000192570825504800',NULL,'A1000001','1-5',3,'统一奶茶',NULL,0,1,1,'alipay',0,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-09-07 06:06:05','2023-09-07 06:06:05'),(1699666273908350978,'A100000192798155831900',NULL,'A1000001','1-3',2,'小康师傅',NULL,2,1,1,'alipay',1,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-09-07 06:09:53','2023-09-07 06:12:18'),(1699667483335909378,'A100000193086524012200',NULL,'A1000001','1-1',1,'可口可乐',NULL,2,1,1,'alipay',1,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-09-10 06:14:41','2023-09-07 06:15:51'),(1700104081533829121,'A1000001197178608837400',NULL,'A1000001','1-5',3,'统一奶茶',NULL,2,1,1,'wxpay',1,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-09-10 11:09:34','2023-09-08 11:10:36'),(1700104233585737730,'A1000001197215723001700',NULL,'A1000001','1-1',1,'可口可乐',NULL,2,1,1,'wxpay',1,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-09-10 11:10:10','2023-09-08 11:11:11'),(1702608867975180289,'A1000001794398419433700',NULL,'A1000001','2-2',6,'怡宝至尊',NULL,2,3,1,'wxpay',0,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-09-15 09:02:42','2023-09-15 09:02:42'),(1702614203809349633,'A1000001795671154933400',NULL,'A1000001','1-3',2,'小康师傅',NULL,0,1,1,'alipay',0,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-09-15 09:23:54','2023-09-15 09:23:54'),(1702615729550376962,'A1000001796034964829100',NULL,'A1000001','2-3',8,'魔力花茶',NULL,4,1,1,'alipay',0,0,'河南省-洛阳市-龙门石窟',1,NULL,1,1,'',1,'龙门石窟','','2023-09-15 09:29:58','2023-09-15 09:30:58');
/*!40000 ALTER TABLE `tb_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role`
--

DROP TABLE IF EXISTS `tb_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_code` varchar(50) DEFAULT NULL COMMENT '角色编码\n',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称\n',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `tb_role_role_code_uindex` (`role_code`),
  UNIQUE KEY `tb_role_role_name_uindex` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工单角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role`
--

LOCK TABLES `tb_role` WRITE;
/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;
INSERT INTO `tb_role` VALUES (1,'1001','工单管理员'),(2,'1002','运营员'),(3,'1003','维修员');
/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_task_type`
--

DROP TABLE IF EXISTS `tb_task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_task_type` (
  `type_id` int NOT NULL,
  `type_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型名称',
  `type` int DEFAULT '1' COMMENT '工单类型。1:维修工单;2:运营工单',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='工单类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_task_type`
--

LOCK TABLES `tb_task_type` WRITE;
/*!40000 ALTER TABLE `tb_task_type` DISABLE KEYS */;
INSERT INTO `tb_task_type` VALUES (1,'投放工单',1),(2,'补货工单',2),(3,'维修工单',1),(4,'撤机工单',1);
/*!40000 ALTER TABLE `tb_task_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_emp`
--

DROP TABLE IF EXISTS `tb_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_emp` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(50) NOT NULL COMMENT '员工名称',
  `region_id` int DEFAULT NULL COMMENT '所属区域Id',
  `region_name` varchar(50) DEFAULT NULL COMMENT '区域名称',
  `role_id` int DEFAULT NULL COMMENT '角色id',
  `role_code` varchar(10) DEFAULT NULL COMMENT '角色编号',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `mobile` varchar(15) DEFAULT NULL COMMENT '联系电话',
  `image` varchar(500) DEFAULT NULL COMMENT '员工头像',
  `status` tinyint DEFAULT '1' COMMENT '是否启用',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_user_Id_uindex` (`id`),
  UNIQUE KEY `tb_user_user_name_uindex` (`user_name`),
  UNIQUE KEY `tb_user_mobile_uindex` (`mobile`),
  KEY `role_id` (`role_id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `tb_emp_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`role_id`),
  CONSTRAINT `tb_emp_ibfk_2` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工单员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_emp`
--

LOCK TABLES `tb_emp` WRITE;
/*!40000 ALTER TABLE `tb_emp` DISABLE KEYS */;
INSERT INTO `tb_emp` VALUES (2,'刘备',2,'北京市海淀区',2,'1002','运营员','13800000001','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:04'),(3,'关羽',2,'北京市海淀区',2,'1002','运营员','13800000002','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:06'),(4,'张飞',2,'北京市海淀区',3,'1003','维修员','13800000003','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:08'),(5,'赵云',2,'北京市海淀区',3,'1003','维修员','13800000004','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:10'),(6,'曹操',1,'北京市朝阳区',2,'1002','运营员','13900139001','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:11'),(7,'夏侯惇',1,'北京市朝阳区',2,'1002','运营员','13900000002','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:13'),(8,'许褚',1,'北京市朝阳区',3,'1003','维修员','13900139003','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:15'),(9,'张辽',1,'北京市朝阳区',3,'1003','维修员','13900000004','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:17'),(10,'孙权',3,'北京市西城区',2,'1002','运营员','13700000001','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:19'),(11,'周瑜',3,'北京市西城区',2,'1002','运营员','13700000002','http://likede2-java.itheima.net/image/avatar.png',0,'2024-06-10 07:06:58','2024-06-10 08:11:21'),(12,'吕蒙',3,'北京市西城区',3,'1003','维修员','13700000003','http://likede2-java.itheima.net/image/avatar.png',0,'2024-06-10 07:06:58','2024-06-10 08:11:24'),(13,'陆逊',3,'北京市西城区',3,'1003','维修员','13700000005','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:26'),(50,'孙一百',1,'北京市朝阳区',3,'1003','维修员','13700137009','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:28'),(51,'马超',2,'北京市海淀区',3,'1003','维修员','13900002222','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:30'),(52,'黄忠',2,'北京市海淀区',2,'1002','运营员','13900005555','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:31'),(53,'测试员工',1,'北京市朝阳区',1,'1001','工单管理员','15100000001','/profile/upload/2024/05/18/4e7f3a15429bfda99bce42a18cdd1jpeg_20240518103539A002.jpeg',1,'2024-06-10 07:06:58','2024-06-10 08:11:33');
/*!40000 ALTER TABLE `tb_emp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-11 20:41:57
