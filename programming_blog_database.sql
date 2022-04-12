/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 8.0.28 : Database - programming_blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`programming_blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `programming_blog`;

/*Table structure for table `answer` */

DROP TABLE IF EXISTS `answer`;

CREATE TABLE `answer` (
  `answer_id` int NOT NULL AUTO_INCREMENT,
  `answer_content` longtext NOT NULL,
  `answer_code` longtext,
  `answer_img` varchar(100) DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `answer_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`answer_id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`pId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `answer` */

insert  into `answer`(`answer_id`,`answer_content`,`answer_code`,`answer_img`,`post_id`,`user_id`,`answer_time`) values 
(3,'please send','found = FALSE;\r\nforeach ($r->getParameters()[0]->getType()->getTypes() as $type) {\r\n  $name = $type->getName();\r\n  if ($n','T2HlC.png',8,5,'2022-04-07 18:24:04'),
(4,'help please','class Y {\r\n}\r\nfunction foo(X|Y $param) {\r\n}','b8f37d4f-a2ba-43f5-b4e0-004085bc20dc.png',8,1,'2022-04-07 18:32:22'),
(5,'i will send solution',' author = models.ForeignKey(User, blank=True, null=True, on_delete=models.DO_NOTHING)\r\n    title = models.CharField(max_length=200)\r\n    class Meta:\r\n        verbose_name = \'question\'\r\n','access-error-logs.png',7,1,'2022-04-07 18:44:24'),
(6,'please help','send me solution','T2HlC.png',7,5,'2022-04-07 18:45:32'),
(8,'ok i will send','{  \r\n    Thread client=new Thread(MainDemo::client);     \r\n    client.start(); \r\n    client.join();\r\n             }','T2HlC.png',6,5,'2022-04-07 20:29:38'),
(25,'it is very easy','remove this\r\nThread client=new Thread(MainDemo::client);     \r\n    client.start(); \r\n    client.join();\r\n             }\r\n         }\r\n     }','T2HlC.png',6,1,'2022-04-07 21:08:04'),
(32,'i have solution','this is solution','T2HlC.png',8,1,'2022-04-08 12:36:22'),
(35,'i will send soon','python  \r\n           code','code2.png',20,1,'2022-04-12 14:48:38');

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `categories` */

insert  into `categories`(`cid`,`name`,`description`) values 
(1,'Java Programming','Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. '),
(2,'Python Programming','Python is a high-level, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation.'),
(3,'PHP Programming','PHP is a general-purpose scripting language geared toward web development.'),
(4,'Javascript Programming','JavaScript is a high-level, often just-in-time compiled language that conforms to the ECMAScript standard.');

/*Table structure for table `liked` */

DROP TABLE IF EXISTS `liked`;

CREATE TABLE `liked` (
  `lid` int NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`lid`),
  KEY `pid` (`pid`),
  KEY `uid` (`uid`),
  CONSTRAINT `liked_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `posts` (`pId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `liked_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `liked` */

insert  into `liked`(`lid`,`pid`,`uid`) values 
(1,8,1),
(2,6,1),
(3,5,1),
(4,7,1),
(5,8,2),
(6,5,2),
(7,8,5),
(8,6,5),
(9,20,14);

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `pId` int NOT NULL AUTO_INCREMENT,
  `pTitle` varchar(150) NOT NULL,
  `pContent` longtext,
  `pCode` longtext,
  `pPic` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `catId` int DEFAULT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`pId`),
  KEY `catId` (`catId`),
  KEY `userid` (`userid`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `posts` */

insert  into `posts`(`pId`,`pTitle`,`pContent`,`pCode`,`pPic`,`pDate`,`catId`,`userid`) values 
(5,'Why do I recieve error \'java.lang.UnsatisfiedLinkError: Can\'t load library\' when the file can be found?','Why am I receiving this error even though the file is clearly there and it could be read?\r\n\r\nThe Error\r\n\r\nMy project is using lwjgl and imgui-java. I have added -Dimgui.library.path=\"libs\" (where the .dylib in question is stored) to my VM options and the application should open, displaying the demo IMGUI.','plugins {\r\n    id \'java\'\r\n}\r\n\r\ngroup \'org.tpsgames\'\r\nversion \'1.0-SNAPSHOT\'\r\n\r\nrepositories {\r\n    mavenCentral()\r\n    flatDir {\r\n        dirs \'libs\'\r\n    }\r\n}\r\n\r\ndependencies {\r\n    testImplementation \'org.junit.jupiter:junit-jupiter-api:5.8.2\'\r\n    testRuntimeOnly \'org.junit.jupiter:junit-jupiter-engine:5.8.2\'\r\n}\r\n\r\nimport org.gradle.internal.os.OperatingSystem\r\n\r\nproject.ext.lwjglVersion = \"3.3.1\"\r\nproject.ext.jomlVersion = \"1.10.4\"\r\nproject.ext.imguiVersion = \'1.86.4\'\r\nproject.ext.lwjglNatives = \"natives-macos\"\r\n\r\nswitch (OperatingSystem.current()) {\r\n    case OperatingSystem.MAC_OS:\r\n        project.ext.lwjglNatives = System.getProperty(\"os.arch\").startsWith(\"aarch64\") ? \"natives-macos-arm64\" : \"natives-macos\"\r\n        break\r\n}\r\n\r\nrepositories {\r\n    mavenCentral()\r\n}\r\n\r\ndependencies {\r\n    implementation platform(\"org.lwjgl:lwjgl-bom:$lwjglVersion\")\r\n    implementation \"io.github.spair:imgui-java-app:1.86.4\"\r\n    implementation platform(\"org.lwjgl:lwjgl-bom:$lwjglVersion\")\r\n    implementation fileTree(\'libs\') {include \'*.jar\'}\r\n    [\'\', \'-opengl\', \'-glfw\'].each {\r\n        implementation \"org.lwjgl:lwjgl$it:$lwjglVersion\"\r\n        implementation \"org.lwjgl:lwjgl$it::natives-macos\"\r\n    }\r\n    implementation \"io.github.spair:imgui-java-binding:1.86.4\"\r\n    implementation \"io.github.spair:imgui-java-lwjgl3:1.86.4\"\r\n    implementation \"io.github.spair:imgui-java-natives-macos:1.86.4\"\r\n    implementation \"org.lwjgl:lwjgl\"\r\n    implementation \"org.lwjgl:lwjgl-assimp\"\r\n    implementation \"org.lwjgl:lwjgl-glfw\"\r\n    implementation \"org.lwjgl:lwjgl-nfd\"\r\n    implementation \"org.lwjgl:lwjgl-openal\"\r\n    implementation \"org.lwjgl:lwjgl-opengl\"\r\n    implementation \"org.lwjgl:lwjgl-stb\"\r\n    runtimeOnly \"org.lwjgl:lwjgl::$lwjglNatives\"\r\n    runtimeOnly \"org.lwjgl:lwjgl-assimp::$lwjglNatives\"\r\n    runtimeOnly \"org.lwjgl:lwjgl-glfw::$lwjglNatives\"\r\n    runtimeOnly \"org.lwjgl:lwjgl-nfd::$lwjglNatives\"\r\n    runtimeOnly \"org.lwjgl:lwjgl-openal::$lwjglNatives\"\r\n    runtimeOnly \"org.lwjgl:lwjgl-opengl::$lwjglNatives\"\r\n    runtimeOnly \"org.lwjgl:lwjgl-stb::$lwjglNatives\"\r\n    implementation \"org.joml:joml:1.10.4\"\r\n}\r\n\r\ntest {\r\n    useJUnitPlatform()\r\n}','T2HlC.png','2022-04-05 16:54:31',1,1),
(6,'How thread is being initialized in the below code?','This is a small snippet of a project and I am not able to understand how the thread is being initialized in the code. \"Thread client=new Thread(MainDemo::client);\". I read two ways either by extending thread class or implementing runnable interface but none is happening here so how is it working? or is it a way by which a thread can be invoked?','public class MainDemo { \r\n static Scanner in = new Scanner(System.in);\r\npublic static void main(String[] args) throws InterruptedException {\r\n    // TODO Auto-generated method stub\r\n\r\n\r\ndo{\r\n    System.out.println(\"hello\");\r\n    System.out.println(\"press 1 if client\");\r\n    System.out.println(\"press 2 if visitor\");\r\n    int option=in.nextInt();\r\n    in.nextLine();\r\n    if(option==1)\r\n    {  \r\n    Thread client=new Thread(MainDemo::client);     \r\n    client.start(); \r\n    client.join();\r\n             }\r\n         }\r\n     }\r\nstatic void client() \r\n{ // TODO Auto-generated method stub\r\n // some code \r\n}','b8f37d4f-a2ba-43f5-b4e0-004085bc20dc.png','2022-04-05 16:58:45',1,1),
(7,'How do I split my RDD into four RDDs, based on the structure?','Below is the structure of my RDD, I would like to split this into four distinct RDDs based on the second item which is the array. I would like each distinct array to be grouped into its own RDD.\r\n\r\nEg, all of the values associated with (2,3,3) should be in their own RDD.\r\n\r\nCan someone guide me towards this?','class Article(models.Model):\r\n    author = models.ForeignKey(User, blank=True, null=True, on_delete=models.DO_NOTHING)\r\n    title = models.CharField(max_length=200)\r\n    ...\r\n    class Meta:\r\n        verbose_name = \'article\'\r\n\r\nclass Question(models.Model):\r\n    author = models.ForeignKey(User, blank=True, null=True, on_delete=models.DO_NOTHING)\r\n    title = models.CharField(max_length=200)\r\n    class Meta:\r\n        verbose_name = \'question\'\r\n\r\nclass Video(models.Model):\r\n    author = models.ForeignKey(User, blank=True, null=True, on_delete=models.DO_NOTHING)\r\n    title = models.CharField(max_length=200)\r\n    ...\r\n\r\n    class Meta:\r\n        verbose_name = \'video\'','eTh9q.png','2022-04-05 17:01:08',2,1),
(8,'In PHP 8 how to check with reflection whether passing an object will work?','Now, how could one verify that passing an instance of Z to foo works but an instance of U will not? Manually, it\'d look like...\r\n\r\n','class X {\r\n}\r\nclass Y {\r\n}\r\nfunction foo(X|Y $param) {\r\n}\r\nclass Z extends Y {\r\n}\r\nclass U {\r\n}\r\n\r\n$r = new \\ReflectionFunction(\'foo\');\r\n$found = FALSE;\r\nforeach ($r->getParameters()[0]->getType()->getTypes() as $type) {\r\n  $name = $type->getName();\r\n  if ($name && is_subclass_of(\'\\Z\', $name)) {\r\n    $found = TRUE;\r\n  }\r\n}','code2.png','2022-04-06 12:54:35',3,2),
(20,'what is python','share knowledge of python','python\r\n\r\n\r\n      code','eTh9q.png','2022-04-12 14:47:30',2,14);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `about` varchar(10000) DEFAULT 'Hi ! I am using TechBlog',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `profilepic` varchar(100) DEFAULT 'default.png',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`email`,`password`,`gender`,`about`,`datetime`,`profilepic`) values 
(1,'Ankush surani','ads@gmail.com','2424','Male','pro java developer','2022-04-03 14:59:32','backimg2.avif'),
(2,'Rohit sharma','ro@gmail.com','4545','Male','mi captain','2022-04-03 15:02:52','default.png'),
(5,'Virat kohli','vk@gmail.com','1010','Male','rcb player','2022-04-03 15:31:53','default.png'),
(6,'Kl rahul','kl@gmail.com','klkl','Male','lsg captain','2022-04-03 15:45:14','default.png'),
(7,'Rishabh pant','pant@gmail.com','pant','Male','dc captain','2022-04-03 15:48:36','default.png'),
(10,'shreyas','shreyas@gmail.com','shreyas','Male','kkr captain','2022-04-03 15:56:35','default.png'),
(11,'ravindra jadeja','ravindrajadeja@gmail.com','ravindra','Male','csk captain','2022-04-03 15:59:54','default.png'),
(12,'shikhar dhawan','shikhar@gmail.com','shikhar','Male','pbks player','2022-04-03 16:02:51','default.png'),
(14,'Hardik Pandya','hp@gmail.com','hp','Male','gt captain','2022-04-12 14:46:25','default.png');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
