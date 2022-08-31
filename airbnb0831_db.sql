-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: airbnb_db
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `booking_fee_info`
--

DROP TABLE IF EXISTS `booking_fee_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_fee_info` (
  `bfi_seq` int NOT NULL AUTO_INCREMENT,
  `bfi_bi_seq` int NOT NULL,
  `bfi_basic_fee` int NOT NULL,
  `bfi_cleaning_fee` int NOT NULL,
  `bfi_service_fee` int NOT NULL,
  `bfi_total_fee` int NOT NULL,
  PRIMARY KEY (`bfi_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_fee_info`
--

LOCK TABLES `booking_fee_info` WRITE;
/*!40000 ALTER TABLE `booking_fee_info` DISABLE KEYS */;
INSERT INTO `booking_fee_info` VALUES (1,7,45000,5000,2250,482225),(2,8,45000,5000,2250,482225);
/*!40000 ALTER TABLE `booking_fee_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_guest_info`
--

DROP TABLE IF EXISTS `booking_guest_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_guest_info` (
  `bgi_seq` int NOT NULL AUTO_INCREMENT,
  `bgi_bi_seq` int NOT NULL,
  `bgi_adult` int NOT NULL,
  `bgi_child` int NOT NULL,
  `bgi_infant` int NOT NULL,
  `bgi_dog` int NOT NULL,
  PRIMARY KEY (`bgi_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_guest_info`
--

LOCK TABLES `booking_guest_info` WRITE;
/*!40000 ALTER TABLE `booking_guest_info` DISABLE KEYS */;
INSERT INTO `booking_guest_info` VALUES (1,7,1,0,0,0),(2,8,1,0,0,0);
/*!40000 ALTER TABLE `booking_guest_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_info`
--

DROP TABLE IF EXISTS `booking_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_info` (
  `bi_seq` int NOT NULL AUTO_INCREMENT,
  `bi_mi_seq` int NOT NULL,
  `bi_hi_seq` int NOT NULL,
  `bi_start_dt` datetime NOT NULL,
  `bi_end_dt` datetime NOT NULL,
  `bi_guest_phone` varchar(12) NOT NULL,
  `bi_reg_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bi_cancel_dt` datetime DEFAULT NULL,
  `bi_status` int NOT NULL DEFAULT '0',
  `bi_confirm_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`bi_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_info`
--

LOCK TABLES `booking_info` WRITE;
/*!40000 ALTER TABLE `booking_info` DISABLE KEYS */;
INSERT INTO `booking_info` VALUES (1,1,1,'2022-08-01 21:19:53','2022-08-03 21:19:53','01012345678','2022-08-04 23:43:53',NULL,1,'2022-08-04 21:19:53'),(2,1,1,'2022-08-02 21:19:53','2022-08-08 21:19:53','01012345678','2022-08-04 23:43:53',NULL,0,'2022-08-04 21:19:53'),(3,1,2,'2022-08-18 21:19:53','2022-08-20 21:19:53','01012345678','2022-08-04 23:43:53',NULL,1,'2022-08-04 21:19:53'),(4,1,1,'2022-09-02 21:19:53','2022-09-05 21:19:53','01012345678','2022-08-04 23:43:53',NULL,1,'2022-08-04 21:19:53'),(5,1,1,'2022-08-25 21:19:53','2022-08-26 21:19:53','01012345678','2022-08-04 23:43:53',NULL,0,NULL),(6,2,1,'2022-09-09 00:00:00','2022-09-10 00:00:00','010123123','2022-08-30 18:39:51',NULL,0,NULL),(7,2,1,'2022-09-01 00:00:00','2022-09-09 00:00:00','010123123','2022-08-30 18:41:22',NULL,0,NULL),(8,2,1,'2022-09-01 00:00:00','2022-09-09 00:00:00','010123123','2022-08-30 18:42:13',NULL,0,NULL);
/*!40000 ALTER TABLE `booking_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cate_bar_view`
--

DROP TABLE IF EXISTS `cate_bar_view`;
/*!50001 DROP VIEW IF EXISTS `cate_bar_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cate_bar_view` AS SELECT 
 1 AS `table_no`,
 1 AS `cate_bar_seq`,
 1 AS `cate_bar_content`,
 1 AS `cate_bar_icon`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category_amenity`
--

DROP TABLE IF EXISTS `category_amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_amenity` (
  `ca_seq` int NOT NULL AUTO_INCREMENT,
  `ca_type` int NOT NULL,
  `ca_content` varchar(20) NOT NULL,
  `ca_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ca_icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ca_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_amenity`
--

LOCK TABLES `category_amenity` WRITE;
/*!40000 ALTER TABLE `category_amenity` DISABLE KEYS */;
INSERT INTO `category_amenity` VALUES (1,1,'욕조','','amenity1_1.png'),(2,1,'헤어드라이어','','amenity1_2.png'),(3,1,'샴푸','','amenity1_3.png'),(4,1,'린스','','amenity1_4.png'),(5,1,'컨디셔너','','amenity1_5.png'),(6,1,'바디클렌저','','amenity1_6.png'),(7,1,'비데','','amenity1_7.png'),(8,1,'야외 샤워 시설','','amenity1_8.png'),(9,1,'온수','','amenity1_9.png'),(10,1,'샤워젤','','amenity1_10.png'),(11,1,'청소용품','','amenity1_11.png'),(12,2,'주방','게스트가 요리를 할 수 있는 공간',''),(13,2,'냉장고','',''),(14,2,'소형 냉장고','',''),(15,2,'냉동고','',''),(16,2,'전기밥솥','',''),(17,2,'전자레인지','',''),(18,2,'기본조리도구','냄비,후라이팬,기름,소금,후추',''),(19,2,'식기류','그릇, 젓가락, 접시, 컵 등',''),(20,2,'인덕션(전기 레인지)','',''),(21,2,'전기포트','','amenity2_10.png'),(22,2,'커피메이커',' 드립 커피','amenity2_11.png'),(23,2,'와인 잔','',''),(24,2,'토스터기','',''),(25,2,'바비큐 도구','그릴, 숯, 꼬치(대나무, 쇠) 등',''),(26,2,'식탁','',''),(27,2,'오븐','',''),(28,2,'믹서기','',''),(29,3,'필수품목','수건, 침대시트, 비누, 화장지','amenity3_1.png'),(30,3,'세탁기','','amenity3_2.png'),(31,3,'옷걸이','','amenity3_3.png'),(32,3,'여분의 베개와 담요','','amenity3_4.png'),(33,3,'침구','','amenity3_5.png'),(34,3,'의류 건조대','','amenity3_6.png'),(35,3,'모기장','',''),(36,3,'의류 보관 공간','벽장','amenity3_8.png'),(37,3,'건조기','','amenity3_9.png'),(38,3,'암막 커튼','','amenity3_10.png'),(39,3,'다리미','','amenity3_11.png'),(40,4,'TV','','amenity4_1.png'),(41,4,'게임기','','amenity4_2.png'),(42,4,'도서 및 읽을거리','','amenity4_3.png'),(43,4,'노래방','',''),(44,4,'이벤트/행사 가능','25명 이상의 그룹을 수용할 수 있는 숙소입니다.',''),(45,4,'당구대','',''),(46,4,'탁구대','',''),(47,5,'어린이용 책과 장난감','','amenity5_1.png'),(48,5,'어린이용 식기','','amenity5_2.png'),(49,5,'보드게임','','amenity5_3.png'),(50,5,'유아용 의자','','amenity5_4.png'),(51,5,'아기침대','','amenity5_5.png'),(52,6,'에어컨','','amenity6_1.png'),(53,6,'난방','',''),(54,6,'실내 벽난로','',''),(55,6,'선풍기','',''),(56,6,'중앙 난방시설','',''),(57,6,'중앙 냉방시설','',''),(58,6,'천장 선풍기','',''),(59,7,'화재경보기','','amenity7_1.png'),(60,7,'일산화탄소 경보기','','amenity7_2.png'),(61,7,'소화기','','amenity7_3.png'),(62,7,'구급 상자','','amenity7_4.png'),(63,7,'숙소 내 보안 카메라','','amenity7_5.png'),(64,8,'무선 인터넷','','amenity8_1.png'),(65,8,'업무 전용 공간','테이블 포함','');
/*!40000 ALTER TABLE `category_amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_country`
--

DROP TABLE IF EXISTS `category_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_country` (
  `cc_seq` int NOT NULL AUTO_INCREMENT,
  `cc_content` varchar(20) NOT NULL,
  PRIMARY KEY (`cc_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_country`
--

LOCK TABLES `category_country` WRITE;
/*!40000 ALTER TABLE `category_country` DISABLE KEYS */;
INSERT INTO `category_country` VALUES (1,'콩고'),(2,'대만'),(3,'홍콩'),(4,'멕시코'),(5,'괌'),(6,'독일'),(7,'말리'),(8,'한국'),(9,'헝가리'),(10,'가나'),(11,'가봉'),(12,'가이아나'),(13,'그리스'),(14,'그린란드'),(15,'기니비사우'),(16,'남아프리카'),(17,'네팔'),(18,'네덜란드'),(19,'노르웨이'),(20,'뉴질랜드'),(21,'니우에'),(22,'니제르'),(23,'덴마크'),(24,'라이베리아'),(25,'러시아'),(26,'룩셈부르크'),(27,'말레이시아'),(28,'멕시코'),(29,'모잠비크'),(30,'몽골');
/*!40000 ALTER TABLE `category_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_lang`
--

DROP TABLE IF EXISTS `category_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_lang` (
  `cl_seq` int NOT NULL AUTO_INCREMENT,
  `cl_content` varchar(20) NOT NULL,
  PRIMARY KEY (`cl_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_lang`
--

LOCK TABLES `category_lang` WRITE;
/*!40000 ALTER TABLE `category_lang` DISABLE KEYS */;
INSERT INTO `category_lang` VALUES (1,'프랑스'),(2,'독일어'),(3,'일본어'),(4,'이탈리아어'),(5,'스페인어'),(6,'러시아어'),(7,'중국어'),(8,'태국어'),(9,'터키어'),(10,'스웨던어'),(11,'필란드어'),(12,'체코어'),(13,'노루웨이어'),(14,'덴마크어');
/*!40000 ALTER TABLE `category_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_place`
--

DROP TABLE IF EXISTS `category_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_place` (
  `cp_seq` int NOT NULL AUTO_INCREMENT,
  `cp_type` int NOT NULL,
  `cp_content` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cp_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cp_icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`cp_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_place`
--

LOCK TABLES `category_place` WRITE;
/*!40000 ALTER TABLE `category_place` DISABLE KEYS */;
INSERT INTO `category_place` VALUES (1,1,'해변','',''),(2,1,'운하','',''),(3,1,'호수','',''),(4,1,'바다','',''),(5,1,'산','',''),(6,1,'계곡','시원한 물이 흐르는 계곡이 가까이에 위치하고 있습니다.',''),(7,1,'사막','사방이 모래로 둘러싼 황량한 사막에 위치하고 있습니다.',''),(8,1,'동토','사방이 눈과 얼음인 동토에 위치하고 있습니다.',''),(9,1,'도시 스카이라인','도시 스카이라인을 볼 수 있는 고층에 위치하고 있습니다.',''),(10,1,'섬','사방이 바다로 둘러싼 섬에 위치하고 있습니다.',''),(11,1,'열대','이국적인 수림이 우거진 열대지방에 위치하고 있습니다.',''),(12,2,'호수나 강과 인접','수변에 위치',''),(13,2,'공용 해변과 인접','게스트가 근처의 해변을 즐길 수 있습니다.',''),(14,2,'게스트 전용 출입문','별도의 출입로 또는 건물 입구',''),(15,2,'인근의 빨래방','',''),(16,2,'리조트 무료 이용 가능','게스트가 근처의 리조트 시설을 이용할 수 있습니다.',''),(17,2,'골프장 인접','게스트가 근처의 골프장 시설을 이용할 수 있습니다.',''),(18,2,'국립공원 인접','게스트가 근처의 국립공원 시설을 이용할 수 있습니다.',''),(19,2,'마리나 인접','게스트가 근처의 마리나 시설을 이용할 수 있습니다.',''),(20,2,'여객항 인접','게스트가 근처의 여객항 시설을 이용할 수 있습니다.',''),(21,2,'스키를 탈 수 있는 장소 인접','게스트가 근처의 장소에서 스키를 탈 수 있습니다.',''),(22,3,'파티오 또는 발코니','',''),(23,3,'전용 뒷마당','숙소의 개방된 공간으로 보통 잔디로 덮여 있습니다.',''),(24,3,'야외 가구','',''),(25,3,'야외 식사 공간','',''),(26,3,'바비큐 그릴','',''),(27,3,'해먹','',''),(28,3,'전용 야외 주방','',''),(29,3,'해수욕 필수품','비치타월, 우산, 해변용 담요, 스노클링 장비',''),(30,3,'카약','',''),(31,3,'자전거','',''),(32,4,'건물 진입로 무료 주차','',''),(33,4,'건물 내부 무료 주차 공간','',''),(34,4,'건물 내부 유료 주차 공간','',''),(35,4,'건물 외부 무료 주차 공간','',''),(36,4,'건물 외부 유료 주차 공간','',''),(37,4,'전기차 충전시설','게스트는 숙소에서 전기차를 충전할 수 있습니다.',''),(38,4,'엘리베이터','숙소 또는 건물 내부에 내부 깊이 132cm, 입구 폭 81cm 이상의 엘리베이터가 있습니다.',''),(39,4,'수영장','',''),(40,4,'온천','',''),(41,4,'단층 주택','숙소에 계단 없음',''),(42,4,'헬스장','',''),(43,5,'여행 가방 보관 가능','',''),(44,5,'호스트가 게스트를 맞이함/셀프 체크인','',''),(45,5,'장기 숙박 가능','',''),(46,5,'반려동물 입실 가능','',''),(47,5,'아침식사','',''),(48,5,'스마트록','',''),(49,5,'열쇠 보관함','',''),(50,5,'안내 직원','','');
/*!40000 ALTER TABLE `category_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_sort`
--

DROP TABLE IF EXISTS `category_sort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_sort` (
  `cs_seq` int NOT NULL AUTO_INCREMENT,
  `cs_content` varchar(20) NOT NULL,
  `cs_icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cs_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_sort`
--

LOCK TABLES `category_sort` WRITE;
/*!40000 ALTER TABLE `category_sort` DISABLE KEYS */;
INSERT INTO `category_sort` VALUES (1,'아파트','sort1.png'),(2,'주택','sort2.png'),(3,'호텔','sort3.png'),(4,'별채','sort4.png'),(5,'독특한숙소','sort5.png'),(6,'B&B','sort6.png');
/*!40000 ALTER TABLE `category_sort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_sort_detail`
--

DROP TABLE IF EXISTS `category_sort_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_sort_detail` (
  `csd_seq` int NOT NULL AUTO_INCREMENT,
  `csd_cs_seq` int NOT NULL,
  `csd_content` varchar(20) NOT NULL,
  `csd_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `csd_icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`csd_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_sort_detail`
--

LOCK TABLES `category_sort_detail` WRITE;
/*!40000 ALTER TABLE `category_sort_detail` DISABLE KEYS */;
INSERT INTO `category_sort_detail` VALUES (1,1,'공동주택','다세대건물 또는 단지 내의 임대 공간입니다.','sortdetail1.png'),(2,1,'콘도','거주자 소유의 다세대 건물 또는 단지 내의 공간을 의미합니다.','sortdetail2.png'),(3,1,'로프트','개방적인 구조의 아파트나 콘도로 내부가 낮은 벽으로 마감되었을 수 있습니다.','sortdetail3.png'),(4,2,'집','단독 또는 연립주택입니다.','sortdetail4.png'),(5,2,'통나무집','목재 등의 천연 재료로 지은 자연속의 집입니다.','sortdetail5.png'),(6,2,'저택','널찍한 실내외 공간,정원,수영장 등을 갖춘 고급 주택입니다.','sortdetail6.png'),(7,2,'타운하우스','여러층으로 된 연립주택으로 옆 세대의 건물과 붙어 있으며 야외 공간을 공유하기도 합니다.','sortdetail7.png'),(8,2,'전원주택','시골이나 호숫가, 해변가에 지어진 아담한 주택입니다.','sortdetail8.png'),(9,2,'방갈로','넓은 현관과 박공 지붕을 갖춘 단층 주택입니다.','sortdetail9.png'),(10,2,'오두막','짚을 엮어 만든 지붕처럼 나무나 진흙을 재료로 만든 집을 말합니다.','sortdetail10.png'),(11,2,'키클라데스 주택','그리스 키클라데스 섬에서 볼 수 있는 새하얀 가옥으로, 평평한 지붕을 갖추고 있습니다.','sortdetail11.png'),(12,2,'샬레','스키 또는 여름 휴가용으로 인기 있으며 박공 지붕을 갖춘 목조 주택을 의미합니다.','sortdetail12.png'),(13,2,'담무소','판텔레리아 섬에 있는 돌로 만든 주택으로, 돔 지붕을 갖추고 있습니다.','sortdetail13.png'),(14,2,'초소형 주택','37제곱미터(400제곱피트) 이하의 단독 주택을 말합니다','sortdetail14.png'),(15,2,'트룰로','이탈리아에서 유래된 둥근 형태의 석조 주택으로, 원뿔 모양의 지붕을 하고 있습니다.','sortdetail15.png'),(16,2,'펜션','한국 시골에 자리한 숙소로 바비큐 시설과 공용 공간을 갖추고 있습니다.','sortdetail16.png'),(17,3,'호텔','개인실,스위트룸 또는 독특한 공간을 제공하는 숙박업체입니다.','sortdetail17.png'),(18,3,'호스텔','다인실이나 개인실을 제공하는 숙박업체입니다.','sortdetail18.png'),(19,3,'리조트','호텔보다 더 많은 편의시설과 서비스를 제공하는 숙박업체입니다.','sortdetail19.png'),(20,3,'부티크 호텔','독특한 스타일이나 개성 있는 분위기의 테마로 꾸며진 숙박업체입니다.','sortdetail21.png'),(21,3,'아파트 호텔','호텔 같은 편의시설과 객실을 갖춘 공간으로, 아파트와 비슷합니다.','sortdetail22.png'),(22,3,'레지던스','전문 관리업체가 운영하는 아파트로, 호텔 같은 편안함을 갖추고 있습니다.','sortdetail23.png'),(23,3,'헤리티지 호텔','숙박용으로 개조된 인도의 역사적인 건물입니다.','sortdetail24.png'),(24,3,'객잔','현지 감성과 세련된 편의시설을 갖춘 중국 숙소입니다.','sortdetail25.png'),(25,4,'게스트용 별채','본채와 떨어진 별도의 건물입니다.','sortdetail26.png'),(26,4,'게스트 스위트','더 큰 구조물의 안에 있거나 나란히 붙어 있는 별도의 공간으로 전용 출입구를 갖추고 있습니다.','sortdetail27.png'),(27,4,'농장 체험 숙소','게스트가 농사를 짓는 환경 속에서 또는 동물들과 함께 지낼 수 있는 농촌 숙소입니다.','sortdetail28.png'),(28,4,'휴가용주택','주방과 욕실이 있고, 가구가 완비된 임대 숙소로, 리셉션 데스크와 같은 일부 서비스를 게스트에게 제공할 수 있습니다.','sortdetail29.png'),(29,5,'헛간','곡물, 가축 농기구를 상시 저장하는 곳에서 주거용으로 개조된 공간을 말합니다.','sortdetail30.png'),(30,5,'보트','숙박기간 동안 정박 중인 배,보트,요트로,하우스보트와는 다릅니다.','sortdetail31.png'),(31,5,'버스','내부를 독창적으로 개조한 다인승 차량입니다.','sortdetail32.png'),(32,5,'캠핑카','집과 차량의 중간 형태를 띤 주거용 차량이나 캠핑 트레일러를 말합니다.','sortdetail33.png'),(33,5,'트리하우스','나무 몸통이나 가지 또는 주변 기중에 기어진 구조물입니다.','sortdetail34.png'),(34,5,'캠핑장','게스트가 텐트,유르트,캠핑카,초소형주택 등을 직접 세울 수 있는 땅을 의미합니다.','sortdetail35.png'),(35,5,'성','탑이나 호가 딸린 웅장하고 유서 깊은 건물입니다','sortdetail36.png'),(36,5,'동굴','언덕이나 절벽에 자연적 또는 인공적으로 형성된 곳에 마련된 거주 공간입니다.','sortdetail37.png'),(37,5,'돔하우스','지붕이 돔 형태로 되어 있거나 전체가 완전히 구 형태로 이루어진 집입니다.','sortdetail38.png'),(38,5,'복토주택','땅속에 짓거나 흙 등의 재료로 만든 집을 말합니다.','sortdetail39.png'),(39,5,'야영장','호주나 뉴질랜드의 넓은 부지로, 캠핑장이나 통나무집 등의 숙소를 제공합니다.','sortdetail40.png'),(40,5,'하우스보트','육상 주택과 비슷한 자재로 건축된 수상 가옥입니다.','sortdetail41.png'),(41,5,'오두막','짚을 엮어 만든 지붕처럼 나무나 진흙을 재료로 만든 집을 말합니다.','sortdetail42.png'),(42,5,'아이스 돔','눈과 얼음으로 만든 돔 형태의 구조물로, 추운 지역에 위치합니다.','sortdetail43.png'),(43,5,'섬','사방이 물로 둘러싸인 땅을 말합니다.','sortdetail44.png'),(44,5,'등대','배를 안내하기 위해 사방으로 밝은 빛을 비추는 수변 탑을 의미합니다.','sortdetail45.png'),(45,5,'비행기','숙박용으로 개조된 항공기입니다.','sortdetail46.png'),(46,5,'목장','가축을 기르는 용도의 넓은 부지에 세워진 주택을 말합니다.','sortdetail47.png'),(47,5,'종교 건물','교회나 모스크 같은 옛 예배 장소를 주거용으로 개조한 건물을 지칭합니다.','sortdetail48.png'),(48,5,'마차','양치기가 양을 몰면서 주거용으로 사용한 작은 화차를 의미합니다.','sortdetail49.png'),(49,5,'컨테이너 하우스','화물 운송용 철제 컨테이너를 개조한 공간입니다.','sortdetail50.png'),(50,5,'텐트','일반적으로 천과 막대로 세우는 구조물입니다.','sortdetail51.png'),(51,5,'티피','막대기로 세우는 원뿔 모양의 텐트로, 위쪽은 열려 있고 문에는 지퍼가 달려 있습니다.','sortdetail52.png'),(52,5,'타워','주변 지역 전망을 즐길 수 있는 자립구조물입니다.','sortdetail53.png'),(53,5,'기차','주거용으로 개조된 승무원실,화물 차량 또는 기타 철도 차량 말합니다.','sortdetail54.png'),(54,5,'풍차','풍력 발전에 사용된 적이 있는 구조물을 주거용으로 개조한 공간입니다.','sortdetail55.png'),(55,5,'유르트','접이식 목제 프레임으로 만든 둥근 텐트입니다.','sortdetail56.png'),(56,5,'리아드','야외 마당이나 정원 주변에 지어진 모로코 전통 주택입니다.','sortdetail57.png'),(57,6,'B&B','호스트가 상주하며 아침 식사를 제공하는 숙박업체입니다.','sortdetail58.png'),(58,6,'산장','숲이나 산 등 자연 가까이 자리한 숙박업체입니다.','sortdetail59.png'),(59,6,'만수','대만에서 개인실을 제공하는 숙박업체입니다.','sortdetail60.png'),(60,6,'카사 파르티쿨라르','B&B와 비슷한 쿠바 숙소로, 호스트가 거주하는 집 안 개인실을 의미합니다.','sortdetail61.png'),(61,6,'료칸','독특한 일본 문화를 경험할 수 있는 작은 여관을 말합니다.','sortdetail62.png');
/*!40000 ALTER TABLE `category_sort_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_review_info`
--

DROP TABLE IF EXISTS `guest_review_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest_review_info` (
  `grev_seq` int NOT NULL AUTO_INCREMENT,
  `grev_profile_mi_seq` int NOT NULL,
  `grev_writer_mi_seq` int NOT NULL,
  `grev_content` varchar(255) NOT NULL,
  `gev_public` int NOT NULL DEFAULT '0',
  `grev_reg_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`grev_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_review_info`
--

LOCK TABLES `guest_review_info` WRITE;
/*!40000 ALTER TABLE `guest_review_info` DISABLE KEYS */;
INSERT INTO `guest_review_info` VALUES (1,21,2,'21회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(2,22,2,'22회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(3,23,2,'23회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(4,24,2,'24회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(5,25,2,'25회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(6,26,2,'26회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(7,27,2,'27회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(8,28,2,'28회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(9,29,2,'29회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(10,30,2,'30회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(11,31,2,'31회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(12,32,2,'32회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(13,33,2,'33회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(14,34,2,'34회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(15,35,2,'35회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(16,36,2,'36회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(17,37,2,'37회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(18,38,2,'38회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(19,39,2,'39회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(20,40,2,'40회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(21,37,2,'37회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(22,38,2,'38회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(23,39,2,'39회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(24,40,2,'40회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(25,32,2,'32회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(26,33,2,'33회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(27,34,2,'34회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(28,35,3,'35회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(29,36,3,'36회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(30,26,3,'26회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(31,27,3,'27회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(32,28,3,'28회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(33,29,3,'29회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(34,30,3,'30회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(35,31,3,'31회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(36,21,3,'21회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(37,22,3,'22회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(38,23,3,'23회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(39,24,3,'24회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08'),(40,25,3,'25회원님 이용해 주셔서 감사합니다 다음에 또 이용해주세용',1,'2022-08-10 15:03:08');
/*!40000 ALTER TABLE `guest_review_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_review_point`
--

DROP TABLE IF EXISTS `guest_review_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest_review_point` (
  `grpo_seq` int NOT NULL AUTO_INCREMENT,
  `grpo_grev_seq` int NOT NULL,
  `grpo_clean_point` int NOT NULL,
  `grpo_correct_point` int NOT NULL,
  `grpo_communication_point` int NOT NULL,
  PRIMARY KEY (`grpo_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_review_point`
--

LOCK TABLES `guest_review_point` WRITE;
/*!40000 ALTER TABLE `guest_review_point` DISABLE KEYS */;
INSERT INTO `guest_review_point` VALUES (1,1,1,5,1),(2,2,2,4,2),(3,3,3,3,3),(4,4,4,2,4),(5,5,5,1,5),(6,6,5,1,5),(7,7,4,2,4),(8,8,3,3,3),(9,9,2,4,2),(10,10,1,5,1),(11,11,1,5,1),(12,12,2,4,2),(13,13,3,3,3),(14,14,4,2,4),(15,15,5,1,5),(16,16,5,1,5),(17,17,4,2,4),(18,18,3,3,3),(19,19,2,4,2),(20,20,1,5,1),(21,21,1,5,1),(22,22,2,4,2),(23,23,3,3,3),(24,24,4,2,4),(25,25,5,1,5),(26,26,5,1,5),(27,27,4,2,4),(28,28,3,3,3),(29,29,2,4,2),(30,30,1,5,1),(31,31,1,5,1),(32,32,2,4,2),(33,33,3,3,3),(34,34,4,2,4),(35,35,5,1,5),(36,36,5,1,5),(37,37,4,2,4),(38,38,3,3,3),(39,39,2,4,2),(40,40,1,5,1);
/*!40000 ALTER TABLE `guest_review_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_address_info`
--

DROP TABLE IF EXISTS `house_address_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house_address_info` (
  `hai_seq` int NOT NULL AUTO_INCREMENT,
  `hai_hi_seq` int NOT NULL,
  `hai_cc_seq` int NOT NULL,
  `hai_city` varchar(20) NOT NULL,
  `hai_detail` varchar(50) NOT NULL,
  PRIMARY KEY (`hai_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_address_info`
--

LOCK TABLES `house_address_info` WRITE;
/*!40000 ALTER TABLE `house_address_info` DISABLE KEYS */;
INSERT INTO `house_address_info` VALUES (1,1,3,'홀콩45','135-45'),(2,2,4,'멕시코시티','556-45'),(3,3,4,'과달라하라','115-8'),(4,4,4,'타후아나','454-5'),(5,5,4,'레온','154-10'),(6,6,4,'몬테레이','415-12'),(7,7,4,'칸쿤','784-4'),(8,8,5,'데데도','448-83'),(9,9,5,'조냐','782-24'),(10,10,5,'다무닝','491-45'),(11,11,5,'하갓냐','484-15'),(12,12,6,'베를린','115-9'),(13,13,6,'뮌헨','989-15'),(14,14,6,'에센','877-11'),(15,15,6,'라이프치히','446-7'),(16,16,6,'함부르크','987-23'),(17,17,6,'뉘렌베르크','991-2'),(18,18,6,'슈투르가르트','978-1'),(19,19,6,'드레스덴','458-4'),(20,20,6,'프라이부르크','44-41'),(21,21,6,'쾰른','210-9'),(22,22,6,'마인츠','113-4'),(23,23,6,'레겐스부르크','215-4'),(24,24,8,'서울','54-12'),(25,25,8,'대구','48-411'),(26,26,8,'부산','135-11'),(27,27,8,'대전','154-41'),(28,28,8,'경주','315-16'),(29,29,8,'전주','310-1'),(30,30,8,'광주','84-7'),(31,31,13,'아테네','401-12'),(32,32,13,'테살로니카','411-1'),(33,33,13,'파트라스','44-123'),(34,34,13,'코린트','461-46'),(35,35,13,'마틸리니','56-13'),(36,36,13,'헤라클레온','46-12'),(37,37,13,'델포이','46-5121'),(38,38,16,'케이프타운','46-121'),(39,39,16,'요하네스버그','50-10'),(40,40,16,'다반','512-2'),(41,41,17,'카트만두','55-41'),(42,42,17,'포카라','46-112'),(43,43,18,'암스테르담','110-10'),(44,44,18,'로테르담','115-8'),(45,45,18,'위트레흐트','113-11'),(46,46,18,'아른헴','178-8'),(47,47,18,'에인트호벤','49-21'),(48,48,19,'오슬로','50-5'),(49,49,19,'베르겐','466-22'),(50,50,19,'스타방에르','423-21');
/*!40000 ALTER TABLE `house_address_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_amenity_info`
--

DROP TABLE IF EXISTS `house_amenity_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house_amenity_info` (
  `ham_seq` int NOT NULL AUTO_INCREMENT,
  `ham_hi_seq` int NOT NULL,
  `ham_ca_seq` int NOT NULL,
  PRIMARY KEY (`ham_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_amenity_info`
--

LOCK TABLES `house_amenity_info` WRITE;
/*!40000 ALTER TABLE `house_amenity_info` DISABLE KEYS */;
INSERT INTO `house_amenity_info` VALUES (1,1,59),(2,2,4),(3,3,10),(4,4,8),(5,5,1),(6,6,10),(7,7,35),(8,8,10),(9,9,13),(10,10,7),(11,1,3),(12,2,5),(13,3,17),(14,4,12),(15,5,31),(16,6,15),(17,7,38),(18,8,11),(19,9,15),(20,10,12),(21,1,5),(22,2,6),(23,3,21),(24,4,16),(25,5,35),(26,6,20),(27,7,39),(28,8,15),(29,9,16),(30,10,31),(31,1,7),(32,2,7),(33,3,33),(34,4,46),(35,5,44),(36,6,40),(37,7,36),(38,8,16),(39,9,20),(40,10,44),(41,1,9),(42,2,9),(43,3,49),(44,4,54),(45,5,50),(46,6,44),(47,7,40),(48,8,20),(49,9,50),(50,10,48),(51,11,10),(52,12,20),(53,13,30),(54,14,40),(55,15,50),(56,16,60),(57,17,36),(58,18,21),(59,19,8),(60,20,28),(61,11,12),(62,12,21),(63,13,33),(64,14,41),(65,15,51),(66,16,61),(67,17,39),(68,18,24),(69,19,26),(70,20,30),(71,11,13),(72,12,23),(73,13,35),(74,14,42),(75,15,55),(76,16,62),(77,17,48),(78,18,39),(79,19,29),(80,20,33),(81,11,14),(82,12,25),(83,13,36),(84,14,44),(85,15,57),(86,16,64),(87,17,51),(88,18,41),(89,19,33),(90,20,35),(91,11,15),(92,12,29),(93,13,38),(94,14,45),(95,15,58),(96,16,65),(97,17,57),(98,18,43),(99,19,37),(100,20,39);
/*!40000 ALTER TABLE `house_amenity_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_daily_option`
--

DROP TABLE IF EXISTS `house_daily_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house_daily_option` (
  `hdo_seq` int NOT NULL AUTO_INCREMENT,
  `hdo_hi_seq` int NOT NULL,
  `hdo_name` varchar(20) NOT NULL,
  `hdo_rate` int NOT NULL,
  `hdo_enable` int NOT NULL DEFAULT '1',
  `hdo_enable_dt` date NOT NULL DEFAULT '2023-01-01',
  `hdo_reg_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hdo_seq`),
  UNIQUE KEY `hdo_hi_seq` (`hdo_hi_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_daily_option`
--

LOCK TABLES `house_daily_option` WRITE;
/*!40000 ALTER TABLE `house_daily_option` DISABLE KEYS */;
INSERT INTO `house_daily_option` VALUES (1,1,'숙소1 매일할증',10,1,'2023-01-01','2022-08-19 18:12:49'),(2,2,'숙소2 매일할증',5,1,'2023-01-01','2022-08-19 18:12:49'),(3,3,'숙소3 DISABLED',50,0,'2023-01-01','2022-08-19 18:12:49'),(4,4,'숙소4 매일할인',-10,1,'2023-01-01','2022-08-19 18:12:49'),(5,5,'숙소5 매일할인',-5,1,'2023-01-01','2022-08-19 18:12:49');
/*!40000 ALTER TABLE `house_daily_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_fee_info`
--

DROP TABLE IF EXISTS `house_fee_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house_fee_info` (
  `hfi_seq` int NOT NULL AUTO_INCREMENT,
  `hfi_hi_seq` int NOT NULL,
  `hfi_base_price` int NOT NULL DEFAULT '0',
  `hfi_cleaning_fee` int DEFAULT NULL,
  `hfi_service_fee` int NOT NULL DEFAULT '5' COMMENT '서비스요금은 기본요금에서 비율로 계산',
  PRIMARY KEY (`hfi_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_fee_info`
--

LOCK TABLES `house_fee_info` WRITE;
/*!40000 ALTER TABLE `house_fee_info` DISABLE KEYS */;
INSERT INTO `house_fee_info` VALUES (1,1,45000,5000,5),(2,2,80000,8000,5),(3,3,84000,6000,5),(4,4,80000,10000,5),(5,5,40000,8800,5),(6,6,46000,9500,5),(7,7,71000,10000,5),(8,8,46000,5000,5),(9,9,31000,8000,5),(10,10,33000,5000,5),(11,11,55000,5000,5),(12,12,70000,8000,5),(13,13,56000,6000,5),(14,14,85000,10000,5),(15,15,44000,8800,5),(16,16,44000,9500,5),(17,17,70000,10000,5),(18,18,58000,5000,5),(19,19,20000,8000,5),(20,20,35000,5000,5),(21,21,40000,5000,5),(22,22,65000,8000,5),(23,23,38000,6000,5),(24,24,88000,10000,5),(25,25,46000,8800,5),(26,26,48000,9500,5),(27,27,46000,10000,5),(28,28,50000,5000,5),(29,29,21000,8000,5),(30,30,46000,5000,5),(31,31,26000,5000,5),(32,32,64000,8000,5),(33,33,54000,6000,5),(34,34,91000,10000,5),(35,35,25000,8800,5),(36,36,40000,9500,5),(37,37,48000,10000,5),(38,38,55000,5000,5),(39,39,25000,8000,5),(40,40,41000,5000,5),(41,41,36000,5000,5),(42,42,54000,8000,5),(43,43,61000,6000,5),(44,44,90000,10000,5),(45,45,64000,8800,5),(46,46,41000,9500,5),(47,47,54000,10000,5),(48,48,65000,5000,5),(49,49,46000,8000,5),(50,50,40000,5000,5);
/*!40000 ALTER TABLE `house_fee_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_guest_info`
--

DROP TABLE IF EXISTS `house_guest_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house_guest_info` (
  `hgi_seq` int NOT NULL AUTO_INCREMENT,
  `hgi_hi_seq` int NOT NULL,
  `hgi_guest` int NOT NULL,
  `hgi_bed` int NOT NULL,
  `hgi_bedroom` int NOT NULL,
  `hgi_bathroom` int NOT NULL,
  `hgi_dog` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`hgi_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_guest_info`
--

LOCK TABLES `house_guest_info` WRITE;
/*!40000 ALTER TABLE `house_guest_info` DISABLE KEYS */;
INSERT INTO `house_guest_info` VALUES (1,1,6,6,2,2,0),(2,2,2,2,1,1,0),(3,3,2,2,1,1,0),(4,4,4,4,2,2,1),(5,5,2,2,1,1,0),(6,6,6,6,2,2,0),(7,7,2,2,1,1,0),(8,8,2,2,1,1,0),(9,9,4,4,2,2,1),(10,10,4,4,2,2,1),(11,11,8,8,4,2,0),(12,12,4,4,1,1,0),(13,13,4,2,1,1,0),(14,14,4,4,2,2,1),(15,15,4,4,4,1,0),(16,16,6,6,4,1,0),(17,17,5,6,2,1,0),(18,18,6,6,2,1,0),(19,19,4,4,2,1,1),(20,20,4,4,2,1,1),(21,21,8,8,4,2,0),(22,22,6,8,4,2,0),(23,23,6,6,4,2,0),(24,24,8,8,4,2,1),(25,25,4,2,2,2,0),(26,26,4,4,4,1,0),(27,27,4,4,2,1,0),(28,28,6,6,3,1,0),(29,29,8,8,4,2,1),(30,30,4,4,1,1,0),(31,31,8,8,8,2,0),(32,32,5,6,3,1,0),(33,33,6,6,3,2,0),(34,34,8,8,4,2,1),(35,35,4,4,4,1,1),(36,36,8,6,6,2,0),(37,37,8,8,4,2,0),(38,38,5,4,2,1,0),(39,39,8,8,4,2,1),(40,40,5,5,3,2,0),(41,41,4,6,3,2,0),(42,42,8,8,5,2,0),(43,43,5,4,2,1,0),(44,44,4,4,4,1,1),(45,45,8,8,4,2,0),(46,46,4,6,4,2,0),(47,47,8,8,5,2,0),(48,48,5,4,2,1,0),(49,49,4,4,4,1,1),(50,50,8,8,4,2,0);
/*!40000 ALTER TABLE `house_guest_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_img`
--

DROP TABLE IF EXISTS `house_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house_img` (
  `himg_seq` int NOT NULL AUTO_INCREMENT,
  `himg_hi_seq` int NOT NULL,
  `himg_file` varchar(50) NOT NULL,
  `himg_main` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`himg_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_img`
--

LOCK TABLES `house_img` WRITE;
/*!40000 ALTER TABLE `house_img` DISABLE KEYS */;
INSERT INTO `house_img` VALUES (1,1,'house_1.png',1),(2,2,'house_2.png',1),(3,3,'house_3.png',1),(4,4,'house_4.png',1),(5,5,'house_5.png',1),(6,6,'house_6.png',1),(7,7,'house_7.png',1),(8,8,'house_8.png',1),(9,9,'house_9.png',1),(10,10,'house_10.png',1),(11,11,'house_11.png',1),(12,12,'house_12.png',1),(13,13,'house_13.png',1),(14,14,'house_14.png',1),(15,15,'house_15.png',1),(16,16,'house_16.png',1),(17,17,'house_17.png',1),(18,18,'house_18.png',1),(19,19,'house_19.png',1),(20,20,'house_20.png',1),(21,21,'house_21.png',1),(22,22,'house_22.png',1),(23,23,'house_23.png',1),(24,24,'house_24.png',1),(25,25,'house_25.png',1),(26,26,'house_26.png',1),(27,27,'house_27.png',1),(28,28,'house_28.png',1),(29,29,'house_29.png',1),(30,30,'house_30.png',1),(31,31,'house_31.png',1),(32,32,'house_32.png',1),(33,33,'house_33.png',1),(34,34,'house_34.png',1),(35,35,'house_35.png',1),(36,36,'house_36.png',1),(37,37,'house_37.png',1),(38,38,'house_38.png',1),(39,39,'house_39.png',1),(40,40,'house_40.png',1),(41,41,'house_41.png',1),(42,42,'house_42.png',1),(43,43,'house_43.png',1),(44,44,'house_44.png',1),(45,45,'house_45.png',1),(46,46,'house_46.png',1),(47,47,'house_47.png',1),(48,48,'house_48.png',1),(49,49,'house_49.png',1),(50,50,'house_50.png',1),(51,1,'house_51.png',0),(52,1,'house_52.png',0),(53,1,'house_53.png',0),(54,1,'house_54.png',0),(55,2,'house_55.png',0),(56,2,'house_56.png',0),(57,2,'house_57.png',0),(58,2,'house_58.png',0),(59,52,'house_1660511649105.png',1),(60,52,'house_1660511669472.png',0),(61,53,'house_1660511649105.png',1),(62,53,'house_1660511669472.png',0),(63,54,'house_1660511966902.png',0),(64,54,'house_1660511968802.png',0),(65,54,'house_1660511971131.png',0),(66,54,'house_1660511973202.png',1),(67,55,'house_1660617105553.png',1),(68,55,'house_1660617107299.png',0),(69,56,'house_1660617105553.png',1),(70,56,'house_1660617107299.png',0),(71,57,'house_1661307991160.png',1),(72,58,'house_1661309348139.png',0),(73,59,'house_1661309563438.png',1);
/*!40000 ALTER TABLE `house_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_info`
--

DROP TABLE IF EXISTS `house_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house_info` (
  `hi_seq` int NOT NULL AUTO_INCREMENT,
  `hi_mi_seq` int NOT NULL,
  `hi_csd_seq` int NOT NULL,
  `hi_name` varchar(50) NOT NULL,
  `hi_type` int NOT NULL,
  `hi_description` varchar(255) NOT NULL,
  `hi_status` int NOT NULL DEFAULT '0',
  `hi_host_phone` varchar(12) NOT NULL,
  `hi_refund_day` int NOT NULL DEFAULT '5',
  `hi_rule` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hi_check_in` varchar(100) NOT NULL,
  `hi_check_out` varchar(100) NOT NULL,
  `hi_reg_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hi_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_info`
--

LOCK TABLES `house_info` WRITE;
/*!40000 ALTER TABLE `house_info` DISABLE KEYS */;
INSERT INTO `house_info` VALUES (1,2,1,'숙소1',1,'1, 2, 3베드룸 구성의 넓고 세련된 객실과 스위트를 제공하는 Angsana는 모든 규모의 회의 및 이벤트에 적합합니다. 저희 리조트는 특화된 이벤트 팀과 완벽한 서비스와 함께 멋진 위치에 있는 독특한 실내 및 실외 공간을 갖추고 있습니다. 창의적인 이벤트와 탁월한 회의를 보장받을 수 있습니다.',0,'01012345678',5,'추가 규칙 \n-숙소, 직원 및 이웃을 존중해 주세요.\n-예약된 사람보다 더 많은 인원이 방갈로에 입장할 수는 없습니다.\n-흡연은 밖에서만 허용됩니다.\n-귀중품을 안전 금고에 보관하세요.\n-18시 이후에 도착할 때는 내 개인 운전사를 이용해야 합니다. Www.airporttransferbali.com을 통해 공항 환승을 예약할 수 있습니다.\n-기대에 부합하지 않는 사항이 있을 경우, 숙박 중 저에게 연락하여 해결책을 찾으세요!\n가장 중요합니다. 편안한 숙박을 즐기고 편안한 분위기를 만들어보세요!','오후 3시부터 체크인 가능','오전 10시까지 나가주세요~','2022-08-10 14:39:01'),(2,2,2,'숙소2',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(3,2,3,'숙소3',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(4,2,4,'숙소4',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(5,2,5,'숙소5',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(6,3,6,'숙소6',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(7,3,7,'숙소7',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(8,3,8,'숙소8',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(9,3,9,'숙소9',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(10,3,10,'숙소10',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(11,4,11,'숙소11',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(12,4,12,'숙소12',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(13,4,13,'숙소13',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(14,4,14,'숙소14',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(15,4,15,'숙소15',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(16,5,16,'숙소16',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(17,5,17,'숙소17',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(18,5,18,'숙소18',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(19,5,19,'숙소19',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(20,5,20,'숙소20',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(21,6,21,'숙소21',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(22,6,22,'숙소22',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(23,6,23,'숙소23',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(24,6,24,'숙소24',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(25,6,25,'숙소25',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(26,7,26,'숙소26',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(27,7,27,'숙소27',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(28,7,28,'숙소28',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(29,7,29,'숙소29',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(30,7,30,'숙소30',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(31,8,31,'숙소31',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(32,8,32,'숙소32',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(33,8,33,'숙소33',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(34,8,34,'숙소34',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(35,8,35,'숙소35',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(36,9,36,'숙소36',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(37,9,37,'숙소37',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(38,9,38,'숙소38',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(39,9,39,'숙소39',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(40,9,40,'숙소40',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(41,10,41,'숙소41',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(42,11,42,'숙소42',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(43,12,43,'숙소43',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(44,13,44,'숙소44',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(45,14,45,'숙소45',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(46,15,46,'숙소46',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(47,16,47,'숙소47',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(48,17,48,'숙소48',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(49,18,49,'숙소49',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01'),(50,19,50,'숙소50',1,'설명',0,'01012345678',5,'추가이용규칙','','','2022-08-10 14:39:01');
/*!40000 ALTER TABLE `house_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_monthly_option`
--

DROP TABLE IF EXISTS `house_monthly_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house_monthly_option` (
  `hmo_seq` int NOT NULL AUTO_INCREMENT,
  `hmo_hi_seq` int NOT NULL,
  `hmo_name` varchar(20) NOT NULL,
  `hmo_rate` int NOT NULL,
  `hmo_monthly` int NOT NULL,
  `hmo_enable` int NOT NULL DEFAULT '1',
  `hmo_enable_dt` date NOT NULL DEFAULT '2023-01-01',
  `hmo_reg_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hmo_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_monthly_option`
--

LOCK TABLES `house_monthly_option` WRITE;
/*!40000 ALTER TABLE `house_monthly_option` DISABLE KEYS */;
INSERT INTO `house_monthly_option` VALUES (1,1,'숙소1 매달10일 할증',10,10,1,'2023-01-01','2022-08-19 18:15:12'),(2,2,'숙소2 매달10일 할증',5,10,1,'2023-01-01','2022-08-19 18:15:12'),(3,3,'숙소3 DISABLED',-50,10,0,'2023-01-01','2022-08-19 18:15:12'),(4,4,'숙소4 매달10일 할인',-5,10,1,'2023-01-01','2022-08-19 18:15:12'),(5,5,'숙소5 매달10일 할인',-10,10,1,'2023-01-01','2022-08-19 18:15:12');
/*!40000 ALTER TABLE `house_monthly_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_place_info`
--

DROP TABLE IF EXISTS `house_place_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house_place_info` (
  `hpi_seq` int NOT NULL AUTO_INCREMENT,
  `hpi_hi_seq` int NOT NULL,
  `hpi_cp_seq` int NOT NULL,
  PRIMARY KEY (`hpi_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_place_info`
--

LOCK TABLES `house_place_info` WRITE;
/*!40000 ALTER TABLE `house_place_info` DISABLE KEYS */;
INSERT INTO `house_place_info` VALUES (1,1,2),(2,1,11),(3,1,26),(4,1,31),(5,1,40),(6,2,4),(7,2,13),(8,2,28),(9,2,33),(10,2,43),(11,3,6),(12,3,10),(13,3,29),(14,3,35),(15,3,45),(16,4,4),(17,4,16),(18,4,21),(19,4,35),(20,4,42),(21,5,1),(22,5,16),(23,5,23),(24,5,30),(25,5,41),(26,6,8),(27,6,13),(28,6,25),(29,6,39),(30,6,45),(31,7,6),(32,7,20),(33,7,23),(34,7,34),(35,7,46),(36,8,7),(37,8,13),(38,8,21),(39,8,36),(40,8,49),(41,9,1),(42,9,16),(43,9,20),(44,9,38),(45,9,50),(46,10,10),(47,10,20),(48,10,30),(49,10,40),(50,10,50),(51,11,10),(52,11,20),(53,11,30),(54,11,40),(55,11,50),(56,12,10),(57,12,20),(58,12,30),(59,12,40),(60,12,50),(61,13,10),(62,13,20),(63,13,30),(64,13,40),(65,13,50),(66,14,10),(67,14,20),(68,14,30),(69,14,40),(70,14,50),(71,15,10),(72,15,20),(73,15,30),(74,15,40),(75,15,50),(76,16,10),(77,16,20),(78,16,30),(79,16,40),(80,16,50),(81,17,10),(82,17,20),(83,17,30),(84,17,40),(85,17,50),(86,18,10),(87,18,20),(88,18,30),(89,18,40),(90,18,50),(91,19,10),(92,19,20),(93,19,30),(94,19,40),(95,19,50),(96,20,10),(97,20,20),(98,20,30),(99,20,40),(100,20,50),(101,21,10),(102,21,20),(103,21,30),(104,21,40),(105,21,50),(106,22,10),(107,22,20),(108,22,30),(109,22,40),(110,22,50),(111,23,10),(112,23,20),(113,23,30),(114,23,40),(115,23,50),(116,24,10),(117,24,20),(118,24,30),(119,24,40),(120,24,50),(121,25,10),(122,25,20),(123,25,30),(124,25,40),(125,25,50),(126,26,10),(127,26,20),(128,26,30),(129,26,40),(130,26,50),(131,27,10),(132,27,20),(133,27,30),(134,27,40),(135,27,50),(136,28,10),(137,28,20),(138,28,30),(139,28,40),(140,28,50),(141,29,10),(142,29,20),(143,29,30),(144,29,40),(145,29,50),(146,30,10),(147,30,20),(148,30,30),(149,30,40),(150,30,50),(151,31,10),(152,31,20),(153,31,30),(154,31,40),(155,31,50),(156,32,10),(157,32,20),(158,32,30),(159,32,40),(160,32,50),(161,33,10),(162,33,20),(163,33,30),(164,33,40),(165,33,50),(166,34,10),(167,34,20),(168,34,30),(169,34,40),(170,34,50),(171,35,10),(172,35,20),(173,35,30),(174,35,40),(175,35,50),(176,36,10),(177,36,20),(178,36,30),(179,36,40),(180,36,50),(181,37,10),(182,37,20),(183,37,30),(184,37,40),(185,37,50),(186,38,10),(187,38,20),(188,38,30),(189,38,40),(190,38,50),(191,39,10),(192,39,20),(193,39,30),(194,39,40),(195,39,50),(196,40,10),(197,40,20),(198,40,30),(199,40,40),(200,40,50),(201,41,10),(202,41,20),(203,41,30),(204,41,40),(205,41,50),(206,42,10),(207,42,20),(208,42,30),(209,42,40),(210,42,50),(211,43,10),(212,43,20),(213,43,30),(214,43,40),(215,43,50),(216,44,10),(217,44,20),(218,44,30),(219,44,40),(220,44,50),(221,45,10),(222,45,20),(223,45,30),(224,45,40),(225,45,50),(226,46,10),(227,46,20),(228,46,30),(229,46,40),(230,46,50),(231,47,10),(232,47,20),(233,47,30),(234,47,40),(235,47,50),(236,48,10),(237,48,20),(238,48,30),(239,48,40),(240,48,50),(241,49,10),(242,49,20),(243,49,30),(244,49,40),(245,49,50),(246,50,10),(247,50,20),(248,50,30),(249,50,40),(250,50,50);
/*!40000 ALTER TABLE `house_place_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_report`
--

DROP TABLE IF EXISTS `house_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house_report` (
  `hrpt_seq` int NOT NULL AUTO_INCREMENT,
  `hrpt_from_mi_seq` int NOT NULL,
  `hrpt_to_hi_seq` int NOT NULL,
  `hrpt_type` int NOT NULL,
  `hrpt_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`hrpt_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_report`
--

LOCK TABLES `house_report` WRITE;
/*!40000 ALTER TABLE `house_report` DISABLE KEYS */;
INSERT INTO `house_report` VALUES (1,2,1,4,'ㅁㄴㅇㄴㅁㅇ');
/*!40000 ALTER TABLE `house_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_weekly_option`
--

DROP TABLE IF EXISTS `house_weekly_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house_weekly_option` (
  `hwo_seq` int NOT NULL AUTO_INCREMENT,
  `hwo_hi_seq` int NOT NULL,
  `hwo_name` varchar(20) NOT NULL,
  `hwo_rate` int NOT NULL,
  `hwo_weekly` int NOT NULL,
  `hwo_enable` int NOT NULL DEFAULT '1',
  `hwo_enable_dt` date NOT NULL DEFAULT '2023-01-01',
  `hwo_reg_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hwo_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_weekly_option`
--

LOCK TABLES `house_weekly_option` WRITE;
/*!40000 ALTER TABLE `house_weekly_option` DISABLE KEYS */;
INSERT INTO `house_weekly_option` VALUES (1,1,'숙소1 일요일 할증',10,0,1,'2023-01-01','2022-08-19 18:12:52'),(2,1,'숙소1 토요일 할증',10,6,1,'2023-01-01','2022-08-19 18:12:52'),(3,2,'숙소2 일요일 할인',-5,0,1,'2023-01-01','2022-08-19 18:12:52'),(4,2,'숙소2 토요일 할인',-5,6,1,'2023-01-01','2022-08-19 18:12:52'),(5,3,'숙소3 DISABLED',0,0,0,'2023-01-01','2022-08-19 18:12:52');
/*!40000 ALTER TABLE `house_weekly_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `main_search_view`
--

DROP TABLE IF EXISTS `main_search_view`;
/*!50001 DROP VIEW IF EXISTS `main_search_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `main_search_view` AS SELECT 
 1 AS `hi_seq`,
 1 AS `hi_mi_seq`,
 1 AS `hi_type`,
 1 AS `hi_status`,
 1 AS `hi_name`,
 1 AS `country`,
 1 AS `cate_sort`,
 1 AS `cate_sort_detail`,
 1 AS `city`,
 1 AS `address`,
 1 AS `price`,
 1 AS `total_avg`,
 1 AS `main_img`,
 1 AS `guest`,
 1 AS `dog`,
 1 AS `bed`,
 1 AS `bedroom`,
 1 AS `bathroom`,
 1 AS `super_host`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `member_address_info`
--

DROP TABLE IF EXISTS `member_address_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_address_info` (
  `mai_seq` int NOT NULL AUTO_INCREMENT,
  `mai_mi_seq` int NOT NULL,
  `mai_cc_seq` int NOT NULL,
  `mai_city` varchar(20) NOT NULL,
  `mai_detail` varchar(50) NOT NULL,
  PRIMARY KEY (`mai_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_address_info`
--

LOCK TABLES `member_address_info` WRITE;
/*!40000 ALTER TABLE `member_address_info` DISABLE KEYS */;
INSERT INTO `member_address_info` VALUES (1,1,1,'Kwangyang','Yeosu'),(2,2,1,'Chungju','Um Sung Gun'),(3,3,2,'Seongnam','Okchon'),(4,4,2,'Samchok','Yongdong'),(5,5,3,'Kwacheon','Kongju'),(6,6,3,'Pochon','Taesan'),(7,7,4,'Yongin','Dalseo-gu'),(8,8,4,'Pohang','Chungcheong'),(9,9,5,'Yeongju','Ansan'),(10,10,5,'Taejon','Pocheon-Si'),(11,11,6,'Hwasun','Seongnam'),(12,12,6,'Kwangyang','Shihung-Si'),(13,13,7,'Mokpo','Uiwang'),(14,14,7,'Chechon','Yeokbuk-Dong-Si'),(15,15,8,'Hongseong','Kanghwa'),(16,16,8,'Ansan','Yeongpyeong-Dong'),(17,17,9,'Gimpo','Jeonju-Si'),(18,18,9,'Gwacheon','Chuncheon'),(19,19,10,'Uiwang','Seokcho'),(20,20,10,'Yeokbuk-Dong-Si','Weonju'),(21,21,11,'Incheon','Yeongweol'),(22,22,11,'Hongcheon','Chongok'),(23,23,12,'Kangneung','Hwasung'),(24,24,12,'Tonghae','Kumchon'),(25,25,13,'Kumchon','Kwacheon'),(26,26,13,'Namyangju','Kwangmyeong'),(27,27,14,'Pucheon','Pyeongtaek'),(28,28,14,'Shiheung','Tongducheon'),(29,29,15,'Yongin','Yongin'),(30,30,15,'Hayang','Sangju'),(31,31,16,'Kyeongju','Yeongcheon'),(32,32,16,'Ochon','Yeongju'),(33,33,17,'Keoje','Chinhae'),(34,34,17,'Masan','Masan'),(35,35,18,'Tongyong','Naeso'),(36,36,18,'Ungsang','Paju'),(37,37,19,'Sungnamshi','Gumi-Shi'),(38,38,19,'Yonggi','Seoul'),(39,39,20,'Ulsan','Hwawon'),(40,40,20,'Inchon','Taegu');
/*!40000 ALTER TABLE `member_address_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_img`
--

DROP TABLE IF EXISTS `member_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_img` (
  `mimg_seq` int NOT NULL AUTO_INCREMENT,
  `mimg_mi_seq` int NOT NULL,
  `mimg_file` varchar(50) NOT NULL,
  PRIMARY KEY (`mimg_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_img`
--

LOCK TABLES `member_img` WRITE;
/*!40000 ALTER TABLE `member_img` DISABLE KEYS */;
INSERT INTO `member_img` VALUES (1,1,'master_1.png'),(2,2,'host_2.png'),(3,3,'host_3.png'),(4,4,'host_4.png'),(5,5,'host_5.png'),(6,6,'host_6.png'),(7,7,'host_7.png'),(8,8,'host_8.png'),(9,9,'host_9.png'),(10,10,'host_10.png'),(21,21,'guest_21.png'),(22,22,'guest_22.png'),(23,23,'guest_23.png'),(24,24,'guest_24.png'),(25,25,'guest_25.png'),(26,26,'guest_26.png'),(27,27,'guest_27.png'),(28,28,'guest_28.png'),(29,29,'guest_29.png');
/*!40000 ALTER TABLE `member_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_info`
--

DROP TABLE IF EXISTS `member_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_info` (
  `mi_seq` int NOT NULL AUTO_INCREMENT,
  `mi_id` varchar(50) NOT NULL,
  `mi_pwd` varchar(50) NOT NULL,
  `mi_name` varchar(50) NOT NULL,
  `mi_gender` int DEFAULT NULL,
  `mi_description` varchar(255) DEFAULT NULL,
  `mi_company` varchar(50) DEFAULT NULL,
  `mi_phone` varchar(12) DEFAULT NULL,
  `mi_status` int NOT NULL DEFAULT '0' COMMENT '(0정상1정지2영구정지3탈퇴대기4탈퇴)',
  `mi_host_grade` int NOT NULL DEFAULT '0' COMMENT '(0호스트아님1호스트2슈퍼호스트9마스터)',
  `mi_reg_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`mi_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_info`
--

LOCK TABLES `member_info` WRITE;
/*!40000 ALTER TABLE `member_info` DISABLE KEYS */;
INSERT INTO `member_info` VALUES (1,'master1','1234','마스터1',1,'마스터 계정입니다.','직장1','01036792312',0,9,'2022-08-10 15:08:10'),(2,'host2','1234','호스트2',2,'호스트2 계정입니다.','직장2','01002809806',0,2,'2022-08-10 15:08:10'),(3,'host3','1234','호스트3',1,'호스트3 계정입니다.','직장3','01079312308',0,2,'2022-08-10 15:08:10'),(4,'host4','1234','호스트4',2,'호스트4 계정입니다.','직장4','01056519189',0,1,'2022-08-10 15:08:10'),(5,'host5','1234','호스트5',1,'호스트5 계정입니다.','직장5','01021611802',0,1,'2022-08-10 15:08:10'),(6,'host6','1234','호스트6',2,'호스트6 계정입니다.','직장6','01082400341',0,1,'2022-08-10 15:08:10'),(7,'host7','1234','호스트7',1,'호스트7 계정입니다.','직장7','01072547109',0,1,'2022-08-10 15:08:10'),(8,'host8','1234','호스트8',2,'호스트8 계정입니다.','직장8','01018960122',0,1,'2022-08-10 15:08:10'),(9,'host9','1234','호스트9',1,'호스트9 계정입니다.','직장9','01012500841',0,1,'2022-08-10 15:08:10'),(10,'host10','1234','호스트10',2,'호스트10 계정입니다.','직장10','01085053308',0,1,'2022-08-10 15:08:10'),(11,'host11','1234','호스트11',1,'호스트11 계정입니다.','직장11','01018020826',0,1,'2022-08-10 15:08:10'),(12,'host12','1234','호스트12',2,'호스트12 계정입니다.','직장12','01039061321',0,1,'2022-08-10 15:08:10'),(13,'host13','1234','호스트13',1,'호스트13 계정입니다.','직장13','01005584199',0,1,'2022-08-10 15:08:10'),(14,'host14','1234','호스트14',2,'호스트14 계정입니다.','직장14','01020332234',0,1,'2022-08-10 15:08:10'),(15,'host15','1234','호스트15',1,'호스트15 계정입니다.','직장15','01017901917',0,1,'2022-08-10 15:08:10'),(16,'host16','1234','호스트16',2,'호스트16 계정입니다.','직장16','01049189748',0,1,'2022-08-10 15:08:10'),(17,'host17','1234','호스트17',1,'호스트17 계정입니다.','직장17','01068111254',0,1,'2022-08-10 15:08:10'),(18,'host18','1234','호스트18',2,'호스트18 계정입니다.','직장18','01078900690',0,1,'2022-08-10 15:08:10'),(19,'host19','1234','호스트19',1,'호스트19 계정입니다.','직장19','01081596404',0,1,'2022-08-10 15:08:10'),(20,'host20','1234','호스트20',2,'호스트20 계정입니다.','직장20','01089305226',0,1,'2022-08-10 15:08:10'),(21,'guest21','1234','게스트21',1,'게스트21 계정입니다.','직장21','01041799689',0,0,'2022-08-10 15:08:10'),(22,'guest22','1234','게스트22',2,'게스트22 계정입니다.','직장22','01059727986',0,0,'2022-08-10 15:08:10'),(23,'guest23','1234','게스트23',1,'게스트23 계정입니다.','직장23','01037076916',0,0,'2022-08-10 15:08:10'),(24,'guest24','1234','게스트24',2,'게스트24 계정입니다.','직장24','01039164343',0,0,'2022-08-10 15:08:10'),(25,'guest25','1234','게스트25',1,'게스트25 계정입니다.','직장25','01001177040',0,0,'2022-08-10 15:08:10'),(26,'guest26','1234','게스트26',2,'게스트26 계정입니다.','직장26','01048591209',0,0,'2022-08-10 15:08:10'),(27,'guest27','1234','게스트27',1,'게스트27 계정입니다.','직장27','01091544551',0,0,'2022-08-10 15:08:10'),(28,'guest28','1234','게스트28',2,'게스트28 계정입니다.','직장28','01086217424',0,0,'2022-08-10 15:08:10'),(29,'guest29','1234','게스트29',1,'게스트29 계정입니다.','직장29','01039123072',0,0,'2022-08-10 15:08:10'),(30,'guest30','1234','게스트30',2,'게스트30 계정입니다.','직장30','01002192256',0,0,'2022-08-10 15:08:10'),(31,'guest31','1234','게스트31',1,'게스트31 계정입니다.','직장31','01002891422',0,0,'2022-08-10 15:08:10'),(32,'guest32','1234','게스트32',2,'게스트32 계정입니다.','직장32','01065679591',0,0,'2022-08-10 15:08:10'),(33,'guest33','1234','게스트33',1,'게스트33 계정입니다.','직장33','01099110429',0,0,'2022-08-10 15:08:10'),(34,'guest34','1234','게스트34',2,'게스트34 계정입니다.','직장34','01045415695',0,0,'2022-08-10 15:08:10'),(35,'guest35','1234','게스트35',1,'게스트35 계정입니다.','직장35','01047063621',0,0,'2022-08-10 15:08:10'),(36,'guest36','1234','게스트36',2,'게스트36 계정입니다.','직장36','01081770692',0,0,'2022-08-10 15:08:10'),(37,'guest37','1234','게스트37',1,'게스트37 계정입니다.','직장37','01034718259',0,0,'2022-08-10 15:08:10'),(38,'guest38','1234','게스트38',2,'게스트38 계정입니다.','직장38','01018403109',0,0,'2022-08-10 15:08:10'),(39,'guest39','1234','게스트39',1,'게스트39 계정입니다.','직장39','01072720907',0,0,'2022-08-10 15:08:10'),(40,'guest40','1234','게스트40',2,'게스트40 계정입니다.','직장40','01076240611',0,0,'2022-08-10 15:08:10');
/*!40000 ALTER TABLE `member_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_lang_info`
--

DROP TABLE IF EXISTS `member_lang_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_lang_info` (
  `mli_seq` int NOT NULL AUTO_INCREMENT,
  `mli_mi_seq` int NOT NULL,
  `mli_cl_seq` int NOT NULL,
  PRIMARY KEY (`mli_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_lang_info`
--

LOCK TABLES `member_lang_info` WRITE;
/*!40000 ALTER TABLE `member_lang_info` DISABLE KEYS */;
INSERT INTO `member_lang_info` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,2),(6,6,2),(7,7,2),(8,8,2),(9,9,3),(10,10,3),(11,11,3),(12,12,3),(13,13,4),(14,14,4),(15,15,4),(16,16,4),(17,17,5),(18,18,5),(19,19,5),(20,20,5),(21,21,6),(22,22,6),(23,23,6),(24,24,6),(25,25,7),(26,26,7),(27,27,7),(28,28,7),(29,29,8),(30,30,8),(31,31,8),(32,32,8),(33,33,9),(34,34,9),(35,35,9),(36,36,9),(37,37,10),(38,38,10),(39,39,10),(40,40,10);
/*!40000 ALTER TABLE `member_lang_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_report`
--

DROP TABLE IF EXISTS `member_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_report` (
  `mrpt_seq` int NOT NULL AUTO_INCREMENT,
  `mrpt_from_mi_seq` int NOT NULL,
  `mrpt_to_mi_seq` int NOT NULL,
  `mrpt_type` int NOT NULL,
  `mrpt_reason` varchar(255) NOT NULL,
  PRIMARY KEY (`mrpt_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_report`
--

LOCK TABLES `member_report` WRITE;
/*!40000 ALTER TABLE `member_report` DISABLE KEYS */;
INSERT INTO `member_report` VALUES (1,21,20,1,'나쁨'),(2,22,20,2,'욕설'),(3,23,20,3,'비방'),(4,24,20,4,'허위'),(5,25,20,5,'불법'),(6,26,20,1,'나쁨'),(7,27,20,2,'욕설'),(8,28,20,3,'비방'),(9,29,20,4,'허위'),(10,30,20,5,'불법');
/*!40000 ALTER TABLE `member_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_info`
--

DROP TABLE IF EXISTS `msg_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `msg_info` (
  `msg_seq` int NOT NULL AUTO_INCREMENT,
  `msg_sender_mi_seq` int NOT NULL,
  `msg_receiver_mi_seq` int NOT NULL,
  `msg_receiver_read` int NOT NULL DEFAULT '0',
  `msg_content` varchar(255) NOT NULL,
  `msg_reg_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `msg_sender_delete` int NOT NULL DEFAULT '0',
  `msg_receiver_delete` int NOT NULL DEFAULT '0',
  `msg_type` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_info`
--

LOCK TABLES `msg_info` WRITE;
/*!40000 ALTER TABLE `msg_info` DISABLE KEYS */;
INSERT INTO `msg_info` VALUES (1,1,2,0,'가입을 축하합니다!','2022-08-20 15:08:10',0,0,0),(2,1,21,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(3,1,21,0,'숙소 등록이 완료되었습니다.','2022-08-10 15:08:10',0,0,0),(4,1,21,0,'새로운 예약 문의가 등록되었습니다.','2022-08-10 15:08:10',0,0,0),(5,2,21,0,'언제언제 예약하려고 하는데 숙소에 침대는 푹신한가요? ㅋㅋ','2022-08-10 15:08:10',0,0,0),(6,21,2,0,'침대는 에이스침대라서 매우 푹신합니다.','2022-08-10 15:08:10',0,0,0),(7,2,21,0,'체크인이 오후 3시부터던데 너무 늦어서 짐을 맡겨둘 수 있나요','2022-08-10 15:08:10',0,0,0),(8,2,21,0,'아 그리고 수영장은 이용할 수 있나요?','2022-08-10 15:08:10',0,0,0),(9,21,2,1,'짐은 맡아드릴 수 있고, 그날은 12시부터는 체크인이 가능하실 것 같아요 예약문의 주신 기간은 동절기라서 안타깝지만 수영장은 이용 안되세요.','2022-08-10 15:08:10',0,0,0),(10,10,2,1,'호스트가 예약을 확정하였습니다.','2022-08-20 15:08:10',1,0,0),(11,10,2,1,'가입을 축하합니다!','2022-08-21 15:08:10',1,0,0),(12,10,3,1,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(13,9,10,0,'메시지1','2022-08-11 15:08:10',0,0,0),(14,9,10,0,'메세지2','2022-08-12 15:08:10',0,0,0),(15,10,9,0,'대답1','2022-08-13 15:08:10',1,0,0),(16,10,12,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(17,13,10,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(18,1,16,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(19,1,17,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(20,10,18,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(21,10,19,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(22,10,20,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(23,10,22,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(24,10,23,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(25,10,24,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(26,10,25,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(27,10,26,0,'가입을 축하합니다!','2022-08-10 15:08:10',1,0,0),(28,10,27,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(29,10,28,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(30,10,29,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(31,10,30,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(32,10,31,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(33,10,32,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(34,10,33,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(35,10,34,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(36,10,35,0,'가입을 축하합니다!','2022-08-10 15:08:10',0,0,0),(37,10,9,0,'msg1','2022-08-01 15:08:10',0,0,0),(38,10,9,0,'msg2','2022-08-02 15:08:10',0,0,0),(39,10,9,0,'msg3','2022-08-03 15:08:10',0,0,0),(40,10,9,0,'msg4','2022-08-04 15:08:10',0,0,0),(41,10,9,0,'msg5','2022-08-05 15:08:10',0,0,0),(42,10,9,0,'msg6','2022-08-06 15:08:10',0,0,0),(43,10,9,0,'msg7','2022-08-08 15:08:10',0,0,0),(44,10,9,0,'msg8','2022-08-08 15:08:10',0,0,0),(45,10,9,0,'msg9','2022-08-08 15:08:10',0,0,0),(46,10,9,0,'msg10','2022-08-09 15:08:10',0,0,0),(47,10,9,0,'msg11','2022-08-09 15:08:10',0,0,0),(48,10,9,0,'msg12','2022-08-09 15:08:10',0,0,0),(49,10,9,0,'msg13','2022-08-09 15:08:10',0,0,0),(50,10,9,0,'msg14','2022-08-09 15:08:10',0,0,0),(51,10,9,0,'msg15','2022-08-09 15:08:10',0,0,0),(52,10,9,0,'msg16','2022-08-09 15:08:10',0,0,0),(53,10,9,0,'msg17','2022-08-09 15:08:10',0,0,0),(54,10,9,0,'msg18','2022-08-10 15:08:10',0,0,0),(55,10,9,0,'msg19','2022-08-10 15:08:10',0,0,0),(56,10,9,0,'msg20','2022-08-10 15:08:10',0,0,0),(57,10,9,0,'msg21','2022-08-11 15:08:10',0,0,0),(58,10,9,0,'msg22','2022-08-11 15:08:10',0,0,0),(59,10,9,0,'msg23','2022-08-11 15:08:10',0,0,0),(60,10,24,0,'ㅁㄴㅇㅁㅇ','2022-08-29 18:46:30',0,0,1),(61,10,24,0,'ㅁㄴㅇㅁㅇ','2022-08-29 18:46:31',0,0,1),(62,10,24,0,'ㅁㄴㅇㅁㅇ','2022-08-29 18:46:31',0,0,1),(63,10,24,0,'ㅁㄴㅇㅁㅇ','2022-08-29 18:46:31',0,0,1),(64,10,24,0,'ㅁㄴㅇㅁㅇ','2022-08-29 18:46:32',0,0,1),(65,10,24,0,'ㅁㄴㅇㅁㅇ','2022-08-29 18:46:32',0,0,1),(66,10,24,0,'ㅁㄴㅇㅁㅇ','2022-08-29 18:46:32',0,0,1),(67,10,24,0,'ㅁㄴㅇㅁㅇ','2022-08-29 18:46:32',0,0,1),(68,10,24,0,'ㅁㄴㅇㅁㅇ','2022-08-29 18:46:32',0,0,1),(69,10,24,0,'ㅁㄴㅇㅁㅇ','2022-08-29 18:46:32',0,0,1),(70,10,25,0,'ㅁㄴㅇㅁㅇ','2022-08-29 18:50:46',0,0,1),(71,10,2,0,'야','2022-08-30 14:28:14',0,0,1),(72,1,10,0,'새로운 메세지가 도착하였습니다.','2022-08-30 14:28:14',0,0,1),(73,10,2,0,'야호','2022-08-30 14:28:17',0,0,1),(74,1,10,0,'새로운 메세지가 도착하였습니다.','2022-08-30 14:28:17',0,0,1),(75,10,2,0,'야호','2022-08-30 14:28:32',0,0,1),(76,1,10,0,'새로운 메세지가 도착하였습니다.','2022-08-30 14:28:32',0,0,1),(77,10,2,0,'야호','2022-08-30 14:28:39',0,0,1),(78,1,10,0,'새로운 메세지가 도착하였습니다.','2022-08-30 14:28:39',0,0,1),(79,10,2,0,'asd','2022-08-30 14:46:11',0,0,1),(80,1,10,0,'새로운 메세지가 도착하였습니다.','2022-08-30 14:46:11',0,0,1);
/*!40000 ALTER TABLE `msg_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `rev_point_view`
--

DROP TABLE IF EXISTS `rev_point_view`;
/*!50001 DROP VIEW IF EXISTS `rev_point_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rev_point_view` AS SELECT 
 1 AS `rpv_hi_seq`,
 1 AS `clean_avg`,
 1 AS `correct_avg`,
 1 AS `communication_avg`,
 1 AS `location_avg`,
 1 AS `chechin_avg`,
 1 AS `cost_avg`,
 1 AS `total_avg`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `review_info`
--

DROP TABLE IF EXISTS `review_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_info` (
  `rev_seq` int NOT NULL AUTO_INCREMENT,
  `rev_hi_seq` int NOT NULL,
  `rev_mi_seq` int NOT NULL,
  `rev_content` varchar(255) NOT NULL,
  `rev_public` int NOT NULL DEFAULT '0',
  `rev_reg_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rev_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_info`
--

LOCK TABLES `review_info` WRITE;
/*!40000 ALTER TABLE `review_info` DISABLE KEYS */;
INSERT INTO `review_info` VALUES (1,1,21,'숙소가 정말 마음에 들었습니다. 숙소는 절대적으로 아름답고 사진과 똑같습니다. 그들은 매우 친절하고 협조적이었습니다. 게스트가 식사 일정을 조정하는 방식이 마음에 들었습니다. 음식이 정말 맛있었어요. 모든 것이 놀라웠습니다. 저희가 가장 좋아하는 장소를 찾았으며 2월에 다시 방문할 예정입니다! 최고의 가족 휴가 장소! 또한 스노클링이 정말 좋았습니다. 물은 맑습니다.',1,'2022-08-10 15:03:08'),(2,1,22,'숙소가 정말 마음에 들었습니다. 숙소는 절대적으로 아름답고 사진과 똑같습니다. 그들은 매우 친절하고 협조적이었습니다. 게스트가 식사 일정을 조정하는 방식이 마음에 들었습니다. 음식이 정말 맛있었어요. 모든 것이 놀라웠습니다. 저희가 가장 좋아하는 장소를 찾았으며 2월에 다시 방문할 예정입니다! 최고의 가족 휴가 장소! 또한 스노클링이 정말 좋았습니다. 물은 맑습니다.',1,'2022-08-10 15:03:08'),(3,1,23,'숙소가 정말 마음에 들었습니다. 숙소는 절대적으로 아름답고 사진과 똑같습니다. 그들은 매우 친절하고 협조적이었습니다. 게스트가 식사 일정을 조정하는 방식이 마음에 들었습니다. 음식이 정말 맛있었어요. 모든 것이 놀라웠습니다. 저희가 가장 좋아하는 장소를 찾았으며 2월에 다시 방문할 예정입니다! 최고의 가족 휴가 장소! 또한 스노클링이 정말 좋았습니다. 물은 맑습니다.',1,'2022-08-10 15:03:08'),(4,2,24,'2번 숙소 댓글 1번 후기',1,'2022-08-10 15:03:08'),(5,2,25,'2번 숙소 댓글 2번 후기',1,'2022-08-10 15:03:08'),(6,2,26,'2번 숙소 댓글 3번 후기',1,'2022-08-10 15:03:08'),(7,3,27,'3번 숙소 댓글 1번 후기',1,'2022-08-10 15:03:08'),(8,3,28,'3번 숙소 댓글 2번 후기',1,'2022-08-10 15:03:08'),(9,3,29,'3번 숙소 댓글 3번 후기',1,'2022-08-10 15:03:08'),(10,3,30,'3번 숙소 댓글 4번 후기',1,'2022-08-10 15:03:08'),(11,4,31,'4번 숙소 댓글 1번 후기',1,'2022-08-10 15:03:08'),(12,4,32,'4번 숙소 댓글 2번 후기',1,'2022-08-10 15:03:08'),(13,5,33,'5번 숙소 댓글 1번 후기',1,'2022-08-10 15:03:08'),(14,5,34,'5번 숙소 댓글 2번 후기',1,'2022-08-10 15:03:08'),(15,5,35,'5번 숙소 댓글 3번 후기',1,'2022-08-10 15:03:08'),(16,6,36,'6번 숙소 댓글 1번 후기',1,'2022-08-10 15:03:08'),(17,6,37,'6번 숙소 댓글 2번 후기',1,'2022-08-10 15:03:08'),(18,6,38,'6번 숙소 댓글 3번 후기',1,'2022-08-10 15:03:08'),(19,6,39,'6번 숙소 댓글 4번 후기',1,'2022-08-10 15:03:08'),(20,6,40,'6번 숙소 댓글 5번 후기',1,'2022-08-10 15:03:08'),(21,7,37,'7번 숙소 댓글 1번 후기',1,'2022-08-10 15:03:08'),(22,7,38,'7번 숙소 댓글 2번 후기',1,'2022-08-10 15:03:08'),(23,7,39,'7번 숙소 댓글 3번 후기',1,'2022-08-10 15:03:08'),(24,7,40,'7번 숙소 댓글 4번 후기',1,'2022-08-10 15:03:08'),(25,8,32,'8번 숙소 댓글 1번 후기',1,'2022-08-10 15:03:08'),(26,8,33,'8번 숙소 댓글 2번 후기',1,'2022-08-10 15:03:08'),(27,8,34,'8번 숙소 댓글 3번 후기',1,'2022-08-10 15:03:08'),(28,8,35,'8번 숙소 댓글 4번 후기',1,'2022-08-10 15:03:08'),(29,8,36,'8번 숙소 댓글 5번 후기',1,'2022-08-10 15:03:08'),(30,9,26,'9번 숙소 댓글 1번 후기',1,'2022-08-10 15:03:08'),(31,9,27,'9번 숙소 댓글 2번 후기',1,'2022-08-10 15:03:08'),(32,9,28,'9번 숙소 댓글 3번 후기',1,'2022-08-10 15:03:08'),(33,9,29,'9번 숙소 댓글 4번 후기',1,'2022-08-10 15:03:08'),(34,9,30,'9번 숙소 댓글 5번 후기',1,'2022-08-10 15:03:08'),(35,9,31,'9번 숙소 댓글 6번 후기',1,'2022-08-10 15:03:08'),(36,10,21,'10번 숙소 댓글 1번 후기',1,'2022-08-10 15:03:08'),(37,10,22,'10번 숙소 댓글 2번 후기',1,'2022-08-10 15:03:08'),(38,10,23,'10번 숙소 댓글 3번 후기',1,'2022-08-10 15:03:08'),(39,10,24,'10번 숙소 댓글 4번 후기',1,'2022-08-10 15:03:08'),(40,10,25,'10번 숙소 댓글 5번 후기',1,'2022-08-10 15:03:08');
/*!40000 ALTER TABLE `review_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_point`
--

DROP TABLE IF EXISTS `review_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_point` (
  `rpo_seq` int NOT NULL AUTO_INCREMENT,
  `rpo_rev_seq` int NOT NULL,
  `rpo_clean_point` int NOT NULL,
  `rpo_correct_point` int NOT NULL,
  `rpo_communication_point` int NOT NULL,
  `rpo_location_point` int NOT NULL,
  `rpo_checkin_point` int NOT NULL,
  `rpo_cost_point` int NOT NULL,
  PRIMARY KEY (`rpo_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_point`
--

LOCK TABLES `review_point` WRITE;
/*!40000 ALTER TABLE `review_point` DISABLE KEYS */;
INSERT INTO `review_point` VALUES (1,1,1,5,1,5,5,1),(2,2,2,4,2,4,4,2),(3,3,3,3,3,3,3,3),(4,4,4,2,4,2,2,4),(5,5,5,1,5,1,1,5),(6,6,5,1,5,1,1,5),(7,7,4,2,4,2,2,4),(8,8,3,3,3,3,3,3),(9,9,2,4,2,4,4,2),(10,10,1,5,1,5,5,1),(11,11,1,5,1,5,5,1),(12,12,2,4,2,4,4,2),(13,13,3,3,3,3,3,3),(14,14,4,2,4,2,2,4),(15,15,5,1,5,1,1,5),(16,16,5,1,5,1,1,5),(17,17,4,2,4,2,2,4),(18,18,3,3,3,3,3,3),(19,19,2,4,2,4,4,2),(20,20,1,5,1,5,5,1),(21,21,1,5,1,5,5,1),(22,22,2,4,2,4,4,2),(23,23,3,3,3,3,3,3),(24,24,4,2,4,2,2,4),(25,25,5,1,5,1,1,5),(26,26,5,1,5,1,1,5),(27,27,4,2,4,2,2,4),(28,28,3,3,3,3,3,3),(29,29,2,4,2,4,4,2),(30,30,1,5,1,5,5,1),(31,31,1,5,1,5,5,1),(32,32,2,4,2,4,4,2),(33,33,3,3,3,3,3,3),(34,34,4,2,4,2,2,4),(35,35,5,1,5,1,1,5),(36,36,1,1,2,4,1,5),(37,37,1,1,3,4,1,4),(38,38,1,1,2,4,1,5),(39,39,1,1,2,4,1,5),(40,40,1,1,2,4,1,3);
/*!40000 ALTER TABLE `review_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_reply`
--

DROP TABLE IF EXISTS `review_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_reply` (
  `rpl_seq` int NOT NULL AUTO_INCREMENT,
  `rpl_mi_seq` int NOT NULL,
  `rpl_rev_seq` int NOT NULL,
  `rpl_content` varchar(255) NOT NULL,
  `rpl_reg_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rpl_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_reply`
--

LOCK TABLES `review_reply` WRITE;
/*!40000 ALTER TABLE `review_reply` DISABLE KEYS */;
INSERT INTO `review_reply` VALUES (1,2,1,'1번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(2,2,2,'2번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(3,2,3,'3번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(4,2,4,'4번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(5,2,5,'5번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(6,2,6,'6번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(7,2,7,'7번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(8,2,8,'8번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(9,2,9,'9번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(10,2,10,'10번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(11,2,11,'11번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(12,2,12,'12번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(13,2,13,'13번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(14,2,14,'14번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(15,2,15,'15번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(16,2,16,'16번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(17,2,17,'17번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(18,2,18,'18번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(19,2,19,'19번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(20,2,20,'20번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(21,2,21,'21번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(22,2,22,'22번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(23,2,23,'23번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(24,2,24,'24번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(25,2,25,'25번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(26,2,26,'26번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(27,2,27,'27번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(28,3,28,'28번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(29,3,29,'29번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(30,3,30,'30번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(31,3,31,'31번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(32,3,32,'32번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(33,3,33,'33번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(34,3,34,'34번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(35,3,35,'35번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(36,3,36,'36번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(37,3,37,'37번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(38,3,38,'38번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(39,3,39,'39번 리뷰 감사합니다 고객님','2022-08-10 15:03:08'),(40,3,40,'40번 리뷰 감사합니다 고객님','2022-08-10 15:03:08');
/*!40000 ALTER TABLE `review_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wish_info`
--

DROP TABLE IF EXISTS `wish_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wish_info` (
  `wish_seq` int NOT NULL AUTO_INCREMENT,
  `wish_mi_seq` int NOT NULL,
  `wish_hi_seq` int NOT NULL,
  `wish_order` int NOT NULL,
  `wish_reg_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wish_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wish_info`
--

LOCK TABLES `wish_info` WRITE;
/*!40000 ALTER TABLE `wish_info` DISABLE KEYS */;
INSERT INTO `wish_info` VALUES (1,21,1,1,'2022-08-10 15:03:08'),(2,21,2,2,'2022-08-10 15:03:08'),(3,21,3,3,'2022-08-10 15:03:08'),(4,21,4,4,'2022-08-10 15:03:08'),(5,21,5,5,'2022-08-10 15:03:08'),(6,21,6,6,'2022-08-10 15:03:08'),(7,21,7,7,'2022-08-10 15:03:08'),(8,21,8,8,'2022-08-10 15:03:08'),(9,22,9,9,'2022-08-10 15:03:08'),(10,22,10,10,'2022-08-10 15:03:08'),(11,22,11,11,'2022-08-10 15:03:08'),(12,22,12,12,'2022-08-10 15:03:08'),(13,22,13,13,'2022-08-10 15:03:08'),(14,22,14,14,'2022-08-10 15:03:08'),(15,22,15,15,'2022-08-10 15:03:08'),(16,22,16,16,'2022-08-10 15:03:08'),(17,23,17,17,'2022-08-10 15:03:08'),(18,23,18,18,'2022-08-10 15:03:08'),(19,23,19,19,'2022-08-10 15:03:08'),(20,23,20,20,'2022-08-10 15:03:08'),(21,23,21,21,'2022-08-10 15:03:08'),(22,23,22,22,'2022-08-10 15:03:08'),(23,23,23,23,'2022-08-10 15:03:08'),(24,23,24,24,'2022-08-10 15:03:08'),(25,24,25,25,'2022-08-10 15:03:08'),(26,24,26,26,'2022-08-10 15:03:08'),(27,24,27,27,'2022-08-10 15:03:08'),(28,24,28,28,'2022-08-10 15:03:08'),(29,24,29,29,'2022-08-10 15:03:08'),(30,24,30,30,'2022-08-10 15:03:08'),(31,24,31,31,'2022-08-10 15:03:08'),(32,24,32,32,'2022-08-10 15:03:08'),(33,25,33,33,'2022-08-10 15:03:08'),(34,25,34,34,'2022-08-10 15:03:08'),(35,25,35,35,'2022-08-10 15:03:08'),(36,25,36,36,'2022-08-10 15:03:08'),(37,25,37,37,'2022-08-10 15:03:08'),(38,25,38,38,'2022-08-10 15:03:08'),(39,25,39,39,'2022-08-10 15:03:08'),(40,25,40,40,'2022-08-10 15:03:08'),(48,1,4,5,'2022-08-11 12:41:14'),(55,1,11,12,'2022-08-11 12:41:27'),(60,1,7,17,'2022-08-11 18:40:36'),(65,1,1,18,'2022-08-24 15:05:03'),(67,1,43,19,'2022-08-24 17:11:32'),(68,1,1,20,'2022-08-30 20:13:01');
/*!40000 ALTER TABLE `wish_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'airbnb_db'
--

--
-- Final view structure for view `cate_bar_view`
--

/*!50001 DROP VIEW IF EXISTS `cate_bar_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cate_bar_view` AS select 1 AS `table_no`,`category_place`.`cp_seq` AS `cate_bar_seq`,`category_place`.`cp_content` AS `cate_bar_content`,`category_place`.`cp_icon` AS `cate_bar_icon` from `category_place` where (`category_place`.`cp_type` = 1) union all select 2 AS `2`,`category_sort`.`cs_seq` AS `cs_seq`,`category_sort`.`cs_content` AS `cs_content`,`category_sort`.`cs_icon` AS `cs_icon` from `category_sort` union all select 3 AS `3`,`category_sort_detail`.`csd_seq` AS `csd_seq`,`category_sort_detail`.`csd_content` AS `csd_content`,`category_sort_detail`.`csd_icon` AS `csd_icon` from `category_sort_detail` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `main_search_view`
--

/*!50001 DROP VIEW IF EXISTS `main_search_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `main_search_view` AS select `hi`.`hi_seq` AS `hi_seq`,`hi`.`hi_mi_seq` AS `hi_mi_seq`,`hi`.`hi_type` AS `hi_type`,`hi`.`hi_status` AS `hi_status`,`hi`.`hi_name` AS `hi_name`,`cc`.`cc_content` AS `country`,`cs`.`cs_seq` AS `cate_sort`,`csd`.`csd_seq` AS `cate_sort_detail`,`hai`.`hai_city` AS `city`,`hai`.`hai_detail` AS `address`,`hfi`.`hfi_base_price` AS `price`,(round((`rpv`.`total_avg` * 100),0) / 100) AS `total_avg`,`himg`.`himg_file` AS `main_img`,`hgi`.`hgi_guest` AS `guest`,`hgi`.`hgi_dog` AS `dog`,`hgi`.`hgi_bed` AS `bed`,`hgi`.`hgi_bedroom` AS `bedroom`,`hgi`.`hgi_bathroom` AS `bathroom`,if((`mi`.`mi_host_grade` = 2),1,0) AS `super_host` from (((((((((`house_info` `hi` left join `house_address_info` `hai` on((`hi`.`hi_seq` = `hai`.`hai_hi_seq`))) left join `category_country` `cc` on((`hai`.`hai_cc_seq` = `cc`.`cc_seq`))) left join `category_sort_detail` `csd` on((`hi`.`hi_csd_seq` = `csd`.`csd_seq`))) left join `category_sort` `cs` on((`csd`.`csd_cs_seq` = `cs`.`cs_seq`))) left join `house_guest_info` `hgi` on((`hi`.`hi_seq` = `hgi`.`hgi_hi_seq`))) left join `house_fee_info` `hfi` on((`hi`.`hi_seq` = `hfi`.`hfi_hi_seq`))) left join `house_img` `himg` on((`hi`.`hi_seq` = `himg`.`himg_hi_seq`))) left join `rev_point_view` `rpv` on((`hi`.`hi_seq` = `rpv`.`rpv_hi_seq`))) left join `member_info` `mi` on((`hi`.`hi_mi_seq` = `mi`.`mi_seq`))) where (`himg`.`himg_main` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rev_point_view`
--

/*!50001 DROP VIEW IF EXISTS `rev_point_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rev_point_view` AS select `rev`.`rev_hi_seq` AS `rpv_hi_seq`,avg(`rpo`.`rpo_clean_point`) AS `clean_avg`,avg(`rpo`.`rpo_correct_point`) AS `correct_avg`,avg(`rpo`.`rpo_communication_point`) AS `communication_avg`,avg(`rpo`.`rpo_location_point`) AS `location_avg`,avg(`rpo`.`rpo_checkin_point`) AS `chechin_avg`,avg(`rpo`.`rpo_cost_point`) AS `cost_avg`,((((((avg(`rpo`.`rpo_clean_point`) + avg(`rpo`.`rpo_correct_point`)) + avg(`rpo`.`rpo_communication_point`)) + avg(`rpo`.`rpo_location_point`)) + avg(`rpo`.`rpo_checkin_point`)) + avg(`rpo`.`rpo_cost_point`)) / 6) AS `total_avg` from (`review_info` `rev` left join `review_point` `rpo` on((`rev`.`rev_seq` = `rpo`.`rpo_rev_seq`))) where (`rev`.`rev_public` = 1) group by `rpv_hi_seq` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-31 11:00:11
