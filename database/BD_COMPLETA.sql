-- ============================================
-- ChefGuedes - Base de Dados Completa
-- Estrutura limpa e atualizada
-- Criado: 15 Dezembro 2025
-- ============================================

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- ============================================
-- CRIAR BASE DE DADOS
-- ============================================
CREATE DATABASE IF NOT EXISTS `siteguedes` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `siteguedes`;

-- ============================================
-- TABELA: users
-- Utilizadores do sistema
-- ============================================
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_code` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Código único para convites',
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_picture` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `user_code` (`user_code`),
  KEY `idx_email` (`email`),
  KEY `idx_username` (`username`),
  KEY `idx_user_code` (`user_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABELA: user_preferences
-- Preferências dos utilizadores
-- ============================================
DROP TABLE IF EXISTS `user_preferences`;
CREATE TABLE `user_preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `cuisines` text COLLATE utf8mb4_unicode_ci,
  `restrictions` text COLLATE utf8mb4_unicode_ci,
  `newsletter` tinyint(1) DEFAULT '0',
  `notifications` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_pref` (`user_id`),
  CONSTRAINT `user_preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABELA: sessions
-- Sessões ativas
-- ============================================
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `session_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_me` tinyint(1) DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session_token` (`session_token`),
  KEY `idx_session_token` (`session_token`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABELA: recipes
-- Receitas do sistema
-- ============================================
DROP TABLE IF EXISTS `recipes`;
CREATE TABLE `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subcategory` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `ingredients` text COLLATE utf8mb4_unicode_ci,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `image` longtext COLLATE utf8mb4_unicode_ci,
  `prep_time` int DEFAULT NULL,
  `cook_time` int DEFAULT NULL,
  `servings` int DEFAULT NULL,
  `difficulty` enum('Fácil','Média','Difícil') COLLATE utf8mb4_unicode_ci DEFAULT 'Média',
  `author_id` int DEFAULT NULL,
  `is_draft` tinyint(1) DEFAULT '0',
  `visibility` enum('public','private','friends') COLLATE utf8mb4_unicode_ci DEFAULT 'public',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_category` (`category`),
  KEY `idx_author` (`author_id`),
  KEY `idx_created` (`created_at`),
  KEY `idx_visibility` (`visibility`),
  KEY `idx_subcategory` (`subcategory`),
  CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABELA: favorites
-- Receitas favoritas
-- ============================================
DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_favorite` (`user_id`,`recipe_id`),
  KEY `idx_user_favorites` (`user_id`),
  KEY `idx_recipe_favorites` (`recipe_id`),
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABELA: groups
-- Grupos de utilizadores
-- ============================================
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` longtext COLLATE utf8mb4_unicode_ci,
  `creator_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_creator` (`creator_id`),
  KEY `idx_created_at` (`created_at`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABELA: group_members
-- Membros dos grupos
-- ============================================
DROP TABLE IF EXISTS `group_members`;
CREATE TABLE `group_members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `user_id` int NOT NULL,
  `role` enum('admin','member') COLLATE utf8mb4_unicode_ci DEFAULT 'member',
  `joined_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_membership` (`group_id`,`user_id`),
  KEY `idx_group_members` (`group_id`),
  KEY `idx_user_groups` (`user_id`),
  CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `group_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABELA: notifications
-- Notificações do sistema
-- ============================================
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_id` int DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_notifications` (`user_id`),
  KEY `idx_is_read` (`is_read`),
  KEY `idx_type` (`type`),
  KEY `idx_created` (`created_at`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABELA: activities
-- Registo de atividades
-- ============================================
DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_activities` (`user_id`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_type` (`type`),
  CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABELA: friendships
-- Relações de amizade
-- ============================================
DROP TABLE IF EXISTS `friendships`;
CREATE TABLE `friendships` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user1_id` int NOT NULL,
  `user2_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_friendship` (`user1_id`,`user2_id`),
  KEY `idx_user1` (`user1_id`),
  KEY `idx_user2` (`user2_id`),
  CONSTRAINT `friendships_ibfk_1` FOREIGN KEY (`user1_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `friendships_ibfk_2` FOREIGN KEY (`user2_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABELA: friend_requests
-- Pedidos de amizade
-- ============================================
DROP TABLE IF EXISTS `friend_requests`;
CREATE TABLE `friend_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `status` enum('pending','accepted','rejected') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_request` (`sender_id`,`receiver_id`),
  KEY `idx_sender` (`sender_id`),
  KEY `idx_receiver_status` (`receiver_id`,`status`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABELA: migrations
-- Controlo de versões da BD
-- ============================================
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `executed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `version` (`version`),
  KEY `idx_version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- INSERIR VERSÃO DA MIGRAÇÃO
-- ============================================
INSERT INTO `migrations` (`version`, `description`, `executed_at`) VALUES
('1.0.0', 'Estrutura inicial ChefGuedes com sistema de códigos', NOW());

-- ============================================
-- CONCLUÍDO
-- ============================================
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
