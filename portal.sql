drop database IF EXISTS `portal`;
create database `portal`;
use portal;


-- MySQL dump 10.13  Distrib 5.5.43, for Win64 (x86)
--
-- Host: localhost    Database: portal
-- ------------------------------------------------------
-- Server version	5.5.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `base_account`
--

DROP TABLE IF EXISTS `base_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL COMMENT '资源ID',
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '账号名称',
  `password` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `en_key` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '密钥',
  `time` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `mt_account_ibfk_1` (`resource_id`),
  CONSTRAINT `base_account_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `base_resource` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_account`
--

LOCK TABLES `base_account` WRITE;
/*!40000 ALTER TABLE `base_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_account_pwdlog`
--

DROP TABLE IF EXISTS `base_account_pwdlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_account_pwdlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL COMMENT '资源ID',
  `resource_name_cn` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '资源名称',
  `resource_ip` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '资源IP',
  `account_id` int(11) DEFAULT NULL COMMENT '账号ID',
  `account_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '账号名称',
  `password` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `en_key` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '密钥',
  `time` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_account_pwdlog`
--

LOCK TABLES `base_account_pwdlog` WRITE;
/*!40000 ALTER TABLE `base_account_pwdlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_account_pwdlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_account_user`
--

DROP TABLE IF EXISTS `base_account_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_account_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `base_account_user_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `base_account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `base_account_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_account_user`
--

LOCK TABLES `base_account_user` WRITE;
/*!40000 ALTER TABLE `base_account_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_account_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_resource`
--

DROP TABLE IF EXISTS `base_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '资产名称，英文',
  `name_cn` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '资产名称，中文',
  `ip` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'ip地址',
  `res_type` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '资产类型',
  `remark` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `data_status` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_resource`
--

LOCK TABLES `base_resource` WRITE;
/*!40000 ALTER TABLE `base_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_resource_app`
--

DROP TABLE IF EXISTS `base_resource_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_resource_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `app_id` int(11) DEFAULT NULL,
  `data_status` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resource_id` (`resource_id`),
  KEY `app_id` (`app_id`),
  CONSTRAINT `base_resource_app_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `base_resource` (`id`) ON DELETE CASCADE,
  CONSTRAINT `base_resource_app_ibfk_2` FOREIGN KEY (`app_id`) REFERENCES `fort_app` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_resource_app`
--

LOCK TABLES `base_resource_app` WRITE;
/*!40000 ALTER TABLE `base_resource_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_resource_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_resource_app_attr`
--

DROP TABLE IF EXISTS `base_resource_app_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_resource_app_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_app_id` int(11) DEFAULT NULL,
  `attr_name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `attr_val` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resource_app_id` (`resource_app_id`),
  CONSTRAINT `base_resource_app_attr_ibfk_1` FOREIGN KEY (`resource_app_id`) REFERENCES `base_resource_app` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_resource_app_attr`
--

LOCK TABLES `base_resource_app_attr` WRITE;
/*!40000 ALTER TABLE `base_resource_app_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_resource_app_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fort_acc`
--

DROP TABLE IF EXISTS `fort_acc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fort_acc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fort_id` int(11) DEFAULT NULL COMMENT '图堡ID',
  `username` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '图堡账号',
  `password` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `pwd_update_time` datetime DEFAULT NULL COMMENT '密码修改时间',
  `assigned_time` datetime DEFAULT NULL COMMENT '账号分配时间',
  `assigned_session_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '当前分配的运维会话ID',
  `s_session_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '运行时：会话名',
  `s_session_id` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '运行时：会话ID',
  `s_status` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '运行时：状态',
  `s_rest_time` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '运行时：空闲时间',
  `s_login_time` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '运行时：登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1382 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fort_acc`
--

LOCK TABLES `fort_acc` WRITE;
/*!40000 ALTER TABLE `fort_acc` DISABLE KEYS */;
/*!40000 ALTER TABLE `fort_acc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fort_app`
--

DROP TABLE IF EXISTS `fort_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fort_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_type` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '工具类型',
  `name_cn` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '工具中文名称',
  `link_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '堡垒机上应用快捷方式名称',
  `icon_img` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '页面展示图标',
  `parameter` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '运行参数',
  `data_status` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fort_app`
--

LOCK TABLES `fort_app` WRITE;
/*!40000 ALTER TABLE `fort_app` DISABLE KEYS */;
INSERT INTO `fort_app` VALUES (1,'CMDLINE','记事本','notepad',NULL,'notepad','DISABLED'),(3,'CMDLINE','PUTTY','putty',NULL,'putty -pw {{password}} {{accname}}@{{ip}} -P {{port}}','ENABLED'),(4,'CMDLINE','RDP','rdp',NULL,'rdp /v:{{ip}}:{{port}} /u:{{accname}} /p:{{password}} /nodrives /noprinters /fit','ENABLED'),(5,'CMDLINE','WinSCP','winscp',NULL,'winscp ftp://{{accname}}:{{password}}@{{ip}}:{{port}}','ENABLED'),(9,'CMDLINE','SecureCRT','SecureCRT',NULL,'crt /SSH2 {{accname}}@ {{ip}} /PASSWORD {{password}} /P {{port}}','ENABLED');
/*!40000 ALTER TABLE `fort_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fort_res`
--

DROP TABLE IF EXISTS `fort_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fort_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fort_ip` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '图堡IP',
  `fort_ip_wan` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '图堡外网IP',
  `mstsc_port` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT 'mstsc端口',
  `servmgr_port` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '图堡管理服务端口',
  `running_status` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '运行状态',
  `servmgr_syn_time` datetime DEFAULT NULL COMMENT '最近一次通讯时间',
  `data_status` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fort_res`
--

LOCK TABLES `fort_res` WRITE;
/*!40000 ALTER TABLE `fort_res` DISABLE KEYS */;
/*!40000 ALTER TABLE `fort_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fort_session_record`
--

DROP TABLE IF EXISTS `fort_session_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fort_session_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '会话ID',
  `fort_id` int(11) DEFAULT NULL COMMENT '对应图堡ID',
  `acc_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '对应图堡账号名',
  `app_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '工具名称',
  `is_record` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '是否有录像',
  `ex_time` datetime DEFAULT NULL COMMENT '执行时间',
  `ex_status` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '执行状态',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fort_session_record`
--

LOCK TABLES `fort_session_record` WRITE;
/*!40000 ALTER TABLE `fort_session_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `fort_session_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_function`
--

DROP TABLE IF EXISTS `sys_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  `data_status` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_function`
--

LOCK TABLES `sys_function` WRITE;
/*!40000 ALTER TABLE `sys_function` DISABLE KEYS */;
INSERT INTO `sys_function` VALUES (1,4,'ALL',1,'ENABLED'),(2,6,'ALL',1,'ENABLED'),(3,5,'ALL',1,'ENABLED'),(4,149,'ALL',1,'ENABLED'),(5,141,'ALL',1,'ENABLED'),(6,145,'ALL',1,'ENABLED'),(7,142,'ALL',1,'ENABLED'),(8,144,'ALL',1,'ENABLED'),(9,147,'ALL',1,'ENABLED'),(10,148,'ALL',1,'ENABLED'),(11,1,'进入首页',1,'ENABLED');
/*!40000 ALTER TABLE `sys_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_legal_source`
--

DROP TABLE IF EXISTS `sys_legal_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_legal_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '合法源ip',
  `scope_type` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '目标范围类型',
  `scope_target` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '目标用户名',
  `des` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `data_status` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_legal_source`
--

LOCK TABLES `sys_legal_source` WRITE;
/*!40000 ALTER TABLE `sys_legal_source` DISABLE KEYS */;
INSERT INTO `sys_legal_source` VALUES (1,'127.0.0.1','ALL',NULL,'本地访问','ENABLED');
/*!40000 ALTER TABLE `sys_legal_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logs`
--

DROP TABLE IF EXISTS `sys_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `source_ip` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `action` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `ex_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logs`
--

LOCK TABLES `sys_logs` WRITE;
/*!40000 ALTER TABLE `sys_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  `data_status` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,0,'首页','/bin/dashboard',1,'ENABLED'),(2,0,'系统管理',NULL,100,'ENABLED'),(3,0,'软件维护',NULL,200,'ENABLED'),(4,2,'用户','/sys/priv/user/list',1,'ENABLED'),(5,2,'操作日志','/sys/priv/syslog/list',3,'ENABLED'),(6,2,'访问源','/sys/priv/legalsource/list',2,'ENABLED'),(7,3,'角色','/sys/priv/role/list',1,'ENABLED'),(8,3,'菜单','/sys/priv/menu/list',3,'ENABLED'),(9,3,'功能','/sys/priv/function/list',5,'ENABLED'),(140,0,'堡垒机',NULL,50,'ENABLED'),(141,140,'堡垒机配置','/fort/fortres/list',5,'ENABLED'),(142,140,'运维工具','/fort/app/list',15,'ENABLED'),(144,140,'历史运维会话','/fort/fortsessionrecord/list',30,'ENABLED'),(145,140,'堡垒机账号监控','/fort/fortacc/list',10,'ENABLED'),(146,0,'资源',NULL,20,'ENABLED'),(147,146,'资源管理','/portal/resource/list',1,'ENABLED'),(148,146,'账号管理','/portal/account/list',2,'ENABLED'),(149,140,'堡垒机总览','/fort/fortview/view',1,'ENABLED');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_method`
--

DROP TABLE IF EXISTS `sys_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `func_id` int(11) DEFAULT NULL,
  `controller` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `method` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `name_cn` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_method`
--

LOCK TABLES `sys_method` WRITE;
/*!40000 ALTER TABLE `sys_method` DISABLE KEYS */;
INSERT INTO `sys_method` VALUES (1,1,'sys.privilege.controller.UserController','add','进入新增用户页面'),(2,1,'sys.privilege.controller.UserController','list','进入用户列表页面'),(3,1,'sys.privilege.controller.UserController','refreshPwdInvoke','重置用户密码'),(4,1,'sys.privilege.controller.UserController','saveInvoke','新增用户'),(5,1,'sys.privilege.controller.UserController','unlockInvoke','解锁用户'),(6,1,'sys.privilege.controller.UserController','statusInvoke','用户数据状态改变'),(7,1,'sys.privilege.controller.UserController','updateInvoke','修改用户'),(8,1,'sys.privilege.controller.UserController','edit','进入修改用户页面'),(9,1,'sys.privilege.controller.UserController','listInvoke','用户列表查询'),(10,2,'sys.privilege.controller.LegalSourceController','add','进入新增访问源页面'),(11,2,'sys.privilege.controller.LegalSourceController','list','进入访问源列表页面'),(12,2,'sys.privilege.controller.LegalSourceController','saveInvoke','新增访问源'),(13,2,'sys.privilege.controller.LegalSourceController','statusInvoke','访问源数据状态改变'),(14,2,'sys.privilege.controller.LegalSourceController','listInvoke','访问源列表查询'),(15,3,'sys.privilege.controller.SysLogController','list','进入操作日志页面'),(16,3,'sys.privilege.controller.SysLogController','listInvoke','操作日志列表查询'),(17,4,'fort.controller.FortViewController','view','进入首页'),(18,5,'fort.controller.FortResController','add','进入新增服务器页面'),(19,5,'fort.controller.FortResController','list','进入服务器列表页面'),(20,5,'fort.controller.FortResController','servmgrServiceStopInvoke','停止图堡管理服务'),(21,5,'fort.controller.FortResController','servmgrServiceStartInvoke','启动图堡管理服务'),(22,5,'fort.controller.FortResController','statusInvoke','数据状态改变'),(23,5,'fort.controller.FortResController','edit','进入修改服务器页面'),(24,5,'fort.controller.FortResController','listInvoke','服务器列表查询'),(25,5,'fort.controller.FortResController','editInvoke','修改服务器'),(26,5,'fort.controller.FortResController','addInvoke','新增服务器'),(27,6,'fort.controller.FortAccController','list','进入图堡账号列表页面'),(28,6,'fort.controller.FortAccController','closeSessionInvoke','断开会话'),(29,6,'fort.controller.FortAccController','changePwdAllInvoke','修改本页所有图堡账号密码'),(30,6,'fort.controller.FortAccController','changePwdInvoke','修改图堡账号密码'),(31,6,'fort.controller.FortAccController','listInvoke','图堡账号列表查询'),(32,7,'fort.controller.AppController','run','进入测试运行页面'),(33,7,'fort.controller.AppController','add','进入新增运维工具页面'),(34,7,'fort.controller.AppController','list','进入运维工具列表页面'),(35,7,'fort.controller.AppController','statusInvoke','数据状态改变'),(36,7,'fort.controller.AppController','edit','进入修改运维工具页面'),(37,7,'fort.controller.AppController','listInvoke','运维工具列表查询'),(38,7,'fort.controller.AppController','editInvoke','修改运维工具'),(39,7,'fort.controller.AppController','addInvoke','新增运维工具'),(40,7,'fort.controller.AppController','runInvoke','测试运行'),(41,8,'fort.controller.FortSessionRecordController','list','进入历史运维会话页面'),(42,8,'fort.controller.FortSessionRecordController','delRecordInvoke','删除录像'),(43,8,'fort.controller.FortSessionRecordController','listInvoke','历史运维会话查询'),(44,8,'fort.controller.FortSessionRecordController','playInvoke','播放录像'),(45,9,'portal.controller.ResourceController','add','进入新增资源页面'),(46,9,'portal.controller.ResourceController','list','进入资源管理页面'),(47,9,'portal.controller.ResourceController','statusInvoke','数据状态改变'),(48,9,'portal.controller.ResourceController','edit','进入修改资源页面'),(49,9,'portal.controller.ResourceController','listInvoke','资源列表查询'),(50,9,'portal.controller.ResourceController','editInvoke','修改资源'),(51,9,'portal.controller.ResourceController','addInvoke','新增资源'),(52,9,'portal.controller.ResourceAppController','add','进入新增资源工具页面'),(53,9,'portal.controller.ResourceAppController','list','进入资源工具列表页面'),(54,9,'portal.controller.ResourceAppController','appListInvoke','运维工具下拉列表查询'),(55,9,'portal.controller.ResourceAppController','statusInvoke','数据状态改变'),(56,9,'portal.controller.ResourceAppController','listInvoke','资源工具列表查询'),(57,9,'portal.controller.ResourceAppController','addInvoke','新增资源工具'),(58,10,'portal.controller.AccountController','add','进入新增账号页面'),(59,10,'portal.controller.AccountController','list','进入账号管理页面'),(60,10,'portal.controller.AccountController','resourceListInvoke','资源下拉列表查询'),(61,10,'portal.controller.AccountController','setPwdInvoke','手动设置账号密码'),(62,10,'portal.controller.AccountController','statusInvoke','数据状态改变'),(63,10,'portal.controller.AccountController','listInvoke','账号列表查询'),(64,10,'portal.controller.AccountController','addInvoke','新增账号'),(65,10,'portal.controller.AccountUserController','list','进入所有者管理页面'),(66,10,'portal.controller.AccountUserController','statusInvoke','用户授权'),(67,10,'portal.controller.AccountUserController','listInvoke','所有者查询'),(68,11,'sys.index.controller.BinController','dashboard','进入首页');
/*!40000 ALTER TABLE `sys_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `data_status` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'系统管理员','ENABLED'),(2,'普通用户','ENABLED');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_priv`
--

DROP TABLE IF EXISTS `sys_role_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_priv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `res_id` int(11) DEFAULT NULL,
  `res_type` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_priv`
--

LOCK TABLES `sys_role_priv` WRITE;
/*!40000 ALTER TABLE `sys_role_priv` DISABLE KEYS */;
INSERT INTO `sys_role_priv` VALUES (12,1,1,'menu'),(13,1,11,'function'),(14,1,146,'menu'),(15,1,147,'menu'),(16,1,9,'function'),(17,1,148,'menu'),(18,1,10,'function'),(19,1,140,'menu'),(20,1,149,'menu'),(21,1,4,'function'),(22,1,141,'menu'),(23,1,5,'function'),(24,1,145,'menu'),(25,1,6,'function'),(26,1,142,'menu'),(27,1,7,'function'),(28,1,144,'menu'),(29,1,8,'function'),(30,1,2,'menu'),(31,1,4,'menu'),(32,1,1,'function'),(33,1,6,'menu'),(34,1,2,'function'),(35,1,5,'menu'),(36,1,3,'function'),(37,2,1,'menu'),(38,2,11,'function');
/*!40000 ALTER TABLE `sys_role_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `name_cn` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `mail` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `data_status` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','超级管理员','p2z46BfiB1I=',NULL,NULL,NULL,'ENABLED'),(2,'tm_huangtaiguo','黄太国','ZstQnm4QjrMbnzNi+bW+CA==',NULL,'13438360143',NULL,'ENABLED');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (6,2,1),(7,2,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-21 14:17:14
