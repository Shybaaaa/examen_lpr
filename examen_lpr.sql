/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80300 (8.3.0)
 Source Host           : localhost:3306
 Source Schema         : examen_lpr

 Target Server Type    : MySQL
 Target Server Version : 80300 (8.3.0)
 File Encoding         : 65001

 Date: 11/07/2025 10:29:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_tokens
-- ----------------------------
DROP TABLE IF EXISTS `app_tokens`;
CREATE TABLE `app_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate_limit` int NOT NULL DEFAULT '1000',
  `requests_count` int NOT NULL DEFAULT '0',
  `reset_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_tokens_token_unique` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of app_tokens
-- ----------------------------
BEGIN;
INSERT INTO `app_tokens` (`id`, `name`, `token`, `rate_limit`, `requests_count`, `reset_at`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 'postman', 'bbc11cdf16205cdbff0a74edd09acac1054bf11d91ba93f247b8ca1a71ed45f3', 1000, 321, '2025-07-11 19:59:18', '2025-07-04 12:40:48', '2025-07-10 22:50:52', NULL);
COMMIT;

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cache
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for evenements
-- ----------------------------
DROP TABLE IF EXISTS `evenements`;
CREATE TABLE `evenements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_evenement` timestamp NOT NULL,
  `lieu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_participants` int NOT NULL,
  `user_id` int NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of evenements
-- ----------------------------
BEGIN;
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 'Conférence sur l\'Intelligence Artificielle', 'Une conférence passionnante sur les dernières avancées en IA et machine learning.', '2025-08-09 14:00:00', 'Centre de Congrès de Paris', 200, 103, 'https://example.com/images/ai-conference.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 'Atelier de Développement Web', 'Apprenez les bases du développement web moderne avec HTML, CSS et JavaScript.', '2025-07-25 10:00:00', 'École Supérieure du Digital', 25, 46, 'https://example.com/images/web-workshop.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, 'Meetup Développeurs Laravel', 'Rencontrez d\'autres développeurs Laravel et partagez vos expériences.', '2025-07-17 19:30:00', 'Coworking Space TechHub', 50, 49, 'https://example.com/images/laravel-meetup.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (4, 'Formation Sécurité Informatique', 'Découvrez les bonnes pratiques de sécurité pour protéger vos applications.', '2025-08-24 09:00:00', 'Institut de Cybersécurité', 30, 95, 'https://example.com/images/security-training.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (5, 'Hackathon Innovation Sociale', '48h pour créer des solutions innovantes aux défis sociaux actuels.', '2025-09-08 18:00:00', 'Campus Innovation', 100, 59, 'https://example.com/images/hackathon.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (6, 'Conférence DevOps et CI/CD', 'Maîtrisez les outils et pratiques DevOps pour optimiser votre pipeline de développement.', '2025-07-30 13:30:00', 'Tech Conference Center', 150, 74, 'https://example.com/images/devops-conference.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (7, 'Atelier UX/UI Design', 'Créez des interfaces utilisateur intuitives et esthétiques.', '2025-08-04 14:00:00', 'Design Studio Paris', 20, 139, 'https://example.com/images/ux-workshop.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (8, 'Meetup Data Science', 'Échangez sur les dernières tendances en science des données et analytics.', '2025-07-22 18:00:00', 'Data Science Hub', 40, 11, 'https://example.com/images/data-science-meetup.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (9, 'Formation Cloud Computing', 'Découvrez AWS, Azure et Google Cloud pour déployer vos applications.', '2025-08-14 10:00:00', 'Cloud Academy', 35, 157, 'https://example.com/images/cloud-training.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (10, 'Conférence Blockchain et Crypto', 'Explorez l\'avenir de la blockchain et des cryptomonnaies.', '2025-08-29 15:00:00', 'Blockchain Innovation Center', 120, 126, 'https://example.com/images/blockchain-conference.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (11, 'Meetup Mobile Development', 'Conférence sur les tendances actuelles du développement logiciel.', '2025-08-26 18:56:00', 'Hub Innovation Paris', 60, 199, 'https://example.com/images/event-6.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (12, 'Meetup Développeurs Frontend', 'Conférence sur les tendances actuelles du développement logiciel.', '2025-10-05 16:39:00', 'Centre de Recherche IT', 144, 143, 'https://example.com/images/event-10.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (13, 'Meetup Développeurs Frontend', 'Un événement passionnant pour découvrir les nouvelles technologies.', '2025-09-24 09:06:00', 'Académie du Développement', 55, 178, 'https://example.com/images/event-1.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (14, 'Hackathon Startup Weekend', 'Conférence sur l\'innovation technologique et ses impacts.', '2025-08-11 19:29:00', 'Espace Coworking Central', 55, 107, 'https://example.com/images/event-1.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (15, 'Formation Base de Données', 'Un événement passionnant pour découvrir les nouvelles technologies.', '2025-08-15 14:52:00', 'Hub Innovation Paris', 103, 160, 'https://example.com/images/event-10.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (16, 'Atelier API REST', 'Meetup pour découvrir les frameworks modernes.', '2025-09-05 20:02:00', 'Espace Coworking Central', 146, 151, 'https://example.com/images/event-5.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (17, 'Meetup Mobile Development', 'Atelier interactif pour améliorer vos compétences techniques.', '2025-09-10 12:14:00', 'Centre de Formation Digital', 101, 78, 'https://example.com/images/event-9.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (18, 'Meetup Mobile Development', 'Atelier interactif pour améliorer vos compétences techniques.', '2025-07-29 10:11:00', 'Espace Coworking Central', 156, 13, 'https://example.com/images/event-10.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (19, 'Hackathon Startup Weekend', 'Formation pratique sur les outils modernes de développement.', '2025-09-25 17:03:00', 'Tech Hub Innovation', 53, 74, 'https://example.com/images/event-3.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (20, 'Atelier de Programmation Python', 'Conférence sur les tendances actuelles du développement logiciel.', '2025-08-02 10:32:00', 'Université Paris Tech', 130, 66, 'https://example.com/images/event-9.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (21, 'Conférence Microservices', 'Partagez vos connaissances et apprenez des autres développeurs.', '2025-08-13 09:26:00', 'Centre de Recherche IT', 134, 139, 'https://example.com/images/event-9.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (22, 'Atelier API REST', 'Un événement passionnant pour découvrir les nouvelles technologies.', '2025-07-28 17:27:00', 'Centre de Recherche IT', 117, 195, 'https://example.com/images/event-2.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (23, 'Formation Tests Automatisés', 'Meetup pour échanger sur les bonnes pratiques du développement.', '2025-09-05 20:30:00', 'Tech Hub Innovation', 44, 132, 'https://example.com/images/event-5.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (24, 'Conférence Architecture Logicielle', 'Atelier interactif pour améliorer vos compétences techniques.', '2025-09-06 15:04:00', 'Académie du Développement', 111, 163, 'https://example.com/images/event-10.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (25, 'Atelier de Programmation Python', 'Partagez vos connaissances et apprenez des autres développeurs.', '2025-07-15 20:49:00', 'Campus Numérique', 28, 54, 'https://example.com/images/event-10.jpg', 'a', '2025-07-10 20:32:28', '2025-07-10 20:32:28', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (26, 'Conférence sur l\'Intelligence Artificielle', 'Une conférence passionnante sur les dernières avancées en IA et machine learning.', '2025-08-09 14:00:00', 'Centre de Congrès de Paris', 200, 179, 'https://example.com/images/ai-conference.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (27, 'Atelier de Développement Web', 'Apprenez les bases du développement web moderne avec HTML, CSS et JavaScript.', '2025-07-25 10:00:00', 'École Supérieure du Digital', 25, 157, 'https://example.com/images/web-workshop.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (28, 'Meetup Développeurs Laravel', 'Rencontrez d\'autres développeurs Laravel et partagez vos expériences.', '2025-07-17 19:30:00', 'Coworking Space TechHub', 50, 94, 'https://example.com/images/laravel-meetup.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (29, 'Formation Sécurité Informatique', 'Découvrez les bonnes pratiques de sécurité pour protéger vos applications.', '2025-08-24 09:00:00', 'Institut de Cybersécurité', 30, 172, 'https://example.com/images/security-training.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (30, 'Hackathon Innovation Sociale', '48h pour créer des solutions innovantes aux défis sociaux actuels.', '2025-09-08 18:00:00', 'Campus Innovation', 100, 30, 'https://example.com/images/hackathon.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (31, 'Conférence DevOps et CI/CD', 'Maîtrisez les outils et pratiques DevOps pour optimiser votre pipeline de développement.', '2025-07-30 13:30:00', 'Tech Conference Center', 150, 135, 'https://example.com/images/devops-conference.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (32, 'Atelier UX/UI Design', 'Créez des interfaces utilisateur intuitives et esthétiques.', '2025-08-04 14:00:00', 'Design Studio Paris', 20, 23, 'https://example.com/images/ux-workshop.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (33, 'Meetup Data Science', 'Échangez sur les dernières tendances en science des données et analytics.', '2025-07-22 18:00:00', 'Data Science Hub', 40, 70, 'https://example.com/images/data-science-meetup.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (34, 'Formation Cloud Computing', 'Découvrez AWS, Azure et Google Cloud pour déployer vos applications.', '2025-08-14 10:00:00', 'Cloud Academy', 35, 72, 'https://example.com/images/cloud-training.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (35, 'Conférence Blockchain et Crypto', 'Explorez l\'avenir de la blockchain et des cryptomonnaies.', '2025-08-29 15:00:00', 'Blockchain Innovation Center', 120, 66, 'https://example.com/images/blockchain-conference.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (36, 'Hackathon Startup Weekend', 'Atelier interactif pour améliorer vos compétences techniques.', '2025-08-13 19:05:00', 'Centre de Recherche IT', 99, 100, 'https://example.com/images/event-8.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (37, 'Meetup Mobile Development', 'Un événement passionnant pour découvrir les nouvelles technologies.', '2025-09-15 17:06:00', 'Centre de Recherche IT', 112, 94, 'https://example.com/images/event-7.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (38, 'Atelier API REST', 'Conférence sur l\'innovation technologique et ses impacts.', '2025-08-04 14:22:00', 'Institut Supérieur Tech', 59, 111, 'https://example.com/images/event-10.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (39, 'Formation Base de Données', 'Conférence sur les tendances actuelles du développement logiciel.', '2025-08-29 16:46:00', 'Académie du Développement', 71, 163, 'https://example.com/images/event-1.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (40, 'Conférence Architecture Logicielle', 'Atelier pratique sur la sécurité des applications web.', '2025-08-22 11:31:00', 'Centre de Formation Digital', 194, 128, 'https://example.com/images/event-10.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (41, 'Conférence Microservices', 'Conférence sur les tendances actuelles du développement logiciel.', '2025-09-06 11:20:00', 'Institut Supérieur Tech', 106, 175, 'https://example.com/images/event-3.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (42, 'Meetup Mobile Development', 'Partagez vos connaissances et apprenez des autres développeurs.', '2025-09-14 18:45:00', 'Université Paris Tech', 106, 31, 'https://example.com/images/event-1.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (43, 'Atelier de Programmation Python', 'Formation complète sur les méthodologies agiles.', '2025-09-10 18:14:00', 'Université Paris Tech', 48, 132, 'https://example.com/images/event-9.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (44, 'Atelier de Programmation Python', 'Meetup pour échanger sur les bonnes pratiques du développement.', '2025-07-24 15:00:00', 'Centre de Recherche IT', 89, 46, 'https://example.com/images/event-7.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (45, 'Formation Tests Automatisés', 'Atelier interactif pour améliorer vos compétences techniques.', '2025-10-08 16:48:00', 'Centre de Recherche IT', 71, 171, 'https://example.com/images/event-10.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (46, 'Hackathon Startup Weekend', 'Conférence sur les tendances actuelles du développement logiciel.', '2025-09-21 10:59:00', 'Centre de Formation Digital', 58, 59, 'https://example.com/images/event-2.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (47, 'Atelier de Programmation Python', 'Conférence sur l\'innovation technologique et ses impacts.', '2025-07-25 15:12:00', 'Campus Numérique', 176, 5, 'https://example.com/images/event-4.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (48, 'Formation Tests Automatisés', 'Meetup pour échanger sur les bonnes pratiques du développement.', '2025-09-25 17:45:00', 'Espace Coworking Central', 87, 99, 'https://example.com/images/event-4.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (49, 'Formation Base de Données', 'Atelier interactif pour améliorer vos compétences techniques.', '2025-09-04 12:32:00', 'Académie du Développement', 150, 9, 'https://example.com/images/event-10.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (50, 'Formation Tests Automatisés', 'Conférence sur les tendances actuelles du développement logiciel.', '2025-09-15 11:10:00', 'Institut Supérieur Tech', 190, 109, 'https://example.com/images/event-3.jpg', 'a', '2025-07-10 20:32:50', '2025-07-10 20:32:50', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (51, 'Conférence sur l\'Intelligence Artificielle', 'Une conférence passionnante sur les dernières avancées en IA et machine learning.', '2025-08-09 14:00:00', 'Centre de Congrès de Paris', 200, 144, 'https://example.com/images/ai-conference.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (52, 'Atelier de Développement Web', 'Apprenez les bases du développement web moderne avec HTML, CSS et JavaScript.', '2025-07-25 10:00:00', 'École Supérieure du Digital', 25, 35, 'https://example.com/images/web-workshop.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (53, 'Meetup Développeurs Laravel', 'Rencontrez d\'autres développeurs Laravel et partagez vos expériences.', '2025-07-17 19:30:00', 'Coworking Space TechHub', 50, 193, 'https://example.com/images/laravel-meetup.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (54, 'Formation Sécurité Informatique', 'Découvrez les bonnes pratiques de sécurité pour protéger vos applications.', '2025-08-24 09:00:00', 'Institut de Cybersécurité', 30, 156, 'https://example.com/images/security-training.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (55, 'Hackathon Innovation Sociale', '48h pour créer des solutions innovantes aux défis sociaux actuels.', '2025-09-08 18:00:00', 'Campus Innovation', 100, 48, 'https://example.com/images/hackathon.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (56, 'Conférence DevOps et CI/CD', 'Maîtrisez les outils et pratiques DevOps pour optimiser votre pipeline de développement.', '2025-07-30 13:30:00', 'Tech Conference Center', 150, 55, 'https://example.com/images/devops-conference.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (57, 'Atelier UX/UI Design', 'Créez des interfaces utilisateur intuitives et esthétiques.', '2025-08-04 14:00:00', 'Design Studio Paris', 20, 96, 'https://example.com/images/ux-workshop.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (58, 'Meetup Data Science', 'Échangez sur les dernières tendances en science des données et analytics.', '2025-07-22 18:00:00', 'Data Science Hub', 40, 72, 'https://example.com/images/data-science-meetup.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (59, 'Formation Cloud Computing', 'Découvrez AWS, Azure et Google Cloud pour déployer vos applications.', '2025-08-14 10:00:00', 'Cloud Academy', 35, 185, 'https://example.com/images/cloud-training.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (60, 'Conférence Blockchain et Crypto', 'Explorez l\'avenir de la blockchain et des cryptomonnaies.', '2025-08-29 15:00:00', 'Blockchain Innovation Center', 120, 102, 'https://example.com/images/blockchain-conference.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (61, 'Conférence sur le Machine Learning', 'Conférence sur les tendances actuelles du développement logiciel.', '2025-07-21 14:57:00', 'Hub Innovation Paris', 102, 28, 'https://example.com/images/event-4.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (62, 'Formation Base de Données', 'Un événement passionnant pour découvrir les nouvelles technologies.', '2025-07-25 12:28:00', 'Tech Hub Innovation', 32, 112, 'https://example.com/images/event-3.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (63, 'Atelier API REST', 'Atelier pratique sur la sécurité des applications web.', '2025-07-19 20:02:00', 'Hub Innovation Paris', 173, 45, 'https://example.com/images/event-6.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (64, 'Conférence sur le Machine Learning', 'Partagez vos connaissances et apprenez des autres développeurs.', '2025-08-28 09:51:00', 'Espace Coworking Central', 98, 112, 'https://example.com/images/event-2.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (65, 'Meetup Développeurs Frontend', 'Formation pratique sur les outils modernes de développement.', '2025-09-16 12:15:00', 'Tech Hub Innovation', 129, 59, 'https://example.com/images/event-10.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (66, 'Conférence Microservices', 'Conférence sur l\'innovation technologique et ses impacts.', '2025-09-07 19:00:00', 'Centre de Recherche IT', 176, 102, 'https://example.com/images/event-2.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (67, 'Formation Base de Données', 'Formation complète sur les méthodologies agiles.', '2025-08-06 11:57:00', 'Centre de Formation Digital', 194, 125, 'https://example.com/images/event-7.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (68, 'Conférence Microservices', 'Formation complète sur les méthodologies agiles.', '2025-08-23 20:41:00', 'Hub Innovation Paris', 27, 36, 'https://example.com/images/event-1.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (69, 'Formation Base de Données', 'Atelier interactif pour améliorer vos compétences techniques.', '2025-09-26 18:17:00', 'Espace Conférence Moderne', 113, 36, 'https://example.com/images/event-8.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (70, 'Meetup Développeurs Frontend', 'Un événement passionnant pour découvrir les nouvelles technologies.', '2025-07-20 10:57:00', 'Campus Numérique', 161, 82, 'https://example.com/images/event-10.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (71, 'Formation Base de Données', 'Conférence sur les tendances actuelles du développement logiciel.', '2025-08-20 18:42:00', 'Université Paris Tech', 40, 41, 'https://example.com/images/event-2.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (72, 'Formation Base de Données', 'Un événement passionnant pour découvrir les nouvelles technologies.', '2025-08-25 18:33:00', 'Espace Coworking Central', 110, 108, 'https://example.com/images/event-3.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (73, 'Meetup Développeurs Frontend', 'Formation pratique sur les outils modernes de développement.', '2025-09-19 19:14:00', 'Espace Coworking Central', 28, 90, 'https://example.com/images/event-8.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (74, 'Hackathon Startup Weekend', 'Conférence sur l\'innovation technologique et ses impacts.', '2025-08-08 10:46:00', 'Espace Coworking Central', 27, 23, 'https://example.com/images/event-10.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 20:32:51', NULL);
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (75, 'Hackathon Startup Weekend', 'Test MAJ', '2025-09-29 12:15:00', 'Tech Hub Innovation', 93, 95, 'https://example.com/images/event-10.jpg', 'a', '2025-07-10 20:32:51', '2025-07-10 22:37:36', '2025-07-10 22:37:36');
INSERT INTO `evenements` (`id`, `titre`, `description`, `date_evenement`, `lieu`, `max_participants`, `user_id`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (76, 'Test', 'TEstteetettte', '2025-07-12 12:00:00', 'Amsterdam', 50, 202, NULL, 'a', '2025-07-10 22:02:05', '2025-07-10 22:37:45', '2025-07-10 22:37:45');
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for inscriptions
-- ----------------------------
DROP TABLE IF EXISTS `inscriptions`;
CREATE TABLE `inscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `evenement_id` int NOT NULL,
  `user_id` int NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of inscriptions
-- ----------------------------
BEGIN;
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 15, 5, 'a', '2025-07-10 21:16:12', '2025-07-10 21:16:12', NULL);
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 3, 10, 'a', '2025-07-10 21:25:34', '2025-07-10 21:25:34', NULL);
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, 6, 202, 'a', '2025-07-10 21:26:36', '2025-07-10 21:53:52', '2025-07-10 21:53:52');
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (4, 1, 202, 'a', '2025-07-10 21:27:01', '2025-07-10 21:51:00', '2025-07-10 21:51:00');
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (5, 1, 202, 'a', '2025-07-10 21:27:16', '2025-07-10 21:51:45', '2025-07-10 21:51:45');
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (6, 2, 202, 'a', '2025-07-10 21:54:36', '2025-07-10 22:12:26', '2025-07-10 22:12:26');
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (7, 5, 202, 'a', '2025-07-10 21:54:37', '2025-07-10 22:12:24', '2025-07-10 22:12:24');
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (8, 8, 202, 'a', '2025-07-10 21:54:39', '2025-07-10 22:12:25', '2025-07-10 22:12:25');
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (9, 75, 202, 'a', '2025-07-10 22:12:21', '2025-07-10 22:12:25', '2025-07-10 22:12:25');
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (10, 70, 202, 'a', '2025-07-10 22:12:31', '2025-07-10 22:50:45', '2025-07-10 22:50:45');
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (11, 74, 202, 'a', '2025-07-10 22:12:32', '2025-07-10 22:13:16', '2025-07-10 22:13:16');
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (12, 76, 202, 'a', '2025-07-10 22:12:33', '2025-07-10 22:50:46', '2025-07-10 22:50:46');
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (13, 76, 202, 'a', '2025-07-10 22:13:15', '2025-07-10 22:13:17', '2025-07-10 22:13:17');
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (14, 73, 1, 'a', '2025-07-10 22:41:47', '2025-07-10 22:41:58', '2025-07-10 22:41:58');
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (15, 74, 1, 'a', '2025-07-10 22:41:48', '2025-07-10 22:41:58', '2025-07-10 22:41:58');
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (16, 74, 1, 'a', '2025-07-10 22:41:53', '2025-07-10 22:41:58', '2025-07-10 22:41:58');
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (17, 74, 1, 'a', '2025-07-10 22:41:54', '2025-07-10 22:41:58', '2025-07-10 22:41:58');
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (18, 74, 1, 'a', '2025-07-10 22:41:54', '2025-07-10 22:41:58', '2025-07-10 22:41:58');
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (19, 74, 1, 'a', '2025-07-10 22:41:54', '2025-07-10 22:41:59', '2025-07-10 22:41:59');
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (20, 74, 1, 'a', '2025-07-10 22:41:55', '2025-07-10 22:41:55', NULL);
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (21, 73, 202, 'a', '2025-07-10 22:50:41', '2025-07-10 22:50:47', '2025-07-10 22:50:47');
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (22, 74, 202, 'a', '2025-07-10 22:50:43', '2025-07-10 22:50:47', '2025-07-10 22:50:47');
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (23, 70, 202, 'a', '2025-07-10 22:50:50', '2025-07-10 22:50:50', NULL);
INSERT INTO `inscriptions` (`id`, `evenement_id`, `user_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (24, 69, 202, 'a', '2025-07-10 22:50:51', '2025-07-10 22:50:51', NULL);
COMMIT;

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of job_batches
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (8, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (9, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (10, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (11, '2025_07_02_082929_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (12, '2025_07_02_091017_create_app_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (13, '2025_07_02_123310_create_inscriptions_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (14, '2025_07_02_123405_create_evenements_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
BEGIN;
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (1, 'App\\Models\\User', 1, 'authToken', '61be0894616fbe75cc2e9a2f4b6f967610701af80db6e38efb9f0e898411b30b', '[\"*\"]', '2025-07-10 21:50:43', NULL, '2025-07-04 12:39:24', '2025-07-10 21:50:43');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (2, 'App\\Models\\User', 202, 'authToken', '1ca57670c026131266ba44c41ff3c64110c5d27a372251865c2b9a884def0824', '[\"*\"]', NULL, NULL, '2025-07-10 19:17:30', '2025-07-10 19:17:30');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (3, 'App\\Models\\User', 202, 'authToken', '94d50f0d87c9e8b641b251049ee60f0f885c15d0f55d808812066eaa6df07cc5', '[\"*\"]', NULL, NULL, '2025-07-10 19:23:42', '2025-07-10 19:23:42');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (4, 'App\\Models\\User', 1, 'authToken', '2790626bba62a40568eefbac5a11380cc6a7027127ffc52dec752b67ccadaf05', '[\"*\"]', NULL, NULL, '2025-07-10 19:39:31', '2025-07-10 19:39:31');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (5, 'App\\Models\\User', 202, 'authToken', 'bca9490dcf3279c075b7a657b9888db22030bcc166f6ba3f145c2932bac7298e', '[\"*\"]', NULL, NULL, '2025-07-10 19:49:20', '2025-07-10 19:49:20');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (6, 'App\\Models\\User', 202, 'authToken', 'e86ee1ded18a0610bbd4c49fbf44eb0cc9f8046bddcec260b21785ac40e5875d', '[\"*\"]', NULL, NULL, '2025-07-10 19:54:44', '2025-07-10 19:54:44');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (7, 'App\\Models\\User', 202, 'authToken', 'c6308d7b604fa91d8c05add33c3be3e49ac50def6b91193a497626588afc5bff', '[\"*\"]', NULL, NULL, '2025-07-10 19:56:03', '2025-07-10 19:56:03');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (8, 'App\\Models\\User', 202, 'authToken', 'a25e6cebffd9a8e46b251958b997a9ae7a264a4f9e65a57370827e8974cc578d', '[\"*\"]', NULL, NULL, '2025-07-10 19:56:31', '2025-07-10 19:56:31');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (9, 'App\\Models\\User', 202, 'authToken', 'bccf338faf28322a4e63dd232b1aae982d2696e0f395ff48d0671d77a116c4a9', '[\"*\"]', NULL, NULL, '2025-07-10 19:56:39', '2025-07-10 19:56:39');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (10, 'App\\Models\\User', 202, 'authToken', '00e6fe9f40f07176fb10e109ddbbb0258608272278164114cc7ac455b8535dda', '[\"*\"]', NULL, NULL, '2025-07-10 19:56:52', '2025-07-10 19:56:52');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (11, 'App\\Models\\User', 202, 'authToken', '4d56214a87da4826195ca14362c9886816c7aa0921affa5fb4d58fd91d9f6658', '[\"*\"]', NULL, NULL, '2025-07-10 19:57:14', '2025-07-10 19:57:14');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (12, 'App\\Models\\User', 202, 'authToken', '2572feb94e3a44e29ab3c7190ef3fb1c789fef659c0a6ca149fce08f305d25f4', '[\"*\"]', '2025-07-10 20:01:47', NULL, '2025-07-10 19:57:44', '2025-07-10 20:01:47');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (13, 'App\\Models\\User', 202, 'authToken', 'b84bf4d1ec73a8b1e5c242908e543840de4c683f903289709ae198601b583605', '[\"*\"]', '2025-07-10 20:04:08', NULL, '2025-07-10 20:01:50', '2025-07-10 20:04:08');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (14, 'App\\Models\\User', 202, 'authToken', '4a674749a684b50da97fd98187784f4e11793096374ca96e4bfcab42fdfadc55', '[\"*\"]', '2025-07-10 22:13:33', NULL, '2025-07-10 20:05:19', '2025-07-10 22:13:33');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (15, 'App\\Models\\User', 1, 'authToken', '37872c02b87eaf20be1bbb50a7a50a589abe4474251ec384bf8c5284face7e2f', '[\"*\"]', '2025-07-10 22:41:59', NULL, '2025-07-10 22:14:08', '2025-07-10 22:41:59');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (16, 'App\\Models\\User', 202, 'authToken', 'd9b54b7eb759a46e11616e6a7b34be955c34f3f2540f1ce0ee21bcc0f9eb6bdc', '[\"*\"]', '2025-07-10 22:50:52', NULL, '2025-07-10 22:50:37', '2025-07-10 22:50:52');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (17, 'App\\Models\\User', 202, 'authToken', '7f869961a4475475e3324eee246feeb8fc66885fab932baf02d5e3ba822c5f30', '[\"*\"]', NULL, NULL, '2025-07-11 08:23:23', '2025-07-11 08:23:23');
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 'user', 'a', NULL, NULL, NULL);
INSERT INTO `roles` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 'admin', 'a', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sessions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_utilisateur` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a',
  `role_id` int NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_utilisateur_unique` (`name_utilisateur`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 'admin_mFjGfO', 'adminsRO9C0@example.com', NULL, '$2y$12$wh1Bbiq1owxNV7ZlVIT/qeUsYDQcB6aphghvBnFnh1TWgUyl/O0XC', 'a', 2, NULL, '2025-07-04 12:23:09', '2025-07-04 12:23:09', NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 'user_qhdP0D', 'userY7YM89@example.com', NULL, '$2y$12$PVkXmuTkXNE/9vs/x3mTRO758mLemZsvmaMNLR1/rhfojJzOWIi1.', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, 'user_XdfDjR', 'userR0002U@example.com', NULL, '$2y$12$v6EfO3MQVsxCxmgQaiqfrujF1/gHOWEGdC80ZC.h112tHu.GOqfzS', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (4, 'user_0ahKbG', 'usertGA4r8@example.com', NULL, '$2y$12$PCJm395cCHvIRHAkDZbIq.4De6lyfJ9ddWbzPspTPiWlctpfYj66y', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (5, 'user_EGs3qz', 'userSj90S2@example.com', NULL, '$2y$12$MUvHANaRNBYPD8tz/i/bYeNspzpnYicsQde5uuM3TIazCMZ378qDu', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (6, 'user_E32Z2L', 'userlkfWju@example.com', NULL, '$2y$12$MuswXV1.5I7QX5r3ZZOI5eMQ2ub.YMUGrZoFhTenNKN2TC66xHk/i', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (7, 'user_IwbaWD', 'userWsAHJ3@example.com', NULL, '$2y$12$0QdYN3TaRd4bWYDKk8Jfqu9JJI/5x9rJ0CthDShENfC/esqMSMazu', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (8, 'user_UTDAVJ', 'user3G7Eez@example.com', NULL, '$2y$12$YZrEXHhidFYUyVYt28p.Ze0JShHOkC7/FeMIHOuSIhZB5b2lzufA6', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (9, 'user_zwZTGZ', 'userdBjM9m@example.com', NULL, '$2y$12$HQrNNDcKgmSANkJe2WO7reiUk7EhHxIMB9olNeQD.TRZ5l/zm1wd.', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (10, 'user_bjRE7w', 'useru4bC0p@example.com', NULL, '$2y$12$vLhYVlImzEc5bmGAf5mflebVC0PFMFwoqxRWx2JzMIecjuPAL2rT6', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (11, 'user_G9OhYX', 'userVMqRsI@example.com', NULL, '$2y$12$Er2UWpK/fq7OuqRENEzxLe/MdL1EpLk2GnorsbjLp.rx5lCBL3Oy.', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (12, 'user_VBuCqh', 'userjcqJPZ@example.com', NULL, '$2y$12$Xcv/41utgJOyAYg5rne4KOaG345Olqu157UEBzwD8zgqCsAg1Ctrm', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (13, 'user_agJOxo', 'user81QXpI@example.com', NULL, '$2y$12$tDSDNqND0xDJbZYFCNsldOv9quIUU4X7xEzN2qDoTOo/8a8/PgpcC', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (14, 'user_XCSKA3', 'userU3snUv@example.com', NULL, '$2y$12$iUp68DXR8zwWFpL0vWAI6uCCjkvcX0BrWmw88daRcdfsQBqihEznq', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (15, 'user_rv0TAU', 'usersSloXL@example.com', NULL, '$2y$12$X6gdY32uen.Agdij8ecdL.Jh/l4CQDHBMTql5v08zWX12SkzanZiu', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (16, 'user_l3UG5K', 'user1pSfCP@example.com', NULL, '$2y$12$ev.GlxHwkJvco/LdXMOQp.433goMt6kCmcBFL1YpEiDRknVCcqd1q', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (17, 'user_kPT5WG', 'userAxNt9X@example.com', NULL, '$2y$12$9wc4zEnwL90ragApxXcJPOyvf/kznSqW0xLGOl1IJOhORynOKLKnm', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (18, 'user_t66jgU', 'userEl86n9@example.com', NULL, '$2y$12$3VmN5AN3bV7KbXEV2Di2sOSNrcwxB3fmV1BSYsIoHrKQbqCChfRty', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (19, 'user_7Pnhfo', 'userpL9ue1@example.com', NULL, '$2y$12$x6Yj1tOUbWsbRnq1GOi/v./JS7zscg6F1QR9/VCdbyvZj2IGcEHbW', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (20, 'user_yWuY5Y', 'user8Q9bUd@example.com', NULL, '$2y$12$.9/M0xrorgTnZsijiwFAX.y4hZP4Z20FzSVRDqogj4WuIQpE6lyF6', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (21, 'user_5Pg55G', 'user0nss6N@example.com', NULL, '$2y$12$gc4gJdcJUF8dJVHdX07uHO1V9xQox4ynksk1uqgR7liO..0OexnMW', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (22, 'user_8Zl3O5', 'userHUesas@example.com', NULL, '$2y$12$r3rfXsEEwqTXH/0uhM0cV.25aqTMY8JdzAXs0T81uvvR/oXBX643O', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (23, 'user_ulMKyT', 'userJ3uxYc@example.com', NULL, '$2y$12$09V6UI6mRmM/.MxyJvvvVu1tvcWbxZZhQ8wQPQpU97U6hnERUyeT.', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (24, 'user_Aqhb7c', 'useryfwWxh@example.com', NULL, '$2y$12$RrVU0pOwK.qX7hBDeXd6mOzsC1pcprgBY7UJOoxoI9g6YcppAQh22', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (25, 'user_1HUITT', 'user9Mp5cE@example.com', NULL, '$2y$12$tBBytDOSzaKirFTA2crSW.mzCFdSy.bvqWWjGNTLK/N.uirQS45Mi', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (26, 'user_pbhqMX', 'userFmoGC3@example.com', NULL, '$2y$12$oOVMNjbRmF03xnFgcB0NUes65shQr7frhpwnLHVBy.JD.ivcV8zCO', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (27, 'user_HSIj0M', 'uservqugkG@example.com', NULL, '$2y$12$/iqBVyjGj6cL9r4CGmQEmujMnsjCkGOiiKR7cFUOLC4nmUNZEdFTm', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (28, 'user_oSdZah', 'userWQ3GJ5@example.com', NULL, '$2y$12$pubTJVbyRuNtqDJ.LZ/TE.VK1xL3nf66W80JWDHCx8oqF000E1sau', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (29, 'user_xlUWuT', 'userzwaECw@example.com', NULL, '$2y$12$i20rokSOBxNoyIcWs7RdJeU.Ez1x4Y933taO6DrzdOUgrsapPKqEO', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (30, 'user_b8s9lL', 'userBrt5FN@example.com', NULL, '$2y$12$TMMDkNEnhkGPesluhix.rOFtpdwyMYstcoDHFRV2lJtJlIiaPuUmi', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (31, 'user_7RIkgy', 'userAqeonY@example.com', NULL, '$2y$12$I2F98VRdcbtJeWA3/QED7O6hdWKOoY2A1P5sPg.XZCJlfRtPf.6CS', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (32, 'user_nah7dJ', 'useriG1pne@example.com', NULL, '$2y$12$PpeFhMg74.MF07WUmCg/VOW1PMsbuY7TqzsZjG/c.7pkTYyZ/iNK6', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (33, 'user_TmkwO9', 'userDliomJ@example.com', NULL, '$2y$12$wHFwDDy8wcm6PzPrgpdPJOZXWAnH68Sg5gEJrWqiYWENy1M8rrlXS', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (34, 'user_5FaUmG', 'usertdeVVj@example.com', NULL, '$2y$12$kFq2IgY6BMm91zhHewArkOZabRHRdhYzm3aL6qgW4syx3UFhexXtu', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (35, 'user_JlRl3h', 'userKo15bU@example.com', NULL, '$2y$12$Rg1XHw2pbCY7bc0W5OMNCOIsUccNxY29eha50znBGM04Q9YeR4HXK', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (36, 'user_Gqpp1t', 'uservMwv21@example.com', NULL, '$2y$12$zPqwb5aP0EY.lVlzz6xxQOEmqqPIyi0frXAKrc/XApIf1.bE4h7AS', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (37, 'user_BhYgoV', 'useroJzglS@example.com', NULL, '$2y$12$OOjkdrLm/RBn5Zylx1u.P.xqkBcZvo/wonKcWEQvHpwXfj.ZVGZr2', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (38, 'user_stRwKj', 'userggyrWN@example.com', NULL, '$2y$12$nhJ4gah86P5uQud1CLW6X.2H.PZ9A.5aLDbcscscn8Uj2fz2KvXry', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (39, 'user_z4niiN', 'userpsDmDn@example.com', NULL, '$2y$12$MfxcGFl/uza3bGOM73KtjeZmXmPLEd7Jp76k3PfUOMW0.UPgTJ77u', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (40, 'user_rxIJUa', 'usersTrLdn@example.com', NULL, '$2y$12$Lrc7o7EvHbD1JTav.Qty1.zk5vBvoLv2Af0U4BBo.dwXlWvz8KxnC', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (41, 'user_HMYN9D', 'userTJYrwd@example.com', NULL, '$2y$12$29fUU38NGLdZSIlWmEi/ludXu3t4uEuvuCGFayXjPQpDoFiljbvba', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (42, 'user_mugqGB', 'usermSXhaP@example.com', NULL, '$2y$12$o7AaOkVFmeWOS8JdME287uJmvfA5NgLrMjZ6COOWbY35cyvPKUTwu', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (43, 'user_UF25dX', 'usertH76C1@example.com', NULL, '$2y$12$sdGCyo89QloSr/MzX7V1tO8aKeQg9cJKEU9VPThgU9JKbmAUR72ji', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (44, 'user_AW7WEX', 'userW83Gfs@example.com', NULL, '$2y$12$j3vmnjpAXBunDkpRIfbShu38KlK43fh4es30KnNEf93NHaMLHUxJW', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (45, 'user_kuQhF1', 'userW76cqv@example.com', NULL, '$2y$12$wEA0ZgkQo3NL7Soub7YU9./3394ZJw1MOcnMX6vybj.v1y3.ZG.jS', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (46, 'user_A6Q970', 'user2KwpQb@example.com', NULL, '$2y$12$FAcptnCI3MUfKjr3MpwQnOntz3a85A6QIibepN7zZzxIwp64upyxq', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (47, 'user_MVeQim', 'userfb8LLS@example.com', NULL, '$2y$12$vni8n3A1uhGon/10/Kuiau3uNWDfExc0hMdTfpPMNSJco0lwZrtea', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (48, 'user_NBtOAf', 'userLPn7lh@example.com', NULL, '$2y$12$v0Q.LwbpCcNcrStH8rzKa..FGcL5vm6kygbOP4mkVTjjXJoYd3QY2', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (49, 'user_KiSbaz', 'userW87gZE@example.com', NULL, '$2y$12$SizHRRjFzcAsoDa/Nq5jDe553K3V6y7FvhKsJzJ4IBrZpM.UpA7hC', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (50, 'user_A1FBxm', 'userz1XDWK@example.com', NULL, '$2y$12$LYMqgtIQJ4t8mBozTOCU1.P0f7ruZEWPKoiv6LUstpvPpbbtix46q', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (51, 'user_oatRhH', 'userI6MIHw@example.com', NULL, '$2y$12$Lha8d0hKYVz7jyqYnBHfeugWkaUKAb1.RJi/e7pe.VhTRn.Onetze', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (52, 'user_PdmVcD', 'user3cMSHF@example.com', NULL, '$2y$12$jWVUy9nN6JyHVWLBxmLYVu3KnG6y7Jpz3ax2gaTJjIako8bGvoXqG', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (53, 'user_PF1Lhm', 'userCq8DjE@example.com', NULL, '$2y$12$zQValSQpLN3bx3cu9ONZBOS.XduCUzRd9kx/bNAV/eBQlMGxHi0ga', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (54, 'user_fASAMj', 'userbyByYp@example.com', NULL, '$2y$12$jWrM0arUpYUgwhsnDGvM8em2YPxQxU5ySN0GV9AbU178JTImqIjZS', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (55, 'user_BKAKiZ', 'userKv7YEB@example.com', NULL, '$2y$12$udG6FXFWMOJpmDNpM6O.eeu9pUb1fJR6uYvctAmue17tDpS/a7cm6', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (56, 'user_iwpda8', 'user7Ltqqs@example.com', NULL, '$2y$12$nUUbzHIrF5zgxFIXfrZ8zeTpfPc4dEmcu3xZkJdhwZlmRHRwe0NdG', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (57, 'user_4V3fk8', 'userUlfzMC@example.com', NULL, '$2y$12$YxyAjEx4z8Ffvlbe1f7.vuDnaZzjUkgP0AxU4vAjrjt7ybay5w5fa', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (58, 'user_1bMbLM', 'userfaAhxL@example.com', NULL, '$2y$12$HOUnMyCwcts1jfQmB6DXWegjNBt9ZKQs0hGgQD2obr4fIa6XWRuOi', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (59, 'user_MCryn0', 'userENZSbq@example.com', NULL, '$2y$12$m7FUJWyxiM1tGfXMDndB4uSZiKH2oBmoBaziOmjNdlARe4ezeflue', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (60, 'user_wmbax4', 'userGV4qUb@example.com', NULL, '$2y$12$4Nmz2FmCTsxBKyvt15s1FO5eObzHE5r82YY9bdwOlgt6WZD2H8sk6', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (61, 'user_lcFj7s', 'user1grSG8@example.com', NULL, '$2y$12$3tQa4DaYWc.CgZhpXvqKGu9fJmBv2vq/48A3sPGCw1Kcrd3agElbW', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (62, 'user_Wokk0D', 'user17INmv@example.com', NULL, '$2y$12$nJh87ZnN7CW2gZUqdN45l.TMHSgze4ZGF5AiB5n9IuNA2XSdgfFpm', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (63, 'user_IVO2za', 'usere2UaY8@example.com', NULL, '$2y$12$aTzmQMB28YXcGNdIbt5vgO1D7mPGOQGbspTshBlmcP5ezWkq424Su', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (64, 'user_OsufL6', 'userA5XM59@example.com', NULL, '$2y$12$.4c0eJFp8J8fHQCP5j0eQuPJuCY3kj83gUCRGwxmibipCD7ZIqWka', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (65, 'user_UIR4G3', 'user3jzsYd@example.com', NULL, '$2y$12$RvqKxxRt9tYRu3aqJb6TaejIiSf.IWi2/Cz/qyHapxRybcTLbhMgO', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (66, 'user_2dKF7O', 'userosrhGe@example.com', NULL, '$2y$12$tjx1Krx42bHzLHx5bkBbwOWmGql8mOvsTOMTugmP15j7hCRc7Oitq', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (67, 'user_d4mb4G', 'userTSc1Sd@example.com', NULL, '$2y$12$XWTUVSwmfiLpjktgYGMTs.3EZvTR95HQQSAOs0n5WtmM42m34LZse', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (68, 'user_5w2bsj', 'usertyqR5Y@example.com', NULL, '$2y$12$Rb1OkPehIl9duYQLMuTzgOzkyM6gNA/j6BwXh3yfdF4v.3F9Zllwu', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (69, 'user_NSmroX', 'userC4Tgt1@example.com', NULL, '$2y$12$lrD0cdVdSEfLjNQ8fK8.k.r7LvpItlVy1Xc2nmJ7breZ2P2PFq2jq', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (70, 'user_vx1FY7', 'usery6lXpI@example.com', NULL, '$2y$12$uRbHlUZ2Quydo.s2kVPcrOsgwP6KNdgmPzhYYu3DtOX6wU9Rcc3nO', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (71, 'user_vW9EEq', 'userM9DFcg@example.com', NULL, '$2y$12$IkydPza4DGZurSEjD/r4bO12Yn4OpAuZ45aQuA5AgztdjwfizrUAq', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (72, 'user_cOGHV3', 'userNK0ozH@example.com', NULL, '$2y$12$OsCRwiXq2RA3sm1Q9IdrxOZdW9a2bBUmj55b2JxLLUA3JHOJgfSBS', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (73, 'user_jWyTSC', 'userMc9dBb@example.com', NULL, '$2y$12$Y2JtCPvNtAWjkCQkBeJyOOepoXcJI1ZujUlnEYTLx/9YRKtME.77a', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (74, 'user_8y2TOT', 'user0l5lzD@example.com', NULL, '$2y$12$kJgb05t1ePs9Uv0PbKarLuzJPzIyNfuh0mgIXnkFPwq217UVedg1q', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (75, 'user_7fS0LL', 'userByOTRi@example.com', NULL, '$2y$12$iqVWp.L1Hmuub7PjpGPIPeAdaD2bAPIpEwB1PtUQR7aGw8Ddfhs/W', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (76, 'user_m8DXTE', 'userHvye93@example.com', NULL, '$2y$12$/X7XBecXPSmWglxkeh1AQOPH2DEWabWLJ5g1m09ZWrJNaoGca1IPS', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (77, 'user_CUPPz6', 'usercksZOS@example.com', NULL, '$2y$12$hlttKJa88NaeAGxDeOBxKuYwf96aCc9LOaFTdJarUXhowTrU6v.Aa', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (78, 'user_08gLIV', 'user9DSogr@example.com', NULL, '$2y$12$VywA9p/d.WcItB8S2bIUr.MpaR5vLOFggbraXDpDrrgxMQdFdV9P6', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (79, 'user_bot0et', 'user5EpGUE@example.com', NULL, '$2y$12$Q6HWFNw88hEctYVRUXdQ.OMuWqGlp.GbQryc3ObSiP4kipM18.FC.', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (80, 'user_Q7Zzre', 'userBmy7T6@example.com', NULL, '$2y$12$d.VsQS4whDrpklo1fnZdOe6BJk6pWW4zQM0d6YH/WExtJU8jGAfBO', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (81, 'user_s0wqup', 'usery4CTOG@example.com', NULL, '$2y$12$l.xbNVu0d.5dmPfO2rFwXOX7Ct4FrfqbRT6RchhAmKmfzevnSfj0y', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (82, 'user_Rvf2Wn', 'userCiUfj8@example.com', NULL, '$2y$12$PRmbRYJzS.FRaF/polOV5OZauC1IEbgiKxXeAKl212vA4FkoJnEAC', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (83, 'user_6hyQzm', 'usermp6SvR@example.com', NULL, '$2y$12$IxSsbZe1kMWxjoXVa10lZuu3XgMwr/lV3HR5cYCCrWxf6HuVk2A8u', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (84, 'user_o3zxYa', 'user8rVPgg@example.com', NULL, '$2y$12$rzBqm9IOzb99Y21l5TmTt.F3wkCzllFBTpP3Ij/Pgy07s1VWHZVzC', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (85, 'user_VXralj', 'useroQO44f@example.com', NULL, '$2y$12$lV.2DY18.1FuQHmKGU5P/Odpsa4XRvnp2k.X8WjPdA.rtCL13z7mC', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (86, 'user_536CoF', 'usereLxyPT@example.com', NULL, '$2y$12$0zXKklR/GAG8noPQhNbgeuECMeJ30LauBdK4gIEmpsGrncUELIWvq', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (87, 'user_98uiJg', 'userUpLk0f@example.com', NULL, '$2y$12$ANCB2BQAznYWAzM.cCtXiOIMPggFcUrEGc11zLwxO1a7Szi5vDZcG', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (88, 'user_xMlAOT', 'useruPcnaA@example.com', NULL, '$2y$12$F3PaObUBgPgosXF7zmNf4uyYiYQTH/bVw89xEfgMQxOPuXHlULKii', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (89, 'user_qfePXk', 'userKzidsB@example.com', NULL, '$2y$12$yYUMC50pYL8z7a76hJ/U7eugAypzv0MGDeGDFtKLm2lN7Q8GkCXUW', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (90, 'user_9JK6ki', 'userpR8Ojd@example.com', NULL, '$2y$12$OoKjslXiqSp1FZm0WisHquT.L9Zv4LyJYw7dxuTyOlqHIuQ2tyR86', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (91, 'user_F2Udum', 'userT8qcXX@example.com', NULL, '$2y$12$iS4hO4C3GmRLRXRJlpXX0ulEZl3a9GCx93c5eKCVMEa1hBpnPAmoq', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (92, 'user_y0qQ3Q', 'userbCfMOU@example.com', NULL, '$2y$12$YpOrV9p8pvUepuzhQ8EwU.m.Ol.CjsItOoO6FhpxG7jVpLWc3yZgq', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (93, 'user_mO2p7I', 'user5wh15L@example.com', NULL, '$2y$12$gkYYIo3f2A5Yf6zj2N3F5.x.TuzAdflULppzQJLgKZ4VWUOeDoA36', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (94, 'user_j419sc', 'usergWWv7v@example.com', NULL, '$2y$12$qdY1U4UdaN/qEwZxhk6KBuPPM0fdgT3tfPix9TQ3NMOcAOvGKxWwe', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (95, 'user_uGmZnE', 'userPXYh4q@example.com', NULL, '$2y$12$zfjzOahXpWzERx6wFA1CpOAqF77hgWlZishw1l64.zMCTIAYwFof2', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (96, 'user_A8OEro', 'userZQsPse@example.com', NULL, '$2y$12$1.zNg0kmlGI2o1o.jl0nke59fXE1l5q9zIAIEZuDj4VbZw9yzr2Vm', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (97, 'user_vjdJL1', 'userDYdCCW@example.com', NULL, '$2y$12$lwRmBX.g1SwQo1YsDcof5Olk.6VqrZpcTKbqthinbGG5ZGkzjG6Re', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (98, 'user_xYnokp', 'userG2jr0a@example.com', NULL, '$2y$12$aLx0FTqOSfjAf5bDZS2r0Ot4bJklECxwtR4We4hfnNXFjiV/RNmPy', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (99, 'user_49IlBv', 'userPf1vRp@example.com', NULL, '$2y$12$tj/CuBUlfd9BHXaF2zS6teHycSgbzIBw1kbJZwawnZjRMQYULxVLW', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (100, 'user_dmtLV8', 'userblD48N@example.com', NULL, '$2y$12$yx5A.ME9pFr7eSpMceXDoeMqL9AYxt9.eflWgBzLTDUapo8ZvH46m', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (101, 'user_rynq73', 'userAQ9hpq@example.com', NULL, '$2y$12$frBhtxJJLTnH85BZnHyQtOd/92vnOSOzsvVtfnpR8cXE.bCJYf.Ky', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (102, 'user_3GPcDK', 'userkPb1oN@example.com', NULL, '$2y$12$XBo4W9LNfJUAG6MBrF.xpuREVLqrYimh1R1zdPVOHx86gvywV4W1K', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (103, 'user_Unyzz7', 'userO8CbeD@example.com', NULL, '$2y$12$KKTOf/nWHfV3oZbB/SRBr.Kb9XrS1P2wUfbcltiHIkHLLI0pWVRQm', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (104, 'user_FzO1Cu', 'userfRijcQ@example.com', NULL, '$2y$12$.gTQWHplDj8ZzVMFQ88bkenxxP4d.hBPRyS4MG.NIelIA8Q3cdoMy', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (105, 'user_SjKlFI', 'userCEz0qG@example.com', NULL, '$2y$12$P6Gp3edoGShG9IqphkKiSOayqlsER.We5IislBhvaFOgUL9psj2hi', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (106, 'user_L67Aia', 'userecYkSl@example.com', NULL, '$2y$12$fSSW5b1PZjO.RVeu6L4l3uwVqoj8Hulh/zC2BKOl5mFZFfvdrDc.e', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (107, 'user_D5eoXs', 'userQkTJ1g@example.com', NULL, '$2y$12$zQplgD.EzRobAyjk6MeXIOwbE3BpRf2WSU7MBwbmn4RsvZ3VL27VW', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (108, 'user_85cWfa', 'userETIrV8@example.com', NULL, '$2y$12$A49JMKgL7dIQ23knP0mT5O//uZjJuHcrE/DDO8lYOoJkfIkQpSBCm', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (109, 'user_3FDAM0', 'useruuBB0v@example.com', NULL, '$2y$12$lsCp40DRzmCpapekfzVOE.gEKNFcgreZ14.LKqZkyJGy0m8j5neeG', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (110, 'user_qODmil', 'user8dWhx2@example.com', NULL, '$2y$12$lBvgJeK.JBP1KuXlgUyqi.TZiNPJzd3u06/yMzx7AkS5B3rZCfWY6', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (111, 'user_iEOB4E', 'userIwC3Xs@example.com', NULL, '$2y$12$4se7M0vNAOgqdRr7GyHap.vNipW4vbkqSOw8liBsBjIj0o6TdECaC', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (112, 'user_EH3hu1', 'useryRkwYp@example.com', NULL, '$2y$12$.tekn5xdiwdyoKiNScTa1ueKyIbfmZygJ5omJIFDGY9slkU2DVz8S', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (113, 'user_b9jzm4', 'userlUyotX@example.com', NULL, '$2y$12$8QiwIxQgVEqaE4GwrOwjtOHRsN00Ne/0p4uRDZjBApuWC6df3p84a', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (114, 'user_ztJMh2', 'usertinewl@example.com', NULL, '$2y$12$9rrtG9/PVhGs0lVZvKZqre4hUHxZvfzhrDBYhMHQvLMxSFW.A2DyC', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (115, 'user_q3qXQ5', 'useriT769I@example.com', NULL, '$2y$12$ymBEWgrd5gvNOGfxBPpIH.Uh4gfUQ1Ig4cLCGms1wkLTcdMiF00Am', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (116, 'user_EGwQMv', 'userRdkEkF@example.com', NULL, '$2y$12$6hf06ymBp3zGkQUxtAAfqOPDY6HndCAtomVilc5QYUE5lILpcMR66', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (117, 'user_7ddeY1', 'user61wWPB@example.com', NULL, '$2y$12$WO1wPzX48sllFEkeJgq4xOf7vKnOOJaOa0jtxB6WRhobpCe5bYwi2', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (118, 'user_MN9b9P', 'userVRbr2Z@example.com', NULL, '$2y$12$Oxw8wKWhT.7oqmxNVQNhIOgDNO0hewDm11OpfyqD8/ATg544Yw.im', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (119, 'user_rfF4At', 'userpIe9z8@example.com', NULL, '$2y$12$LaN5oV6DeIvIknRNvi/1CegsQZh2AGya6GDEx8Ao6.frlhQUvXwUC', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (120, 'user_doqM3M', 'userl1nh28@example.com', NULL, '$2y$12$9WC.8Qvb5YZQIAz5zLDXA.8cZCf8Wwx2V9e9JC/Mj8XM0OB.fh99W', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (121, 'user_qAa3AS', 'useru8q0SL@example.com', NULL, '$2y$12$fCuPuYAiuz9D9kwgtRqVEehZeRQgA4nt8j.8CuOFDWFtYndGh5R6u', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (122, 'user_ADYrsw', 'userEZaeDj@example.com', NULL, '$2y$12$Q9HZOmoAl.ZL4Z0Ui.OAF.JknJNmqYJ1gGgHzSZv1TjD6DVBmTLGW', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (123, 'user_SYMIqS', 'userLHs2i6@example.com', NULL, '$2y$12$dEfrAMmdUV65q/1sdwtk.OXKpjzd3MXaxEtuz3J/4dxG39Qqa6CI.', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (124, 'user_mTyXEm', 'user7vn9Pb@example.com', NULL, '$2y$12$UCgIQy0etquxoUP4KhJtme5yePJlGZCYwlloZFKlbqc.YL2pXj1ju', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (125, 'user_z9xm2B', 'userQtyzZu@example.com', NULL, '$2y$12$6i24.SV3z4/i7.fBzzdUzuTS9th./ftVXC9atFUHn/Ys/53x2WfD6', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (126, 'user_RfgLvk', 'user40jZBu@example.com', NULL, '$2y$12$2I.ejoica90304Eq.SDTvuM8PgZJ0XV/t4gvf5j98cJKSH3/lAkC6', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (127, 'user_aD1G75', 'user98prS4@example.com', NULL, '$2y$12$gWtSwCrnSrSJ2cj7X1sJ5e93iYuZ5PhRJXdsp60O4fYHJealbpgCe', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (128, 'user_lpHxMM', 'usernsUc4a@example.com', NULL, '$2y$12$fGJyLRj9t2.UW0Oti4dUtOVmGIM8jb8B.nijc90uPR/tGSc.LIGfa', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (129, 'user_iqbNqI', 'user1gF1Qt@example.com', NULL, '$2y$12$0O7yDKKHEobGOzPhrVVjpOBYYWyUleR2nuwm4ib1TiD50fRQpX2iS', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (130, 'user_xHT1kW', 'userViSUvw@example.com', NULL, '$2y$12$nGp1U.vi7/BqGyGUkiOR6ORxpwhVXiXLDABuMSeUR922IfRTNL/vK', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (131, 'user_G9X61u', 'user9UhMGF@example.com', NULL, '$2y$12$DCbv3fWJqdlDcvFM82bfD.nAnnoNy2ZUCvLjuVmRaWjnJfLrPR/li', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (132, 'user_ScA3PR', 'userFlQWBS@example.com', NULL, '$2y$12$GT9bnleqCoOkzKNf1t3P0ODkOHD9hsXSWtkha6rWLrNmjHFOOggbu', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (133, 'user_M6QU7R', 'useru5pWl5@example.com', NULL, '$2y$12$aFR0Ftleu0uu7TMeu00HCuqoP.Lt49ZAuDRpTuyc9D3vd5FYxAQsG', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (134, 'user_0wBpvu', 'usermPchMV@example.com', NULL, '$2y$12$bPOdgnaeOlSODAkq1dmHS.VjZAVPe6oUBjCiCs1ZmIgrGNLqdgaj2', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (135, 'user_8FPfLy', 'userX3P2nK@example.com', NULL, '$2y$12$Crg5WlBSWqxtBYWI3fRjKeHwvmPtLqAxS9c1fwxAwFWwuCnoQQCW6', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (136, 'user_H4Nn0r', 'useri4L6fd@example.com', NULL, '$2y$12$SajGUTMNBq2zU0Xj/izAJu0CK8gmNc8xXhGReTJJqQsQAG1M43Tsa', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (137, 'user_ZEMRGK', 'usercrOBZv@example.com', NULL, '$2y$12$.Shsyw3xrV7mnYA7E/TseewUTj/GNuZbMCM7jzkUAv1c1q6HYYbta', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (138, 'user_uGtX64', 'userhfxq51@example.com', NULL, '$2y$12$0RwfJxf1iJmHffsn41AZm.J05Da6p/hWL.UeI.68PHETE8Ppmd6N2', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (139, 'user_BGwkyy', 'useroGQQ77@example.com', NULL, '$2y$12$wk9PWLYg1m2WjNzvXpEm3ulcxnnwq6x8g2hWf46cYslPlUvXnzc06', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (140, 'user_9AkRSz', 'userUqmJWZ@example.com', NULL, '$2y$12$w7AN3vK0I2gWb2Y5/1hM7eQBmdlYdsmoEr98i6bolmQXVChOPouty', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (141, 'user_Y7Al4j', 'userzfifAw@example.com', NULL, '$2y$12$r4kZL/izL1ulBcum2KafkeJs9oiiU7QSUK9tCCiPXp6Vu.pz/ZQIy', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (142, 'user_MqAyH3', 'userNgbDsP@example.com', NULL, '$2y$12$q/WPzRRzLxvhnZGegXISSe3QzSmMHXRtXUCEDV6BW4eVhohbK68G2', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (143, 'user_ir24m4', 'userd0nnxb@example.com', NULL, '$2y$12$B39V.YrdC/58aRSbjEcOtOqLYsJWhu9dySMp45PH62G0/KVuG12o6', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (144, 'user_8MPg2Y', 'userBNpRsu@example.com', NULL, '$2y$12$/4HIcwA/uYvm6Kb3xgBEJulnggTtnwU7aZND/dtR4jssbfO16GmxS', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (145, 'user_w8AzsX', 'userv6otyl@example.com', NULL, '$2y$12$FboQ1rWzAYw9yh.hD1vYOuUf3f4MAfJEdlqMrUle2tnLKuEAy5C46', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (146, 'user_mtCYYy', 'userc9rxHR@example.com', NULL, '$2y$12$O.a6Me30UuZiuCDD.uhDBOLD0I7IHggbv06S6QoaWRJR8zux8ne3u', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (147, 'user_toMMGY', 'userCqd4D8@example.com', NULL, '$2y$12$2T.moJ6oBVN48qlOLL.RkeL4EjvSb4iZvN0lQEM5rwwdp00SiG8hy', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (148, 'user_6NHHpP', 'user7Jjvy4@example.com', NULL, '$2y$12$ZWyccn.dFlvy5y/TXZOoTep54COBSfvF8dR9DfMKBIHMJMHJPEdVa', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (149, 'user_SAeqqg', 'userfJL12i@example.com', NULL, '$2y$12$Zx.clTJ7vokLMwJnKklRseT2z9yXVOOqfuJoD44eaIF6DrKMl2mGi', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (150, 'user_XExdxc', 'user0wQwic@example.com', NULL, '$2y$12$KBuF7IufXZAucw1e9y1BmuhIANuupTj3MtN/cYctp5pN6UB8dI5lm', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (151, 'user_ZMNab9', 'userxqvgC0@example.com', NULL, '$2y$12$pTg/6ghiYx.9WG1oHBl4TOcP3XsUwLzvHkuF87wFCHkNw2/0GsGqS', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (152, 'user_CUdvcl', 'user8C4EAf@example.com', NULL, '$2y$12$5giKi2g/4h7MAM6t7wMLae064/yhTvSg5Y1mEhB64v79nQG2Qs4Bm', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (153, 'user_PUmonE', 'user8DcIfb@example.com', NULL, '$2y$12$n171p8jq9N55QSg/RYADaOfOjf1CwpY97tSn6T5cgUazskzar5jzW', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (154, 'user_elPKTQ', 'userRiPthp@example.com', NULL, '$2y$12$30B7ukXpuTRfVgM.Tz9QG.3Wn8wNfxBQPNljc7jJXJ/98KmHS9ptS', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (155, 'user_f5XPoy', 'usertBlPye@example.com', NULL, '$2y$12$3aiMNm/hy91c9YsJnXlD.u.qKZ3E7xmY9Mc9l.bRIuFYwOVXNReHy', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (156, 'user_XBB8Ln', 'userm53OXf@example.com', NULL, '$2y$12$bPTlAzG9GRxDrbME6iHOyu3LK7oRNN.U8gExjxulgNPSVfgiCPvO.', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (157, 'user_OX6N69', 'userUpyazY@example.com', NULL, '$2y$12$wjtihWFouzGgXmhF1UHF3.P/KD/nGmwXw0xdYtn9gO3mL1puJlG.i', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (158, 'user_MKG9BX', 'userEweM1D@example.com', NULL, '$2y$12$bKtu8otBQ0YOtJbL/2KKRePvT1tu3wNTr421wslGJqHKgPnddWFdK', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (159, 'user_v4ggid', 'userEakfjK@example.com', NULL, '$2y$12$dvBoTcNJjGxdVLBNTxFu2OxN7eI8vpcVITptoDyBugSmE95R8EeO6', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (160, 'user_a4YElY', 'userqfSWNO@example.com', NULL, '$2y$12$z8k2dPcFsNX57o2lUhR7/.xQc5TiPHHCaP21LNIEui0Hkg.VVRmbm', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (161, 'user_cZm94L', 'userdJMdfm@example.com', NULL, '$2y$12$/i9e40tR5GUSFe76C/ZpzusdXq8YjRbONyndsx.T0dOymTs7mYzFG', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (162, 'user_sZBhXb', 'userhaVMHR@example.com', NULL, '$2y$12$byuUzU7VVh1HXqcRo7wt8OG.J7jFKwdtYQDVi6ZaIz/8thjCL9NZe', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (163, 'user_rlhzUE', 'userL7jMoK@example.com', NULL, '$2y$12$9DxZCvMRgpYPI/VCNdqc.OrLsnavwFu9VMswWrnwXUg2qhhA1Cv1u', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (164, 'user_u64tra', 'userS56aa7@example.com', NULL, '$2y$12$GKpOBMSNH4QFm1lCP7FZqOe37ABIktnqXY1tnPA.rf7FzQlquXSW.', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (165, 'user_IZn1RZ', 'userKKwKee@example.com', NULL, '$2y$12$K16q.FMseO5i0lpBJiwP/uIdsrsV6JG17DKm9yHMeHcJSWUi6H9iW', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (166, 'user_p1BYnT', 'userv6NrtA@example.com', NULL, '$2y$12$3dn6H2volMNqK6KSU0yFbegrY1E05.dNPFyA/gsnBRBcez1GDgf/C', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (167, 'user_6B6UOp', 'userzGm0Ah@example.com', NULL, '$2y$12$xb4f6JkS1r20CUQSGyiQvOTnvhOjY5e62mudNxs5nWUGmFPNRAfFq', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (168, 'user_lTVvtQ', 'userVLNuwp@example.com', NULL, '$2y$12$6CWKgzAbs2C0GWnoybG2beBCf3vkE.hvi2VKiMPXtmbZCWwWbB0xu', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (169, 'user_TgjB17', 'userafwhQ2@example.com', NULL, '$2y$12$l0MgYFCseli2WzUIcZQODusQJdX8.yVyNKvS6DrRcC86whS8aqRni', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (170, 'user_yZcter', 'userrVi1MT@example.com', NULL, '$2y$12$qcB4F5tuZepjLz6S4TGxgesGfc9bqYCintBjJOGX0b1naoXVTnaUC', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (171, 'user_2oxhdZ', 'userRTc4cl@example.com', NULL, '$2y$12$8IQN75.tciJDZq8BFuUi8.1vMd/PjS4/IazRA3GuQCif.pVh1aO.e', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (172, 'user_q2LUVa', 'user2PNh0I@example.com', NULL, '$2y$12$8t.2vodUYY5GDlCmMTCI.OLiqBisYC5ZD33IJMAI8KGeGKT.3odSS', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (173, 'user_Vuo4fR', 'userAPyb56@example.com', NULL, '$2y$12$roN.CcHj1qn0OrnmJ9n1BuySbRsjLzlRfgtK5n.suObbdlOq8MyUe', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (174, 'user_Rt0soF', 'userrQnRPr@example.com', NULL, '$2y$12$5BEhzznvoU/V27/h9rQjputNPYSF5YE7SoFy4fvN0jYGNP13Qaai6', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (175, 'user_pQckFx', 'userNug9mb@example.com', NULL, '$2y$12$Ur0WKQGm38P8uP5hG1jQhOMcVZHkUMC1snUaUoUf68N5rvIpZhLlq', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (176, 'user_7PufA2', 'userZ5MZAd@example.com', NULL, '$2y$12$ifD69EZqdyp8aZjh8W2OQOpMoCbqz9tYV.xyPDMSZqeqtUs7oORNy', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (177, 'user_at6jnp', 'userrsK3Bx@example.com', NULL, '$2y$12$TZRRXpXpO5k5eLqMPyeCbe6RRwjtpEQhFrcggRGxc2EzBqBoO99pO', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (178, 'user_UjnkB0', 'userc1Lgwu@example.com', NULL, '$2y$12$YJY3lOO0tIx13FWE..ctCe7rqlhzPiM/GpLWkvv1xTKFpw.34BQ8q', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (179, 'user_sqfYJq', 'userfhmDce@example.com', NULL, '$2y$12$MiyO60kVQiBSlnwEAv3JRO/ayu9gdkVDCEKzls0DwNZpu0G6dp/W.', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (180, 'user_Csf559', 'userSpcqDf@example.com', NULL, '$2y$12$fEmql3NdVfRXBlcVr9j40eVtO8wvlPnfMCyX0LipNxeavUd9vYpPW', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (181, 'user_ywIs2w', 'useroGCOiV@example.com', NULL, '$2y$12$wKMoafncVMsBHwGyAVLzlOofnwwoYA8PNGpvVLxiZ3BiGlZGFMJR6', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (182, 'user_KniMJh', 'userXBojJi@example.com', NULL, '$2y$12$OtsYPhazdbfdGWeXSMkQCOMGZyyn2Nxe298vaylQvVQkn5x2V0kxq', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (183, 'user_etOYxC', 'userZQxayO@example.com', NULL, '$2y$12$.nC00lmc.DjELKLMPq8JYOSl2KXC8wcCVrV3f5cV1Tv6KwNkR9mRS', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (184, 'user_47Z0sy', 'userE7t0vF@example.com', NULL, '$2y$12$gz2qiRTdVCEoiybcDYAJUeT.nGfuijBaJ/GS.YxsgKJahFxrYmylm', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (185, 'user_YJCXbB', 'user8Ocssi@example.com', NULL, '$2y$12$pi35aRoTb4yMJ/mKixh.VOZ6qUki8iizVMubARyQvjq2ph0aoBe/.', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (186, 'user_MCRIVm', 'userLWLJaj@example.com', NULL, '$2y$12$GfX6Fajz9hk.FTkncU6pDe7x02eTV17YcK9aDbL9d.vactg9y0jQW', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (187, 'user_uIJCYn', 'userGoFOPb@example.com', NULL, '$2y$12$nu8/2n8xHSUnDh6EX8qrE.wb5fjarI6CBJUAk2evnADcw4RUEcqMW', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (188, 'user_gPZqlE', 'userIFCbSg@example.com', NULL, '$2y$12$linuVXUh.VJO8t4lIE/0xeOFIofBx60BuKXX9IKZf7yWJUQCEV13K', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (189, 'user_eJLqYM', 'userZyMu0o@example.com', NULL, '$2y$12$xqYQjKKgXa8jjCqzfgg0u.AdqNuo/MfT5oZSDItfqHupB.tpoo4pW', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (190, 'user_sUw89F', 'userH0eHxM@example.com', NULL, '$2y$12$CNRK3w7SFrJM7ZUg5wU.1OUyOOUbrqrGmYgHZPMR7Vr2CnU.gQmlu', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (191, 'user_5cJPTs', 'usernUN1bW@example.com', NULL, '$2y$12$4AYNc1czSaO5KicqU2FAKuKxYx81Kaf36f.NXntEJ9e/4aI3QyaFK', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (192, 'user_jfDm0P', 'userMvrCS0@example.com', NULL, '$2y$12$8zr7zuuC5AhO9pmU.a5emumLPrY41Q.VSYwkytIkjseOoKHAJesR6', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (193, 'user_vQX2px', 'userlkHGAl@example.com', NULL, '$2y$12$HCHA15LKxAYk/F1sfrhrAeNYV9TzP0WYBXlFd5MOAXZ1S0VQ9RKUm', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (194, 'user_SIZ7kO', 'userHCEZ0T@example.com', NULL, '$2y$12$.cwoUDnYw3DNlwWLQEQaluBwf9Y9REKC.pi5nCwYuJFSdVYLDNmfe', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (195, 'user_FpKQ2D', 'userq7AJ42@example.com', NULL, '$2y$12$6KLeG7DvLHraktN85czyouzdDNHbJV8zH22318PE7sDHmIxzswJx2', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (196, 'user_3Ghus5', 'useryrBNFH@example.com', NULL, '$2y$12$PpFCZXIN4we6AvaGdnsoJuXpt3FrAv0MJcK13jyzhGvKgAdkMqP4y', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (197, 'user_hSna5p', 'userdJtlF6@example.com', NULL, '$2y$12$c2WsY/UqkxSe75yiIUeG4uSXYoNZVIQsgaSjs8iFrDA2Nv9m85LAi', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (198, 'user_1Hga8F', 'userxAdW0H@example.com', NULL, '$2y$12$oFDWY8kOF6EeKctcoedWN.9HUlcN69fE0jQfxLu6G/5fSndej1I/m', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (199, 'user_Vy0ciA', 'userhk0BBZ@example.com', NULL, '$2y$12$aRY39G0qiZkVoTrAScRbEOv0KeD5gnP9.cydRUbyk/hT241CqUwi2', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (200, 'user_7V8y7c', 'usereSYK1H@example.com', NULL, '$2y$12$gP8zeYy3tb12acYuAj30z.RmfYCQLTeNg9Skr8cgB9St9p46RyANm', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (201, 'user_SPKjO8', 'userp5bsMy@example.com', NULL, '$2y$12$keBqNgtgdjC/wLv.amDnyeq9eSitXTmvB5EOhIU9g5k2MFx6TvD3i', 'a', 1, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name_utilisateur`, `email`, `email_verified_at`, `password`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (202, 'test', 'test@mail.com', NULL, '$2y$12$duU3HWh5SB7hL7ytNNpI7ezZJTaNg0x.BdSW7oSIbQUNJ3I9Unef.', 'a', 1, NULL, '2025-07-10 19:12:39', '2025-07-10 19:12:39', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
