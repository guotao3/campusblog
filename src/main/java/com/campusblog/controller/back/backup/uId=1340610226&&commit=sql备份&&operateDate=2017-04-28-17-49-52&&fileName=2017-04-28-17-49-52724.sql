-- MySQL dump 10.13  Distrib 5.7.16, for Win64 (x86_64)
--
-- Host: localhost    Database: campusblog
-- ------------------------------------------------------
-- Server version	5.7.16

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
-- Table structure for table `album_t`
--

DROP TABLE IF EXISTS `album_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album_t` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '相册group_id',
  `name` varchar(20) DEFAULT NULL COMMENT '相册名称',
  `num` int(11) DEFAULT NULL COMMENT '图片数量',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uid` int(10) DEFAULT NULL COMMENT '相册属于哪个人',
  `lock` tinyint(4) DEFAULT NULL COMMENT '是否有锁',
  `def` varchar(80) DEFAULT NULL COMMENT '默认封面',
  `alblock` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `uid` (`uid`),
  CONSTRAINT `album_t_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_t` (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_t`
--

LOCK TABLES `album_t` WRITE;
/*!40000 ALTER TABLE `album_t` DISABLE KEYS */;
INSERT INTO `album_t` VALUES (1,'时间简史',NULL,'2017-04-24 04:08:49','2017-04-27 07:20:37',1340610226,NULL,'/static/front/img/4.jpg',NULL);
/*!40000 ALTER TABLE `album_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_approve_record`
--

DROP TABLE IF EXISTS `article_approve_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_approve_record` (
  `articleId` int(20) DEFAULT NULL COMMENT '点赞文章',
  `uId` int(10) DEFAULT NULL COMMENT '点赞人',
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '索引',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_approve_record`
--

LOCK TABLES `article_approve_record` WRITE;
/*!40000 ALTER TABLE `article_approve_record` DISABLE KEYS */;
INSERT INTO `article_approve_record` VALUES (1,1340610226,26),(2,1340610226,27),(8,1340610226,28),(3,1340610226,29);
/*!40000 ALTER TABLE `article_approve_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_t`
--

DROP TABLE IF EXISTS `article_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_t` (
  `articleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章唯一标识',
  `titile` varchar(50) DEFAULT NULL,
  `content` text,
  `view` int(11) DEFAULT NULL,
  `approve` int(11) DEFAULT NULL,
  `limit` char(1) DEFAULT NULL,
  `permission` tinyint(4) DEFAULT NULL COMMENT '1.私密(2)2.博友(1)3.全部(0)',
  `type` varchar(10) DEFAULT NULL COMMENT '文章类型(分组)',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uId` int(10) DEFAULT NULL,
  `access` char(1) DEFAULT NULL COMMENT '是否可评论',
  `impose` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`articleId`),
  KEY `fk_article_user_uId` (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_t`
--

LOCK TABLES `article_t` WRITE;
/*!40000 ALTER TABLE `article_t` DISABLE KEYS */;
INSERT INTO `article_t` VALUES (2,'浅析小学数学学习两极分化现象','在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象',10,11,'0',NULL,'1','2016-12-14 02:01:26','2017-04-28 07:39:27',1340610226,'1','0'),(3,'浅析小学数学学习两极分化现象','在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。',30,32,'0',NULL,'1','2017-03-27 02:22:33','2017-04-13 02:11:37',1340610226,'0','0'),(5,'浅析小学数学学习两极分化现象','在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。',2,3,'0',NULL,'2','2017-03-16 08:57:13','2017-04-13 02:11:38',1340610226,'1','0'),(6,'浅析小学数学学习两极分化现象','在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。',102,103,'0',NULL,'3','2017-03-27 02:22:55','2017-04-28 07:39:00',1340610226,'0','0'),(7,'爱打打','在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。在新课程背景下，课堂充满了民主和谐的气氛，自主学习、合作学习、师生互动，把课堂推向了一个全新的境界。课程内容的呈现方式多样而有选择性、解决问题的策略多样化、答案的不唯一而有开放性等变化，都在很大程度上给部分学生提供了一个全新的学习空间。而在小学数学教学中，随着年龄、知识的增长，小学数学学习两极分化的程度会随着年级的升高而不断加剧。为了全面提高小学生的数学综合素质，如何消除这种现象。',302,8000,'0',NULL,'4','2017-03-27 02:24:07','2017-04-28 07:39:04',1340610226,'1','0'),(8,'张瑞敏：海尔33年，我发现要想基业长青，就要不断抛弃过往的成功经验','张瑞敏：海尔33年，我发现要想基业长青，就要不断抛弃过往的成功经验张瑞敏：海尔33年，我发现要想基业长青，就要不断抛弃过往的成功经验张瑞敏：海尔33年，我发现要想基业长青，就要不断抛弃过往的成功经验张瑞敏：海尔33年，我发现要想基业长青，',6000,2,'0',NULL,'5','2017-04-13 05:13:54','2017-04-28 07:39:08',1340610226,NULL,NULL);
/*!40000 ALTER TABLE `article_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articlenote_t`
--

DROP TABLE IF EXISTS `articlenote_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articlenote_t` (
  `articleId` int(11) NOT NULL,
  `uId` int(10) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `to_uId` int(10) DEFAULT NULL COMMENT '回复评论给某人',
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `flag` varchar(50) DEFAULT NULL COMMENT '时间区分',
  PRIMARY KEY (`id`),
  KEY `uId` (`uId`),
  KEY `to_uId` (`to_uId`),
  CONSTRAINT `articlenote_t_ibfk_1` FOREIGN KEY (`uId`) REFERENCES `user_t` (`uId`),
  CONSTRAINT `articlenote_t_ibfk_2` FOREIGN KEY (`to_uId`) REFERENCES `articlenote_t` (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articlenote_t`
--

LOCK TABLES `articlenote_t` WRITE;
/*!40000 ALTER TABLE `articlenote_t` DISABLE KEYS */;
INSERT INTO `articlenote_t` VALUES (1,1340610226,'小学数学好难啊','2017-04-14 09:47:47',NULL,NULL,25,'2017-4-14 17:47:36.0'),(1,1340610226,'我是学霸','2017-04-14 10:07:35',NULL,1340610226,26,'2017-4-14 17:47:36.0'),(1,1340610226,'很简单','2017-04-14 10:16:49',NULL,NULL,27,'2017-4-14 18:16:46.0'),(1,1340610226,'是的，我也觉得 哈哈','2017-04-14 10:17:23',NULL,NULL,28,'2017-4-14 18:17:18.0'),(1,1340610226,'看下卷子 多复习就ok啦~\\(≧▽≦)/~啦啦啦','2017-04-14 10:18:06',NULL,1340610226,29,'2017-4-14 17:47:36.0'),(8,1340610226,'cccc','2017-04-24 04:04:03',NULL,NULL,30,'2017-4-24 12:4:3.0');
/*!40000 ALTER TABLE `articlenote_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articlenote_t_copy`
--

DROP TABLE IF EXISTS `articlenote_t_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articlenote_t_copy` (
  `articleId` int(11) NOT NULL,
  `uId` int(10) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `to_uId` int(10) DEFAULT NULL COMMENT '回复评论给某人',
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `flag` varchar(50) DEFAULT NULL COMMENT '时间区分',
  PRIMARY KEY (`id`),
  KEY `uId` (`uId`),
  KEY `to_uId` (`to_uId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articlenote_t_copy`
--

LOCK TABLES `articlenote_t_copy` WRITE;
/*!40000 ALTER TABLE `articlenote_t_copy` DISABLE KEYS */;
INSERT INTO `articlenote_t_copy` VALUES (1,1,'文章写得好啊','2017-03-24 02:27:46',NULL,1,1,'2017-03-24 10:27:46.0'),(1,2,'不好啊','2017-03-01 02:30:01',NULL,1,2,'2017-03-24 10:27:46.0'),(1,2,'写得好','2017-03-03 02:40:59','2017-04-14 08:57:49',2,3,'2017-03-03 10:40:59.0'),(1,4,'给你点个赞','2017-03-03 02:35:35',NULL,1,4,NULL),(2,2,'文章写得好啊','2017-04-13 07:00:29',NULL,NULL,5,NULL),(2,2,'文章写得好啊','2017-04-13 07:00:30',NULL,NULL,6,NULL),(2,2,'文章写得好啊','2017-04-13 07:00:31',NULL,NULL,7,NULL),(1,1340610226,'浩哥集耳垂','2017-04-14 06:27:11','2017-04-14 08:50:17',NULL,8,'2017-04-14 14:27:11.0'),(1,1340610226,'哇咔咔','2017-04-14 06:30:56','2017-04-14 08:49:56',1340610226,9,'2017-04-14 14:27:11.0'),(1,1340610226,'乌拉拉','2017-04-14 06:35:42',NULL,1340610226,10,'2017-04-14 14:27:11.0'),(1,1340610226,'时时送','2017-04-14 06:38:53',NULL,1340610226,11,'2017-04-14 14:27:11.0'),(1,1340610226,'帅哒哒','2017-04-14 06:41:30',NULL,1340610226,12,'2017-04-14 14:41:30.0'),(1,1340610226,'嘎嘎嘎','2017-04-14 06:43:43',NULL,1340610226,13,'2017-04-14 14:41:30.0'),(1,1340610226,'本宝宝','2017-04-14 06:44:55',NULL,1340610226,14,'2017-04-14 14:41:30.0'),(1,1340610226,'凑活吧！！！！！！','2017-04-14 08:25:15',NULL,1,15,'2017-03-24 10:27:46.0'),(1,1340610226,'凑活吧','2017-04-14 08:31:02',NULL,1,16,'2017-03-24 10:27:46.0'),(1,1340610226,'的冯绍峰','2017-04-14 08:36:20',NULL,1,17,'2017-03-24 10:27:46.0'),(1,1340610226,'滴滴 舔我','2017-04-14 08:40:40',NULL,1340610226,18,'2017-04-14 14:27:11.0'),(1,1340610226,'胡斐的急！~~~','2017-04-14 08:45:17',NULL,1,19,'2017-03-24 10:27:46.0'),(1,1340610226,'忘生舍死','2017-04-14 08:45:32','2017-04-14 08:54:15',1340610226,20,'2017-04-14 16:45:32.0'),(1,1340610226,'11111','2017-04-14 08:47:38',NULL,1340610226,21,'2017-04-14 16:45:32.0'),(1,1340610226,'烦烦烦','2017-04-14 08:55:45',NULL,1,22,'2017-03-24 10:27:46.0'),(1,1340610226,'是是是是','2017-04-14 08:56:14','2017-04-14 09:01:45',NULL,23,'2017-04-14 16:56:14.0'),(1,1340610226,'否否','2017-04-14 08:58:39',NULL,1340610226,24,'2017-04-14 16:56:14.0');
/*!40000 ALTER TABLE `articlenote_t_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogcount_t`
--

DROP TABLE IF EXISTS `blogcount_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogcount_t` (
  `uId` int(10) NOT NULL,
  `visit` int(11) DEFAULT NULL COMMENT '今日访问量',
  `visittoall` int(11) DEFAULT NULL COMMENT '总访问量',
  `from` varchar(50) DEFAULT NULL COMMENT '来源',
  `ip` varchar(15) DEFAULT NULL COMMENT 'IP地址',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogcount_t`
--

LOCK TABLES `blogcount_t` WRITE;
/*!40000 ALTER TABLE `blogcount_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogcount_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code_type`
--

DROP TABLE IF EXISTS `code_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_type` (
  `code` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(12) NOT NULL,
  `uId` varchar(10) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code_type`
--

LOCK TABLES `code_type` WRITE;
/*!40000 ALTER TABLE `code_type` DISABLE KEYS */;
INSERT INTO `code_type` VALUES (1,'默认分类','0'),(2,'游记','0'),(3,'八卦','0'),(4,'影片','0'),(5,'情感','0'),(6,'教育','0'),(7,'极限运动','1340610226');
/*!40000 ALTER TABLE `code_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_t`
--

DROP TABLE IF EXISTS `collection_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_t` (
  `uId` int(10) NOT NULL,
  `articleId` int(10) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_t`
--

LOCK TABLES `collection_t` WRITE;
/*!40000 ALTER TABLE `collection_t` DISABLE KEYS */;
INSERT INTO `collection_t` VALUES (1,3,'2017-03-16 09:07:40',1),(2,2,'2017-03-16 09:07:45',2),(1340610226,8,'2017-04-24 03:17:26',3),(1340610226,7,'2017-04-24 06:49:17',4);
/*!40000 ALTER TABLE `collection_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `count_t`
--

DROP TABLE IF EXISTS `count_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `count_t` (
  `articleamount` int(10) DEFAULT NULL COMMENT '日志统计',
  `commentamount` int(10) DEFAULT NULL COMMENT '日志评论统计',
  `imgamount` int(10) DEFAULT NULL COMMENT '图片统计',
  `useramount` int(10) DEFAULT NULL COMMENT '用户统计',
  `visittotal` int(255) DEFAULT NULL COMMENT '网站访问总量',
  `feedbackamount` int(10) DEFAULT NULL COMMENT '反馈流量统计'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `count_t`
--

LOCK TABLES `count_t` WRITE;
/*!40000 ALTER TABLE `count_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `count_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_t`
--

DROP TABLE IF EXISTS `feedback_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback_t` (
  `mid` int(10) NOT NULL AUTO_INCREMENT,
  `uId` int(10) NOT NULL COMMENT '反馈人',
  `content` varchar(255) DEFAULT NULL COMMENT '反馈内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uId`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_t`
--

LOCK TABLES `feedback_t` WRITE;
/*!40000 ALTER TABLE `feedback_t` DISABLE KEYS */;
INSERT INTO `feedback_t` VALUES (1,1,'1233113','2017-03-17 09:29:15','2017-03-17 09:29:15');
/*!40000 ALTER TABLE `feedback_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `img_t`
--

DROP TABLE IF EXISTS `img_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `img_t` (
  `iId` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `url` varchar(80) DEFAULT NULL COMMENT '图片链接',
  `album_id` int(11) DEFAULT NULL COMMENT '相册id',
  `view` int(11) DEFAULT NULL,
  `approve` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uId` int(10) DEFAULT NULL COMMENT '用户id',
  `isdef` tinyint(1) DEFAULT NULL COMMENT '0或1',
  PRIMARY KEY (`iId`),
  KEY `img_t_ibfk_1` (`uId`),
  KEY `album_id` (`album_id`),
  CONSTRAINT `FK_tf0ebqe7qxdyu9c0ikk67stni` FOREIGN KEY (`iId`) REFERENCES `album_t` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `img_t`
--

LOCK TABLES `img_t` WRITE;
/*!40000 ALTER TABLE `img_t` DISABLE KEYS */;
INSERT INTO `img_t` VALUES (1,'gt20170424120901348.jpg',1,2,2,'2017-04-24 04:09:02','2017-04-24 04:09:02',1340610226,NULL);
/*!40000 ALTER TABLE `img_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imgnote_t`
--

DROP TABLE IF EXISTS `imgnote_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imgnote_t` (
  `pic_Id` int(11) NOT NULL COMMENT '图片id',
  `uId` int(10) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `to_uId` int(10) DEFAULT NULL,
  PRIMARY KEY (`pic_Id`),
  KEY `fk_user_t_uId` (`uId`),
  KEY `fk_imgnote_t_to_uId` (`to_uId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imgnote_t`
--

LOCK TABLES `imgnote_t` WRITE;
/*!40000 ALTER TABLE `imgnote_t` DISABLE KEYS */;
INSERT INTO `imgnote_t` VALUES (1,1340610226,'第一个评论者','2016-12-12 06:24:09','2016-12-12 06:24:09',NULL);
/*!40000 ALTER TABLE `imgnote_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `limit_referce_t`
--

DROP TABLE IF EXISTS `limit_referce_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `limit_referce_t` (
  `code` int(2) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limit_referce_t`
--

LOCK TABLES `limit_referce_t` WRITE;
/*!40000 ALTER TABLE `limit_referce_t` DISABLE KEYS */;
INSERT INTO `limit_referce_t` VALUES (0,'公开'),(1,'博友'),(2,'问题'),(3,'密码'),(4,'私密');
/*!40000 ALTER TABLE `limit_referce_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `limit_t`
--

DROP TABLE IF EXISTS `limit_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `limit_t` (
  `uid` int(10) NOT NULL,
  `ablumId` int(11) DEFAULT NULL,
  `password` int(11) DEFAULT NULL,
  `quest` varchar(22) DEFAULT NULL,
  `aws` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `ablumId` (`ablumId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limit_t`
--

LOCK TABLES `limit_t` WRITE;
/*!40000 ALTER TABLE `limit_t` DISABLE KEYS */;
INSERT INTO `limit_t` VALUES (1,1,123,NULL,NULL);
/*!40000 ALTER TABLE `limit_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `companyregId` int(15) NOT NULL COMMENT '工商注册号',
  `campanyname` varchar(50) NOT NULL COMMENT '公司名称',
  `logo` varchar(50) DEFAULT NULL COMMENT '公司logo',
  `email` varchar(30) DEFAULT NULL COMMENT '公司联系人',
  PRIMARY KEY (`companyregId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT INTO `link` VALUES (1,'1',NULL,NULL),(2,'1','',''),(3,'1',NULL,NULL);
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memorynote_t`
--

DROP TABLE IF EXISTS `memorynote_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memorynote_t` (
  `uId` int(10) NOT NULL,
  `content` varchar(50) DEFAULT NULL COMMENT '备忘内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rate` varchar(6) DEFAULT NULL COMMENT '时间完成情况(百分比)',
  `add` varchar(10) DEFAULT NULL COMMENT '补充内容',
  `id` int(11) NOT NULL,
  `addcontent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memorynote_t`
--

LOCK TABLES `memorynote_t` WRITE;
/*!40000 ALTER TABLE `memorynote_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `memorynote_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_t`
--

DROP TABLE IF EXISTS `message_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_t` (
  `mid` int(10) NOT NULL AUTO_INCREMENT,
  `uId` int(10) NOT NULL,
  `mymessage` varchar(30) DEFAULT '(NULL)' COMMENT '消息',
  `blacklist` text COMMENT '黑名单',
  `creat_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uId`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_t`
--

LOCK TABLES `message_t` WRITE;
/*!40000 ALTER TABLE `message_t` DISABLE KEYS */;
INSERT INTO `message_t` VALUES (1,1,'你被拉入黑名单','1234567891&1234567891&1234567891&1234567891&1234567891&1234567891&234567891&\r\n1234567891&1234567891&12345678911234567891&1234567891&1234567891&1234567891&\r\n1234567891&1234567891&12345678911234567891&1234567891&1234567891&1234567891&\r\n1234567891&1234567891&12345678911234567891&1234567891&1234567891&1234567891&\r\n1234567891&1234567891&12345678911234567891&1234567891&1234567891&1234567891&\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','2017-03-20 02:40:39','2017-03-20 08:19:59'),(2,2,'消息发送了','123\n123','2017-03-20 09:43:40','2017-03-20 09:46:19');
/*!40000 ALTER TABLE `message_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_t`
--

DROP TABLE IF EXISTS `push_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `push_t` (
  `titile` varchar(20) DEFAULT NULL,
  `mid` int(10) NOT NULL AUTO_INCREMENT,
  `uId` int(10) NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uId`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_t`
--

LOCK TABLES `push_t` WRITE;
/*!40000 ALTER TABLE `push_t` DISABLE KEYS */;
INSERT INTO `push_t` VALUES ('对的',2,0,'的点点滴滴滴答滴答滴答滴答','2017-04-25 06:19:30','2017-04-25 06:19:30'),('重要通知！',1,1,'重要通知：请各位同学2017年5月7日下午5点在东B301进行周会，此次周会特别重要，主要是牵涉到档案、户口','2017-03-22 02:21:52','2017-04-25 03:45:31');
/*!40000 ALTER TABLE `push_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_t`
--

DROP TABLE IF EXISTS `user_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_t` (
  `uId` int(10) NOT NULL COMMENT '学号',
  `name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `fullname` varchar(30) NOT NULL COMMENT '昵称',
  `sex` char(1) DEFAULT NULL,
  `age` tinyint(4) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `school` varchar(30) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL COMMENT '心情随笔',
  `tel` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL COMMENT '个人邮箱',
  `love` varchar(50) DEFAULT NULL COMMENT '爱好',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `friendId` varchar(1000) DEFAULT NULL COMMENT '好友id',
  `focus` int(11) DEFAULT NULL COMMENT '关注数',
  `popmoods` varchar(50) DEFAULT NULL COMMENT '个性签名',
  `pic` varchar(100) DEFAULT NULL COMMENT '头像',
  `password` varchar(20) DEFAULT NULL,
  `role` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`uId`),
  UNIQUE KEY `fullname` (`fullname`),
  UNIQUE KEY `UK_pbbc3a84qyj2mhi2ta1fee44q` (`fullname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_t`
--

LOCK TABLES `user_t` WRITE;
/*!40000 ALTER TABLE `user_t` DISABLE KEYS */;
INSERT INTO `user_t` VALUES (1,'aa','张三',NULL,NULL,'2016-12-07','','','','','',NULL,'2016-12-22 06:03:15','2017-04-24 06:35:01',NULL,NULL,'交友信息2','20161222140240921042f4b28030.jpg','1','1'),(2,'2','李四',NULL,NULL,'2016-12-01','','','','','',NULL,'2016-12-22 06:03:15','2017-04-24 05:32:57',NULL,NULL,'交友信息2','20161222140240921042f4b28030.jpg','2','\0'),(3,'aa','王麻子',NULL,NULL,'2016-12-01','','','','','',NULL,'2016-12-22 06:54:37','2017-04-24 06:34:58',NULL,NULL,'交友信息2','gt20170410165739919.jpg','119','\0'),(4,'李四','小飞','1',21,'1995-01-01','阿拉善','阿拉善','阿拉善','18482101758','www.baidu.com','1','2016-12-07 09:45:03','2017-04-24 06:34:56',NULL,NULL,'交友信息2','gt20170410165739919.jpg','123','1'),(1340610226,'郭涛','会飞的鱼','1',18,'2017-04-10','中国','加利顿大学','描述','18482101758','649522441@qq.com','篮球、足球、羽毛球',NULL,NULL,'1340610227,1340610226,4',NULL,'交友信息2','gt20170428160536534.jpg','123456','1'),(1340610227,'张三','小张三','1',30,'1985-01-01','美国','加利顿大学','加利','18482101703','www.sohu.com','2','2016-12-07 09:45:03','2017-04-24 06:35:04',NULL,666,'交友信息2','20161222140240921042f4b28030.jpg','1234','0'),(1340610228,'王麻子','大麻','0',NULL,'2006-01-01','中国','北京','北京大学','11011011011','www.sina。com','100','2016-12-07 09:45:03','2017-04-24 05:33:02',NULL,NULL,'交友信息2','gt20170410140134095.jpg','123','1');
/*!40000 ALTER TABLE `user_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usernote_t`
--

DROP TABLE IF EXISTS `usernote_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usernote_t` (
  `uId` int(10) NOT NULL COMMENT '学号',
  `content` varchar(255) DEFAULT NULL COMMENT '留言内容',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `to_uId` int(10) DEFAULT NULL COMMENT '在主页的留言',
  `id` int(11) NOT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `hostuid` int(11) DEFAULT NULL,
  KEY `to_uId` (`to_uId`),
  CONSTRAINT `usernote_t_ibfk_1` FOREIGN KEY (`to_uId`) REFERENCES `user_t` (`uId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usernote_t`
--

LOCK TABLES `usernote_t` WRITE;
/*!40000 ALTER TABLE `usernote_t` DISABLE KEYS */;
INSERT INTO `usernote_t` VALUES (1340610226,'灌灌灌灌','2017-04-28 07:08:33','2017-04-28 07:08:33',NULL,0,'2017-4-28 15:8:32.0',1340610226),(1340610226,'嘎嘎嘎嘎嘎嘎','2017-04-28 07:09:22','2017-04-28 07:09:22',1340610226,0,'2017-4-28 15:8:32.0',1340610226);
/*!40000 ALTER TABLE `usernote_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_record`
--

DROP TABLE IF EXISTS `view_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_record` (
  `articleId` int(20) DEFAULT NULL,
  `uId` int(10) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_record`
--

LOCK TABLES `view_record` WRITE;
/*!40000 ALTER TABLE `view_record` DISABLE KEYS */;
INSERT INTO `view_record` VALUES (1,1340610226,1),(5,1340610226,2),(6,1340610226,3),(3,1340610226,4),(2,1340610226,5),(8,1340610226,6),(7,1340610226,8);
/*!40000 ALTER TABLE `view_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-28 17:49:52
