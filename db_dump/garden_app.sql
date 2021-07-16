-- -------------------------------------------------------------
-- TablePlus 4.0.0(370)
--
-- https://tableplus.com/
--
-- Database: garden_app
-- Generation Time: 2021-07-16 12:57:13.7800
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `bed_variety` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bed_id` bigint unsigned NOT NULL,
  `variety_id` bigint unsigned NOT NULL,
  `area` bigint NOT NULL,
  `sowing_week` int NOT NULL,
  `first_harvest_week` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bed_variety_bed_id_foreign` (`bed_id`),
  KEY `bed_variety_variety_id_foreign` (`variety_id`),
  CONSTRAINT `bed_variety_bed_id_foreign` FOREIGN KEY (`bed_id`) REFERENCES `beds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bed_variety_variety_id_foreign` FOREIGN KEY (`variety_id`) REFERENCES `varieties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=463 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `beds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bed_number` int NOT NULL,
  `width` int NOT NULL,
  `length` int NOT NULL,
  `garden_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `beds_garden_id_foreign` (`garden_id`),
  CONSTRAINT `beds_garden_id_foreign` FOREIGN KEY (`garden_id`) REFERENCES `gardens` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `gardens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `servings_per_harvest` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `gardens_user_id_foreign` (`user_id`),
  CONSTRAINT `gardens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `preferred_varieties` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `garden_id` bigint unsigned NOT NULL,
  `variety_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `preferred_varieties_garden_id_foreign` (`garden_id`),
  KEY `preferred_varieties_variety_id_foreign` (`variety_id`),
  CONSTRAINT `preferred_varieties_garden_id_foreign` FOREIGN KEY (`garden_id`) REFERENCES `gardens` (`id`) ON DELETE CASCADE,
  CONSTRAINT `preferred_varieties_variety_id_foreign` FOREIGN KEY (`variety_id`) REFERENCES `varieties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `varieties` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `variety_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `weeks_to_maturity` int NOT NULL,
  `servings_per_m2` int NOT NULL,
  `max_low_temp` int NOT NULL,
  `first_sowing` int NOT NULL,
  `last_sowing` int DEFAULT NULL,
  `harvest_window` int NOT NULL,
  `multiple_sowings` tinyint(1) NOT NULL,
  `first_harvest` int NOT NULL,
  `last_harvest` int NOT NULL,
  `total_harvests` int NOT NULL,
  `total_sowings` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `bed_variety` (`id`, `bed_id`, `variety_id`, `area`, `sowing_week`, `first_harvest_week`) VALUES
(350, 16, 1, 6667, 9, 21),
(351, 16, 2, 11429, 9, 18),
(352, 16, 3, 4000, 11, 19),
(353, 16, 4, 7904, 21, 31),
(354, 17, 4, 8096, 21, 31),
(355, 17, 5, 2000, 12, 18),
(356, 17, 1, 6667, 13, 25),
(357, 17, 2, 11429, 13, 22),
(358, 17, 3, 1808, 13, 21),
(359, 18, 3, 2192, 13, 21),
(360, 18, 5, 2000, 14, 20),
(361, 18, 1, 6667, 17, 29),
(362, 18, 2, 11429, 17, 26),
(363, 18, 3, 4000, 15, 23),
(364, 18, 5, 2000, 16, 22),
(365, 18, 1, 1712, 21, 33);

INSERT INTO `beds` (`id`, `bed_number`, `width`, `length`, `garden_id`, `created_at`, `updated_at`) VALUES
(16, 1, 100, 300, 28, '2021-02-02 15:29:33', '2021-02-02 15:29:33'),
(17, 2, 100, 300, 28, '2021-02-02 15:29:40', '2021-02-02 15:29:40'),
(18, 3, 100, 300, 28, '2021-02-02 15:29:45', '2021-02-02 15:29:45');

INSERT INTO `gardens` (`id`, `user_id`, `created_at`, `updated_at`, `name`, `servings_per_harvest`) VALUES
(28, 1, '2021-01-29 09:13:58', '2021-02-09 08:59:57', 'Garten 1', 2);

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(67, '2014_10_12_000000_create_users_table', 1),
(68, '2014_10_12_100000_create_password_resets_table', 1),
(69, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(70, '2019_08_19_000000_create_failed_jobs_table', 1),
(71, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(72, '2021_01_07_192348_create_sessions_table', 1),
(73, '2021_01_12_170617_create_gardens_table', 1),
(80, '2021_01_12_170638_create_beds_table', 2),
(81, '2021_01_13_105310_add_name_to_gardens_table', 2),
(82, '2021_01_21_163621_create_varieties_table', 2),
(85, '2021_01_21_165055_create_bed_variety_table', 3),
(86, '2021_01_27_091200_add_servings_per_harvest_to_gardens_table', 3),
(91, '2021_01_29_105019_create_preferred_varieties_table', 4),
(93, '2021_02_05_081422_add_first_harvest_last_harvest_total_harvests_total_sowings_to_varieties_table', 5),
(94, '2021_02_05_083815_add_first_harvest_week_harvest_window_to_bed_variety_table', 6),
(95, '2021_02_05_085534_add_first_harvest_week_to_bed_variety_table', 7),
(96, '2021_02_09_093516_add_admin_to_users_table', 8),
(97, '2021_07_14_080222_add_softdeletes_to_varieties_table', 9);

INSERT INTO `preferred_varieties` (`id`, `garden_id`, `variety_id`) VALUES
(43, 28, 5),
(44, 28, 1),
(45, 28, 2),
(46, 28, 3),
(47, 28, 4);

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('d7AYhO25O3A7AK2JIpD08xv7ydIP21Kylzdz7oBf', 1, '10.0.2.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWVUwajVvekNLazh3TmFzVWh3bDRhYk5VVk5mTFl0WXM3d3R4ZDFaRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9nYXJkZW4tYXBwLnRlc3Q6MTA1MC9hZG1pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRvcHZ6TFoxTnlwOHhzblhRNUlSZWFlL2xvV0djUlhXWVVvdWJRZ3l4Q2MzRzZDM0wxcFJZRyI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkb3B2ekxaMU55cDh4c25YUTVJUmVhZS9sb1dHY1JYV1lVb3ViUWd5eENjM0c2QzNMMXBSWUciO30=', 1626432500),
('DsxfsrPGkLRKf118qFKn07hUMKNnBLAnnM0KbVfF', 1, '10.0.2.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiSWhOMnFNNVhxT2FTR0s5WGQ4U2dIcEFqT3B1OXROcW5ldnJ0VzVxYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJG9wdnpMWjFOeXA4eHNuWFE1SVJlYWUvbG9XR2NSWFdZVW91YlFneXhDYzNHNkMzTDFwUllHIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRvcHZ6TFoxTnlwOHhzblhRNUlSZWFlL2xvV0djUlhXWVVvdWJRZ3l4Q2MzRzZDM0wxcFJZRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9nYXJkZW4tYXBwLnRlc3Q6MTA1MCI7fX0=', 1626251074),
('Ipu4kEzW8F7yJGrqhyHFuFORB7cMrzzhw76boClq', 1, '10.0.2.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibGJCV1A1c1lHRmVOcDRWbVJzMjM5NkV1ZTVKa0x5ZEhmZGtMZm9uMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9nYXJkZW4tYXBwLnRlc3Q6MTA1MCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRvcHZ6TFoxTnlwOHhzblhRNUlSZWFlL2xvV0djUlhXWVVvdWJRZ3l4Q2MzRzZDM0wxcFJZRyI7fQ==', 1626251595),
('lLR5Xv6t2BYiy1prxh11o5t5natlkwMBSpLRrcrG', 1, '10.0.2.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiUjNCM2hRbFhTNUREQ21sekhQTUFKblZaNkdnZXp0VVhURFVxaGJXWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9nYXJkZW4tYXBwLnRlc3Q6MTA1MC9hZG1pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRvcHZ6TFoxTnlwOHhzblhRNUlSZWFlL2xvV0djUlhXWVVvdWJRZ3l4Q2MzRzZDM0wxcFJZRyI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkb3B2ekxaMU55cDh4c25YUTVJUmVhZS9sb1dHY1JYV1lVb3ViUWd5eENjM0c2QzNMMXBSWUciO30=', 1626255593),
('QApNnUGcd4YGYmADZaHkQOaeRwZ6jpaIH0cd4msd', 1, '10.0.2.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQmpDSlBkZUhVOHRFOXIxZTRiN0lFcTN4Sjh6Yk5WMEdkNG9VVE9ybyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHE0MlpBb1ZYWE9nUnFGMjR5R3JMMi5BU0RWSWhWd1JTYjMyQUVKQy45STloZDNvTE9KNlR5IjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRxNDJaQW9WWFhPZ1JxRjI0eUdyTDIuQVNEVkloVndSU2IzMkFFSkMuOUk5aGQzb0xPSjZUeSI7fQ==', 1612866596),
('VphJHfs89SI9ZBmu4eA1dkbnPi9gJOLsBLOOEvTH', 1, '10.0.2.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiOUw4VkRBVnpuSVByOHQ4UnRReDdqYktQMFREV2RsMUVWd0x5RnI3QiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9nYXJkZW4tYXBwLnRlc3Q6MTA1MCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRvcHZ6TFoxTnlwOHhzblhRNUlSZWFlL2xvV0djUlhXWVVvdWJRZ3l4Q2MzRzZDM0wxcFJZRyI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkb3B2ekxaMU55cDh4c25YUTVJUmVhZS9sb1dHY1JYV1lVb3ViUWd5eENjM0c2QzNMMXBSWUciO30=', 1626432982),
('ZjHeMLMdbXJsJn6xy2O9u8WhlPBLwX3GvIA3h6GB', 1, '10.0.2.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMWt0QVFibVY1cWZkRWpUejFYbjBoa1FUUjNxRWUxMEFFZ1VVWGVXcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9nYXJkZW4tYXBwLnRlc3Q6MTA1MCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRvcHZ6TFoxTnlwOHhzblhRNUlSZWFlL2xvV0djUlhXWVVvdWJRZ3l4Q2MzRzZDM0wxcFJZRyI7fQ==', 1626252446);

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `admin`) VALUES
(1, 'Cody Jolly', 'cj@cj.com', '2021-01-14 14:47:43', '$2y$10$opvzLZ1Nyp8xsnXQ5IReae/loWGcRXWYUoubQgyxCc3G6C3L1pRYG', NULL, NULL, 'AgkXv7oeBjH9qWA7IUaqYh3S0jYa2A3X0V0WKxgCOxgRWLk19t1oKDZVoqIk', NULL, 'profile-photos/fyYQNNnUSy7jjXbRxeHdoCRpdjnpjlNKzBFIwl8y.jpg', '2021-01-14 14:47:31', '2021-07-14 06:52:07', 1);

INSERT INTO `varieties` (`id`, `variety_name`, `weeks_to_maturity`, `servings_per_m2`, `max_low_temp`, `first_sowing`, `last_sowing`, `harvest_window`, `multiple_sowings`, `first_harvest`, `last_harvest`, `total_harvests`, `total_sowings`, `deleted_at`) VALUES
(1, 'Möhren', 12, 12, 0, 9, 29, 4, 1, 21, 45, 24, 6, NULL),
(2, 'Rote Beete', 9, 7, 0, 9, 32, 4, 1, 18, 45, 27, 7, NULL),
(3, 'Salat', 8, 10, 0, 11, 32, 2, 1, 19, 42, 23, 12, NULL),
(4, 'Zuchini', 10, 10, 5, 21, 0, 8, 0, 31, 39, 8, 1, NULL),
(5, 'Radieschen', 6, 20, 0, 12, 42, 2, 1, 18, 48, 30, 15, NULL);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;