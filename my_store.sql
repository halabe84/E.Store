-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 11, 2023 at 04:27 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Cars', 'gdjhvlbgsdilvjsdjhilge', 'car', NULL, NULL),
(2, 'mobile', ';iyfuyglyguhakuhs;uid', 'mob', NULL, NULL),
(3, 'Home and Garden', 'home', '', '2023-09-08 10:20:41', '2023-09-09 10:20:41'),
(4, 'Sports and Outdoors', 'sport', '', '2023-09-06 10:20:41', '2023-09-07 10:20:41'),
(5, 'Health and Beauty', 'health', '', '2023-09-03 10:22:49', '2023-09-11 10:22:49');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_07_15_193109_create_products_table', 1),
(6, '2023_07_15_193428_create_orders_table', 1),
(7, '2023_07_15_194016_create_products_orders_table', 1),
(8, '2023_09_08_132106_create_categories_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `total` double NOT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 0, '2023-09-08 23:31:58', '2023-09-08 20:31:58', '2023-09-09 05:19:14'),
(2, 1, 0, '2023-09-09 08:18:05', '2023-09-09 05:18:05', '2023-09-09 05:19:12'),
(3, 1, 0, '2023-09-09 08:18:55', '2023-09-09 05:18:55', '2023-09-09 05:19:10'),
(4, 1, 0, '2023-09-09 08:19:22', '2023-09-09 05:19:22', '2023-09-09 05:24:04'),
(5, 1, 0, '2023-09-09 08:20:11', '2023-09-09 05:20:11', '2023-09-09 05:24:06'),
(6, 1, 0, '2023-09-09 08:20:31', '2023-09-09 05:20:31', '2023-09-09 05:24:07'),
(7, 1, 0, '2023-09-09 08:22:19', '2023-09-09 05:22:19', '2023-09-09 05:24:39'),
(8, 1, 0, '2023-09-09 08:22:27', '2023-09-09 05:22:27', '2023-09-09 05:24:17'),
(9, 1, 0, '2023-09-09 08:22:58', '2023-09-09 05:22:58', '2023-09-09 05:24:18'),
(10, 1, 0, '2023-09-09 08:23:01', '2023-09-09 05:23:01', '2023-09-09 05:24:19'),
(11, 1, 0, '2023-09-09 08:23:11', '2023-09-09 05:23:11', '2023-09-09 05:24:22'),
(12, 1, 0, '2023-09-09 08:23:14', '2023-09-09 05:23:14', '2023-09-09 05:24:21'),
(13, 1, 0, '2023-09-09 08:23:19', '2023-09-09 05:23:19', '2023-09-09 05:24:25'),
(14, 1, 0, '2023-09-09 08:23:22', '2023-09-09 05:23:22', '2023-09-09 05:24:28'),
(15, 1, 0, '2023-09-09 08:23:49', '2023-09-09 05:23:49', '2023-09-09 05:24:27'),
(16, 1, 0, '2023-09-09 08:23:51', '2023-09-09 05:23:51', '2023-09-09 05:24:36'),
(17, 1, 0, '2023-09-09 08:33:44', '2023-09-09 05:33:44', '2023-09-09 06:40:35'),
(18, 1, 0, '2023-09-09 08:33:45', '2023-09-09 05:33:45', '2023-09-09 06:40:38'),
(19, 1, 0, '2023-09-09 08:33:57', '2023-09-09 05:33:57', '2023-09-09 06:40:39'),
(20, 1, 0, '2023-09-09 08:33:58', '2023-09-09 05:33:58', '2023-09-09 06:40:40'),
(21, 1, 0, '2023-09-09 08:38:21', '2023-09-09 05:38:21', '2023-09-09 06:40:41'),
(22, 1, 0, '2023-09-09 09:40:20', '2023-09-09 06:40:20', '2023-09-09 06:40:42'),
(23, 1, 0, '2023-09-09 09:40:25', '2023-09-09 06:40:25', '2023-09-09 06:40:43'),
(24, 1, 0, '2023-09-09 09:40:51', '2023-09-09 06:40:51', '2023-09-11 07:13:49'),
(25, 1, 0, '2023-09-09 09:40:52', '2023-09-09 06:40:52', '2023-09-11 07:13:50'),
(26, 1, 0, '2023-09-09 09:44:00', '2023-09-09 06:44:00', '2023-09-11 07:13:52'),
(27, 1, 4400, '2023-09-11 10:13:33', '2023-09-11 07:13:33', '2023-09-11 07:13:59');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\User', 2, 'register_token', 'a85251f923e8f106fd47c040b13186bde9368c8932366938eca00fcffe304267', '[\"*\"]', NULL, NULL, '2023-09-08 16:36:40', '2023-09-08 16:36:40'),
(10, 'App\\Models\\User', 4, 'register_token', '2239febcc88260ba766ce4dee0d4433303fe671fda5c4fbdda7be94328c38bc7', '[\"*\"]', NULL, NULL, '2023-09-08 18:08:07', '2023-09-08 18:08:07'),
(18, 'App\\Models\\User', 5, 'register_token', '6ebed4fd25f2a3d4fdaf3bf87a9f1bbbaeb2fd42706b59dd7d9b5ea4feed7076', '[\"*\"]', '2023-09-08 19:15:17', NULL, '2023-09-08 19:15:10', '2023-09-08 19:15:17');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `cat_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `image`, `price`, `cat_id`, `created_at`, `updated_at`) VALUES
(1, 'car1', 'biyglygygluh', 'car1', 2200, 1, NULL, NULL),
(2, 'car2', 'bkhdlihgsildhligjer', 'car2', 3300, 1, NULL, NULL),
(3, 'samsung', ';udshkuhfkjhsdku', 'sam', 500, 2, NULL, NULL),
(4, 'xiaomi', 'sjdihjf;lisjkjvf', 'xiom', 350, 2, NULL, NULL),
(10, 'مجموعة طناجر', 'تيفال', 'home1', 1000, 3, '2023-09-10 10:30:01', NULL),
(11, 'ممسحة ارضيات', 'منزلي', 'home2', 350, 3, NULL, NULL),
(12, 'ادوات تمرين', 'رياضة', 'sport1', 800, 4, NULL, NULL),
(13, 'جهاز رياضي متكامل', 'رياضة', 'sport2', 2500, 4, NULL, NULL),
(14, 'beauty set', 'beauty', 'beauty1', 150, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products_orders`
--

CREATE TABLE `products_orders` (
  `id` bigint UNSIGNED NOT NULL,
  `product` bigint NOT NULL,
  `order` bigint NOT NULL,
  `qty` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_orders`
--

INSERT INTO `products_orders` (`id`, `product`, `order`, `qty`, `created_at`, `updated_at`) VALUES
(29, 1, 27, 2, '2023-09-11 07:13:33', '2023-09-11 07:13:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ahmad h', 'hhhhh@gmail.com', NULL, '$2y$10$l4GsNiyyIklEygVKgUkPre2VJ8/MzEqd0VRF4iJUBVltEs8dQQNy6', NULL, '2023-09-08 10:57:15', '2023-09-08 10:57:15'),
(2, 'Ahmad h', 'a@gmail.com', NULL, '$2y$10$X.tDMlL/S97JvX4ewDz0VOarD7iX6OCG.2BQH3k10Qwr1Ypg4XUaa', NULL, '2023-09-08 16:36:40', '2023-09-08 16:36:40'),
(3, 'adsd', 'ddddd@gmail.com', NULL, '$2y$10$X7nVlZDVOwrYOVzOxTHcEOn.okpV2N/gGuE0EWZgXMXrNDgyKycWW', NULL, '2023-09-08 17:57:11', '2023-09-08 17:57:11'),
(4, 'abd', 'xxx@gmail.com', NULL, '$2y$10$3/BNVtSnXpFkkALaDUG2mu/I4K5UOfDDgJWTI12rN7CScWftTGrCa', NULL, '2023-09-08 18:07:56', '2023-09-08 18:07:56'),
(5, 'ali', 'ali@gg.com', NULL, '$2y$10$fyjAaFxm072iXFhMtJAtq.n12YVcYIF7IeLiALc5VGVy/xBCTX.E2', NULL, '2023-09-08 19:14:56', '2023-09-08 19:14:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_orders`
--
ALTER TABLE `products_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products_orders`
--
ALTER TABLE `products_orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
