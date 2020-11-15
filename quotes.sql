-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 15 Nov 2020 pada 10.21
-- Versi server: 10.3.23-MariaDB-0+deb10u1
-- Versi PHP: 7.3.19-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quotes`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_10_23_010800_create_quotes_table', 2),
(5, '2020_10_23_013956_add_api_token_on_users', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `quotes`
--

CREATE TABLE `quotes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `quotes`
--

INSERT INTO `quotes` (`id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 8, 'Apa yang datang akan mudah pergi, ikhlaskan.', '2020-10-23 18:24:17', '2020-10-23 18:24:17'),
(3, 8, 'Pria cuek tercipta dari pria tulus yang sering dihianati.', '2020-10-23 18:44:37', '2020-10-23 18:44:37'),
(4, 9, 'Ikhlas adalah salah satu cara menjaga kebahagiaanmu', '2020-10-23 19:07:58', '2020-10-23 19:07:58'),
(5, 9, 'Tak perlu alasan untuk itu, kerana Tuhan aku diciptakan untukmu.', '2020-10-23 19:59:00', '2020-10-23 19:59:00'),
(8, 10, 'Test update quote dengan Authorization', '2020-11-12 08:49:25', '2020-11-12 08:51:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'malik', 'malik@quotes.com', NULL, '$2y$10$U8cBbmaLnLsCYXDExbO9a.w6duMDVstP3Peaa3nvFosQFsU6wb2Ba', 'L7Ye5lNhqHnLRtTSdPRAR6xxxfp0zdTKZoQbrj6W6UinZdkaV7yKVmSFBNzGAJjw8ByjLPfMqmlB80ee', NULL, '2020-10-23 00:50:15', '2020-10-23 00:50:15'),
(9, 'agung', 'agung@quotes.com', NULL, '$2y$10$Fy/tzJyKZ6U80RIeE6DKWeO0Y8qVBDfMCt9I.3rZH5p5apEbGpfNm', 'JlwdU4A6vTY7eRAtXsFTW13PDgITOZTS6U7dZEMLQO6mCLje33HH2EDUdz5YTylXFztPHNxrjE1M6Mk7', NULL, '2020-10-23 05:45:33', '2020-10-23 05:45:33'),
(10, 'mbuh', 'mbuh@quotes.com', NULL, '$2y$10$s0ttDcTxMXRMvF58hQXf4.Dhb6k4da3EEn7sgOib7pdUq7lLuo58a', 'JNHMSWNT9X19XTwYWBgwMALG9NIrvlNIHHMeOkg2rixXbUYoZicgQZLvRTs44Qh1itBTjNJ9DQv0x8uK', NULL, '2020-11-12 08:16:13', '2020-11-12 08:16:13'),
(11, 'user1', 'user@quotes.com', NULL, '$2y$10$X2sOjYCksQV17hx1qAvFR.XUqcNPXtYH/qqKTdCbVx/FotAPLLekK', 'SL5Ca3QNjgrzbLxcwinGrwHRVHkdmcF9WssNk1KIhUgQKZBhEPedU4q3siSTpOmeQ6n89SSCTMGoX7YR', NULL, '2020-11-14 18:17:07', '2020-11-14 18:17:07'),
(12, 'user1', 'user1@quotes.com', NULL, '$2y$10$tcU1nWLo2ZWbHjuQljNd0.lpHQN3Z4r8Iy4BXUzZwI.JWnxt0rCFy', '6IQvu5KnD6FzIS4PXVxlI6KCIuxU32ilIbuCa0lKmJjgTHsAyQddnjKTFrO1FGnI7mh0TCWbekMufEnz', NULL, '2020-11-14 18:37:28', '2020-11-14 18:37:28'),
(13, 'user01', 'user01@quotes.com', NULL, '$2y$10$odBiZd.iY1jbuRGs.jSXueG.niztywLD39H/WhjfuNHNSTau.xqva', '1DJaBWONLWdHqMlWrtiWt65LXEC7MMciD2A5HttVnvShVBbg2hWpsgxWMiTjX6JvZ7uBdCk8ldv92iVv', NULL, '2020-11-14 18:51:08', '2020-11-14 18:51:08');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotes_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `quotes`
--
ALTER TABLE `quotes`
  ADD CONSTRAINT `quotes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
