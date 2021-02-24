-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: feb. 24, 2021 la 08:28 PM
-- Versiune server: 10.4.17-MariaDB
-- Versiune PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `redstore`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'T - Shirt', '2021-02-22 16:00:13', '2021-02-22 16:00:13'),
(2, 'Socks', '2021-02-22 16:00:31', '2021-02-24 13:24:21'),
(3, 'Pants', '2021-02-22 16:00:38', '2021-02-22 16:00:38'),
(4, 'Hoodies', '2021-02-22 16:00:45', '2021-02-22 16:00:45'),
(5, 'Watch', '2021-02-22 16:00:50', '2021-02-22 16:00:50'),
(6, 'Underwear', '2021-02-22 16:01:12', '2021-02-22 16:01:12'),
(7, 'Hats', '2021-02-22 16:01:31', '2021-02-22 16:01:31'),
(8, 'Shorts', '2021-02-22 16:01:38', '2021-02-22 16:01:38'),
(9, 'Shoes', '2021-02-22 16:02:01', '2021-02-22 16:02:01');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2021_02_21_101748_create_categories_table', 1),
(10, '2021_02_21_102515_create_orders_table', 1),
(11, '2021_02_21_103531_create_products_table', 1);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0f12488f93d0e428b6d20fbc48b6298a15bdc5073a29d5796479d373c52670dd74131a2285a73259', 2, 1, 'accessToken', '[]', 0, '2021-02-24 16:23:01', '2021-02-24 16:23:01', '2022-02-24 18:23:01'),
('1dbf82efc2378d41694a060d402cb587f604e828a5f8b441b51a924662824739de22b492a36aad9a', 4, 1, 'accessToken', '[]', 0, '2021-02-24 16:33:00', '2021-02-24 16:33:00', '2022-02-24 18:33:00'),
('1e667e18e682aa3bce00975d10ac782416427d55a73d52f2f6e22e58d6d226ba7cede87feb64e400', 2, 1, 'accessToken', '[]', 0, '2021-02-22 19:51:07', '2021-02-22 19:51:07', '2022-02-22 21:51:07'),
('535d9aa6e7d3a98707de7affd9471026fe3f9eb083e026b815bab64c0ad04913ef24936ed1d1ad59', 2, 1, 'accessToken', '[]', 0, '2021-02-24 16:21:53', '2021-02-24 16:21:53', '2022-02-24 18:21:53'),
('5a442c78277affe7413330530c19b8ddc6c3ae2807b4103314573f66ea1545ecd9252dfb4544fb84', 2, 1, 'accessToken', '[]', 0, '2021-02-24 16:26:15', '2021-02-24 16:26:15', '2022-02-24 18:26:15'),
('bb2cdba32b9338cd8d43d5d0eab584b649acc42ad53b6378cabaa3e8accd09fdc933551368278471', 3, 1, 'accessToken', '[]', 0, '2021-02-24 16:26:33', '2021-02-24 16:26:33', '2022-02-24 18:26:33'),
('bbf7daab11e77c159cb0da01beb0b5974d145de514288bcea0f3036c5c2a531e8edea13c30e6bc34', 3, 1, 'accessToken', '[]', 0, '2021-02-24 16:21:09', '2021-02-24 16:21:09', '2022-02-24 18:21:09'),
('c1661d52c389f3e307397c4481cf2cab5acf3607d5c9852ba41ee4686cb1c4011294a2856d3933ba', 2, 1, 'accessToken', '[]', 0, '2021-02-24 17:22:18', '2021-02-24 17:22:18', '2022-02-24 19:22:18'),
('e1fdda4d3abe77a24af29e87642020aad642bfc79bb1fc1a07ae72e0461e74818f5afdf9badbe6f6', 1, 1, 'accessToken', '[]', 0, '2021-02-22 16:03:47', '2021-02-22 16:03:47', '2022-02-22 18:03:47');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'WL8TlST9q7uFOujJ5XB3jGHNBUkX2tpuLAVV3bI3', NULL, 'http://localhost', 1, 0, 0, '2021-02-22 16:03:42', '2021-02-22 16:03:42'),
(2, NULL, 'Laravel Password Grant Client', 'vRiMEAyFPPcWFr4K1oh5l3uCKyLnjWDooyLbLS1B', 'users', 'http://localhost', 0, 1, 0, '2021-02-22 16:03:42', '2021-02-22 16:03:42');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-02-22 16:03:42', '2021-02-22 16:03:42');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `total_price` decimal(8,2) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `count` bigint(20) NOT NULL,
  `sold` bigint(20) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `products`
--

INSERT INTO `products` (`id`, `name`, `gender`, `img`, `price`, `count`, `sold`, `category_id`, `order_id`, `description`, `code`, `created_at`, `updated_at`) VALUES
(52, 'Assumenda nobis nihil incidunt qui autem inventore.', 'women', 'https://via.placeholder.com/640x480.png/00ff44?text=blanditiis', '19.39', 9, 35, 4, NULL, 'Officiis fuga facilis quidem et atque nam blanditiis voluptatem et.', '6033f299b8fb0', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(53, 'Voluptas enim nihil voluptas sapiente rem nam autem.', 'men', 'https://via.placeholder.com/640x480.png/003399?text=et', '65.54', 1, 129, 3, NULL, 'Voluptatem delectus laborum sed itaque eaque.', '6033f299b9044', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(55, 'Natus possimus ipsa et dicta veritatis quo pariatur exercitationem.', 'women', 'https://via.placeholder.com/640x480.png/003344?text=aut', '95.71', 2, 18, 1, NULL, 'Et sequi earum id quia repellat similique et eos dolor.', '6033f299b911b', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(56, 'Debitis dolores minima et possimus modi magnam.', 'women', 'https://via.placeholder.com/640x480.png/00bbff?text=voluptatibus', '30.82', 15, 81, 5, NULL, 'Vero voluptatibus consequatur dolorem est harum placeat provident rerum hic.', '6033f299b9186', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(57, 'Minima numquam tenetur sint exercitationem. Rem nisi autem dolore illo.', 'women', 'https://via.placeholder.com/640x480.png/00cc33?text=sed', '57.06', 11, 8, 8, NULL, 'Quo modi quo eveniet fugit laboriosam dolores consequatur.', '6033f299b91f0', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(58, 'Autem natus voluptatum delectus aut numquam quis.', 'women', 'https://via.placeholder.com/640x480.png/0088dd?text=doloribus', '1.28', 6, 93, 1, NULL, 'Et ducimus nobis cum qui officiis ipsam totam veniam voluptatem.', '6033f299b9262', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(59, 'Voluptatem enim dolores nam labore labore cupiditate.', 'women', 'https://via.placeholder.com/640x480.png/007788?text=qui', '72.13', 17, 103, 6, NULL, 'Delectus quam quae necessitatibus amet et non dicta magni necessitatibus assumenda.', '6033f299b92d4', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(60, 'Nisi eligendi alias est. Mollitia rerum similique consequatur dolores aut nam.', 'men', 'https://via.placeholder.com/640x480.png/0077cc?text=placeat', '23.64', 1, 54, 2, NULL, 'Numquam beatae modi eligendi non quidem.', '6033f299b933c', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(61, 'Praesentium autem dolor qui eligendi est et id.', 'men', 'https://via.placeholder.com/640x480.png/00dd44?text=aut', '51.18', 14, 118, 7, NULL, 'Velit qui est quis debitis sit autem rerum ut similique.', '6033f299b93a3', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(62, 'Nesciunt dolores ea rem quod excepturi.', 'women', 'https://via.placeholder.com/640x480.png/005544?text=ut', '39.58', 4, 11, 6, NULL, 'Et delectus harum sed enim doloribus explicabo dolore sed.', '6033f299b940a', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(64, 'Ut et reiciendis aut cupiditate.', 'women', 'https://via.placeholder.com/640x480.png/00ff77?text=perferendis', '90.63', 5, 117, 3, NULL, 'Nulla harum et exercitationem id voluptatem dolorem voluptatem voluptate sed et.', '6033f299b94dc', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(65, 'Suscipit reiciendis eos culpa non.', 'women', 'https://via.placeholder.com/640x480.png/006644?text=enim', '66.67', 3, 45, 6, NULL, 'Quidem et sit numquam suscipit non quia atque modi.', '6033f299b9542', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(66, 'Excepturi et voluptate repudiandae et mollitia quidem.', 'women', 'https://via.placeholder.com/640x480.png/0033ee?text=nostrum', '2.33', 6, 120, 9, NULL, 'Autem est qui itaque consectetur quia illum maxime sunt corporis et.', '6033f299b95ae', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(67, 'Repellendus eum ut rerum voluptas iure corporis molestias.', 'men', 'https://via.placeholder.com/640x480.png/007799?text=at', '87.90', 12, 58, 6, NULL, 'Et repudiandae sint ut omnis quibusdam voluptates harum et quibusdam.', '6033f299b9615', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(68, 'Eos esse quos deserunt et consectetur et. Libero voluptas et accusamus omnis.', 'women', 'https://via.placeholder.com/640x480.png/0055ff?text=placeat', '3.33', 3, 137, 1, NULL, 'Enim ea aut quod dignissimos qui distinctio autem non quidem.', '6033f299b968d', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(69, 'Facere similique odit sapiente dolor adipisci illum.', 'women', 'https://via.placeholder.com/640x480.png/008833?text=qui', '26.76', 12, 89, 1, NULL, 'Dolores quisquam quo ratione ut et consequatur.', '6033f299b96f3', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(70, 'Et dolorem ut sint aspernatur.', 'men', 'https://via.placeholder.com/640x480.png/00aa55?text=et', '11.95', 12, 11, 2, NULL, 'Animi et ea qui quisquam recusandae saepe at molestiae et.', '6033f299b9759', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(71, 'Laudantium exercitationem sint quia. Praesentium incidunt a at enim.', 'women', 'https://via.placeholder.com/640x480.png/001133?text=esse', '14.91', 15, 66, 2, NULL, 'Dolores debitis explicabo et unde harum dicta sit quasi molestiae est.', '6033f299b97c6', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(72, 'Voluptas esse veniam sed non repellendus qui. Fugit vel a et sint minima non.', 'men', 'https://via.placeholder.com/640x480.png/00cc00?text=sed', '36.21', 3, 35, 5, NULL, 'Et sint reprehenderit omnis tempora aspernatur ex nihil nemo distinctio.', '6033f299b9838', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(73, 'Totam aut corporis id in. Unde saepe laboriosam molestiae harum commodi.', 'women', 'https://via.placeholder.com/640x480.png/00aabb?text=autem', '82.06', 5, 132, 2, NULL, 'Nobis iste consequatur blanditiis nostrum explicabo corrupti sunt molestiae accusamus aut ipsa.', '6033f299b98a5', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(74, 'Eius et iusto autem esse. Reprehenderit quia itaque vero quia.', 'men', 'https://via.placeholder.com/640x480.png/0077aa?text=ipsam', '83.92', 18, 137, 9, NULL, 'Qui et autem nesciunt sint dolorem quidem.', '6033f299b990d', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(75, 'Omnis in excepturi facere omnis est libero.', 'women', 'https://via.placeholder.com/640x480.png/0044dd?text=dolor', '43.67', 1, 45, 9, NULL, 'Rerum molestiae qui ea ea eius enim corrupti beatae ut.', '6033f299b9977', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(76, 'Fuga qui quia qui cum rerum dolor totam dignissimos.', 'men', 'https://via.placeholder.com/640x480.png/005500?text=et', '73.00', 14, 19, 6, NULL, 'Minima delectus dolorum minus corrupti est incidunt praesentium voluptatem.', '6033f299b99de', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(77, 'Ut ducimus ut blanditiis illo. Est dolorem et et non atque soluta velit illum.', 'men', 'https://via.placeholder.com/640x480.png/00cc44?text=quisquam', '97.09', 14, 73, 8, NULL, 'Beatae et qui ut qui dolorem esse ipsa ratione provident ea ut.', '6033f299b9a5c', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(78, 'Heloooo', 'Women', 'https://www.placeholder.com/320X250', '50.25', 5, 138, 6, NULL, 'Test 2 descripton', '6033f299b9abf', '2021-02-22 16:06:17', '2021-02-24 12:01:48'),
(79, 'Ut laudantium voluptas exercitationem doloribus minima est repellendus iusto.', 'men', 'https://via.placeholder.com/640x480.png/00aacc?text=est', '20.12', 13, 17, 5, NULL, 'Neque vitae vero quas et reprehenderit.', '6033f299b9b25', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(80, 'Molestias excepturi fugit culpa incidunt quia.', 'women', 'https://via.placeholder.com/640x480.png/002255?text=qui', '39.21', 16, 73, 8, NULL, 'Odio quas velit sit ut in perferendis aliquid hic.', '6033f299b9b8a', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(81, 'Recusandae autem fugit vel qui occaecati vel. Vitae et aut dicta aut est illo.', 'men', 'https://via.placeholder.com/640x480.png/0088dd?text=quo', '73.13', 19, 64, 7, NULL, 'Expedita explicabo fuga fuga enim et.', '6033f299b9bf8', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(82, 'Voluptatum adipisci soluta at aut.', 'men', 'https://via.placeholder.com/640x480.png/00ccff?text=doloremque', '92.09', 18, 79, 7, NULL, 'Rem fugiat ex rerum molestias omnis cum dolorum reiciendis inventore ab.', '6033f299b9c5f', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(83, 'Sit illo nemo deleniti.', 'women', 'https://via.placeholder.com/640x480.png/00ee77?text=est', '32.44', 2, 67, 2, NULL, 'Et consectetur delectus illum voluptas accusamus mollitia voluptatum aliquam error aut.', '6033f299b9cc2', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(84, 'Quam qui earum optio quidem repellat.', 'men', 'https://via.placeholder.com/640x480.png/00ee00?text=expedita', '5.97', 3, 112, 1, NULL, 'Nemo laboriosam consequuntur debitis quae sed fugit occaecati quia et rerum natus.', '6033f299b9d2e', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(85, 'Nostrum cupiditate nulla et culpa voluptatem ut.', 'men', 'https://via.placeholder.com/640x480.png/0044ee?text=aut', '72.57', 3, 36, 7, NULL, 'Autem atque neque quo sit ipsa voluptates sapiente et id voluptatum.', '6033f299b9d96', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(87, 'Provident numquam autem soluta a vel deleniti doloribus velit.', 'men', 'https://via.placeholder.com/640x480.png/0000dd?text=quo', '68.94', 11, 88, 9, NULL, 'Vel excepturi molestias velit et voluptatum beatae.', '6033f299b9e67', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(88, 'Et et et inventore quae nihil maxime sed. Molestiae aliquid est in.', 'men', 'https://via.placeholder.com/640x480.png/00aadd?text=amet', '12.92', 2, 4, 4, NULL, 'Sunt velit enim omnis quam eaque in sunt esse.', '6033f299b9eda', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(89, 'Atque qui dolor rerum magnam voluptas. Aut odio et est recusandae.', 'women', 'https://via.placeholder.com/640x480.png/00ccff?text=qui', '61.65', 2, 84, 8, NULL, 'Nulla explicabo quo voluptatem reprehenderit voluptatem rerum debitis sit aspernatur.', '6033f299b9f48', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(90, 'Dolore consequuntur ab asperiores ut ipsa eaque.', 'women', 'https://via.placeholder.com/640x480.png/0044aa?text=deleniti', '78.11', 1, 63, 9, NULL, 'Perferendis iste eos ab praesentium tempora molestiae ea est.', '6033f299b9faf', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(91, 'Quia qui ullam et repellat molestias quis delectus. Illum et eum vel.', 'men', 'https://via.placeholder.com/640x480.png/003388?text=commodi', '66.37', 3, 40, 2, NULL, 'Enim saepe expedita non nemo aspernatur ipsam fugit cupiditate sed.', '6033f299ba01c', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(92, 'A placeat neque enim reprehenderit.', 'women', 'https://via.placeholder.com/640x480.png/00cc22?text=ducimus', '49.89', 18, 142, 6, NULL, 'Excepturi exercitationem consequatur ex sed rerum ut saepe earum.', '6033f299ba081', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(93, 'Exercitationem magni suscipit nihil est.', 'men', 'https://via.placeholder.com/640x480.png/007777?text=vitae', '92.25', 12, 132, 2, NULL, 'Est eum sint libero et illo.', '6033f299ba0de', '2021-02-22 16:06:17', '2021-02-22 16:06:17'),
(103, '4x Updated ad enim doloribus modi cum nihil sapiente id.', 'women', 'https://via.placeholder.com/640x480.png/00ffbb?text=iste', '32.89', 4, 25, 1, NULL, 'Et cum aspernatur voluptas aut saepe dolores.', '6034022e94cd2', '2021-02-22 17:12:46', '2021-02-24 13:25:42'),
(104, 'Nihil dolorem ut qui minus aut nihil quis. Non accusantium doloribus porro.', 'women', 'https://via.placeholder.com/640x480.png/00ff77?text=eos', '62.80', 11, 103, 9, NULL, 'Soluta voluptate quia dignissimos qui voluptatem neque quia.', '6034022e94d46', '2021-02-22 17:12:46', '2021-02-24 15:06:35'),
(105, 'Reiciendis quisquam dolorem libero aut vel sit.', 'women', 'https://via.placeholder.com/640x480.png/000099?text=consequatur', '94.15', 7, 11, 1, NULL, 'Quo repudiandae illo autem voluptatem modi non optio molestiae eveniet culpa.', '6034022e94db5', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(106, 'Et sapiente ipsa et quia culpa. Voluptatem doloremque et qui itaque.', 'women', 'https://via.placeholder.com/640x480.png/0000ee?text=voluptas', '44.90', 11, 37, 9, NULL, 'Ab qui voluptatem sed maxime delectus voluptas iure.', '6034022e94e26', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(110, 'Nemo sunt rem et provident fuga delectus quia.', 'women', 'https://via.placeholder.com/640x480.png/00bbaa?text=magni', '58.13', 17, 111, 5, NULL, 'Reiciendis aspernatur nihil beatae est repudiandae veniam officia et.', '6034022e94fce', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(112, 'Sit at aliquid officia et enim accusantium vitae.', 'women', 'https://via.placeholder.com/640x480.png/00bbee?text=porro', '82.25', 10, 18, 1, NULL, 'Veritatis iste magni et pariatur aut et dolorum nam repudiandae sequi.', '6034022e950ad', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(116, 'Et impedit consequatur incidunt numquam.', 'women', 'https://via.placeholder.com/640x480.png/002200?text=incidunt', '72.79', 13, 89, 8, NULL, 'Aliquam accusamus placeat facilis eveniet ut dolores rerum repellat.', '6034022e9525a', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(120, 'Ab omnis vitae nostrum at ipsam voluptatem.', 'women', 'https://via.placeholder.com/640x480.png/006699?text=laboriosam', '34.80', 11, 130, 4, NULL, 'Corporis autem quia qui consequuntur modi velit autem.', '6034022e953f1', '2021-02-22 17:12:46', '2021-02-24 13:23:11'),
(121, 'Voluptatibus aliquid suscipit omnis.', 'men', 'https://via.placeholder.com/640x480.png/005544?text=consequuntur', '65.00', 11, 140, 3, NULL, 'Tempore a placeat veritatis sit tenetur quia animi veniam aspernatur.', '6034022e9545a', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(123, 'Rerum deserunt dolor eum sed.', 'men', 'https://via.placeholder.com/640x480.png/00ff22?text=modi', '32.09', 6, 92, 4, NULL, 'Sequi soluta est sapiente pariatur aspernatur illum facilis veritatis illum.', '6034022e95527', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(125, 'Aut debitis suscipit vitae qui id voluptas. Similique aut quo labore occaecati.', 'women', 'https://via.placeholder.com/640x480.png/007711?text=ut', '85.42', 11, 23, 3, NULL, 'Provident odit similique qui aspernatur eveniet recusandae voluptatum quis.', '6034022e95600', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(126, 'Pariatur in tempora dolorem quod omnis sit harum occaecati.', 'men', 'https://via.placeholder.com/640x480.png/00cc55?text=architecto', '49.72', 8, 84, 7, NULL, 'Aperiam quam quia et ducimus.', '6034022e95661', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(127, 'Quaerat aperiam voluptatem sit est voluptatem non fugiat.', 'men', 'https://via.placeholder.com/640x480.png/00cc33?text=eos', '51.71', 15, 7, 4, NULL, 'Vitae unde itaque velit rerum ipsum.', '6034022e956c3', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(128, 'Aut ducimus enim nostrum dignissimos repudiandae repudiandae et.', 'men', 'https://via.placeholder.com/640x480.png/0000ee?text=debitis', '52.35', 6, 100, 9, NULL, 'Dolor molestias excepturi iusto labore iusto aut.', '6034022e95727', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(129, 'Quo accusantium voluptate omnis ipsam. Voluptates qui assumenda quia.', 'women', 'https://via.placeholder.com/640x480.png/004400?text=soluta', '47.59', 20, 146, 7, NULL, 'Ipsum at maiores deleniti laborum nihil.', '6034022e95792', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(130, 'Fugiat ut qui id cum ut. Odio inventore sit quod alias ratione omnis alias.', 'women', 'https://via.placeholder.com/640x480.png/003344?text=dolorem', '68.10', 3, 15, 5, NULL, 'Qui hic quo recusandae suscipit minus inventore.', '6034022e957fe', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(131, 'Voluptates qui aspernatur impedit sed porro.', 'men', 'https://via.placeholder.com/640x480.png/004466?text=ipsum', '88.22', 20, 105, 5, NULL, 'Odio officia nisi non nihil ut.', '6034022e95861', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(132, 'Eaque assumenda quis saepe voluptatem dolorem et nobis.', 'men', 'https://via.placeholder.com/640x480.png/009988?text=repudiandae', '41.67', 7, 97, 7, NULL, 'Quia praesentium possimus quos eos est sit autem.', '6034022e958ca', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(133, 'Iste est nihil ad eos adipisci est magni.', 'women', 'https://via.placeholder.com/640x480.png/004455?text=quis', '83.03', 15, 33, 6, NULL, 'Ut perspiciatis odio officia ex saepe laborum veritatis quia blanditiis aut.', '6034022e95939', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(134, 'In aperiam at qui voluptatem unde quis sequi. Eos ipsum aut laboriosam sequi.', 'men', 'https://via.placeholder.com/640x480.png/00dd11?text=placeat', '2.04', 17, 87, 9, NULL, 'Earum animi dolores quam quibusdam iusto doloremque.', '6034022e959a6', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(135, 'Nemo natus voluptate commodi. Et voluptas repellat omnis.', 'women', 'https://via.placeholder.com/640x480.png/0011cc?text=itaque', '73.62', 6, 98, 4, NULL, 'Asperiores sint quaerat consequatur aut adipisci minus quas dolore est et.', '6034022e95a10', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(136, 'Sapiente rem veritatis necessitatibus et sed.', 'men', 'https://via.placeholder.com/640x480.png/00dd88?text=ipsum', '3.13', 19, 107, 5, NULL, 'Accusamus eos quibusdam accusantium eius provident animi sed minus magnam.', '6034022e95a78', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(137, 'Quaerat aliquid non maiores id eius. Neque totam dignissimos alias ipsum.', 'women', 'https://via.placeholder.com/640x480.png/003377?text=cupiditate', '17.48', 2, 17, 9, NULL, 'Corporis voluptatem quo eius debitis perferendis voluptas quidem omnis.', '6034022e95ae8', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(138, 'Natus debitis voluptatem mollitia est. Quia ratione voluptatem ullam soluta.', 'women', 'https://via.placeholder.com/640x480.png/000022?text=quaerat', '14.71', 17, 7, 3, NULL, 'Qui ducimus praesentium non et corrupti omnis facilis neque voluptate distinctio.', '6034022e95b5d', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(139, 'Quas nostrum dolore est ea. Facere non est ut consequatur ut tempore placeat.', 'men', 'https://via.placeholder.com/640x480.png/003366?text=repellat', '66.05', 6, 39, 7, NULL, 'Harum vitae sed quia sit.', '6034022e95bc8', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(140, 'Amet magni quasi quae voluptate et sapiente incidunt.', 'men', 'https://via.placeholder.com/640x480.png/003333?text=et', '42.12', 5, 15, 3, NULL, 'Eos cum qui saepe pariatur.', '6034022e95c26', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(141, 'Qui illum quisquam nemo unde iusto quos enim.', 'men', 'https://via.placeholder.com/640x480.png/005566?text=qui', '70.97', 18, 37, 9, NULL, 'Autem ratione est corporis officiis ut quia excepturi.', '6034022e95c8e', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(142, 'Sed sequi corporis quam.', 'women', 'https://via.placeholder.com/640x480.png/00ccee?text=nulla', '11.12', 11, 84, 5, NULL, 'Exercitationem eligendi quam enim suscipit itaque qui id incidunt non aut.', '6034022e95cf4', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(143, 'Dolorem possimus ut nihil pariatur qui aspernatur veritatis.', 'women', 'https://via.placeholder.com/640x480.png/0022dd?text=enim', '77.53', 15, 69, 9, NULL, 'Quis eum iure unde cumque unde expedita et.', '6034022e95d59', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(145, 'Ad iusto laudantium eius quibusdam hic rerum voluptas.', 'men', 'https://via.placeholder.com/640x480.png/001122?text=rerum', '19.43', 9, 123, 5, NULL, 'Provident ut doloribus et quaerat vitae voluptatibus.', '6034022e95e27', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(146, 'Quia quasi accusantium facilis aliquam vero consequuntur vel.', 'men', 'https://via.placeholder.com/640x480.png/00dd33?text=earum', '68.06', 3, 50, 6, NULL, 'Laborum accusamus dolor vero accusantium nemo sit qui sed ex voluptatem.', '6034022e95e94', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(147, 'Repellendus animi sed et voluptatem velit. Rerum quia deleniti qui minus.', 'men', 'https://via.placeholder.com/640x480.png/0077dd?text=dicta', '13.35', 5, 104, 9, NULL, 'Sequi totam dolorem sed velit quia harum aut ipsum quaerat.', '6034022e95f00', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(148, 'Eos provident ut quo.', 'men', 'https://via.placeholder.com/640x480.png/00ee88?text=aut', '0.11', 8, 145, 1, NULL, 'Est qui nihil distinctio alias nihil.', '6034022e95f65', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(149, 'Et velit soluta aut officia voluptas.', 'men', 'https://via.placeholder.com/640x480.png/00bb22?text=est', '53.38', 10, 102, 3, NULL, 'Magni nihil id qui id adipisci eaque omnis.', '6034022e95fc8', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(150, 'Aut omnis molestiae asperiores quisquam placeat dolore recusandae.', 'women', 'https://via.placeholder.com/640x480.png/005577?text=recusandae', '3.16', 1, 113, 8, NULL, 'Qui praesentium sit vitae et perferendis.', '6034022e9602a', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(151, 'Recusandae esse placeat laboriosam nemo. Optio vel non accusamus tenetur modi.', 'women', 'https://via.placeholder.com/640x480.png/00ccbb?text=laboriosam', '69.16', 15, 123, 3, NULL, 'Qui iure tempore harum est vel.', '6034022e96092', '2021-02-22 17:12:46', '2021-02-22 17:12:46'),
(152, 'Dolorum omnis unde velit voluptas perferendis quaerat quod.', 'men', 'https://via.placeholder.com/640x480.png/00ee11?text=aut', '18.75', 7, 113, 7, NULL, 'Numquam velit delectus molestiae doloribus officiis et qui.', '603691aadc112', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(153, 'Quae ipsa ut facilis dolores eligendi illum minima.', 'women', 'https://via.placeholder.com/640x480.png/00aa11?text=molestiae', '32.67', 9, 85, 2, NULL, 'Doloribus veniam aliquid iste voluptatem occaecati necessitatibus voluptatem.', '603691aadc1a5', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(154, 'Aut magni sunt id ea earum.', 'women', 'https://via.placeholder.com/640x480.png/005533?text=repudiandae', '99.12', 11, 125, 2, NULL, 'Magni possimus nulla enim unde ratione consequatur.', '603691aadc210', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(155, 'Voluptatem repellat natus soluta perferendis.', 'men', 'https://via.placeholder.com/640x480.png/0011aa?text=et', '60.24', 7, 140, 2, NULL, 'Velit in tempore occaecati ab et quis.', '603691aadc271', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(156, 'Perspiciatis dolor est iusto earum rerum modi qui.', 'men', 'https://via.placeholder.com/640x480.png/00cc00?text=et', '28.75', 14, 4, 9, NULL, 'Non labore voluptates fugit libero quae sed.', '603691aadc2da', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(157, 'Saepe atque natus animi pariatur qui aliquid.', 'men', 'https://via.placeholder.com/640x480.png/0088ff?text=et', '85.51', 7, 100, 3, NULL, 'Harum dolores optio earum rerum in repellendus ad sit impedit impedit.', '603691aadc345', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(158, 'Aut fugiat aut doloribus maxime ea magni. Et maiores eius quidem eos.', 'men', 'https://via.placeholder.com/640x480.png/00aa88?text=velit', '70.67', 17, 54, 2, NULL, 'Iure et labore blanditiis omnis in id.', '603691aadc3ae', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(159, 'Reiciendis doloribus sint voluptas eligendi architecto.', 'men', 'https://via.placeholder.com/640x480.png/00dd44?text=eaque', '68.47', 8, 20, 4, NULL, 'Quis tempore iusto ullam qui possimus maxime soluta ipsum aut.', '603691aadc414', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(160, 'Animi debitis velit veritatis excepturi consequatur consequatur.', 'women', 'https://via.placeholder.com/640x480.png/00cc33?text=sed', '60.20', 12, 19, 4, NULL, 'Sed ad voluptatem eum odit consequatur eos ratione qui distinctio consequatur.', '603691aadc47c', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(161, 'Debitis ut officia voluptas temporibus qui et.', 'women', 'https://via.placeholder.com/640x480.png/00eeaa?text=quos', '28.55', 19, 119, 2, NULL, 'Est voluptas ipsam nesciunt voluptas dolores dolor vitae reprehenderit.', '603691aadc4de', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(162, 'Quia nihil recusandae voluptatum praesentium et voluptate debitis quas.', 'women', 'https://via.placeholder.com/640x480.png/005577?text=explicabo', '96.19', 15, 106, 4, NULL, 'Tempora autem rerum modi odit non blanditiis.', '603691aadc542', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(163, 'Optio id labore ratione eos consequatur nam et. Nam dolor quam aut quis.', 'women', 'https://via.placeholder.com/640x480.png/006666?text=molestiae', '77.86', 11, 101, 8, NULL, 'Rerum nihil inventore autem unde sit ut.', '603691aadc5ac', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(164, 'Voluptas est sunt iusto earum. Enim illo facilis non quia molestiae nam.', 'men', 'https://via.placeholder.com/640x480.png/00aa22?text=vel', '5.41', 15, 87, 4, NULL, 'Qui fugiat est ea natus ut.', '603691aadc612', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(165, 'Ea ut debitis quaerat. Incidunt quia magnam soluta illum.', 'men', 'https://via.placeholder.com/640x480.png/001166?text=sit', '83.78', 11, 9, 7, NULL, 'Rerum itaque nihil cumque corporis saepe qui maiores quasi unde iusto voluptate.', '603691aadc67d', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(166, 'Est inventore architecto beatae voluptatem beatae officia.', 'women', 'https://via.placeholder.com/640x480.png/006655?text=dolores', '9.99', 16, 33, 3, NULL, 'Esse odio est aspernatur itaque ut placeat nihil.', '603691aadc6df', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(167, 'Assumenda voluptatum aut et ab exercitationem.', 'women', 'https://via.placeholder.com/640x480.png/00ddee?text=minima', '47.38', 16, 131, 5, NULL, 'Ipsam in vero nemo totam omnis dolor ipsam.', '603691aadc741', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(168, 'Ducimus dolorum eum illo ex. Dolores sed molestiae incidunt qui non.', 'men', 'https://via.placeholder.com/640x480.png/00bb66?text=ipsa', '45.12', 5, 12, 6, NULL, 'Consequatur repudiandae doloremque consequuntur voluptates voluptatibus molestias architecto officia et deserunt illum.', '603691aadc7b1', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(169, 'Itaque omnis officiis tenetur sint quia.', 'men', 'https://via.placeholder.com/640x480.png/000055?text=et', '29.91', 7, 143, 5, NULL, 'Consequatur unde blanditiis aperiam nobis voluptas.', '603691aadc80e', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(170, 'Consequuntur quam in maxime corporis.', 'women', 'https://via.placeholder.com/640x480.png/0077ff?text=reprehenderit', '32.05', 13, 99, 3, NULL, 'Sunt quia odit nostrum et non dolores.', '603691aadc871', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(171, 'Eos in aut sed. Sint iusto sint dolorum vero.', 'women', 'https://via.placeholder.com/640x480.png/00aaee?text=repellat', '46.35', 18, 133, 1, NULL, 'Dignissimos est veritatis ea rerum qui non corrupti rerum.', '603691aadc8d9', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(172, 'Nesciunt nulla facere commodi quidem.', 'women', 'https://via.placeholder.com/640x480.png/00aabb?text=minima', '51.92', 11, 130, 1, NULL, 'Vel hic eum laborum eaque ipsa magnam laborum voluptatibus saepe.', '603691aadc93e', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(173, 'Iusto placeat impedit saepe odio et aut.', 'men', 'https://via.placeholder.com/640x480.png/002299?text=qui', '76.31', 19, 84, 4, NULL, 'Ab cum rerum voluptate nam ad aliquam dolores natus.', '603691aadc9a1', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(174, 'Voluptatibus totam excepturi doloremque velit ex nihil impedit.', 'women', 'https://via.placeholder.com/640x480.png/000088?text=quam', '18.69', 4, 59, 4, NULL, 'Facilis illum dolorum et voluptas error ratione nisi repellat.', '603691aadca07', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(175, 'Sit dolor ipsam accusantium ea repellat quo.', 'men', 'https://via.placeholder.com/640x480.png/00bb44?text=rerum', '42.89', 9, 145, 6, NULL, 'Soluta eos illum iste aspernatur unde et consequatur.', '603691aadca69', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(176, 'Doloremque at et quia ipsam facilis.', 'women', 'https://via.placeholder.com/640x480.png/001166?text=dolor', '93.81', 2, 124, 5, NULL, 'Placeat quo nam qui dolor dolorum numquam sunt rerum maiores soluta.', '603691aadcad0', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(177, 'Quia et necessitatibus quo consequatur.', 'men', 'https://via.placeholder.com/640x480.png/004477?text=delectus', '15.49', 14, 32, 3, NULL, 'Ullam voluptatem est fuga alias error.', '603691aadcb2c', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(178, 'Harum eius accusantium porro nisi quo. Voluptas perferendis facere illo et.', 'men', 'https://via.placeholder.com/640x480.png/00aa66?text=rerum', '85.73', 20, 114, 9, NULL, 'Sed autem quod molestiae et expedita quos ipsam.', '603691aadcb94', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(179, 'Explicabo aut necessitatibus aspernatur commodi enim reiciendis.', 'women', 'https://via.placeholder.com/640x480.png/00bbee?text=adipisci', '64.11', 17, 72, 5, NULL, 'Quia commodi asperiores ipsam ut illo rerum.', '603691aadcbf9', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(180, 'Ipsum veritatis voluptatibus facere quibusdam quam quod laborum.', 'women', 'https://via.placeholder.com/640x480.png/002266?text=qui', '91.83', 17, 146, 8, NULL, 'Porro est praesentium aliquid sit voluptatem quas a doloribus.', '603691aadcc63', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(181, 'Quidem et deserunt iure et aut et iure et.', 'women', 'https://via.placeholder.com/640x480.png/00ff22?text=rem', '74.01', 2, 7, 1, NULL, 'Assumenda sed perspiciatis neque placeat iusto sed in.', '603691aadccc8', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(182, 'Eos officiis itaque ut beatae qui ullam.', 'women', 'https://via.placeholder.com/640x480.png/00dd88?text=explicabo', '10.11', 6, 46, 3, NULL, 'Voluptas ratione ut corrupti hic voluptas labore sed expedita.', '603691aadcd2e', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(183, 'In voluptates est quis commodi dignissimos.', 'women', 'https://via.placeholder.com/640x480.png/00bb77?text=quam', '51.98', 16, 136, 4, NULL, 'Beatae et inventore autem eum.', '603691aadcd8a', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(184, 'Sapiente ea qui officiis. Hic qui sit eos rerum provident vero.', 'men', 'https://via.placeholder.com/640x480.png/00ee88?text=corrupti', '50.01', 18, 6, 4, NULL, 'Nihil numquam quos eum deleniti ut laboriosam.', '603691aadcdf3', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(185, 'Illum vero fuga facere. Adipisci dolor unde rerum dolores dolorum.', 'women', 'https://via.placeholder.com/640x480.png/00dd44?text=quia', '84.60', 13, 126, 2, NULL, 'Est iste doloremque quia ipsa omnis quod voluptatem.', '603691aadce5c', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(186, 'Magni illo aut distinctio exercitationem odit.', 'women', 'https://via.placeholder.com/640x480.png/004477?text=consequatur', '89.14', 14, 76, 2, NULL, 'Non ab deserunt maxime dolor.', '603691aadcebb', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(187, 'Vitae quas atque vitae dolorem ut. Natus et maxime impedit quo.', 'women', 'https://via.placeholder.com/640x480.png/00ee22?text=quia', '11.56', 2, 54, 3, NULL, 'Asperiores voluptas temporibus iure est non officia aut dolorem ut.', '603691aadcf29', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(188, 'Hic unde temporibus ut ratione nostrum. Rerum sed et voluptatum quo distinctio.', 'women', 'https://via.placeholder.com/640x480.png/00aaee?text=eligendi', '4.46', 19, 81, 6, NULL, 'Dicta error praesentium molestiae enim quidem cum sint incidunt tempora.', '603691aadcf98', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(189, 'Qui et optio delectus error vel. Vel animi debitis omnis commodi perferendis.', 'men', 'https://via.placeholder.com/640x480.png/000077?text=aspernatur', '65.79', 20, 140, 8, NULL, 'In eos et suscipit impedit aut dolore qui aut.', '603691aadd008', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(190, 'Labore molestiae doloremque sed sunt neque.', 'women', 'https://via.placeholder.com/640x480.png/007755?text=quam', '51.47', 10, 87, 4, NULL, 'Ad quas ab numquam accusantium voluptas quisquam quod.', '603691aadd06c', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(191, 'Sint quia voluptas praesentium et omnis soluta ipsam.', 'women', 'https://via.placeholder.com/640x480.png/00aa99?text=accusantium', '62.99', 20, 35, 6, NULL, 'Placeat aut consequatur molestiae sed qui inventore.', '603691aadd0ce', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(192, 'Sequi ut voluptatem harum sed iusto tenetur illum.', 'men', 'https://via.placeholder.com/640x480.png/00bb88?text=dolores', '83.02', 11, 84, 8, NULL, 'Fugit nostrum et voluptates est ut et et eligendi.', '603691aadd133', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(193, 'Numquam placeat est id voluptas sint fugiat quo.', 'women', 'https://via.placeholder.com/640x480.png/00aa77?text=et', '90.16', 2, 54, 3, NULL, 'Occaecati distinctio occaecati non pariatur sit et molestiae omnis distinctio facere.', '603691aadd198', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(194, 'Ullam nesciunt deserunt velit et. Autem mollitia eum neque odit.', 'women', 'https://via.placeholder.com/640x480.png/00aa44?text=ad', '26.89', 4, 137, 3, NULL, 'Dolorem dolor dolor autem est ut expedita aliquid nobis in.', '603691aadd203', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(195, 'Iure blanditiis enim fugit vel. Et praesentium eius minima aperiam.', 'men', 'https://via.placeholder.com/640x480.png/00eeee?text=molestiae', '63.26', 15, 16, 1, NULL, 'Non dolores quae ipsa atque et.', '603691aadd268', '2021-02-24 15:49:30', '2021-02-24 15:49:30'),
(196, 'Rerum rerum asperiores praesentium quos nulla sit.', 'men', 'https://via.placeholder.com/640x480.png/0000bb?text=beatae', '64.08', 3, 63, 4, NULL, 'Aliquam ea et neque voluptatem omnis.', '603691aadd2c6', '2021-02-24 15:49:31', '2021-02-24 15:49:31'),
(197, 'Voluptatem ut facere voluptatem voluptas deleniti consequatur.', 'women', 'https://via.placeholder.com/640x480.png/0088ee?text=ut', '82.90', 9, 68, 6, NULL, 'Harum animi omnis reprehenderit in corporis autem explicabo ea ducimus.', '603691aadd329', '2021-02-24 15:49:31', '2021-02-24 15:49:31'),
(198, 'Beatae unde consequatur aliquam consequatur voluptas sed ut.', 'men', 'https://via.placeholder.com/640x480.png/009911?text=adipisci', '93.35', 3, 95, 7, NULL, 'Ullam et aut eaque vel est.', '603691aadd38b', '2021-02-24 15:49:31', '2021-02-24 15:49:31'),
(199, 'Distinctio sapiente cumque sit cum explicabo blanditiis nulla.', 'women', 'https://via.placeholder.com/640x480.png/0099aa?text=voluptatem', '40.37', 5, 126, 5, NULL, 'Culpa dolorem non ab eaque et rem.', '603691aadd3f1', '2021-02-24 15:49:31', '2021-02-24 15:49:31'),
(200, 'Necessitatibus molestiae aperiam dignissimos quidem veniam et.', 'women', 'https://via.placeholder.com/640x480.png/0011dd?text=accusamus', '14.13', 10, 113, 9, NULL, 'Quaerat sed molestiae sequi aut et ad amet aut architecto.', '603691aadd457', '2021-02-24 15:49:31', '2021-02-24 15:49:31'),
(201, 'Est voluptas sint ullam tenetur rerum voluptatum unde eius.', 'women', 'https://via.placeholder.com/640x480.png/003344?text=ullam', '68.30', 2, 1, 6, NULL, 'Rerum necessitatibus totam fuga ex sit labore enim iure quo distinctio.', '603691aadd4c3', '2021-02-24 15:49:31', '2021-02-24 15:49:31'),
(202, 'Iste quos veniam reiciendis repudiandae pariatur ipsam asperiores.', 'men', 'https://via.placeholder.com/640x480.png/00aa11?text=quas', '67.53', 6, 25, 1, NULL, 'Qui nihil aspernatur veniam suscipit vel quia voluptas excepturi officia a.', '603691ae161ec', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(203, 'Provident repellendus repudiandae animi sunt.', 'women', 'https://via.placeholder.com/640x480.png/001144?text=voluptates', '34.76', 7, 40, 8, NULL, 'Doloribus quis vel nulla sed eius at quisquam quia.', '603691ae16264', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(204, 'Magnam iure nisi et maxime maxime in. Facere velit et aspernatur.', 'men', 'https://via.placeholder.com/640x480.png/008866?text=facere', '66.87', 9, 143, 3, NULL, 'Explicabo consectetur quo ut placeat eos rerum in provident accusamus dignissimos quisquam.', '603691ae162dc', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(205, 'Veritatis aut explicabo placeat animi. Quia minima velit ut hic.', 'women', 'https://via.placeholder.com/640x480.png/009944?text=adipisci', '3.62', 14, 135, 3, NULL, 'Animi est dolorem ut et molestiae veritatis enim consequatur perspiciatis qui nobis.', '603691ae16350', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(206, 'A praesentium officiis odit quia eligendi possimus asperiores.', 'men', 'https://via.placeholder.com/640x480.png/0077dd?text=voluptatem', '62.11', 1, 9, 3, NULL, 'Non nemo aliquam accusantium et.', '603691ae163b0', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(207, 'Esse dolores non et in sunt.', 'men', 'https://via.placeholder.com/640x480.png/00ffbb?text=iure', '71.77', 3, 6, 3, NULL, 'Rerum quo ut quasi sed eum.', '603691ae16414', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(208, 'At maiores eaque excepturi ut.', 'men', 'https://via.placeholder.com/640x480.png/007744?text=animi', '1.95', 3, 34, 9, NULL, 'Itaque qui quis rerum quo ex saepe tenetur nesciunt.', '603691ae16479', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(209, 'Veniam omnis perferendis cupiditate repellendus earum consequuntur omnis.', 'women', 'https://via.placeholder.com/640x480.png/008800?text=aut', '70.03', 7, 37, 2, NULL, 'Et sed possimus cumque aut ipsa.', '603691ae164de', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(210, 'Consequatur et voluptatem quia consequatur qui.', 'men', 'https://via.placeholder.com/640x480.png/00ddee?text=quo', '72.13', 6, 62, 4, NULL, 'Neque et dolorem repudiandae voluptatem sit perspiciatis veniam.', '603691ae16540', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(211, 'Excepturi est tempore repudiandae.', 'men', 'https://via.placeholder.com/640x480.png/000000?text=nihil', '93.80', 2, 125, 9, NULL, 'Esse occaecati sed iure sunt in.', '603691ae165a0', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(212, 'Temporibus quis atque laborum natus.', 'men', 'https://via.placeholder.com/640x480.png/00bb88?text=facere', '36.03', 14, 13, 8, NULL, 'Commodi non ut facere cumque est nam est vel voluptatem voluptatem.', '603691ae1661b', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(213, 'Similique esse sed et fugiat quam quia.', 'men', 'https://via.placeholder.com/640x480.png/00ee77?text=architecto', '5.45', 20, 30, 8, NULL, 'Aut aut sapiente est fugit perspiciatis repellendus veritatis ut.', '603691ae16682', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(214, 'Ut aut et iure accusantium.', 'women', 'https://via.placeholder.com/640x480.png/0077cc?text=in', '89.22', 1, 122, 3, NULL, 'Aut culpa voluptas inventore earum voluptatem tempore exercitationem reiciendis numquam nihil.', '603691ae166e9', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(215, 'Sed eveniet esse nemo vitae facilis porro.', 'women', 'https://via.placeholder.com/640x480.png/001177?text=commodi', '89.29', 3, 84, 4, NULL, 'Aut perspiciatis voluptatem iure dolore cum exercitationem.', '603691ae16749', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(216, 'Aliquam commodi reprehenderit esse facilis quo culpa magni.', 'women', 'https://via.placeholder.com/640x480.png/002222?text=possimus', '97.56', 5, 47, 3, NULL, 'Ut eius quas doloremque atque sit libero reiciendis porro qui ea.', '603691ae167b0', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(217, 'Aut ea et est amet placeat quia est.', 'women', 'https://via.placeholder.com/640x480.png/00bbcc?text=autem', '15.27', 2, 47, 8, NULL, 'Praesentium inventore quibusdam sunt perspiciatis accusamus perspiciatis sint sit error.', '603691ae1681a', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(218, 'Ex culpa ut et enim. Eligendi repudiandae rerum dolore sit velit.', 'women', 'https://via.placeholder.com/640x480.png/009933?text=quisquam', '73.57', 4, 61, 4, NULL, 'Quod quasi reprehenderit dolorem quo molestiae neque deserunt qui et.', '603691ae16885', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(219, 'Similique ipsum similique eligendi sint magnam sit.', 'men', 'https://via.placeholder.com/640x480.png/005577?text=adipisci', '38.58', 15, 60, 9, NULL, 'Commodi porro incidunt placeat corporis non est autem quis perspiciatis.', '603691ae168ec', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(220, 'Qui optio illum molestias voluptatem fugit assumenda tempora quia.', 'men', 'https://via.placeholder.com/640x480.png/00bbcc?text=natus', '14.34', 3, 39, 5, NULL, 'Non est cupiditate consequatur dolorem beatae voluptatem iusto id.', '603691ae16950', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(221, 'Non aut magnam animi suscipit quos officia.', 'women', 'https://via.placeholder.com/640x480.png/008800?text=eum', '89.65', 20, 41, 3, NULL, 'Sint impedit modi molestiae quasi placeat.', '603691ae169b2', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(222, 'Nihil corrupti commodi magnam aut.', 'women', 'https://via.placeholder.com/640x480.png/00dd88?text=magni', '6.51', 12, 5, 9, NULL, 'Explicabo earum et ea dolorem sint ea esse quis.', '603691ae16a14', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(223, 'Tenetur distinctio laboriosam odio odio iusto velit.', 'women', 'https://via.placeholder.com/640x480.png/00eebb?text=qui', '13.36', 8, 137, 6, NULL, 'Qui sed voluptas harum aut porro.', '603691ae16a71', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(224, 'Ut dolorum aut quia sed sed voluptatem placeat.', 'men', 'https://via.placeholder.com/640x480.png/0011bb?text=sequi', '47.22', 5, 64, 5, NULL, 'Ad provident culpa commodi in in cumque.', '603691ae16ad2', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(225, 'Voluptas eaque recusandae est nulla rerum. Sunt velit eum nulla et explicabo.', 'women', 'https://via.placeholder.com/640x480.png/004466?text=amet', '98.78', 5, 90, 5, NULL, 'Voluptates saepe expedita culpa qui voluptatem.', '603691ae16b3e', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(226, 'Quidem voluptatibus expedita dolor ut maiores. Ut sit quidem sed vel.', 'men', 'https://via.placeholder.com/640x480.png/002255?text=ipsa', '26.53', 15, 130, 5, NULL, 'Esse tempore maiores est recusandae blanditiis.', '603691ae16ba4', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(227, 'Earum sint ipsa sed ducimus odit doloremque.', 'women', 'https://via.placeholder.com/640x480.png/0033bb?text=nulla', '93.01', 9, 40, 4, NULL, 'Molestiae est placeat vero enim dolores.', '603691ae16c05', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(228, 'Esse mollitia deserunt eaque corrupti nisi laborum. Et dolorum eligendi quia.', 'women', 'https://via.placeholder.com/640x480.png/0022cc?text=laboriosam', '98.58', 17, 70, 5, NULL, 'Ut dolor est placeat tenetur facere quibusdam doloremque laudantium.', '603691ae16c72', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(229, 'Modi facilis rerum eum laboriosam est qui qui quia.', 'men', 'https://via.placeholder.com/640x480.png/0077ee?text=eum', '6.72', 5, 150, 8, NULL, 'Explicabo sint occaecati distinctio id illo ut.', '603691ae16cd7', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(230, 'Numquam aliquam veniam est laborum est.', 'men', 'https://via.placeholder.com/640x480.png/00ff55?text=eligendi', '56.45', 5, 30, 1, NULL, 'Et voluptatem consequatur ducimus est nobis ea.', '603691ae16d37', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(231, 'Non ab cumque quis ut et. Ipsum aperiam expedita consequuntur sed fugit dicta.', 'women', 'https://via.placeholder.com/640x480.png/005555?text=quo', '89.04', 5, 35, 5, NULL, 'Iste ut consectetur rerum voluptatum modi ratione itaque.', '603691ae16da5', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(232, 'Facilis aut voluptatem tempora sit distinctio. Debitis saepe maxime ut.', 'men', 'https://via.placeholder.com/640x480.png/00dd33?text=sunt', '37.54', 17, 68, 7, NULL, 'Veritatis repudiandae autem similique voluptatem aut aut nesciunt aut voluptatem velit.', '603691ae16e15', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(233, 'Et architecto cum doloremque vitae accusamus in.', 'women', 'https://via.placeholder.com/640x480.png/003377?text=eos', '65.34', 8, 93, 1, NULL, 'Repudiandae assumenda dolore ut cum incidunt consequuntur quisquam est placeat explicabo.', '603691ae16e7a', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(234, 'Minima labore culpa id odio quidem officiis aspernatur iure.', 'women', 'https://via.placeholder.com/640x480.png/00bbff?text=quisquam', '18.74', 1, 47, 4, NULL, 'Ex vero reprehenderit deleniti voluptatem eius ipsam eos.', '603691ae16ee1', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(235, 'Aut vel adipisci occaecati ipsum suscipit.', 'men', 'https://via.placeholder.com/640x480.png/001144?text=et', '54.38', 10, 56, 3, NULL, 'Quia ratione aspernatur necessitatibus eius error et.', '603691ae16f44', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(236, 'Maxime autem aut libero tempora ut.', 'women', 'https://via.placeholder.com/640x480.png/00ddbb?text=similique', '30.16', 19, 15, 8, NULL, 'Et facilis officiis sit impedit perferendis quidem quam et.', '603691ae16fa7', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(237, 'Magni qui eum tenetur doloremque a sit.', 'men', 'https://via.placeholder.com/640x480.png/003311?text=ipsum', '68.60', 8, 149, 6, NULL, 'Vel perferendis corrupti voluptatem aut voluptatum modi sunt doloribus.', '603691ae1700d', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(238, 'Aspernatur perspiciatis est aut inventore molestiae sed.', 'men', 'https://via.placeholder.com/640x480.png/00bbbb?text=ipsam', '94.21', 4, 70, 8, NULL, 'Rerum nulla sequi in ipsam corrupti quo voluptas dolorum officiis.', '603691ae17074', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(239, 'Odio dolorum et assumenda nesciunt iusto. Eos consectetur ut quidem id est.', 'men', 'https://via.placeholder.com/640x480.png/007777?text=officia', '22.29', 1, 53, 6, NULL, 'Ad similique quia numquam reiciendis aut et.', '603691ae170e2', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(240, 'Molestiae facilis dicta ipsam est hic.', 'women', 'https://via.placeholder.com/640x480.png/000011?text=impedit', '86.22', 11, 58, 8, NULL, 'Harum eos voluptas excepturi quidem cupiditate est.', '603691ae17142', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(241, 'Harum sint voluptatem dolorum qui laudantium nostrum sint.', 'women', 'https://via.placeholder.com/640x480.png/0022ff?text=explicabo', '5.03', 10, 25, 9, NULL, 'Cupiditate veniam fugiat illum nisi a quibusdam voluptate rerum sed.', '603691ae171ab', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(242, 'Cumque minus sapiente nesciunt ea velit.', 'women', 'https://via.placeholder.com/640x480.png/00ee44?text=nam', '59.69', 11, 11, 2, NULL, 'Quasi possimus ducimus excepturi in error cupiditate id modi omnis consequuntur.', '603691ae17213', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(243, 'Quod veniam sunt et voluptatem.', 'women', 'https://via.placeholder.com/640x480.png/004422?text=id', '36.40', 12, 59, 3, NULL, 'Saepe nisi et blanditiis facilis non ipsam sapiente nemo.', '603691ae17278', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(244, 'Tempora et dolorum sit laborum ea reprehenderit recusandae.', 'men', 'https://via.placeholder.com/640x480.png/00bb88?text=qui', '16.71', 14, 69, 3, NULL, 'Nobis sint est facilis commodi non aut.', '603691ae172dc', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(245, 'Veritatis et beatae tenetur sit et aperiam.', 'men', 'https://via.placeholder.com/640x480.png/00aa00?text=soluta', '64.64', 14, 135, 5, NULL, 'Velit veniam deleniti quia similique dolor beatae blanditiis et.', '603691ae17341', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(246, 'Laudantium et inventore tempore pariatur quasi quod incidunt.', 'men', 'https://via.placeholder.com/640x480.png/0088dd?text=eum', '33.55', 11, 58, 2, NULL, 'Sit consequuntur maiores est doloremque unde amet qui cumque et non.', '603691ae173aa', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(247, 'Doloribus impedit quae voluptatum optio esse similique.', 'men', 'https://via.placeholder.com/640x480.png/0055bb?text=soluta', '28.36', 13, 68, 8, NULL, 'Sunt odio earum quasi temporibus.', '603691ae17405', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(248, 'Tenetur voluptatem beatae et dolor. Blanditiis est et incidunt porro odio ut.', 'women', 'https://via.placeholder.com/640x480.png/00bbdd?text=sit', '71.92', 10, 25, 4, NULL, 'Enim maiores sapiente quos ut neque cumque exercitationem nulla dolor.', '603691ae17471', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(249, 'Ea aut neque et aperiam. Quo delectus rem ut tempora quia.', 'women', 'https://via.placeholder.com/640x480.png/00aa44?text=earum', '91.51', 9, 135, 8, NULL, 'Nisi illum impedit sequi dicta repellendus fugit nostrum accusantium quaerat.', '603691ae174dc', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(250, 'Rem voluptatem laborum eaque illum tempore.', 'men', 'https://via.placeholder.com/640x480.png/00ccbb?text=a', '88.05', 7, 134, 1, NULL, 'Molestias dolor aut vitae vel in magni quos vel temporibus sit.', '603691ae17543', '2021-02-24 15:49:34', '2021-02-24 15:49:34'),
(251, 'Reiciendis voluptatibus ut amet quidem facilis inventore id.', 'men', 'https://via.placeholder.com/640x480.png/006688?text=ut', '91.24', 13, 59, 2, NULL, 'Quibusdam aut aperiam reprehenderit consequuntur.', '603691ae175a6', '2021-02-24 15:49:34', '2021-02-24 15:49:34');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'admin@yahoo.com', NULL, '$2y$10$dXSPxCV5Jv8JfXTbS/pSE.6TdWhEK8r9LVFp/Ddc8m/OrR9GCw7.S', NULL, '2021-02-22 19:50:53', '2021-02-22 19:50:53'),
(3, 'smith', 'smith@yahoo.com', NULL, '$2y$10$p9yvqyj4f28mmz/pVM8Tt.FRE1W5KhWV0REPw3iYvqDdqsmmngpW.', NULL, '2021-02-24 15:15:41', '2021-02-24 15:15:41'),
(4, 'walker', 'walker@gmail.com', NULL, '$2y$10$lt7cKueSh0mCx.F1QYVww.r6kvILeLIRkWpXq4PfLXLvz2kiimn2y', NULL, '2021-02-24 16:32:32', '2021-02-24 16:32:32');

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexuri pentru tabele `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexuri pentru tabele `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexuri pentru tabele `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexuri pentru tabele `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexuri pentru tabele `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexuri pentru tabele `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexuri pentru tabele `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_order_id_foreign` (`order_id`);

--
-- Indexuri pentru tabele `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pentru tabele `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pentru tabele `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pentru tabele `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pentru tabele `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT pentru tabele `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constrângeri pentru tabele `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
