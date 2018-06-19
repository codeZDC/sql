/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.7.19 : Database - im
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`im` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `im`;

/*Table structure for table `hehe` */

DROP TABLE IF EXISTS `hehe`;

CREATE TABLE `hehe` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hehe` */

/*Table structure for table `t_menu` */

DROP TABLE IF EXISTS `t_menu`;

CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '菜单的名称',
  `description` varchar(100) DEFAULT NULL COMMENT '菜单的描述',
  `order_num` int(11) DEFAULT NULL COMMENT '优先级排序管理',
  `pid` int(11) DEFAULT NULL COMMENT '菜单的父级目录id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `t_menu` */

insert  into `t_menu`(`id`,`name`,`description`,`order_num`,`pid`) values (1,'成员管理','&#xe60d;',NULL,0),(2,'系统管理','&#xe62e;',NULL,0),(3,'教师列表','所有教师的展示和编辑',NULL,1),(4,'学生列表','所有学生的展示和编辑',NULL,1),(5,'用户管理','相关增删改',NULL,2),(6,'角色管理','相关增删改',NULL,2),(7,'菜单管理','相关增删改',NULL,2),(8,'资源管理','相关增删改',NULL,2),(9,'主页','主页',NULL,0),(10,'404页面','/system-base',NULL,2),(11,'zTree和百度Map','&#xe61a;',NULL,0),(12,'zTree','二级菜单',NULL,11),(13,'百度地图测试','百度地图测试',NULL,11);

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='资源表';

/*Data for the table `t_resource` */

insert  into `t_resource`(`id`,`name`,`permission`,`url`,`is_menu_url`,`menu_id`) values (1,'教师列表菜单','teacher : manage','/teacher/page',1,3),(3,'获取教师列表','teacher : manage','/teacher/list',0,3),(4,'添加教师','teacher : manage','/teacher/add',0,3),(5,'更新教师信息','teacher : manage','/teacher/update',0,3),(6,'删除教师','teacher : manage','/teacher/delete',0,3),(7,'用户管理菜单','user : manage','/user/page',1,5),(8,'查询用户','user : manage','/user/list',0,5),(9,'添加用户','user : manage','/user/add',0,5),(10,'获取所有角色','role : manage','/role/list',0,5),(11,'删除用户','user : manage','/user/delete',0,5),(12,'修改用户','user : manage','/user/update',0,5),(13,'获取权限tree','resource : manage','/resource/resourceTree',0,5),(14,'角色管理菜单','role : manage','/role/page',1,6),(15,'增加角色信息','role : manage','/role/add',0,6),(16,'删除角色信息','role : manage','/role/delete',0,6),(17,'修改角色信息','role : manage','/role/update',0,6),(18,'菜单管理菜单','menu : manage','/menu/page',1,7),(19,'获取所有一级菜单','menu : manage','/menu/levelOneMenus',0,7),(20,'新增菜单','menu : manage','/menu/add',0,7),(21,'删除菜单','menu : manage','/menu/delete',0,7),(22,'修改菜单','menu : manage','/menu/update',0,7),(23,'查询菜单','menu : manage','/menu/list',0,7),(24,'资源管理菜单','resource : manage','/resource/page',1,8),(25,'获取所有二级菜单','resource : manage','/resource/levelTwoResources',0,8),(26,'新增资源','resource : manage','/resource/add',0,8),(27,'删除资源','resource : manage','/resource/delete',0,8),(28,'修改资源','resource : manage','/resource/update',0,8),(29,'查找资源','resource : manage','/resource/list',0,8),(30,'学生列表菜单','student : manage','/student/page',1,4),(31,'查看角色','role : manage','/role/list',0,6),(32,'主页','index : manage','/index',0,9),(33,'欢迎页','index : manage','/welcome',0,9),(34,'分配资源给角色','resource : manage','/resource/linkRoleAndResource',0,8),(35,'登录地址','user : manage','/user/login',0,7),(36,'404页面菜单','404 : manage','/404',1,10),(37,'zTree菜单','zTree : manage','/zTree/page',1,12),(38,'获取tree','resource : manage','/resource/tree',0,12),(39,'二级菜单','二级菜单 : manage','/baidumap/page',1,13);

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色表 ID',
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `sn` varchar(20) NOT NULL COMMENT '角色字符串',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`name`,`sn`) values (1,'超级管理员','admin'),(2,'教师管理员','admin-teacher'),(3,'会员','vip'),(4,'学生管理员','admin-student'),(5,'系统管理员','admin-system');

/*Table structure for table `t_role_resource` */

DROP TABLE IF EXISTS `t_role_resource`;

CREATE TABLE `t_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色资源关联 ID',
  `role_id` int(11) NOT NULL COMMENT '角色 id',
  `resource_id` int(11) NOT NULL COMMENT '资源 id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=668 DEFAULT CHARSET=utf8 COMMENT='角色资源关联表';

/*Data for the table `t_role_resource` */

insert  into `t_role_resource`(`id`,`role_id`,`resource_id`) values (438,5,1),(439,5,3),(440,5,4),(441,5,30),(442,5,7),(443,5,8),(444,5,9),(445,5,10),(446,5,13),(447,5,14),(448,5,31),(449,5,18),(450,5,19),(451,5,20),(452,5,23),(453,5,24),(454,5,25),(455,5,26),(456,5,29),(457,5,36),(458,5,32),(459,5,33),(460,5,37),(461,5,38),(469,2,1),(470,2,3),(471,2,4),(472,2,5),(473,2,6),(474,2,32),(475,2,33),(476,2,37),(477,2,38),(478,3,1),(479,3,30),(480,3,7),(481,3,14),(482,3,18),(483,3,24),(484,3,32),(485,3,33),(486,3,37),(487,3,38),(584,4,1),(585,4,3),(586,4,4),(587,4,5),(588,4,30),(589,4,32),(590,4,33),(591,4,37),(592,4,38),(593,4,39),(630,1,1),(631,1,3),(632,1,4),(633,1,5),(634,1,6),(635,1,30),(636,1,7),(637,1,8),(638,1,9),(639,1,10),(640,1,11),(641,1,12),(642,1,13),(643,1,14),(644,1,15),(645,1,16),(646,1,17),(647,1,31),(648,1,18),(649,1,19),(650,1,20),(651,1,21),(652,1,22),(653,1,23),(654,1,35),(655,1,24),(656,1,25),(657,1,26),(658,1,27),(659,1,28),(660,1,29),(661,1,34),(662,1,36),(663,1,32),(664,1,33),(665,1,37),(666,1,38),(667,1,39);

/*Table structure for table `t_student` */

DROP TABLE IF EXISTS `t_student`;

CREATE TABLE `t_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) DEFAULT NULL COMMENT '学生姓名',
  `age` tinyint(2) DEFAULT NULL COMMENT '年龄',
  `sex` tinyint(2) DEFAULT '1' COMMENT '性别 1:男  0:女',
  `partner_name` varchar(20) DEFAULT NULL COMMENT '伴侣姓名',
  `occupation` varchar(30) DEFAULT NULL COMMENT '职业',
  `current_address` varchar(100) DEFAULT NULL COMMENT '现居住地',
  `msg` varchar(200) DEFAULT NULL COMMENT '备注信息(管理员可见)',
  `order` int(5) DEFAULT NULL COMMENT '排序号',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态 1:显示 0:不显示',
  `create_time` varchar(25) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_student` */

/*Table structure for table `t_student_garbage` */

DROP TABLE IF EXISTS `t_student_garbage`;

CREATE TABLE `t_student_garbage` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_student_garbage` */

/*Table structure for table `t_teacher` */

DROP TABLE IF EXISTS `t_teacher`;

CREATE TABLE `t_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `logo` varchar(40) DEFAULT 'logo.png',
  `age` tinyint(2) DEFAULT NULL,
  `sex` tinyint(2) DEFAULT '1',
  `subject` varchar(20) DEFAULT NULL,
  `create_time` varchar(25) DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(2) DEFAULT '1' COMMENT '1:显示 0:不显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `t_teacher` */

insert  into `t_teacher`(`id`,`name`,`logo`,`age`,`sex`,`subject`,`create_time`,`status`) values (1,'姚金伟','logo.png',48,1,'数学','2017-07-10',0),(28,'冉漾',NULL,50,0,'英语','2017-07-10',1),(29,'邓金生',NULL,55,1,'语文','2017-07-10',1),(30,'付文仁',NULL,60,0,'物理','2017-07-10',1),(35,'331','logo.png',33,1,'语文','2017-07-11',1),(36,'','logo.png',NULL,1,'-1','2017-07-18',1);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`username`,`password`) values (3,'zdc','65017c1e23b53bb94eb95fd3ad71d5c2'),(6,'zz','02c425157ecd32f259548b33402ff6d3');

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `t_user_role` */

insert  into `t_user_role`(`id`,`user_id`,`role_id`) values (2,3,1),(3,4,5),(4,5,3),(5,6,4),(6,7,1),(7,8,1),(8,7,3);

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `test` */

insert  into `test`(`id`,`name`) values (1,'132'),(2,'ewq'),(3,'wqe'),(4,'ewq'),(5,'ewq'),(6,'ew'),(7,'qe'),(8,'wq'),(9,'e'),(10,'wq'),(11,'we');

/*Table structure for table `test2` */

DROP TABLE IF EXISTS `test2`;

CREATE TABLE `test2` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `test2` */

insert  into `test2`(`id`,`name`) values (1,'132'),(2,'ewq'),(3,'wqe'),(4,'ewq'),(5,'ewq'),(6,'ew'),(7,'qe'),(8,'wq'),(9,'e'),(10,'wq'),(11,'we');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
