/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.7.3-m13 : Database - z810
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`z810` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `z810`;

/*Table structure for table `a综合测试学到的知识点` */

DROP TABLE IF EXISTS `a综合测试学到的知识点`;

CREATE TABLE `a综合测试学到的知识点` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试BaseServce,AjaxSetup,拦截器权限管理..顺便进行集群部署';

/*Data for the table `a综合测试学到的知识点` */

/*Table structure for table `t_resource` */

DROP TABLE IF EXISTS `t_resource`;

CREATE TABLE `t_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(26) DEFAULT NULL COMMENT '资源名称',
  `permission` varchar(26) DEFAULT NULL COMMENT '资源标识(暂时没用,url代替功能)',
  `icon` varchar(36) DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(66) DEFAULT NULL COMMENT '路径',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型(0菜单,1路径)',
  `pid` int(11) DEFAULT '0' COMMENT '父级id',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `rank` int(11) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='资源表(包括菜单和路径链接)';

/*Data for the table `t_resource` */

insert  into `t_resource`(`id`,`name`,`permission`,`icon`,`url`,`type`,`pid`,`remarks`,`rank`) values (7,'运维管理',NULL,'fa fa-archive','..',0,0,'主要负责系统设置相关工作<br/>\r\n为用户分配角色,系统管理',0),(8,'用户管理',NULL,'fa fa-user','/page/user',0,7,'',0),(9,'日志管理',NULL,'fa fa-window-maximize','',0,0,'',0),(10,'登录日志',NULL,'fa fa-battery','/page/loginLog',1,9,'',0),(11,'访问日志',NULL,'fa fa-battery','/page/log',0,9,'',0),(12,'数据库日志',NULL,'fa fa-battery','/page/druid',0,9,'',0),(13,'资源管理',NULL,'fa fa-arrows-v','page/resource',0,7,'系统资源路径的管理,一般只有超级管理员才有相关权限',0),(14,'资源树',NULL,'fa fa-asterisk','/reource/getTreeNodes',1,13,'获取左边的资源树',0),(15,'百度一下',NULL,'','http://www.baidu.com',0,0,'',0),(16,'物业管理',NULL,'','http://www.baidu.com',0,0,'',0),(17,'小区管理',NULL,'','http://www.baidu.com',0,0,'',0);

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `role_level` tinyint(4) DEFAULT NULL COMMENT '角色等级(分级授权系统)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `rank` tinyint(4) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`role_name`,`role_level`,`create_time`,`remarks`,`rank`) values (1,'普通运维人员',31,'2018-08-08 00:00:00','专业的运维人员使用的角色',31),(2,'',11,'2018-08-16 00:00:00','',0),(3,'系统管理员',21,'2018-08-16 00:00:00','',21),(4,'游客',111,'2018-08-16 00:00:00','最低级权限的人员\r\n',111),(5,'333',NULL,'2018-08-16 00:00:00','',NULL),(6,'4444',4,'2018-08-16 00:00:00','4444',44),(13,'ds',12,'2018-08-16 00:00:00','',21),(14,'ds',NULL,'2018-08-16 15:54:31','',NULL),(15,'ds',13,'2018-08-16 00:00:00','1313131313',13),(16,'ds2',14,'2018-08-16 00:00:00','1411414141',14),(18,'423',NULL,'2018-08-16 15:57:20','',NULL),(19,'321',NULL,'2018-08-16 16:01:08','',NULL),(20,'132',NULL,'2018-08-16 16:10:01','',NULL),(21,'222',NULL,'2018-08-16 16:10:22','',NULL),(22,'321',NULL,'2018-08-16 16:11:19','',NULL),(23,'321',NULL,'2018-08-16 16:13:32','',NULL),(24,'122112',NULL,'2018-08-16 16:13:49','',3),(25,'ewq',NULL,'2018-08-16 16:14:36','',NULL),(26,'ewq',NULL,'2018-08-16 16:14:36','',NULL),(27,'ewq',NULL,'2018-08-16 16:14:39','',NULL),(28,'ewq',NULL,'2018-08-16 16:14:39','',NULL),(29,'ewq',NULL,'2018-08-16 16:14:39','',NULL),(30,'ewq',NULL,'2018-08-16 16:14:39','',NULL),(31,'1233',NULL,'2018-08-16 16:21:09','',NULL),(32,'1233321',NULL,'2018-08-16 16:21:13','',NULL),(33,'1233321',NULL,'2018-08-16 16:21:13','',NULL),(34,'1233321',NULL,'2018-08-16 16:21:13','',NULL),(35,'432432',NULL,'2018-08-16 16:21:18','',NULL),(36,'432432',NULL,'2018-08-16 16:21:18','',NULL),(37,'dasdsa',NULL,'2018-08-16 16:22:30','',NULL),(38,'dasdsa',NULL,'2018-08-16 16:22:30','',NULL),(39,'dasdsa',NULL,'2018-08-16 16:22:30','',NULL),(40,'dasdsa',NULL,'2018-08-16 16:22:30','',NULL),(41,'dddd',NULL,'2018-08-16 16:22:58','',NULL),(42,'dddd',NULL,'2018-08-16 00:00:00','',3),(44,'dddd',NULL,'2018-08-16 16:22:58','',NULL),(45,'dddd',2,'2018-08-16 16:23:06','',NULL),(46,'12',1,'2018-08-16 00:00:00','1',1),(64,'普通游客呃',NULL,'2018-08-16 17:20:34','',NULL),(65,NULL,NULL,'2018-08-17 15:25:57','',0);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `password` char(32) DEFAULT NULL COMMENT '密码',
  `realname` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `sex` char(1) DEFAULT '男' COMMENT '性别',
  `enabled` tinyint(4) DEFAULT '0' COMMENT '状态0不可用 1 可用',
  `role_id` int(11) DEFAULT NULL COMMENT '角色',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `rank` tinyint(4) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`username`,`password`,`realname`,`sex`,`enabled`,`role_id`,`create_time`,`remarks`,`rank`) values (48,'','','郑德超','男',0,NULL,'2018-08-16 18:04:26','',NULL),(49,'11111','','郑晶晶','女',0,NULL,'2018-08-16 00:00:00','',NULL),(50,'22222','','阿迪街','女',0,NULL,'2018-08-16 00:00:00','',NULL),(51,'111111','','郑远莉','女',0,NULL,'2018-08-16 00:00:00','',NULL),(52,'','','杨航','女',0,NULL,'2018-08-16 18:04:56','',NULL),(53,'','','杨哥','女',0,NULL,'2018-08-16 18:05:01','',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
