-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dkd
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
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (1,'tb_node','点位表',NULL,NULL,'Node','crud','element-plus','com.dkd.manage','manage','node','点位管理','itheima','0','/','{\"parentMenuId\":2000}','admin','2024-06-05 11:11:35','','2024-06-05 11:32:17',NULL),(2,'tb_partner','合作商表',NULL,NULL,'Partner','crud','element-plus','com.dkd.manage','manage','partner','合作商管理','itheima','0','/','{\"parentMenuId\":2000}','admin','2024-06-05 11:11:35','','2024-06-05 11:22:11',NULL),(3,'tb_region','区域表',NULL,NULL,'Region','crud','element-plus','com.dkd.manage','manage','region','区域管理','itheima','0','/','{\"parentMenuId\":2000}','admin','2024-06-05 11:11:35','','2024-06-05 11:17:53',NULL),(4,'tb_emp','工单员工表',NULL,NULL,'Emp','crud','element-plus','com.dkd.manage','manage','emp','人员列表','itheima','0','/','{\"parentMenuId\":2019}','admin','2024-06-15 10:21:43','','2024-06-15 10:31:17',NULL),(5,'tb_role','工单角色表',NULL,NULL,'Role','crud','element-plus','com.dkd.manage','manage','role','工单角色','itheima','0','/','{\"parentMenuId\":2019}','admin','2024-06-15 10:21:50','','2024-06-15 10:32:52',NULL),(6,'tb_vending_machine','设备表',NULL,NULL,'VendingMachine','crud','element-plus','com.dkd.manage','manage','vm','设备管理','itheima','0','/','{\"parentMenuId\":2026}','admin','2024-06-21 10:36:16','','2024-06-21 11:00:39',NULL),(7,'tb_vm_type','设备类型表',NULL,NULL,'VmType','crud','element-plus','com.dkd.manage','manage','vmType','设备类型管理','itheima','0','/','{\"parentMenuId\":2026}','admin','2024-06-21 10:36:16','','2024-06-21 10:45:07',NULL),(8,'tb_channel','售货机货道表',NULL,NULL,'Channel','crud','element-plus','com.dkd.manage','manage','channel','售货机货道','itheima','0','/','{\"parentMenuId\":2026}','admin','2024-06-21 10:37:22','','2024-06-21 11:03:08',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (1,1,'id','主键id','int','Long','id','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-06-05 11:11:35','','2024-06-05 11:32:17'),(2,1,'node_name','点位名称','varchar(255)','String','nodeName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-06-05 11:11:35','','2024-06-05 11:32:17'),(3,1,'address','详细地址','varchar(255)','String','address','0','0','1','1','1','1','0','EQ','textarea','',3,'admin','2024-06-05 11:11:35','','2024-06-05 11:32:17'),(4,1,'business_type','商圈类型','int','Long','businessType','0','0','1','1','1','1','0','EQ','select','business_type',4,'admin','2024-06-05 11:11:35','','2024-06-05 11:32:17'),(5,1,'region_id','区域ID','int','Long','regionId','0','0','1','1','1','1','1','EQ','input','',5,'admin','2024-06-05 11:11:35','','2024-06-05 11:32:17'),(6,1,'partner_id','合作商ID','int','Long','partnerId','0','0','1','1','1','1','1','EQ','input','',6,'admin','2024-06-05 11:11:35','','2024-06-05 11:32:17'),(7,1,'create_time','创建时间','timestamp','Date','createTime','0','0','0','0',NULL,NULL,NULL,'EQ','datetime','',7,'admin','2024-06-05 11:11:35','','2024-06-05 11:32:17'),(8,1,'update_time','修改时间','timestamp','Date','updateTime','0','0','0','0','0',NULL,NULL,'EQ','datetime','',8,'admin','2024-06-05 11:11:35','','2024-06-05 11:32:17'),(9,1,'create_by','创建人','varchar(64)','String','createBy','0','0','0','0',NULL,NULL,NULL,'EQ','input','',9,'admin','2024-06-05 11:11:35','','2024-06-05 11:32:17'),(10,1,'update_by','修改人','varchar(64)','String','updateBy','0','0','0','0','0',NULL,NULL,'EQ','input','',10,'admin','2024-06-05 11:11:35','','2024-06-05 11:32:17'),(11,1,'remark','备注','text','String','remark','0','0','0','0','0','0',NULL,'EQ','textarea','',11,'admin','2024-06-05 11:11:35','','2024-06-05 11:32:17'),(12,2,'id','主键id','int','Long','id','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-06-05 11:11:35','','2024-06-05 11:22:11'),(13,2,'partner_name','合作商名称','varchar(255)','String','partnerName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-06-05 11:11:35','','2024-06-05 11:22:11'),(14,2,'contact_person','联系人','varchar(64)','String','contactPerson','0','0','1','1','1','1','0','EQ','input','',3,'admin','2024-06-05 11:11:35','','2024-06-05 11:22:11'),(15,2,'contact_phone','联系电话','varchar(15)','String','contactPhone','0','0','1','1','1','1','0','EQ','input','',4,'admin','2024-06-05 11:11:35','','2024-06-05 11:22:11'),(16,2,'profit_ratio','分成比例','int','Long','profitRatio','0','0','1','1','1','1','0','EQ','input','',5,'admin','2024-06-05 11:11:35','','2024-06-05 11:22:11'),(17,2,'account','账号','varchar(64)','String','account','0','0','1','1','1','1','0','EQ','input','',6,'admin','2024-06-05 11:11:35','','2024-06-05 11:22:11'),(18,2,'password','密码','varchar(64)','String','password','0','0','1','1','1','0','0','EQ','input','',7,'admin','2024-06-05 11:11:35','','2024-06-05 11:22:11'),(19,2,'create_time','创建时间','timestamp','Date','createTime','0','0','0','0',NULL,NULL,NULL,'EQ','datetime','',8,'admin','2024-06-05 11:11:35','','2024-06-05 11:22:11'),(20,2,'update_time','修改时间','timestamp','Date','updateTime','0','0','0','0','0',NULL,NULL,'EQ','datetime','',9,'admin','2024-06-05 11:11:35','','2024-06-05 11:22:11'),(21,2,'create_by','创建人','varchar(64)','String','createBy','0','0','0','0',NULL,NULL,NULL,'EQ','input','',10,'admin','2024-06-05 11:11:35','','2024-06-05 11:22:11'),(22,2,'update_by','修改人','varchar(64)','String','updateBy','0','0','0','0','0',NULL,NULL,'EQ','input','',11,'admin','2024-06-05 11:11:35','','2024-06-05 11:22:11'),(23,2,'remark','备注','text','String','remark','0','0','0','0','0','0',NULL,'EQ','textarea','',12,'admin','2024-06-05 11:11:35','','2024-06-05 11:22:11'),(24,3,'id','主键id','int','Long','id','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-06-05 11:11:35','','2024-06-05 11:17:53'),(25,3,'region_name','区域名称','varchar(255)','String','regionName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-06-05 11:11:35','','2024-06-05 11:17:53'),(26,3,'create_time','创建时间','timestamp','Date','createTime','0','0','0','0',NULL,NULL,NULL,'EQ','datetime','',3,'admin','2024-06-05 11:11:35','','2024-06-05 11:17:53'),(27,3,'update_time','修改时间','timestamp','Date','updateTime','0','0','0','0','0',NULL,NULL,'EQ','datetime','',4,'admin','2024-06-05 11:11:35','','2024-06-05 11:17:53'),(28,3,'create_by','创建人','varchar(64)','String','createBy','0','0','0','0',NULL,NULL,NULL,'EQ','input','',5,'admin','2024-06-05 11:11:35','','2024-06-05 11:17:53'),(29,3,'update_by','修改人','varchar(64)','String','updateBy','0','0','0','0','0',NULL,NULL,'EQ','input','',6,'admin','2024-06-05 11:11:35','','2024-06-05 11:17:53'),(30,3,'remark','备注说明','text','String','remark','0','0','1','1','1','1',NULL,'EQ','textarea','',7,'admin','2024-06-05 11:11:35','','2024-06-05 11:17:53'),(31,4,'id','主键','int','Long','id','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-06-15 10:21:43','','2024-06-15 10:31:17'),(32,4,'user_name','人员名称','varchar(50)','String','userName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-06-15 10:21:43','','2024-06-15 10:31:17'),(33,4,'region_id','所属区域Id','int','Long','regionId','0','0','1','1','1','0','1','EQ','input','',3,'admin','2024-06-15 10:21:43','','2024-06-15 10:31:17'),(34,4,'region_name','归属区域','varchar(50)','String','regionName','0','0','0','0','0','1','0','LIKE','input','',4,'admin','2024-06-15 10:21:43','','2024-06-15 10:31:17'),(35,4,'role_id','角色id','int','Long','roleId','0','0','1','1','1','0','1','EQ','input','',5,'admin','2024-06-15 10:21:43','','2024-06-15 10:31:17'),(36,4,'role_code','角色编号','varchar(10)','String','roleCode','0','0','0','0','0','0','1','EQ','input','',6,'admin','2024-06-15 10:21:43','','2024-06-15 10:31:17'),(37,4,'role_name','角色名称','varchar(50)','String','roleName','0','0','0','0','0','1','0','LIKE','input','',7,'admin','2024-06-15 10:21:43','','2024-06-15 10:31:17'),(38,4,'mobile','联系电话','varchar(15)','String','mobile','0','0','1','1','1','1','0','EQ','input','',8,'admin','2024-06-15 10:21:43','','2024-06-15 10:31:17'),(39,4,'image','员工头像','varchar(500)','String','image','0','0','1','1','1','0','0','EQ','imageUpload','',9,'admin','2024-06-15 10:21:43','','2024-06-15 10:31:17'),(40,4,'status','是否启用','tinyint','Long','status','0','0','1','1','1','0','1','EQ','radio','emp_status',10,'admin','2024-06-15 10:21:43','','2024-06-15 10:31:17'),(41,4,'create_time','创建时间','timestamp','Date','createTime','0','0','0','0',NULL,NULL,NULL,'EQ','datetime','',11,'admin','2024-06-15 10:21:43','','2024-06-15 10:31:17'),(42,4,'update_time','修改时间','timestamp','Date','updateTime','0','0','0','0','0',NULL,NULL,'EQ','datetime','',12,'admin','2024-06-15 10:21:43','','2024-06-15 10:31:17'),(43,5,'role_id',NULL,'int','Long','roleId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-06-15 10:21:50','','2024-06-15 10:32:52'),(44,5,'role_code','角色编码\n','varchar(50)','String','roleCode','0','0','0','1','1','1','1','EQ','input','',2,'admin','2024-06-15 10:21:50','','2024-06-15 10:32:52'),(45,5,'role_name','角色名称\n','varchar(50)','String','roleName','0','0','0','1','1','1','1','LIKE','input','',3,'admin','2024-06-15 10:21:50','','2024-06-15 10:32:52'),(46,6,'id','主键','bigint','Long','id','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-06-21 10:36:16','','2024-06-21 11:00:39'),(47,6,'inner_code','设备编号','varchar(15)','String','innerCode','0','0','0','1','1','1','1','EQ','input','',2,'admin','2024-06-21 10:36:16','','2024-06-21 11:00:39'),(48,6,'channel_max_capacity','设备容量','int','Long','channelMaxCapacity','0','0','0','0','0','0','0','EQ','input','',3,'admin','2024-06-21 10:36:16','','2024-06-21 11:00:39'),(49,6,'node_id','点位Id','int','Long','nodeId','0','0','1','1','1','0','1','EQ','input','',4,'admin','2024-06-21 10:36:16','','2024-06-21 11:00:39'),(50,6,'addr','详细地址','varchar(100)','String','addr','0','0','0','0','0','1','0','EQ','input','',5,'admin','2024-06-21 10:36:16','','2024-06-21 11:00:39'),(51,6,'last_supply_time','上次补货时间','datetime','Date','lastSupplyTime','0','0','0','0','0','0','0','EQ','datetime','',6,'admin','2024-06-21 10:36:16','','2024-06-21 11:00:39'),(52,6,'business_type','商圈类型','int','Long','businessType','0','0','0','0','0','0','1','EQ','select','',7,'admin','2024-06-21 10:36:16','','2024-06-21 11:00:39'),(53,6,'region_id','区域Id','int','Long','regionId','0','0','0','0','0','0','1','EQ','input','',8,'admin','2024-06-21 10:36:16','','2024-06-21 11:00:39'),(54,6,'partner_id','合作商Id','int','Long','partnerId','0','0','0','0','0','1','1','EQ','input','',9,'admin','2024-06-21 10:36:16','','2024-06-21 11:00:39'),(55,6,'vm_type_id','设备型号','int','Long','vmTypeId','0','0','1','1','1','1','1','EQ','input','',10,'admin','2024-06-21 10:36:16','','2024-06-21 11:00:39'),(56,6,'vm_status','设备状态，0:未投放;1-运营;3-撤机','int','Long','vmStatus','0','0','0','0','0','1','1','EQ','select','vm_status',11,'admin','2024-06-21 10:36:16','','2024-06-21 11:00:39'),(57,6,'running_status','运行状态','varchar(100)','String','runningStatus','0','0','0','0','0','0','1','EQ','radio','',12,'admin','2024-06-21 10:36:16','','2024-06-21 11:00:39'),(58,6,'longitudes','经度','double','Long','longitudes','0','0','0','0','0','0','0','EQ','input','',13,'admin','2024-06-21 10:36:16','','2024-06-21 11:00:39'),(59,6,'latitude','维度','double','Long','latitude','0','0','0','0','0','0','0','EQ','input','',14,'admin','2024-06-21 10:36:16','','2024-06-21 11:00:39'),(60,6,'client_id','客户端连接Id,做emq认证用','varchar(50)','String','clientId','0','0','0','0','0','0','0','EQ','input','',15,'admin','2024-06-21 10:36:16','','2024-06-21 11:00:39'),(61,6,'policy_id','策略id','bigint','Long','policyId','0','0','0','0','0','0','1','EQ','input','',16,'admin','2024-06-21 10:36:16','','2024-06-21 11:00:39'),(62,6,'create_time','创建时间','timestamp','Date','createTime','0','0','0','0',NULL,NULL,NULL,'EQ','datetime','',17,'admin','2024-06-21 10:36:16','','2024-06-21 11:00:39'),(63,6,'update_time','修改时间','timestamp','Date','updateTime','0','0','0','0','0',NULL,NULL,'EQ','datetime','',18,'admin','2024-06-21 10:36:16','','2024-06-21 11:00:39'),(64,7,'id','主键','int','Long','id','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-06-21 10:36:16','','2024-06-21 10:45:07'),(65,7,'name','型号名称','varchar(15)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-06-21 10:36:16','','2024-06-21 10:45:07'),(66,7,'model','型号编码','varchar(20)','String','model','0','0','1','1','1','1','1','EQ','input','',3,'admin','2024-06-21 10:36:16','','2024-06-21 10:45:07'),(67,7,'image','设备图片','varchar(500)','String','image','0','0','1','1','1','1','0','EQ','imageUpload','',4,'admin','2024-06-21 10:36:16','','2024-06-21 10:45:07'),(68,7,'vm_row','货道行','int','Long','vmRow','0','0','1','1','1','1','0','EQ','input','',5,'admin','2024-06-21 10:36:16','','2024-06-21 10:45:07'),(69,7,'vm_col','货道列','int','Long','vmCol','0','0','1','1','1','1','0','EQ','input','',6,'admin','2024-06-21 10:36:16','','2024-06-21 10:45:07'),(70,7,'channel_max_capacity','设备容量','int','Long','channelMaxCapacity','0','0','1','1','1','1','0','EQ','input','',7,'admin','2024-06-21 10:36:16','','2024-06-21 10:45:07'),(71,8,'id','主键','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-06-21 10:37:22','','2024-06-21 11:03:08'),(72,8,'channel_code','货道编号','varchar(10)','String','channelCode','0','0','1','1','1','1','1','EQ','input','',2,'admin','2024-06-21 10:37:22','','2024-06-21 11:03:08'),(73,8,'sku_id','商品Id','bigint','Long','skuId','0','0','0','1','1','1','1','EQ','input','',3,'admin','2024-06-21 10:37:22','','2024-06-21 11:03:08'),(74,8,'vm_id','售货机Id','bigint','Long','vmId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2024-06-21 10:37:22','','2024-06-21 11:03:08'),(75,8,'inner_code','售货机软编号','varchar(15)','String','innerCode','0','0','1','1','1','1','1','EQ','input','',5,'admin','2024-06-21 10:37:22','','2024-06-21 11:03:08'),(76,8,'max_capacity','货道最大容量','int','Long','maxCapacity','0','0','1','1','1','1','1','EQ','input','',6,'admin','2024-06-21 10:37:22','','2024-06-21 11:03:08'),(77,8,'current_capacity','货道当前容量','int','Long','currentCapacity','0','0','0','1','1','1','1','EQ','input','',7,'admin','2024-06-21 10:37:22','','2024-06-21 11:03:08'),(78,8,'last_supply_time','上次补货时间','datetime','Date','lastSupplyTime','0','0','0','1','1','1','1','EQ','datetime','',8,'admin','2024-06-21 10:37:22','','2024-06-21 11:03:08'),(79,8,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2024-06-21 10:37:22','','2024-06-21 11:03:08'),(80,8,'update_time','修改时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',10,'admin','2024-06-21 10:37:22','','2024-06-21 11:03:08');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-06-04 10:47:07','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-06-04 10:47:07','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-06-04 10:47:07','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2024-06-04 10:47:07','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-06-04 10:47:07','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-06-04 10:47:07','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-04 10:47:07','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-04 10:47:07','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-04 10:47:07','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-04 10:47:07','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-04 10:47:07','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-04 10:47:07','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-04 10:47:07','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-04 10:47:07','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-04 10:47:07','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-06-04 10:47:07','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-06-04 10:47:07','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-06-04 10:47:07','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-06-04 10:47:07','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-06-04 10:47:07','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-06-04 10:47:07','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-06-04 10:47:07','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-06-04 10:47:07','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-06-04 10:47:07','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-06-04 10:47:07','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-06-04 10:47:07','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-06-04 10:47:07','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-06-04 10:47:07','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-06-04 10:47:07','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-06-04 10:47:07','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-06-04 10:47:07','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-06-04 10:47:07','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-06-04 10:47:07','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-06-04 10:47:07','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-06-04 10:47:07','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-06-04 10:47:07','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-06-04 10:47:07','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-06-04 10:47:07','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-06-04 10:47:07','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-06-04 10:47:07','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-06-04 10:47:07','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-06-04 10:47:07','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-06-04 10:47:07','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-06-04 10:47:07','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-06-04 10:47:07','',NULL,'停用状态'),(100,1,'旅游区','1','business_type',NULL,'default','N','0','admin','2024-06-05 11:10:28','',NULL,NULL),(101,2,'商场写字楼','2','business_type',NULL,'default','N','0','admin','2024-06-05 11:10:37','',NULL,NULL),(102,3,'学校','3','business_type',NULL,'default','N','0','admin','2024-06-05 11:10:43','',NULL,NULL),(103,4,'交通枢纽','4','business_type',NULL,'default','N','0','admin','2024-06-05 11:11:12','',NULL,NULL),(104,1,'启用','1','emp_status',NULL,'default','N','0','admin','2024-06-15 10:19:43','',NULL,NULL),(105,2,'停用','0','emp_status',NULL,'default','N','0','admin','2024-06-15 10:20:02','',NULL,NULL),(108,1,'未投放','0','vm_status',NULL,'default','N','0','admin','2024-06-21 10:34:55','',NULL,NULL),(109,2,'运营','1','vm_status',NULL,'default','N','0','admin','2024-06-21 10:35:08','',NULL,NULL),(110,3,'撤机','3','vm_status',NULL,'default','N','0','admin','2024-06-21 10:35:17','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-06-04 10:47:07','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-06-04 10:47:07','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-06-04 10:47:07','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-06-04 10:47:07','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-06-04 10:47:07','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-06-04 10:47:07','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-06-04 10:47:07','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-06-04 10:47:07','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-06-04 10:47:07','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-06-04 10:47:07','',NULL,'登录状态列表'),(100,'商圈类型','business_type','0','admin','2024-06-05 11:09:45','',NULL,'商圈类型'),(101,'员工状态','emp_status','0','admin','2024-06-15 10:19:12','',NULL,'员工状态'),(102,'设备状态','vm_status','0','admin','2024-06-21 10:33:56','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-06-04 10:47:07','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-06-04 10:47:07','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-06-04 10:47:07','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-06-04 11:01:04'),(101,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-04 11:01:52'),(102,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-04 12:54:51'),(103,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-05 10:57:01'),(104,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-05 21:18:37'),(105,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-06 09:21:08'),(106,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-06 20:29:24'),(107,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-07 09:19:42'),(108,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-07 09:19:46'),(109,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-07 15:53:53'),(110,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-11 10:42:55'),(111,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-11 15:44:35'),(112,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-12 09:40:00'),(113,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-12 14:45:58'),(114,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-12 20:42:56'),(115,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-13 09:03:25'),(116,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-13 14:38:04'),(117,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-14 17:07:44'),(118,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-17 10:17:48'),(119,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-17 15:48:14'),(120,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-18 12:48:23'),(121,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-18 21:09:14'),(122,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 10:10:08'),(123,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-19 15:33:12');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2039 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,11,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-06-04 10:47:07','',NULL,'系统管理目录'),(2,'系统监控',0,12,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2024-06-04 10:47:07','',NULL,'系统监控目录'),(3,'系统工具',0,13,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2024-06-04 10:47:07','',NULL,'系统工具目录'),(4,'若依官网',0,14,'http://ruoyi.vip',NULL,'',0,0,'M','0','0','','guide','admin','2024-06-04 10:47:07','',NULL,'若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2024-06-04 10:47:07','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2024-06-04 10:47:07','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-06-04 10:47:07','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2024-06-04 10:47:07','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2024-06-04 10:47:07','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2024-06-04 10:47:07','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2024-06-04 10:47:07','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2024-06-04 10:47:07','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2024-06-04 10:47:07','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2024-06-04 10:47:07','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2024-06-04 10:47:07','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-06-04 10:47:07','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2024-06-04 10:47:07','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-06-04 10:47:07','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-06-04 10:47:07','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2024-06-04 10:47:07','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2024-06-04 10:47:07','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-06-04 10:47:07','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-06-04 10:47:07','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-06-04 10:47:07','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2024-06-04 10:47:07','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2024-06-04 10:47:07','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2024-06-04 10:47:07','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2024-06-04 10:47:07','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2024-06-04 10:47:07','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2024-06-04 10:47:07','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-06-04 10:47:07','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2024-06-04 10:47:07','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2024-06-04 10:47:07','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2024-06-04 10:47:07','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2024-06-04 10:47:07','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2024-06-04 10:47:07','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2024-06-04 10:47:07','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2024-06-04 10:47:07','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-06-04 10:47:07','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-06-04 10:47:07','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2024-06-04 10:47:07','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2024-06-04 10:47:07','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-06-04 10:47:07','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-06-04 10:47:07','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2024-06-04 10:47:07','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2024-06-04 10:47:07','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2024-06-04 10:47:07','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2024-06-04 10:47:07','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2024-06-04 10:47:07','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2024-06-04 10:47:07','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2024-06-04 10:47:07','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-06-04 10:47:07','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-06-04 10:47:07','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2024-06-04 10:47:07','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2024-06-04 10:47:07','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2024-06-04 10:47:07','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2024-06-04 10:47:07','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2024-06-04 10:47:07','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2024-06-04 10:47:07','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2024-06-04 10:47:07','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2024-06-04 10:47:07','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-06-04 10:47:07','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-06-04 10:47:07','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-06-04 10:47:07','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-06-04 10:47:07','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-06-04 10:47:07','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-06-04 10:47:07','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-06-04 10:47:07','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-06-04 10:47:07','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-06-04 10:47:07','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-06-04 10:47:07','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-06-04 10:47:07','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-06-04 10:47:07','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-06-04 10:47:07','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-06-04 10:47:07','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-06-04 10:47:07','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-06-04 10:47:07','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-06-04 10:47:07','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-06-04 10:47:07','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-06-04 10:47:07','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-06-04 10:47:07','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-06-04 10:47:07','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-06-04 10:47:07','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-06-04 10:47:07','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-06-04 10:47:07','',NULL,''),(2000,'点位管理',0,2,'node',NULL,NULL,1,0,'M','0','0',NULL,'点位管理','admin','2024-06-05 11:09:08','',NULL,''),(2001,'点位管理',2000,2,'node','manage/node/index',NULL,1,0,'C','0','0','manage:node:list','#','admin','2024-06-05 11:38:09','admin','2024-06-05 11:39:54','点位管理菜单'),(2002,'点位管理查询',2001,1,'#','',NULL,1,0,'F','0','0','manage:node:query','#','admin','2024-06-05 11:38:09','',NULL,''),(2003,'点位管理新增',2001,2,'#','',NULL,1,0,'F','0','0','manage:node:add','#','admin','2024-06-05 11:38:09','',NULL,''),(2004,'点位管理修改',2001,3,'#','',NULL,1,0,'F','0','0','manage:node:edit','#','admin','2024-06-05 11:38:09','',NULL,''),(2005,'点位管理删除',2001,4,'#','',NULL,1,0,'F','0','0','manage:node:remove','#','admin','2024-06-05 11:38:09','',NULL,''),(2006,'点位管理导出',2001,5,'#','',NULL,1,0,'F','0','0','manage:node:export','#','admin','2024-06-05 11:38:09','',NULL,''),(2007,'合作商管理',2000,3,'partner','manage/partner/index',NULL,1,0,'C','0','0','manage:partner:list','#','admin','2024-06-05 11:38:09','admin','2024-06-05 11:39:58','合作商管理菜单'),(2008,'合作商管理查询',2007,1,'#','',NULL,1,0,'F','0','0','manage:partner:query','#','admin','2024-06-05 11:38:09','',NULL,''),(2009,'合作商管理新增',2007,2,'#','',NULL,1,0,'F','0','0','manage:partner:add','#','admin','2024-06-05 11:38:09','',NULL,''),(2010,'合作商管理修改',2007,3,'#','',NULL,1,0,'F','0','0','manage:partner:edit','#','admin','2024-06-05 11:38:09','',NULL,''),(2011,'合作商管理删除',2007,4,'#','',NULL,1,0,'F','0','0','manage:partner:remove','#','admin','2024-06-05 11:38:09','',NULL,''),(2012,'合作商管理导出',2007,5,'#','',NULL,1,0,'F','0','0','manage:partner:export','#','admin','2024-06-05 11:38:09','',NULL,''),(2013,'区域管理',2000,1,'region','manage/region/index',NULL,1,0,'C','0','0','manage:region:list','#','admin','2024-06-05 11:38:09','admin','2024-06-05 11:39:32','区域管理菜单'),(2014,'区域管理查询',2013,1,'#','',NULL,1,0,'F','0','0','manage:region:query','#','admin','2024-06-05 11:38:09','',NULL,''),(2015,'区域管理新增',2013,2,'#','',NULL,1,0,'F','0','0','manage:region:add','#','admin','2024-06-05 11:38:09','',NULL,''),(2016,'区域管理修改',2013,3,'#','',NULL,1,0,'F','0','0','manage:region:edit','#','admin','2024-06-05 11:38:09','',NULL,''),(2017,'区域管理删除',2013,4,'#','',NULL,1,0,'F','0','0','manage:region:remove','#','admin','2024-06-05 11:38:09','',NULL,''),(2018,'区域管理导出',2013,5,'#','',NULL,1,0,'F','0','0','manage:region:export','#','admin','2024-06-05 11:38:09','',NULL,''),(2019,'人员管理',0,4,'emp',NULL,NULL,1,0,'M','0','0',NULL,'peoples','admin','2024-06-15 10:18:33','',NULL,''),(2020,'人员列表',2019,1,'emp','manage/emp/index',NULL,1,0,'C','0','0','manage:emp:list','#','admin','2024-06-15 10:34:27','',NULL,'人员列表菜单'),(2021,'人员列表查询',2020,1,'#','',NULL,1,0,'F','0','0','manage:emp:query','#','admin','2024-06-15 10:34:27','',NULL,''),(2022,'人员列表新增',2020,2,'#','',NULL,1,0,'F','0','0','manage:emp:add','#','admin','2024-06-15 10:34:27','',NULL,''),(2023,'人员列表修改',2020,3,'#','',NULL,1,0,'F','0','0','manage:emp:edit','#','admin','2024-06-15 10:34:27','',NULL,''),(2024,'人员列表删除',2020,4,'#','',NULL,1,0,'F','0','0','manage:emp:remove','#','admin','2024-06-15 10:34:27','',NULL,''),(2025,'人员列表导出',2020,5,'#','',NULL,1,0,'F','0','0','manage:emp:export','#','admin','2024-06-15 10:34:27','',NULL,''),(2026,'设备管理',0,3,'vm',NULL,NULL,1,0,'M','0','0',NULL,'设备管理','admin','2024-06-21 10:33:11','',NULL,''),(2027,'设备管理',2026,1,'vm','manage/vm/index',NULL,1,0,'C','0','0','manage:vm:list','#','admin','2024-06-21 11:10:53','',NULL,'设备管理菜单'),(2028,'设备管理查询',2027,1,'#','',NULL,1,0,'F','0','0','manage:vm:query','#','admin','2024-06-21 11:10:53','',NULL,''),(2029,'设备管理新增',2027,2,'#','',NULL,1,0,'F','0','0','manage:vm:add','#','admin','2024-06-21 11:10:53','',NULL,''),(2030,'设备管理修改',2027,3,'#','',NULL,1,0,'F','0','0','manage:vm:edit','#','admin','2024-06-21 11:10:53','',NULL,''),(2031,'设备管理删除',2027,4,'#','',NULL,1,0,'F','0','0','manage:vm:remove','#','admin','2024-06-21 11:10:53','',NULL,''),(2032,'设备管理导出',2027,5,'#','',NULL,1,0,'F','0','0','manage:vm:export','#','admin','2024-06-21 11:10:53','',NULL,''),(2033,'设备类型管理',2026,3,'vmType','manage/vmType/index',NULL,1,0,'C','0','0','manage:vmType:list','#','admin','2024-06-21 11:10:53','admin','2024-06-21 11:13:04','设备类型管理菜单'),(2034,'设备类型管理查询',2033,1,'#','',NULL,1,0,'F','0','0','manage:vmType:query','#','admin','2024-06-21 11:10:53','',NULL,''),(2035,'设备类型管理新增',2033,2,'#','',NULL,1,0,'F','0','0','manage:vmType:add','#','admin','2024-06-21 11:10:53','',NULL,''),(2036,'设备类型管理修改',2033,3,'#','',NULL,1,0,'F','0','0','manage:vmType:edit','#','admin','2024-06-21 11:10:53','',NULL,''),(2037,'设备类型管理删除',2033,4,'#','',NULL,1,0,'F','0','0','manage:vmType:remove','#','admin','2024-06-21 11:10:53','',NULL,''),(2038,'设备类型管理导出',2033,5,'#','',NULL,1,0,'F','0','0','manage:vmType:export','#','admin','2024-06-21 11:10:53','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2024-06-04 10:47:07','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2024-06-04 10:47:07','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'菜单管理',1,'com.dkd.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"点位管理\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"点位管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"node\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-05 11:09:09',24),(101,'字典类型',1,'com.dkd.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"商圈类型\",\"dictType\":\"business_type\",\"params\":{},\"remark\":\"商圈类型\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-05 11:09:45',14),(102,'字典数据',1,'com.dkd.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"旅游区\",\"dictSort\":1,\"dictType\":\"business_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-05 11:10:28',14),(103,'字典数据',1,'com.dkd.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"商场写字楼\",\"dictSort\":2,\"dictType\":\"business_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-05 11:10:37',13),(104,'字典数据',1,'com.dkd.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"学校\",\"dictSort\":3,\"dictType\":\"business_type\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-05 11:10:43',9),(105,'字典数据',1,'com.dkd.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"交通枢纽\",\"dictSort\":4,\"dictType\":\"business_type\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-05 11:11:12',12),(106,'代码生成',6,'com.dkd.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"tb_region,tb_partner,tb_node\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-05 11:11:35',177),(107,'代码生成',2,'com.dkd.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"region\",\"className\":\"Region\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":24,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 11:11:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RegionName\",\"columnComment\":\"区域名称\",\"columnId\":25,\"columnName\":\"region_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 11:11:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"regionName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":26,\"columnName\":\"create_time\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 11:11:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateTime\",\"columnComment\":\"修改时间\",\"columnId\":27,\"columnName\":\"update_time\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 11:11:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateTime\",\"javaType\":\"Date\",\"list\":false,','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-05 11:17:53',40),(108,'代码生成',2,'com.dkd.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"partner\",\"className\":\"Partner\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":12,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 11:11:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PartnerName\",\"columnComment\":\"合作商名称\",\"columnId\":13,\"columnName\":\"partner_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 11:11:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"partnerName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContactPerson\",\"columnComment\":\"联系人\",\"columnId\":14,\"columnName\":\"contact_person\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 11:11:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"contactPerson\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContactPhone\",\"columnComment\":\"联系电话\",\"columnId\":15,\"columnName\":\"contact_phone\",\"columnType\":\"varchar(15)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 11:11:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuer','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-05 11:22:11',42),(109,'代码生成',2,'com.dkd.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"node\",\"className\":\"Node\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 11:11:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NodeName\",\"columnComment\":\"点位名称\",\"columnId\":2,\"columnName\":\"node_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 11:11:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nodeName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Address\",\"columnComment\":\"详细地址\",\"columnId\":3,\"columnName\":\"address\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 11:11:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"address\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BusinessType\",\"columnComment\":\"商圈类型\",\"columnId\":4,\"columnName\":\"business_type\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-05 11:11:35\",\"dictType\":\"business_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"jav','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-05 11:32:17',42),(110,'代码生成',8,'com.dkd.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"tb_node,tb_partner,tb_region\"}',NULL,0,NULL,'2024-06-05 11:36:27',532),(111,'菜单管理',2,'com.dkd.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"manage/region/index\",\"createTime\":\"2024-06-05 11:38:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"区域管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"region\",\"perms\":\"manage:region:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-05 11:39:32',8),(112,'菜单管理',2,'com.dkd.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"manage/node/index\",\"createTime\":\"2024-06-05 11:38:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"点位管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"node\",\"perms\":\"manage:node:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-05 11:39:54',6),(113,'菜单管理',2,'com.dkd.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"manage/partner/index\",\"createTime\":\"2024-06-05 11:38:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"合作商管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"partner\",\"perms\":\"manage:partner:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-05 11:39:58',5),(114,'区域管理',1,'com.dkd.manage.controller.RegionController.add()','POST',1,'admin','研发部门','/manage/region','127.0.0.1','内网IP','{\"createTime\":\"2024-06-05 18:45:48\",\"id\":4,\"params\":{},\"regionName\":\"北京市北五环奥体中心\",\"remark\":\"北京市北五环奥体中心\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-05 18:45:48',33),(115,'区域管理',2,'com.dkd.manage.controller.RegionController.edit()','PUT',1,'admin','研发部门','/manage/region','127.0.0.1','内网IP','{\"createTime\":\"2024-06-05 18:45:48\",\"id\":4,\"params\":{},\"regionName\":\"北京市北五环奥体中心\",\"remark\":\"北京市北五环奥体中心\",\"updateTime\":\"2024-06-05 18:46:20\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-05 18:46:20',9),(116,'合作商管理',1,'com.dkd.manage.controller.PartnerController.add()','POST',1,'admin','研发部门','/manage/partner','127.0.0.1','内网IP','{\"account\":\"1350013500\",\"contactPerson\":\"小智\",\"contactPhone\":\"1350013500\",\"createTime\":\"2024-06-06 20:41:47\",\"id\":3,\"params\":{},\"partnerName\":\"传智合作商\",\"profitRatio\":15}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 20:41:47',34),(117,'合作商管理',2,'com.dkd.manage.controller.PartnerController.edit()','PUT',1,'admin','研发部门','/manage/partner','127.0.0.1','内网IP','{\"account\":\"1350013500\",\"contactPerson\":\"小智\",\"contactPhone\":\"1350013500\",\"createTime\":\"2024-06-06 20:41:47\",\"id\":3,\"params\":{},\"partnerName\":\"传智合作商\",\"profitRatio\":20,\"updateTime\":\"2024-06-06 20:42:37\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 20:42:37',4),(118,'合作商管理',1,'com.dkd.manage.controller.PartnerController.add()','POST',1,'admin','研发部门','/manage/partner','127.0.0.1','内网IP','{\"account\":\"13500135001\",\"contactPerson\":\"播妞\",\"contactPhone\":\"13500135001\",\"createTime\":\"2024-06-06 21:26:47\",\"id\":4,\"params\":{},\"partnerName\":\"黑马合作商\",\"profitRatio\":20}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 21:26:47',89),(119,'重置合作商密码',2,'com.dkd.manage.controller.PartnerController.resetPwd()','PUT',1,'admin','研发部门','/manage/partner/resetPwd/3','127.0.0.1','内网IP','3','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-07 16:06:42',84),(120,'重置合作商密码',2,'com.dkd.manage.controller.PartnerController.resetPwd()','PUT',1,'admin','研发部门','/manage/partner/resetPwd/3','127.0.0.1','内网IP','3','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-07 16:07:26',78),(121,'点位管理',2,'com.dkd.manage.controller.NodeController.edit()','PUT',1,'admin','研发部门','/manage/node','127.0.0.1','内网IP','{\"address\":\"北京市朝阳区国家体育场南路1号\",\"businessType\":2,\"createTime\":\"2024-06-04 19:58:39\",\"id\":2,\"nodeName\":\"五道口点位\",\"params\":{},\"partnerId\":2,\"regionId\":2,\"updateTime\":\"2024-06-11 10:53:26\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-11 10:53:26',14),(122,'点位管理',2,'com.dkd.manage.controller.NodeController.edit()','PUT',1,'admin','研发部门','/manage/node','127.0.0.1','内网IP','{\"address\":\"北京市海淀区五道口\",\"businessType\":2,\"createTime\":\"2024-06-04 19:58:39\",\"id\":2,\"nodeName\":\"五道口点位\",\"params\":{},\"partnerId\":2,\"regionId\":2,\"updateTime\":\"2024-06-11 10:53:30\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-11 10:53:30',9),(123,'点位管理',1,'com.dkd.manage.controller.NodeController.add()','POST',1,'admin','研发部门','/manage/node','127.0.0.1','内网IP','{\"address\":\"北京市朝阳区国家体育场南路1号\",\"businessType\":1,\"createTime\":\"2024-06-11 16:38:08\",\"id\":3,\"nodeName\":\"北京奥运博物馆\",\"params\":{},\"partnerId\":3,\"regionId\":4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-11 16:38:08',10),(124,'点位管理',2,'com.dkd.manage.controller.NodeController.edit()','PUT',1,'admin','研发部门','/manage/node','127.0.0.1','内网IP','{\"address\":\"北京市朝阳区国家体育场南路1号\",\"businessType\":1,\"createTime\":\"2024-06-11 16:38:08\",\"id\":3,\"nodeName\":\"北京奥运博物馆\",\"params\":{},\"partnerId\":4,\"regionId\":4,\"updateTime\":\"2024-06-11 16:38:56\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-11 16:38:56',5),(125,'区域管理',3,'com.dkd.manage.controller.RegionController.remove()','DELETE',1,'admin','研发部门','/manage/region/4','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-14 11:03:07',26),(126,'区域管理',1,'com.dkd.manage.controller.RegionController.add()','POST',1,'admin','研发部门','/manage/region','127.0.0.1','内网IP','{\"createTime\":\"2024-06-14 11:15:37\",\"id\":5,\"params\":{},\"regionName\":\"北京市北五环奥体中心\",\"remark\":\"北京市北五环奥体中心\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-14 11:15:37',25),(127,'点位管理',1,'com.dkd.manage.controller.NodeController.add()','POST',1,'admin','研发部门','/manage/node','127.0.0.1','内网IP','{\"address\":\"北京市朝阳区国家体育场南路1号\",\"businessType\":1,\"createTime\":\"2024-06-14 11:15:57\",\"nodeName\":\"北京奥运博物馆\",\"params\":{},\"partnerId\":4,\"regionId\":4}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\r\n### The error may exist in file [D:\\workspace\\dkd\\dkd-parent\\dkd-manage\\target\\classes\\mapper\\manage\\NodeMapper.xml]\r\n### The error may involve com.dkd.manage.mapper.NodeMapper.insertNode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_node          ( node_name,             address,             business_type,             region_id,             partner_id,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\n; Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))','2024-06-14 11:15:57',48),(128,'点位管理',1,'com.dkd.manage.controller.NodeController.add()','POST',1,'admin','研发部门','/manage/node','127.0.0.1','内网IP','{\"address\":\"北京市朝阳区国家体育场南路1号\",\"businessType\":1,\"createTime\":\"2024-06-14 11:16:03\",\"nodeName\":\"北京奥运博物馆\",\"params\":{},\"partnerId\":4,\"regionId\":4}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\r\n### The error may exist in file [D:\\workspace\\dkd\\dkd-parent\\dkd-manage\\target\\classes\\mapper\\manage\\NodeMapper.xml]\r\n### The error may involve com.dkd.manage.mapper.NodeMapper.insertNode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_node          ( node_name,             address,             business_type,             region_id,             partner_id,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\n; Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))','2024-06-14 11:16:03',4),(129,'点位管理',1,'com.dkd.manage.controller.NodeController.add()','POST',1,'admin','研发部门','/manage/node','127.0.0.1','内网IP','{\"address\":\"北京市朝阳区国家体育场南路1号\",\"businessType\":1,\"createTime\":\"2024-06-14 11:17:11\",\"nodeName\":\"北京奥运博物馆\",\"params\":{},\"partnerId\":4,\"regionId\":4}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\r\n### The error may exist in file [D:\\workspace\\dkd\\dkd-parent\\dkd-manage\\target\\classes\\mapper\\manage\\NodeMapper.xml]\r\n### The error may involve com.dkd.manage.mapper.NodeMapper.insertNode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_node          ( node_name,             address,             business_type,             region_id,             partner_id,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\n; Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))','2024-06-14 11:17:11',4),(130,'点位管理',1,'com.dkd.manage.controller.NodeController.add()','POST',1,'admin','研发部门','/manage/node','127.0.0.1','内网IP','{\"address\":\"北京市朝阳区国家体育场南路1号\",\"businessType\":1,\"createTime\":\"2024-06-14 11:17:16\",\"nodeName\":\"北京奥运博物馆\",\"params\":{},\"partnerId\":4,\"regionId\":4}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\r\n### The error may exist in file [D:\\workspace\\dkd\\dkd-parent\\dkd-manage\\target\\classes\\mapper\\manage\\NodeMapper.xml]\r\n### The error may involve com.dkd.manage.mapper.NodeMapper.insertNode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_node          ( node_name,             address,             business_type,             region_id,             partner_id,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\n; Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))','2024-06-14 11:17:16',3),(131,'点位管理',1,'com.dkd.manage.controller.NodeController.add()','POST',1,'admin','研发部门','/manage/node','127.0.0.1','内网IP','{\"address\":\"北京市朝阳区国家体育场南路1号\",\"businessType\":1,\"createTime\":\"2024-06-14 11:17:19\",\"nodeName\":\"北京奥运博物馆\",\"params\":{},\"partnerId\":4,\"regionId\":4}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\r\n### The error may exist in file [D:\\workspace\\dkd\\dkd-parent\\dkd-manage\\target\\classes\\mapper\\manage\\NodeMapper.xml]\r\n### The error may involve com.dkd.manage.mapper.NodeMapper.insertNode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_node          ( node_name,             address,             business_type,             region_id,             partner_id,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\n; Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))','2024-06-14 11:17:19',3),(132,'点位管理',1,'com.dkd.manage.controller.NodeController.add()','POST',1,'admin','研发部门','/manage/node','127.0.0.1','内网IP','{\"address\":\"北京市朝阳区国家体育场南路1号\",\"businessType\":1,\"createTime\":\"2024-06-14 11:17:23\",\"nodeName\":\"北京奥运博物馆\",\"params\":{},\"partnerId\":4,\"regionId\":4}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\r\n### The error may exist in file [D:\\workspace\\dkd\\dkd-parent\\dkd-manage\\target\\classes\\mapper\\manage\\NodeMapper.xml]\r\n### The error may involve com.dkd.manage.mapper.NodeMapper.insertNode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_node          ( node_name,             address,             business_type,             region_id,             partner_id,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\n; Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))','2024-06-14 11:17:23',5),(133,'点位管理',1,'com.dkd.manage.controller.NodeController.add()','POST',1,'admin','研发部门','/manage/node','127.0.0.1','内网IP','{\"address\":\"北京市朝阳区国家体育场南路1号\",\"businessType\":1,\"createTime\":\"2024-06-14 11:22:10\",\"nodeName\":\"北京奥运博物馆\",\"params\":{},\"partnerId\":4,\"regionId\":4}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\r\n### The error may exist in file [D:\\workspace\\dkd\\dkd-parent\\dkd-manage\\target\\classes\\mapper\\manage\\NodeMapper.xml]\r\n### The error may involve com.dkd.manage.mapper.NodeMapper.insertNode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_node          ( node_name,             address,             business_type,             region_id,             partner_id,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\n; Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))','2024-06-14 11:22:10',67),(134,'点位管理',1,'com.dkd.manage.controller.NodeController.add()','POST',1,'admin','研发部门','/manage/node','127.0.0.1','内网IP','{\"address\":\"北京市朝阳区国家体育场南路1号\",\"businessType\":1,\"createTime\":\"2024-06-14 11:22:18\",\"nodeName\":\"北京奥运博物馆\",\"params\":{},\"partnerId\":4,\"regionId\":4}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\r\n### The error may exist in file [D:\\workspace\\dkd\\dkd-parent\\dkd-manage\\target\\classes\\mapper\\manage\\NodeMapper.xml]\r\n### The error may involve com.dkd.manage.mapper.NodeMapper.insertNode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_node          ( node_name,             address,             business_type,             region_id,             partner_id,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\n; Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))','2024-06-14 11:22:18',6),(135,'点位管理',1,'com.dkd.manage.controller.NodeController.add()','POST',1,'admin','研发部门','/manage/node','127.0.0.1','内网IP','{\"address\":\"北京市朝阳区国家体育场南路1号\",\"businessType\":1,\"createTime\":\"2024-06-14 11:23:59\",\"nodeName\":\"北京奥运博物馆\",\"params\":{},\"partnerId\":4,\"regionId\":4}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\r\n### The error may exist in file [D:\\workspace\\dkd\\dkd-parent\\dkd-manage\\target\\classes\\mapper\\manage\\NodeMapper.xml]\r\n### The error may involve com.dkd.manage.mapper.NodeMapper.insertNode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_node          ( node_name,             address,             business_type,             region_id,             partner_id,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\n; Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))','2024-06-14 11:23:59',10),(136,'点位管理',1,'com.dkd.manage.controller.NodeController.add()','POST',1,'admin','研发部门','/manage/node','127.0.0.1','内网IP','{\"address\":\"北京市朝阳区国家体育场南路1号\",\"businessType\":1,\"createTime\":\"2024-06-14 11:24:32\",\"nodeName\":\"北京奥运博物馆\",\"params\":{},\"partnerId\":4,\"regionId\":4}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\r\n### The error may exist in file [D:\\workspace\\dkd\\dkd-parent\\dkd-manage\\target\\classes\\mapper\\manage\\NodeMapper.xml]\r\n### The error may involve com.dkd.manage.mapper.NodeMapper.insertNode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_node          ( node_name,             address,             business_type,             region_id,             partner_id,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\n; Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))','2024-06-14 11:24:32',7),(137,'点位管理',1,'com.dkd.manage.controller.NodeController.add()','POST',1,'admin','研发部门','/manage/node','127.0.0.1','内网IP','{\"address\":\"北京市朝阳区国家体育场南路1号\",\"businessType\":1,\"createTime\":\"2024-06-14 11:24:47\",\"nodeName\":\"北京奥运博物馆\",\"params\":{},\"partnerId\":4,\"regionId\":4}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\r\n### The error may exist in file [D:\\workspace\\dkd\\dkd-parent\\dkd-manage\\target\\classes\\mapper\\manage\\NodeMapper.xml]\r\n### The error may involve com.dkd.manage.mapper.NodeMapper.insertNode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_node          ( node_name,             address,             business_type,             region_id,             partner_id,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\n; Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))','2024-06-14 11:24:47',6),(138,'点位管理',1,'com.dkd.manage.controller.NodeController.add()','POST',1,'admin','研发部门','/manage/node','127.0.0.1','内网IP','{\"address\":\"北京市朝阳区国家体育场南路1号\",\"businessType\":1,\"createTime\":\"2024-06-14 11:26:25\",\"id\":15,\"nodeName\":\"北京奥运博物馆\",\"params\":{},\"partnerId\":4,\"regionId\":5}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-14 11:26:25',7),(139,'区域管理',3,'com.dkd.manage.controller.RegionController.remove()','DELETE',1,'admin','研发部门','/manage/region/5','127.0.0.1','内网IP','{}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\r\n### The error may exist in file [D:\\workspace\\dkd\\dkd-parent\\dkd-manage\\target\\classes\\mapper\\manage\\RegionMapper.xml]\r\n### The error may involve com.dkd.manage.mapper.RegionMapper.deleteRegionByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from tb_region where id in          (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))','2024-06-14 11:27:10',8),(140,'区域管理',3,'com.dkd.manage.controller.RegionController.remove()','DELETE',1,'admin','研发部门','/manage/region/5','127.0.0.1','内网IP','{}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\r\n### The error may exist in file [D:\\workspace\\dkd\\dkd-parent\\dkd-manage\\target\\classes\\mapper\\manage\\RegionMapper.xml]\r\n### The error may involve com.dkd.manage.mapper.RegionMapper.deleteRegionByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from tb_region where id in          (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))','2024-06-14 11:31:29',5),(141,'区域管理',3,'com.dkd.manage.controller.RegionController.remove()','DELETE',1,'admin','研发部门','/manage/region/5','127.0.0.1','内网IP','{}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\r\n### The error may exist in file [D:\\workspace\\dkd\\dkd-parent\\dkd-manage\\target\\classes\\mapper\\manage\\RegionMapper.xml]\r\n### The error may involve com.dkd.manage.mapper.RegionMapper.deleteRegionByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from tb_region where id in          (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))','2024-06-14 11:31:45',3),(142,'区域管理',3,'com.dkd.manage.controller.RegionController.remove()','DELETE',1,'admin','研发部门','/manage/region/5','127.0.0.1','内网IP','{}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\r\n### The error may exist in file [D:\\workspace\\dkd\\dkd-parent\\dkd-manage\\target\\classes\\mapper\\manage\\RegionMapper.xml]\r\n### The error may involve com.dkd.manage.mapper.RegionMapper.deleteRegionByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from tb_region where id in          (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))','2024-06-14 11:34:46',4),(143,'区域管理',3,'com.dkd.manage.controller.RegionController.remove()','DELETE',1,'admin','研发部门','/manage/region/5','127.0.0.1','内网IP','{}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\r\n### The error may exist in file [D:\\workspace\\dkd\\dkd-parent\\dkd-manage\\target\\classes\\mapper\\manage\\RegionMapper.xml]\r\n### The error may involve com.dkd.manage.mapper.RegionMapper.deleteRegionByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from tb_region where id in          (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))','2024-06-14 11:37:06',5),(144,'区域管理',3,'com.dkd.manage.controller.RegionController.remove()','DELETE',1,'admin','研发部门','/manage/region/5','127.0.0.1','内网IP','{}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\r\n### The error may exist in file [D:\\workspace\\dkd\\dkd-parent\\dkd-manage\\target\\classes\\mapper\\manage\\RegionMapper.xml]\r\n### The error may involve com.dkd.manage.mapper.RegionMapper.deleteRegionByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from tb_region where id in          (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`))','2024-06-14 12:27:04',10),(145,'合作商管理',3,'com.dkd.manage.controller.PartnerController.remove()','DELETE',1,'admin','研发部门','/manage/partner/4','127.0.0.1','内网IP','{}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_2` FOREIGN KEY (`partner_id`) REFERENCES `tb_partner` (`id`))\r\n### The error may exist in file [D:\\workspace\\dkd\\dkd-parent\\dkd-manage\\target\\classes\\mapper\\manage\\PartnerMapper.xml]\r\n### The error may involve com.dkd.manage.mapper.PartnerMapper.deletePartnerByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from tb_partner where id in          (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_2` FOREIGN KEY (`partner_id`) REFERENCES `tb_partner` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_2` FOREIGN KEY (`partner_id`) REFERENCES `tb_partner` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`dkd`.`tb_node`, CONSTRAINT `tb_node_ibfk_2` FOREIGN KEY (`partner_id`) REFERENCES `tb_partner` (`id`))','2024-06-14 12:27:17',5),(146,'菜单管理',1,'com.dkd.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"人员管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"emp\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-15 10:18:33',31),(147,'字典类型',1,'com.dkd.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"员工状态\",\"dictType\":\"emp_status\",\"params\":{},\"remark\":\"员工状态\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-15 10:19:12',14),(148,'字典数据',1,'com.dkd.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"启用\",\"dictSort\":1,\"dictType\":\"emp_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-15 10:19:43',9),(149,'字典数据',1,'com.dkd.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"停用\",\"dictSort\":2,\"dictType\":\"emp_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-15 10:20:02',11),(150,'代码生成',6,'com.dkd.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"tb_emp\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-15 10:21:43',90),(151,'代码生成',6,'com.dkd.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"tb_role\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-15 10:21:50',20),(152,'代码生成',2,'com.dkd.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"emp\",\"className\":\"Emp\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-15 10:21:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"人员名称\",\"columnId\":32,\"columnName\":\"user_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-15 10:21:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RegionId\",\"columnComment\":\"所属区域Id\",\"columnId\":33,\"columnName\":\"region_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-15 10:21:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"regionId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RegionName\",\"columnComment\":\"归属区域\",\"columnId\":34,\"columnName\":\"region_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-15 10:21:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"regionNa','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-15 10:31:17',52),(153,'代码生成',2,'com.dkd.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"role\",\"className\":\"Role\",\"columns\":[{\"capJavaField\":\"RoleId\",\"columnId\":43,\"columnName\":\"role_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-15 10:21:50\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"roleId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RoleCode\",\"columnComment\":\"角色编码\\n\",\"columnId\":44,\"columnName\":\"role_code\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-15 10:21:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"roleCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RoleName\",\"columnComment\":\"角色名称\\n\",\"columnId\":45,\"columnName\":\"role_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-15 10:21:50\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"roleName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"itheima\",\"functionName\":\"工单角色\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"manage\",\"options\":\"{\\\"parentMenuId\\\":2019}\",\"packageName\":\"com.dkd.manage\",\"params\":{\"parentMenuId\":2019},\"parentMenuId\":\"2019\",\"sub\":false,\"tableComment\":\"工单角色表\",\"tableId\":5,\"tableName\":\"tb_role\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-plus\",\"tree\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-15 10:32:52',18),(154,'代码生成',8,'com.dkd.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"tb_emp,tb_role\"}',NULL,0,NULL,'2024-06-15 10:33:26',482),(155,'人员列表',1,'com.dkd.manage.controller.EmpController.add()','POST',1,'admin','研发部门','/manage/emp','127.0.0.1','内网IP','{\"createTime\":\"2024-06-17 16:06:26\",\"id\":55,\"image\":\"/profile/upload/2024/06/17/员工头像_20240617160551A003.png\",\"mobile\":\"13800138001\",\"params\":{},\"regionId\":5,\"roleId\":2,\"status\":1,\"userName\":\"小智\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-17 16:06:26',16),(156,'人员列表',3,'com.dkd.manage.controller.EmpController.remove()','DELETE',1,'admin','研发部门','/manage/emp/55','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-17 16:21:51',16),(157,'人员列表',1,'com.dkd.manage.controller.EmpController.add()','POST',1,'admin','研发部门','/manage/emp','127.0.0.1','内网IP','{\"createTime\":\"2024-06-17 16:22:11\",\"id\":56,\"image\":\"/profile/upload/2024/06/17/员工头像_20240617162209A001.png\",\"mobile\":\"13800138001\",\"params\":{},\"regionId\":5,\"regionName\":\"北京市北五环奥体中心\",\"roleCode\":\"1002\",\"roleId\":2,\"roleName\":\"运营员\",\"status\":1,\"userName\":\"小智\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-17 16:22:11',14),(158,'人员列表',1,'com.dkd.manage.controller.EmpController.add()','POST',1,'admin','研发部门','/manage/emp','127.0.0.1','内网IP','{\"createTime\":\"2024-06-17 16:23:33\",\"id\":57,\"image\":\"/profile/upload/2024/06/17/员工头像_20240617162331A002.png\",\"mobile\":\"13800138002\",\"params\":{},\"regionId\":5,\"regionName\":\"北京市北五环奥体中心\",\"roleCode\":\"1003\",\"roleId\":3,\"roleName\":\"维修员\",\"status\":1,\"userName\":\"播妞\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-17 16:23:33',17),(159,'人员列表',2,'com.dkd.manage.controller.EmpController.edit()','PUT',1,'admin','研发部门','/manage/emp','127.0.0.1','内网IP','{\"createTime\":\"2024-06-17 16:23:34\",\"id\":57,\"image\":\"/profile/upload/2024/06/17/员工头像_20240617162331A002.png\",\"mobile\":\"13800138002\",\"params\":{},\"regionId\":3,\"regionName\":\"北京市东城区\",\"roleCode\":\"1003\",\"roleId\":3,\"roleName\":\"维修员\",\"status\":1,\"updateTime\":\"2024-06-17 16:23:48\",\"userName\":\"播妞\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-17 16:23:49',8),(160,'人员列表',2,'com.dkd.manage.controller.EmpController.edit()','PUT',1,'admin','研发部门','/manage/emp','127.0.0.1','内网IP','{\"createTime\":\"2024-06-17 16:23:34\",\"id\":57,\"image\":\"/profile/upload/2024/06/17/员工头像_20240617162331A002.png\",\"mobile\":\"13800138002\",\"params\":{},\"regionId\":5,\"regionName\":\"北京市北五环奥体中心\",\"roleCode\":\"1003\",\"roleId\":3,\"roleName\":\"维修员\",\"status\":1,\"updateTime\":\"2024-06-17 16:24:23\",\"userName\":\"播妞\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-17 16:24:23',8),(161,'区域管理',2,'com.dkd.manage.controller.RegionController.edit()','PUT',1,'admin','研发部门','/manage/region','127.0.0.1','内网IP','{\"createTime\":\"2024-06-14 11:15:37\",\"id\":5,\"params\":{},\"regionName\":\"北京市奥体中心\",\"remark\":\"北京市奥体中心\",\"updateTime\":\"2024-06-17 20:15:03\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-17 20:15:03',9),(162,'区域管理',2,'com.dkd.manage.controller.RegionController.edit()','PUT',1,'admin','研发部门','/manage/region','127.0.0.1','内网IP','{\"createTime\":\"2024-06-14 11:15:37\",\"id\":5,\"params\":{},\"regionName\":\"北京市北五环奥体中心\",\"remark\":\"北京市北五环奥体中心\",\"updateTime\":\"2024-06-17 20:39:01\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-17 20:39:01',29),(163,'菜单管理',1,'com.dkd.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"设备管理\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"vm\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 10:33:11',30),(164,'字典类型',1,'com.dkd.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"设备状态\",\"dictType\":\"vm_status\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 10:33:56',14),(165,'字典数据',1,'com.dkd.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"为透风\",\"dictSort\":1,\"dictType\":\"vm_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 10:34:23',14),(166,'字典类型',3,'com.dkd.web.controller.system.SysDictDataController.remove()','DELETE',1,'admin','研发部门','/system/dict/data/106','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 10:34:28',14),(167,'字典数据',1,'com.dkd.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未投放\",\"dictSort\":1,\"dictType\":\"vm_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 10:34:40',8),(168,'字典类型',3,'com.dkd.web.controller.system.SysDictDataController.remove()','DELETE',1,'admin','研发部门','/system/dict/data/107','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 10:34:42',13),(169,'字典数据',1,'com.dkd.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未投放\",\"dictSort\":1,\"dictType\":\"vm_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 10:34:55',10),(170,'字典数据',1,'com.dkd.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"运营\",\"dictSort\":2,\"dictType\":\"vm_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 10:35:08',7),(171,'字典数据',1,'com.dkd.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"撤机\",\"dictSort\":3,\"dictType\":\"vm_status\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 10:35:17',9),(172,'代码生成',6,'com.dkd.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"tb_vending_machine,tb_vm_type\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 10:36:16',137),(173,'代码生成',6,'com.dkd.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"tb_channel\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 10:37:22',34),(174,'代码生成',2,'com.dkd.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"vmType\",\"className\":\"VmType\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":64,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:36:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"型号名称\",\"columnId\":65,\"columnName\":\"name\",\"columnType\":\"varchar(15)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:36:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Model\",\"columnComment\":\"型号编码\",\"columnId\":66,\"columnName\":\"model\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:36:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"model\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Image\",\"columnComment\":\"设备图片\",\"columnId\":67,\"columnName\":\"image\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:36:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"image\",\"javaType\":\"Strin','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 10:45:07',41),(175,'代码生成',2,'com.dkd.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"vm\",\"className\":\"VendingMachine\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":46,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:36:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"InnerCode\",\"columnComment\":\"设备编号\",\"columnId\":47,\"columnName\":\"inner_code\",\"columnType\":\"varchar(15)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:36:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"innerCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ChannelMaxCapacity\",\"columnComment\":\"设备容量\",\"columnId\":48,\"columnName\":\"channel_max_capacity\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:36:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"channelMaxCapacity\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NodeId\",\"columnComment\":\"点位Id\",\"columnId\":49,\"columnName\":\"node_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:36:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequi','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 11:00:39',74),(176,'代码生成',2,'com.dkd.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"channel\",\"className\":\"Channel\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":71,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:37:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ChannelCode\",\"columnComment\":\"货道编号\",\"columnId\":72,\"columnName\":\"channel_code\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:37:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"channelCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SkuId\",\"columnComment\":\"商品Id\",\"columnId\":73,\"columnName\":\"sku_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:37:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"skuId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VmId\",\"columnComment\":\"售货机Id\",\"columnId\":74,\"columnName\":\"vm_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-06-21 10:37:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"vmId\",\"javaType\":','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 11:03:08',34),(177,'代码生成',8,'com.dkd.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"tb_vending_machine,tb_vm_type,tb_channel\"}',NULL,0,NULL,'2024-06-21 11:03:43',643),(178,'代码生成',8,'com.dkd.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"tb_vending_machine,tb_vm_type,tb_channel\"}',NULL,0,NULL,'2024-06-21 11:09:23',333),(179,'菜单管理',2,'com.dkd.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"manage/vmType/index\",\"createTime\":\"2024-06-21 11:10:53\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"设备类型管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2026,\"path\":\"vmType\",\"perms\":\"manage:vmType:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 11:13:04',10),(180,'设备类型管理',1,'com.dkd.manage.controller.VmTypeController.add()','POST',1,'admin','研发部门','/manage/vmType','127.0.0.1','内网IP','{\"channelMaxCapacity\":10,\"id\":21,\"image\":\"https://dkd-itheima.oss-cn-beijing.aliyuncs.com/dkd-images/2024/06/21/6675219e0d7acad54fe8037a.png\",\"model\":\"CZ-10015\",\"name\":\"盲盒机\",\"params\":{},\"vmCol\":4,\"vmRow\":5}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 14:45:59',40),(181,'设备类型管理',2,'com.dkd.manage.controller.VmTypeController.edit()','PUT',1,'admin','研发部门','/manage/vmType','127.0.0.1','内网IP','{\"channelMaxCapacity\":6,\"id\":21,\"image\":\"https://dkd-itheima.oss-cn-beijing.aliyuncs.com/dkd-images/2024/06/21/6675219e0d7acad54fe8037a.png\",\"model\":\"CZ-10015\",\"name\":\"盲盒机\",\"params\":{},\"vmCol\":4,\"vmRow\":5}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-21 14:46:30',7);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-06-04 10:47:07','',NULL,''),(2,'se','项目经理',2,'0','admin','2024-06-04 10:47:07','',NULL,''),(3,'hr','人力资源',3,'0','admin','2024-06-04 10:47:07','',NULL,''),(4,'user','普通员工',4,'0','admin','2024-06-04 10:47:07','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-06-04 10:47:07','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2024-06-04 10:47:07','',NULL,'普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-06-19 15:33:13','admin','2024-06-04 10:47:07','','2024-06-19 15:33:12','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-06-04 10:47:07','admin','2024-06-04 10:47:07','',NULL,'测试员');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工单员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_emp`
--

LOCK TABLES `tb_emp` WRITE;
/*!40000 ALTER TABLE `tb_emp` DISABLE KEYS */;
INSERT INTO `tb_emp` VALUES (2,'刘备',2,'北京市海淀区',2,'1002','运营员','13800000001','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:04'),(3,'关羽',2,'北京市海淀区',2,'1002','运营员','13800000002','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:06'),(4,'张飞',2,'北京市海淀区',3,'1003','维修员','13800000003','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:08'),(5,'赵云',2,'北京市海淀区',3,'1003','维修员','13800000004','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:10'),(6,'曹操',1,'北京市朝阳区',2,'1002','运营员','13900139001','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:11'),(7,'夏侯惇',1,'北京市朝阳区',2,'1002','运营员','13900000002','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:13'),(8,'许褚',1,'北京市朝阳区',3,'1003','维修员','13900139003','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:15'),(9,'张辽',1,'北京市朝阳区',3,'1003','维修员','13900000004','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:17'),(10,'孙权',3,'北京市西城区',2,'1002','运营员','13700000001','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:19'),(11,'周瑜',3,'北京市西城区',2,'1002','运营员','13700000002','http://likede2-java.itheima.net/image/avatar.png',0,'2024-06-10 07:06:58','2024-06-10 08:11:21'),(12,'吕蒙',3,'北京市西城区',3,'1003','维修员','13700000003','http://likede2-java.itheima.net/image/avatar.png',0,'2024-06-10 07:06:58','2024-06-10 08:11:24'),(13,'陆逊',3,'北京市西城区',3,'1003','维修员','13700000005','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:26'),(50,'孙一百',1,'北京市朝阳区',3,'1003','维修员','13700137009','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:28'),(51,'马超',2,'北京市海淀区',3,'1003','维修员','13900002222','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:30'),(52,'黄忠',2,'北京市海淀区',2,'1002','运营员','13900005555','http://likede2-java.itheima.net/image/avatar.png',1,'2024-06-10 07:06:58','2024-06-10 08:11:31'),(53,'测试员工',1,'北京市朝阳区',1,'1001','工单管理员','15100000001','/profile/upload/2024/05/18/4e7f3a15429bfda99bce42a18cdd1jpeg_20240518103539A002.jpeg',1,'2024-06-10 07:06:58','2024-06-10 08:11:33'),(56,'小智',5,'北京市北五环奥体中心',2,'1002','运营员','13800138001','/profile/upload/2024/06/17/员工头像_20240617162209A001.png',1,'2024-06-17 08:22:11','2024-06-17 08:22:11'),(57,'播妞',5,'北京市北五环奥体中心',3,'1003','维修员','13800138002','/profile/upload/2024/06/17/员工头像_20240617162331A002.png',1,'2024-06-17 08:23:34','2024-06-17 08:24:23');
/*!40000 ALTER TABLE `tb_emp` ENABLE KEYS */;
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
-- Table structure for table `tb_node`
--

DROP TABLE IF EXISTS `tb_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_node` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `node_name` varchar(255) NOT NULL COMMENT '点位名称',
  `address` varchar(255) NOT NULL COMMENT '详细地址',
  `business_type` int DEFAULT NULL COMMENT '商圈类型',
  `region_id` int DEFAULT NULL COMMENT '区域ID',
  `partner_id` int DEFAULT NULL COMMENT '合作商ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `region_id` (`region_id`),
  KEY `partner_id` (`partner_id`),
  CONSTRAINT `tb_node_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`),
  CONSTRAINT `tb_node_ibfk_2` FOREIGN KEY (`partner_id`) REFERENCES `tb_partner` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='点位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_node`
--

LOCK TABLES `tb_node` WRITE;
/*!40000 ALTER TABLE `tb_node` DISABLE KEYS */;
INSERT INTO `tb_node` VALUES (1,'三里屯点位','北京市朝阳区三里屯路',1,1,1,'2024-06-04 11:58:39','2024-06-04 11:58:39',NULL,NULL,NULL),(2,'五道口点位','北京市海淀区五道口',2,2,2,'2024-06-04 11:58:39','2024-06-11 02:53:31',NULL,NULL,NULL),(15,'北京奥运博物馆','北京市朝阳区国家体育场南路1号',1,5,4,'2024-06-14 03:26:25','2024-06-14 03:26:25',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tb_node` ENABLE KEYS */;
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
-- Table structure for table `tb_partner`
--

DROP TABLE IF EXISTS `tb_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_partner` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `partner_name` varchar(255) NOT NULL COMMENT '合作商名称',
  `contact_person` varchar(64) DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(15) DEFAULT NULL COMMENT '联系电话',
  `profit_ratio` int DEFAULT NULL COMMENT '分成比例',
  `account` varchar(64) DEFAULT NULL COMMENT '账号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='合作商表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_partner`
--

LOCK TABLES `tb_partner` WRITE;
/*!40000 ALTER TABLE `tb_partner` DISABLE KEYS */;
INSERT INTO `tb_partner` VALUES (1,'合作商A','张三','13800138000',30,'a001','pwdA','2024-06-04 11:58:39','2024-06-04 11:58:39',NULL,NULL,NULL),(2,'合作商B','李四','13912345678',25,'b002','pwdB','2024-06-04 11:58:39','2024-06-04 11:58:39',NULL,NULL,NULL),(3,'传智合作商','小智','13500135000',20,'13500135000','$2a$10$HMoV13bMmm.IRbh5tczyf.fZemJQmk.1IigU9HBrzi/zUXXLmNfZa','2024-06-06 12:41:47','2024-06-07 08:07:27',NULL,NULL,NULL),(4,'黑马合作商','播妞','13500135001',20,'13500135001','$2a$10$fJ8ngw1egcwUmkoFzWLwK.wQdl0qGLtFejXKvaF.6pvAco3b2MH7C','2024-06-06 13:26:48','2024-06-06 13:26:47',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tb_partner` ENABLE KEYS */;
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
-- Table structure for table `tb_region`
--

DROP TABLE IF EXISTS `tb_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_region` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `region_name` varchar(255) NOT NULL COMMENT '区域名称',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='区域表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_region`
--

LOCK TABLES `tb_region` WRITE;
/*!40000 ALTER TABLE `tb_region` DISABLE KEYS */;
INSERT INTO `tb_region` VALUES (1,'北京市朝阳区','2024-06-04 11:58:39','2024-06-05 07:38:00',NULL,NULL,'北京市朝阳区'),(2,'北京市海淀区','2024-06-04 11:58:39','2024-06-05 07:38:00',NULL,NULL,'北京市海淀区'),(3,'北京市东城区','2024-06-04 11:58:39','2024-06-05 07:38:00',NULL,NULL,'北京市东城区'),(5,'北京市北五环奥体中心','2024-06-14 03:15:37','2024-06-17 12:39:02',NULL,NULL,'北京市北五环奥体中心');
/*!40000 ALTER TABLE `tb_region` ENABLE KEYS */;
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
INSERT INTO `tb_vending_machine` VALUES (80,'A1000001',10,2,'顺义奥林匹克水上公园','2023-03-22 00:00:00',1,3,28,1,1,'{\"statusCode\":\"1001\",\"status\":true}',0,0,'70122567fcc13e7615e7239812c20448',1,'2020-12-18 07:49:03','2024-05-14 01:21:58'),(86,'aim5xu4I',10,2,'北京市海淀区西直门北大街32号','2000-01-01 00:00:00',2,1,1,2,1,'{\"statusCode\":\"1001\",\"status\":true}',0,0,'9d1d927b2651dba9f117a9801e7fd916',1,'2020-12-18 02:39:22','2024-05-14 01:24:53'),(87,'5cy5BdUs',10,2,'北京市海淀区西直门北大街32号','2022-12-05 00:00:00',2,1,1,2,1,'{\"statusCode\":\"1001\",\"status\":true}',0,0,'fdf33db4de889d6c31fe6351a7333072',2,'2020-12-18 02:39:22','2024-05-12 15:19:10'),(88,'tCeiyxLx',10,1,'北京市朝阳区三里屯路','2000-01-01 00:00:00',2,1,1,1,1,'{\"statusCode\":\"1001\",\"status\":true}',0,0,'0805f7585e4366b021268f8850d1e091',1,'2020-09-10 01:41:02','2024-05-14 01:24:55'),(89,'bR1cfQRa',10,2,'北京市海淀区西直门北大街32号','2000-01-01 00:00:00',2,1,1,2,1,'{\"statusCode\":\"1001\",\"status\":true}',0,0,'e4e02a07b11865bf262afb5d4507e7b3',1,'2020-12-18 02:39:22','2024-05-14 01:24:56'),(90,'RhLWjaeR',10,1,'北京市朝阳区三里屯路','2000-01-01 00:00:00',2,1,1,1,1,'{\"statusCode\":\"1001\",\"status\":true}',0,0,'0cc9e22badf6a0f41b5fad2c8b788fcd',2,'2020-09-10 01:41:02','2024-05-14 01:25:07'),(91,'qUObmvbM',10,2,'北京市海淀区西直门北大街32号','2022-12-06 00:00:00',2,1,1,2,1,'{\"statusCode\":\"1001\",\"status\":true}',0,0,'34a1779725b4e06edd7cac8a518474f1',2,'2020-12-18 02:39:22','2024-05-14 01:25:11'),(92,'tU6K5IHg',10,1,'北京市朝阳区三里屯路','2000-01-01 00:00:00',2,1,1,2,1,'{\"statusCode\":\"1001\",\"status\":true}',0,0,'fbb7f7c0bfd38785866844f983b3a887',5,'2020-09-10 01:41:02','2024-05-14 01:25:14'),(93,'iSzMcQXJ',10,1,'北京市朝阳区三里屯路','2000-01-01 00:00:00',2,1,1,1,1,'{\"statusCode\":\"1001\",\"status\":true}',0,0,'7c6f5ad6edd6e161d6ca8b94d0324fe5',2,'2020-09-10 01:41:02','2024-05-14 01:25:19'),(105,'nf2UVwi5',8,2,'北京顺义区国际鲜花港','2000-01-01 00:00:00',1,3,1,4,0,NULL,0,0,NULL,NULL,'2020-12-18 07:48:13','2024-05-13 10:47:32'),(106,'vWgqPhpu',10,1,'北京市朝阳区三里屯路','2024-05-18 15:26:37',2,1,1,1,1,NULL,0,0,NULL,NULL,'2020-09-10 01:41:02','2024-05-12 15:20:41'),(107,'SFNuCUe8',8,1,'北京市朝阳区三里屯路','2000-01-01 00:00:00',2,1,1,4,0,NULL,0,0,NULL,NULL,'2020-09-10 01:41:02','2024-05-12 15:20:41'),(111,'K6YYXHLY',10,2,'北京顺义区国际鲜花港','2000-01-01 00:00:00',1,3,1,1,0,'{\"statusCode\":\"1001\",\"status\":true}',0,0,NULL,NULL,'2020-12-18 07:48:13','2024-05-19 07:32:27');
/*!40000 ALTER TABLE `tb_vending_machine` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='设备类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_vm_type`
--

LOCK TABLES `tb_vm_type` WRITE;
/*!40000 ALTER TABLE `tb_vm_type` DISABLE KEYS */;
INSERT INTO `tb_vm_type` VALUES (1,'饮料机','CZ-10011','https://sy-192-ys.oss-cn-beijing.aliyuncs.com/images/2024/05/15/1715762932971.png',5,6,10),(2,'综合机','CZ-10012','https://sy-192-ys.oss-cn-beijing.aliyuncs.com/images/2024/05/15/1715762984492.png',2,2,10),(3,'零食机','CZ-10013','https://sy-192-ys.oss-cn-beijing.aliyuncs.com/images/2024/05/15/1715763009476.png',2,5,5),(4,'果蔬机','CZ-10014','https://sy-192-ys.oss-cn-beijing.aliyuncs.com/images/2024/05/15/1715763319518.png\n',4,4,8),(21,'盲盒机','CZ-10015','https://dkd-itheima.oss-cn-beijing.aliyuncs.com/dkd-images/2024/06/21/6675219e0d7acad54fe8037a.png',5,4,6);
/*!40000 ALTER TABLE `tb_vm_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-21 16:09:13
