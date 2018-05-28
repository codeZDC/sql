/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.7.19 : Database - bijie
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bijie` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bijie`;

/*Table structure for table `cgw_record` */

DROP TABLE IF EXISTS `cgw_record`;

CREATE TABLE `cgw_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_id` int(11) DEFAULT NULL COMMENT '申请id',
  `status` tinyint(1) DEFAULT NULL COMMENT '0审核中 1驳回 2通过  5未查看',
  `department_id` int(11) DEFAULT NULL COMMENT '部门',
  `user_id` int(11) DEFAULT NULL COMMENT '用户',
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='城规委审核记录表';

/*Data for the table `cgw_record` */

insert  into `cgw_record`(`id`,`apply_id`,`status`,`department_id`,`user_id`,`start_time`,`end_time`,`remarks`) values (1,1,2,2,NULL,'2018-04-03',NULL,NULL),(2,1,NULL,3,NULL,'2018-04-03',NULL,NULL),(3,1,NULL,4,NULL,'2018-04-03',NULL,NULL),(5,22,0,8,NULL,NULL,NULL,NULL);

/*Table structure for table `t_apply` */

DROP TABLE IF EXISTS `t_apply`;

CREATE TABLE `t_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请标识id',
  `project_name` varchar(20) DEFAULT NULL COMMENT '申请项目名称',
  `apply_name` varchar(20) DEFAULT NULL COMMENT '申请人',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `apply_type_id` int(11) DEFAULT NULL COMMENT '申请类型',
  `apply_state` int(1) DEFAULT '0' COMMENT '申请状态:0=审核中,1=驳回,2=已通过;',
  `department_id` int(11) DEFAULT NULL COMMENT '申请提交部门id',
  `user_id` int(11) DEFAULT NULL COMMENT '该申请提交人id',
  `current_department_id` int(11) DEFAULT '0' COMMENT '当前审核部门id',
  `process_number` int(11) DEFAULT NULL COMMENT '流程编号',
  `remarks` varchar(50) DEFAULT NULL COMMENT '备注',
  `expiration_status` int(1) DEFAULT '0' COMMENT '是否过期:0=否,1=是',
  `expiration_time` datetime DEFAULT NULL COMMENT '过期时间',
  `expiration_remarks` varchar(50) DEFAULT NULL COMMENT '过期说明',
  `status` int(11) DEFAULT '1' COMMENT '是否可用 1是 0否',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间及创建时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `urls` text COMMENT '图片的地址们',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='申请';

/*Data for the table `t_apply` */

insert  into `t_apply`(`id`,`project_name`,`apply_name`,`apply_time`,`apply_type_id`,`apply_state`,`department_id`,`user_id`,`current_department_id`,`process_number`,`remarks`,`expiration_status`,`expiration_time`,`expiration_remarks`,`status`,`start_time`,`end_time`,`urls`) values (6,'观山湖城区','王','2017-11-24 00:00:00',102,1,1,21,0,NULL,'驳回',0,NULL,NULL,1,'2017-11-24 18:13:41','2017-11-24 18:22:37','/static/upload/5644db2d0bc7495a81b2a5a49c30bb43.jpg'),(7,'规划设计测试','杨智博','2017-11-24 00:00:00',102,0,1,21,9,NULL,'好',0,NULL,NULL,1,'2017-11-24 18:30:39','2017-11-24 18:30:39','/static/upload/baae6226b0a54110b5367c298c44ae67.jpg'),(8,'规划申请','规划人','2017-11-24 00:00:00',100,0,1,21,3,NULL,'',0,NULL,NULL,1,'2017-11-24 19:03:59','2017-11-24 19:03:59','/static/upload/22c91014c1e44ce793eea3ca97856341.jpg'),(9,'选择申请','选之人','2017-11-24 00:00:00',101,2,1,21,0,NULL,'资料不齐全',0,NULL,NULL,1,'2017-11-24 19:09:36','2017-11-24 19:10:26','/static/upload/210f59dcfcb648fd80a978c2b21ae404.jpg'),(10,'城规申请','城规人','2017-11-24 00:00:00',102,1,1,21,0,NULL,'资料不齐全',0,NULL,NULL,1,'2017-11-24 19:10:45','2017-11-24 19:11:51','/static/upload/69824530523249ce80a9ee626d2ee421.jpg'),(11,'用地申请','用敌人','2017-06-24 00:00:00',103,2,1,21,0,NULL,'无',0,NULL,NULL,1,'2017-11-24 19:13:46','2017-11-24 19:15:39','/static/upload/abf18911cf7943058dc572095793e139.jpg'),(12,'建设申请','两个人','2017-11-24 00:00:00',104,0,1,21,15,NULL,'',0,NULL,NULL,1,'2017-11-24 19:14:22','2017-11-24 19:14:22','/static/upload/f8d1f70966ee49e790ae3d2e7b8c19e5.jpg'),(13,'规划申请','规人','2017-01-24 00:00:00',105,0,1,21,15,NULL,'',0,NULL,NULL,1,'2017-11-24 19:14:50','2017-11-24 19:14:50','/static/upload/e17da102496a4e39acc2fb21e6d520d0.jpg'),(15,'十一月二十八测试','测试人员','2017-11-28 00:00:00',100,0,1,28,4,NULL,'',0,NULL,NULL,1,'2017-11-28 10:46:18','2017-11-28 10:46:18','/static/upload/b020e8b0ba11474ca5fb15f49dff6a48.jpg,/static/upload/bb5afd47bfc949afa92be67a44abad62.jpg'),(16,'1','？？','2017-11-28 00:00:00',100,0,1,28,4,NULL,'',0,NULL,NULL,1,'2017-11-28 17:03:54','2017-11-28 17:03:54','/static/upload/9a9180b702f64ebf9f648bd82b172234.jpg'),(17,'111','111','2017-11-28 00:00:00',103,2,1,28,0,NULL,'OK',0,NULL,NULL,1,'2017-11-28 17:10:00','2017-11-28 17:20:25','/static/upload/4a899cb8491e482990b8b15d871f19df.jpg'),(18,'测试','杨智博','2017-12-03 00:00:00',100,1,1,28,0,NULL,'附件不齐全',0,NULL,NULL,1,'2017-12-03 12:16:34','2017-12-03 12:18:39','/static/upload/69e408ebb184435ca95a756aa525e761.jpg'),(19,'规划条件测试','杨智博','2017-12-03 00:00:00',100,1,1,28,0,NULL,'附件不齐全',0,NULL,NULL,1,'2017-12-03 16:26:35','2017-12-03 16:28:20','/static/upload/c36336e0b0ff4ca39406cb84bb224d6b.jpg'),(20,'v皇冠夫妇','u体验服有人','2018-04-03 00:00:00',100,0,1,28,3,NULL,'',0,NULL,NULL,1,'2018-04-03 18:45:42','2018-04-03 18:45:42','/static/upload/46fe8017853644b58646f6df92bd4d8a.png'),(21,'测试冯沟沟壑壑','杨智博','2018-04-03 00:00:00',103,2,1,28,0,NULL,'了了了了了了',0,NULL,NULL,1,'2018-04-03 18:54:52','2018-04-03 21:04:04','/static/upload/db55c56ebda94f4bb5e688c5c419de25.png'),(22,'用地测试','阿迪','2018-04-04 00:00:00',103,0,1,28,8,NULL,'无',0,NULL,NULL,1,'2018-04-04 09:49:43','2018-04-04 09:52:02','/static/upload/22c823f6286c4998899aa0576bbd78a3.jpg'),(23,'四月份测试一','郑德cao','2018-04-04 00:00:00',103,0,1,28,7,NULL,'',0,NULL,NULL,1,'2018-04-04 09:53:47','2018-04-04 09:53:47','/static/upload/3c3e1294bd9d48b1b8c207c3724cf726.jpg');

/*Table structure for table `t_apply_type` */

DROP TABLE IF EXISTS `t_apply_type`;

CREATE TABLE `t_apply_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请类型id',
  `name` varchar(20) DEFAULT NULL COMMENT '申请类型名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '可用状态 1可用 0不可用',
  `remarks` varchar(100) DEFAULT NULL COMMENT '申请类型备注',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='申请文件类型';

/*Data for the table `t_apply_type` */

insert  into `t_apply_type`(`id`,`name`,`status`,`remarks`,`created_time`) values (100,'规划条件',1,'','2017-10-30 16:58:57'),(101,'选址意见',1,'','2017-10-30 16:58:59'),(102,'城规委评审审查',1,'','2017-10-30 16:59:00'),(103,'用地规划',1,'','2017-10-30 16:59:02'),(104,'建设工程',1,'','2017-10-30 16:59:04'),(105,'规划验线',1,'','2017-10-30 16:59:05'),(106,'竣工规划',1,'对已经竣工的项目进行后期规划','2017-10-30 16:59:07');

/*Table structure for table `t_department` */

DROP TABLE IF EXISTS `t_department`;

CREATE TABLE `t_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `name` varchar(20) DEFAULT NULL COMMENT '部门名称',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `t_department` */

insert  into `t_department`(`id`,`name`,`remarks`,`created_time`) values (1,'行政审批科','','2017-11-08 10:03:20'),(3,'市政公用设施与交通规划科','','2017-11-08 11:03:22'),(4,'规划发展科',NULL,'2017-11-08 11:03:22'),(5,'县乡规划管理科',NULL,'2017-11-08 11:03:22'),(6,'市政科',NULL,'2017-11-08 11:03:22'),(7,'用地科',NULL,'2017-11-08 11:03:22'),(8,'专家会',NULL,'2017-11-08 11:03:22'),(9,'专题会',NULL,'2017-11-08 11:03:22'),(10,'副主任审核',NULL,'2017-11-08 11:03:22'),(11,'主任','主任','2017-11-08 11:03:22'),(12,'技术审查中心','审查中心 + 是','2017-11-08 11:03:22'),(13,'法规科','法规科','2017-11-08 11:03:22'),(14,'工程科','工程科','2017-11-08 11:03:22'),(15,'执法支队','','2017-11-08 11:03:22'),(16,'副主任审定','','2017-11-08 15:42:41'),(17,'城规委','城乡规划委员会','2018-04-03 10:12:07'),(18,'副主任会','','2018-04-03 14:38:47'),(19,'会议评定','','2018-04-03 14:39:05'),(20,'主任会议评定','','2018-04-03 14:39:15'),(21,'主任会签评定','','2018-04-03 14:39:27'),(22,'会签评定','','2018-04-03 14:39:35');

/*Table structure for table `t_menu` */

DROP TABLE IF EXISTS `t_menu`;

CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '菜单的名称',
  `description` varchar(100) DEFAULT NULL COMMENT '菜单的描述',
  `order_num` int(11) DEFAULT NULL COMMENT '优先级排序管理',
  `pid` int(11) DEFAULT NULL COMMENT '菜单的父级目录id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `t_menu` */

insert  into `t_menu`(`id`,`name`,`description`,`order_num`,`pid`) values (14,'管理员管理','&#xe62d;',44,0),(16,'系统管理','&#xe62e;',33,0),(20,'用户信息','',11,16),(21,'部门信息','',22,16),(22,'文件分类','',33,16),(23,'资源管理','',44,14),(26,'主页','欢迎页面',0,0),(27,'角色管理','二级菜单',22,14),(28,'用户角色','二级菜单',11,14),(29,'菜单管理','',33,14),(30,'流程管理','&#xe636;',22,0),(31,'申请管理','',11,30),(32,'流程配置','',33,30),(33,'审核记录','',22,30),(34,'操作指南','&#xe603;',1,0),(35,'用户手册','用户使用说明',1,34);

/*Table structure for table `t_process` */

DROP TABLE IF EXISTS `t_process`;

CREATE TABLE `t_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `apply_type_id` int(11) DEFAULT NULL COMMENT '申请分类id',
  `process_value` varchar(50) DEFAULT NULL COMMENT '流程配置值',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='流程配置表';

/*Data for the table `t_process` */

insert  into `t_process`(`id`,`apply_type_id`,`process_value`,`remarks`) values (1,100,'1-4/3-1','1-3-1,1-4-1'),(2,101,'1-4/5/6/4x17x4/5x17x5/6x17x6-1','1-4-1,1-5-1,1-6-1,1-4-17-4-1,1-5-17-5-1,1-6-17-6-1'),(3,102,'1-6x17x6/7x12x7x17x7-1','1-6-17-6-1,1-7-12-7-17-7'),(4,103,'1-6/6x17x6/7/7x12x7/7x12x7x17x7/7x17x7-1','1-6-1,1-6-17-6-1,1-7-1,1-7-12-7-17-7-1,1-7-12-7-1,1-7-17-7-1'),(5,104,'1-14x12x14x17x14/6x17x6-1','1-6-17-6-1,1-14-12-14-17-14-1'),(6,105,'1-15-1','1-15-1'),(7,106,'1-15-1','1-15-1'),(8,109,'1-1-1',NULL);

/*Table structure for table `t_process_record` */

DROP TABLE IF EXISTS `t_process_record`;

CREATE TABLE `t_process_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流程标识',
  `apply_id` int(11) DEFAULT NULL COMMENT '申请id',
  `department_id` int(11) DEFAULT NULL COMMENT '处理部门',
  `user_id` int(11) DEFAULT NULL COMMENT '处理人id',
  `status` int(11) DEFAULT '1' COMMENT '0审核中 1驳回 2通过 3申请 -1删除',
  `total_status` int(1) DEFAULT '1' COMMENT '总状态是否通过 1通过  0驳回  -1删除',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `remarks` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='这是一个流程记录表格';

/*Data for the table `t_process_record` */

insert  into `t_process_record`(`id`,`apply_id`,`department_id`,`user_id`,`status`,`total_status`,`start_time`,`end_time`,`remarks`) values (13,6,1,21,3,1,'2017-11-24 18:13:41','2017-11-24 18:13:41',''),(14,6,6,27,2,1,'2017-11-24 18:14:45','2017-11-24 18:14:51','通过'),(15,6,8,24,2,1,'2017-11-24 18:18:33','2017-11-24 18:18:48','xx\n'),(16,6,10,25,2,1,'2017-11-24 18:21:14','2017-11-24 18:21:15','无'),(17,6,11,26,1,1,'2017-11-24 18:22:23','2017-11-24 18:22:37','驳回'),(18,7,1,21,3,1,'2017-11-24 18:30:39','2017-11-24 18:30:39',''),(19,7,6,22,2,1,'2017-11-24 18:41:29','2017-11-24 18:47:10','无'),(20,7,8,31,2,1,'2017-11-24 19:15:56','2017-11-28 17:31:32','好'),(21,8,1,21,3,1,'2017-11-24 19:03:59','2017-11-24 19:03:59',''),(22,8,3,NULL,0,1,'2017-11-24 19:24:22',NULL,NULL),(23,9,1,21,3,1,'2017-11-24 19:09:36','2017-11-24 19:09:36',''),(24,9,6,22,2,1,'2017-11-24 19:09:54','2017-11-24 19:10:26','资料不齐全'),(25,10,1,21,3,1,'2017-11-24 19:10:45','2017-11-24 19:10:45',''),(26,10,6,22,1,1,'2017-11-24 19:11:35','2017-11-24 19:11:51','资料不齐全'),(27,11,1,21,3,1,'2017-11-24 19:13:46','2017-11-24 19:13:46',''),(28,11,6,22,2,1,'2017-11-24 19:14:01','2017-11-24 19:15:39','无'),(29,12,1,21,3,1,'2017-11-24 19:14:22','2017-11-24 19:14:22',''),(30,12,15,NULL,5,1,NULL,NULL,NULL),(31,13,1,21,3,1,'2017-11-24 19:14:50','2017-11-24 19:14:50',''),(32,13,15,NULL,0,1,'2017-11-28 21:14:26',NULL,NULL),(35,15,1,28,3,1,'2017-11-28 10:46:18','2017-11-28 10:46:18',''),(36,15,4,NULL,5,1,NULL,NULL,NULL),(37,16,1,28,3,1,'2017-11-28 17:03:54','2017-11-28 17:03:54',''),(38,16,4,NULL,0,1,'2017-12-03 12:19:45',NULL,NULL),(39,17,1,28,3,1,'2017-11-28 17:10:00','2017-11-28 17:10:00',''),(40,17,7,35,2,1,'2017-11-28 17:20:16','2017-11-28 17:20:25','OK'),(41,7,9,NULL,5,1,NULL,NULL,NULL),(42,18,1,28,3,1,'2017-12-03 12:16:34','2017-12-03 12:16:34',''),(43,18,4,29,1,1,'2017-12-03 12:17:43','2017-12-03 12:18:39','附件不齐全'),(44,19,1,28,3,1,'2017-12-03 16:26:35','2017-12-03 16:26:35',''),(45,19,4,29,1,1,'2017-12-03 16:28:04','2017-12-03 16:28:20','附件不齐全'),(46,20,1,28,3,1,'2018-04-03 18:45:42','2018-04-03 18:45:42',''),(47,20,3,NULL,5,1,NULL,NULL,NULL),(48,21,1,28,3,1,'2018-04-03 18:54:52','2018-04-03 18:54:52',''),(52,21,7,35,2,1,'2018-04-03 20:57:53','2018-04-03 21:04:04','了了了了了了'),(53,21,12,33,2,1,'2018-04-03 21:03:20','2018-04-03 21:03:26','唱歌v图长途候车厅惠风和畅吐槽福'),(54,21,7,35,2,1,'2018-04-03 21:03:45','2018-04-03 21:04:04','了了了了了了'),(55,22,1,28,3,1,'2018-04-04 09:49:43','2018-04-04 09:49:43',''),(56,22,6,30,2,1,'2018-04-04 09:50:16','2018-04-04 10:06:10','市政科同意'),(57,23,1,28,3,1,'2018-04-04 09:53:47','2018-04-04 09:53:47',''),(58,23,7,NULL,0,1,'2018-04-04 09:54:18',NULL,NULL),(59,22,17,NULL,0,1,'2018-04-04 11:24:26',NULL,NULL);

/*Table structure for table `t_resource` */

DROP TABLE IF EXISTS `t_resource`;

CREATE TABLE `t_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源 ID',
  `name` varchar(50) NOT NULL COMMENT '资源名称,一般是中文名称(给人看的)',
  `permission` varchar(40) NOT NULL COMMENT '资源权限字符串,一般是 Shiro 默认的通配符表示(给人看的)',
  `url` varchar(40) NOT NULL COMMENT '资源 url 表示,我们设计的系统让 Shiro 通过这个路径字符串去匹配浏览器中显示的路径',
  `is_menu_url` int(11) DEFAULT NULL COMMENT '是否二级菜单路径.1:是,0:否',
  `menu_id` int(11) DEFAULT NULL COMMENT '路径分类所属菜单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='资源表';

/*Data for the table `t_resource` */

insert  into `t_resource`(`id`,`name`,`permission`,`url`,`is_menu_url`,`menu_id`) values (42,'用户信息菜单','user:page','/user/page',1,20),(43,'用户列表','user:list','/user/list',0,20),(44,'添加用户','user:save','/user/save',0,20),(45,'更新用户','user:edit','/user/edit',0,20),(46,'删除用户','user:del','/user/del',0,20),(47,'对用户操作的时候需要获取部门列表','department:list','/department/list',0,20),(48,'资源管理菜单','resource:page','/resource/page',1,23),(50,'主页','index','/index.jsp',0,26),(51,'资源列表','resource:list','/resource/list',0,23),(52,'添加资源','resource:save','/resource/save',0,23),(53,'获取二级菜单列表','menu:list','/menu/list',0,23),(54,'更新资源','resource:edit','/resource/edit',0,23),(56,'菜单管理菜单','menu:page','/menu/page',1,29),(57,'菜单列表','menu:list','/menu/list',0,29),(58,'添加菜单','menu:save','/menu/save',0,29),(59,'更新菜单','menu:edit','/menu/edit',0,29),(60,'用户角色菜单','userRole:page','/userRole/page',1,28),(61,'更新角色','user:edit','/user/edit',0,28),(62,'删除菜单','menu:del','/menu/del',0,29),(63,'删除角色','user:del','/user/del',0,28),(64,'主页welcome','welcome','/welcome.jsp',0,26),(65,'权限资源分配树','resource:resourseTree','/resource/resourceTree',0,28),(66,'权限分配提交','resource:linkRoleAndResource','/resource/linkRoleAndResource',0,28),(67,'角色管理菜单','role:page','/role/page',1,27),(68,'部门信息菜单','department:page','/department/page',1,21),(69,'文件分类菜单','applyType:page','/applyType/page',1,22),(70,'申请管理菜单','apply:page','/apply/page',1,31),(71,'流程分类菜单','process:page','/process/page',1,32),(72,'角色列表','role:list','/role/list',0,27),(73,'添加角色','role:save','/role/save',0,27),(74,'删除角色','role:del','/role/del',0,27),(75,'编辑角色','role:edit','/role/edit',0,27),(76,'申请列表','apply:list','/apply/list',0,31),(78,'编辑申请更新申请','apply:edit','/apply/edit',0,31),(79,'删除申请的操作','apply:del','/apply/del',0,31),(80,'获取流程列表','process:list','/process/list',0,32),(82,'编辑流程更新流程','process:edit','/process/edit',0,32),(84,'部门列表','department:list','/department/list',0,21),(85,'添加部门','department:save','/department/save',0,21),(86,'编辑部门','department:edit','/department/edit',0,21),(87,'删除部门','department:del','/department/del',0,21),(88,'文件分类列表','applyType:list','/applyType/list',0,22),(89,'添加文件分类','applyType:save','/applyType/save',0,22),(90,'编辑文件分类','applyType:edit','/applyType/edit',0,22),(91,'删除文件分类','applyType:del','/applyType/del',0,22),(92,'流程配置详情页','processInfo:page','/processInfo/page',0,32),(93,'流程配置的时候获取所有的部门','department:list','/department/list',0,32),(94,'配置流程的时候提交编辑','process:edit','/process/edit',0,32),(95,'删除资源','resource:del','/resource/del',0,23),(96,'用户角色编辑','userRole:edit','/user/edit',0,28),(97,'用户角色删除','userRole:del','/user/del',0,28),(98,'审核记录菜单','processRecord:page','/processRecord/page',1,33),(99,'审核记录列表','processRecord:list','/processRecord/list',0,33),(101,'主页跳转index','index','/index',0,26),(102,'添加用户编辑用户的时候获取角色下拉框','role:getRoleSelect','/role/getRoleSelect',0,20),(103,'用户手册菜单','guide:page','/guide/page',1,35),(104,'主页','/','/',0,26);

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) DEFAULT NULL COMMENT '角色名',
  `role_key` varchar(20) DEFAULT NULL COMMENT '角色标识',
  `grade` tinyint(4) DEFAULT NULL COMMENT '角色等级',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`role_name`,`role_key`,`grade`,`remarks`,`created_time`) values (1,'管理员','admin',1,'系统最高权限','2017-11-16 10:34:00'),(2,'普通管理员','common',20,'相关部门工作人员,比管理员低一个等级','2017-11-16 10:34:02'),(4,'APP人员','app',100,'登录app的人使用账号','2017-12-05 16:34:15');

/*Table structure for table `t_role_resource` */

DROP TABLE IF EXISTS `t_role_resource`;

CREATE TABLE `t_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1541 DEFAULT CHARSET=utf8;

/*Data for the table `t_role_resource` */

insert  into `t_role_resource`(`id`,`role_id`,`resource_id`) values (1150,3,42),(1151,3,43),(1152,3,68),(1153,3,84),(1154,3,69),(1155,3,88),(1156,3,50),(1157,3,64),(1158,3,101),(1159,3,70),(1160,3,76),(1161,3,71),(1162,3,80),(1163,3,98),(1164,3,99),(1332,4,50),(1333,4,64),(1334,4,101),(1335,4,103),(1336,4,71),(1337,4,80),(1338,4,98),(1339,4,99),(1340,4,70),(1341,4,76),(1342,4,69),(1343,4,88),(1344,4,68),(1345,4,84),(1346,4,42),(1347,4,43),(1402,2,50),(1403,2,64),(1404,2,101),(1405,2,103),(1406,2,70),(1407,2,76),(1408,2,98),(1409,2,99),(1410,2,71),(1411,2,80),(1412,2,92),(1413,2,93),(1414,2,42),(1415,2,43),(1416,2,44),(1417,2,45),(1418,2,46),(1419,2,47),(1420,2,102),(1421,2,68),(1422,2,84),(1423,2,85),(1424,2,86),(1425,2,87),(1426,2,69),(1427,2,88),(1484,1,50),(1485,1,64),(1486,1,104),(1487,1,101),(1488,1,103),(1489,1,70),(1490,1,76),(1491,1,78),(1492,1,79),(1493,1,98),(1494,1,99),(1495,1,71),(1496,1,80),(1497,1,82),(1498,1,92),(1499,1,93),(1500,1,94),(1501,1,42),(1502,1,43),(1503,1,44),(1504,1,45),(1505,1,46),(1506,1,47),(1507,1,102),(1508,1,68),(1509,1,84),(1510,1,85),(1511,1,86),(1512,1,87),(1513,1,69),(1514,1,88),(1515,1,89),(1516,1,90),(1517,1,91),(1518,1,60),(1519,1,61),(1520,1,63),(1521,1,65),(1522,1,66),(1523,1,96),(1524,1,97),(1525,1,67),(1526,1,72),(1527,1,73),(1528,1,74),(1529,1,75),(1530,1,56),(1531,1,57),(1532,1,58),(1533,1,59),(1534,1,62),(1535,1,48),(1536,1,51),(1537,1,52),(1538,1,53),(1539,1,54),(1540,1,95);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(30) DEFAULT NULL COMMENT '账号',
  `password` varchar(40) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(30) DEFAULT NULL COMMENT '昵称',
  `department_id` int(11) DEFAULT NULL COMMENT '部门id',
  `status` tinyint(11) DEFAULT '1' COMMENT '1登录后台 0登录APP',
  `level` tinyint(11) DEFAULT '1' COMMENT '0申请和1审批 2城规委 -1是超级管理员',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`account`,`password`,`nickname`,`department_id`,`status`,`level`,`remarks`,`created_time`) values (4,'zhengdechao','885bcaf767160fae82c17bbe4b0fd5d0','郑德超',1,1,-1,'超级管理员','2017-11-16 15:08:51'),(27,'杨智博','309c7e81c9632674f3100d7cea86f07d','杨智博',1,1,1,'','2017-11-24 19:19:24'),(28,'行政审批科','82d951b0e0b5a2fab79393e9524c3037','行政审批科',1,0,0,'','2017-11-24 19:19:45'),(29,'规划发展科','75cf4768add656ef95b9bc188e064f5f','规划发展科',4,0,1,'','2017-11-24 19:20:49'),(30,'市政科','4f6a11677a7ef24bce9b2e467ab5a8c7','市政科',6,0,1,'','2017-11-24 19:20:56'),(31,'专家会','bc85104e8d2b7a484f72198987a29e5f','专家会',8,0,2,'','2017-11-24 19:21:03'),(32,'专题会','e9a7913e1abfd699b8d30080d1c9324a','专题会',9,0,1,'','2017-11-24 19:21:10'),(33,'技术审查中心','6e5f262a5c75b3d0f150c9c31109d441','技术审查中心',12,0,1,'','2017-11-24 19:21:16'),(34,'县乡规划管理科','02194bd44286ca6143f451e198ddc340','县乡规划管理科',5,0,1,'','2017-11-24 19:21:24'),(35,'用地科','3a8c67abfa8ecae8fdedc580e163f4cb','用地科',7,0,1,'','2017-11-24 19:21:30'),(36,'副主任审核','2e0a431e5d3c25ceb8defa224a1a208a','副主任审核',1,0,1,'','2017-11-24 19:21:37'),(37,'副主任','b7564a9f831d42888fc45c8b1de7e7b1','副主任',10,0,1,'','2017-11-24 19:21:52'),(38,'主任','6120d3abfbb0695379e1caea00c08d3d','主任',11,0,1,'','2017-11-24 19:22:02'),(39,'法规科','c99033573aa495f1aa8c2754c4a52f2a','法规科',13,0,1,'','2017-11-24 19:22:11'),(40,'工程师','f07e5e8d4c720cfb490a5fef97fd9b5b','工程师',14,0,1,'','2017-11-24 19:22:20'),(41,'执法支队','506e04158e8c30f0d29b0dacdc8b1947','执法支队',15,0,1,'','2017-11-24 19:22:29'),(42,'副主任审定','60399ea2f1f60f5323a32dc73d6c9175','副主任审定',16,0,1,'','2017-11-24 19:22:39'),(43,'市政交通科','0e6e66a542ae824ea55e933b0dbae8a1','市政交通科',3,0,1,'','2017-11-24 19:23:12'),(49,'ddd','2523687e80f9e29ce70fbf25f546b31b','郑德超',1,1,1,'','2017-12-15 14:48:28'),(50,'zdc','65017c1e23b53bb94eb95fd3ad71d5c2','郑德超',1,1,1,'','2018-04-02 11:30:03');

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

/*Data for the table `t_user_role` */

insert  into `t_user_role`(`id`,`user_id`,`role_id`) values (10,11,4),(27,28,4),(28,29,4),(29,30,4),(30,31,4),(31,32,4),(32,33,4),(33,34,4),(34,35,4),(35,36,4),(36,37,4),(37,38,4),(38,39,4),(39,40,4),(40,41,4),(41,42,4),(42,43,4),(50,48,1),(51,4,1),(52,27,2),(53,49,1),(54,50,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
