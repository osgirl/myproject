-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 27, 2018 at 09:29 PM
-- Server version: 10.0.35-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aaz`
--

-- --------------------------------------------------------

--
-- Table structure for table `accidents`
--

CREATE TABLE `accidents` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `issue` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `attender_contact` varchar(255) DEFAULT NULL,
  `attender_numberplate` varchar(255) DEFAULT NULL,
  `estimated_time` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accidents`
--

INSERT INTO `accidents` (`id`, `username`, `longitude`, `latitude`, `issue`, `status`, `attender_contact`, `attender_numberplate`, `estimated_time`, `created_at`, `updated_at`) VALUES
(1, 'haya', '1', '0', '', '', NULL, NULL, NULL, '2018-10-27 14:06:26', '0000-00-00 00:00:00'),
(2, 'wmoswa@g.com', '0.0', '0.0', '', 'attending', '0771407147', '202020', '12', '2018-10-27 15:11:31', '2018-10-27 19:11:31'),
(4, 'wmoswa@g.com', '29.764880741013815', '-19.430801018561166', '', '', NULL, NULL, NULL, '2018-10-27 14:06:26', '0000-00-00 00:00:00'),
(5, 'wmoswa@g.com', '29.764903442885224', '-19.43075990540023', 'hio', 'pending', NULL, NULL, NULL, '2018-10-27 15:20:47', '0000-00-00 00:00:00'),
(6, 'haya', '1', '0', '', '', NULL, NULL, NULL, '2018-10-27 14:06:26', '0000-00-00 00:00:00'),
(7, 'wmoswa@g.com', '29.764788145995357', '-19.43069122293723', '', '', NULL, NULL, NULL, '2018-10-27 14:06:26', '0000-00-00 00:00:00'),
(8, 'wmoswa@g.com', '29.76479833425447', '-19.430831317294924', 'Third Party', '', NULL, NULL, NULL, '2018-10-27 14:06:26', '0000-00-00 00:00:00'),
(10, 'wmoswa@g.com', '29.764952428719074', '-19.430845853210943', 'Third Party', 'closed', '0771407147', '202020', '67', '2018-10-27 15:15:28', '2018-10-27 19:15:28'),
(11, 'wmoswa@g.com', '29.76490792962166', '-19.430742895189123', 'Full cover', 'closed', NULL, NULL, NULL, '2018-10-27 14:21:28', '2018-10-27 18:21:28');

-- --------------------------------------------------------

--
-- Table structure for table `adverts`
--

CREATE TABLE `adverts` (
  `id` int(10) UNSIGNED NOT NULL,
  `about` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startTime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endTime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `android_users`
--

CREATE TABLE `android_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phonenumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `security` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `android_users`
--

INSERT INTO `android_users` (`id`, `name`, `surname`, `phonenumber`, `username`, `password`, `security`, `created_at`, `updated_at`) VALUES
(1, 'Webster', 'Moswa', '0771407147', 'wmoswa@g.com', '123456', 'haya', '2018-10-07 20:36:36', '2018-10-07 20:36:36'),
(25, 'Timmy', 'Moswa', '0771407147', 'swimoz', '123456', '', '2018-10-12 20:14:37', '2018-10-12 20:14:37'),
(27, 'ma1', 'ma1', '263771407147', 'ma1', '1', '', '2018-10-12 20:21:25', '2018-10-12 20:21:25'),
(28, 'ma1', 'ma1', '263771407147', 'ma1', '1', '', '2018-10-12 20:21:25', '2018-10-12 20:21:25');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(3, 'Bar'),
(4, 'Cafe'),
(5, 'Fast Food'),
(6, 'Hotel'),
(7, 'Outdoor Place'),
(8, 'Restaurant'),
(9, 'Sporting Activities'),
(10, 'SuperMarket'),
(11, 'Wedding Venue');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `posts_id` int(11) NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `posts_id`, `user_name`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(8, 1, 'Webster Moswa', 'wmoswa', 'kkkk', '2018-10-09 04:52:59', '2018-10-09 04:52:59'),
(9, 1, 'Webster Moswa', 'wmoswa', 'uripikpowe', '2018-10-09 04:53:39', '2018-10-09 04:53:39'),
(10, 1, 'Webster Moswa', 'wmoswa', 'haha', '2018-10-09 04:54:17', '2018-10-09 04:54:17'),
(11, 2, 'Webster Moswa', 'wmoswa', 'ah kkkk', '2018-10-09 05:11:49', '2018-10-09 05:11:49'),
(12, 2, 'Webster Moswa', 'wmoswa', 'wakadziya', '2018-10-09 05:12:08', '2018-10-09 05:12:08'),
(13, 2, 'Webster Moswa', 'wmoswa', 'mmm ndanenzara', '2018-10-09 05:12:43', '2018-10-09 05:12:43'),
(14, 2, 'Webster Moswa', 'wmoswa', 'derf', '2018-10-09 05:13:55', '2018-10-09 05:13:55'),
(15, 1, 'Webster Moswa', 'wmoswa', 'ygthyg', '2018-10-09 22:26:54', '2018-10-09 22:26:54'),
(16, 7, 'Webster Moswa', 'wmoswa', 'kkk kwakaipa', '2018-10-12 01:15:00', '2018-10-12 01:15:00'),
(17, 9, 'Webster Moswa', 'wmoswa', 'kkk kwakaipa', '2018-10-12 01:15:00', '2018-10-12 01:15:00'),
(18, 9, 'Big Apple', '5', 'web is the best among them all', '2018-10-12 05:28:09', '2018-10-12 05:28:09'),
(19, 9, 'Big Apple', 'bigapple', 'kkkkkkkkkkkkk', '2018-10-12 05:29:16', '2018-10-12 05:29:16'),
(20, 9, 'Big Apple', 'bigapple', 'arikutii', '2018-10-12 05:41:46', '2018-10-12 05:41:46'),
(21, 8, 'Big Apple', 'bigapple', 'ah', '2018-10-12 05:44:44', '2018-10-12 05:44:44'),
(22, 8, 'Big Apple', 'bigapple', 'yeah unoCoder  mfana', '2018-10-12 05:48:57', '2018-10-12 05:48:57'),
(23, 8, 'Big Apple', 'bigapple', 'ah kkk urisei', '2018-10-12 06:00:33', '2018-10-12 06:00:33'),
(24, 6, 'Webster Moswa', 'wmoswa', 'kkk ma1', '2018-10-12 21:13:31', '2018-10-12 21:13:31'),
(25, 6, 'Webster Moswa', 'wmoswa', 'ffvf', '2018-10-12 21:13:52', '2018-10-12 21:13:52'),
(26, 6, 'Webster Moswa', 'wmoswa', 'fhfg', '2018-10-12 21:13:55', '2018-10-12 21:13:55'),
(27, 7, 'Webster Moswa', 'wmoswa', 'eeeee', '2018-10-12 21:14:03', '2018-10-12 21:14:03'),
(28, 8, 'Webster Moswa', 'wmoswa', 'asef', '2018-10-12 21:23:23', '2018-10-12 21:23:23'),
(29, 8, 'Webster Moswa', 'wmoswa', 'fggbbh', '2018-10-12 21:31:08', '2018-10-12 21:31:08'),
(30, 8, 'Big Apple', 'bigapple', 'kkk pakaipa', '2018-10-12 21:33:17', '2018-10-12 21:33:17'),
(31, 8, 'Webster Moswa', 'wmoswa', 'urip', '2018-10-12 21:34:09', '2018-10-12 21:34:09'),
(32, 8, 'Big Apple', 'bigapple', 'pabigAppke huya', '2018-10-12 21:34:31', '2018-10-12 21:34:31'),
(33, 10, 'Webster Moswa', 'wmoswa', 'ndrikuyako', '2018-10-12 22:29:09', '2018-10-12 22:29:09'),
(34, 10, 'Big Sheff', 'bigsheff', '$2', '2018-10-12 22:29:42', '2018-10-12 22:29:42');

-- --------------------------------------------------------

--
-- Table structure for table `lc`
--

CREATE TABLE `lc` (
  `lc` varchar(255) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lc`
--

INSERT INTO `lc` (`lc`, `id`) VALUES
('R tes20752 K) TX Bytes:10149 (9.9 Kb)\nh:/home/wmoswa', 1),
('lo 500 ml 9% ofy', 2);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_08_22_030624_create_adverts_table', 1),
(4, '2018_08_22_030736_create_comments_table', 1),
(5, '2018_08_30_015634_create_posts_table', 1),
(6, '2018_10_04_011908_create_table_post_likes', 1),
(7, '2018_10_07_162625_create_android_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_local` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `likes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `company_name`, `post`, `img_url`, `img_local`, `comments`, `category`, `company_id`, `created_at`, `updated_at`, `likes`) VALUES
(6, 'Big Apple', 'hjklll', 'http://192.168.43.59/ku/images/posts/image001.jpg', 'images/posts/image001.jpg', NULL, 'Bar', '', '2018-10-12 00:29:24', '2018-10-12 00:29:24', NULL),
(7, 'Big Apple', 'This friday we are clubbing to the fullest', 'http://192.168.43.59/ku/images/posts/ab.jpg', 'images/posts/ab.jpg', NULL, 'Bar', '', '2018-10-12 00:32:06', '2018-10-12 00:32:06', NULL),
(8, 'Big Apple', 'kkkk chakaipa', 'http://192.168.43.59/ku/images/posts/pf2.jpg', 'images/posts/pf2.jpg', NULL, 'Bar', '5', '2018-10-12 00:38:03', '2018-10-12 00:38:03', NULL),
(9, 'Big Apple', 'beer free, hayaa', 'http://192.168.43.59/ku/images/posts/fg4.jpg', 'images/posts/fg4.jpg', NULL, 'Bar', '5', '2018-10-12 00:46:39', '2018-10-12 00:46:39', NULL),
(10, 'Big Sheff', 'Free beer this weekend', 'http://192.168.43.59/ku/images/posts/team3.jpg', 'images/posts/team3.jpg', NULL, 'Bar', '6', '2018-10-12 22:26:26', '2018-10-12 22:26:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE `post_likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resolvers`
--

CREATE TABLE `resolvers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `numberplate` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resolvers`
--

INSERT INTO `resolvers` (`id`, `name`, `contact`, `numberplate`, `created_at`, `updated_at`) VALUES
(2, 'Tindo', '0771407147', '202020', '2018-10-27 18:52:57', '2018-10-27 18:52:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_local` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `company_name`, `email`, `company_address`, `tel`, `website`, `logo`, `logo_local`, `company_type`, `rating`, `username`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'AAZ', 'aaz@gmail.com', '1234 Rotten Row', '26342456', 'aaz.co.zw', 'http://localhost/aaz/public/images/logos/aaz.jpg', 'public/images/logos/aaz.jpg', 'cafe', 5, 'aaz', '$2y$10$75ZFBNecDADuJxVCA13mIuexslZ0nrw8xLKKp5317AGfKuWWYTUUa', 'qjhCPMEht9fqKBGWjCiTfU3HPq8eDov2ZG9NYYzwWHGnFWHqWuK1Ho7gfF3O', '2018-10-07 22:34:27', '2018-10-07 22:34:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accidents`
--
ALTER TABLE `accidents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adverts`
--
ALTER TABLE `adverts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `android_users`
--
ALTER TABLE `android_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lc`
--
ALTER TABLE `lc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resolvers`
--
ALTER TABLE `resolvers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accidents`
--
ALTER TABLE `accidents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `adverts`
--
ALTER TABLE `adverts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `android_users`
--
ALTER TABLE `android_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `lc`
--
ALTER TABLE `lc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resolvers`
--
ALTER TABLE `resolvers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
