-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2024 at 09:18 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_number` varchar(255) NOT NULL,
  `street_number` varchar(255) NOT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `unit_number`, `street_number`, `address_line1`, `address_line2`, `city`, `state`, `user_id`, `country_id`, `created_at`, `updated_at`) VALUES
(1, 'gfs', 'ihhn', 'ut', 'cdf', 'bc', 'ert', 4, 6, '2024-01-19 03:26:42', '2024-02-01 03:08:50'),
(2, '5', 'ijuiii', 'qwert kj', 'ertyu k', 'huhs iu', 'jfdc', 10, 4, '2024-02-04 18:29:45', '2024-02-04 18:29:45'),
(3, 'gjj', 'hdfy', 'jjh', 'hgj', 'Nasr city', 'Cairo', 11, 6, '2024-02-04 19:14:11', '2024-02-04 19:14:11');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(9, 4, '2023-10-25 11:23:51', '2023-10-25 11:23:51'),
(10, 10, '2024-02-04 18:13:51', '2024-02-04 18:13:51'),
(11, 11, '2024-02-04 19:05:46', '2024-02-04 19:05:46');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `product_color_size_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `quantity`, `price`, `cart_id`, `product_color_size_id`, `created_at`, `updated_at`) VALUES
(61, 2, 5080, 9, 315, '2024-02-11 04:22:40', '2024-02-11 04:22:40'),
(62, 1, 1094, 9, 275, '2024-02-11 04:23:03', '2024-02-11 04:23:03');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'MEN', '2023-10-05 12:16:47', '2023-10-05 12:16:47'),
(2, 'WOMAN', '2023-10-05 12:18:00', '2023-10-05 12:18:00'),
(3, 'KIDS', '2023-10-05 12:19:19', '2023-10-05 12:19:19'),
(4, 'ACCESSORIES', '2023-10-05 12:19:48', '2023-10-05 12:19:48'),
(5, 'BAGS', '2023-10-05 12:20:16', '2023-10-05 12:20:16'),
(6, 'MACKUP', '2023-10-11 12:31:04', '2023-10-11 12:31:04');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Algeria', '2023-10-07 16:30:02', '2023-10-07 16:30:02'),
(2, 'Belgium', '2023-10-07 16:30:43', '2023-10-07 16:30:43'),
(3, 'Bangladesh', '2023-10-07 16:30:54', '2023-10-07 16:30:54'),
(4, 'Bolivia', '2023-10-07 16:31:09', '2023-10-07 16:31:09'),
(5, 'Australia', '2023-10-07 16:31:38', '2023-10-07 16:31:38'),
(6, 'Egypt', '2023-10-07 16:31:53', '2023-10-07 16:31:53'),
(7, 'Brazil', '2023-10-07 16:32:23', '2023-10-07 16:32:23'),
(9, 'South Korea', '2023-10-07 16:34:54', '2023-10-07 16:34:54'),
(10, 'Morocco', '2023-10-07 16:38:34', '2023-10-07 16:38:34'),
(11, 'Iraq', '2023-10-07 16:38:58', '2023-10-07 16:38:58'),
(12, 'Spain', '2023-10-07 16:39:41', '2023-10-07 16:39:41'),
(13, 'Turkey', '2023-10-07 16:40:21', '2023-10-07 16:40:21'),
(14, 'Iceland', '2023-10-07 16:41:28', '2023-10-07 16:41:28');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_04_111845_create_otps_table', 1),
(6, '2023_10_04_111953_create_countries_table', 1),
(7, '2023_10_04_112228_create_categories_table', 1),
(8, '2023_10_04_112644_create_sub_categories_table', 2),
(9, '2023_10_05_074505_create_addresses_table', 2),
(10, '2023_10_05_075659_create_products_table', 2),
(11, '2023_10_05_080458_create_product_colors_table', 2),
(12, '2023_10_05_080747_create_product_sizes_table', 2),
(13, '2023_10_05_080839_create_product_color_sizes_table', 2),
(14, '2023_10_05_091816_create_carts_table', 2),
(15, '2023_10_05_093649_create_cart_items_table', 2),
(16, '2023_10_05_094736_create_reviews_table', 2),
(17, '2023_10_05_100352_create_orders_table', 2),
(18, '2023_10_07_191612_add_relationship_column_to_users', 3),
(19, '2023_11_07_004301_create_wishlists_table', 4),
(20, '2023_11_15_150102_drop_foreign_key_from_reviews_table', 5),
(21, '2023_11_15_150738_drop_foreign_key_from_reviews_table', 6),
(22, '2023_11_15_151606_add_relationship_to_table', 7),
(23, '2023_12_26_200736_create_visitors_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_code` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `sub_total` decimal(8,2) NOT NULL,
  `discount` int(11) NOT NULL,
  `tax` int(11) NOT NULL,
  `shipping` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` enum('Pending','Processing','Shipped','Delivered') NOT NULL DEFAULT 'Pending',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `email`, `phone`, `sub_total`, `discount`, `tax`, `shipping`, `total`, `quantity`, `status`, `user_id`, `address_id`, `created_at`, `updated_at`) VALUES
(8, '#jF8rN8', 'am@m.com', '01030447681', 8557.00, 25, 856, 150.00, 7423.45, 5, 'Processing', 4, 1, '2024-01-19 05:25:07', '2024-01-19 05:25:07'),
(9, '#MkRT3v', 'am@m.com', '01030447681', 4169.00, 10, 417, 150.00, 4319.00, 4, 'Processing', 4, 1, '2024-01-19 23:24:21', '2024-01-19 23:24:21'),
(10, '#AfXVbR', 'pop@gmail.com', '01030447688', 736.00, 20, 500, 158.00, 1246.80, 2, 'Shipped', 4, 1, '2024-01-20 00:59:50', '2024-01-24 12:04:51'),
(11, '#lGawPo', 'pop@gmail.com', '01030447681', 438.00, 5, 44, 150.00, 609.90, 1, 'Processing', 4, 1, '2024-01-26 15:52:10', '2024-01-26 15:52:10'),
(12, '#9rGRSI', 'a@a.com', '01020447854', 2066.00, 10, 207, 150.00, 2216.00, 4, 'Processing', 4, 1, '2024-01-30 12:33:07', '2024-01-30 12:33:07'),
(13, '#drPmAw', 'er@we.com', '010527744832', 1798.00, 10, 180, 150.00, 1948.00, 3, 'Processing', 4, 1, '2024-01-30 12:44:36', '2024-01-30 12:44:36'),
(16, '#kWkuoZ', 'am@m.com', '1234578910', 142.00, 5, 14, 150.00, 299.10, 1, 'Processing', 4, 1, '2024-01-30 12:48:35', '2024-01-30 12:48:35'),
(19, '#vcW8dA', 'mm@moh.com', '01245783484', 1300.00, 10, 130, 150.00, 1450.00, 2, 'Processing', 4, 1, '2024-01-30 20:19:40', '2024-01-30 20:19:40'),
(20, '#ytaiGW', 'fatenelmarzouki463@gmail.com', '01030447681', 665.00, 5, 67, 150.00, 848.25, 1, 'Processing', 4, 1, '2024-02-01 03:04:44', '2024-02-01 03:04:44'),
(21, '#32e1cl', 'fatenelmarzouki463@gmail.com', '01804476811', 283.00, 10, 28, 150.00, 433.00, 2, 'Processing', 4, 1, '2024-02-01 03:08:50', '2024-02-01 03:08:50'),
(22, '#7UGMdl', 'ahlam.elmarzouki@gmail.com', '0109277987', 1751.00, 10, 175, 150.00, 1901.00, 4, 'Processing', 10, 2, '2024-02-04 18:29:45', '2024-02-04 18:29:45'),
(23, '#AVStHR', 'amiraelmarzouki2021@gmail.com', '01202256658', 10501.00, 25, 1050, 150.00, 9075.85, 14, 'Processing', 11, 3, '2024-02-04 19:14:11', '2024-02-04 19:14:11');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_color_size_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_color_size_id`, `quantity`, `created_at`, `updated_at`) VALUES
(11, 8, 313, 0, '2024-01-19 05:25:07', '2024-01-19 05:25:07'),
(12, 8, 295, 0, '2024-01-19 05:25:07', '2024-01-19 05:25:07'),
(13, 8, 299, 0, '2024-01-19 05:25:07', '2024-01-19 05:25:07'),
(14, 9, 301, 0, '2024-01-19 23:24:22', '2024-01-19 23:24:22'),
(15, 9, 299, 0, '2024-01-19 23:24:22', '2024-01-19 23:24:22'),
(16, 9, 297, 0, '2024-01-19 23:24:23', '2024-01-19 23:24:23'),
(17, 9, 53, 0, '2024-01-19 23:24:23', '2024-01-19 23:24:23'),
(18, 10, 53, 0, '2024-01-20 00:59:51', '2024-01-20 00:59:51'),
(19, 11, 397, 1, '2024-01-26 15:52:10', '2024-01-26 15:52:10'),
(20, 12, 157, 2, '2024-01-30 12:33:07', '2024-01-30 12:33:07'),
(21, 12, 299, 2, '2024-01-30 12:33:08', '2024-01-30 12:33:08'),
(22, 13, 120, 2, '2024-01-30 12:44:36', '2024-01-30 12:44:36'),
(23, 13, 200, 1, '2024-01-30 12:44:37', '2024-01-30 12:44:37'),
(24, 16, 110, 1, '2024-01-30 12:48:35', '2024-01-30 12:48:35'),
(28, 19, 162, 1, '2024-01-30 20:19:40', '2024-01-30 20:19:40'),
(29, 19, 371, 1, '2024-01-30 20:19:40', '2024-01-30 20:19:40'),
(30, 20, 146, 1, '2024-02-01 03:04:44', '2024-02-01 03:04:44'),
(31, 21, 110, 2, '2024-02-01 03:08:51', '2024-02-01 03:08:51'),
(32, 22, 297, 1, '2024-02-04 18:29:45', '2024-02-04 18:29:45'),
(33, 22, 80, 3, '2024-02-04 18:29:45', '2024-02-04 18:29:45'),
(34, 23, 406, 1, '2024-02-04 19:14:11', '2024-02-04 19:14:11'),
(35, 23, 292, 1, '2024-02-04 19:14:12', '2024-02-04 19:14:12'),
(36, 23, 299, 2, '2024-02-04 19:14:12', '2024-02-04 19:14:12'),
(37, 23, 399, 1, '2024-02-04 19:14:12', '2024-02-04 19:14:12'),
(38, 23, 305, 1, '2024-02-04 19:14:13', '2024-02-04 19:14:13'),
(39, 23, 257, 1, '2024-02-04 19:14:13', '2024-02-04 19:14:13'),
(40, 23, 271, 1, '2024-02-04 19:14:13', '2024-02-04 19:14:13'),
(41, 23, 280, 2, '2024-02-04 19:14:13', '2024-02-04 19:14:13'),
(42, 23, 289, 3, '2024-02-04 19:14:13', '2024-02-04 19:14:13'),
(43, 23, 373, 1, '2024-02-04 19:14:13', '2024-02-04 19:14:13');

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `otps`
--

INSERT INTO `otps` (`id`, `email`, `otp`, `created_at`, `updated_at`) VALUES
(1, 'fatenelmarzouki463@gmail.com', '9971049', '2023-10-10 09:19:04', '2023-10-10 09:19:04'),
(2, 'pop@gmail.com', '1401464', '2023-12-26 19:18:57', '2023-12-26 19:18:57'),
(3, 'mo@gmail.com', '3372429', '2024-01-14 18:49:59', '2024-01-14 18:49:59'),
(4, 'fatenelmarzouki4634@gmail.com', '5778382', '2024-01-14 18:53:55', '2024-01-14 18:53:55'),
(5, 'ahlam.elmarzouki@gmail.com', '7785338', '2024-02-04 17:54:43', '2024-02-04 17:54:43'),
(6, 'amiraelmarzouki2021@gmail.com', '6515499', '2024-02-04 18:56:51', '2024-02-04 18:56:51');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `main_price` decimal(8,2) NOT NULL,
  `main_discount` int(11) DEFAULT NULL,
  `product_code` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('show','hide') NOT NULL DEFAULT 'show',
  `delete_status` enum('Yes','No') NOT NULL DEFAULT 'No',
  `sub_category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `main_price`, `main_discount`, `product_code`, `image`, `status`, `delete_status`, `sub_category_id`, `created_at`, `updated_at`) VALUES
(8, 'Kongo Jacket', 350.00, 7, 'NswIgZ', 'Product/Gu2r5QGECYFychN0IHNjb7lbU2KirDzpKqvMsSp4.png', 'show', 'Yes', 1, '2023-10-12 09:02:56', '2024-02-13 09:02:56'),
(9, 'Tikal Jacket', 470.00, 7, 'dUbBas', 'Product/RR0dZp4VZMuByb3udfHKjZBwR7vlrIzUAHAkXURQ.png', 'show', 'Yes', 1, '2023-10-12 09:06:01', '2023-10-12 09:06:01'),
(10, 'Ikal Jacket', 478.32, 7, 'YM9bUk', 'Product/UyjTjB3J6bmP9EWHVwMY9YoJmKYRrKjo4TLeCXKq.png', 'show', 'No', 1, '2023-10-12 09:09:15', '2023-10-12 09:09:15'),
(11, 'Malakhi Jacket', 712.30, 7, 'AYpw7r', 'Product/CPP4bkXtZHBJXpVlOZGWre5pXc2D7JBByE9X5fAj.png', 'show', 'No', 1, '2023-10-12 09:11:34', '2023-10-12 09:11:34'),
(12, 'Odion jacket', 421.36, 7, 'U1i43q', 'Product/OJkeMH7LmZST2GdyTgIoUcmjZb6KL0dtpdf1H8N6.png', 'show', 'Yes', 1, '2023-10-12 09:12:56', '2023-10-12 09:12:56'),
(13, 'Renio Jacket', 547.38, 7, 'AyTASA', 'Product/hBgGfRz1TPOzTojrp3RYTmVJpwDleMYwamXo4uKv.png', 'show', 'No', 1, '2023-10-12 09:16:56', '2023-10-12 09:16:56'),
(14, 'Kabil Jacket', 329.36, 7, '1o2JEn', 'Product/RzCseZeXSmJHq3GpxFVi2ZMZyJCbcFulRf8AoUpb.png', 'show', 'No', 1, '2023-10-12 09:21:35', '2023-10-12 09:21:35'),
(15, 'Kasakir Pants', 405.37, 5, 'ziFFcc', 'Product/kOZ2HMUhbkkoeLVDh09picbBjX5uLbnJA9AfqWiX.png', 'show', 'No', 2, '2023-10-12 09:29:15', '2023-10-12 09:29:15'),
(16, 'Mao Pants', 508.58, 5, 'gz1lKp', 'Product/koyZLT8wMV5poqlK3DWCVSHOaaNiCZUbFtscos8N.png', 'show', 'No', 2, '2023-10-12 09:38:24', '2023-10-12 09:38:24'),
(17, 'Muguji Pants', 407.34, 5, '3DhOpw', 'Product/n63Qc6xgjydRtbMVBNBzfA6xcH14IVXYSSDCEfR0.png', 'show', 'No', 2, '2023-10-12 09:41:18', '2023-10-12 09:41:18'),
(18, 'Odion Pants', 357.47, 5, '8OJdSk', 'Product/9U6XsW5C9LmhXxcPc9or6EtyodT6ffqi8h6GvQ0o.png', 'show', 'No', 2, '2023-10-12 09:44:26', '2023-10-12 09:44:26'),
(19, 'Paavo Pants', 478.25, 5, '5D4LQD', 'Product/nquIgrLuwXO1nwkNQjWGiPHdShBbR3Q4MqRgz2qc.png', 'show', 'No', 2, '2023-10-12 09:49:02', '2023-10-12 09:49:02'),
(20, 'Rahui Pants', 495.25, 5, 'vm9ngJ', 'Product/ECQiivRGKYoxaNGnedhWArnb9BEUtg7Hc40gk3CE.png', 'show', 'No', 2, '2023-10-12 09:51:51', '2023-10-12 09:51:51'),
(21, 'Semeel Comfit Pants', 398.99, 5, 'cJVBDm', 'Product/c46UVDEeiAOoLX4D4pUziCuGuG7RBDmLet2grfEI.png', 'show', 'No', 2, '2023-10-12 09:56:19', '2023-10-12 09:56:19'),
(22, 'Tribe Pants', 547.25, 5, 'I6AodK', 'Product/HWtCGSc5iDzprY0knEpO1x3ZB9mYgxPfznbfJko2.png', 'show', 'No', 2, '2023-10-12 09:59:32', '2023-10-12 09:59:32'),
(23, 'Bakari Shorts', 678.43, 10, 'h7ERiC', 'Product/PRuEhtCiDalh3Y1JUkzoImJVf7NTK88xGWXcPW7a.png', 'show', 'No', 3, '2023-10-12 10:05:20', '2023-10-12 10:05:20'),
(24, 'Tanok Bermuda Shorts', 725.38, 10, '5Sfd5N', 'Product/5xYQ62YiQcYFtdC9qK8hjdCX9kHAF4D3gNQQ4vxf.png', 'show', 'No', 3, '2023-10-12 10:09:06', '2023-10-12 10:09:06'),
(25, 'Tupoc Bermuda Shorts', 458.30, 10, 'zF9idm', 'Product/mnBT8tSzflA8JwcYTC68Ov8d72MJvwDAZeQfuSP4.png', 'show', 'No', 3, '2023-10-12 10:11:34', '2023-10-12 10:11:34'),
(26, 'Yooko Shorts', 389.38, 10, 'MG4JXz', 'Product/pRfEg1m6sIckdFvA68l0a92Y4ZRmXdt4dXcQcwYE.png', 'show', 'No', 3, '2023-10-12 10:13:47', '2023-10-12 10:13:47'),
(27, 'Eloy Shirt', 216.95, 7, '8Xbiaq', 'Product/1KMANkFuU4el6fuGBz3WYWXLmsVEHs812WIx0q8u.png', 'show', 'No', 4, '2023-10-12 10:40:05', '2023-10-12 10:40:05'),
(31, 'Kabil Shirt', 210.00, 7, 'ICFUJo', 'Product/5UISaWj3ExdC9kYsdNJYXi9J4A0oibL48GherqVf.png', 'show', 'No', 4, '2023-10-12 10:47:14', '2023-10-12 10:47:14'),
(32, 'Masai Shirt', 350.00, 7, '3RdmUk', 'Product/h8ezpXaNznZ0ktKZeSjoPIhXQAavKCc5nKg4Jzgj.png', 'show', 'No', 4, '2023-10-12 10:53:31', '2023-10-12 10:53:31'),
(33, 'Masawa Shirt', 230.00, 7, 'pmsisR', 'Product/k4DuR22ndX9Y4SFTGQKWiYClXPwHb0NWs3Be00dh.png', 'show', 'No', 4, '2023-10-12 10:55:42', '2023-10-12 10:55:42'),
(34, 'Mayan Shirt', 245.00, 7, 'vHX9gA', 'Product/9hR9QtcU38TKEU94Ryr3FAE4g4x33cGhZLCdVV6Z.png', 'show', 'No', 4, '2023-10-12 10:56:54', '2023-10-12 10:56:54'),
(35, 'Trail Shirt', 286.62, 7, 'CMP1Lo', 'Product/xa2NtKLvHfphTslOHfIlPzQmyvdrbQDDBzYnTzns.png', 'show', 'No', 4, '2023-10-12 10:57:44', '2023-10-12 10:57:44'),
(40, 'Nalini Jacket', 810.00, 14, 'sgOb9P', 'Woman Product/24c2yiHcgwKs3WfeccCEUiwXPdr1Ut9TqcSQet2z.png', 'show', 'No', 5, '2023-10-12 12:17:11', '2023-10-12 12:17:11'),
(41, 'Naran Jacket', 749.00, 14, 'nfX7gj', 'Woman Product/2Gu6KZTb9SdAkCrzslV14IxWkNqSPhfXZwyXnQ4c.png', 'show', 'No', 5, '2023-10-12 12:19:01', '2023-10-12 12:19:01'),
(43, 'Olena Jacket', 712.42, 14, 'CkIFlY', 'Woman Product/KQxd7Ujkarg16kEgWzhgFAvLceZT1e89hIoIx8Ln.png', 'show', 'No', 5, '2023-10-12 12:20:55', '2023-10-12 12:20:55'),
(44, 'Akna Shirt', 524.00, 12, '7amniF', 'Woman Product/aaqoGsw9geORysrvaCRLHVNgbLxLpjdhBphpkFqo.png', 'show', 'No', 7, '2023-10-12 12:30:17', '2023-10-12 12:30:17'),
(45, 'Anami Shirt', 475.24, 12, 'G9900I', 'Woman Product/yVrdQIZf6dmoWOT9H488G7OaDaB3UGoCm6MBhZO5.png', 'show', 'No', 7, '2023-10-12 12:32:35', '2023-10-12 12:32:35'),
(46, 'Nakawe Shirt', 428.35, 12, 'XmOPAO', 'Woman Product/AmNbGB4qIUr48PhThqbNJupFMaKD9ez5QdRMCTvM.png', 'show', 'No', 7, '2023-10-12 12:34:26', '2023-10-12 12:34:26'),
(47, 'Sway Shirt', 345.50, 12, 'PV89Cn', 'Woman Product/jlxMNNsddRMEsQuP4G8c4aTlbPj43HfFayCzdN5D.png', 'show', 'No', 7, '2023-10-12 12:35:56', '2023-10-12 12:35:56'),
(48, 'Mayan Shirt', 457.25, 12, 'HmCePn', 'Woman Product/yOWXAowAFqV9afriNyzLybfFXHGt90iInG6NXdNu.png', 'show', 'No', 7, '2023-10-12 12:39:50', '2023-10-12 12:39:50'),
(49, 'Xandra Shirt', 258.14, 12, 'DWDzSA', 'Woman Product/L2s8KN78sN8dH7TqMJy38oRfziC8qQOOLvhhWjA1.png', 'show', 'No', 7, '2023-10-12 12:42:03', '2023-10-12 12:42:03'),
(50, 'Taj Shirt', 274.14, 12, 'ZHKGY5', 'Woman Product/B6VmwVFDY1IVF9a5LTR3Lsdt60FcazJvsIFpSOvf.png', 'show', 'No', 7, '2023-10-12 12:43:14', '2023-10-12 12:43:14'),
(51, 'Cualli Shirt', 742.20, 12, 'J7cLd1', 'Woman Product/szCIgYhtwtQOf0MteEDhc2IFCmtZlzDm7CvFlmbc.png', 'show', 'No', 7, '2023-10-12 12:44:56', '2023-10-12 12:44:56'),
(52, 'Danaa Shirt', 254.20, 12, 'xpOhsu', 'Woman Product/i6r2OsfmyCLjvEDoKn6XgVgXdjt8daIkBcxycjnu.png', 'show', 'No', 7, '2023-10-12 12:46:12', '2023-10-12 12:46:12'),
(53, 'Anami Capri Pants', 389.38, 8, 'DkIPYP', 'Woman Product/7YvX7VufbpjKX8rc0EdLNa4G7ZMJlBU4dPDO4hMP.png', 'show', 'No', 6, '2023-10-12 12:58:12', '2023-10-12 12:58:12'),
(54, 'Chel Pants', 400.00, 8, 'kw9zF9', 'Woman Product/QMlwpFYIYZKxfe8SQTy6b5ufleA6J1UgYR7gizHW.png', 'show', 'Yes', 6, '2023-10-12 13:02:29', '2024-02-11 03:46:54'),
(55, 'Inda Pants', 400.00, 8, 'heBKss', 'Woman Product/Y8ZBn8RfcSMgFU710iB1ruETJf1ZpI5nQKFWWoNL.png', 'show', 'No', 6, '2023-10-12 13:04:54', '2023-10-12 13:04:54'),
(56, 'Nalini Pants', 415.00, 8, '0AcFyB', 'Woman Product/EjnUTxamgIq8zSTU8w5FqfLjCf7tKQpPSAiSyKsx.png', 'show', 'No', 6, '2023-10-12 13:06:59', '2023-10-12 13:06:59'),
(58, 'Soona Tights Pant', 230.00, 8, 'NZ5YFc', 'Woman Product/JYO4PNRk0UB2iPacebnhi5KGXHbHpMmidl44SZJ0.png', 'show', 'No', 6, '2023-10-12 13:13:07', '2023-10-12 13:13:07'),
(59, 'Sway Pant', 430.00, 8, 'cqWcJI', 'Woman Product/XTELxq3FdT8xICGex7UcdGstGBgZnWq6aUzTi5an.png', 'show', 'No', 6, '2023-10-12 13:14:14', '2023-10-12 13:14:14'),
(60, 'Xandra Pant', 370.00, 8, 'NCOhG6', 'Woman Product/xztvvKqrBa30Yi9NZOxDuYShoqQRiar4ANRyaSAs.png', 'show', 'No', 6, '2023-10-12 13:20:11', '2023-10-12 13:20:11'),
(61, 'Balam Shorts', 270.00, 4, '0elxuE', 'Woman Product/QDdGhuRwU0VqyjsHxP7e6DfMyhaDJdFs0v4HGIKs.png', 'show', 'No', 8, '2023-10-12 13:30:12', '2023-10-12 13:30:12'),
(62, 'Kachina Shorts', 203.50, 4, '8hUhUb', 'Woman Product/5fZnMhcC3dQqK70saZhl5qp0ggTevhP77w7LezMR.png', 'show', 'No', 8, '2023-10-12 13:31:58', '2023-10-12 13:31:58'),
(63, 'Malinali Skirt Shorts', 350.50, 4, 'vS4QEK', 'Woman Product/Zm5duDlR2RYeSUNhVw7NYQuH8MuO0lQp44owgTkK.png', 'show', 'No', 8, '2023-10-12 13:32:45', '2023-10-12 13:32:45'),
(64, 'Nima Bermuda Shorts', 190.62, 4, 'Y0AALT', 'Woman Product/aAtortdQDWecBZwLMsAGLg5AgQ3rFmg3Cl2mQ8RN.png', 'show', 'No', 8, '2023-10-12 13:33:43', '2023-10-12 13:33:43'),
(65, 'Tanok Bermuda Shorts', 230.62, 4, 'z7EjCN', 'Woman Product/tEBIa9whNC1DXe2Um9PMDLGm3wuX9eKX4aEo6aAR.png', 'show', 'No', 8, '2023-10-12 13:35:43', '2023-10-12 13:35:43'),
(67, 'Lancome', 452.21, 5, 'uFVgrH', 'Mackup Product/R6WzEFHip4vxxJ0r0wotFRMY6hb8i5p5hHGWuozv.png', 'show', 'No', 31, '2023-10-12 13:50:45', '2023-10-12 13:50:45'),
(68, 'Stila', 751.00, 5, 'WiG3je', 'Mackup Product/3tIYfWkK8Gy2JoXjMhYO6KkOwXVvVJi6x36iGjxm.png', 'show', 'No', 31, '2023-10-12 13:52:59', '2023-10-12 13:52:59'),
(69, 'Urban Decay', 512.30, 5, 'J9SfAD', 'Mackup Product/Pu5GRdeoZMARi2WAQnwdBCRJd4Py4tnHPFwcMSu5.png', 'show', 'No', 31, '2023-10-12 13:54:10', '2023-10-12 13:54:10'),
(70, 'Rare Beauty by Selena Gomez', 785.42, 5, 'fPc8MZ', 'Mackup Product/G2r4teOyVajxhwtF6WRnErIYgiB5dSZbZ3wv7NsI.png', 'show', 'No', 31, '2023-10-12 13:56:12', '2023-10-12 13:56:12'),
(71, 'Anastasia Beverly Hills', 984.00, 5, 'eQoDb5', 'Mackup Product/ZY1U57CU287BqGBmPMwIhOWGBHzQeFmwxzlvg3xW.png', 'show', 'No', 32, '2023-10-12 14:01:09', '2023-10-12 14:01:09'),
(72, 'Tarte', 857.21, 5, 'Ixigde', 'Mackup Product/6TTxm7xXkF6SKdZ99gBPU3rf6d75sSL54GJIOiE4.png', 'show', 'No', 32, '2023-10-12 14:03:09', '2023-10-12 14:03:09'),
(73, 'PATRICK TA', 422.50, 5, 'plzzdB', 'Mackup Product/UAcqjDYhrNYIOmn4K4zMQcWh3Fx8kpSifAN8bBNn.png', 'show', 'No', 32, '2023-10-12 14:04:43', '2023-10-12 14:04:43'),
(74, 'Stila', 478.14, 5, 'AkeNA6', 'Mackup Product/7rSUcVBZ5zVJOuqV8SQNBhMU1t0pfneJ8GPljseD.png', 'show', 'No', 32, '2023-10-12 14:06:00', '2023-10-12 14:06:00'),
(75, 'Rare Beauty by Selena Gomez', 748.24, 5, 't7wnhV', 'Mackup Product/g128cfYnu98BIMJqa1FiLg2uOAVxXPn1HwuoLo0F.png', 'show', 'No', 32, '2023-10-12 14:08:33', '2023-10-12 14:08:33'),
(76, 'Kaja', 355.21, 5, 'rfVrWM', 'Mackup Product/hVxNLnRbXPHqXWTRPv3QC00qQbIRon0Fd6jxy5yt.png', 'show', 'No', 32, '2023-10-12 14:09:28', '2023-10-12 14:09:28'),
(77, 'MAKEUP BY MARIO', 458.24, 5, 'QlARaQ', 'Mackup Product/Q9koTQX754go6hjJWX8SalP7MAQjC6ypoHds1PpA.png', 'show', 'No', 32, '2023-10-12 14:10:41', '2023-10-12 14:10:41'),
(78, 'Urban Decay', 778.21, 5, 'Nnrm8t', 'Mackup Product/gRza1MOJUYDBx5piTHtBiJLeGWtfUyJJyZwFvC6C.png', 'show', 'No', 32, '2023-10-12 14:11:47', '2023-10-12 14:11:47'),
(79, 'Anastasia Beverly Hills', 475.25, 5, 'P6Evqr', 'Mackup Product/UN7UKrtggIwr7Ph8maGY3Jgx7PsGHG6GzyVPAzB5.png', 'show', 'No', 37, '2023-10-12 14:14:22', '2023-10-12 14:14:22'),
(80, 'Dior', 478.24, 5, 'jd7Jrd', 'Mackup Product/wjH4lYLIaS38UqduhgFbFmAt90tVdCvOoaZr1rlw.png', 'show', 'No', 37, '2023-10-12 14:16:22', '2023-10-12 14:16:22'),
(81, 'Charlotte Tilbury', 247.21, 5, 'YdoCXI', 'Mackup Product/A2EupK2C9NPUnZRPhe12XCP0i0TvBpmb8TIKjB1G.png', 'show', 'No', 37, '2023-10-12 14:18:48', '2023-10-12 14:18:48'),
(82, 'NARS', 345.13, 5, 'NYp9Mo', 'Mackup Product/vJV1omWu3MGNsd1uhMTjPJQspaMEgbDKVEn5xz9t.png', 'show', 'No', 37, '2023-10-12 14:20:00', '2023-10-12 14:20:00'),
(83, 'Yves Saint Laurent', 452.00, 5, 'FtgEDj', 'Mackup Product/NIMruyou9SHvde4Loeb9fXHF92Y9UVM9erbX3dkp.png', 'show', 'No', 37, '2023-10-12 14:21:21', '2023-10-12 14:21:21'),
(84, 'Rare Beauty by Selena Gomez', 475.21, 5, 'COAGD5', 'Mackup Product/BttDo6kbFINhruLpnXmEGeddN4QOBIRQobetmMRr.png', 'show', 'No', 37, '2023-10-12 14:25:45', '2023-10-12 14:25:45'),
(85, 'Charlotte Tilbury', 420.25, 14, 'ERkd0x', 'Mackup Product/fwkkGnXKnsjum9Bdo7Gi1LoXrb152SZtshwZFRxg.png', 'show', 'No', 30, '2023-10-12 14:35:25', '2023-10-12 14:35:25'),
(86, 'Dior', 500.25, 14, 'bNIxAx', 'Mackup Product/7Z6lAPGsC8gNgddRpWCChMBdOxzM3RIXWgYgkJNG.png', 'show', 'No', 30, '2023-10-12 14:36:23', '2023-10-12 14:36:23'),
(87, 'Fenty Beauty', 750.23, 14, 'yOYjG0', 'Mackup Product/ZF582anN1s0fXnrsu6it0LnlqNAoHsji5kX1Tww5.png', 'show', 'No', 30, '2023-10-12 14:37:25', '2023-10-12 14:37:25'),
(88, 'MAKEUP FOR EVER', 578.25, 14, 'TOZKXg', 'Mackup Product/75jGFvSIVH4Hg6ehYMxbra7VSiPGw3FLcajfNbqT.png', 'show', 'No', 30, '2023-10-12 15:52:46', '2023-10-12 15:52:46'),
(89, 'NARS', 872.35, 14, 'eqrNNo', 'Mackup Product/jZCiTaxrhbHEjOX6tZ9R64OUkUN1boFDHEsX226N.png', 'show', 'No', 30, '2023-10-12 15:53:21', '2023-10-12 15:53:21'),
(90, 'Too Faced', 450.62, 14, 'DbdMfy', 'Mackup Product/bBNhcyjsIfQCiLzUMCE6xGXHPX3Vc8hX4BvUA8ol.png', 'show', 'No', 30, '2023-10-12 15:54:20', '2023-10-12 15:54:20'),
(91, 'CLINIQUE', 875.23, 14, 'IUvmhV', 'Mackup Product/WyRuiMKJtkuiVA1w3fUz1aRVJHasVtPY6oqJy3hP.png', 'show', 'No', 33, '2023-10-12 15:55:23', '2023-10-12 15:55:23'),
(92, 'Dr.Jart++', 750.32, 14, 'Q4JT1I', 'Mackup Product/sspwHDMamtxXTPNk88ptRAQcC5G6cnPXpBnA9iaX.png', 'show', 'No', 33, '2023-10-12 15:56:02', '2023-10-12 15:56:02'),
(93, 'IT Cosmetics', 536.23, 14, 'GtEmDr', 'Mackup Product/pu30cliKBBEz8kLjT5J88S7Gbcn2zYNrJB4aeHim.png', 'show', 'No', 33, '2023-10-12 15:57:03', '2023-10-12 15:57:03'),
(94, 'ONE SIZE by Patrick Starr', 783.25, 14, '8Xxi9q', 'Mackup Product/qQuEOlMKf83aPVdPHMm89kzmmX1qWDy60OjqLjAF.png', 'show', 'No', 33, '2023-10-12 15:57:40', '2023-10-12 15:57:40'),
(95, 'Tarte', 893.25, 14, 'a4q9YZ', 'Mackup Product/PNJ90EldnuHq5FWjVa0ksk2aOU05PspJqoGUCQyI.png', 'show', 'No', 33, '2023-10-12 15:58:06', '2023-10-12 15:58:06'),
(96, 'Bobbi Brown', 893.25, 14, 'doTz6Y', 'Mackup Product/j3kvz7Lu8kE0gVZbSZRAPAQcYeXNRmFvjCUyN9GS.png', 'show', 'No', 34, '2023-10-12 15:59:44', '2023-10-12 15:59:44'),
(97, 'Hourglass', 563.25, 14, 'TvRYEk', 'Mackup Product/30NWdqXG9ZBRDcAemCJrzpKnhOQK6RRs3Z213kZk.png', 'show', 'No', 34, '2023-10-12 16:00:22', '2023-10-12 16:00:22'),
(98, 'Rare Beauty Illuminating Primer', 745.28, 14, 'k7TBJU', 'Mackup Product/qTMCopmOvsNCPMZcW6c7dHpHq9Agidba6yRRZeiz.png', 'show', 'No', 34, '2023-10-12 16:01:21', '2023-10-12 16:01:21'),
(99, 'REFY', 369.87, 14, 'BovAKS', 'Mackup Product/gcYCIJbd2ZA3H0tMAe8yYiQ9We1WG1oTmEsKxIPn.png', 'show', 'No', 34, '2023-10-12 16:02:00', '2023-10-12 16:02:00'),
(100, 'The Oridinary', 752.23, 14, 'kQgr6l', 'Mackup Product/1QxLU8a5qSCfjTLT0H9G3Rv7LDvyDT00b1Gz5AIT.png', 'show', 'No', 34, '2023-10-12 16:02:30', '2023-10-12 16:02:30'),
(101, 'Anastasia Beverly Hills', 732.23, 14, 'wVnwnQ', 'Mackup Product/toXEp81GkOFtbGD0I3YhF1lA3HBNk10NXy9PBfq3.png', 'show', 'No', 35, '2023-10-12 16:03:54', '2023-10-12 16:03:54'),
(102, 'Benefit Cosmetics', 872.23, 14, 'jj2geq', 'Mackup Product/FoOC6dZk1J0cXYQP2BKpSm0gahd0tVMO8k3RcXVs.png', 'show', 'No', 35, '2023-10-12 16:04:26', '2023-10-12 16:04:26'),
(103, 'CLINIQUE', 923.50, 14, '5IIylP', 'Mackup Product/1U8hacRicMJZC0fZXggF28a4lj8okhtNES8RtrWe.png', 'show', 'No', 35, '2023-10-12 16:04:55', '2023-10-12 16:04:55'),
(104, 'Lancome', 755.52, 14, 'zX6uTV', 'Mackup Product/z9osMNtRU7AiHzYZ36SMTZFB2R9onBjy4oxdxRgS.png', 'show', 'No', 35, '2023-10-12 16:05:26', '2023-10-12 16:05:26'),
(105, 'Too Faced', 850.50, 14, 'NVamgo', 'Mackup Product/J7OgTalDmyQVbKMekOLg9tINnVrLJwdmcKNF8emy.png', 'show', 'No', 35, '2023-10-12 16:05:59', '2023-10-12 16:05:59'),
(106, 'Dior', 512.50, 14, 'GsZVJX', 'Mackup Product/9X5aZTLEDS7OVCWhWAEzVhk6AuDoSrfBnoyNSwyD.png', 'show', 'No', 36, '2023-10-12 16:06:54', '2023-10-12 16:06:54'),
(107, 'Fenty Beauty', 570.52, 14, 'ieFGJ2', 'Mackup Product/H0yWiqPrapraN5pLdlnXXhNIToo15Yua2Uzj8gUV.png', 'show', 'No', 36, '2023-10-12 16:07:26', '2023-10-12 16:07:26'),
(108, 'Rare Beauty by Selena Gomez', 620.52, 14, 'UPGcKH', 'Mackup Product/XkJtA168NjD4GPiQWMkvymXEjJ7Ve4R6wNddMo1r.png', 'show', 'No', 36, '2023-10-12 16:08:38', '2023-10-12 16:08:38'),
(109, 'Triple Hoop Earrings Gold', 125.24, 5, 'XID0vL', 'Accessories/PMFnlgyg5amleoAfXideMUEn3ILiZ16VEpjaCUKL.png', 'show', 'No', 17, '2023-10-15 15:08:18', '2023-10-15 15:08:18'),
(110, 'Sterling silver sleek pearl drop earrings', 145.00, 5, 'MuakLk', 'Accessories/4NPp3qyE8dFXu6krHY1WzaYMkv7ZVqAPE0EwjDQM.png', 'show', 'No', 17, '2023-10-15 15:10:15', '2023-10-15 15:10:15'),
(111, 'Square-shaped earrings', 149.00, 5, 'qRDdPi', 'Accessories/GBsE5e8Qcpv8L1XUpKsjqHSQzlxCAl7f8fqDQGGR.png', 'show', 'No', 17, '2023-10-15 15:10:50', '2023-10-15 15:10:50'),
(112, 'Solo Diamond Bracelet', 240.00, 5, 'XFM6Tn', 'Accessories/sAO9J1zSFfVyUIQC8Ur90ENmpt8RLfTruJK2Ddhc.png', 'show', 'No', 17, '2023-10-15 15:11:21', '2023-10-15 15:11:21'),
(113, 'Pave linked circle short drop earrings gold', 147.00, 5, 's9mLGB', 'Accessories/08kNPSdCZnyEtU727A7U7DcdNm8gJbiwpzWjJ10i.png', 'show', 'No', 17, '2023-10-15 15:12:26', '2023-10-15 15:12:26'),
(114, 'Earrings', 325.00, 5, 'dSd1xa', 'Accessories/Pdr5LG3b9mgAuOLgSSIyjFL6aKbT3Bdg18dOWWG8.png', 'show', 'No', 17, '2023-10-15 15:12:55', '2023-10-15 15:12:55'),
(115, 'Long earrings', 314.00, 5, 'R2Lt9C', 'Accessories/bVjCgb9dMYqud1FKpFVtGUoBNNl9Evp6nJgweDy0.png', 'show', 'No', 17, '2023-10-15 15:13:26', '2023-10-15 15:13:26'),
(116, 'Leaf short drop earrings', 123.00, 5, 'QjlfWd', 'Accessories/TBwouEDiMXxmbAyVN7fUISMn9JoixOiKoRtA2Bmq.png', 'show', 'No', 17, '2023-10-15 15:15:00', '2023-10-15 15:15:00'),
(117, 'Large hoop earrings', 215.00, 5, 'FIF6dd', 'Accessories/RzDvTNAlryXBwdTjavkQTUAifoh97gkqV63OEO35.png', 'show', 'No', 17, '2023-10-15 15:15:32', '2023-10-15 15:15:32'),
(118, 'Hoop earrings', 399.00, 5, 'TALZSI', 'Accessories/oAoniUhViQ2wkLIb5Hg5tyPTGLPXl72uvDWaYQIs.png', 'show', 'No', 17, '2023-10-15 15:16:53', '2023-10-15 15:16:53'),
(119, 'Hoop earrings', 249.00, 5, 'nFThUb', 'Accessories/xscunqgnk4IPxViKxDxBarAOBCdEAgMt7yEjHTuv.png', 'show', 'No', 17, '2023-10-15 15:17:24', '2023-10-15 15:17:24'),
(120, 'Glamazon pave organic oval drop earrings', 542.00, 5, 'EI8BZV', 'Accessories/U1xzTUzhmRSkvb7QyJjZyGpIDrOOtZ8G5dfXSHjq.png', 'show', 'No', 17, '2023-10-15 15:18:05', '2023-10-15 15:18:05'),
(121, 'Filigree short drop earrings silver', 544.00, 5, 'U8Ww57', 'Accessories/u5Gxsf3naMhY0KJz07p8FDH2p9tCNwewOENHjtLl.png', 'show', 'No', 17, '2023-10-15 15:18:55', '2023-10-15 15:18:55'),
(122, '2 Pairs hoop earrings', 195.00, 5, 'wWKsL7', 'Accessories/IMAQ3bhfS6ofQgC8MMkQb4clmBubjWOEWwQrq1y0.png', 'show', 'No', 17, '2023-10-15 15:20:09', '2023-10-15 15:20:09'),
(123, '3 pairs hoop earrings', 175.00, 5, '7iVom0', 'Accessories/UyNCjDlTjkabmBMXFbxavZuR0U3ZVpi21vTi9g70.png', 'show', 'No', 17, '2023-10-15 15:21:08', '2023-10-15 15:21:08'),
(124, '3 pack crystal stud earring set of three blue', 432.00, 5, 'T7QVH8', 'Accessories/qI89usklP13D2hQzl9ipmCYF9UZALdZwBQHsm1IU.png', 'show', 'No', 17, '2023-10-15 15:21:51', '2023-10-15 15:21:51'),
(125, '3 pairs hoop earrings', 621.00, 5, 'IYdiBv', 'Accessories/Tz5oc6cCvuewSGmtYRebFu11TLbYl7bz1RYWgsJx.png', 'show', 'No', 17, '2023-10-15 15:22:34', '2023-10-15 15:22:34'),
(126, '2 pack', 120.34, 8, 'Hk3rrH', 'Accessories/Z9zIzLMgZNKY3n44Nin52j02Td9wJyeYvynLdGJS.png', 'show', 'No', 22, '2023-10-15 19:10:58', '2023-10-15 19:10:58'),
(127, '4-pack rings', 142.02, 8, 'Crav1Z', 'Accessories/yNb2ZIS5VDIZI0vZURAWxfA5T2ei5tag73bBmQXH.png', 'show', 'No', 22, '2023-10-15 19:11:44', '2023-10-15 19:11:44'),
(128, '5-pack rings', 245.00, 8, 'VeyHGP', 'Accessories/l8E6RKNMOnGfLmuT6DBJd6MHczY6BTpiCaDCcLWq.png', 'show', 'No', 22, '2023-10-15 19:12:17', '2023-10-15 19:12:17'),
(129, '5-pack rings', 278.24, 8, '5VG7vy', 'Accessories/pNXLL4I7ZzVp0A296BqhsQh8YNHgXRCa50fSDkQv.png', 'show', 'No', 22, '2023-10-15 19:12:44', '2023-10-15 19:12:44'),
(130, '7-pack rings', 354.25, 8, 'D6vKHp', 'Accessories/10ENQRwcnZr8FQrrju0BdiBROy171lDlZXoDucn7.png', 'show', 'No', 22, '2023-10-15 19:13:13', '2023-10-15 19:13:13'),
(131, '9-pack rings', 456.47, 8, 'UHgCAi', 'Accessories/gtkoiHQT55Dyf6pwrPLUYOwadv6UQQziINyUHKf4.png', 'show', 'No', 22, '2023-10-15 19:14:23', '2023-10-15 19:14:23'),
(132, '9-pack rings', 542.31, 8, 'o7bvAL', 'Accessories/w50bhhMeOw6BtrxfdNS2BpiuCec9QbsgOHH7QvB2.png', 'show', 'No', 22, '2023-10-15 19:15:00', '2023-10-15 19:15:00'),
(133, '11-pack rings', 648.21, 8, 'GzBr1s', 'Accessories/IOGSWH5e4QPunxV847kL8nnqPii3Ebs1DRticHjC.png', 'show', 'No', 22, '2023-10-15 19:15:38', '2023-10-15 19:15:38'),
(134, '14ct gold-plated sparkle stone ring gold', 671.89, 8, 'JuE6WQ', 'Accessories/sgvusGGEc17PtK7AelDr4zJQrWO7Olc5KWAPfrQO.png', 'show', 'No', 22, '2023-10-15 19:16:17', '2023-10-15 19:16:17'),
(135, '14ct Gold-plated star band ring gold', 698.37, 8, 'vF4SLu', 'Accessories/a0DA82Mxlk2KsGVCpWk3SycwkSxWfgzjtjH0yxK3.png', 'show', 'No', 22, '2023-10-15 19:16:56', '2023-10-15 19:16:56'),
(136, 'Beaded rings 4 pack blue', 421.58, 8, '9FN2Sf', 'Accessories/PV3M1qW0F9YlOUaba9YInXYKMstfbqLd8FmgBDG7.png', 'show', 'No', 22, '2023-10-15 19:17:33', '2023-10-15 19:17:33'),
(137, 'Bevelled edge gem ring blue', 524.87, 8, 'lAsRTb', 'Accessories/SGepNxVVSJcMuxvnESZZe85VdmSRXLVzD923u5uG.png', 'show', 'No', 22, '2023-10-15 19:18:03', '2023-10-15 19:18:03'),
(138, 'Chain gem ring green', 754.24, 8, 'rKroz9', 'Accessories/K25pMoTvmVsHzQ4LJCjdJoPUpcOMbGJbvqoNh6Kz.png', 'show', 'No', 22, '2023-10-15 19:18:43', '2023-10-15 19:18:43'),
(139, 'Sterling silver stone ring green', 748.32, 8, 'zcUwi7', 'Accessories/SDSdbl3RHNO47mGoElYuhtGrxTzurbLC0cEUKtN6.png', 'show', 'No', 22, '2023-10-15 19:19:20', '2023-10-15 19:19:20'),
(140, 'Sterling silver twist ring silver', 854.25, 8, 'SQmxtd', 'Accessories/o5xYHOgkN7zlfOFd8eL4qBZNvQNvMnakKiy6Feur.png', 'show', 'No', 22, '2023-10-15 19:19:55', '2023-10-15 19:19:55'),
(141, 'Sterling silver wishbone pave ring white', 679.32, 8, 'lGi0Oy', 'Accessories/mndueHJzirHPWamhq4WNMWGGVjGvEJ6fblSKDrhd.png', 'show', 'No', 22, '2023-10-15 19:20:22', '2023-10-15 19:20:22'),
(142, 'Sterling silver-plated solitaire rings set of two white', 748.12, 8, 'NVif1F', 'Accessories/YfegwloUtUvbHYkraIwFlI1X5loZK6VX9pzk8oqx.png', 'show', 'No', 22, '2023-10-15 19:23:34', '2023-10-15 19:23:34'),
(143, 'Beaded pendant necklace', 743.25, 15, 'TBy0CD', 'Accessories/jy6xPZ4oT4BxBprWGKUjDySWtYF9TQ5oZsbsWJSS.png', 'show', 'No', 23, '2023-10-15 19:25:55', '2023-10-15 19:25:55'),
(144, 'Diamond necklace', 645.28, 15, '7war8e', 'Accessories/g6yRYtMPFrEEG9PXNPRvZHIpvbG3CJMQXNxEcmOb.png', 'show', 'No', 23, '2023-10-15 19:27:26', '2023-10-15 19:27:26'),
(145, 'Layered necklace', 743.25, 15, 'blXoHb', 'Accessories/5370VRm2l2eplAqXpYiNeuzVva1pNiLbyiSArW9G.png', 'show', 'No', 23, '2023-10-15 19:28:10', '2023-10-15 19:28:10'),
(146, 'Linked-ring necklace', 789.36, 15, '9vuJYn', 'Accessories/1k7hPuGNXDPO30G3faDdismbWCONWSdjIxv7SgRf.png', 'show', 'No', 23, '2023-10-15 19:28:44', '2023-10-15 19:28:44'),
(147, 'Pendant necklace', 782.34, 15, 'MtW0PP', 'Accessories/IPjzY7GAa62hAlx3oU6X3YiADOgOhdlw48qvdYeU.png', 'show', 'No', 23, '2023-10-15 19:29:26', '2023-10-15 19:29:26'),
(148, 'Pendant necklace', 768.29, 15, 'hEGwrf', 'Accessories/iUrL7to69nZD7xD0HXUtw0zqvTBKWLEIeMqWXyQu.png', 'show', 'No', 23, '2023-10-15 19:30:06', '2023-10-15 19:30:06'),
(149, 'Pendant necklace', 623.98, 15, 'qEOBS2', 'Accessories/lj2A2D85ELsljfL5fwFqLB4u3Nirx0GhlQZvmWYk.png', 'show', 'No', 23, '2023-10-15 19:30:53', '2023-10-15 19:30:53'),
(150, 'Rhinestone-pendant necklace', 589.24, 15, 'j5vZEc', 'Accessories/SPbX0H9XQIIRW5cTsOKPLrv6D73Wr6gohqOWneKp.png', 'show', 'No', 23, '2023-10-15 19:32:15', '2023-10-15 19:32:15'),
(151, 'Short two-strand necklace', 782.78, 15, 'rW2CZz', 'Accessories/eO6pHFiZuuzlChh23dyUtRlipxpQY9mfQgUrOVhL.png', 'show', 'No', 23, '2023-10-15 19:33:04', '2023-10-15 19:33:04'),
(152, 'Three-strand necklace', 452.38, 15, 'MWEAQv', 'Accessories/TAWB5YQMyafd8httl0nXvhBHt9UdpEuB5WkcRRKV.png', 'show', 'No', 23, '2023-10-15 19:33:37', '2023-10-15 19:33:37'),
(153, 'Three-strand necklace', 238.89, 15, 'TcRrgS', 'Accessories/l8ejQLzOEEzW7rOYQ5xrnWPEHoWLq3pagnq91f4a.png', 'show', 'No', 23, '2023-10-15 19:34:11', '2023-10-15 19:34:11'),
(154, 'Two-strand necklace', 459.38, 15, 'OoCdfn', 'Accessories/EmMSoVSTsaQYGhoBMHHZe8izkMZk6Pfd8ELVfCHY.png', 'show', 'No', 23, '2023-10-15 19:34:55', '2023-10-15 19:34:55'),
(155, 'White Sapphire trio necklace', 854.97, 15, 'OQqBf6', 'Accessories/mHxoLVFJLz8ty0H7y3sDH2gxZJnTBD5ZbblujQ3C.png', 'show', 'No', 23, '2023-10-15 19:35:25', '2023-10-15 19:35:25'),
(156, 'Super-Soft Blanket Scarf Multi', 457.35, 20, 'EOkGa7', 'Accessories/lVcGg6ovf8wUUybXX7ce7jrRsOXUeCIpylnchy0u.png', 'show', 'No', 19, '2023-10-15 19:38:43', '2023-10-15 19:38:43'),
(158, 'Grace Super-Soft Blanket Scarf Duck Egg', 458.25, 20, 'IyNW8Q', 'Accessories/uIn6fnelY3YnIqRAU7kuIYjeoV98SrHgGyNbL8PJ.png', 'show', 'Yes', 19, '2023-10-15 19:42:07', '2024-02-11 01:10:59'),
(160, 'Luxury Scarf in Wool Blend Blue', 558.25, 20, 'bp0BJ6', 'Accessories/PvOM3W38vE1TpZQOHqzI7MsUfjzPhG6PQHyGGro9.png', 'show', 'No', 19, '2023-10-15 19:44:57', '2023-10-15 19:44:57'),
(161, 'Super-Soft Scarf Green', 748.39, 20, 'q8FpYV', 'Accessories/JwlpQ5L82DbRgTlQfVHKVDk611EjXEArIdNdypSp.png', 'show', 'No', 19, '2023-10-15 19:48:17', '2023-10-15 19:48:17'),
(162, 'Angled Cateye Sunglasses', 458.35, 25, 'BJT9Em', 'Accessories/g4V7ay9VtI6lhbqYS4EAYNbBVhnHD9cWACVPaSiA.png', 'show', 'No', 20, '2023-10-15 19:50:25', '2023-10-15 19:50:25'),
(163, 'Curved Oval Sunglasses', 845.32, 25, 'OKZouE', 'Accessories/L7sW1wDUuxa4dP9Bsm4ug29uXjMKbJmUpjrTl2Ed.png', 'show', 'No', 20, '2023-10-15 19:50:56', '2023-10-15 19:50:56'),
(165, 'Mottled Oversized Hexagon Sunglasses', 654.25, 25, 'Oa0MES', 'Accessories/QinfhqWfEAzt5APC4Ss5yyDf0oqORdUSJTCRWsld.png', 'show', 'No', 20, '2023-10-15 19:52:03', '2023-10-15 19:52:03'),
(166, 'Mya Metal Arm Cateye Sunglasses', 558.00, 25, 'YnMe36', 'Accessories/cbjPpBTN6joyRr6nUxNvt97ok4JjK7ZS8xoahMOk.png', 'show', 'No', 20, '2023-10-15 19:52:38', '2023-10-15 19:52:38'),
(167, 'Ombre Rimless Rectangel Sunglasses', 773.00, 25, 'cQN83Q', 'Accessories/vxnUIV8YRiwCzczznyhK3atE8ZJeWSfIOzJ7oE4y.png', 'show', 'No', 20, '2023-10-15 19:53:08', '2023-10-15 19:53:08'),
(168, 'Oversized Hexagon Sunglasses', 552.00, 25, 'JkwZWR', 'Accessories/wkYr0yAujZ99mJHlqzUXlCDE1ovbdqIr4em6hnhX.png', 'show', 'No', 20, '2023-10-15 19:54:02', '2023-10-15 19:54:02'),
(169, 'Oversized Soft Cateye Sunglasses', 675.00, 25, 'TEL02F', 'Accessories/nrSgeiehlkW5re0jlDZZi5jrPuQcIquHilPj0x7D.png', 'show', 'No', 20, '2023-10-15 19:54:50', '2023-10-15 19:54:50'),
(170, 'Retro Oversized Square Sunglasses', 662.25, 25, '0fmoWt', 'Accessories/Mt5dH1wuDYgY4HPDPWscWtUkC7EL0ibr2c6m80IS.png', 'show', 'No', 20, '2023-10-15 19:55:24', '2023-10-15 19:55:24'),
(171, 'Biker Jacket', 500.00, 15, '0ririO', 'Kids/sXvDN2ksUMsa45uCTeJZdlfWPUwYXOhtFZCGr270.png', 'show', 'No', 9, '2023-10-15 20:56:32', '2023-10-15 20:56:32'),
(174, 'Extra Long Puffer Jacket', 560.00, 15, 'XimXrM', 'Kids/ALtwVOms1U0w58ZEEGGxwCaQev2khxaVtEwqSNvE.png', 'show', 'No', 9, '2023-10-15 21:01:45', '2023-10-15 21:01:45'),
(175, 'Puffer Jacket', 550.00, 15, 'XiT6OU', 'Kids/NtMgecR26fpFFa4UMX5gJWoQvdHjgaFW5dpqJg34.png', 'show', 'No', 9, '2023-10-15 21:02:38', '2023-10-15 21:02:38'),
(176, 'Removable Hood Jacket', 570.00, 15, 'Jvg9OE', 'Kids/18mEPDEdsAWvEESziI6Dbhg2Xr0hFJFqNU9jYrh4.png', 'show', 'No', 9, '2023-10-15 21:03:41', '2023-10-15 21:03:41'),
(179, 'Gucci GG0034S', 887.21, 10, 'uJma6a', 'Accessories/y0AixYgk26GUxvLZKOVwjcgnlY6WWwhUPYH8sWQ1.png', 'show', 'No', 13, '2023-10-16 16:51:02', '2023-10-16 16:51:02'),
(180, 'Gucci GG0061S', 783.45, 10, 'pz8sKw', 'Accessories/XL76EDyseVxo6b1jhHYlUxkZSFuNpSN5SR1JcZpi.png', 'show', 'No', 13, '2023-10-16 16:51:39', '2023-10-16 16:51:39'),
(181, 'Gucci GG0061SK', 687.99, 10, 'lqYjK5', 'Accessories/G8RBvuVJ3s8HNd72BeipAtBOwH5gTs6I4BrbaPCc.png', 'show', 'No', 13, '2023-10-16 16:52:27', '2023-10-16 16:52:27'),
(182, 'Gucci GG0062S', 779.21, 10, 'c7i7k2', 'Accessories/9d9vI0lffxRgxyHHYPkAvNkzfKhjk1d0pghljZS7.png', 'show', 'No', 13, '2023-10-16 16:53:31', '2023-10-16 16:53:31'),
(183, 'Gucci GG0382S', 814.35, 10, 'wg9Zl6', 'Accessories/dA6DhsKOve8HcwxmXk708xzfTaPSI9QwbkGHS21Y.png', 'show', 'No', 13, '2023-10-16 16:54:16', '2023-10-16 16:54:16'),
(184, 'Gucci GG0418S', 717.00, 10, 'UT14Z0', 'Accessories/whuIJgxgy0vmSgAQ88kk4MpkUttpM2NYXDuc8OTv.png', 'show', 'No', 13, '2023-10-16 16:55:00', '2023-10-16 16:55:00'),
(185, 'Gucci GG0448S', 874.00, 10, 'NjXlOc', 'Accessories/Kr7TEgWATqa5lcsdD3h7G5WJaWdYyHDXhJubMB5i.png', 'show', 'No', 13, '2023-10-16 16:55:55', '2023-10-16 16:55:55'),
(186, 'Chain Strap Phone Purse Black', 358.00, 10, 'kr06fz', 'Accessories/g4x8yDjuOfAyfQAHmX7etcUoEne2wVRM7Mf77HJf.png', 'show', 'No', 21, '2023-10-16 17:07:09', '2023-10-16 17:07:09'),
(187, 'Ckear Pouch Travel Set', 421.00, 10, 'jWvXrD', 'Accessories/ECiriqng405KoAqj1a9HX4adBir7DT1la6OAJwAU.png', 'show', 'No', 21, '2023-10-16 17:07:56', '2023-10-16 17:07:56'),
(188, 'Clear Make Up Bag Black', 742.25, 10, 'VQTdBD', 'Accessories/901BvYsv7NB53amAmnjWe5XLhuOZfzhvrT2q6WCe.png', 'show', 'No', 21, '2023-10-16 17:08:47', '2023-10-16 17:08:47'),
(189, 'Jada Jewellery Box Pink', 458.32, 10, 'kxix38', 'Accessories/MzYHmcMOdXHYh46W8XQ2SE2uwoGJhZH7iBjogvrO.png', 'show', 'No', 21, '2023-10-16 17:10:42', '2023-10-16 17:10:42'),
(190, 'Jada Mini Jewellery Box', 478.39, 10, 'Gj1UlW', 'Accessories/RDv3AzGbEH6TZe0blPRdLojLAGHMn9wwEx0Q6rkQ.png', 'show', 'No', 21, '2023-10-16 17:12:05', '2023-10-16 17:12:05'),
(191, 'Large Vanity Case', 658.00, 10, 'iVo9dh', 'Accessories/5LYXgr1vRqYD1456fHxXcNOec4suxsNwi1DIKVpK.png', 'show', 'No', 21, '2023-10-16 17:15:01', '2023-10-16 17:15:01'),
(192, 'Large Weekender Bag Black', 875.00, 10, 'WHR23w', 'Accessories/3m7VaqPJTpXRsgLl9X5Q9FsKfcdnQBbkJMlOAJID.png', 'show', 'No', 21, '2023-10-16 17:18:11', '2023-10-16 17:18:11'),
(193, 'Chronograph Watch', 1000.00, 25, 'hojQDA', 'Accessories/SQfIOh1mpbNtKRYG9CsvYf4L5avHrYZO8dJZ28dG.png', 'show', 'No', 16, '2023-10-16 17:28:48', '2023-10-16 17:28:48'),
(194, 'Classic Leather Strap Watch', 1025.00, 25, '0TZZda', 'Accessories/cnKtASl2P4BoCxnmq5e4xHfWq7HTvyv1rGnmNF45.png', 'show', 'No', 16, '2023-10-16 17:29:32', '2023-10-16 17:29:32'),
(195, 'Gucci Dive', 945.25, 25, 'GOeJ88', 'Accessories/bCEoRysqQ1wyhIH1qo2sMeLDP8cjsDg6JlmXl2iE.png', 'show', 'No', 16, '2023-10-16 17:31:40', '2023-10-16 17:31:40'),
(196, 'Mesh Strap Watch', 2000.00, 25, 'mChVV1', 'Accessories/COjmkBKF6RqZSADU0lb5g6JuXDTLWdqhAy7qOc5D.png', 'show', 'No', 16, '2023-10-16 17:32:11', '2023-10-16 17:32:11'),
(197, 'Morrison Watch', 894.00, 25, 'xe5ah1', 'Accessories/ifoTbRdqAEhfN3ysYgzdGReMt0Mosc9MufLQZEz1.png', 'show', 'No', 16, '2023-10-16 17:32:47', '2023-10-16 17:32:47'),
(198, 'Ryan Watch', 975.00, 25, 'nAtZN6', 'Accessories/8sXhITl1pIsOVIL6SuVQVAcAvAq5WRDdHb0f5Xmy.png', 'show', 'No', 16, '2023-10-16 17:33:19', '2023-10-16 17:33:19'),
(199, 'Silicone Strap Watch', 1587.00, 25, 'Sd4vYX', 'Accessories/TfwDJoL6whsqLfMEnuP1L0HQpaYcOOtM1GfNwVlT.png', 'show', 'No', 16, '2023-10-16 17:33:54', '2023-10-16 17:33:54'),
(200, 'Fluffy Bucket hat Natural', 457.00, 15, 'fl0HJ2', 'Accessories/Sf6aMOFJzoKzvy32e3BV0sG1WEPM5SMpNH8B64ft.png', 'show', 'No', 18, '2023-10-16 17:40:08', '2023-10-16 17:40:08'),
(201, 'Cord Mariner Cap Duck Egg', 898.99, 15, 'Q1oMN0', 'Accessories/imDpoqfUtEGlOSAdwEB6XHuE1v80nd6bKYMtwSr6.png', 'show', 'Yes', 18, '2023-10-16 17:42:28', '2024-02-11 01:11:19'),
(202, 'Wool Fedora Green', 786.00, 15, 'Hn1saJ', 'Accessories/DWdzU2aAGTlnjZXrQ927vV2bHJvmYsCKsg8EG6jY.png', 'show', 'No', 18, '2023-10-16 17:47:23', '2023-10-16 17:47:23'),
(203, 'Chenille Packable Fedora Black', 458.00, 15, 'vZb8Wn', 'Accessories/22iROPNeoQ0Tp70fo7JzOFPXvXuuCBaMzwfDOFS7.png', 'show', 'No', 18, '2023-10-16 17:48:34', '2023-10-16 17:48:34'),
(205, 'Soft Textured Baker Boy Hat Pink', 659.00, 15, 'sHaQ51', 'Accessories/UX5u2XTPGHs7HniqTntj3bs3TM1x0gacUuaNq1Xq.png', 'show', 'No', 18, '2023-10-16 17:52:23', '2023-10-16 17:52:23'),
(206, 'Canvas Bucket Hat', 783.00, 15, 'WCmkbe', 'Accessories/wsUvoWiFkh5FtvpdGRB31zF9MjKu607vzUql73Uw.png', 'show', 'No', 18, '2023-10-16 17:54:27', '2023-10-16 17:54:27'),
(207, 'Faux Fur Earmuffs Blue', 325.00, 15, '08OOD3', 'Accessories/7Z8euy5xur3D8BjejTgrxjMLUljT2XPeGg2dL4FN.png', 'show', 'No', 18, '2023-10-16 17:55:43', '2023-10-16 17:55:43'),
(208, 'Felt Hat', 634.00, 15, 'bAedSU', 'Accessories/kFvyPmiLqXuDWLbfG7RF3TM5U9ZrE4VNgC97Fqlz.png', 'show', 'No', 18, '2023-10-16 17:57:19', '2023-10-16 17:57:19'),
(209, 'Kint Pom-Pom Beanie Green', 551.00, 15, 'KmGoxI', 'Accessories/3ombczBQEHnak4pyFZkdsjVJjJ2y0Dgp6b5xwgAv.png', 'show', 'No', 18, '2023-10-16 17:58:11', '2023-10-16 17:58:11'),
(210, 'Faux Fur Suedette Ear Muffs Camel', 425.00, 15, 'j1S9Ze', 'Accessories/HYZE9J1iTLEBqgBNjUHO4tzbpRiP73WUUEFBdTd0.png', 'show', 'No', 18, '2023-10-16 18:00:48', '2023-10-16 18:00:48'),
(211, 'Soft Knit Bando Brown', 328.00, 15, 'jTCCf0', 'Accessories/dvQSD6dBQV9sbBnVjHFTBbIG0u6damvT9mor5Mqt.png', 'show', 'No', 18, '2023-10-16 18:02:09', '2023-10-16 18:02:09'),
(212, 'Paris Knit Beanie', 479.00, 15, 'wSaxof', 'Accessories/3rJPQfYXhvIwZpWCV6R7OwHRAiJLWQmmo2vkpFnl.png', 'show', 'No', 18, '2023-10-16 18:03:28', '2023-10-16 18:03:28'),
(213, 'Craft Sititch Beanie', 544.00, 15, 'zbUpnK', 'Accessories/Uvka9HykKWfgt6AKYud0BvFeGFdh3Y8LMO1zKV1a.png', 'show', 'No', 18, '2023-10-16 18:04:19', '2023-10-16 18:04:19'),
(214, 'Cargo pants', 270.35, 15, 'sDaHkV', 'Kids/DW3JZ4JZPL9B98AGEEpQyLTC8Ztpah4THS6h0jJI.png', 'show', 'No', 10, '2023-10-20 00:06:16', '2023-10-20 00:06:16'),
(215, 'Character Pant', 250.00, 15, 'EUo6Rt', 'Kids/i0IdCKtOvA3CU4ZIELWXsoBHDzU971HUU8dDc2JB.png', 'show', 'No', 10, '2023-10-20 00:07:50', '2023-10-20 00:07:50'),
(216, 'Flared Pant', 230.00, 15, 'Z8gCPG', 'Kids/mhaH0AggYvRON2aZ3u3b6eiFmxfK2T6lWA0fC1HT.png', 'show', 'No', 10, '2023-10-20 00:08:40', '2023-10-20 00:08:40'),
(217, 'Legging Pant', 245.00, 15, 'xfjikF', 'Kids/pKlGbSPIduNz57Ja1nhfUcL9tpv4MeiXxlbwihcH.png', 'show', 'No', 10, '2023-10-20 00:09:51', '2023-10-20 00:09:51'),
(218, 'Homewear Pant', 247.00, 15, '1ZYL3K', 'Kids/etVz2Jp1cE9mHStuyc33ZGKav4meXpeBebWBwTea.png', 'show', 'No', 10, '2023-10-20 00:13:46', '2023-10-20 00:13:46'),
(219, 'Parachute Pant', 247.00, 15, 'ntpFrM', 'Kids/IJEzItzk4NDZl2Zof8bhR1l3LasVL4iM5Wv6Y4cv.png', 'show', 'No', 10, '2023-10-20 00:15:08', '2023-10-20 00:15:08'),
(220, 'Summer trousers', 475.00, 15, 'LXDaAo', 'Kids/zinCoehQzbzlsg620EJ24MRQ6qwZ9wssK0pfejD8.png', 'show', 'No', 10, '2023-10-20 00:16:12', '2023-10-20 00:16:12'),
(221, 'Tracksuit Pants', 748.25, 15, 'K7bJGq', 'Kids/6nFI1K4qSFkQPCQKW0XWa2F5Mo5QPM7H1hZUl2gH.png', 'show', 'No', 10, '2023-10-20 00:17:48', '2023-10-20 00:17:48'),
(222, 'Contrasting Striped Shirt', 245.00, 15, 'Hi0oos', 'Kids/MOeKDgPsDKlg4XeqVcyHGtIcf8g2NuW0xIgdKI2s.png', 'show', 'No', 11, '2023-10-20 00:19:55', '2023-10-20 00:19:55'),
(223, 'Long Sleeve Shirt', 315.00, 15, '8dUYl7', 'Kids/9pR0UAkvG5jx32sAVhcHln0Q8ahnRxYdy73AOJYj.png', 'show', 'No', 11, '2023-10-20 00:20:49', '2023-10-20 00:20:49'),
(224, 'Nylon Pocket Shirt', 265.57, 15, 'cyepHb', 'Kids/r7GoBc6rXObjJY3wyolrDdv8bLL0P4Fz6hc90z9d.png', 'show', 'No', 11, '2023-10-20 00:22:03', '2023-10-20 00:22:03'),
(225, 'Oxford Shirt', 230.68, 15, 'u2Ax7Z', 'Kids/TMSjHbEwZz6nIMiGLcbQl4SfKE6L5TGKZa21zM8C.png', 'show', 'No', 11, '2023-10-20 00:23:26', '2023-10-20 00:23:26'),
(227, 'Patchwork Shirt', 212.68, 15, 'zfrwSx', 'Kids/rcsiqWxt7BkW5WgAG2PKEC6AVzcSrfcUJQofbBDB.png', 'show', 'No', 11, '2023-10-20 00:30:19', '2023-10-20 00:30:19'),
(228, 'Plain Cotton Shirt', 548.25, 15, 'T0n4YZ', 'Kids/zswqymDtdHUShdIkVlXTsf4QExK00Ay24rz21kAf.png', 'show', 'No', 11, '2023-10-20 00:31:38', '2023-10-20 00:31:38'),
(229, 'Printed Shirt', 634.24, 15, 'iE5Lmw', 'Kids/ECGDCcqE2ZLWNjIWbr8f84orv40gjj95KyppLLUW.png', 'show', 'No', 11, '2023-10-20 00:35:41', '2023-10-20 00:35:41'),
(230, 'Striped Shirt', 489.30, 15, 'EalrIo', 'Kids/hbu65YMatTofmnObkKE9PKC1rpOIKYlTHW7tzuPn.png', 'show', 'No', 11, '2023-10-20 00:39:25', '2023-10-20 00:39:25'),
(231, 'Blend Bermuda Shorts', 200.00, 15, 'X289G2', 'Kids/5GeNtDH3fwmjySF8tjuQCLUis9iGyYsG6eJN7LV5.png', 'show', 'No', 12, '2023-10-20 00:43:51', '2023-10-20 00:43:51'),
(232, 'Cotton Shorts', 248.00, 15, 'Cg71tL', 'Kids/Q94gp6TUvukHNijqjXnuIA5zWJgUDUxdNppwITmn.png', 'show', 'No', 12, '2023-10-20 00:47:29', '2023-10-20 00:47:29'),
(233, 'Denim Bermuda Shorts', 278.00, 15, '5gWPse', 'Kids/UlbGzcvKRPJDXEw3eWFNtBV2rV84d2a0pFJeJFma.png', 'show', 'No', 12, '2023-10-20 00:48:22', '2023-10-20 00:48:22'),
(234, 'Denim Cargo Shorts', 318.00, 15, 'pmfAgM', 'Kids/2fBj2BWtsw0S5oIadpRrdHDEa4xicfdhwDwtRQsU.png', 'show', 'No', 12, '2023-10-20 00:50:34', '2023-10-20 00:50:34'),
(236, 'Jogger Shorts', 478.00, 15, 'HtB7f3', 'Kids/4Ihx0WoIo7QqYiOxjKQwYoeuoMV3tgGVEWspF69A.png', 'show', 'No', 12, '2023-10-20 00:55:00', '2023-10-20 00:55:00'),
(237, 'Patchwork Shorts', 431.00, 15, 'AFgmfK', 'Kids/fV0bEPnSxFf5Ue5Auskqc4WqUx6L5liwM2qVzC7b.png', 'show', 'No', 12, '2023-10-20 00:57:04', '2023-10-20 00:57:04'),
(238, 'Waffle-Knit Bermuda Shorts', 524.25, 15, '00hNTM', 'Kids/yJx36VMoyNEbfb4cQslv780GChSzcVl3sKcK6JiP.png', 'show', 'No', 12, '2023-10-20 00:58:18', '2023-10-20 00:58:18'),
(239, 'Slogan Shorts', 358.24, 15, '3QzQeE', 'Kids/f4WXmdwfKCofirZEZpctlZn8IsYgI1wVbeo7LVku.png', 'show', 'No', 12, '2023-10-20 00:59:21', '2023-10-20 00:59:21'),
(240, 'Airknit Cap', 145.00, 13, 'lLb932', 'Accessories/tI60qOuGFx3fe1ig6UwgnZF6vnm5mGDOOaqUMbje.png', 'show', 'No', 14, '2023-10-20 01:19:44', '2023-10-20 01:19:44'),
(241, 'Fluo Cap', 180.00, 13, 'SCtCV2', 'Accessories/zFFhEy8jT8aAq1P657bYPqrXGXwLTI3TezwwCxdt.png', 'show', 'No', 14, '2023-10-20 01:21:35', '2023-10-20 01:21:35'),
(242, 'Izel Cap', 120.00, 13, 'ylH231', 'Accessories/GPgEAYeMuADVDCnPkqAo1Qgd02d8i2yAknEai2UR.png', 'show', 'No', 14, '2023-10-20 01:22:07', '2023-10-20 01:22:07'),
(243, 'Lamanai Cap', 130.00, 13, 'MIWb8E', 'Accessories/KnkTM97ZTZ1NhBVnJ7ARVB1YmY2LLQqncHrtw56d.png', 'show', 'No', 14, '2023-10-20 01:22:36', '2023-10-20 01:22:36'),
(244, 'Quetzal Cap', 140.00, 13, 'W2jt27', 'Accessories/vEkH7J4eaghyPlLqUDqjXyd29AC2SSqtbqhPepnd.png', 'show', 'No', 14, '2023-10-20 01:23:11', '2023-10-20 01:23:11'),
(245, 'Tikal Cap', 193.00, 13, 'eNbcXt', 'Accessories/mb2ah6v2xpXNi5vVTjIZoY646JPXYVw9bVHkhvLb.png', 'show', 'No', 14, '2023-10-20 01:23:49', '2023-10-20 01:23:49'),
(246, 'Zuma Headband', 174.00, 13, 'jqmor7', 'Accessories/t37iF6vugu4eHoyWM8t9JhB4f1bBxREvYNlPcaxy.png', 'show', 'No', 14, '2023-10-20 01:25:09', '2023-10-20 01:25:09'),
(247, 'Eton Bifold Leather Wallet', 325.00, 13, 'PVmCD7', 'Accessories/GnpnKjMSoNm2oaVWACEnMHI4Jx8ee28CyKYPd5br.png', 'show', 'No', 15, '2023-10-20 01:26:44', '2023-10-20 01:26:44'),
(248, 'Lewis Leather Trifold Wallet', 370.00, 13, 'J1ZmbQ', 'Accessories/XysQj2s9BKdbirRY0esViHyv8IicJ2MlaYkw8PDk.png', 'show', 'No', 15, '2023-10-20 01:27:13', '2023-10-20 01:27:13'),
(249, 'Marmont Bifold Wallet', 400.00, 13, 't3mY7Y', 'Accessories/MSibfZd1S5XSkXBH7Rol8YwdaxTq2UQWs5J6eu9L.png', 'show', 'No', 15, '2023-10-20 01:27:47', '2023-10-20 01:27:47'),
(250, 'Marmont Leather Card Case', 258.00, 13, 'gzq1Cb', 'Accessories/k7UNtlwr9oYuIPm8tZcobq2G8qGr2zLEfj7guZ0K.png', 'show', 'No', 15, '2023-10-20 01:28:18', '2023-10-20 01:28:18'),
(251, 'Men\'s Trifold Wallet', 230.00, 13, 'cxkm0t', 'Accessories/uPJ3DnDrlnK6mXbpVLLMzXFwjD3PdtFXfflr9sJu.png', 'show', 'No', 15, '2023-10-20 01:28:45', '2023-10-20 01:28:45'),
(252, 'Supreme Bifold Wallet', 430.00, 13, 'Tc8eew', 'Accessories/EP9vF72SxwqGXo8tnqALTtOk0rSU0U0pVopZd81J.png', 'show', 'No', 15, '2023-10-20 01:29:35', '2023-10-20 01:29:35'),
(253, 'TH Premium Leather Credit Card Holder', 240.00, 13, 'WTCUdo', 'Accessories/VrhCs6f7zUvKOKwCGSBfRfqI2G1OukD9F81TfiOJ.png', 'show', 'No', 15, '2023-10-20 01:30:10', '2023-10-20 01:30:10'),
(254, 'TH Premium Leather Passcase', 210.00, 13, 'UD6DRK', 'Accessories/TAlY8ZI2ofbnZM0lD7Ut0NfNfoBeX9DdneGtCMfd.png', 'show', 'No', 15, '2023-10-20 01:30:46', '2023-10-20 01:30:46'),
(257, 'Block-heeled slingbacks', 634.00, 25, 'SBHDuo', 'Woman Product/dHs46stMGnj6uFGAq3obffSbES5m7aIuyKNFYWhc.png', 'show', 'No', 38, '2023-10-21 04:34:19', '2023-10-21 04:34:19'),
(258, 'Chunky Chelsea boots', 758.00, 25, 'rGSm8p', 'Woman Product/ers5l0s51qshe8SzCA3YbvFW2p8PVVngfvXSZv5Q.png', 'show', 'No', 38, '2023-10-21 04:35:15', '2023-10-21 04:35:15'),
(259, 'Chunky loafers', 583.00, 25, 'HQDbum', 'Woman Product/3lRLDciEg763lHsVqridwHSLdGRUeHH08grJtilO.png', 'show', 'No', 38, '2023-10-21 04:37:13', '2023-10-21 04:37:13'),
(260, 'Chunky loafers', 399.24, 25, 'pZ7Pnc', 'Woman Product/QO3IedueqKDD3YrJ7toRAggYYoR4KsHaD7fEVotm.png', 'show', 'No', 38, '2023-10-21 04:38:05', '2023-10-21 04:38:05'),
(261, 'Court shoes', 442.25, 25, 'VRnVFr', 'Woman Product/7t5iOw7ZjveBj3xrVr94HN1cGIpGY5gjOwy9MCi9.png', 'show', 'No', 38, '2023-10-21 04:38:47', '2023-10-21 04:38:47'),
(262, 'Court shoes', 749.25, 25, 'TnWXcu', 'Woman Product/vxmGANXBpkNKvupYi9xkjhvmq07nXTvuc0M1Fg42.png', 'show', 'No', 38, '2023-10-21 04:39:55', '2023-10-21 04:39:55'),
(263, 'Crochet-detail mules', 487.54, 25, 'APtXu0', 'Woman Product/0x3acAUsNtw6HXjWaOQlXvmJBtwSM1IGAQev6cvg.png', 'show', 'No', 38, '2023-10-21 04:41:16', '2023-10-21 04:41:16'),
(264, 'Denim-look platform mules', 854.39, 25, 'kkUFIc', 'Woman Product/SCdV2WyZpPGsjOknoScv5wwPh8R27PQMKp1S7LO9.png', 'show', 'No', 38, '2023-10-21 04:42:00', '2023-10-21 04:42:00'),
(265, 'Espadrille mules', 875.24, 25, 'FBs902', 'Woman Product/hs2pOiPX3ZjlYfxC1rMGpkSPeGYWjtPh471biihr.png', 'show', 'No', 38, '2023-10-21 04:42:50', '2023-10-21 04:42:50'),
(266, 'Gladiator flip-flops', 748.24, 25, 'Fd4kBH', 'Woman Product/djZFqQvEyO9IVCckngE2SdJOXvEvs10NmIAJpKRs.png', 'show', 'No', 38, '2023-10-21 04:45:44', '2023-10-21 04:45:44'),
(267, 'Glittery mules', 947.55, 25, 'fh8qE5', 'Woman Product/WbUOxv0bEOoRpdQrSy7LtSmCo1HYv7nZPeZX03O4.png', 'show', 'No', 38, '2023-10-21 04:46:38', '2023-10-21 04:46:38'),
(269, 'Heeled platform sandals', 1254.00, 25, 'u6MD9Q', 'Woman Product/mxcvtm0bW3fqfDiratiE4x8nmu8k1OCoKNaTjbjh.png', 'show', 'No', 38, '2023-10-21 04:47:59', '2023-10-21 04:47:59'),
(270, 'Heeled sandals', 1274.00, 25, 'FUG5th', 'Woman Product/J2HF7ClvnFmM40Q0xLskXlOe6MS57KJQhjDG2Hgf.png', 'show', 'No', 38, '2023-10-21 04:50:04', '2023-10-21 04:50:04'),
(271, 'Heeles boots', 1325.00, 25, 'LAsSYU', 'Woman Product/Ct0igk8mMS8ZxHBf64BL017McsOHC6I8O58L9E2f.png', 'show', 'No', 38, '2023-10-21 04:50:54', '2023-10-21 04:50:54'),
(272, 'Loafers', 1003.00, 25, 'z7vLha', 'Woman Product/62z4CspjmSTlf4HxuQpD5IHSnmX1AIbFx8pkphyN.png', 'show', 'No', 38, '2023-10-21 04:52:59', '2023-10-21 04:52:59'),
(273, 'Padded platform sandals', 1102.00, 25, 's13mUc', 'Woman Product/bZuZpYnvyjk2Ebt81MbGFH8WTwwQnSBICu7DcUQH.png', 'show', 'No', 38, '2023-10-21 04:54:02', '2023-10-21 04:54:02'),
(274, 'Platform sandals', 457.00, 25, 'tqlwuu', 'Woman Product/IWtRQnJwVC0DhXMDhhtKbO0jAXxhxlWMJf2moYUi.png', 'show', 'No', 38, '2023-10-21 04:54:31', '2023-10-21 04:54:31'),
(275, 'Pointed heeled sandals', 1500.00, 25, 'mKOUrO', 'Woman Product/CsQlj4vT8snQrqARzkx1LFxaROGVBr5sAfGEs5Qi.png', 'show', 'No', 38, '2023-10-21 04:56:41', '2023-10-21 04:56:41'),
(276, 'Pointed slingback court shoes', 1458.00, 25, 'A3BTly', 'Woman Product/JCbZMmzt79t3bzXgGFcxobqvJKUNh5SsSYGizH9c.png', 'show', 'No', 38, '2023-10-21 04:58:56', '2023-10-21 04:58:56'),
(277, 'Quilted pool shoes', 847.00, 25, 'U3NNgi', 'Woman Product/jXGqyrdlCAlJSVYeSGcXRtbKWxABsWfY44kUUH2S.png', 'show', 'No', 38, '2023-10-21 04:59:29', '2023-10-21 04:59:29'),
(278, 'Rhinestone-embellished mules', 473.00, 25, 'konDmW', 'Woman Product/1x0GWbTHjcWlwO1ud7WOsw7yyRlyd2rwfIJuEVzA.png', 'show', 'No', 38, '2023-10-21 05:00:12', '2023-10-21 05:00:12'),
(279, 'Sandals', 874.14, 25, '8tYOtk', 'Woman Product/p2xJJRNiOC71oARBhC1L4NJyCywHwq6mqDgUPXPb.png', 'show', 'No', 38, '2023-10-21 05:00:56', '2023-10-21 05:00:56'),
(280, 'Slides', 745.00, 25, 'J3njyy', 'Woman Product/VHxj5Rmw8vWzlTHx121nH1NGq1Iu8ICYhHzyUPzE.png', 'show', 'No', 38, '2023-10-21 05:01:30', '2023-10-21 05:01:30'),
(281, 'Slingback ballet pumps', 358.00, 25, 'i0YS3N', 'Woman Product/6RNIy4br0edyKM7G7poVjH5T4mV96Ev8sKMsZHDP.png', 'show', 'No', 38, '2023-10-21 05:02:09', '2023-10-21 05:02:09'),
(282, 'Slingbacks', 1554.00, 25, 'nbfdap', 'Woman Product/xmtFGmKS0Cd5OtCgKDxMjHaDWmPuYCIWCCdaEj5V.png', 'show', 'No', 38, '2023-10-21 05:02:58', '2023-10-21 05:02:58'),
(283, 'Slippers', 749.00, 25, 'ZPvqVt', 'Woman Product/IARIr1q4TgyKzHNcMp2ZCcHtH2jEuVb5VnAV0IS1.png', 'show', 'No', 38, '2023-10-21 05:03:33', '2023-10-21 05:03:33'),
(284, 'Strappy sandals', 749.00, 25, 'tWmEi9', 'Woman Product/THIEbRY6sVv1pTXTFi7a0MpYS7XN1uTytl2z9U9l.png', 'show', 'No', 38, '2023-10-21 05:05:09', '2023-10-21 05:05:09'),
(285, 'Strappy sandals', 540.00, 25, '8wlkTb', 'Woman Product/ZThMhEz78ub2VwnxxAmHvvs1pxQdeP3fw0kZqEcN.png', 'show', 'No', 38, '2023-10-21 05:06:17', '2023-10-21 05:06:17'),
(286, 'Studded sandals', 408.00, 25, 'BDBe26', 'Woman Product/lGqdH9znshWmdy8sEixlTDbPXD6WwPw6hmM81sm6.png', 'show', 'No', 38, '2023-10-21 05:07:24', '2023-10-21 05:07:24'),
(287, 'Studded sandals', 870.00, 25, 'WVfkJi', 'Woman Product/yEqnv7FBzAPCbrGmxMXSix45ffAVFbyAADN90BBp.png', 'show', 'No', 38, '2023-10-21 05:07:56', '2023-10-21 05:07:56'),
(288, 'Stud-detail slingbacks', 1478.00, 25, '8DIuB5', 'Woman Product/lj7QABYb7ssbxG5K9U4AoycvQ4aswF3jkAum5z6f.png', 'show', 'No', 38, '2023-10-21 05:08:33', '2023-10-21 05:08:33'),
(289, 'Stud-details slides', 1320.00, 25, 'k8dEaF', 'Woman Product/8gfk0krniWmuJSglRgLslz1lGAenxPHCjgtcia8w.png', 'show', 'No', 38, '2023-10-21 05:09:11', '2023-10-21 05:09:11'),
(290, 'Trainers', 1047.00, 25, 'z2ypLz', 'Woman Product/D8yYN1GloDnpkaRJHPH72YsnN6fSU2r8HMWQiVZH.png', 'show', 'No', 38, '2023-10-21 05:10:08', '2023-10-21 05:10:08'),
(291, 'Trainers', 1425.00, 25, 'TU00B6', 'Woman Product/tInuDsRAa5otLdFEJVye5N0qgzU08FjyNlpWMClm.png', 'show', 'No', 38, '2023-10-21 05:10:33', '2023-10-21 05:10:33'),
(292, 'Bomber jacket', 1457.00, 15, 'AyzJoD', 'Woman Product/ZEByfwgqjv4i7lqjbc4o3Z80IwIRrwrONMFjbRX7.png', 'show', 'Yes', 5, '2023-10-21 05:51:18', '2024-02-11 00:21:39'),
(293, 'Coated biker jacket', 1254.00, 15, 'FyDQoE', 'Woman Product/FM4xRk3gP5NECwTytbrkawtFy1lB3JXTvy3X2dYR.png', 'show', 'Yes', 5, '2023-10-21 05:52:43', '2024-02-11 00:41:21'),
(294, 'Coated bomber jacket', 1344.00, 15, 'JNs8Qa', 'Woman Product/rrYs0IkdZcaePxjGYiOpcYQXLsKbEPh6gxGSytCy.png', 'show', 'No', 5, '2023-10-21 05:53:58', '2023-10-21 05:53:58'),
(295, 'Coated jacket', 1254.00, 15, 'gM4glV', 'Woman Product/T5Cc4UHWyxMlm4G1fMYHoocHvd4Src0s5Su39AZB.png', 'show', 'No', 5, '2023-10-21 05:55:20', '2023-10-21 05:55:20'),
(296, 'Boucle jacket', 1742.00, 15, 'OPZC3Q', 'Woman Product/dpooqX1VMARC6CpbwgtQRM2kdMnACw7SMqOoFONe.png', 'show', 'No', 5, '2023-10-21 05:57:32', '2023-10-21 05:57:32'),
(297, 'Cropped blazer', 1742.00, 15, '7hv6Ue', 'Woman Product/ryrlV5cwBCn3jKrVbbGQmXSafFbtnxCYtoErPGaO.png', 'show', 'No', 5, '2023-10-21 05:59:16', '2023-10-21 05:59:16'),
(298, 'Double-breasted blazer', 1230.00, 15, 'IEBCOF', 'Woman Product/P0bKK8vPw61tmyJhRRFMcg8X1OuFpLpsK69Fj16a.png', 'show', 'Yes', 5, '2023-10-21 06:02:48', '2024-02-11 00:42:45'),
(299, 'Double-breasted blazer', 1230.00, 15, 'vy2QgN', 'Woman Product/vEA1SjIqQrSuDvmtxuSESSv0O1unXTVSHrveDThY.png', 'show', 'No', 5, '2023-10-21 06:05:24', '2023-10-21 06:05:24'),
(300, 'Double-breasted blazer', 784.00, 15, '0RkFPS', 'Woman Product/ujGxxToU0blIhhkfCAscProA5ctrefGrNC4uOvxD.png', 'show', 'No', 5, '2023-10-21 06:08:21', '2023-10-21 06:08:21'),
(302, 'Double-breasted blazer', 1755.00, 15, '6zABlS', 'Woman Product/WxiJp5yrvgCuqSWJtHp8dkZCQfZtQR4b8vNu9pJa.png', 'show', 'No', 5, '2023-10-21 06:11:48', '2023-10-21 06:11:48'),
(303, 'Double-breasted coat', 3254.00, 15, 'q20ykB', 'Woman Product/p7U7UWX1tkC0U8qN11qj6pE7rFwNmd0ntGRSBI54.png', 'show', 'No', 5, '2023-10-21 06:13:42', '2023-10-21 06:13:42'),
(304, 'Felted bomber jacket', 987.00, 15, 'iYnQVO', 'Woman Product/kXbFzBYBkEQRPlcwCeXgZ0v6EtpMeylCbmtpBDGm.png', 'show', 'No', 5, '2023-10-21 06:15:18', '2023-10-21 06:15:18'),
(305, 'Gathered-sleeve blazer', 947.00, 15, 'bBCwkF', 'Woman Product/XqwjXWfrmRTQ3uX1M5peAx2YNahJ06S0j7SYu00T.png', 'show', 'No', 5, '2023-10-21 06:16:57', '2023-10-21 06:16:57'),
(306, 'Hooded puffer gilet', 2451.00, 15, 'J2VPzi', 'Woman Product/MhW2mS9R2gSLakPHsd98Ha0sL3oVQjSCZzFxHkTX.png', 'show', 'No', 5, '2023-10-21 06:18:04', '2023-10-21 06:18:04'),
(307, 'Large-collared down jacket', 1254.00, 15, 's5WPoE', 'Woman Product/U0oZNdROJYs8r0xvSIsf1Q9D3vedRWY1Ycq1REUW.png', 'show', 'No', 5, '2023-10-21 06:19:11', '2023-10-21 06:19:11'),
(308, 'Long puffer jacket', 4125.00, 15, 'RNOCgI', 'Woman Product/dpFVVL7MQQBTvz6lArCgOJGaCuRwWzMCtBY4A6KW.png', 'show', 'No', 5, '2023-10-21 06:21:52', '2023-10-21 06:21:52'),
(309, 'MAMA Quilted coat', 2451.00, 15, 'b7NrZ8', 'Woman Product/HNxmNZhm37dQ0wHiM4WOAiLHgT9TDYQfVZbHSUOy.png', 'show', 'No', 5, '2023-10-21 06:23:25', '2023-10-21 06:23:25'),
(310, 'Motif-detail bomber jacket', 1284.00, 15, '2yB2VC', 'Woman Product/feJ3ihuh0rPJvoz2H3rhewfpXKQUXYBrlGhsP3OQ.png', 'show', 'No', 5, '2023-10-21 06:26:39', '2023-10-21 06:26:39'),
(311, 'Oversized biker jacket', 1147.00, 15, '1Fv68G', 'Woman Product/gNYGZJlS1vw0Br01PWNRm1cZ1E3X5KjYZUK1t4qR.png', 'show', 'No', 5, '2023-10-21 06:29:20', '2023-10-21 06:29:20'),
(312, 'Oversized teddy-lined jacket', 4578.00, 15, 'm7zqxY', 'Woman Product/dSQ3eSLO2sBcmNM5ZyGn3MnPaDnDThccqj25JLYQ.png', 'show', 'No', 5, '2023-10-21 06:31:44', '2023-10-21 06:31:44'),
(313, 'Puffer jacket', 2415.00, 15, 'dR5J03', 'Woman Product/j6iujysEDVrrXq3Kk1Ng6WUH05AB463CdS0hbxlJ.png', 'show', 'No', 5, '2023-10-21 06:36:09', '2023-10-21 06:36:09'),
(314, 'Puffer gilet', 2741.00, 15, '2augCB', 'Woman Product/gyPUNWWONJ7WKvvCfTrvk8kNx27gMWrV8hvRqBHt.png', 'show', 'No', 5, '2023-10-21 06:38:15', '2023-10-21 06:38:15'),
(315, 'Puffer gilet', 1249.00, 15, 'om1aB0', 'Woman Product/MIAUREa4UI0Jq94ZfCbTEADjSH9Xbe0Ni90XHzDR.png', 'show', 'No', 5, '2023-10-21 06:39:19', '2023-10-21 06:39:19'),
(316, 'Puffer jacket', 2988.00, 15, 'k00RO7', 'Woman Product/BBuxmmR2AFgzCqS2RAR6hGYip8GkVYIsZGMRknnR.png', 'show', 'No', 5, '2023-10-21 06:41:12', '2023-10-21 06:41:12'),
(317, 'Running gilet in DryMove', 748.25, 15, 'XcREdv', 'Woman Product/DKyXpO0ErMNNB1H8Cw1SY0cat16HEt438BEmR7JO.png', 'show', 'No', 5, '2023-10-21 06:42:56', '2023-10-21 06:42:56'),
(318, 'Running jacket in DryMove', 879.25, 15, 'qWKSM9', 'Woman Product/fqmaqjGTeLeIJnNOYvUlpe5ZbP40CWKp12ukdcNI.png', 'show', 'No', 5, '2023-10-21 06:44:30', '2023-10-21 06:44:30'),
(319, 'Shacket', 978.99, 15, 'mtZUo7', 'Woman Product/Cp6CMlCw8mIVn5vTNw7E0j84lG36RUCazPJoQzLa.png', 'show', 'No', 5, '2023-10-21 06:45:37', '2023-10-21 06:45:37'),
(320, 'ThermoMove Hybrid jacket', 1004.00, 15, 'la1OX3', 'Woman Product/YSh1GB6QDwg74RmIuiDnsldd4KZQELcVoRPJHZYt.png', 'show', 'No', 5, '2023-10-21 06:47:14', '2023-10-21 06:47:14');
INSERT INTO `products` (`id`, `name`, `main_price`, `main_discount`, `product_code`, `image`, `status`, `delete_status`, `sub_category_id`, `created_at`, `updated_at`) VALUES
(321, 'Tie-belt coat', 3478.00, 15, 'Fry1OE', 'Woman Product/wt2e435DrZy2R2uEP8sCwq9o0q2BVdESIPgqrhs3.png', 'show', 'No', 5, '2023-10-21 06:48:22', '2023-10-21 06:48:22'),
(322, 'Twill coat', 3875.99, 15, 'oHI3PI', 'Woman Product/BJ0j1uk9VU7a5EcI6sXjinu134cebmLvAiMnwO59.png', 'show', 'No', 5, '2023-10-21 06:49:47', '2023-10-21 06:49:47'),
(323, 'Classic Laptop Bag', 325.00, NULL, 'RADnpY', 'Bags Product/Fxs7QpBJijYBd9dg32rzqBt4VN3mqyOdBpVELyrL.png', 'show', 'No', 24, '2023-10-29 18:45:51', '2023-10-29 18:45:51'),
(324, 'Corporate Mix Bag', 258.00, NULL, 'H14zTm', 'Bags Product/8aGH9wO9vgOtXqcLrgdUwufVhOk2WZtWWv2ovaQl.png', 'show', 'No', 24, '2023-10-29 18:46:45', '2023-10-29 18:46:45'),
(325, 'Essential Tote Bag', 357.25, NULL, 'P3PnJX', 'Bags Product/8c6o386qvtT6C7NBXF2dWrqEmesBXuNFXzfnMPAz.png', 'show', 'No', 24, '2023-10-29 18:47:28', '2023-10-29 18:47:28'),
(326, 'Core Canvas Duffel Bag', 457.00, NULL, 'T7bXqC', 'Bags Product/mWPZQXWIoSapsR5BkW4f0ytN23CK8JpkUhb2hVw6.png', 'show', 'No', 24, '2023-10-29 18:48:56', '2023-10-29 18:48:56'),
(327, 'Essential Belt Bag', 578.25, NULL, 'xW05Fb', 'Bags Product/Vrr5gl78xCs9UnYPcQHHfbcpgE2vPPOUcvpGoaVD.png', 'show', 'No', 24, '2023-10-29 18:49:38', '2023-10-29 18:49:38'),
(328, 'Essential Weekender Bag', 541.25, NULL, 'fRpywO', 'Bags Product/e9yWZLktmlSzqaBtHY00CoAWTYxhExyhDnOxCc1q.png', 'show', 'No', 24, '2023-10-29 18:50:22', '2023-10-29 18:50:22'),
(329, 'Essential Sling Bag', 543.25, 20, 'IPndvu', 'Bags Product/T6e4XB8ndrSRAjHJzqKutZ5uEfonfSRhOd85sCny.png', 'show', 'No', 24, '2023-10-29 18:51:59', '2023-10-29 18:51:59'),
(330, 'Elevated Nylon Bag', 634.21, 20, 'Uezyst', 'Bags Product/2EnPEiWA1HBrqBI7OqzHigF99EILnNzq0aZ3IpTo.png', 'show', 'No', 24, '2023-10-29 18:56:20', '2023-10-29 18:56:20'),
(331, 'Essential Messenger Bag', 628.54, 20, '1k1QHV', 'Bags Product/0vMzBnUZBPKHuqUPkQWaWO6IaazZjybY4o5l4fwh.png', 'show', 'No', 24, '2023-10-29 19:01:02', '2023-10-29 19:01:02'),
(332, 'Buckle Strap Bar Shoulder Bag', 547.25, 20, 'EHHlPs', 'Bags Product/dXQO1mVF0TNbCEmTQT0PbngtnsB92IEnGjPj21ap.png', 'show', 'No', 26, '2023-10-29 19:07:35', '2023-10-29 19:07:35'),
(333, 'Double Zip Cross Body Bag', 451.28, 20, 'CWi8hm', 'Bags Product/KZzCePGdoVOPxgYARkP5fF8cl94RCnSgg1WglgDh.png', 'show', 'No', 26, '2023-10-29 19:22:48', '2023-10-29 19:22:48'),
(334, 'Double Zip Cross Body Bag', 451.28, 20, 'RkNtfq', 'Bags Product/0BxGRzVT27TwE4tgb7BEozhVKw7sZJh1dRvSyAmz.png', 'show', 'No', 26, '2023-10-29 19:22:55', '2023-10-29 19:22:55'),
(335, 'Grab Handle Handheld Bag', 548.25, 20, 'fnvRsc', 'Bags Product/Wxm1tDOUkkHNcIz5UiARbkc5E5TqwvMHKRqPLQxo.png', 'show', 'No', 26, '2023-10-29 19:28:19', '2023-10-29 19:28:19'),
(336, 'Large Shoulder Bag', 663.00, 20, '1xVFYF', 'Bags Product/gqen22JTQli6321azTQovL5t0Zij4TbQCa62x6EI.png', 'show', 'No', 26, '2023-10-29 19:30:55', '2023-10-29 19:30:55'),
(337, 'Metallic Box Clutch Bag', 748.00, 20, '9Squ6h', 'Bags Product/EKce3XQBly7OaRgOTJKhjNwRizDqSE4y6Xl2mZXg.png', 'show', 'No', 26, '2023-10-29 19:31:59', '2023-10-29 19:31:59'),
(338, 'Quilted Handheld Cross-Body Bag', 445.00, 20, '6e4UUx', 'Bags Product/EFVzZqgUMlrI7casDi2tRdf9lbxtcx1uiWFDNAJJ.png', 'show', 'No', 26, '2023-10-29 19:35:07', '2023-10-29 19:35:07'),
(339, 'Webbing Saddle Bag', 634.25, 20, '3XmHhp', 'Bags Product/CssPuzOYt33bFilWFcypZhQ3siilnLhRLl1kN1Tp.png', 'show', 'No', 26, '2023-10-29 19:36:11', '2023-10-29 19:36:11'),
(340, 'Zip Around Backpack', 783.00, 15, 'TZfhlQ', 'Bags Product/aGsN5W9xRfdSxWDcvZfzpUIwKnsA3sfFjp1Czapu.png', 'show', 'No', 29, '2023-10-29 19:39:40', '2023-10-29 19:39:40'),
(341, 'Quilted Nylon Laptop Backpack', 987.00, 15, 'nFQsSF', 'Bags Product/5SayJAM3jtzv6JldrOPIkV6pAEBswWEJPSMAGjVL.png', 'show', 'No', 29, '2023-10-29 19:40:47', '2023-10-29 19:40:47'),
(342, 'Multi Pocket Laptop Backpack', 882.24, 15, 'zWMZdV', 'Bags Product/zW9hP6R18K2v1tl1kPt7ssrCPkqW9hmQSmFjOq0c.png', 'show', 'No', 29, '2023-10-29 19:42:03', '2023-10-29 19:42:03'),
(343, 'Beaded Hardcase Clutch Bag', 458.99, 15, 'qbyfD4', 'Bags Product/gip0xoMlp0tfTSOq28gk74WiD6PNx4PHVKvWf7Of.png', 'show', 'No', 27, '2023-10-29 19:46:01', '2023-10-29 19:46:01'),
(344, 'Velvet Cross Body Bag', 508.00, 15, 'hBsx9F', 'Bags Product/l6ptf2m5b15JCjp6rlmkmygwl3yJbYzcs4XB8YlM.png', 'show', 'No', 27, '2023-10-29 19:47:35', '2023-10-29 19:47:35'),
(345, 'Patent Clutch Bag', 741.00, 15, 'yROxfN', 'Bags Product/pwtK7LSCfKP5d4IEt6i8LOmYZWkykh8LTzmgJzxL.png', 'show', 'No', 27, '2023-10-29 19:48:56', '2023-10-29 19:48:56'),
(346, 'Classic Satin Clutch Bag', 842.00, 15, '42CNJQ', 'Bags Product/Dmp6vd0YI2EKzBi4XNHd6fO6egQ9lDBUiZ8KFjJ4.png', 'show', 'No', 27, '2023-10-29 19:51:01', '2023-10-29 19:51:01'),
(347, 'Metallic Frame Clutch Bag', 875.21, 15, 'TJuHYy', 'Bags Product/0WCt3YVdSFksaei4H3zbvTEEHkLexCURM4fODwDB.png', 'show', 'No', 27, '2023-10-29 19:52:07', '2023-10-29 19:52:07'),
(348, 'Patent Clutch Bag', 739.22, 15, '5yacik', 'Bags Product/hpzLrh2rXkStgKXXTR7zeFSbEy3itC1TLlNy6f4p.png', 'show', 'No', 27, '2023-10-29 19:53:15', '2023-10-29 19:53:15'),
(349, 'Quilted Chain Shoulder Bag', 852.32, 15, 'onLhvv', 'Bags Product/StcoIJ5311OcurYHFD95NQJdv3tVDDbT63bQeHDc.png', 'show', 'No', 27, '2023-10-29 19:54:30', '2023-10-29 19:54:30'),
(350, 'Circle Jute Cross-Body Bag', 251.00, 15, '5vlg0c', 'Bags Product/82BHzUxmqSYxLsSiWeO9sS9qTbfANZRm2S5gMeYv.png', 'show', 'No', 28, '2023-10-29 19:58:57', '2023-10-29 19:58:57'),
(351, 'Large Raffia Webbing Bag', 325.00, 15, 'DzLclR', 'Bags Product/wjXeT9rKTII4PbQLFhge3rO37AFgdOZaQMYhdc6t.png', 'show', 'No', 28, '2023-10-29 19:59:29', '2023-10-29 19:59:29'),
(352, 'Large Stripe Beach Tote Bag', 382.00, 15, 'RoO7Rz', 'Bags Product/RWjysdwIrFEXQabyHDMrxFSCTYSH4G2ZnH2Ioaxm.png', 'show', 'No', 28, '2023-10-29 20:00:08', '2023-10-29 20:00:08'),
(353, 'Shell Round Jute Shoulder Bag', 412.33, 15, 'Q2vJ7n', 'Bags Product/ad9IDn6RsCFlBCieb2RhTlNkPANam9Ri6GdCX5Xd.png', 'show', 'No', 28, '2023-10-29 20:00:41', '2023-10-29 20:00:41'),
(354, 'Striped Large Beach Tote Bag', 449.99, 15, 'VluX4G', 'Bags Product/prE7QEbsrXOkQSfa68DHUjGO3ec3yVY6eIGmJc2K.png', 'show', 'No', 28, '2023-10-29 20:01:21', '2023-10-29 20:01:21'),
(355, 'Classic Shoulder Bag', 558.00, 15, 'yJjWln', 'Bags Product/Nce5fvCyiSTTXp5ORop2zuMskGuXYibOcvkPPsm3.png', 'show', 'No', 25, '2023-10-29 20:06:13', '2023-10-29 20:06:13'),
(356, 'Classic Tote Bag', 742.00, 15, 'yKK8MA', 'Bags Product/9u3MN9WPkdkdw48pISrrsiMrTAIY1ZeaJWWtv96G.png', 'show', 'No', 25, '2023-10-29 20:08:41', '2023-10-29 20:08:41'),
(357, 'Classic Zip Around Backpack', 854.00, 15, 'WueN1B', 'Bags Product/C50linNtcM0Y3QA16HUPWv40wKAnqVgWXeJBYpxT.png', 'show', 'No', 25, '2023-10-29 20:09:36', '2023-10-29 20:09:36'),
(358, 'Clear Mackup Bag', 345.88, 15, '1owF5c', 'Bags Product/ot7m0rzruOHkozjboKFPuSz3cp49GZX7fhfCKXHq.png', 'show', 'No', 25, '2023-10-29 20:10:32', '2023-10-29 20:10:32'),
(359, 'Large Weekender Bag', 884.99, 15, 'ICPiJ0', 'Bags Product/e3hbnTX8szMWRQliJrF72xnuVvGwnF66z8NHLwoS.png', 'show', 'No', 25, '2023-10-29 20:11:29', '2023-10-29 20:11:29'),
(360, 'Cord Make Up Bag', 748.22, 15, 'HjMHt5', 'Bags Product/HRqgg9ZNPi8D1FIQug6z84pMXxwnGTJgb7gI6acz.png', 'show', 'No', 25, '2023-10-29 20:13:02', '2023-10-29 20:13:02'),
(361, 'Packable Backpack Bag', 555.47, 15, '9nDDIV', 'Bags Product/IN29LmhdCluNnIDuyTrM2D5Y1uSxK7MlK5ZMOkMm.png', 'show', 'No', 25, '2023-10-29 20:14:42', '2023-10-29 20:14:42'),
(362, 'Quilted Shopper Bag in Recycled Nylon', 887.99, 15, 'bNqylE', 'Bags Product/oxAQ3Hh3y7slAneMWpEZaMLkUqVf9KauAYUCQacg.png', 'show', 'No', 25, '2023-10-29 20:15:57', '2023-10-29 20:15:57'),
(363, 'Quilted Shoulder  Bag in Recycled Nylon', 983.25, 15, 'TR25xl', 'Bags Product/MRw7kjM0gPSYF8bfDJk4MQIy8HxPMJeYv4Jox2Cu.png', 'show', 'No', 25, '2023-10-29 20:16:34', '2023-10-29 20:16:34'),
(364, 'Vaupan Hiking Backpack', 1544.99, 15, 'XcJzK4', 'Bags Product/imp09ClvmOAZuwku3YLTTx8yXye2Nkg9t9bZOBwn.png', 'show', 'No', 25, '2023-10-29 20:18:52', '2023-10-29 20:18:52'),
(365, 'Tribal Bag', 1254.99, 15, 'niDgXq', 'Bags Product/oTxoLbcwIX2v77jmAlpvWx3jBaOFrKXBrcMUj8tJ.png', 'show', 'No', 25, '2023-10-29 20:19:56', '2023-10-29 20:19:56'),
(366, 'Motif-detail sweatshirt', 487.00, 10, '145Ed1', 'WOMAN/Sweatshirts & Hoodies Products/0dNXpVOnP2KvhLzgDnItywuiU5xv9UtnkmuDb4wk.png', 'hide', 'Yes', 41, '2023-12-19 15:44:30', '2024-02-11 03:45:15'),
(368, '2-pack cropped tube tops', 449.00, 15, 'pdr77j', 'WOMAN/Shirts Products/PbXRCnlnMYcmTnB5suDQ6By5AU7NYesM7ZUkZLzn.png', 'show', 'No', 7, '2023-12-19 16:12:26', '2023-12-19 16:12:26'),
(369, 'Knitted tie-detail top', 544.00, 15, 'eeR84P', 'WOMAN/Shirts Products/LcYodQ6xCgsoqFZY8ULW9EVPs1uTxfHNKh7z6WKC.png', 'hide', 'No', 7, '2023-12-21 01:07:26', '2023-12-21 01:07:26'),
(372, 'odfkdg', 748.00, 10, 'eeR847', 'WOMAN/Sweatshirts & Hoodies Products/wVBD23xQhLHr3bNsry4St71faq3IUqBBQYan74gl.png', 'hide', 'No', 41, '2024-01-11 16:49:05', '2024-01-11 16:49:05');

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

CREATE TABLE `product_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) NOT NULL DEFAULT 'Multi',
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_colors`
--

INSERT INTO `product_colors` (`id`, `color`, `product_id`, `created_at`, `updated_at`) VALUES
(7, 'Multi', 8, '2023-10-12 09:02:56', '2023-10-12 09:02:56'),
(8, 'Multi', 9, '2023-10-12 09:06:02', '2023-10-12 09:06:02'),
(9, 'Multi', 10, '2023-10-12 09:09:15', '2023-10-12 09:09:15'),
(10, 'Multi', 11, '2023-10-12 09:11:35', '2023-10-12 09:11:35'),
(11, 'Multi', 12, '2023-10-12 09:12:56', '2023-10-12 09:12:56'),
(12, 'Multi', 13, '2023-10-12 09:16:56', '2023-10-12 09:16:56'),
(13, 'Multi', 14, '2023-10-12 09:21:35', '2023-10-12 09:21:35'),
(14, '#323642', 15, '2023-10-12 09:29:16', '2023-10-12 09:29:16'),
(15, '#3d4364', 16, '2023-10-12 09:38:24', '2023-10-12 09:38:24'),
(16, '#33333f', 17, '2023-10-12 09:41:19', '2023-10-12 09:41:19'),
(17, '#24304f', 18, '2023-10-12 09:44:26', '2023-10-12 09:44:26'),
(18, '#21222a', 19, '2023-10-12 09:49:02', '2023-10-12 09:49:02'),
(19, '#aa7150', 20, '2023-10-12 09:51:51', '2023-10-12 09:51:51'),
(20, '#0e4994', 21, '2023-10-12 09:56:19', '2023-10-12 09:56:19'),
(21, '#292a35', 22, '2023-10-12 09:59:32', '2023-10-12 09:59:32'),
(22, '#1a2a42', 23, '2023-10-12 10:05:20', '2023-10-12 10:05:20'),
(23, '#222229', 24, '2023-10-12 10:09:06', '2023-10-12 10:09:06'),
(24, '#312f3a', 25, '2023-10-12 10:11:34', '2023-10-12 10:11:34'),
(25, '#27283e', 26, '2023-10-12 10:13:47', '2023-10-12 10:13:47'),
(26, '#127bd4', 27, '2023-10-12 10:40:06', '2023-10-12 10:40:06'),
(30, '#5fa855', 31, '2023-10-12 10:47:14', '2023-10-12 10:47:14'),
(31, 'Multi', 32, '2023-10-12 10:53:31', '2023-10-12 10:53:31'),
(32, 'Multi', 33, '2023-10-12 10:55:42', '2023-10-12 10:55:42'),
(33, '#2490b4', 34, '2023-10-12 10:56:54', '2023-10-12 10:56:54'),
(34, '#161e37', 35, '2023-10-12 10:57:44', '2023-10-12 10:57:44'),
(39, 'Multi', 40, '2023-10-12 12:17:11', '2023-10-12 12:17:11'),
(40, 'Multi', 41, '2023-10-12 12:19:01', '2023-10-12 12:19:01'),
(42, 'Multi', 43, '2023-10-12 12:20:55', '2023-10-12 12:20:55'),
(43, 'Multi', 44, '2023-10-12 12:30:17', '2023-10-12 12:30:17'),
(44, 'Multi', 45, '2023-10-12 12:32:35', '2023-10-12 12:32:35'),
(45, 'Multi', 46, '2023-10-12 12:34:26', '2023-10-12 12:34:26'),
(46, 'Multi', 47, '2023-10-12 12:35:56', '2023-10-12 12:35:56'),
(47, 'Multi', 48, '2023-10-12 12:39:50', '2023-10-12 12:39:50'),
(48, '#e82c4c', 49, '2023-10-12 12:42:03', '2023-10-12 12:42:03'),
(49, '#e82e3f', 50, '2023-10-12 12:43:14', '2023-10-12 12:43:14'),
(50, '#e8d619', 51, '2023-10-12 12:44:56', '2023-10-12 12:44:56'),
(51, '#cbc756', 52, '2023-10-12 12:46:12', '2023-10-12 12:46:12'),
(52, '#26242c', 53, '2023-10-12 12:58:12', '2023-10-12 12:58:12'),
(53, '#a2b1bd', 54, '2023-10-12 13:02:29', '2023-10-12 13:02:29'),
(54, '#3a363f', 55, '2023-10-12 13:04:54', '2023-10-12 13:04:54'),
(55, '#a5c0d2', 56, '2023-10-12 13:06:59', '2023-10-12 13:06:59'),
(57, '#120f12', 58, '2023-10-12 13:13:07', '2023-10-12 13:13:07'),
(58, '#2f5371', 59, '2023-10-12 13:14:14', '2023-10-12 13:14:14'),
(59, '#25364c', 60, '2023-10-12 13:20:11', '2023-10-12 13:20:11'),
(61, 'Multi', 62, '2023-10-12 13:31:58', '2023-10-12 13:31:58'),
(62, 'Multi', 63, '2023-10-12 13:32:46', '2023-10-12 13:32:46'),
(63, '#104b97', 64, '2023-10-12 13:33:43', '2023-10-12 13:33:43'),
(64, '#28262e', 65, '2023-10-12 13:35:43', '2023-10-12 13:35:43'),
(66, 'Multi', 67, '2023-10-12 13:50:45', '2023-10-12 13:50:45'),
(67, 'Multi', 68, '2023-10-12 13:52:59', '2023-10-12 13:52:59'),
(68, 'Multi', 69, '2023-10-12 13:54:10', '2023-10-12 13:54:10'),
(69, 'Multi', 70, '2023-10-12 13:56:12', '2023-10-12 13:56:12'),
(70, 'Multi', 71, '2023-10-12 14:01:09', '2023-10-12 14:01:09'),
(71, 'Multi', 72, '2023-10-12 14:03:09', '2023-10-12 14:03:09'),
(72, 'Multi', 73, '2023-10-12 14:04:43', '2023-10-12 14:04:43'),
(73, 'Multi', 74, '2023-10-12 14:06:00', '2023-10-12 14:06:00'),
(74, 'Multi', 75, '2023-10-12 14:08:33', '2023-10-12 14:08:33'),
(75, 'Multi', 76, '2023-10-12 14:09:28', '2023-10-12 14:09:28'),
(76, 'Multi', 77, '2023-10-12 14:10:41', '2023-10-12 14:10:41'),
(77, 'Multi', 78, '2023-10-12 14:11:47', '2023-10-12 14:11:47'),
(78, 'Multi', 79, '2023-10-12 14:14:22', '2023-10-12 14:14:22'),
(79, 'Multi', 80, '2023-10-12 14:16:22', '2023-10-12 14:16:22'),
(80, 'Multi', 81, '2023-10-12 14:18:48', '2023-10-12 14:18:48'),
(81, 'Multi', 82, '2023-10-12 14:20:00', '2023-10-12 14:20:00'),
(82, 'Multi', 83, '2023-10-12 14:21:22', '2023-10-12 14:21:22'),
(83, 'Multi', 84, '2023-10-12 14:25:45', '2023-10-12 14:25:45'),
(84, 'Multi', 85, '2023-10-12 14:35:25', '2023-10-12 14:35:25'),
(85, 'Multi', 86, '2023-10-12 14:36:23', '2023-10-12 14:36:23'),
(86, 'Multi', 87, '2023-10-12 14:37:25', '2023-10-12 14:37:25'),
(87, 'Multi', 88, '2023-10-12 15:52:46', '2023-10-12 15:52:46'),
(88, 'Multi', 89, '2023-10-12 15:53:21', '2023-10-12 15:53:21'),
(89, 'Multi', 90, '2023-10-12 15:54:20', '2023-10-12 15:54:20'),
(90, 'Multi', 91, '2023-10-12 15:55:23', '2023-10-12 15:55:23'),
(91, 'Multi', 92, '2023-10-12 15:56:02', '2023-10-12 15:56:02'),
(92, 'Multi', 93, '2023-10-12 15:57:03', '2023-10-12 15:57:03'),
(93, 'Multi', 94, '2023-10-12 15:57:40', '2023-10-12 15:57:40'),
(94, 'Multi', 95, '2023-10-12 15:58:07', '2023-10-12 15:58:07'),
(95, 'Multi', 96, '2023-10-12 15:59:44', '2023-10-12 15:59:44'),
(96, 'Multi', 97, '2023-10-12 16:00:22', '2023-10-12 16:00:22'),
(97, 'Multi', 98, '2023-10-12 16:01:21', '2023-10-12 16:01:21'),
(98, 'Multi', 99, '2023-10-12 16:02:00', '2023-10-12 16:02:00'),
(99, 'Multi', 100, '2023-10-12 16:02:30', '2023-10-12 16:02:30'),
(100, 'Multi', 101, '2023-10-12 16:03:54', '2023-10-12 16:03:54'),
(101, 'Multi', 102, '2023-10-12 16:04:26', '2023-10-12 16:04:26'),
(102, 'Multi', 103, '2023-10-12 16:04:56', '2023-10-12 16:04:56'),
(103, 'Multi', 104, '2023-10-12 16:05:26', '2023-10-12 16:05:26'),
(104, 'Multi', 105, '2023-10-12 16:05:59', '2023-10-12 16:05:59'),
(105, 'Multi', 106, '2023-10-12 16:06:54', '2023-10-12 16:06:54'),
(106, 'Multi', 107, '2023-10-12 16:07:26', '2023-10-12 16:07:26'),
(107, 'Multi', 108, '2023-10-12 16:08:38', '2023-10-12 16:08:38'),
(108, 'Multi', 109, '2023-10-15 15:08:18', '2023-10-15 15:08:18'),
(109, 'Multi', 110, '2023-10-15 15:10:15', '2023-10-15 15:10:15'),
(110, 'Multi', 111, '2023-10-15 15:10:50', '2023-10-15 15:10:50'),
(111, 'Multi', 112, '2023-10-15 15:11:21', '2023-10-15 15:11:21'),
(112, 'Multi', 113, '2023-10-15 15:12:26', '2023-10-15 15:12:26'),
(113, 'Multi', 114, '2023-10-15 15:12:56', '2023-10-15 15:12:56'),
(114, 'Multi', 115, '2023-10-15 15:13:26', '2023-10-15 15:13:26'),
(115, 'Multi', 116, '2023-10-15 15:15:00', '2023-10-15 15:15:00'),
(116, 'Multi', 117, '2023-10-15 15:15:33', '2023-10-15 15:15:33'),
(117, 'Multi', 118, '2023-10-15 15:16:53', '2023-10-15 15:16:53'),
(118, 'Multi', 119, '2023-10-15 15:17:24', '2023-10-15 15:17:24'),
(119, 'Multi', 120, '2023-10-15 15:18:05', '2023-10-15 15:18:05'),
(120, 'Multi', 121, '2023-10-15 15:18:55', '2023-10-15 15:18:55'),
(121, 'Multi', 122, '2023-10-15 15:20:09', '2023-10-15 15:20:09'),
(122, 'Multi', 123, '2023-10-15 15:21:08', '2023-10-15 15:21:08'),
(123, 'Multi', 124, '2023-10-15 15:21:51', '2023-10-15 15:21:51'),
(124, 'Multi', 125, '2023-10-15 15:22:34', '2023-10-15 15:22:34'),
(125, 'Multi', 126, '2023-10-15 19:10:58', '2023-10-15 19:10:58'),
(126, 'Multi', 127, '2023-10-15 19:11:45', '2023-10-15 19:11:45'),
(127, 'Multi', 128, '2023-10-15 19:12:18', '2023-10-15 19:12:18'),
(128, 'Multi', 129, '2023-10-15 19:12:44', '2023-10-15 19:12:44'),
(129, 'Multi', 130, '2023-10-15 19:13:13', '2023-10-15 19:13:13'),
(130, 'Multi', 131, '2023-10-15 19:14:23', '2023-10-15 19:14:23'),
(131, 'Multi', 132, '2023-10-15 19:15:00', '2023-10-15 19:15:00'),
(132, 'Multi', 133, '2023-10-15 19:15:38', '2023-10-15 19:15:38'),
(133, 'Multi', 134, '2023-10-15 19:16:18', '2023-10-15 19:16:18'),
(134, 'Multi', 135, '2023-10-15 19:16:57', '2023-10-15 19:16:57'),
(135, 'Multi', 136, '2023-10-15 19:17:33', '2023-10-15 19:17:33'),
(136, 'Multi', 137, '2023-10-15 19:18:03', '2023-10-15 19:18:03'),
(137, 'Multi', 138, '2023-10-15 19:18:43', '2023-10-15 19:18:43'),
(138, 'Multi', 139, '2023-10-15 19:19:20', '2023-10-15 19:19:20'),
(139, 'Multi', 140, '2023-10-15 19:19:55', '2023-10-15 19:19:55'),
(140, 'Multi', 141, '2023-10-15 19:20:23', '2023-10-15 19:20:23'),
(141, 'Multi', 142, '2023-10-15 19:23:34', '2023-10-15 19:23:34'),
(142, 'Multi', 143, '2023-10-15 19:25:55', '2023-10-15 19:25:55'),
(143, 'Multi', 144, '2023-10-15 19:27:26', '2023-10-15 19:27:26'),
(144, 'Multi', 145, '2023-10-15 19:28:10', '2023-10-15 19:28:10'),
(145, 'Multi', 146, '2023-10-15 19:28:44', '2023-10-15 19:28:44'),
(146, 'Multi', 147, '2023-10-15 19:29:26', '2023-10-15 19:29:26'),
(147, 'Multi', 148, '2023-10-15 19:30:06', '2023-10-15 19:30:06'),
(148, 'Multi', 149, '2023-10-15 19:30:53', '2023-10-15 19:30:53'),
(149, 'Multi', 150, '2023-10-15 19:32:15', '2023-10-15 19:32:15'),
(150, 'Multi', 151, '2023-10-15 19:33:04', '2023-10-15 19:33:04'),
(151, 'Multi', 152, '2023-10-15 19:33:38', '2023-10-15 19:33:38'),
(152, 'Multi', 153, '2023-10-15 19:34:11', '2023-10-15 19:34:11'),
(153, 'Multi', 154, '2023-10-15 19:34:55', '2023-10-15 19:34:55'),
(154, 'Multi', 155, '2023-10-15 19:35:25', '2023-10-15 19:35:25'),
(155, 'Multi', 156, '2023-10-15 19:38:43', '2023-10-15 19:38:43'),
(157, '#78937d', 158, '2023-10-15 19:42:07', '2023-10-15 19:42:07'),
(159, '#7d808a', 160, '2023-10-15 19:44:58', '2023-10-15 19:44:58'),
(160, '#386441', 161, '2023-10-15 19:48:17', '2023-10-15 19:48:17'),
(161, 'Multi', 162, '2023-10-15 19:50:25', '2023-10-15 19:50:25'),
(162, 'Multi', 163, '2023-10-15 19:50:56', '2023-10-15 19:50:56'),
(164, 'Multi', 165, '2023-10-15 19:52:03', '2023-10-15 19:52:03'),
(165, 'Multi', 166, '2023-10-15 19:52:38', '2023-10-15 19:52:38'),
(166, 'Multi', 167, '2023-10-15 19:53:08', '2023-10-15 19:53:08'),
(167, 'Multi', 168, '2023-10-15 19:54:02', '2023-10-15 19:54:02'),
(168, 'Multi', 169, '2023-10-15 19:54:50', '2023-10-15 19:54:50'),
(169, 'Multi', 170, '2023-10-15 19:55:24', '2023-10-15 19:55:24'),
(170, '#3a4a47', 171, '2023-10-15 20:56:32', '2023-10-15 20:56:32'),
(173, '#1f1e1c', 174, '2023-10-15 21:01:45', '2023-10-15 21:01:45'),
(174, '#252422', 175, '2023-10-15 21:02:38', '2023-10-15 21:02:38'),
(175, '#727354', 176, '2023-10-15 21:03:41', '2023-10-15 21:03:41'),
(178, 'Multi', 179, '2023-10-16 16:51:03', '2023-10-16 16:51:03'),
(179, 'Multi', 180, '2023-10-16 16:51:39', '2023-10-16 16:51:39'),
(180, 'Multi', 181, '2023-10-16 16:52:27', '2023-10-16 16:52:27'),
(181, 'Multi', 182, '2023-10-16 16:53:31', '2023-10-16 16:53:31'),
(182, 'Multi', 183, '2023-10-16 16:54:16', '2023-10-16 16:54:16'),
(183, 'Multi', 184, '2023-10-16 16:55:00', '2023-10-16 16:55:00'),
(184, 'Multi', 185, '2023-10-16 16:55:55', '2023-10-16 16:55:55'),
(185, 'Multi', 186, '2023-10-16 17:07:09', '2023-10-16 17:07:09'),
(186, 'Multi', 187, '2023-10-16 17:07:56', '2023-10-16 17:07:56'),
(187, 'Multi', 188, '2023-10-16 17:08:47', '2023-10-16 17:08:47'),
(188, 'Multi', 189, '2023-10-16 17:10:42', '2023-10-16 17:10:42'),
(189, 'Multi', 190, '2023-10-16 17:12:05', '2023-10-16 17:12:05'),
(190, 'Multi', 191, '2023-10-16 17:15:02', '2023-10-16 17:15:02'),
(191, '#352f33', 192, '2023-10-16 17:18:11', '2023-10-16 17:18:11'),
(192, 'Multi', 193, '2023-10-16 17:28:48', '2023-10-16 17:28:48'),
(193, 'Multi', 194, '2023-10-16 17:29:32', '2023-10-16 17:29:32'),
(194, 'Multi', 195, '2023-10-16 17:31:40', '2023-10-16 17:31:40'),
(195, 'Multi', 196, '2023-10-16 17:32:11', '2023-10-16 17:32:11'),
(196, 'Multi', 197, '2023-10-16 17:32:47', '2023-10-16 17:32:47'),
(197, 'Multi', 198, '2023-10-16 17:33:19', '2023-10-16 17:33:19'),
(198, 'Multi', 199, '2023-10-16 17:33:54', '2023-10-16 17:33:54'),
(199, '#deccba', 200, '2023-10-16 17:40:08', '2023-10-16 17:40:08'),
(200, '#758e9c', 201, '2023-10-16 17:42:28', '2023-10-16 17:42:28'),
(201, '#395b3e', 202, '2023-10-16 17:47:23', '2023-10-16 17:47:23'),
(202, '#14241c', 203, '2023-10-16 17:48:34', '2023-10-16 17:48:34'),
(204, '#d0a594', 205, '2023-10-16 17:52:23', '2023-10-16 17:52:23'),
(205, '#d72f7d', 206, '2023-10-16 17:54:27', '2023-10-16 17:54:27'),
(206, '#1b2b44', 207, '2023-10-16 17:55:43', '2023-10-16 17:55:43'),
(207, '#e3dcd2', 208, '2023-10-16 17:57:19', '2023-10-16 17:57:19'),
(208, '#1c514c', 209, '2023-10-16 17:58:11', '2023-10-16 17:58:11'),
(209, '#d4bea6', 210, '2023-10-16 18:00:48', '2023-10-16 18:00:48'),
(210, '#523e3d', 211, '2023-10-16 18:02:10', '2023-10-16 18:02:10'),
(211, '#a59f40', 212, '2023-10-16 18:03:28', '2023-10-16 18:03:28'),
(212, 'Multi', 213, '2023-10-16 18:04:19', '2023-10-16 18:04:19'),
(213, '#29568f', 214, '2023-10-20 00:06:16', '2023-10-20 00:06:16'),
(214, '#9f937b', 215, '2023-10-20 00:07:50', '2023-10-20 00:07:50'),
(215, '#cecfd1', 216, '2023-10-20 00:08:40', '2023-10-20 00:08:40'),
(216, '#2e3136', 217, '2023-10-20 00:09:51', '2023-10-20 00:09:51'),
(217, '#363940', 218, '2023-10-20 00:13:46', '2023-10-20 00:13:46'),
(218, '#667463', 219, '2023-10-20 00:15:08', '2023-10-20 00:15:08'),
(219, '#dcdcd0', 220, '2023-10-20 00:16:12', '2023-10-20 00:16:12'),
(220, '#dbdcde', 221, '2023-10-20 00:17:48', '2023-10-20 00:17:48'),
(221, '#e2e2da', 222, '2023-10-20 00:19:55', '2023-10-20 00:19:55'),
(222, '#000000', 223, '2023-10-20 00:20:49', '2023-10-20 00:20:49'),
(223, '#262e41', 224, '2023-10-20 00:22:03', '2023-10-20 00:22:03'),
(224, '#ffffff', 225, '2023-10-20 00:23:26', '2023-10-20 00:23:26'),
(226, '#e6dcd0', 227, '2023-10-20 00:30:19', '2023-10-20 00:30:19'),
(227, '#ffffff', 228, '2023-10-20 00:31:38', '2023-10-20 00:31:38'),
(228, 'Multi', 229, '2023-10-20 00:35:42', '2023-10-20 00:35:42'),
(229, '#ccc0a6', 230, '2023-10-20 00:39:25', '2023-10-20 00:39:25'),
(230, '#000000', 231, '2023-10-20 00:43:51', '2023-10-20 00:43:51'),
(231, '#9c984f', 232, '2023-10-20 00:47:29', '2023-10-20 00:47:29'),
(232, '#3d4e58', 233, '2023-10-20 00:48:22', '2023-10-20 00:48:22'),
(233, '#c6bba9', 234, '2023-10-20 00:50:34', '2023-10-20 00:50:34'),
(235, '#e6e7e9', 236, '2023-10-20 00:55:00', '2023-10-20 00:55:00'),
(236, '#d1d1c5', 237, '2023-10-20 00:57:05', '2023-10-20 00:57:05'),
(237, '#dce2bc', 238, '2023-10-20 00:58:19', '2023-10-20 00:58:19'),
(238, '#55758f', 239, '2023-10-20 00:59:22', '2023-10-20 00:59:22'),
(239, 'Multi', 240, '2023-10-20 01:19:44', '2023-10-20 01:19:44'),
(240, 'Multi', 241, '2023-10-20 01:21:35', '2023-10-20 01:21:35'),
(241, 'Multi', 242, '2023-10-20 01:22:07', '2023-10-20 01:22:07'),
(242, 'Multi', 243, '2023-10-20 01:22:36', '2023-10-20 01:22:36'),
(243, 'Multi', 244, '2023-10-20 01:23:11', '2023-10-20 01:23:11'),
(244, 'Multi', 245, '2023-10-20 01:23:49', '2023-10-20 01:23:49'),
(245, 'Multi', 246, '2023-10-20 01:25:09', '2023-10-20 01:25:09'),
(246, 'Multi', 247, '2023-10-20 01:26:44', '2023-10-20 01:26:44'),
(247, 'Multi', 248, '2023-10-20 01:27:13', '2023-10-20 01:27:13'),
(248, 'Multi', 249, '2023-10-20 01:27:47', '2023-10-20 01:27:47'),
(249, 'Multi', 250, '2023-10-20 01:28:18', '2023-10-20 01:28:18'),
(250, 'Multi', 251, '2023-10-20 01:28:45', '2023-10-20 01:28:45'),
(251, 'Multi', 252, '2023-10-20 01:29:35', '2023-10-20 01:29:35'),
(252, 'Multi', 253, '2023-10-20 01:30:10', '2023-10-20 01:30:10'),
(253, 'Multi', 254, '2023-10-20 01:30:46', '2023-10-20 01:30:46'),
(256, 'Multi', 257, '2023-10-21 04:34:19', '2023-10-21 04:34:19'),
(257, 'Multi', 258, '2023-10-21 04:35:16', '2023-10-21 04:35:16'),
(258, 'Multi', 259, '2023-10-21 04:37:13', '2023-10-21 04:37:13'),
(259, 'Multi', 260, '2023-10-21 04:38:05', '2023-10-21 04:38:05'),
(260, 'Multi', 261, '2023-10-21 04:38:48', '2023-10-21 04:38:48'),
(261, 'Multi', 262, '2023-10-21 04:39:55', '2023-10-21 04:39:55'),
(262, 'Multi', 263, '2023-10-21 04:41:16', '2023-10-21 04:41:16'),
(263, 'Multi', 264, '2023-10-21 04:42:01', '2023-10-21 04:42:01'),
(264, 'Multi', 265, '2023-10-21 04:42:50', '2023-10-21 04:42:50'),
(265, 'Multi', 266, '2023-10-21 04:45:44', '2023-10-21 04:45:44'),
(266, 'Multi', 267, '2023-10-21 04:46:38', '2023-10-21 04:46:38'),
(268, 'Multi', 269, '2023-10-21 04:48:00', '2023-10-21 04:48:00'),
(269, 'Multi', 270, '2023-10-21 04:50:05', '2023-10-21 04:50:05'),
(270, 'Multi', 271, '2023-10-21 04:50:54', '2023-10-21 04:50:54'),
(271, 'Multi', 272, '2023-10-21 04:52:59', '2023-10-21 04:52:59'),
(272, 'Multi', 273, '2023-10-21 04:54:02', '2023-10-21 04:54:02'),
(273, 'Multi', 274, '2023-10-21 04:54:32', '2023-10-21 04:54:32'),
(274, 'Multi', 275, '2023-10-21 04:56:41', '2023-10-21 04:56:41'),
(275, 'Multi', 276, '2023-10-21 04:58:56', '2023-10-21 04:58:56'),
(276, 'Multi', 277, '2023-10-21 04:59:29', '2023-10-21 04:59:29'),
(277, 'Multi', 278, '2023-10-21 05:00:12', '2023-10-21 05:00:12'),
(278, 'Multi', 279, '2023-10-21 05:00:56', '2023-10-21 05:00:56'),
(279, 'Multi', 280, '2023-10-21 05:01:30', '2023-10-21 05:01:30'),
(280, 'Multi', 281, '2023-10-21 05:02:10', '2023-10-21 05:02:10'),
(281, 'Multi', 282, '2023-10-21 05:02:58', '2023-10-21 05:02:58'),
(282, 'Multi', 283, '2023-10-21 05:03:33', '2023-10-21 05:03:33'),
(283, 'Multi', 284, '2023-10-21 05:05:09', '2023-10-21 05:05:09'),
(284, 'Multi', 285, '2023-10-21 05:06:17', '2023-10-21 05:06:17'),
(285, 'Multi', 286, '2023-10-21 05:07:24', '2023-10-21 05:07:24'),
(286, 'Multi', 287, '2023-10-21 05:07:56', '2023-10-21 05:07:56'),
(287, 'Multi', 288, '2023-10-21 05:08:33', '2023-10-21 05:08:33'),
(288, 'Multi', 289, '2023-10-21 05:09:11', '2023-10-21 05:09:11'),
(289, 'Multi', 290, '2023-10-21 05:10:08', '2023-10-21 05:10:08'),
(290, 'Multi', 291, '2023-10-21 05:10:33', '2023-10-21 05:10:33'),
(291, '#232124', 292, '2023-10-21 05:51:18', '2023-10-21 05:51:18'),
(292, '#232124', 293, '2023-10-21 05:52:43', '2023-10-21 05:52:43'),
(293, '#232124', 294, '2023-10-21 05:53:58', '2023-10-21 05:53:58'),
(294, '#232124', 295, '2023-10-21 05:55:20', '2023-10-21 05:55:20'),
(295, '#c8c7c2', 296, '2023-10-21 05:57:32', '2023-10-21 05:57:32'),
(296, '#f2f2ea', 297, '2023-10-21 05:59:16', '2023-10-21 05:59:16'),
(297, '#b4a294', 298, '2023-10-21 06:02:48', '2023-10-21 06:02:48'),
(298, '#232124', 299, '2023-10-21 06:05:24', '2023-10-21 06:05:24'),
(299, '#122424', 300, '2023-10-21 06:08:21', '2023-10-21 06:08:21'),
(301, '#efece3', 302, '2023-10-21 06:11:49', '2023-10-21 06:11:49'),
(302, '#dedbd6', 303, '2023-10-21 06:13:42', '2023-10-21 06:13:42'),
(303, '#645a41', 304, '2023-10-21 06:15:18', '2023-10-21 06:15:18'),
(304, '#232124', 305, '2023-10-21 06:16:57', '2023-10-21 06:16:57'),
(305, '#dedacf', 306, '2023-10-21 06:18:04', '2023-10-21 06:18:04'),
(306, '#232124', 307, '2023-10-21 06:19:11', '2023-10-21 06:19:11'),
(307, '#c6c7cb', 308, '2023-10-21 06:21:52', '2023-10-21 06:21:52'),
(308, '#504c4d', 309, '2023-10-21 06:23:25', '2023-10-21 06:23:25'),
(309, '#22243b', 310, '2023-10-21 06:26:39', '2023-10-21 06:26:39'),
(310, '#232227', 311, '2023-10-21 06:29:20', '2023-10-21 06:29:20'),
(311, '#39261f', 312, '2023-10-21 06:31:44', '2023-10-21 06:31:44'),
(312, '#313552', 313, '2023-10-21 06:36:09', '2023-10-21 06:36:09'),
(313, '#f2f2ea', 314, '2023-10-21 06:38:15', '2023-10-21 06:38:15'),
(314, '#252326', 315, '2023-10-21 06:39:19', '2023-10-21 06:39:19'),
(315, '#e8e5de', 316, '2023-10-21 06:41:12', '2023-10-21 06:41:12'),
(316, '#2b2726', 317, '2023-10-21 06:42:56', '2023-10-21 06:42:56'),
(317, '#5c6560', 318, '2023-10-21 06:44:30', '2023-10-21 06:44:30'),
(318, '#ccbeb3', 319, '2023-10-21 06:45:37', '2023-10-21 06:45:37'),
(319, '#6d736f', 320, '2023-10-21 06:47:15', '2023-10-21 06:47:15'),
(320, '#f2efe8', 321, '2023-10-21 06:48:22', '2023-10-21 06:48:22'),
(321, '#151316', 322, '2023-10-21 06:49:48', '2023-10-21 06:49:48'),
(335, '#8b8b8b', 59, '2023-10-22 07:34:04', '2023-10-22 07:34:04'),
(336, '#2b7799', 59, '2023-10-22 07:35:25', '2023-10-22 07:35:25'),
(342, '#a6b574', 51, '2023-10-22 07:59:23', '2023-10-22 07:59:23'),
(343, '#bc8f8a', 51, '2023-10-22 08:00:31', '2023-10-22 08:00:31'),
(344, '#9285bd', 51, '2023-10-22 08:01:12', '2023-10-22 08:01:12'),
(345, '#1c9582', 49, '2023-10-22 08:02:54', '2023-10-22 08:02:54'),
(346, '#94415f', 49, '2023-10-22 08:04:02', '2023-10-22 08:04:02'),
(347, '#8b9519', 49, '2023-10-22 08:05:00', '2023-10-22 08:05:00'),
(349, '#794955', 61, '2023-10-22 08:11:15', '2023-10-22 08:11:15'),
(350, '#467960', 61, '2023-10-22 08:12:31', '2023-10-22 08:12:31'),
(351, '#3c5e5d', 64, '2023-10-22 08:14:57', '2023-10-22 08:14:57'),
(352, '#476e51', 64, '2023-10-22 08:15:43', '2023-10-22 08:15:43'),
(353, '#276677', 64, '2023-10-22 08:16:24', '2023-10-22 08:16:24'),
(354, '#1c1d1f', 323, '2023-10-29 18:45:51', '2023-10-29 18:45:51'),
(355, '#1c1d1f', 324, '2023-10-29 18:46:45', '2023-10-29 18:46:45'),
(356, '#1c1d1f', 325, '2023-10-29 18:47:28', '2023-10-29 18:47:28'),
(357, '#181c27', 326, '2023-10-29 18:48:56', '2023-10-29 18:48:56'),
(358, '#181c27', 327, '2023-10-29 18:49:38', '2023-10-29 18:49:38'),
(359, '#181c27', 328, '2023-10-29 18:50:23', '2023-10-29 18:50:23'),
(360, '#3f4032', 329, '2023-10-29 18:51:59', '2023-10-29 18:51:59'),
(361, 'Multi', 330, '2023-10-29 18:56:20', '2023-10-29 18:56:20'),
(362, 'Multi', 331, '2023-10-29 19:01:02', '2023-10-29 19:01:02'),
(363, '#8f9674', 332, '2023-10-29 19:07:35', '2023-10-29 19:07:35'),
(364, '#65333d', 333, '2023-10-29 19:22:48', '2023-10-29 19:22:48'),
(365, '#65333d', 334, '2023-10-29 19:22:55', '2023-10-29 19:22:55'),
(366, '#581a1f', 335, '2023-10-29 19:28:20', '2023-10-29 19:28:20'),
(367, '#4c5a49', 336, '2023-10-29 19:30:55', '2023-10-29 19:30:55'),
(368, '#d6d3d4', 337, '2023-10-29 19:31:59', '2023-10-29 19:31:59'),
(369, '#3a3637', 338, '2023-10-29 19:35:07', '2023-10-29 19:35:07'),
(370, '#5f5a42', 339, '2023-10-29 19:36:11', '2023-10-29 19:36:11'),
(371, '#386551', 340, '2023-10-29 19:39:40', '2023-10-29 19:39:40'),
(372, '#252527', 341, '2023-10-29 19:40:47', '2023-10-29 19:40:47'),
(373, '#924c32', 342, '2023-10-29 19:42:04', '2023-10-29 19:42:04'),
(374, '#be8c6f', 343, '2023-10-29 19:46:01', '2023-10-29 19:46:01'),
(375, '#111e2e', 344, '2023-10-29 19:47:36', '2023-10-29 19:47:36'),
(376, '#e7cbc2', 345, '2023-10-29 19:48:56', '2023-10-29 19:48:56'),
(377, '#e1ded9', 346, '2023-10-29 19:51:01', '2023-10-29 19:51:01'),
(378, '#d1cfd0', 347, '2023-10-29 19:52:07', '2023-10-29 19:52:07'),
(379, '#3c5044', 348, '2023-10-29 19:53:15', '2023-10-29 19:53:15'),
(380, '#efe8df', 349, '2023-10-29 19:54:30', '2023-10-29 19:54:30'),
(381, 'Multi', 350, '2023-10-29 19:58:57', '2023-10-29 19:58:57'),
(382, 'Multi', 351, '2023-10-29 19:59:29', '2023-10-29 19:59:29'),
(383, 'Multi', 352, '2023-10-29 20:00:08', '2023-10-29 20:00:08'),
(384, 'Multi', 353, '2023-10-29 20:00:41', '2023-10-29 20:00:41'),
(385, 'Multi', 354, '2023-10-29 20:01:21', '2023-10-29 20:01:21'),
(386, '#3d3a3f', 355, '2023-10-29 20:06:13', '2023-10-29 20:06:13'),
(387, '#1a1617', 356, '2023-10-29 20:08:41', '2023-10-29 20:08:41'),
(388, '#36353d', 357, '2023-10-29 20:09:36', '2023-10-29 20:09:36'),
(389, '#154f59', 358, '2023-10-29 20:10:32', '2023-10-29 20:10:32'),
(390, '#72755b', 359, '2023-10-29 20:11:29', '2023-10-29 20:11:29'),
(391, '#e4c6aa', 360, '2023-10-29 20:13:02', '2023-10-29 20:13:02'),
(392, '#c8b54e', 361, '2023-10-29 20:14:42', '2023-10-29 20:14:42'),
(393, '#29272a', 362, '2023-10-29 20:15:58', '2023-10-29 20:15:58'),
(394, '#29272a', 363, '2023-10-29 20:16:34', '2023-10-29 20:16:34'),
(395, '#353942', 364, '2023-10-29 20:18:52', '2023-10-29 20:18:52'),
(396, '#d99545', 365, '2023-10-29 20:19:56', '2023-10-29 20:19:56'),
(397, '#3f4045', 366, '2023-12-19 15:44:30', '2023-12-19 15:44:30'),
(399, '#222020', 368, '2023-12-19 16:12:26', '2023-12-19 16:12:26'),
(400, '#2d1a1d', 369, '2023-12-21 01:07:26', '2023-12-21 01:07:26'),
(406, '#b308e2', 372, '2024-01-11 16:49:05', '2024-01-11 16:49:05');

-- --------------------------------------------------------

--
-- Table structure for table `product_color_sizes`
--

CREATE TABLE `product_color_sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_size_id` bigint(20) UNSIGNED NOT NULL,
  `product_color_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_color_sizes`
--

INSERT INTO `product_color_sizes` (`id`, `product_size_id`, `product_color_id`, `quantity`, `image`, `created_at`, `updated_at`) VALUES
(7, 7, 7, 0, 'Product/Gu2r5QGECYFychN0IHNjb7lbU2KirDzpKqvMsSp4.png', '2023-10-12 09:02:56', '2023-10-12 09:02:56'),
(8, 8, 8, 5, 'Product/RR0dZp4VZMuByb3udfHKjZBwR7vlrIzUAHAkXURQ.png', '2023-10-12 09:06:02', '2023-10-12 09:06:02'),
(9, 9, 9, 3, 'Product/UyjTjB3J6bmP9EWHVwMY9YoJmKYRrKjo4TLeCXKq.png', '2023-10-12 09:09:16', '2023-10-12 09:09:16'),
(10, 10, 10, 6, 'Product/CPP4bkXtZHBJXpVlOZGWre5pXc2D7JBByE9X5fAj.png', '2023-10-12 09:11:35', '2023-10-12 09:11:35'),
(11, 11, 11, 4, 'Product/OJkeMH7LmZST2GdyTgIoUcmjZb6KL0dtpdf1H8N6.png', '2023-10-12 09:12:56', '2023-10-12 09:12:56'),
(12, 12, 12, 3, 'Product/hBgGfRz1TPOzTojrp3RYTmVJpwDleMYwamXo4uKv.png', '2023-10-12 09:16:56', '2023-10-12 09:16:56'),
(13, 13, 13, 6, 'Product/RzCseZeXSmJHq3GpxFVi2ZMZyJCbcFulRf8AoUpb.png', '2023-10-12 09:21:35', '2023-10-12 09:21:35'),
(14, 14, 14, 5, 'Product/kOZ2HMUhbkkoeLVDh09picbBjX5uLbnJA9AfqWiX.png', '2023-10-12 09:29:16', '2023-10-12 09:29:16'),
(15, 15, 15, 5, 'Product/koyZLT8wMV5poqlK3DWCVSHOaaNiCZUbFtscos8N.png', '2023-10-12 09:38:25', '2023-10-12 09:38:25'),
(16, 16, 16, 5, 'Product/n63Qc6xgjydRtbMVBNBzfA6xcH14IVXYSSDCEfR0.png', '2023-10-12 09:41:19', '2023-10-12 09:41:19'),
(17, 17, 17, 5, 'Product/9U6XsW5C9LmhXxcPc9or6EtyodT6ffqi8h6GvQ0o.png', '2023-10-12 09:44:26', '2023-10-12 09:44:26'),
(18, 18, 18, 5, 'Product/nquIgrLuwXO1nwkNQjWGiPHdShBbR3Q4MqRgz2qc.png', '2023-10-12 09:49:03', '2023-10-12 09:49:03'),
(19, 19, 19, 5, 'Product/ECQiivRGKYoxaNGnedhWArnb9BEUtg7Hc40gk3CE.png', '2023-10-12 09:51:51', '2023-10-12 09:51:51'),
(20, 20, 20, 5, 'Product/c46UVDEeiAOoLX4D4pUziCuGuG7RBDmLet2grfEI.png', '2023-10-12 09:56:19', '2023-10-12 09:56:19'),
(21, 21, 21, 5, 'Product/HWtCGSc5iDzprY0knEpO1x3ZB9mYgxPfznbfJko2.png', '2023-10-12 09:59:32', '2023-10-12 09:59:32'),
(22, 22, 22, 4, 'Product/PRuEhtCiDalh3Y1JUkzoImJVf7NTK88xGWXcPW7a.png', '2023-10-12 10:05:20', '2023-10-12 10:05:20'),
(23, 23, 23, 4, 'Product/5xYQ62YiQcYFtdC9qK8hjdCX9kHAF4D3gNQQ4vxf.png', '2023-10-12 10:09:06', '2023-10-12 10:09:06'),
(24, 24, 24, 4, 'Product/mnBT8tSzflA8JwcYTC68Ov8d72MJvwDAZeQfuSP4.png', '2023-10-12 10:11:34', '2023-10-12 10:11:34'),
(25, 25, 25, 4, 'Product/pRfEg1m6sIckdFvA68l0a92Y4ZRmXdt4dXcQcwYE.png', '2023-10-12 10:13:47', '2023-10-12 10:13:47'),
(26, 26, 26, 4, 'Product/1KMANkFuU4el6fuGBz3WYWXLmsVEHs812WIx0q8u.png', '2023-10-12 10:40:06', '2023-10-12 10:40:06'),
(30, 30, 30, 6, 'Product/5UISaWj3ExdC9kYsdNJYXi9J4A0oibL48GherqVf.png', '2023-10-12 10:47:14', '2023-10-12 10:47:14'),
(31, 31, 31, 6, 'Product/h8ezpXaNznZ0ktKZeSjoPIhXQAavKCc5nKg4Jzgj.png', '2023-10-12 10:53:31', '2023-10-12 10:53:31'),
(32, 32, 32, 6, 'Product/k4DuR22ndX9Y4SFTGQKWiYClXPwHb0NWs3Be00dh.png', '2023-10-12 10:55:42', '2023-10-12 10:55:42'),
(33, 33, 33, 6, 'Product/9hR9QtcU38TKEU94Ryr3FAE4g4x33cGhZLCdVV6Z.png', '2023-10-12 10:56:54', '2023-10-12 10:56:54'),
(34, 34, 34, 6, 'Product/xa2NtKLvHfphTslOHfIlPzQmyvdrbQDDBzYnTzns.png', '2023-10-12 10:57:44', '2023-10-12 10:57:44'),
(39, 39, 39, 5, 'Woman Product/24c2yiHcgwKs3WfeccCEUiwXPdr1Ut9TqcSQet2z.png', '2023-10-12 12:17:11', '2023-10-12 12:17:11'),
(40, 40, 40, 5, 'Woman Product/2Gu6KZTb9SdAkCrzslV14IxWkNqSPhfXZwyXnQ4c.png', '2023-10-12 12:19:02', '2023-10-12 12:19:02'),
(42, 42, 42, 5, 'Woman Product/KQxd7Ujkarg16kEgWzhgFAvLceZT1e89hIoIx8Ln.png', '2023-10-12 12:20:55', '2023-10-12 12:20:55'),
(43, 43, 43, 3, 'Woman Product/aaqoGsw9geORysrvaCRLHVNgbLxLpjdhBphpkFqo.png', '2023-10-12 12:30:17', '2023-10-12 12:30:17'),
(44, 44, 44, 3, 'Woman Product/yVrdQIZf6dmoWOT9H488G7OaDaB3UGoCm6MBhZO5.png', '2023-10-12 12:32:35', '2023-10-12 12:32:35'),
(45, 45, 45, 3, 'Woman Product/AmNbGB4qIUr48PhThqbNJupFMaKD9ez5QdRMCTvM.png', '2023-10-12 12:34:26', '2023-10-12 12:34:26'),
(46, 46, 46, 3, 'Woman Product/jlxMNNsddRMEsQuP4G8c4aTlbPj43HfFayCzdN5D.png', '2023-10-12 12:35:56', '2023-10-12 12:35:56'),
(47, 47, 47, 3, 'Woman Product/yOWXAowAFqV9afriNyzLybfFXHGt90iInG6NXdNu.png', '2023-10-12 12:39:50', '2023-10-12 12:39:50'),
(48, 48, 48, 3, 'Woman Product/L2s8KN78sN8dH7TqMJy38oRfziC8qQOOLvhhWjA1.png', '2023-10-12 12:42:03', '2023-10-12 12:42:03'),
(49, 49, 49, 3, 'Woman Product/B6VmwVFDY1IVF9a5LTR3Lsdt60FcazJvsIFpSOvf.png', '2023-10-12 12:43:14', '2023-10-12 12:43:14'),
(50, 50, 50, 3, 'Woman Product/szCIgYhtwtQOf0MteEDhc2IFCmtZlzDm7CvFlmbc.png', '2023-10-12 12:44:56', '2023-10-12 12:44:56'),
(51, 51, 51, 3, 'Woman Product/i6r2OsfmyCLjvEDoKn6XgVgXdjt8daIkBcxycjnu.png', '2023-10-12 12:46:13', '2023-10-12 12:46:13'),
(52, 52, 52, 7, 'Woman Product/7YvX7VufbpjKX8rc0EdLNa4G7ZMJlBU4dPDO4hMP.png', '2023-10-12 12:58:12', '2023-10-12 12:58:12'),
(53, 53, 53, 4, 'Woman Product/QMlwpFYIYZKxfe8SQTy6b5ufleA6J1UgYR7gizHW.png', '2023-10-12 13:02:29', '2024-01-20 00:59:51'),
(54, 54, 54, 7, 'Woman Product/Y8ZBn8RfcSMgFU710iB1ruETJf1ZpI5nQKFWWoNL.png', '2023-10-12 13:04:54', '2023-10-12 13:04:54'),
(55, 55, 55, 7, 'Woman Product/EjnUTxamgIq8zSTU8w5FqfLjCf7tKQpPSAiSyKsx.png', '2023-10-12 13:06:59', '2023-10-12 13:06:59'),
(57, 57, 57, 7, 'Woman Product/JYO4PNRk0UB2iPacebnhi5KGXHbHpMmidl44SZJ0.png', '2023-10-12 13:13:07', '2023-10-12 13:13:07'),
(58, 58, 58, 7, 'Woman Product/XTELxq3FdT8xICGex7UcdGstGBgZnWq6aUzTi5an.png', '2023-10-12 13:14:15', '2023-10-12 13:14:15'),
(59, 59, 59, 7, 'Woman Product/xztvvKqrBa30Yi9NZOxDuYShoqQRiar4ANRyaSAs.png', '2023-10-12 13:20:11', '2023-10-12 13:20:11'),
(61, 61, 61, 4, 'Woman Product/5fZnMhcC3dQqK70saZhl5qp0ggTevhP77w7LezMR.png', '2023-10-12 13:31:59', '2023-10-12 13:31:59'),
(62, 62, 62, 4, 'Woman Product/Zm5duDlR2RYeSUNhVw7NYQuH8MuO0lQp44owgTkK.png', '2023-10-12 13:32:46', '2023-10-12 13:32:46'),
(63, 63, 63, 4, 'Woman Product/aAtortdQDWecBZwLMsAGLg5AgQ3rFmg3Cl2mQ8RN.png', '2023-10-12 13:33:43', '2023-10-12 13:33:43'),
(64, 64, 64, 4, 'Woman Product/tEBIa9whNC1DXe2Um9PMDLGm3wuX9eKX4aEo6aAR.png', '2023-10-12 13:35:43', '2023-10-12 13:35:43'),
(66, 66, 66, 4, 'Mackup Product/R6WzEFHip4vxxJ0r0wotFRMY6hb8i5p5hHGWuozv.png', '2023-10-12 13:50:45', '2023-10-12 13:50:45'),
(67, 67, 67, 4, 'Mackup Product/3tIYfWkK8Gy2JoXjMhYO6KkOwXVvVJi6x36iGjxm.png', '2023-10-12 13:52:59', '2023-10-12 13:52:59'),
(68, 68, 68, 4, 'Mackup Product/Pu5GRdeoZMARi2WAQnwdBCRJd4Py4tnHPFwcMSu5.png', '2023-10-12 13:54:11', '2023-10-12 13:54:11'),
(69, 69, 69, 4, 'Mackup Product/G2r4teOyVajxhwtF6WRnErIYgiB5dSZbZ3wv7NsI.png', '2023-10-12 13:56:12', '2023-10-12 13:56:12'),
(70, 70, 70, 4, 'Mackup Product/ZY1U57CU287BqGBmPMwIhOWGBHzQeFmwxzlvg3xW.png', '2023-10-12 14:01:09', '2023-10-12 14:01:09'),
(71, 71, 71, 4, 'Mackup Product/6TTxm7xXkF6SKdZ99gBPU3rf6d75sSL54GJIOiE4.png', '2023-10-12 14:03:09', '2023-10-12 14:03:09'),
(72, 72, 72, 4, 'Mackup Product/UAcqjDYhrNYIOmn4K4zMQcWh3Fx8kpSifAN8bBNn.png', '2023-10-12 14:04:43', '2023-10-12 14:04:43'),
(73, 73, 73, 4, 'Mackup Product/7rSUcVBZ5zVJOuqV8SQNBhMU1t0pfneJ8GPljseD.png', '2023-10-12 14:06:00', '2023-10-12 14:06:00'),
(74, 74, 74, 4, 'Mackup Product/g128cfYnu98BIMJqa1FiLg2uOAVxXPn1HwuoLo0F.png', '2023-10-12 14:08:34', '2023-10-12 14:08:34'),
(75, 75, 75, 4, 'Mackup Product/hVxNLnRbXPHqXWTRPv3QC00qQbIRon0Fd6jxy5yt.png', '2023-10-12 14:09:28', '2023-10-12 14:09:28'),
(76, 76, 76, 4, 'Mackup Product/Q9koTQX754go6hjJWX8SalP7MAQjC6ypoHds1PpA.png', '2023-10-12 14:10:41', '2023-10-12 14:10:41'),
(77, 77, 77, 4, 'Mackup Product/gRza1MOJUYDBx5piTHtBiJLeGWtfUyJJyZwFvC6C.png', '2023-10-12 14:11:47', '2023-10-12 14:11:47'),
(78, 78, 78, 4, 'Mackup Product/UN7UKrtggIwr7Ph8maGY3Jgx7PsGHG6GzyVPAzB5.png', '2023-10-12 14:14:22', '2023-10-12 14:14:22'),
(79, 79, 79, 4, 'Mackup Product/wjH4lYLIaS38UqduhgFbFmAt90tVdCvOoaZr1rlw.png', '2023-10-12 14:16:22', '2023-10-12 14:16:22'),
(80, 80, 80, 1, 'Mackup Product/A2EupK2C9NPUnZRPhe12XCP0i0TvBpmb8TIKjB1G.png', '2023-10-12 14:18:48', '2024-02-04 18:29:45'),
(81, 81, 81, 4, 'Mackup Product/vJV1omWu3MGNsd1uhMTjPJQspaMEgbDKVEn5xz9t.png', '2023-10-12 14:20:00', '2023-10-12 14:20:00'),
(82, 82, 82, 4, 'Mackup Product/NIMruyou9SHvde4Loeb9fXHF92Y9UVM9erbX3dkp.png', '2023-10-12 14:21:22', '2023-10-12 14:21:22'),
(83, 83, 83, 4, 'Mackup Product/BttDo6kbFINhruLpnXmEGeddN4QOBIRQobetmMRr.png', '2023-10-12 14:25:45', '2023-10-12 14:25:45'),
(84, 84, 84, 3, 'Mackup Product/fwkkGnXKnsjum9Bdo7Gi1LoXrb152SZtshwZFRxg.png', '2023-10-12 14:35:25', '2023-10-12 14:35:25'),
(85, 85, 85, 7, 'Mackup Product/7Z6lAPGsC8gNgddRpWCChMBdOxzM3RIXWgYgkJNG.png', '2023-10-12 14:36:24', '2023-10-12 14:36:24'),
(86, 86, 86, 8, 'Mackup Product/ZF582anN1s0fXnrsu6it0LnlqNAoHsji5kX1Tww5.png', '2023-10-12 14:37:25', '2023-10-12 14:37:25'),
(87, 87, 87, 8, 'Mackup Product/75jGFvSIVH4Hg6ehYMxbra7VSiPGw3FLcajfNbqT.png', '2023-10-12 15:52:46', '2023-10-12 15:52:46'),
(88, 88, 88, 4, 'Mackup Product/jZCiTaxrhbHEjOX6tZ9R64OUkUN1boFDHEsX226N.png', '2023-10-12 15:53:21', '2023-10-12 15:53:21'),
(89, 89, 89, 4, 'Mackup Product/bBNhcyjsIfQCiLzUMCE6xGXHPX3Vc8hX4BvUA8ol.png', '2023-10-12 15:54:20', '2023-10-12 15:54:20'),
(90, 90, 90, 4, 'Mackup Product/WyRuiMKJtkuiVA1w3fUz1aRVJHasVtPY6oqJy3hP.png', '2023-10-12 15:55:24', '2023-10-12 15:55:24'),
(91, 91, 91, 4, 'Mackup Product/sspwHDMamtxXTPNk88ptRAQcC5G6cnPXpBnA9iaX.png', '2023-10-12 15:56:02', '2023-10-12 15:56:02'),
(92, 92, 92, 4, 'Mackup Product/pu30cliKBBEz8kLjT5J88S7Gbcn2zYNrJB4aeHim.png', '2023-10-12 15:57:03', '2023-10-12 15:57:03'),
(93, 93, 93, 4, 'Mackup Product/qQuEOlMKf83aPVdPHMm89kzmmX1qWDy60OjqLjAF.png', '2023-10-12 15:57:40', '2023-10-12 15:57:40'),
(94, 94, 94, 4, 'Mackup Product/PNJ90EldnuHq5FWjVa0ksk2aOU05PspJqoGUCQyI.png', '2023-10-12 15:58:07', '2023-10-12 15:58:07'),
(95, 95, 95, 4, 'Mackup Product/j3kvz7Lu8kE0gVZbSZRAPAQcYeXNRmFvjCUyN9GS.png', '2023-10-12 15:59:45', '2023-10-12 15:59:45'),
(96, 96, 96, 4, 'Mackup Product/30NWdqXG9ZBRDcAemCJrzpKnhOQK6RRs3Z213kZk.png', '2023-10-12 16:00:22', '2023-10-12 16:00:22'),
(97, 97, 97, 4, 'Mackup Product/qTMCopmOvsNCPMZcW6c7dHpHq9Agidba6yRRZeiz.png', '2023-10-12 16:01:21', '2023-10-12 16:01:21'),
(98, 98, 98, 4, 'Mackup Product/gcYCIJbd2ZA3H0tMAe8yYiQ9We1WG1oTmEsKxIPn.png', '2023-10-12 16:02:00', '2023-10-12 16:02:00'),
(99, 99, 99, 4, 'Mackup Product/1QxLU8a5qSCfjTLT0H9G3Rv7LDvyDT00b1Gz5AIT.png', '2023-10-12 16:02:31', '2023-10-12 16:02:31'),
(100, 100, 100, 4, 'Mackup Product/toXEp81GkOFtbGD0I3YhF1lA3HBNk10NXy9PBfq3.png', '2023-10-12 16:03:55', '2023-10-12 16:03:55'),
(101, 101, 101, 4, 'Mackup Product/FoOC6dZk1J0cXYQP2BKpSm0gahd0tVMO8k3RcXVs.png', '2023-10-12 16:04:26', '2023-10-12 16:04:26'),
(102, 102, 102, 4, 'Mackup Product/1U8hacRicMJZC0fZXggF28a4lj8okhtNES8RtrWe.png', '2023-10-12 16:04:56', '2023-10-12 16:04:56'),
(103, 103, 103, 4, 'Mackup Product/z9osMNtRU7AiHzYZ36SMTZFB2R9onBjy4oxdxRgS.png', '2023-10-12 16:05:26', '2023-10-12 16:05:26'),
(104, 104, 104, 4, 'Mackup Product/J7OgTalDmyQVbKMekOLg9tINnVrLJwdmcKNF8emy.png', '2023-10-12 16:05:59', '2023-10-12 16:05:59'),
(105, 105, 105, 2, 'Mackup Product/9X5aZTLEDS7OVCWhWAEzVhk6AuDoSrfBnoyNSwyD.png', '2023-10-12 16:06:54', '2024-01-30 19:40:33'),
(106, 106, 106, 4, 'Mackup Product/H0yWiqPrapraN5pLdlnXXhNIToo15Yua2Uzj8gUV.png', '2023-10-12 16:07:26', '2023-10-12 16:07:26'),
(107, 107, 107, 4, 'Mackup Product/XkJtA168NjD4GPiQWMkvymXEjJ7Ve4R6wNddMo1r.png', '2023-10-12 16:08:38', '2023-10-12 16:08:38'),
(108, 108, 108, 4, 'Accessories/PMFnlgyg5amleoAfXideMUEn3ILiZ16VEpjaCUKL.png', '2023-10-15 15:08:18', '2023-10-15 15:08:18'),
(109, 109, 109, 4, 'Accessories/4NPp3qyE8dFXu6krHY1WzaYMkv7ZVqAPE0EwjDQM.png', '2023-10-15 15:10:15', '2023-10-15 15:10:15'),
(110, 110, 110, 1, 'Accessories/GBsE5e8Qcpv8L1XUpKsjqHSQzlxCAl7f8fqDQGGR.png', '2023-10-15 15:10:50', '2024-02-01 03:08:51'),
(111, 111, 111, 4, 'Accessories/sAO9J1zSFfVyUIQC8Ur90ENmpt8RLfTruJK2Ddhc.png', '2023-10-15 15:11:21', '2023-10-15 15:11:21'),
(112, 112, 112, 4, 'Accessories/08kNPSdCZnyEtU727A7U7DcdNm8gJbiwpzWjJ10i.png', '2023-10-15 15:12:26', '2023-10-15 15:12:26'),
(113, 113, 113, 4, 'Accessories/Pdr5LG3b9mgAuOLgSSIyjFL6aKbT3Bdg18dOWWG8.png', '2023-10-15 15:12:56', '2023-10-15 15:12:56'),
(114, 114, 114, 4, 'Accessories/bVjCgb9dMYqud1FKpFVtGUoBNNl9Evp6nJgweDy0.png', '2023-10-15 15:13:26', '2023-10-15 15:13:26'),
(115, 115, 115, 4, 'Accessories/TBwouEDiMXxmbAyVN7fUISMn9JoixOiKoRtA2Bmq.png', '2023-10-15 15:15:01', '2023-10-15 15:15:01'),
(116, 116, 116, 4, 'Accessories/RzDvTNAlryXBwdTjavkQTUAifoh97gkqV63OEO35.png', '2023-10-15 15:15:33', '2023-10-15 15:15:33'),
(117, 117, 117, 4, 'Accessories/oAoniUhViQ2wkLIb5Hg5tyPTGLPXl72uvDWaYQIs.png', '2023-10-15 15:16:53', '2023-10-15 15:16:53'),
(118, 118, 118, 4, 'Accessories/xscunqgnk4IPxViKxDxBarAOBCdEAgMt7yEjHTuv.png', '2023-10-15 15:17:24', '2023-10-15 15:17:24'),
(119, 119, 119, 4, 'Accessories/U1xzTUzhmRSkvb7QyJjZyGpIDrOOtZ8G5dfXSHjq.png', '2023-10-15 15:18:05', '2023-10-15 15:18:05'),
(120, 120, 120, 2, 'Accessories/u5Gxsf3naMhY0KJz07p8FDH2p9tCNwewOENHjtLl.png', '2023-10-15 15:18:55', '2024-01-30 12:44:36'),
(121, 121, 121, 4, 'Accessories/IMAQ3bhfS6ofQgC8MMkQb4clmBubjWOEWwQrq1y0.png', '2023-10-15 15:20:09', '2023-10-15 15:20:09'),
(122, 122, 122, 4, 'Accessories/UyNCjDlTjkabmBMXFbxavZuR0U3ZVpi21vTi9g70.png', '2023-10-15 15:21:08', '2023-10-15 15:21:08'),
(123, 123, 123, 4, 'Accessories/qI89usklP13D2hQzl9ipmCYF9UZALdZwBQHsm1IU.png', '2023-10-15 15:21:51', '2023-10-15 15:21:51'),
(124, 124, 124, 4, 'Accessories/Tz5oc6cCvuewSGmtYRebFu11TLbYl7bz1RYWgsJx.png', '2023-10-15 15:22:34', '2023-10-15 15:22:34'),
(125, 125, 125, 5, 'Accessories/Z9zIzLMgZNKY3n44Nin52j02Td9wJyeYvynLdGJS.png', '2023-10-15 19:10:59', '2023-10-15 19:10:59'),
(126, 126, 126, 5, 'Accessories/yNb2ZIS5VDIZI0vZURAWxfA5T2ei5tag73bBmQXH.png', '2023-10-15 19:11:45', '2023-10-15 19:11:45'),
(127, 127, 127, 5, 'Accessories/l8E6RKNMOnGfLmuT6DBJd6MHczY6BTpiCaDCcLWq.png', '2023-10-15 19:12:18', '2023-10-15 19:12:18'),
(128, 128, 128, 5, 'Accessories/pNXLL4I7ZzVp0A296BqhsQh8YNHgXRCa50fSDkQv.png', '2023-10-15 19:12:44', '2023-10-15 19:12:44'),
(129, 129, 129, 5, 'Accessories/10ENQRwcnZr8FQrrju0BdiBROy171lDlZXoDucn7.png', '2023-10-15 19:13:13', '2023-10-15 19:13:13'),
(130, 130, 130, 5, 'Accessories/gtkoiHQT55Dyf6pwrPLUYOwadv6UQQziINyUHKf4.png', '2023-10-15 19:14:24', '2023-10-15 19:14:24'),
(131, 131, 131, 5, 'Accessories/w50bhhMeOw6BtrxfdNS2BpiuCec9QbsgOHH7QvB2.png', '2023-10-15 19:15:00', '2023-10-15 19:15:00'),
(132, 132, 132, 5, 'Accessories/IOGSWH5e4QPunxV847kL8nnqPii3Ebs1DRticHjC.png', '2023-10-15 19:15:38', '2023-10-15 19:15:38'),
(133, 133, 133, 5, 'Accessories/sgvusGGEc17PtK7AelDr4zJQrWO7Olc5KWAPfrQO.png', '2023-10-15 19:16:18', '2023-10-15 19:16:18'),
(134, 134, 134, 5, 'Accessories/a0DA82Mxlk2KsGVCpWk3SycwkSxWfgzjtjH0yxK3.png', '2023-10-15 19:16:57', '2023-10-15 19:16:57'),
(135, 135, 135, 5, 'Accessories/PV3M1qW0F9YlOUaba9YInXYKMstfbqLd8FmgBDG7.png', '2023-10-15 19:17:33', '2023-10-15 19:17:33'),
(136, 136, 136, 5, 'Accessories/SGepNxVVSJcMuxvnESZZe85VdmSRXLVzD923u5uG.png', '2023-10-15 19:18:03', '2023-10-15 19:18:03'),
(137, 137, 137, 5, 'Accessories/K25pMoTvmVsHzQ4LJCjdJoPUpcOMbGJbvqoNh6Kz.png', '2023-10-15 19:18:43', '2023-10-15 19:18:43'),
(138, 138, 138, 5, 'Accessories/SDSdbl3RHNO47mGoElYuhtGrxTzurbLC0cEUKtN6.png', '2023-10-15 19:19:20', '2023-10-15 19:19:20'),
(139, 139, 139, 5, 'Accessories/o5xYHOgkN7zlfOFd8eL4qBZNvQNvMnakKiy6Feur.png', '2023-10-15 19:19:55', '2023-10-15 19:19:55'),
(140, 140, 140, 5, 'Accessories/mndueHJzirHPWamhq4WNMWGGVjGvEJ6fblSKDrhd.png', '2023-10-15 19:20:23', '2023-10-15 19:20:23'),
(141, 141, 141, 5, 'Accessories/YfegwloUtUvbHYkraIwFlI1X5loZK6VX9pzk8oqx.png', '2023-10-15 19:23:34', '2023-10-15 19:23:34'),
(142, 142, 142, 7, 'Accessories/jy6xPZ4oT4BxBprWGKUjDySWtYF9TQ5oZsbsWJSS.png', '2023-10-15 19:25:55', '2023-10-15 19:25:55'),
(143, 143, 143, 7, 'Accessories/g6yRYtMPFrEEG9PXNPRvZHIpvbG3CJMQXNxEcmOb.png', '2023-10-15 19:27:26', '2023-10-15 19:27:26'),
(144, 144, 144, 7, 'Accessories/5370VRm2l2eplAqXpYiNeuzVva1pNiLbyiSArW9G.png', '2023-10-15 19:28:10', '2023-10-15 19:28:10'),
(145, 145, 145, 7, 'Accessories/1k7hPuGNXDPO30G3faDdismbWCONWSdjIxv7SgRf.png', '2023-10-15 19:28:44', '2023-10-15 19:28:44'),
(146, 146, 146, 6, 'Accessories/IPjzY7GAa62hAlx3oU6X3YiADOgOhdlw48qvdYeU.png', '2023-10-15 19:29:26', '2024-02-01 03:04:44'),
(147, 147, 147, 7, 'Accessories/iUrL7to69nZD7xD0HXUtw0zqvTBKWLEIeMqWXyQu.png', '2023-10-15 19:30:06', '2023-10-15 19:30:06'),
(148, 148, 148, 7, 'Accessories/lj2A2D85ELsljfL5fwFqLB4u3Nirx0GhlQZvmWYk.png', '2023-10-15 19:30:53', '2023-10-15 19:30:53'),
(149, 149, 149, 7, 'Accessories/SPbX0H9XQIIRW5cTsOKPLrv6D73Wr6gohqOWneKp.png', '2023-10-15 19:32:15', '2023-10-15 19:32:15'),
(150, 150, 150, 7, 'Accessories/eO6pHFiZuuzlChh23dyUtRlipxpQY9mfQgUrOVhL.png', '2023-10-15 19:33:04', '2023-10-15 19:33:04'),
(151, 151, 151, 7, 'Accessories/TAWB5YQMyafd8httl0nXvhBHt9UdpEuB5WkcRRKV.png', '2023-10-15 19:33:38', '2023-10-15 19:33:38'),
(152, 152, 152, 7, 'Accessories/l8ejQLzOEEzW7rOYQ5xrnWPEHoWLq3pagnq91f4a.png', '2023-10-15 19:34:11', '2023-10-15 19:34:11'),
(153, 153, 153, 7, 'Accessories/EmMSoVSTsaQYGhoBMHHZe8izkMZk6Pfd8ELVfCHY.png', '2023-10-15 19:34:55', '2023-10-15 19:34:55'),
(154, 154, 154, 7, 'Accessories/mHxoLVFJLz8ty0H7y3sDH2gxZJnTBD5ZbblujQ3C.png', '2023-10-15 19:35:25', '2023-10-15 19:35:25'),
(155, 155, 155, 4, 'Accessories/lVcGg6ovf8wUUybXX7ce7jrRsOXUeCIpylnchy0u.png', '2023-10-15 19:38:43', '2023-10-15 19:38:43'),
(157, 157, 157, 2, 'Accessories/uIn6fnelY3YnIqRAU7kuIYjeoV98SrHgGyNbL8PJ.png', '2023-10-15 19:42:07', '2024-01-30 12:33:07'),
(159, 159, 159, 4, 'Accessories/PvOM3W38vE1TpZQOHqzI7MsUfjzPhG6PQHyGGro9.png', '2023-10-15 19:44:58', '2023-10-15 19:44:58'),
(160, 160, 160, 4, 'Accessories/JwlpQ5L82DbRgTlQfVHKVDk611EjXEArIdNdypSp.png', '2023-10-15 19:48:18', '2023-10-15 19:48:18'),
(161, 161, 161, 10, 'Accessories/g4V7ay9VtI6lhbqYS4EAYNbBVhnHD9cWACVPaSiA.png', '2023-10-15 19:50:26', '2023-10-15 19:50:26'),
(162, 162, 162, 9, 'Accessories/L7sW1wDUuxa4dP9Bsm4ug29uXjMKbJmUpjrTl2Ed.png', '2023-10-15 19:50:56', '2024-01-30 20:19:40'),
(164, 164, 164, 10, 'Accessories/QinfhqWfEAzt5APC4Ss5yyDf0oqORdUSJTCRWsld.png', '2023-10-15 19:52:03', '2023-10-15 19:52:03'),
(165, 165, 165, 10, 'Accessories/cbjPpBTN6joyRr6nUxNvt97ok4JjK7ZS8xoahMOk.png', '2023-10-15 19:52:38', '2023-10-15 19:52:38'),
(166, 166, 166, 10, 'Accessories/vxnUIV8YRiwCzczznyhK3atE8ZJeWSfIOzJ7oE4y.png', '2023-10-15 19:53:08', '2023-10-15 19:53:08'),
(167, 167, 167, 10, 'Accessories/wkYr0yAujZ99mJHlqzUXlCDE1ovbdqIr4em6hnhX.png', '2023-10-15 19:54:02', '2023-10-15 19:54:02'),
(168, 168, 168, 10, 'Accessories/nrSgeiehlkW5re0jlDZZi5jrPuQcIquHilPj0x7D.png', '2023-10-15 19:54:51', '2023-10-15 19:54:51'),
(169, 169, 169, 10, 'Accessories/Mt5dH1wuDYgY4HPDPWscWtUkC7EL0ibr2c6m80IS.png', '2023-10-15 19:55:24', '2023-10-15 19:55:24'),
(170, 170, 170, 4, 'Kids/sXvDN2ksUMsa45uCTeJZdlfWPUwYXOhtFZCGr270.png', '2023-10-15 20:56:33', '2023-10-15 20:56:33'),
(173, 173, 173, 5, 'Kids/ALtwVOms1U0w58ZEEGGxwCaQev2khxaVtEwqSNvE.png', '2023-10-15 21:01:45', '2023-10-15 21:01:45'),
(174, 174, 174, 5, 'Kids/NtMgecR26fpFFa4UMX5gJWoQvdHjgaFW5dpqJg34.png', '2023-10-15 21:02:38', '2023-10-15 21:02:38'),
(175, 175, 175, 3, 'Kids/18mEPDEdsAWvEESziI6Dbhg2Xr0hFJFqNU9jYrh4.png', '2023-10-15 21:03:41', '2024-01-30 19:40:32'),
(178, 178, 178, 5, 'Accessories/y0AixYgk26GUxvLZKOVwjcgnlY6WWwhUPYH8sWQ1.png', '2023-10-16 16:51:03', '2023-10-16 16:51:03'),
(179, 179, 179, 5, 'Accessories/XL76EDyseVxo6b1jhHYlUxkZSFuNpSN5SR1JcZpi.png', '2023-10-16 16:51:40', '2023-10-16 16:51:40'),
(180, 180, 180, 5, 'Accessories/G8RBvuVJ3s8HNd72BeipAtBOwH5gTs6I4BrbaPCc.png', '2023-10-16 16:52:28', '2023-10-16 16:52:28'),
(181, 181, 181, 5, 'Accessories/9d9vI0lffxRgxyHHYPkAvNkzfKhjk1d0pghljZS7.png', '2023-10-16 16:53:31', '2023-10-16 16:53:31'),
(182, 182, 182, 5, 'Accessories/dA6DhsKOve8HcwxmXk708xzfTaPSI9QwbkGHS21Y.png', '2023-10-16 16:54:16', '2023-10-16 16:54:16'),
(183, 183, 183, 5, 'Accessories/whuIJgxgy0vmSgAQ88kk4MpkUttpM2NYXDuc8OTv.png', '2023-10-16 16:55:00', '2023-10-16 16:55:00'),
(184, 184, 184, 5, 'Accessories/Kr7TEgWATqa5lcsdD3h7G5WJaWdYyHDXhJubMB5i.png', '2023-10-16 16:55:55', '2023-10-16 16:55:55'),
(185, 185, 185, 6, 'Accessories/g4x8yDjuOfAyfQAHmX7etcUoEne2wVRM7Mf77HJf.png', '2023-10-16 17:07:09', '2023-10-16 17:07:09'),
(186, 186, 186, 6, 'Accessories/ECiriqng405KoAqj1a9HX4adBir7DT1la6OAJwAU.png', '2023-10-16 17:07:56', '2023-10-16 17:07:56'),
(187, 187, 187, 6, 'Accessories/901BvYsv7NB53amAmnjWe5XLhuOZfzhvrT2q6WCe.png', '2023-10-16 17:08:47', '2023-10-16 17:08:47'),
(188, 188, 188, 6, 'Accessories/MzYHmcMOdXHYh46W8XQ2SE2uwoGJhZH7iBjogvrO.png', '2023-10-16 17:10:43', '2023-10-16 17:10:43'),
(189, 189, 189, 6, 'Accessories/RDv3AzGbEH6TZe0blPRdLojLAGHMn9wwEx0Q6rkQ.png', '2023-10-16 17:12:05', '2023-10-16 17:12:05'),
(190, 190, 190, 6, 'Accessories/5LYXgr1vRqYD1456fHxXcNOec4suxsNwi1DIKVpK.png', '2023-10-16 17:15:02', '2023-10-16 17:15:02'),
(191, 191, 191, 6, 'Accessories/3m7VaqPJTpXRsgLl9X5Q9FsKfcdnQBbkJMlOAJID.png', '2023-10-16 17:18:11', '2023-10-16 17:18:11'),
(192, 192, 192, 6, 'Accessories/SQfIOh1mpbNtKRYG9CsvYf4L5avHrYZO8dJZ28dG.png', '2023-10-16 17:28:48', '2023-10-16 17:28:48'),
(193, 193, 193, 6, 'Accessories/cnKtASl2P4BoCxnmq5e4xHfWq7HTvyv1rGnmNF45.png', '2023-10-16 17:29:32', '2023-10-16 17:29:32'),
(194, 194, 194, 6, 'Accessories/bCEoRysqQ1wyhIH1qo2sMeLDP8cjsDg6JlmXl2iE.png', '2023-10-16 17:31:40', '2023-10-16 17:31:40'),
(195, 195, 195, 6, 'Accessories/COjmkBKF6RqZSADU0lb5g6JuXDTLWdqhAy7qOc5D.png', '2023-10-16 17:32:11', '2023-10-16 17:32:11'),
(196, 196, 196, 6, 'Accessories/ifoTbRdqAEhfN3ysYgzdGReMt0Mosc9MufLQZEz1.png', '2023-10-16 17:32:48', '2023-10-16 17:32:48'),
(197, 197, 197, 6, 'Accessories/8sXhITl1pIsOVIL6SuVQVAcAvAq5WRDdHb0f5Xmy.png', '2023-10-16 17:33:19', '2023-10-16 17:33:19'),
(198, 198, 198, 6, 'Accessories/TfwDJoL6whsqLfMEnuP1L0HQpaYcOOtM1GfNwVlT.png', '2023-10-16 17:33:54', '2023-10-16 17:33:54'),
(199, 199, 199, 5, 'Accessories/Sf6aMOFJzoKzvy32e3BV0sG1WEPM5SMpNH8B64ft.png', '2023-10-16 17:40:08', '2023-10-16 17:40:08'),
(200, 200, 200, 4, 'Accessories/imDpoqfUtEGlOSAdwEB6XHuE1v80nd6bKYMtwSr6.png', '2023-10-16 17:42:28', '2024-01-30 12:44:37'),
(201, 201, 201, 5, 'Accessories/DWdzU2aAGTlnjZXrQ927vV2bHJvmYsCKsg8EG6jY.png', '2023-10-16 17:47:23', '2023-10-16 17:47:23'),
(202, 202, 202, 5, 'Accessories/22iROPNeoQ0Tp70fo7JzOFPXvXuuCBaMzwfDOFS7.png', '2023-10-16 17:48:34', '2023-10-16 17:48:34'),
(204, 204, 204, 5, 'Accessories/UX5u2XTPGHs7HniqTntj3bs3TM1x0gacUuaNq1Xq.png', '2023-10-16 17:52:23', '2023-10-16 17:52:23'),
(205, 205, 205, 5, 'Accessories/wsUvoWiFkh5FtvpdGRB31zF9MjKu607vzUql73Uw.png', '2023-10-16 17:54:27', '2023-10-16 17:54:27'),
(206, 206, 206, 5, 'Accessories/7Z8euy5xur3D8BjejTgrxjMLUljT2XPeGg2dL4FN.png', '2023-10-16 17:55:43', '2023-10-16 17:55:43'),
(207, 207, 207, 5, 'Accessories/kFvyPmiLqXuDWLbfG7RF3TM5U9ZrE4VNgC97Fqlz.png', '2023-10-16 17:57:19', '2023-10-16 17:57:19'),
(208, 208, 208, 5, 'Accessories/3ombczBQEHnak4pyFZkdsjVJjJ2y0Dgp6b5xwgAv.png', '2023-10-16 17:58:11', '2023-10-16 17:58:11'),
(209, 209, 209, 5, 'Accessories/HYZE9J1iTLEBqgBNjUHO4tzbpRiP73WUUEFBdTd0.png', '2023-10-16 18:00:49', '2023-10-16 18:00:49'),
(210, 210, 210, 5, 'Accessories/dvQSD6dBQV9sbBnVjHFTBbIG0u6damvT9mor5Mqt.png', '2023-10-16 18:02:10', '2023-10-16 18:02:10'),
(211, 211, 211, 5, 'Accessories/3rJPQfYXhvIwZpWCV6R7OwHRAiJLWQmmo2vkpFnl.png', '2023-10-16 18:03:28', '2023-10-16 18:03:28'),
(212, 212, 212, 5, 'Accessories/Uvka9HykKWfgt6AKYud0BvFeGFdh3Y8LMO1zKV1a.png', '2023-10-16 18:04:19', '2023-10-16 18:04:19'),
(213, 213, 213, 7, 'Kids/DW3JZ4JZPL9B98AGEEpQyLTC8Ztpah4THS6h0jJI.png', '2023-10-20 00:06:16', '2023-10-20 00:06:16'),
(214, 214, 214, 7, 'Kids/i0IdCKtOvA3CU4ZIELWXsoBHDzU971HUU8dDc2JB.png', '2023-10-20 00:07:50', '2023-10-20 00:07:50'),
(215, 215, 215, 7, 'Kids/mhaH0AggYvRON2aZ3u3b6eiFmxfK2T6lWA0fC1HT.png', '2023-10-20 00:08:40', '2023-10-20 00:08:40'),
(216, 216, 216, 7, 'Kids/pKlGbSPIduNz57Ja1nhfUcL9tpv4MeiXxlbwihcH.png', '2023-10-20 00:09:51', '2023-10-20 00:09:51'),
(217, 217, 217, 7, 'Kids/etVz2Jp1cE9mHStuyc33ZGKav4meXpeBebWBwTea.png', '2023-10-20 00:13:46', '2023-10-20 00:13:46'),
(218, 218, 218, 7, 'Kids/IJEzItzk4NDZl2Zof8bhR1l3LasVL4iM5Wv6Y4cv.png', '2023-10-20 00:15:08', '2023-10-20 00:15:08'),
(219, 219, 219, 7, 'Kids/zinCoehQzbzlsg620EJ24MRQ6qwZ9wssK0pfejD8.png', '2023-10-20 00:16:12', '2023-10-20 00:16:12'),
(220, 220, 220, 7, 'Kids/6nFI1K4qSFkQPCQKW0XWa2F5Mo5QPM7H1hZUl2gH.png', '2023-10-20 00:17:48', '2023-10-20 00:17:48'),
(221, 221, 221, 7, 'Kids/MOeKDgPsDKlg4XeqVcyHGtIcf8g2NuW0xIgdKI2s.png', '2023-10-20 00:19:55', '2023-10-20 00:19:55'),
(222, 222, 222, 7, 'Kids/9pR0UAkvG5jx32sAVhcHln0Q8ahnRxYdy73AOJYj.png', '2023-10-20 00:20:49', '2023-10-20 00:20:49'),
(223, 223, 223, 7, 'Kids/r7GoBc6rXObjJY3wyolrDdv8bLL0P4Fz6hc90z9d.png', '2023-10-20 00:22:03', '2023-10-20 00:22:03'),
(224, 224, 224, 7, 'Kids/TMSjHbEwZz6nIMiGLcbQl4SfKE6L5TGKZa21zM8C.png', '2023-10-20 00:23:26', '2023-10-20 00:23:26'),
(226, 226, 226, 7, 'Kids/rcsiqWxt7BkW5WgAG2PKEC6AVzcSrfcUJQofbBDB.png', '2023-10-20 00:30:19', '2023-10-20 00:30:19'),
(227, 227, 227, 7, 'Kids/zswqymDtdHUShdIkVlXTsf4QExK00Ay24rz21kAf.png', '2023-10-20 00:31:38', '2023-10-20 00:31:38'),
(228, 228, 228, 7, 'Kids/ECGDCcqE2ZLWNjIWbr8f84orv40gjj95KyppLLUW.png', '2023-10-20 00:35:42', '2023-10-20 00:35:42'),
(229, 229, 229, 7, 'Kids/hbu65YMatTofmnObkKE9PKC1rpOIKYlTHW7tzuPn.png', '2023-10-20 00:39:25', '2023-10-20 00:39:25'),
(230, 230, 230, 4, 'Kids/5GeNtDH3fwmjySF8tjuQCLUis9iGyYsG6eJN7LV5.png', '2023-10-20 00:43:51', '2023-10-20 00:43:51'),
(231, 231, 231, 4, 'Kids/Q94gp6TUvukHNijqjXnuIA5zWJgUDUxdNppwITmn.png', '2023-10-20 00:47:29', '2023-10-20 00:47:29'),
(232, 232, 232, 4, 'Kids/UlbGzcvKRPJDXEw3eWFNtBV2rV84d2a0pFJeJFma.png', '2023-10-20 00:48:22', '2023-10-20 00:48:22'),
(233, 233, 233, 4, 'Kids/2fBj2BWtsw0S5oIadpRrdHDEa4xicfdhwDwtRQsU.png', '2023-10-20 00:50:35', '2023-10-20 00:50:35'),
(235, 235, 235, 4, 'Kids/4Ihx0WoIo7QqYiOxjKQwYoeuoMV3tgGVEWspF69A.png', '2023-10-20 00:55:00', '2023-10-20 00:55:00'),
(236, 236, 236, 4, 'Kids/fV0bEPnSxFf5Ue5Auskqc4WqUx6L5liwM2qVzC7b.png', '2023-10-20 00:57:05', '2023-10-20 00:57:05'),
(237, 237, 237, 4, 'Kids/yJx36VMoyNEbfb4cQslv780GChSzcVl3sKcK6JiP.png', '2023-10-20 00:58:19', '2023-10-20 00:58:19'),
(238, 238, 238, 4, 'Kids/f4WXmdwfKCofirZEZpctlZn8IsYgI1wVbeo7LVku.png', '2023-10-20 00:59:22', '2023-10-20 00:59:22'),
(239, 239, 239, 5, 'Accessories/tI60qOuGFx3fe1ig6UwgnZF6vnm5mGDOOaqUMbje.png', '2023-10-20 01:19:44', '2023-10-20 01:19:44'),
(240, 240, 240, 5, 'Accessories/zFFhEy8jT8aAq1P657bYPqrXGXwLTI3TezwwCxdt.png', '2023-10-20 01:21:35', '2023-10-20 01:21:35'),
(241, 241, 241, 5, 'Accessories/GPgEAYeMuADVDCnPkqAo1Qgd02d8i2yAknEai2UR.png', '2023-10-20 01:22:07', '2023-10-20 01:22:07'),
(242, 242, 242, 5, 'Accessories/KnkTM97ZTZ1NhBVnJ7ARVB1YmY2LLQqncHrtw56d.png', '2023-10-20 01:22:36', '2023-10-20 01:22:36'),
(243, 243, 243, 5, 'Accessories/vEkH7J4eaghyPlLqUDqjXyd29AC2SSqtbqhPepnd.png', '2023-10-20 01:23:11', '2023-10-20 01:23:11'),
(244, 244, 244, 5, 'Accessories/mb2ah6v2xpXNi5vVTjIZoY646JPXYVw9bVHkhvLb.png', '2023-10-20 01:23:50', '2023-10-20 01:23:50'),
(245, 245, 245, 5, 'Accessories/t37iF6vugu4eHoyWM8t9JhB4f1bBxREvYNlPcaxy.png', '2023-10-20 01:25:10', '2023-10-20 01:25:10'),
(246, 246, 246, 7, 'Accessories/GnpnKjMSoNm2oaVWACEnMHI4Jx8ee28CyKYPd5br.png', '2023-10-20 01:26:44', '2023-10-20 01:26:44'),
(247, 247, 247, 7, 'Accessories/XysQj2s9BKdbirRY0esViHyv8IicJ2MlaYkw8PDk.png', '2023-10-20 01:27:13', '2023-10-20 01:27:13'),
(248, 248, 248, 7, 'Accessories/MSibfZd1S5XSkXBH7Rol8YwdaxTq2UQWs5J6eu9L.png', '2023-10-20 01:27:47', '2023-10-20 01:27:47'),
(249, 249, 249, 7, 'Accessories/k7UNtlwr9oYuIPm8tZcobq2G8qGr2zLEfj7guZ0K.png', '2023-10-20 01:28:18', '2023-10-20 01:28:18'),
(250, 250, 250, 7, 'Accessories/uPJ3DnDrlnK6mXbpVLLMzXFwjD3PdtFXfflr9sJu.png', '2023-10-20 01:28:45', '2023-10-20 01:28:45'),
(251, 251, 251, 7, 'Accessories/EP9vF72SxwqGXo8tnqALTtOk0rSU0U0pVopZd81J.png', '2023-10-20 01:29:35', '2023-10-20 01:29:35'),
(252, 252, 252, 7, 'Accessories/VrhCs6f7zUvKOKwCGSBfRfqI2G1OukD9F81TfiOJ.png', '2023-10-20 01:30:11', '2023-10-20 01:30:11'),
(253, 253, 253, 7, 'Accessories/TAlY8ZI2ofbnZM0lD7Ut0NfNfoBeX9DdneGtCMfd.png', '2023-10-20 01:30:46', '2023-10-20 01:30:46'),
(256, 256, 256, 10, 'Woman Product/dHs46stMGnj6uFGAq3obffSbES5m7aIuyKNFYWhc.png', '2023-10-21 04:34:19', '2023-10-21 04:34:19'),
(257, 257, 257, 9, 'Woman Product/ers5l0s51qshe8SzCA3YbvFW2p8PVVngfvXSZv5Q.png', '2023-10-21 04:35:16', '2024-02-04 19:14:13'),
(258, 258, 258, 10, 'Woman Product/3lRLDciEg763lHsVqridwHSLdGRUeHH08grJtilO.png', '2023-10-21 04:37:14', '2023-10-21 04:37:14'),
(259, 259, 259, 10, 'Woman Product/QO3IedueqKDD3YrJ7toRAggYYoR4KsHaD7fEVotm.png', '2023-10-21 04:38:05', '2023-10-21 04:38:05'),
(260, 260, 260, 10, 'Woman Product/7t5iOw7ZjveBj3xrVr94HN1cGIpGY5gjOwy9MCi9.png', '2023-10-21 04:38:48', '2023-10-21 04:38:48'),
(261, 261, 261, 10, 'Woman Product/vxmGANXBpkNKvupYi9xkjhvmq07nXTvuc0M1Fg42.png', '2023-10-21 04:39:55', '2023-10-21 04:39:55'),
(262, 262, 262, 10, 'Woman Product/0x3acAUsNtw6HXjWaOQlXvmJBtwSM1IGAQev6cvg.png', '2023-10-21 04:41:16', '2023-10-21 04:41:16'),
(263, 263, 263, 10, 'Woman Product/SCdV2WyZpPGsjOknoScv5wwPh8R27PQMKp1S7LO9.png', '2023-10-21 04:42:01', '2023-10-21 04:42:01'),
(264, 264, 264, 10, 'Woman Product/hs2pOiPX3ZjlYfxC1rMGpkSPeGYWjtPh471biihr.png', '2023-10-21 04:42:50', '2023-10-21 04:42:50'),
(265, 265, 265, 10, 'Woman Product/djZFqQvEyO9IVCckngE2SdJOXvEvs10NmIAJpKRs.png', '2023-10-21 04:45:44', '2023-10-21 04:45:44'),
(266, 266, 266, 10, 'Woman Product/WbUOxv0bEOoRpdQrSy7LtSmCo1HYv7nZPeZX03O4.png', '2023-10-21 04:46:38', '2023-10-21 04:46:38'),
(268, 268, 268, 10, 'Woman Product/mxcvtm0bW3fqfDiratiE4x8nmu8k1OCoKNaTjbjh.png', '2023-10-21 04:48:00', '2023-10-21 04:48:00'),
(269, 269, 269, 10, 'Woman Product/J2HF7ClvnFmM40Q0xLskXlOe6MS57KJQhjDG2Hgf.png', '2023-10-21 04:50:05', '2023-10-21 04:50:05'),
(270, 270, 270, 10, 'Woman Product/Ct0igk8mMS8ZxHBf64BL017McsOHC6I8O58L9E2f.png', '2023-10-21 04:50:54', '2023-10-21 04:50:54'),
(271, 271, 271, 9, 'Woman Product/62z4CspjmSTlf4HxuQpD5IHSnmX1AIbFx8pkphyN.png', '2023-10-21 04:52:59', '2024-02-04 19:14:13'),
(272, 272, 272, 10, 'Woman Product/bZuZpYnvyjk2Ebt81MbGFH8WTwwQnSBICu7DcUQH.png', '2023-10-21 04:54:02', '2023-10-21 04:54:02'),
(273, 273, 273, 10, 'Woman Product/IWtRQnJwVC0DhXMDhhtKbO0jAXxhxlWMJf2moYUi.png', '2023-10-21 04:54:32', '2023-10-21 04:54:32'),
(274, 274, 274, 10, 'Woman Product/CsQlj4vT8snQrqARzkx1LFxaROGVBr5sAfGEs5Qi.png', '2023-10-21 04:56:41', '2023-10-21 04:56:41'),
(275, 275, 275, 10, 'Woman Product/JCbZMmzt79t3bzXgGFcxobqvJKUNh5SsSYGizH9c.png', '2023-10-21 04:58:57', '2023-10-21 04:58:57'),
(276, 276, 276, 10, 'Woman Product/jXGqyrdlCAlJSVYeSGcXRtbKWxABsWfY44kUUH2S.png', '2023-10-21 04:59:29', '2023-10-21 04:59:29'),
(277, 277, 277, 10, 'Woman Product/1x0GWbTHjcWlwO1ud7WOsw7yyRlyd2rwfIJuEVzA.png', '2023-10-21 05:00:12', '2023-10-21 05:00:12'),
(278, 278, 278, 10, 'Woman Product/p2xJJRNiOC71oARBhC1L4NJyCywHwq6mqDgUPXPb.png', '2023-10-21 05:00:57', '2023-10-21 05:00:57'),
(279, 279, 279, 10, 'Woman Product/VHxj5Rmw8vWzlTHx121nH1NGq1Iu8ICYhHzyUPzE.png', '2023-10-21 05:01:30', '2023-10-21 05:01:30'),
(280, 280, 280, 8, 'Woman Product/6RNIy4br0edyKM7G7poVjH5T4mV96Ev8sKMsZHDP.png', '2023-10-21 05:02:10', '2024-02-04 19:14:13'),
(281, 281, 281, 10, 'Woman Product/xmtFGmKS0Cd5OtCgKDxMjHaDWmPuYCIWCCdaEj5V.png', '2023-10-21 05:02:58', '2023-10-21 05:02:58'),
(282, 282, 282, 10, 'Woman Product/IARIr1q4TgyKzHNcMp2ZCcHtH2jEuVb5VnAV0IS1.png', '2023-10-21 05:03:33', '2023-10-21 05:03:33'),
(283, 283, 283, 10, 'Woman Product/THIEbRY6sVv1pTXTFi7a0MpYS7XN1uTytl2z9U9l.png', '2023-10-21 05:05:10', '2023-10-21 05:05:10'),
(284, 284, 284, 10, 'Woman Product/ZThMhEz78ub2VwnxxAmHvvs1pxQdeP3fw0kZqEcN.png', '2023-10-21 05:06:17', '2023-10-21 05:06:17'),
(285, 285, 285, 10, 'Woman Product/lGqdH9znshWmdy8sEixlTDbPXD6WwPw6hmM81sm6.png', '2023-10-21 05:07:24', '2023-10-21 05:07:24'),
(286, 286, 286, 10, 'Woman Product/yEqnv7FBzAPCbrGmxMXSix45ffAVFbyAADN90BBp.png', '2023-10-21 05:07:57', '2023-10-21 05:07:57'),
(287, 287, 287, 10, 'Woman Product/lj7QABYb7ssbxG5K9U4AoycvQ4aswF3jkAum5z6f.png', '2023-10-21 05:08:33', '2023-10-21 05:08:33'),
(288, 288, 288, 10, 'Woman Product/8gfk0krniWmuJSglRgLslz1lGAenxPHCjgtcia8w.png', '2023-10-21 05:09:11', '2023-10-21 05:09:11'),
(289, 289, 289, 7, 'Woman Product/D8yYN1GloDnpkaRJHPH72YsnN6fSU2r8HMWQiVZH.png', '2023-10-21 05:10:08', '2024-02-04 19:14:13'),
(290, 290, 290, 10, 'Woman Product/tInuDsRAa5otLdFEJVye5N0qgzU08FjyNlpWMClm.png', '2023-10-21 05:10:33', '2023-10-21 05:10:33'),
(291, 291, 291, 5, 'Woman Product/ZEByfwgqjv4i7lqjbc4o3Z80IwIRrwrONMFjbRX7.png', '2023-10-21 05:51:18', '2023-10-21 05:51:18'),
(292, 292, 292, 4, 'Woman Product/FM4xRk3gP5NECwTytbrkawtFy1lB3JXTvy3X2dYR.png', '2023-10-21 05:52:43', '2024-02-04 19:14:12'),
(293, 293, 293, 5, 'Woman Product/rrYs0IkdZcaePxjGYiOpcYQXLsKbEPh6gxGSytCy.png', '2023-10-21 05:53:58', '2023-10-21 05:53:58'),
(294, 294, 294, 5, 'Woman Product/T5Cc4UHWyxMlm4G1fMYHoocHvd4Src0s5Su39AZB.png', '2023-10-21 05:55:20', '2023-10-21 05:55:20'),
(295, 295, 295, 5, 'Woman Product/dpooqX1VMARC6CpbwgtQRM2kdMnACw7SMqOoFONe.png', '2023-10-21 05:57:33', '2023-10-21 05:57:33'),
(296, 296, 296, 5, 'Woman Product/ryrlV5cwBCn3jKrVbbGQmXSafFbtnxCYtoErPGaO.png', '2023-10-21 05:59:16', '2023-10-21 05:59:16'),
(297, 297, 297, 3, 'Woman Product/P0bKK8vPw61tmyJhRRFMcg8X1OuFpLpsK69Fj16a.png', '2023-10-21 06:02:48', '2024-02-04 18:29:45'),
(298, 298, 298, 5, 'Woman Product/vEA1SjIqQrSuDvmtxuSESSv0O1unXTVSHrveDThY.png', '2023-10-21 06:05:24', '2023-10-21 06:05:24'),
(299, 299, 299, 0, 'Woman Product/ujGxxToU0blIhhkfCAscProA5ctrefGrNC4uOvxD.png', '2023-10-21 06:08:21', '2024-02-04 19:14:12'),
(301, 301, 301, 4, 'Woman Product/WxiJp5yrvgCuqSWJtHp8dkZCQfZtQR4b8vNu9pJa.png', '2023-10-21 06:11:49', '2024-01-19 23:24:21'),
(302, 302, 302, 5, 'Woman Product/p7U7UWX1tkC0U8qN11qj6pE7rFwNmd0ntGRSBI54.png', '2023-10-21 06:13:42', '2023-10-21 06:13:42'),
(303, 303, 303, 5, 'Woman Product/kXbFzBYBkEQRPlcwCeXgZ0v6EtpMeylCbmtpBDGm.png', '2023-10-21 06:15:18', '2023-10-21 06:15:18'),
(304, 304, 304, 5, 'Woman Product/XqwjXWfrmRTQ3uX1M5peAx2YNahJ06S0j7SYu00T.png', '2023-10-21 06:16:57', '2023-10-21 06:16:57'),
(305, 305, 305, 4, 'Woman Product/MhW2mS9R2gSLakPHsd98Ha0sL3oVQjSCZzFxHkTX.png', '2023-10-21 06:18:04', '2024-02-04 19:14:13'),
(306, 306, 306, 5, 'Woman Product/U0oZNdROJYs8r0xvSIsf1Q9D3vedRWY1Ycq1REUW.png', '2023-10-21 06:19:11', '2023-10-21 06:19:11'),
(307, 307, 307, 5, 'Woman Product/dpFVVL7MQQBTvz6lArCgOJGaCuRwWzMCtBY4A6KW.png', '2023-10-21 06:21:52', '2023-10-21 06:21:52'),
(308, 308, 308, 5, 'Woman Product/HNxmNZhm37dQ0wHiM4WOAiLHgT9TDYQfVZbHSUOy.png', '2023-10-21 06:23:25', '2023-10-21 06:23:25'),
(309, 309, 309, 5, 'Woman Product/feJ3ihuh0rPJvoz2H3rhewfpXKQUXYBrlGhsP3OQ.png', '2023-10-21 06:26:40', '2023-10-21 06:26:40'),
(310, 310, 310, 5, 'Woman Product/gNYGZJlS1vw0Br01PWNRm1cZ1E3X5KjYZUK1t4qR.png', '2023-10-21 06:29:21', '2023-10-21 06:29:21'),
(311, 311, 311, 5, 'Woman Product/dSQ3eSLO2sBcmNM5ZyGn3MnPaDnDThccqj25JLYQ.png', '2023-10-21 06:31:44', '2023-10-21 06:31:44'),
(312, 312, 312, 5, 'Woman Product/j6iujysEDVrrXq3Kk1Ng6WUH05AB463CdS0hbxlJ.png', '2023-10-21 06:36:09', '2023-10-21 06:36:09'),
(313, 313, 313, 5, 'Woman Product/gyPUNWWONJ7WKvvCfTrvk8kNx27gMWrV8hvRqBHt.png', '2023-10-21 06:38:15', '2023-10-21 06:38:15'),
(314, 314, 314, 5, 'Woman Product/MIAUREa4UI0Jq94ZfCbTEADjSH9Xbe0Ni90XHzDR.png', '2023-10-21 06:39:20', '2023-10-21 06:39:20'),
(315, 315, 315, 5, 'Woman Product/BBuxmmR2AFgzCqS2RAR6hGYip8GkVYIsZGMRknnR.png', '2023-10-21 06:41:12', '2023-10-21 06:41:12'),
(316, 316, 316, 5, 'Woman Product/DKyXpO0ErMNNB1H8Cw1SY0cat16HEt438BEmR7JO.png', '2023-10-21 06:42:57', '2023-10-21 06:42:57'),
(317, 317, 317, 5, 'Woman Product/fqmaqjGTeLeIJnNOYvUlpe5ZbP40CWKp12ukdcNI.png', '2023-10-21 06:44:30', '2023-10-21 06:44:30'),
(318, 318, 318, 5, 'Woman Product/Cp6CMlCw8mIVn5vTNw7E0j84lG36RUCazPJoQzLa.png', '2023-10-21 06:45:37', '2023-10-21 06:45:37'),
(319, 319, 319, 5, 'Woman Product/YSh1GB6QDwg74RmIuiDnsldd4KZQELcVoRPJHZYt.png', '2023-10-21 06:47:15', '2023-10-21 06:47:15'),
(320, 320, 320, 5, 'Woman Product/wt2e435DrZy2R2uEP8sCwq9o0q2BVdESIPgqrhs3.png', '2023-10-21 06:48:22', '2023-10-21 06:48:22'),
(321, 321, 321, 5, 'Woman Product/BJ0j1uk9VU7a5EcI6sXjinu134cebmLvAiMnwO59.png', '2023-10-21 06:49:48', '2023-10-21 06:49:48'),
(335, 335, 335, 5, 'Woman Product/2W37dMOa0yJQAwgEH60umsRBTJoLCPhnYrecHOYJ.png', '2023-10-22 07:34:04', '2023-10-22 07:34:04'),
(336, 336, 336, 5, 'Woman Product/AvATbag4Y7f43KX48D3eDIpgD38xK1RA3FXPg6UD.png', '2023-10-22 07:35:25', '2023-10-22 07:35:25'),
(342, 342, 342, 5, 'Woman Product/6Ttujt7ULRi5hUNX6HERgOooYJHb5U4CI9aZeolL.png', '2023-10-22 07:59:23', '2023-10-22 07:59:23'),
(343, 343, 343, 5, 'Woman Product/0L2kCCmRx58qbxcZrfnOnIIg6n8CN6LfyQp7lx1T.png', '2023-10-22 08:00:31', '2023-10-22 08:00:31'),
(344, 344, 344, 5, 'Woman Product/JJ42orWZ1UiAVDmHdkqn8ESnhAO3qT8iKPiOE49n.png', '2023-10-22 08:01:12', '2023-10-22 08:01:12'),
(345, 345, 345, 5, 'Woman Product/ll5sIaAwE83taFVzj67UCuQuDivv4dj6sgyd1CIt.png', '2023-10-22 08:02:54', '2023-10-22 08:02:54'),
(346, 346, 346, 5, 'Woman Product/hcLEdzfeEXlAEuYZUMpS8NofibPWwpe6WI0htXzz.png', '2023-10-22 08:04:03', '2023-10-22 08:04:03'),
(347, 347, 347, 5, 'Woman Product/SztnbebuPhh55c6tOo3ITACFntZM6hQs0kmGHRRw.png', '2023-10-22 08:05:00', '2023-10-22 08:05:00'),
(349, 349, 349, 5, 'Woman Product/WRyAyMezdwB8eUxhUOQZ25I6diHFmNxgZpm7Zslj.png', '2023-10-22 08:11:15', '2023-10-22 08:11:15'),
(350, 350, 350, 5, 'Woman Product/r6oIywFaty4j58ler0ZjhyD8AuwDzlydOLNfRiKy.png', '2023-10-22 08:12:31', '2023-10-22 08:12:31'),
(351, 351, 351, 5, 'Woman Product/Ma42NJHAEcuTs4yOiCAekGmOr02gYzr9UYXDj0jd.png', '2023-10-22 08:14:57', '2023-10-22 08:14:57'),
(352, 352, 352, 5, 'Woman Product/LLRlg53l7XqFBF9UMMjVeqxAyDT5Ehy9QwUD6APw.png', '2023-10-22 08:15:43', '2023-10-22 08:15:43'),
(353, 353, 353, 5, 'Woman Product/JWrTSnR4m9FY4lP6xZnYWqdMhn2fxn86RCqk2u4d.png', '2023-10-22 08:16:24', '2023-10-22 08:16:24'),
(354, 354, 354, 10, 'Bags Product/Fxs7QpBJijYBd9dg32rzqBt4VN3mqyOdBpVELyrL.png', '2023-10-29 18:45:51', '2023-10-29 18:45:51'),
(355, 355, 355, 10, 'Bags Product/8aGH9wO9vgOtXqcLrgdUwufVhOk2WZtWWv2ovaQl.png', '2023-10-29 18:46:45', '2023-10-29 18:46:45'),
(356, 356, 356, 10, 'Bags Product/8c6o386qvtT6C7NBXF2dWrqEmesBXuNFXzfnMPAz.png', '2023-10-29 18:47:28', '2023-10-29 18:47:28'),
(357, 357, 357, 10, 'Bags Product/mWPZQXWIoSapsR5BkW4f0ytN23CK8JpkUhb2hVw6.png', '2023-10-29 18:48:57', '2023-10-29 18:48:57'),
(358, 358, 358, 10, 'Bags Product/Vrr5gl78xCs9UnYPcQHHfbcpgE2vPPOUcvpGoaVD.png', '2023-10-29 18:49:38', '2023-10-29 18:49:38'),
(359, 359, 359, 10, 'Bags Product/e9yWZLktmlSzqaBtHY00CoAWTYxhExyhDnOxCc1q.png', '2023-10-29 18:50:23', '2023-10-29 18:50:23'),
(360, 360, 360, 10, 'Bags Product/T6e4XB8ndrSRAjHJzqKutZ5uEfonfSRhOd85sCny.png', '2023-10-29 18:51:59', '2023-10-29 18:51:59'),
(361, 361, 361, 10, 'Bags Product/2EnPEiWA1HBrqBI7OqzHigF99EILnNzq0aZ3IpTo.png', '2023-10-29 18:56:20', '2023-10-29 18:56:20'),
(362, 362, 362, 10, 'Bags Product/0vMzBnUZBPKHuqUPkQWaWO6IaazZjybY4o5l4fwh.png', '2023-10-29 19:01:02', '2023-10-29 19:01:02'),
(363, 363, 363, 10, 'Bags Product/dXQO1mVF0TNbCEmTQT0PbngtnsB92IEnGjPj21ap.png', '2023-10-29 19:07:35', '2023-10-29 19:07:35'),
(364, 364, 364, 10, 'Bags Product/KZzCePGdoVOPxgYARkP5fF8cl94RCnSgg1WglgDh.png', '2023-10-29 19:22:48', '2023-10-29 19:22:48'),
(365, 365, 365, 10, 'Bags Product/0BxGRzVT27TwE4tgb7BEozhVKw7sZJh1dRvSyAmz.png', '2023-10-29 19:22:55', '2023-10-29 19:22:55'),
(366, 366, 366, 15, 'Bags Product/Wxm1tDOUkkHNcIz5UiARbkc5E5TqwvMHKRqPLQxo.png', '2023-10-29 19:28:20', '2023-10-29 19:28:20'),
(367, 367, 367, 15, 'Bags Product/gqen22JTQli6321azTQovL5t0Zij4TbQCa62x6EI.png', '2023-10-29 19:30:56', '2023-10-29 19:30:56'),
(368, 368, 368, 15, 'Bags Product/EKce3XQBly7OaRgOTJKhjNwRizDqSE4y6Xl2mZXg.png', '2023-10-29 19:31:59', '2023-10-29 19:31:59'),
(369, 369, 369, 15, 'Bags Product/EFVzZqgUMlrI7casDi2tRdf9lbxtcx1uiWFDNAJJ.png', '2023-10-29 19:35:07', '2023-10-29 19:35:07'),
(370, 370, 370, 15, 'Bags Product/CssPuzOYt33bFilWFcypZhQ3siilnLhRLl1kN1Tp.png', '2023-10-29 19:36:11', '2023-10-29 19:36:11'),
(371, 371, 371, 29, 'Bags Product/aGsN5W9xRfdSxWDcvZfzpUIwKnsA3sfFjp1Czapu.png', '2023-10-29 19:39:40', '2024-01-30 20:19:40'),
(372, 372, 372, 30, 'Bags Product/5SayJAM3jtzv6JldrOPIkV6pAEBswWEJPSMAGjVL.png', '2023-10-29 19:40:47', '2023-10-29 19:40:47'),
(373, 373, 373, 13, 'Bags Product/zW9hP6R18K2v1tl1kPt7ssrCPkqW9hmQSmFjOq0c.png', '2023-10-29 19:42:04', '2024-02-04 19:14:13'),
(374, 374, 374, 20, 'Bags Product/gip0xoMlp0tfTSOq28gk74WiD6PNx4PHVKvWf7Of.png', '2023-10-29 19:46:01', '2023-10-29 19:46:01'),
(375, 375, 375, 20, 'Bags Product/l6ptf2m5b15JCjp6rlmkmygwl3yJbYzcs4XB8YlM.png', '2023-10-29 19:47:36', '2023-10-29 19:47:36'),
(376, 376, 376, 20, 'Bags Product/pwtK7LSCfKP5d4IEt6i8LOmYZWkykh8LTzmgJzxL.png', '2023-10-29 19:48:56', '2023-10-29 19:48:56'),
(377, 377, 377, 20, 'Bags Product/Dmp6vd0YI2EKzBi4XNHd6fO6egQ9lDBUiZ8KFjJ4.png', '2023-10-29 19:51:01', '2023-10-29 19:51:01'),
(378, 378, 378, 20, 'Bags Product/0WCt3YVdSFksaei4H3zbvTEEHkLexCURM4fODwDB.png', '2023-10-29 19:52:07', '2023-10-29 19:52:07'),
(379, 379, 379, 20, 'Bags Product/hpzLrh2rXkStgKXXTR7zeFSbEy3itC1TLlNy6f4p.png', '2023-10-29 19:53:16', '2023-10-29 19:53:16'),
(380, 380, 380, 20, 'Bags Product/StcoIJ5311OcurYHFD95NQJdv3tVDDbT63bQeHDc.png', '2023-10-29 19:54:30', '2023-10-29 19:54:30'),
(381, 381, 381, 20, 'Bags Product/82BHzUxmqSYxLsSiWeO9sS9qTbfANZRm2S5gMeYv.png', '2023-10-29 19:58:58', '2023-10-29 19:58:58'),
(382, 382, 382, 20, 'Bags Product/wjXeT9rKTII4PbQLFhge3rO37AFgdOZaQMYhdc6t.png', '2023-10-29 19:59:29', '2023-10-29 19:59:29'),
(383, 383, 383, 20, 'Bags Product/RWjysdwIrFEXQabyHDMrxFSCTYSH4G2ZnH2Ioaxm.png', '2023-10-29 20:00:08', '2023-10-29 20:00:08'),
(384, 384, 384, 20, 'Bags Product/ad9IDn6RsCFlBCieb2RhTlNkPANam9Ri6GdCX5Xd.png', '2023-10-29 20:00:41', '2023-10-29 20:00:41'),
(385, 385, 385, 20, 'Bags Product/prE7QEbsrXOkQSfa68DHUjGO3ec3yVY6eIGmJc2K.png', '2023-10-29 20:01:22', '2023-10-29 20:01:22'),
(386, 386, 386, 20, 'Bags Product/Nce5fvCyiSTTXp5ORop2zuMskGuXYibOcvkPPsm3.png', '2023-10-29 20:06:13', '2023-10-29 20:06:13'),
(387, 387, 387, 20, 'Bags Product/9u3MN9WPkdkdw48pISrrsiMrTAIY1ZeaJWWtv96G.png', '2023-10-29 20:08:41', '2023-10-29 20:08:41'),
(388, 388, 388, 20, 'Bags Product/C50linNtcM0Y3QA16HUPWv40wKAnqVgWXeJBYpxT.png', '2023-10-29 20:09:36', '2023-10-29 20:09:36'),
(389, 389, 389, 20, 'Bags Product/ot7m0rzruOHkozjboKFPuSz3cp49GZX7fhfCKXHq.png', '2023-10-29 20:10:32', '2023-10-29 20:10:32'),
(390, 390, 390, 20, 'Bags Product/e3hbnTX8szMWRQliJrF72xnuVvGwnF66z8NHLwoS.png', '2023-10-29 20:11:29', '2023-10-29 20:11:29'),
(391, 391, 391, 20, 'Bags Product/HRqgg9ZNPi8D1FIQug6z84pMXxwnGTJgb7gI6acz.png', '2023-10-29 20:13:02', '2023-10-29 20:13:02'),
(392, 392, 392, 20, 'Bags Product/IN29LmhdCluNnIDuyTrM2D5Y1uSxK7MlK5ZMOkMm.png', '2023-10-29 20:14:42', '2023-10-29 20:14:42'),
(393, 393, 393, 20, 'Bags Product/oxAQ3Hh3y7slAneMWpEZaMLkUqVf9KauAYUCQacg.png', '2023-10-29 20:15:59', '2023-10-29 20:15:59'),
(394, 394, 394, 20, 'Bags Product/MRw7kjM0gPSYF8bfDJk4MQIy8HxPMJeYv4Jox2Cu.png', '2023-10-29 20:16:34', '2023-10-29 20:16:34'),
(395, 395, 395, 20, 'Bags Product/imp09ClvmOAZuwku3YLTTx8yXye2Nkg9t9bZOBwn.png', '2023-10-29 20:18:52', '2023-10-29 20:18:52'),
(396, 396, 396, 20, 'Bags Product/oTxoLbcwIX2v77jmAlpvWx3jBaOFrKXBrcMUj8tJ.png', '2023-10-29 20:19:56', '2023-10-29 20:19:56'),
(397, 397, 397, 3, 'WOMAN/Sweatshirts & Hoodies Products/0dNXpVOnP2KvhLzgDnItywuiU5xv9UtnkmuDb4wk.png', '2023-12-19 15:44:30', '2024-01-30 19:40:33'),
(399, 399, 399, 14, 'WOMAN/Shirts Products/PbXRCnlnMYcmTnB5suDQ6By5AU7NYesM7ZUkZLzn.png', '2023-12-19 16:12:26', '2024-02-04 19:14:12'),
(400, 400, 400, 15, 'WOMAN/Shirts Products/LcYodQ6xCgsoqFZY8ULW9EVPs1uTxfHNKh7z6WKC.png', '2023-12-21 01:07:26', '2023-12-21 01:07:26'),
(406, 403, 406, 0, 'WOMAN/Sweatshirts & Hoodies Products/wVBD23xQhLHr3bNsry4St71faq3IUqBBQYan74gl.png', '2024-01-11 16:49:05', '2024-02-04 19:14:11');

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `size` enum('S','M','L','XL','XXL','XXXL','ONE SIZE','NO SIZE') NOT NULL DEFAULT 'NO SIZE',
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `size`, `product_id`, `created_at`, `updated_at`) VALUES
(7, 'XL', 8, '2023-10-12 09:02:56', '2023-10-12 09:02:56'),
(8, 'L', 9, '2023-10-12 09:06:02', '2023-10-12 09:06:02'),
(9, 'XXL', 10, '2023-10-12 09:09:16', '2023-10-12 09:09:16'),
(10, 'XXXL', 11, '2023-10-12 09:11:35', '2023-10-12 09:11:35'),
(11, 'XXL', 12, '2023-10-12 09:12:56', '2023-10-12 09:12:56'),
(12, 'XXL', 13, '2023-10-12 09:16:56', '2023-10-12 09:16:56'),
(13, 'XL', 14, '2023-10-12 09:21:35', '2023-10-12 09:21:35'),
(14, 'L', 15, '2023-10-12 09:29:16', '2023-10-12 09:29:16'),
(15, 'XL', 16, '2023-10-12 09:38:25', '2023-10-12 09:38:25'),
(16, 'L', 17, '2023-10-12 09:41:19', '2023-10-12 09:41:19'),
(17, 'M', 18, '2023-10-12 09:44:26', '2023-10-12 09:44:26'),
(18, 'XL', 19, '2023-10-12 09:49:03', '2023-10-12 09:49:03'),
(19, 'XL', 20, '2023-10-12 09:51:51', '2023-10-12 09:51:51'),
(20, 'XL', 21, '2023-10-12 09:56:19', '2023-10-12 09:56:19'),
(21, 'XL', 22, '2023-10-12 09:59:32', '2023-10-12 09:59:32'),
(22, 'XL', 23, '2023-10-12 10:05:20', '2023-10-12 10:05:20'),
(23, 'XXL', 24, '2023-10-12 10:09:06', '2023-10-12 10:09:06'),
(24, 'XL', 25, '2023-10-12 10:11:34', '2023-10-12 10:11:34'),
(25, 'L', 26, '2023-10-12 10:13:47', '2023-10-12 10:13:47'),
(26, 'XXL', 27, '2023-10-12 10:40:06', '2023-10-12 10:40:06'),
(30, 'XXL', 31, '2023-10-12 10:47:14', '2023-10-12 10:47:14'),
(31, 'XL', 32, '2023-10-12 10:53:31', '2023-10-12 10:53:31'),
(32, 'XL', 33, '2023-10-12 10:55:42', '2023-10-12 10:55:42'),
(33, 'XXL', 34, '2023-10-12 10:56:54', '2023-10-12 10:56:54'),
(34, 'XXL', 35, '2023-10-12 10:57:44', '2023-10-12 10:57:44'),
(39, 'XL', 40, '2023-10-12 12:17:11', '2023-10-12 12:17:11'),
(40, 'XL', 41, '2023-10-12 12:19:01', '2023-10-12 12:19:01'),
(42, 'XL', 43, '2023-10-12 12:20:55', '2023-10-12 12:20:55'),
(43, 'L', 44, '2023-10-12 12:30:17', '2023-10-12 12:30:17'),
(44, 'M', 45, '2023-10-12 12:32:35', '2023-10-12 12:32:35'),
(45, 'M', 46, '2023-10-12 12:34:26', '2023-10-12 12:34:26'),
(46, 'M', 47, '2023-10-12 12:35:56', '2023-10-12 12:35:56'),
(47, 'M', 48, '2023-10-12 12:39:50', '2023-10-12 12:39:50'),
(48, 'M', 49, '2023-10-12 12:42:03', '2023-10-12 12:42:03'),
(49, 'M', 50, '2023-10-12 12:43:14', '2023-10-12 12:43:14'),
(50, 'L', 51, '2023-10-12 12:44:56', '2023-10-12 12:44:56'),
(51, 'L', 52, '2023-10-12 12:46:13', '2023-10-12 12:46:13'),
(52, 'L', 53, '2023-10-12 12:58:12', '2023-10-12 12:58:12'),
(53, 'XL', 54, '2023-10-12 13:02:29', '2023-10-12 13:02:29'),
(54, 'XL', 55, '2023-10-12 13:04:54', '2023-10-12 13:04:54'),
(55, 'L', 56, '2023-10-12 13:06:59', '2023-10-12 13:06:59'),
(57, 'L', 58, '2023-10-12 13:13:07', '2023-10-12 13:13:07'),
(58, 'XXL', 59, '2023-10-12 13:14:14', '2023-10-12 13:14:14'),
(59, 'XXL', 60, '2023-10-12 13:20:11', '2023-10-12 13:20:11'),
(61, 'XL', 62, '2023-10-12 13:31:58', '2023-10-12 13:31:58'),
(62, 'XL', 63, '2023-10-12 13:32:46', '2023-10-12 13:32:46'),
(63, 'XL', 64, '2023-10-12 13:33:43', '2023-10-12 13:33:43'),
(64, 'XL', 65, '2023-10-12 13:35:43', '2023-10-12 13:35:43'),
(66, 'NO SIZE', 67, '2023-10-12 13:50:45', '2023-10-21 21:37:01'),
(67, 'NO SIZE', 68, '2023-10-12 13:52:59', '2023-10-21 21:37:01'),
(68, 'NO SIZE', 69, '2023-10-12 13:54:10', '2023-10-21 21:37:01'),
(69, 'NO SIZE', 70, '2023-10-12 13:56:12', '2023-10-21 21:37:01'),
(70, 'NO SIZE', 71, '2023-10-12 14:01:09', '2023-10-21 21:37:02'),
(71, 'NO SIZE', 72, '2023-10-12 14:03:09', '2023-10-21 21:37:02'),
(72, 'NO SIZE', 73, '2023-10-12 14:04:43', '2023-10-21 21:37:02'),
(73, 'NO SIZE', 74, '2023-10-12 14:06:00', '2023-10-21 21:37:02'),
(74, 'NO SIZE', 75, '2023-10-12 14:08:33', '2023-10-21 21:37:02'),
(75, 'NO SIZE', 76, '2023-10-12 14:09:28', '2023-10-21 21:37:02'),
(76, 'NO SIZE', 77, '2023-10-12 14:10:41', '2023-10-21 21:37:02'),
(77, 'NO SIZE', 78, '2023-10-12 14:11:47', '2023-10-21 21:37:02'),
(78, 'NO SIZE', 79, '2023-10-12 14:14:22', '2023-10-21 21:37:06'),
(79, 'NO SIZE', 80, '2023-10-12 14:16:22', '2023-10-21 21:37:06'),
(80, 'NO SIZE', 81, '2023-10-12 14:18:48', '2023-10-21 21:37:06'),
(81, 'NO SIZE', 82, '2023-10-12 14:20:00', '2023-10-21 21:37:06'),
(82, 'NO SIZE', 83, '2023-10-12 14:21:22', '2023-10-21 21:37:06'),
(83, 'NO SIZE', 84, '2023-10-12 14:25:45', '2023-10-21 21:37:06'),
(84, 'NO SIZE', 85, '2023-10-12 14:35:25', '2023-10-21 21:36:57'),
(85, 'NO SIZE', 86, '2023-10-12 14:36:24', '2023-10-21 21:36:58'),
(86, 'NO SIZE', 87, '2023-10-12 14:37:25', '2023-10-21 21:36:59'),
(87, 'NO SIZE', 88, '2023-10-12 15:52:46', '2023-10-21 21:37:00'),
(88, 'NO SIZE', 89, '2023-10-12 15:53:21', '2023-10-21 21:37:00'),
(89, 'NO SIZE', 90, '2023-10-12 15:54:20', '2023-10-21 21:37:00'),
(90, 'NO SIZE', 91, '2023-10-12 15:55:23', '2023-10-21 21:37:03'),
(91, 'NO SIZE', 92, '2023-10-12 15:56:02', '2023-10-21 21:37:03'),
(92, 'NO SIZE', 93, '2023-10-12 15:57:03', '2023-10-21 21:37:03'),
(93, 'NO SIZE', 94, '2023-10-12 15:57:40', '2023-10-21 21:37:03'),
(94, 'NO SIZE', 95, '2023-10-12 15:58:07', '2023-10-21 21:37:03'),
(95, 'NO SIZE', 96, '2023-10-12 15:59:45', '2023-10-21 21:37:04'),
(96, 'NO SIZE', 97, '2023-10-12 16:00:22', '2023-10-21 21:37:04'),
(97, 'NO SIZE', 98, '2023-10-12 16:01:21', '2023-10-21 21:37:04'),
(98, 'NO SIZE', 99, '2023-10-12 16:02:00', '2023-10-21 21:37:04'),
(99, 'NO SIZE', 100, '2023-10-12 16:02:31', '2023-10-21 21:37:04'),
(100, 'NO SIZE', 101, '2023-10-12 16:03:54', '2023-10-21 21:37:04'),
(101, 'NO SIZE', 102, '2023-10-12 16:04:26', '2023-10-21 21:37:05'),
(102, 'NO SIZE', 103, '2023-10-12 16:04:56', '2023-10-21 21:37:05'),
(103, 'NO SIZE', 104, '2023-10-12 16:05:26', '2023-10-21 21:37:05'),
(104, 'NO SIZE', 105, '2023-10-12 16:05:59', '2023-10-21 21:37:05'),
(105, 'NO SIZE', 106, '2023-10-12 16:06:54', '2023-10-21 21:37:05'),
(106, 'NO SIZE', 107, '2023-10-12 16:07:26', '2023-10-21 21:37:05'),
(107, 'NO SIZE', 108, '2023-10-12 16:08:38', '2023-10-21 21:37:06'),
(108, 'ONE SIZE', 109, '2023-10-15 15:08:18', '2023-10-15 15:08:18'),
(109, 'ONE SIZE', 110, '2023-10-15 15:10:15', '2023-10-15 15:10:15'),
(110, 'ONE SIZE', 111, '2023-10-15 15:10:50', '2023-10-15 15:10:50'),
(111, 'ONE SIZE', 112, '2023-10-15 15:11:21', '2023-10-15 15:11:21'),
(112, 'ONE SIZE', 113, '2023-10-15 15:12:26', '2023-10-15 15:12:26'),
(113, 'ONE SIZE', 114, '2023-10-15 15:12:56', '2023-10-15 15:12:56'),
(114, 'ONE SIZE', 115, '2023-10-15 15:13:26', '2023-10-15 15:13:26'),
(115, 'ONE SIZE', 116, '2023-10-15 15:15:00', '2023-10-15 15:15:00'),
(116, 'ONE SIZE', 117, '2023-10-15 15:15:33', '2023-10-15 15:15:33'),
(117, 'ONE SIZE', 118, '2023-10-15 15:16:53', '2023-10-15 15:16:53'),
(118, 'ONE SIZE', 119, '2023-10-15 15:17:24', '2023-10-15 15:17:24'),
(119, 'ONE SIZE', 120, '2023-10-15 15:18:05', '2023-10-15 15:18:05'),
(120, 'ONE SIZE', 121, '2023-10-15 15:18:55', '2023-10-15 15:18:55'),
(121, 'ONE SIZE', 122, '2023-10-15 15:20:09', '2023-10-15 15:20:09'),
(122, 'ONE SIZE', 123, '2023-10-15 15:21:08', '2023-10-15 15:21:08'),
(123, 'ONE SIZE', 124, '2023-10-15 15:21:51', '2023-10-15 15:21:51'),
(124, 'ONE SIZE', 125, '2023-10-15 15:22:34', '2023-10-15 15:22:34'),
(125, 'ONE SIZE', 126, '2023-10-15 19:10:58', '2023-10-15 19:10:58'),
(126, 'ONE SIZE', 127, '2023-10-15 19:11:45', '2023-10-15 19:11:45'),
(127, 'ONE SIZE', 128, '2023-10-15 19:12:18', '2023-10-15 19:12:18'),
(128, 'ONE SIZE', 129, '2023-10-15 19:12:44', '2023-10-15 19:12:44'),
(129, 'ONE SIZE', 130, '2023-10-15 19:13:13', '2023-10-15 19:13:13'),
(130, 'ONE SIZE', 131, '2023-10-15 19:14:23', '2023-10-15 19:14:23'),
(131, 'ONE SIZE', 132, '2023-10-15 19:15:00', '2023-10-15 19:15:00'),
(132, 'ONE SIZE', 133, '2023-10-15 19:15:38', '2023-10-15 19:15:38'),
(133, 'ONE SIZE', 134, '2023-10-15 19:16:18', '2023-10-15 19:16:18'),
(134, 'ONE SIZE', 135, '2023-10-15 19:16:57', '2023-10-15 19:16:57'),
(135, 'ONE SIZE', 136, '2023-10-15 19:17:33', '2023-10-15 19:17:33'),
(136, 'ONE SIZE', 137, '2023-10-15 19:18:03', '2023-10-15 19:18:03'),
(137, 'ONE SIZE', 138, '2023-10-15 19:18:43', '2023-10-15 19:18:43'),
(138, 'ONE SIZE', 139, '2023-10-15 19:19:20', '2023-10-15 19:19:20'),
(139, 'ONE SIZE', 140, '2023-10-15 19:19:55', '2023-10-15 19:19:55'),
(140, 'ONE SIZE', 141, '2023-10-15 19:20:23', '2023-10-15 19:20:23'),
(141, 'ONE SIZE', 142, '2023-10-15 19:23:34', '2023-10-15 19:23:34'),
(142, 'ONE SIZE', 143, '2023-10-15 19:25:55', '2023-10-15 19:25:55'),
(143, 'ONE SIZE', 144, '2023-10-15 19:27:26', '2023-10-15 19:27:26'),
(144, 'ONE SIZE', 145, '2023-10-15 19:28:10', '2023-10-15 19:28:10'),
(145, 'ONE SIZE', 146, '2023-10-15 19:28:44', '2023-10-15 19:28:44'),
(146, 'ONE SIZE', 147, '2023-10-15 19:29:26', '2023-10-15 19:29:26'),
(147, 'ONE SIZE', 148, '2023-10-15 19:30:06', '2023-10-15 19:30:06'),
(148, 'ONE SIZE', 149, '2023-10-15 19:30:53', '2023-10-15 19:30:53'),
(149, 'ONE SIZE', 150, '2023-10-15 19:32:15', '2023-10-15 19:32:15'),
(150, 'ONE SIZE', 151, '2023-10-15 19:33:04', '2023-10-15 19:33:04'),
(151, 'ONE SIZE', 152, '2023-10-15 19:33:38', '2023-10-15 19:33:38'),
(152, 'ONE SIZE', 153, '2023-10-15 19:34:11', '2023-10-15 19:34:11'),
(153, 'ONE SIZE', 154, '2023-10-15 19:34:55', '2023-10-15 19:34:55'),
(154, 'ONE SIZE', 155, '2023-10-15 19:35:25', '2023-10-15 19:35:25'),
(155, 'ONE SIZE', 156, '2023-10-15 19:38:43', '2023-10-15 19:38:43'),
(157, 'ONE SIZE', 158, '2023-10-15 19:42:07', '2023-10-15 19:42:07'),
(159, 'ONE SIZE', 160, '2023-10-15 19:44:58', '2023-10-15 19:44:58'),
(160, 'ONE SIZE', 161, '2023-10-15 19:48:17', '2023-10-15 19:48:17'),
(161, 'ONE SIZE', 162, '2023-10-15 19:50:25', '2023-10-15 19:50:25'),
(162, 'ONE SIZE', 163, '2023-10-15 19:50:56', '2023-10-15 19:50:56'),
(164, 'ONE SIZE', 165, '2023-10-15 19:52:03', '2023-10-15 19:52:03'),
(165, 'ONE SIZE', 166, '2023-10-15 19:52:38', '2023-10-15 19:52:38'),
(166, 'ONE SIZE', 167, '2023-10-15 19:53:08', '2023-10-15 19:53:08'),
(167, 'ONE SIZE', 168, '2023-10-15 19:54:02', '2023-10-15 19:54:02'),
(168, 'ONE SIZE', 169, '2023-10-15 19:54:50', '2023-10-15 19:54:50'),
(169, 'ONE SIZE', 170, '2023-10-15 19:55:24', '2023-10-15 19:55:24'),
(170, 'L', 171, '2023-10-15 20:56:33', '2023-10-15 20:56:33'),
(173, 'L', 174, '2023-10-15 21:01:45', '2023-10-15 21:01:45'),
(174, 'L', 175, '2023-10-15 21:02:38', '2023-10-15 21:02:38'),
(175, 'L', 176, '2023-10-15 21:03:41', '2023-10-15 21:03:41'),
(178, 'ONE SIZE', 179, '2023-10-16 16:51:03', '2023-10-16 16:51:03'),
(179, 'ONE SIZE', 180, '2023-10-16 16:51:39', '2023-10-16 16:51:39'),
(180, 'ONE SIZE', 181, '2023-10-16 16:52:28', '2023-10-16 16:52:28'),
(181, 'ONE SIZE', 182, '2023-10-16 16:53:31', '2023-10-16 16:53:31'),
(182, 'ONE SIZE', 183, '2023-10-16 16:54:16', '2023-10-16 16:54:16'),
(183, 'ONE SIZE', 184, '2023-10-16 16:55:00', '2023-10-16 16:55:00'),
(184, 'ONE SIZE', 185, '2023-10-16 16:55:55', '2023-10-16 16:55:55'),
(185, 'ONE SIZE', 186, '2023-10-16 17:07:09', '2023-10-16 17:07:09'),
(186, 'ONE SIZE', 187, '2023-10-16 17:07:56', '2023-10-16 17:07:56'),
(187, 'ONE SIZE', 188, '2023-10-16 17:08:47', '2023-10-16 17:08:47'),
(188, 'ONE SIZE', 189, '2023-10-16 17:10:42', '2023-10-16 17:10:42'),
(189, 'ONE SIZE', 190, '2023-10-16 17:12:05', '2023-10-16 17:12:05'),
(190, 'ONE SIZE', 191, '2023-10-16 17:15:02', '2023-10-16 17:15:02'),
(191, 'ONE SIZE', 192, '2023-10-16 17:18:11', '2023-10-16 17:18:11'),
(192, 'ONE SIZE', 193, '2023-10-16 17:28:48', '2023-10-16 17:28:48'),
(193, 'ONE SIZE', 194, '2023-10-16 17:29:32', '2023-10-16 17:29:32'),
(194, 'ONE SIZE', 195, '2023-10-16 17:31:40', '2023-10-16 17:31:40'),
(195, 'ONE SIZE', 196, '2023-10-16 17:32:11', '2023-10-16 17:32:11'),
(196, 'ONE SIZE', 197, '2023-10-16 17:32:48', '2023-10-16 17:32:48'),
(197, 'ONE SIZE', 198, '2023-10-16 17:33:19', '2023-10-16 17:33:19'),
(198, 'ONE SIZE', 199, '2023-10-16 17:33:54', '2023-10-16 17:33:54'),
(199, 'ONE SIZE', 200, '2023-10-16 17:40:08', '2023-10-16 17:40:08'),
(200, 'ONE SIZE', 201, '2023-10-16 17:42:28', '2023-10-16 17:42:28'),
(201, 'ONE SIZE', 202, '2023-10-16 17:47:23', '2023-10-16 17:47:23'),
(202, 'ONE SIZE', 203, '2023-10-16 17:48:34', '2023-10-16 17:48:34'),
(204, 'ONE SIZE', 205, '2023-10-16 17:52:23', '2023-10-16 17:52:23'),
(205, 'ONE SIZE', 206, '2023-10-16 17:54:27', '2023-10-16 17:54:27'),
(206, 'ONE SIZE', 207, '2023-10-16 17:55:43', '2023-10-16 17:55:43'),
(207, 'ONE SIZE', 208, '2023-10-16 17:57:19', '2023-10-16 17:57:19'),
(208, 'ONE SIZE', 209, '2023-10-16 17:58:11', '2023-10-16 17:58:11'),
(209, 'ONE SIZE', 210, '2023-10-16 18:00:49', '2023-10-16 18:00:49'),
(210, 'ONE SIZE', 211, '2023-10-16 18:02:10', '2023-10-16 18:02:10'),
(211, 'ONE SIZE', 212, '2023-10-16 18:03:28', '2023-10-16 18:03:28'),
(212, 'ONE SIZE', 213, '2023-10-16 18:04:19', '2023-10-16 18:04:19'),
(213, 'M', 214, '2023-10-20 00:06:16', '2023-10-20 00:06:16'),
(214, 'L', 215, '2023-10-20 00:07:50', '2023-10-20 00:07:50'),
(215, 'L', 216, '2023-10-20 00:08:40', '2023-10-20 00:08:40'),
(216, 'L', 217, '2023-10-20 00:09:51', '2023-10-20 00:09:51'),
(217, 'L', 218, '2023-10-20 00:13:46', '2023-10-20 00:13:46'),
(218, 'L', 219, '2023-10-20 00:15:08', '2023-10-20 00:15:08'),
(219, 'L', 220, '2023-10-20 00:16:12', '2023-10-20 00:16:12'),
(220, 'L', 221, '2023-10-20 00:17:48', '2023-10-20 00:17:48'),
(221, 'L', 222, '2023-10-20 00:19:55', '2023-10-20 00:19:55'),
(222, 'XL', 223, '2023-10-20 00:20:49', '2023-10-20 00:20:49'),
(223, 'XL', 224, '2023-10-20 00:22:03', '2023-10-20 00:22:03'),
(224, 'XL', 225, '2023-10-20 00:23:26', '2023-10-20 00:23:26'),
(226, 'XL', 227, '2023-10-20 00:30:19', '2023-10-20 00:30:19'),
(227, 'XL', 228, '2023-10-20 00:31:38', '2023-10-20 00:31:38'),
(228, 'XL', 229, '2023-10-20 00:35:42', '2023-10-20 00:35:42'),
(229, 'XL', 230, '2023-10-20 00:39:25', '2023-10-20 00:39:25'),
(230, 'L', 231, '2023-10-20 00:43:51', '2023-10-20 00:43:51'),
(231, 'L', 232, '2023-10-20 00:47:29', '2023-10-20 00:47:29'),
(232, 'L', 233, '2023-10-20 00:48:22', '2023-10-20 00:48:22'),
(233, 'L', 234, '2023-10-20 00:50:34', '2023-10-20 00:50:34'),
(235, 'XL', 236, '2023-10-20 00:55:00', '2023-10-20 00:55:00'),
(236, 'L', 237, '2023-10-20 00:57:05', '2023-10-20 00:57:05'),
(237, 'L', 238, '2023-10-20 00:58:19', '2023-10-20 00:58:19'),
(238, 'L', 239, '2023-10-20 00:59:22', '2023-10-20 00:59:22'),
(239, 'ONE SIZE', 240, '2023-10-20 01:19:44', '2023-10-20 01:19:44'),
(240, 'ONE SIZE', 241, '2023-10-20 01:21:35', '2023-10-20 01:21:35'),
(241, 'ONE SIZE', 242, '2023-10-20 01:22:07', '2023-10-20 01:22:07'),
(242, 'ONE SIZE', 243, '2023-10-20 01:22:36', '2023-10-20 01:22:36'),
(243, 'ONE SIZE', 244, '2023-10-20 01:23:11', '2023-10-20 01:23:11'),
(244, 'ONE SIZE', 245, '2023-10-20 01:23:49', '2023-10-20 01:23:49'),
(245, 'ONE SIZE', 246, '2023-10-20 01:25:10', '2023-10-20 01:25:10'),
(246, 'ONE SIZE', 247, '2023-10-20 01:26:44', '2023-10-20 01:26:44'),
(247, 'ONE SIZE', 248, '2023-10-20 01:27:13', '2023-10-20 01:27:13'),
(248, 'ONE SIZE', 249, '2023-10-20 01:27:47', '2023-10-20 01:27:47'),
(249, 'ONE SIZE', 250, '2023-10-20 01:28:18', '2023-10-20 01:28:18'),
(250, 'ONE SIZE', 251, '2023-10-20 01:28:45', '2023-10-20 01:28:45'),
(251, 'ONE SIZE', 252, '2023-10-20 01:29:35', '2023-10-20 01:29:35'),
(252, 'ONE SIZE', 253, '2023-10-20 01:30:11', '2023-10-20 01:30:11'),
(253, 'ONE SIZE', 254, '2023-10-20 01:30:46', '2023-10-20 01:30:46'),
(256, 'NO SIZE', 257, '2023-10-21 04:34:19', '2023-10-21 04:34:19'),
(257, 'NO SIZE', 258, '2023-10-21 04:35:16', '2023-10-21 04:35:16'),
(258, 'NO SIZE', 259, '2023-10-21 04:37:13', '2023-10-21 04:37:13'),
(259, 'NO SIZE', 260, '2023-10-21 04:38:05', '2023-10-21 04:38:05'),
(260, 'NO SIZE', 261, '2023-10-21 04:38:48', '2023-10-21 04:38:48'),
(261, 'NO SIZE', 262, '2023-10-21 04:39:55', '2023-10-21 04:39:55'),
(262, 'NO SIZE', 263, '2023-10-21 04:41:16', '2023-10-21 04:41:16'),
(263, 'NO SIZE', 264, '2023-10-21 04:42:01', '2023-10-21 04:42:01'),
(264, 'NO SIZE', 265, '2023-10-21 04:42:50', '2023-10-21 04:42:50'),
(265, 'NO SIZE', 266, '2023-10-21 04:45:44', '2023-10-21 04:45:44'),
(266, 'NO SIZE', 267, '2023-10-21 04:46:38', '2023-10-21 04:46:38'),
(268, 'NO SIZE', 269, '2023-10-21 04:48:00', '2023-10-21 04:48:00'),
(269, 'NO SIZE', 270, '2023-10-21 04:50:05', '2023-10-21 04:50:05'),
(270, 'NO SIZE', 271, '2023-10-21 04:50:54', '2023-10-21 04:50:54'),
(271, 'NO SIZE', 272, '2023-10-21 04:52:59', '2023-10-21 04:52:59'),
(272, 'NO SIZE', 273, '2023-10-21 04:54:02', '2023-10-21 04:54:02'),
(273, 'NO SIZE', 274, '2023-10-21 04:54:32', '2023-10-21 04:54:32'),
(274, 'NO SIZE', 275, '2023-10-21 04:56:41', '2023-10-21 04:56:41'),
(275, 'NO SIZE', 276, '2023-10-21 04:58:56', '2023-10-21 04:58:56'),
(276, 'NO SIZE', 277, '2023-10-21 04:59:29', '2023-10-21 04:59:29'),
(277, 'NO SIZE', 278, '2023-10-21 05:00:12', '2023-10-21 05:00:12'),
(278, 'NO SIZE', 279, '2023-10-21 05:00:56', '2023-10-21 05:00:56'),
(279, 'NO SIZE', 280, '2023-10-21 05:01:30', '2023-10-21 05:01:30'),
(280, 'NO SIZE', 281, '2023-10-21 05:02:10', '2023-10-21 05:02:10'),
(281, 'NO SIZE', 282, '2023-10-21 05:02:58', '2023-10-21 05:02:58'),
(282, 'NO SIZE', 283, '2023-10-21 05:03:33', '2023-10-21 05:03:33'),
(283, 'NO SIZE', 284, '2023-10-21 05:05:09', '2023-10-21 05:05:09'),
(284, 'NO SIZE', 285, '2023-10-21 05:06:17', '2023-10-21 05:06:17'),
(285, 'NO SIZE', 286, '2023-10-21 05:07:24', '2023-10-21 05:07:24'),
(286, 'NO SIZE', 287, '2023-10-21 05:07:56', '2023-10-21 05:07:56'),
(287, 'NO SIZE', 288, '2023-10-21 05:08:33', '2023-10-21 05:08:33'),
(288, 'NO SIZE', 289, '2023-10-21 05:09:11', '2023-10-21 05:09:11'),
(289, 'NO SIZE', 290, '2023-10-21 05:10:08', '2023-10-21 05:10:08'),
(290, 'NO SIZE', 291, '2023-10-21 05:10:33', '2023-10-21 05:10:33'),
(291, 'L', 292, '2023-10-21 05:51:18', '2023-10-21 05:51:18'),
(292, 'L', 293, '2023-10-21 05:52:43', '2023-10-21 05:52:43'),
(293, 'XL', 294, '2023-10-21 05:53:58', '2023-10-21 05:53:58'),
(294, 'XL', 295, '2023-10-21 05:55:20', '2023-10-21 05:55:20'),
(295, 'XL', 296, '2023-10-21 05:57:32', '2023-10-21 05:57:32'),
(296, 'XL', 297, '2023-10-21 05:59:16', '2023-10-21 05:59:16'),
(297, 'XL', 298, '2023-10-21 06:02:48', '2023-10-21 06:02:48'),
(298, 'XL', 299, '2023-10-21 06:05:24', '2023-10-21 06:05:24'),
(299, 'XL', 300, '2023-10-21 06:08:21', '2023-10-21 06:08:21'),
(301, 'XL', 302, '2023-10-21 06:11:49', '2023-10-21 06:11:49'),
(302, 'XL', 303, '2023-10-21 06:13:42', '2023-10-21 06:13:42'),
(303, 'XL', 304, '2023-10-21 06:15:18', '2023-10-21 06:15:18'),
(304, 'XL', 305, '2023-10-21 06:16:57', '2023-10-21 06:16:57'),
(305, 'XL', 306, '2023-10-21 06:18:04', '2023-10-21 06:18:04'),
(306, 'XL', 307, '2023-10-21 06:19:11', '2023-10-21 06:19:11'),
(307, 'XL', 308, '2023-10-21 06:21:52', '2023-10-21 06:21:52'),
(308, 'XL', 309, '2023-10-21 06:23:25', '2023-10-21 06:23:25'),
(309, 'XL', 310, '2023-10-21 06:26:40', '2023-10-21 06:26:40'),
(310, 'XL', 311, '2023-10-21 06:29:20', '2023-10-21 06:29:20'),
(311, 'XL', 312, '2023-10-21 06:31:44', '2023-10-21 06:31:44'),
(312, 'XL', 313, '2023-10-21 06:36:09', '2023-10-21 06:36:09'),
(313, 'XL', 314, '2023-10-21 06:38:15', '2023-10-21 06:38:15'),
(314, 'XL', 315, '2023-10-21 06:39:20', '2023-10-21 06:39:20'),
(315, 'XL', 316, '2023-10-21 06:41:12', '2023-10-21 06:41:12'),
(316, 'XL', 317, '2023-10-21 06:42:57', '2023-10-21 06:42:57'),
(317, 'XL', 318, '2023-10-21 06:44:30', '2023-10-21 06:44:30'),
(318, 'XL', 319, '2023-10-21 06:45:37', '2023-10-21 06:45:37'),
(319, 'XL', 320, '2023-10-21 06:47:15', '2023-10-21 06:47:15'),
(320, 'XL', 321, '2023-10-21 06:48:22', '2023-10-21 06:48:22'),
(321, 'XL', 322, '2023-10-21 06:49:48', '2023-10-21 06:49:48'),
(335, 'XL', 59, '2023-10-22 07:34:04', '2023-10-22 07:34:04'),
(336, 'L', 59, '2023-10-22 07:35:25', '2023-10-22 07:35:25'),
(342, 'XL', 51, '2023-10-22 07:59:23', '2023-10-22 07:59:23'),
(343, 'XXL', 51, '2023-10-22 08:00:31', '2023-10-22 08:00:31'),
(344, 'XXXL', 51, '2023-10-22 08:01:12', '2023-10-22 08:01:12'),
(345, 'S', 49, '2023-10-22 08:02:54', '2023-10-22 08:02:54'),
(346, 'L', 49, '2023-10-22 08:04:03', '2023-10-22 08:04:03'),
(347, 'XL', 49, '2023-10-22 08:05:00', '2023-10-22 08:05:00'),
(349, 'XXXL', 61, '2023-10-22 08:11:15', '2023-10-22 08:11:15'),
(350, 'L', 61, '2023-10-22 08:12:31', '2023-10-22 08:12:31'),
(351, 'L', 64, '2023-10-22 08:14:57', '2023-10-22 08:14:57'),
(352, 'XXL', 64, '2023-10-22 08:15:43', '2023-10-22 08:15:43'),
(353, 'XXXL', 64, '2023-10-22 08:16:24', '2023-10-22 08:16:24'),
(354, 'NO SIZE', 323, '2023-10-29 18:45:51', '2023-10-29 18:45:51'),
(355, 'NO SIZE', 324, '2023-10-29 18:46:45', '2023-10-29 18:46:45'),
(356, 'NO SIZE', 325, '2023-10-29 18:47:28', '2023-10-29 18:47:28'),
(357, 'NO SIZE', 326, '2023-10-29 18:48:56', '2023-10-29 18:48:56'),
(358, 'NO SIZE', 327, '2023-10-29 18:49:38', '2023-10-29 18:49:38'),
(359, 'NO SIZE', 328, '2023-10-29 18:50:23', '2023-10-29 18:50:23'),
(360, 'NO SIZE', 329, '2023-10-29 18:51:59', '2023-10-29 18:51:59'),
(361, 'NO SIZE', 330, '2023-10-29 18:56:20', '2023-10-29 18:56:20'),
(362, 'NO SIZE', 331, '2023-10-29 19:01:02', '2023-10-29 19:01:02'),
(363, 'NO SIZE', 332, '2023-10-29 19:07:35', '2023-10-29 19:07:35'),
(364, 'NO SIZE', 333, '2023-10-29 19:22:48', '2023-10-29 19:22:48'),
(365, 'NO SIZE', 334, '2023-10-29 19:22:55', '2023-10-29 19:22:55'),
(366, 'NO SIZE', 335, '2023-10-29 19:28:20', '2023-10-29 19:28:20'),
(367, 'NO SIZE', 336, '2023-10-29 19:30:55', '2023-10-29 19:30:55'),
(368, 'NO SIZE', 337, '2023-10-29 19:31:59', '2023-10-29 19:31:59'),
(369, 'NO SIZE', 338, '2023-10-29 19:35:07', '2023-10-29 19:35:07'),
(370, 'NO SIZE', 339, '2023-10-29 19:36:11', '2023-10-29 19:36:11'),
(371, 'NO SIZE', 340, '2023-10-29 19:39:40', '2023-10-29 19:39:40'),
(372, 'NO SIZE', 341, '2023-10-29 19:40:47', '2023-10-29 19:40:47'),
(373, 'NO SIZE', 342, '2023-10-29 19:42:04', '2023-10-29 19:42:04'),
(374, 'NO SIZE', 343, '2023-10-29 19:46:01', '2023-10-29 19:46:01'),
(375, 'NO SIZE', 344, '2023-10-29 19:47:36', '2023-10-29 19:47:36'),
(376, 'NO SIZE', 345, '2023-10-29 19:48:56', '2023-10-29 19:48:56'),
(377, 'NO SIZE', 346, '2023-10-29 19:51:01', '2023-10-29 19:51:01'),
(378, 'NO SIZE', 347, '2023-10-29 19:52:07', '2023-10-29 19:52:07'),
(379, 'NO SIZE', 348, '2023-10-29 19:53:16', '2023-10-29 19:53:16'),
(380, 'NO SIZE', 349, '2023-10-29 19:54:30', '2023-10-29 19:54:30'),
(381, 'NO SIZE', 350, '2023-10-29 19:58:58', '2023-10-29 19:58:58'),
(382, 'NO SIZE', 351, '2023-10-29 19:59:29', '2023-10-29 19:59:29'),
(383, 'NO SIZE', 352, '2023-10-29 20:00:08', '2023-10-29 20:00:08'),
(384, 'NO SIZE', 353, '2023-10-29 20:00:41', '2023-10-29 20:00:41'),
(385, 'NO SIZE', 354, '2023-10-29 20:01:22', '2023-10-29 20:01:22'),
(386, 'NO SIZE', 355, '2023-10-29 20:06:13', '2023-10-29 20:06:13'),
(387, 'NO SIZE', 356, '2023-10-29 20:08:41', '2023-10-29 20:08:41'),
(388, 'NO SIZE', 357, '2023-10-29 20:09:36', '2023-10-29 20:09:36'),
(389, 'NO SIZE', 358, '2023-10-29 20:10:32', '2023-10-29 20:10:32'),
(390, 'NO SIZE', 359, '2023-10-29 20:11:29', '2023-10-29 20:11:29'),
(391, 'NO SIZE', 360, '2023-10-29 20:13:02', '2023-10-29 20:13:02'),
(392, 'NO SIZE', 361, '2023-10-29 20:14:42', '2023-10-29 20:14:42'),
(393, 'NO SIZE', 362, '2023-10-29 20:15:58', '2023-10-29 20:15:58'),
(394, 'NO SIZE', 363, '2023-10-29 20:16:34', '2023-10-29 20:16:34'),
(395, 'NO SIZE', 364, '2023-10-29 20:18:52', '2023-10-29 20:18:52'),
(396, 'NO SIZE', 365, '2023-10-29 20:19:56', '2023-10-29 20:19:56'),
(397, 'ONE SIZE', 366, '2023-12-19 15:44:30', '2023-12-19 15:44:30'),
(399, 'M', 368, '2023-12-19 16:12:26', '2023-12-19 16:12:26'),
(400, 'ONE SIZE', 369, '2023-12-21 01:07:26', '2023-12-21 01:07:26'),
(403, 'ONE SIZE', 372, '2024-01-11 16:49:05', '2024-01-11 16:49:05');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating_value` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `rating_value`, `comment`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(2, 4, NULL, 4, 331, '2023-11-15 13:26:52', '2023-11-15 13:26:52'),
(3, 4, NULL, 4, 297, '2023-11-15 14:30:49', '2023-11-15 14:30:49'),
(5, 1, 'Hello', 4, 339, '2023-11-15 14:42:02', '2023-11-15 14:42:02'),
(6, 4, 'hello i’m faten', 4, 300, '2024-01-13 18:38:44', '2024-01-13 18:38:44'),
(7, 4, 'This\'s beautiful product ♥', 9, 311, '2024-01-14 19:02:18', '2024-01-14 19:02:18'),
(8, 5, 'hi', 4, 305, '2024-01-19 23:10:01', '2024-01-19 23:10:01'),
(9, 5, 'its perfect pattern of blazer ♥', 10, 298, '2024-02-04 18:19:34', '2024-02-04 18:19:34'),
(10, 5, 'I loved soooo much ♥', 11, 300, '2024-02-04 19:07:15', '2024-02-04 19:07:15'),
(11, 5, 'it\'s soooo beautiful ♥♥', 11, 258, '2024-02-04 19:10:30', '2024-02-04 19:10:30');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Jackets', 1, '2023-10-11 14:58:58', '2023-10-11 14:58:58'),
(2, 'Pants', 1, '2023-10-11 14:59:13', '2023-10-11 14:59:13'),
(3, 'Shorts', 1, '2023-10-11 14:59:29', '2023-10-11 14:59:29'),
(4, 'Shirts', 1, '2023-10-11 14:59:49', '2023-10-11 14:59:49'),
(5, 'Jackets', 2, '2023-10-11 15:00:42', '2023-10-11 15:00:42'),
(6, 'Pants', 2, '2023-10-11 15:00:52', '2023-10-11 15:00:52'),
(7, 'Shirts', 2, '2023-10-11 15:01:08', '2023-10-11 15:01:08'),
(8, 'Shorts', 2, '2023-10-11 15:01:20', '2023-10-11 15:01:20'),
(9, 'Jackets', 3, '2023-10-11 15:02:16', '2023-10-11 15:02:16'),
(10, 'Pants', 3, '2023-10-11 15:02:23', '2023-10-11 15:02:23'),
(11, 'Shirts', 3, '2023-10-11 15:02:37', '2023-10-11 15:02:37'),
(12, 'Shorts', 3, '2023-10-11 15:02:56', '2023-10-11 15:02:56'),
(13, 'Man_Sunglasses', 4, '2023-10-11 15:03:53', '2023-10-11 15:03:53'),
(14, 'Man_Hats', 4, '2023-10-11 15:04:04', '2023-10-11 15:04:04'),
(15, 'Man_Wallet', 4, '2023-10-11 15:04:12', '2023-10-11 15:04:12'),
(16, 'Man_Watch', 4, '2023-10-11 15:04:22', '2023-10-11 15:04:22'),
(17, 'Earrings', 4, '2023-10-11 15:04:41', '2023-10-11 15:04:41'),
(18, 'Woman_Hats', 4, '2023-10-11 15:05:46', '2023-10-11 15:05:46'),
(19, 'Woman_Scarves', 4, '2023-10-11 15:07:27', '2023-10-11 15:07:27'),
(20, 'Woman_Sunglasses', 4, '2023-10-11 15:07:39', '2023-10-11 15:07:39'),
(21, 'Woman_Travel_Accessories', 4, '2023-10-11 15:08:21', '2023-10-11 15:08:21'),
(22, 'Rings', 4, '2023-10-11 15:08:41', '2023-10-11 15:08:41'),
(23, 'Necklace', 4, '2023-10-11 15:08:56', '2023-10-11 15:08:56'),
(24, 'Man', 5, '2023-10-11 15:10:41', '2023-10-11 15:10:41'),
(25, 'Travel_Bags', 5, '2023-10-11 15:11:03', '2023-10-11 15:11:03'),
(26, 'Hand_Bags', 5, '2023-10-11 15:11:25', '2023-10-11 15:11:25'),
(27, 'Clutch_Bags', 5, '2023-10-11 15:11:39', '2023-10-11 15:11:39'),
(28, 'Beach_Bags', 5, '2023-10-11 15:11:50', '2023-10-11 15:11:50'),
(29, 'Backpack_Bags', 5, '2023-10-11 15:14:51', '2023-10-11 15:14:51'),
(30, 'Foundation', 6, '2023-10-11 15:16:03', '2023-10-11 15:16:03'),
(31, 'Eyeliner', 6, '2023-10-11 15:16:13', '2023-10-11 15:16:13'),
(32, 'Eyeshadow', 6, '2023-10-11 15:16:31', '2023-10-11 15:16:31'),
(33, 'BB_CC_Cream', 6, '2023-10-11 15:16:47', '2023-10-11 15:16:47'),
(34, 'Face_Primer', 6, '2023-10-11 15:17:10', '2023-10-11 15:17:10'),
(35, 'Mascara', 6, '2023-10-11 15:17:25', '2023-10-11 15:17:25'),
(36, 'LipGloss', 6, '2023-10-11 15:17:44', '2023-10-11 15:17:44'),
(37, 'Lipstick', 6, '2023-10-11 15:17:58', '2023-10-11 15:17:58'),
(38, 'Shoes', 2, '2023-10-21 04:18:51', '2023-10-21 04:18:51'),
(41, 'Sweatshirts & Hoodies', 2, '2023-12-19 15:02:45', '2023-12-19 15:02:45'),
(42, 'Tops', 2, '2023-12-27 17:53:45', '2023-12-27 17:53:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `main_address` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_type` enum('0','1') NOT NULL DEFAULT '1',
  `gender` enum('male','female') NOT NULL DEFAULT 'male',
  `password` varchar(255) NOT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `provider_name` varchar(255) DEFAULT NULL,
  `provider_token` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `country_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `phone`, `main_address`, `image`, `user_type`, `gender`, `password`, `provider_id`, `provider_name`, `provider_token`, `remember_token`, `created_at`, `updated_at`, `country_id`) VALUES
(4, 'Faten Elmarzouki', 'fatenel@gmail.com', '2023-10-10 09:19:35', '01030447681', 'perssonal infodddddddddddddddddd', 'User Images/PKiWnk4AQp3DWqqmpstq7ZnPEIBhabCzERZj6bL6.jpg', '1', 'female', '$2y$12$NO7uvRSjzir5M4m7ijKzp.TImvPQtBwH7g9wTrgFzgxFdRUfGD.iC', NULL, NULL, NULL, 'mvM0ZUtTCVVHV8cAws073HB9ISejHa1Xscs0mIvGDnCiS3Byumre8vh046Ey', '2023-10-10 09:08:01', '2024-02-05 23:59:17', 11),
(5, 'Rizk', 'admin@FTRU.com', '2023-12-10 22:08:06', '01030447681', NULL, NULL, '0', 'male', '$2y$12$FPijxVNi6Vbc0rYbGeDR2Oe5S6XW8dNOh4QI1cIHS96oBLAbxA9gO', NULL, NULL, NULL, NULL, '2023-12-10 22:08:06', '2024-01-13 18:36:40', 4),
(9, 'lara', 'fatenelmarzou@gmail.com', '2024-01-09 20:57:47', '01804476811', 'nasr', NULL, '1', 'female', '$2y$12$5.gTPFJy5mlAavu93BrWLe8Tvm95h8RmDLl68Ocp89s9HCXU4J5KO', NULL, NULL, NULL, '2714U9EUJwWCtWqHxT1NXGkjjo6rURsbpryu4573P9bqwtYjA5ahS0W9PjGh', '2024-01-14 18:53:55', '2024-01-14 18:53:55', 12),
(10, 'ahlam', 'ahlamlmarzouki@gmail.com', '2024-02-04 17:56:34', '01092779987', '45 street abo lban mosque', NULL, '1', 'female', '$2y$12$hhIA5A/IcX1BXLxT3SYM2.3Ce5K18h7M0NERGnvrfIjRpPtna6Mce', NULL, NULL, NULL, NULL, '2024-02-04 17:54:43', '2024-02-04 18:40:29', 6),
(11, 'Amira Mohammed', 'amiraelmaruki221@gmail.com', '2024-02-04 18:58:27', '01202256658', 'Cairo', NULL, '1', 'female', '$2y$12$uGW.4EVD7saOa3AWya0K4.l0sgciIu4AZNdEHq9pCUi94sTJzbdU.', NULL, NULL, NULL, NULL, '2024-02-04 18:56:51', '2024-02-04 19:15:45', 6);

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `count`, `created_at`, `updated_at`) VALUES
(1, 44, '2023-12-30 21:58:40', '2024-02-12 05:56:21');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(30, 4, 201, '2024-01-21 22:25:05', '2024-01-21 22:25:05'),
(32, 10, 369, '2024-02-04 18:06:15', '2024-02-04 18:06:15'),
(33, 11, 319, '2024-02-04 19:01:52', '2024-02-04 19:01:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`),
  ADD KEY `addresses_country_id_foreign` (`country_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_product_color_size_id_foreign` (`product_color_size_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_address_id_foreign` (`address_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_color_size_id_foreign` (`product_color_size_id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `otps_email_unique` (`email`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_subcategory_id_foreign` (`sub_category_id`);

--
-- Indexes for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_colors_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_color_sizes`
--
ALTER TABLE `product_color_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_color_sizes_product_size_id_foreign` (`product_size_id`),
  ADD KEY `product_color_sizes_product_color_id_foreign` (`product_color_id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_sizes_product_id_foreign` (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_country_id_foreign` (`country_id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=373;

--
-- AUTO_INCREMENT for table `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=408;

--
-- AUTO_INCREMENT for table `product_color_sizes`
--
ALTER TABLE `product_color_sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=411;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=407;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `cart_items_product_color_size_id_foreign` FOREIGN KEY (`product_color_size_id`) REFERENCES `product_color_sizes` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_product_color_size_id_foreign` FOREIGN KEY (`product_color_size_id`) REFERENCES `product_color_sizes` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`);

--
-- Constraints for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD CONSTRAINT `product_colors_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_color_sizes`
--
ALTER TABLE `product_color_sizes`
  ADD CONSTRAINT `product_color_sizes_product_color_id_foreign` FOREIGN KEY (`product_color_id`) REFERENCES `product_colors` (`id`),
  ADD CONSTRAINT `product_color_sizes_product_size_id_foreign` FOREIGN KEY (`product_size_id`) REFERENCES `product_sizes` (`id`);

--
-- Constraints for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `product_sizes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
