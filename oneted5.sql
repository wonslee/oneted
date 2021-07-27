-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: oneted
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.20.04.1

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
-- Table structure for table `applies`
--

DROP TABLE IF EXISTS `applies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `job_posting_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `applies_job_posting_id_659b0e1c_fk_job_postings_id` (`job_posting_id`),
  KEY `applies_user_id_343ca350_fk_users_id` (`user_id`),
  CONSTRAINT `applies_job_posting_id_659b0e1c_fk_job_postings_id` FOREIGN KEY (`job_posting_id`) REFERENCES `job_postings` (`id`),
  CONSTRAINT `applies_user_id_343ca350_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applies`
--

LOCK TABLES `applies` WRITE;
/*!40000 ALTER TABLE `applies` DISABLE KEYS */;
/*!40000 ALTER TABLE `applies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmarks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `job_posting_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bookmarks_job_posting_id_cb7bd654_fk_job_postings_id` (`job_posting_id`),
  KEY `bookmarks_user_id_12990ce0_fk_users_id` (`user_id`),
  CONSTRAINT `bookmarks_job_posting_id_cb7bd654_fk_job_postings_id` FOREIGN KEY (`job_posting_id`) REFERENCES `job_postings` (`id`),
  CONSTRAINT `bookmarks_user_id_12990ce0_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks`
--

LOCK TABLES `bookmarks` WRITE;
/*!40000 ALTER TABLE `bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` longtext NOT NULL,
  `employee_count` int NOT NULL,
  `coordinate` json NOT NULL,
  `region_id` bigint NOT NULL,
  `image_url` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_region_id_263602c0_fk_regions_id` (`region_id`),
  CONSTRAINT `companies_region_id_263602c0_fk_regions_id` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'모두싸인','모두싸모두싸인에 접속해 준비된 계약서를 업로드 한 후 계약 상대방의 이메일 주소 또는전화번호를 입력해 서명을 요청하면, 상대방은 이메일이나 카카오톡으로 링크를전달받습니다. 이 링크를 클릭해 전자서명을 하거나 전자 도장을 입력하면 계약이종료됩니다.',178,'{\"latitude\": \"37.490894843703074\", \"longitude\": \" 127.00574996913497\"}',1,NULL),(2,'카카오 뱅크','모바퇴근제. http://www.visual.camp',510,'{\"latitude\": \"37.490894843703074\", \"longitude\": \"127.00574996913497\"}',1,NULL);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'한국');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'contenttypes','contenttype'),(3,'jobpostings','company'),(4,'jobpostings','country'),(5,'jobpostings','experience'),(6,'jobpostings','job'),(7,'jobpostings','jobgroup'),(8,'jobpostings','jobposting'),(12,'jobpostings','region'),(9,'jobpostings','tag'),(10,'jobpostings','tagcategory'),(11,'jobpostings','tagjobposting'),(15,'resumes','apply'),(16,'resumes','resume'),(17,'resumes','resumeapply'),(2,'sessions','session'),(14,'users','bookmark'),(13,'users','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-07-27 10:32:18.189777'),(2,'contenttypes','0002_remove_content_type_name','2021-07-27 10:32:18.243963'),(3,'jobpostings','0001_initial','2021-07-27 10:32:18.785300'),(4,'jobpostings','0002_company_image_url','2021-07-27 10:32:18.805329'),(5,'users','0001_initial','2021-07-27 10:32:18.906209'),(6,'resumes','0001_initial','2021-07-27 10:32:19.152554'),(7,'sessions','0001_initial','2021-07-27 10:32:19.179346');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiences`
--

DROP TABLE IF EXISTS `experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiences` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiences`
--

LOCK TABLES `experiences` WRITE;
/*!40000 ALTER TABLE `experiences` DISABLE KEYS */;
INSERT INTO `experiences` VALUES (1,'신입'),(2,'1년차'),(3,'2년차'),(4,'3년차'),(5,'4년차'),(6,'5년차'),(7,'6년차'),(8,'7년차'),(9,'8년차'),(10,'9년차 이상');
/*!40000 ALTER TABLE `experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_groups`
--

DROP TABLE IF EXISTS `job_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_groups`
--

LOCK TABLES `job_groups` WRITE;
/*!40000 ALTER TABLE `job_groups` DISABLE KEYS */;
INSERT INTO `job_groups` VALUES (1,'개발');
/*!40000 ALTER TABLE `job_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_postings`
--

DROP TABLE IF EXISTS `job_postings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_postings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `title` varchar(300) NOT NULL,
  `salary` int NOT NULL,
  `description` longtext,
  `main_task` longtext,
  `requirement` longtext,
  `preference` longtext,
  `benefit` longtext,
  `due_date` datetime(6) DEFAULT NULL,
  `image_url` varchar(3000) DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `experience_id` bigint NOT NULL,
  `job_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_postings_company_id_348fdca4_fk_companies_id` (`company_id`),
  KEY `job_postings_experience_id_70284f63_fk_experiences_id` (`experience_id`),
  KEY `job_postings_job_id_dc3dd544_fk_jobs_id` (`job_id`),
  CONSTRAINT `job_postings_company_id_348fdca4_fk_companies_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `job_postings_experience_id_70284f63_fk_experiences_id` FOREIGN KEY (`experience_id`) REFERENCES `experiences` (`id`),
  CONSTRAINT `job_postings_job_id_dc3dd544_fk_jobs_id` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_postings`
--

LOCK TABLES `job_postings` WRITE;
/*!40000 ALTER TABLE `job_postings` DISABLE KEYS */;
INSERT INTO `job_postings` VALUES (1,'2021-07-27 10:40:20.227047','2021-07-27 10:40:20.227073','백엔드 엔지니어 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,1,1,1),(2,'2021-07-27 10:40:20.229721','2021-07-27 10:40:20.229742','프론트엔드 엔지니어 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,1,1,2),(3,'2021-07-27 10:40:20.232466','2021-07-27 10:40:20.232478','파이썬 개발자',80000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,1,3,3),(4,'2021-07-27 10:40:20.234611','2021-07-27 10:40:20.234623','소프트웨어 개발자',100000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,1,3,4),(5,'2021-07-27 10:40:20.237640','2021-07-27 10:40:20.237652','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,5,1),(6,'2021-07-27 10:40:20.240291','2021-07-27 10:40:20.240303','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,5,2),(7,'2021-07-27 10:40:20.242398','2021-07-27 10:40:20.242409','백엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,10,3),(8,'2021-07-27 10:40:20.245481','2021-07-27 10:40:20.245495','프론트엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,10,4),(9,'2021-07-27 10:53:50.806609','2021-07-27 10:53:50.806632','국보급 엔지니어 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(10,'2021-07-27 10:53:50.811663','2021-07-27 10:53:50.811688','프론트엔드 디벨로퍼 구합니다 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(11,'2021-07-27 10:53:50.815488','2021-07-27 10:53:50.815509','파이썬 야무지게 다루실 분 ?',80000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(12,'2021-07-27 10:53:50.818803','2021-07-27 10:53:50.818815','소프트웨어 !!!1',100000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(13,'2021-07-27 10:54:01.185603','2021-07-27 10:54:01.185623','국보급 엔지니어 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(14,'2021-07-27 10:54:01.190177','2021-07-27 10:54:01.190197','프론트엔드 디벨로퍼 구합니다 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(15,'2021-07-27 10:54:01.194034','2021-07-27 10:54:01.194053','파이썬 야무지게 다루실 분 ?',80000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(16,'2021-07-27 10:54:01.197875','2021-07-27 10:54:01.197894','소프트웨어 !!!1',100000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(17,'2021-07-27 10:54:19.589144','2021-07-27 10:54:19.589169','국보급 엔지니어 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(18,'2021-07-27 10:54:19.594002','2021-07-27 10:54:19.594025','프론트엔드 디벨로퍼 구합니다 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(19,'2021-07-27 10:54:19.597324','2021-07-27 10:54:19.597337','파이썬 야무지게 다루실 분 ?',80000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(20,'2021-07-27 10:54:19.600038','2021-07-27 10:54:19.600050','소프트웨어 !!!1',100000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(21,'2021-07-27 10:54:19.602233','2021-07-27 10:54:19.602244','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(22,'2021-07-27 10:54:19.605078','2021-07-27 10:54:19.605089','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(23,'2021-07-27 10:54:19.607789','2021-07-27 10:54:19.607800','백엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(24,'2021-07-27 10:54:19.609717','2021-07-27 10:54:19.609741','프론트엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(25,'2021-07-27 10:54:48.579044','2021-07-27 10:54:48.579063','국보급 엔지니어 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(26,'2021-07-27 10:54:48.583150','2021-07-27 10:54:48.583195','프론트엔드 디벨로퍼 구합니다 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(27,'2021-07-27 10:54:48.588752','2021-07-27 10:54:48.588785','파이썬 야무지게 다루실 분 ?',80000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(28,'2021-07-27 10:54:48.593278','2021-07-27 10:54:48.593418','소프트웨어 !!!1',100000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(29,'2021-07-27 10:55:03.321738','2021-07-27 10:55:03.321759','국보급 엔지니어 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(30,'2021-07-27 10:55:03.325587','2021-07-27 10:55:03.325607','프론트엔드 디벨로퍼 구합니다 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(31,'2021-07-27 10:55:03.329273','2021-07-27 10:55:03.329288','파이썬 야무지게 다루실 분 ?',80000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(32,'2021-07-27 10:55:03.332396','2021-07-27 10:55:03.332407','소프트웨어 !!!1',100000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(33,'2021-07-27 10:55:03.334782','2021-07-27 10:55:03.334793','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(34,'2021-07-27 10:55:03.338208','2021-07-27 10:55:03.338219','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(35,'2021-07-27 10:55:03.340986','2021-07-27 10:55:03.340997','백엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(36,'2021-07-27 10:55:03.343827','2021-07-27 10:55:03.343838','프론트엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(37,'2021-07-27 10:55:04.527534','2021-07-27 10:55:04.527555','국보급 엔지니어 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(38,'2021-07-27 10:55:04.532903','2021-07-27 10:55:04.532920','프론트엔드 디벨로퍼 구합니다 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(39,'2021-07-27 10:55:04.537175','2021-07-27 10:55:04.537221','파이썬 야무지게 다루실 분 ?',80000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(40,'2021-07-27 10:55:04.541877','2021-07-27 10:55:04.541927','소프트웨어 !!!1',100000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(41,'2021-07-27 10:55:04.545473','2021-07-27 10:55:04.545500','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(42,'2021-07-27 10:55:04.548405','2021-07-27 10:55:04.548424','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(43,'2021-07-27 10:55:04.550497','2021-07-27 10:55:04.550513','백엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(44,'2021-07-27 10:55:04.553760','2021-07-27 10:55:04.553781','프론트엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(45,'2021-07-27 10:55:05.228785','2021-07-27 10:55:05.228809','국보급 엔지니어 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(46,'2021-07-27 10:55:05.232547','2021-07-27 10:55:05.232570','프론트엔드 디벨로퍼 구합니다 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(47,'2021-07-27 10:55:05.235489','2021-07-27 10:55:05.235505','파이썬 야무지게 다루실 분 ?',80000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(48,'2021-07-27 10:55:05.237571','2021-07-27 10:55:05.237585','소프트웨어 !!!1',100000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(49,'2021-07-27 10:55:05.240365','2021-07-27 10:55:05.240384','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(50,'2021-07-27 10:55:05.242768','2021-07-27 10:55:05.242795','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(51,'2021-07-27 10:55:05.245808','2021-07-27 10:55:05.245827','백엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(52,'2021-07-27 10:55:05.248087','2021-07-27 10:55:05.248099','프론트엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(53,'2021-07-27 10:55:05.806173','2021-07-27 10:55:05.806194','국보급 엔지니어 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(54,'2021-07-27 10:55:05.809608','2021-07-27 10:55:05.809623','프론트엔드 디벨로퍼 구합니다 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(55,'2021-07-27 10:55:05.812861','2021-07-27 10:55:05.812876','파이썬 야무지게 다루실 분 ?',80000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(56,'2021-07-27 10:55:05.815611','2021-07-27 10:55:05.815622','소프트웨어 !!!1',100000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(57,'2021-07-27 10:55:05.818362','2021-07-27 10:55:05.818373','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(58,'2021-07-27 10:55:05.821049','2021-07-27 10:55:05.821060','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(59,'2021-07-27 10:55:05.823672','2021-07-27 10:55:05.823688','백엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(60,'2021-07-27 10:55:05.826611','2021-07-27 10:55:05.826632','프론트엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(61,'2021-07-27 10:55:06.319841','2021-07-27 10:55:06.319862','국보급 엔지니어 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(62,'2021-07-27 10:55:06.323666','2021-07-27 10:55:06.323689','프론트엔드 디벨로퍼 구합니다 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(63,'2021-07-27 10:55:06.326691','2021-07-27 10:55:06.326709','파이썬 야무지게 다루실 분 ?',80000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(64,'2021-07-27 10:55:06.329311','2021-07-27 10:55:06.329322','소프트웨어 !!!1',100000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(65,'2021-07-27 10:55:06.333130','2021-07-27 10:55:06.333140','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(66,'2021-07-27 10:55:06.336129','2021-07-27 10:55:06.336140','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(67,'2021-07-27 10:55:06.338139','2021-07-27 10:55:06.338150','백엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(68,'2021-07-27 10:55:06.340909','2021-07-27 10:55:06.340921','프론트엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(69,'2021-07-27 10:55:06.902415','2021-07-27 10:55:06.902437','국보급 엔지니어 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(70,'2021-07-27 10:55:06.906450','2021-07-27 10:55:06.906479','프론트엔드 디벨로퍼 구합니다 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(71,'2021-07-27 10:55:06.909876','2021-07-27 10:55:06.909894','파이썬 야무지게 다루실 분 ?',80000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(72,'2021-07-27 10:55:06.912617','2021-07-27 10:55:06.912629','소프트웨어 !!!1',100000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(73,'2021-07-27 10:55:06.914748','2021-07-27 10:55:06.914759','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(74,'2021-07-27 10:55:06.917855','2021-07-27 10:55:06.917866','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(75,'2021-07-27 10:55:06.921064','2021-07-27 10:55:06.921078','백엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(76,'2021-07-27 10:55:06.924847','2021-07-27 10:55:06.924870','프론트엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(77,'2021-07-27 10:55:07.416343','2021-07-27 10:55:07.416365','국보급 엔지니어 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(78,'2021-07-27 10:55:07.419746','2021-07-27 10:55:07.419761','프론트엔드 디벨로퍼 구합니다 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(79,'2021-07-27 10:55:07.423384','2021-07-27 10:55:07.423396','파이썬 야무지게 다루실 분 ?',80000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(80,'2021-07-27 10:55:07.426023','2021-07-27 10:55:07.426034','소프트웨어 !!!1',100000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(81,'2021-07-27 10:55:07.428645','2021-07-27 10:55:07.428656','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(82,'2021-07-27 10:55:07.430740','2021-07-27 10:55:07.430751','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(83,'2021-07-27 10:55:07.433858','2021-07-27 10:55:07.433869','백엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(84,'2021-07-27 10:55:07.436642','2021-07-27 10:55:07.436663','프론트엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(85,'2021-07-27 10:55:07.891490','2021-07-27 10:55:07.891508','국보급 엔지니어 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(86,'2021-07-27 10:55:07.895439','2021-07-27 10:55:07.895453','프론트엔드 디벨로퍼 구합니다 (주니어)',50000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(87,'2021-07-27 10:55:07.898017','2021-07-27 10:55:07.898030','파이썬 야무지게 다루실 분 ?',80000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(88,'2021-07-27 10:55:07.901032','2021-07-27 10:55:07.901050','소프트웨어 !!!1',100000000,NULL,'- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발','\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자',NULL,NULL,NULL,NULL,2,1,1),(89,'2021-07-27 10:55:07.904406','2021-07-27 10:55:07.904426','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(90,'2021-07-27 10:55:07.907032','2021-07-27 10:55:07.907043','백엔드 엔지니어 개발자',120000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(91,'2021-07-27 10:55:07.909862','2021-07-27 10:55:07.909873','백엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1),(92,'2021-07-27 10:55:07.913301','2021-07-27 10:55:07.913313','프론트엔드 장인',150000000,NULL,'• Flink/StreamSets 기반의 실시간 스트리밍 파이프라인 개발\n• 모던 데이터 아키텍처 기반의 이벤트/데이터 모델링\n• 데이터 전처리 및 검증 프로세스 개발',NULL,NULL,NULL,NULL,NULL,2,1,1);
/*!40000 ALTER TABLE `job_postings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `job_group_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_job_group_id_065a5785_fk_job_groups_id` (`job_group_id`),
  CONSTRAINT `jobs_job_group_id_065a5785_fk_job_groups_id` FOREIGN KEY (`job_group_id`) REFERENCES `job_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'nodeJS 개발자',1),(2,'프론트엔드 개발자',1),(3,'python 개발자',1),(4,'소프트웨어 개발자',1),(5,'C, C++ 개발자',1),(6,'서버 개발자',1),(7,'웹 개발자',1),(8,'자바 개발자',1),(9,'nodeJS 개발자',1),(10,'프론트엔드 개발자',1),(11,'python 개발자',1),(12,'소프트웨어 개발자',1),(13,'C, C++ 개발자',1),(14,'서버 개발자',1),(15,'웹 개발자',1),(16,'자바 개발자',1),(17,'A 개발자',1),(18,'B 개발자',1),(19,'C 개발자',1),(20,'D 개발자',1),(21,'F 개발자',1),(22,'G 개발자',1),(23,'T 개발자',1),(24,'R 개발자',1);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `country_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `regions_country_id_432a4d4c_fk_countries_id` (`country_id`),
  CONSTRAINT `regions_country_id_432a4d4c_fk_countries_id` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'서울',1),(2,'대전',1),(3,'부산',1);
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resumes`
--

DROP TABLE IF EXISTS `resumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resumes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `title` varchar(100) NOT NULL,
  `is_done` tinyint(1) NOT NULL,
  `file_url` varchar(200) DEFAULT NULL,
  `content` json NOT NULL,
  `is_file` tinyint(1) NOT NULL,
  `file_uuid` varchar(200) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resumes_user_id_c088c4b3_fk_users_id` (`user_id`),
  CONSTRAINT `resumes_user_id_c088c4b3_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumes`
--

LOCK TABLES `resumes` WRITE;
/*!40000 ALTER TABLE `resumes` DISABLE KEYS */;
INSERT INTO `resumes` VALUES (1,'2021-07-27 10:40:20.292882','2021-07-27 10:40:20.292894','호머 심슨 이력서',1,NULL,'{\"skill\": \"마지 심슨 골려먹기\", \"career\": \"원자력 발전소 3년차\", \"education\": \"도넛대학교 2학년 중퇴\", \"description\": \"DDDDDDDDDDDDhough!\"}',0,'',1),(2,'2021-07-27 10:40:20.296450','2021-07-27 10:40:20.296473','바트 심슨 이력서',1,NULL,'{\"skill\": \"매기 심슨 돌보다 말기\", \"career\": \"중학교 1년차\", \"education\": \"도넛중학교 2학년 중퇴\", \"description\": \"lalalaaa!\"}',0,'',2),(3,'2021-07-27 10:40:20.299158','2021-07-27 10:40:20.299177','리사 심슨 이력서',1,NULL,'{\"skill\": \"토익 900점\", \"career\": \"범생이 3년차\", \"education\": \"도넛대학교 2학년 \", \"description\": \"hi!\"}',0,'',3),(4,'2021-07-27 10:40:20.301496','2021-07-27 10:40:20.301506','마지 심슨 이력서',1,NULL,'{\"skill\": \"머리 볶기\", \"career\": \"주부 10년차\", \"education\": \"도넛대학교 졸업\", \"description\": \"don\'t do that!\"}',0,'',4),(5,'2021-07-27 10:40:20.304535','2021-07-27 10:40:20.304546','매기 심슨 이력서',1,NULL,'{\"skill\": \"\", \"career\": \"아기 3년차\", \"education\": \"\", \"description\": \"응애!\"}',0,'',5),(7,'2021-07-27 10:43:36.749352','2021-07-27 10:43:36.749376','호머 심슨 이력서',1,NULL,'{\"skill\": \"마지 심슨 골려먹기\", \"career\": \"원자력 발전소 3년차\", \"education\": \"도넛대학교 2학년 중퇴\", \"description\": \"DDDDDDDDDDDDhough!\"}',0,'',1),(8,'2021-07-27 10:43:36.757065','2021-07-27 10:43:36.757099','바트 심슨 이력서',1,NULL,'{\"skill\": \"매기 심슨 돌보다 말기\", \"career\": \"중학교 1년차\", \"education\": \"도넛중학교 2학년 중퇴\", \"description\": \"lalalaaa!\"}',0,'',2),(9,'2021-07-27 10:43:36.762421','2021-07-27 10:43:36.762453','리사 심슨 이력서',1,NULL,'{\"skill\": \"토익 900점\", \"career\": \"범생이 3년차\", \"education\": \"도넛대학교 2학년 \", \"description\": \"hi!\"}',0,'',3),(10,'2021-07-27 10:43:36.765229','2021-07-27 10:43:36.765260','마지 심슨 이력서',1,NULL,'{\"skill\": \"머리 볶기\", \"career\": \"주부 10년차\", \"education\": \"도넛대학교 졸업\", \"description\": \"don\'t do that!\"}',0,'',4),(11,'2021-07-27 10:43:36.768342','2021-07-27 10:43:36.768374','매기 심슨 이력서',1,NULL,'{\"skill\": \"\", \"career\": \"아기 3년차\", \"education\": \"\", \"description\": \"응애!\"}',0,'',5),(20,'2021-07-27 13:20:11.229272','2021-07-27 13:20:11.229326','성준\'s 첫번째 이력서',1,NULL,'{\"skill\": \"\", \"career\": \"아기 3년차\", \"education\": \"\", \"description\": \"응애!\"}',0,'1',7),(21,'2021-07-27 13:20:11.233242','2021-07-27 13:20:11.233262','성준\'s 두번째 이력서',1,NULL,'{\"skill\": \"\", \"career\": \"아기 3년차\", \"education\": \"\", \"description\": \"응애!\"}',0,'2',7),(22,'2021-07-27 13:20:11.236225','2021-07-27 13:20:11.236242','성준\'s 세번째 이력서',1,NULL,'{\"skill\": \"\", \"career\": \"아기 3년차\", \"education\": \"\", \"description\": \"응애!\"}',0,'3',7),(23,'2021-07-27 13:20:11.238539','2021-07-27 13:20:11.238557','성준\'s 네번째 이력서',1,NULL,'{\"skill\": \"\", \"career\": \"아기 3년차\", \"education\": \"\", \"description\": \"응애!\"}',0,'4',7),(24,'2021-07-27 13:20:11.241603','2021-07-27 13:20:11.241619','성준\'s 다섯번째 이력서',1,NULL,'{\"skill\": \"\", \"career\": \"아기 3년차\", \"education\": \"\", \"description\": \"응애!\"}',0,'5',7);
/*!40000 ALTER TABLE `resumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resumes_applies`
--

DROP TABLE IF EXISTS `resumes_applies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resumes_applies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apply_id` bigint NOT NULL,
  `resume_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resumes_applies_resume_id_apply_id_763b909a_uniq` (`resume_id`,`apply_id`),
  KEY `resumes_applies_apply_id_2fcbff69_fk_applies_id` (`apply_id`),
  CONSTRAINT `resumes_applies_apply_id_2fcbff69_fk_applies_id` FOREIGN KEY (`apply_id`) REFERENCES `applies` (`id`),
  CONSTRAINT `resumes_applies_resume_id_ae67db0e_fk_resumes_id` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumes_applies`
--

LOCK TABLES `resumes_applies` WRITE;
/*!40000 ALTER TABLE `resumes_applies` DISABLE KEYS */;
/*!40000 ALTER TABLE `resumes_applies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_categories`
--

DROP TABLE IF EXISTS `tag_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `is_multiple_choice` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_categories`
--

LOCK TABLES `tag_categories` WRITE;
/*!40000 ALTER TABLE `tag_categories` DISABLE KEYS */;
INSERT INTO `tag_categories` VALUES (1,'인원수',0),(2,'편의시설',1),(3,'근무&휴가',1);
/*!40000 ALTER TABLE `tag_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `tag_category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_tag_category_id_cf11706c_fk_tag_categories_id` (`tag_category_id`),
  CONSTRAINT `tags_tag_category_id_cf11706c_fk_tag_categories_id` FOREIGN KEY (`tag_category_id`) REFERENCES `tag_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'50명이하',1),(2,'51~100명',1),(3,'101~200명',1),(4,'201~300명',1),(5,'사내카페',2),(6,'사내식당',2),(7,'주차',2),(8,'수면실',2),(9,'휴게실',2),(10,'위워크',2),(11,'야근없음',3),(12,'주35시간',3),(13,'유연근무',3),(14,'출산휴가',3);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_job_postings`
--

DROP TABLE IF EXISTS `tags_job_postings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_job_postings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_posting_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_job_postings_tag_id_job_posting_id_09091c50_uniq` (`tag_id`,`job_posting_id`),
  KEY `tags_job_postings_job_posting_id_8de9ca26_fk_job_postings_id` (`job_posting_id`),
  CONSTRAINT `tags_job_postings_job_posting_id_8de9ca26_fk_job_postings_id` FOREIGN KEY (`job_posting_id`) REFERENCES `job_postings` (`id`),
  CONSTRAINT `tags_job_postings_tag_id_20ca1b81_fk_tags_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_job_postings`
--

LOCK TABLES `tags_job_postings` WRITE;
/*!40000 ALTER TABLE `tags_job_postings` DISABLE KEYS */;
INSERT INTO `tags_job_postings` VALUES (1,1,1),(7,2,1),(13,3,1),(19,4,1),(25,5,2),(31,6,2),(37,7,2),(43,8,2),(2,1,5),(8,2,5),(14,3,5),(20,4,5),(3,1,6),(9,2,6),(15,3,6),(21,4,6),(4,1,7),(10,2,7),(16,3,7),(22,4,7),(26,5,8),(32,6,8),(38,7,8),(44,8,8),(27,5,9),(33,6,9),(39,7,9),(45,8,9),(28,5,10),(34,6,10),(40,7,10),(46,8,10),(5,1,11),(11,2,11),(17,3,11),(23,4,11),(6,1,12),(12,2,12),(18,3,12),(24,4,12),(29,5,13),(35,6,13),(41,7,13),(47,8,13),(30,5,14),(36,6,14),(42,7,14),(48,8,14);
/*!40000 ALTER TABLE `tags_job_postings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `profile_image` varchar(200) NOT NULL,
  `kakao_api_id` int DEFAULT NULL,
  `google_api_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2021-07-27 10:40:20.280404','2021-07-27 10:40:20.280422','Homer Simpson','homer@google.com','https://metro.co.uk/wp-content/uploads/2020/02/PRI_142406335-e1589297035275.jpg?quality=90&strip=all&zoom=1&resize=480%2C276',1,NULL),(2,'2021-07-27 10:40:20.282931','2021-07-27 10:40:20.282941','Bart Simpson','bart@google.com','https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/f15f5662080793.5a8432e3d5b6b.jpg',2,NULL),(3,'2021-07-27 10:40:20.285602','2021-07-27 10:40:20.285612','Lisa Simpson','lisa@google.com','https://upload.wikimedia.org/wikipedia/en/e/ec/Lisa_Simpson.png',3,NULL),(4,'2021-07-27 10:40:20.288174','2021-07-27 10:40:20.288184','Marge Simpson','marge@google.com','https://media.npr.org/assets/img/2013/05/07/ap0908140151727_vert-06dfa531201681c1ebe2d126471494fdeb5048ae-s800-c85.jpg',4,NULL),(5,'2021-07-27 10:40:20.290152','2021-07-27 10:40:20.290162','Maggie Simpson','maggie@google.com','https://ichef.bbci.co.uk/news/640/cpsprodpb/02F9/production/_104516700_3_spongebob_squarepants__hr.jpg',5,NULL),(7,'2021-07-27 13:11:56.286704','2021-07-27 13:11:56.286770','박성준','tmvpdlaos@naver.com','http://k.kakaocdn.net/dn/Eqt75/btqUM8CsEdY/YFw6KghMKO4kJANutIs9dK/img_640x640.jpg',1812812945,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-27 13:47:11
