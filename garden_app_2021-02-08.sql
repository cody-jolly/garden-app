# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 192.168.10.10 (MySQL 5.7.31-0ubuntu0.18.04.1)
# Database: garden_app
# Generation Time: 2021-02-08 17:23:38 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table bed_variety
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bed_variety`;

CREATE TABLE `bed_variety` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bed_id` bigint(20) unsigned NOT NULL,
  `variety_id` bigint(20) unsigned NOT NULL,
  `area` bigint(20) NOT NULL,
  `sowing_week` int(11) NOT NULL,
  `first_harvest_week` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bed_variety_bed_id_foreign` (`bed_id`),
  KEY `bed_variety_variety_id_foreign` (`variety_id`),
  CONSTRAINT `bed_variety_bed_id_foreign` FOREIGN KEY (`bed_id`) REFERENCES `beds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bed_variety_variety_id_foreign` FOREIGN KEY (`variety_id`) REFERENCES `varieties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `bed_variety` WRITE;
/*!40000 ALTER TABLE `bed_variety` DISABLE KEYS */;

INSERT INTO `bed_variety` (`id`, `bed_id`, `variety_id`, `area`, `sowing_week`, `first_harvest_week`)
VALUES
	(133,16,1,13334,9,21),
	(134,16,2,16666,9,18),
	(135,17,2,6192,9,18),
	(136,17,3,8000,11,19),
	(137,17,4,15808,21,31),
	(138,18,4,16192,21,31),
	(139,18,1,13334,13,25),
	(140,18,2,474,13,22),
	(146,13,1,6667,9,21),
	(147,13,2,11429,9,18),
	(148,13,3,4000,11,19),
	(149,13,1,6667,13,25),
	(150,13,2,11429,13,22),
	(151,13,3,4000,13,21),
	(152,13,1,5808,17,29),
	(153,14,1,859,17,29),
	(154,14,2,11429,17,26),
	(155,14,3,4000,15,23),
	(156,14,1,6667,21,33),
	(157,14,2,11429,21,30),
	(158,14,3,4000,17,25),
	(159,14,1,6667,25,37),
	(160,14,2,4949,25,34),
	(161,15,2,6480,25,34),
	(162,15,3,4000,19,27),
	(163,15,1,6667,29,41),
	(164,15,2,11429,29,38),
	(165,15,3,4000,21,29),
	(166,15,2,11429,33,42),
	(167,15,3,4000,23,31),
	(168,15,3,1995,25,33),
	(184,23,1,13334,9,21),
	(185,23,2,22858,9,18),
	(186,23,3,8000,11,19),
	(187,23,4,5808,21,31),
	(188,24,4,26192,21,31),
	(189,24,1,13334,13,25),
	(190,24,2,10474,13,22),
	(191,25,2,12384,13,22),
	(192,25,3,8000,13,21),
	(193,25,1,13334,17,29),
	(194,25,2,16282,17,26),
	(195,26,2,6576,17,26),
	(196,26,3,8000,15,23),
	(197,26,1,13334,21,33),
	(198,26,2,22090,21,30),
	(199,27,2,768,21,30),
	(200,27,3,8000,17,25),
	(201,27,1,13334,25,37),
	(202,27,2,22858,25,34),
	(203,27,3,5040,19,27);

/*!40000 ALTER TABLE `bed_variety` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table beds
# ------------------------------------------------------------

DROP TABLE IF EXISTS `beds`;

CREATE TABLE `beds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bed_number` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `garden_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `beds_garden_id_foreign` (`garden_id`),
  CONSTRAINT `beds_garden_id_foreign` FOREIGN KEY (`garden_id`) REFERENCES `gardens` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `beds` WRITE;
/*!40000 ALTER TABLE `beds` DISABLE KEYS */;

INSERT INTO `beds` (`id`, `bed_number`, `width`, `length`, `garden_id`, `created_at`, `updated_at`)
VALUES
	(13,1,100,500,27,'2021-01-28 16:39:04','2021-01-28 16:39:04'),
	(14,2,100,500,27,'2021-01-28 16:39:27','2021-01-28 16:39:27'),
	(15,3,100,500,27,'2021-01-28 16:39:33','2021-01-28 16:39:33'),
	(16,1,100,300,28,'2021-02-02 15:29:33','2021-02-02 15:29:33'),
	(17,2,100,300,28,'2021-02-02 15:29:40','2021-02-02 15:29:40'),
	(18,3,100,300,28,'2021-02-02 15:29:45','2021-02-02 15:29:45'),
	(23,1,100,500,30,'2021-02-08 12:59:10','2021-02-08 12:59:10'),
	(24,2,100,500,30,'2021-02-08 12:59:16','2021-02-08 12:59:16'),
	(25,3,100,500,30,'2021-02-08 12:59:22','2021-02-08 12:59:22'),
	(26,4,100,500,30,'2021-02-08 12:59:29','2021-02-08 12:59:29'),
	(27,5,100,500,30,'2021-02-08 13:00:13','2021-02-08 13:00:13');

/*!40000 ALTER TABLE `beds` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table gardens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gardens`;

CREATE TABLE `gardens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `servings_per_harvest` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `gardens_user_id_foreign` (`user_id`),
  CONSTRAINT `gardens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `gardens` WRITE;
/*!40000 ALTER TABLE `gardens` DISABLE KEYS */;

INSERT INTO `gardens` (`id`, `user_id`, `created_at`, `updated_at`, `name`, `servings_per_harvest`)
VALUES
	(27,3,'2021-01-28 16:38:41','2021-02-08 10:32:10','Garten 1',2),
	(28,1,'2021-01-29 09:13:58','2021-02-07 16:48:05','Garten 1',4),
	(30,1,'2021-02-08 12:59:00','2021-02-08 12:59:38','Garten 2',4);

/*!40000 ALTER TABLE `gardens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(67,'2014_10_12_000000_create_users_table',1),
	(68,'2014_10_12_100000_create_password_resets_table',1),
	(69,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),
	(70,'2019_08_19_000000_create_failed_jobs_table',1),
	(71,'2019_12_14_000001_create_personal_access_tokens_table',1),
	(72,'2021_01_07_192348_create_sessions_table',1),
	(73,'2021_01_12_170617_create_gardens_table',1),
	(80,'2021_01_12_170638_create_beds_table',2),
	(81,'2021_01_13_105310_add_name_to_gardens_table',2),
	(82,'2021_01_21_163621_create_varieties_table',2),
	(85,'2021_01_21_165055_create_bed_variety_table',3),
	(86,'2021_01_27_091200_add_servings_per_harvest_to_gardens_table',3),
	(91,'2021_01_29_105019_create_preferred_varieties_table',4),
	(93,'2021_02_05_081422_add_first_harvest_last_harvest_total_harvests_total_sowings_to_varieties_table',5),
	(94,'2021_02_05_083815_add_first_harvest_week_harvest_window_to_bed_variety_table',6),
	(95,'2021_02_05_085534_add_first_harvest_week_to_bed_variety_table',7);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table personal_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table preferred_varieties
# ------------------------------------------------------------

DROP TABLE IF EXISTS `preferred_varieties`;

CREATE TABLE `preferred_varieties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `garden_id` bigint(20) unsigned NOT NULL,
  `variety_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `preferred_varieties_garden_id_foreign` (`garden_id`),
  KEY `preferred_varieties_variety_id_foreign` (`variety_id`),
  CONSTRAINT `preferred_varieties_garden_id_foreign` FOREIGN KEY (`garden_id`) REFERENCES `gardens` (`id`) ON DELETE CASCADE,
  CONSTRAINT `preferred_varieties_variety_id_foreign` FOREIGN KEY (`variety_id`) REFERENCES `varieties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `preferred_varieties` WRITE;
/*!40000 ALTER TABLE `preferred_varieties` DISABLE KEYS */;

INSERT INTO `preferred_varieties` (`id`, `garden_id`, `variety_id`)
VALUES
	(21,27,1),
	(22,27,2),
	(23,27,3),
	(24,30,1),
	(25,30,2),
	(26,30,3),
	(27,30,4),
	(34,28,1),
	(35,28,2);

/*!40000 ALTER TABLE `preferred_varieties` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`)
VALUES
	('QBIovo3bs26SMlwIXaCTjhjT5nC820UAIt3TwiHB',1,'10.0.2.2','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoibUdSNjhONHV1cGthY0k4cGhVVjZ5dm5iUDc3dkRDQUhHS1I0S08zMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9nYXJkZW4tYXBwLnRlc3Q6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkcTQyWkFvVlhYT2dScUYyNHlHckwyLkFTRFZJaFZ3UlNiMzJBRUpDLjlJOWhkM29MT0o2VHkiO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJHE0MlpBb1ZYWE9nUnFGMjR5R3JMMi5BU0RWSWhWd1JTYjMyQUVKQy45STloZDNvTE9KNlR5Ijt9',1612804900);

/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`)
VALUES
	(1,'Cody Jolly','jolly.cody@gmail.com','2021-01-14 14:47:43','$2y$10$q42ZAoVXXOgRqF24yGrL2.ASDVIhVwRSb32AEJC.9I9hd3oLOJ6Ty',NULL,NULL,NULL,NULL,'profile-photos/fyYQNNnUSy7jjXbRxeHdoCRpdjnpjlNKzBFIwl8y.jpg','2021-01-14 14:47:31','2021-01-21 16:27:42'),
	(2,'Kristin Jolly','kj@kj.de','2021-01-21 18:01:40','$2y$10$YqNJSzoLPveO55CIET5VkeNXPW0npDkVkN4dhwzgbHUBLDSWkdGwy',NULL,NULL,NULL,NULL,NULL,'2021-01-21 18:01:33','2021-01-21 18:02:46'),
	(3,'Janine Ol','jo@jo.de','2021-01-28 16:37:13','$2y$10$0S4QkdxwAvDFSwHQIZyqcuPLRBmF5GbeOtuiUIERBYnQYupLV1EIa',NULL,NULL,NULL,NULL,'profile-photos/VJsVer94Wj9gyRkx1HTpC6CIdNJzU0mM0AeekTjE.jpg','2021-01-28 16:36:53','2021-01-28 16:38:02');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table varieties
# ------------------------------------------------------------

DROP TABLE IF EXISTS `varieties`;

CREATE TABLE `varieties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `variety_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weeks_to_maturity` int(11) NOT NULL,
  `servings_per_m2` int(11) NOT NULL,
  `max_low_temp` int(11) NOT NULL,
  `first_sowing` int(11) NOT NULL,
  `last_sowing` int(11) DEFAULT NULL,
  `harvest_window` int(11) NOT NULL,
  `multiple_sowings` tinyint(1) NOT NULL,
  `first_harvest` int(11) NOT NULL,
  `last_harvest` int(11) NOT NULL,
  `total_harvests` int(11) NOT NULL,
  `total_sowings` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `varieties` WRITE;
/*!40000 ALTER TABLE `varieties` DISABLE KEYS */;

INSERT INTO `varieties` (`id`, `variety_name`, `weeks_to_maturity`, `servings_per_m2`, `max_low_temp`, `first_sowing`, `last_sowing`, `harvest_window`, `multiple_sowings`, `first_harvest`, `last_harvest`, `total_harvests`, `total_sowings`)
VALUES
	(1,'Möhren',12,12,0,9,29,4,1,21,45,24,6),
	(2,'Rote Beete',9,7,0,9,32,4,1,18,45,27,7),
	(3,'Salat',8,10,0,11,32,2,1,19,42,23,12),
	(4,'Zuchini',10,10,5,21,0,8,0,31,39,8,1);

/*!40000 ALTER TABLE `varieties` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
