-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2022 at 08:39 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vc`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `Date_attended` date NOT NULL,
  `W_class` varchar(50) NOT NULL,
  `Student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `Date_attended`, `W_class`, `Student_id`) VALUES
(1, '2021-09-02', 'CSE299.5', 9),
(3, '2021-09-02', 'CSE299.5', 5),
(5, '2021-09-03', 'CSE299.5', 9),
(9, '2021-09-04', 'CSE299.5', 9),
(12, '2021-09-04', 'CSE299.5', 5),
(14, '2021-09-06', 'CSE299.5', 9),
(15, '2021-09-07', 'CSE299.5', 9),
(16, '2021-09-09', 'CSE299.5', 5),
(17, '2021-10-09', 'CSE299.5', 9),
(18, '2021-10-09', 'CSE299.5', 5),
(19, '2021-10-28', 'CSE299.5', 9);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add roles', 7, 'add_roles'),
(26, 'Can change roles', 7, 'change_roles'),
(27, 'Can delete roles', 7, 'delete_roles'),
(28, 'Can view roles', 7, 'view_roles'),
(29, 'Can add userdata', 8, 'add_userdata'),
(30, 'Can change userdata', 8, 'change_userdata'),
(31, 'Can delete userdata', 8, 'delete_userdata'),
(32, 'Can view userdata', 8, 'view_userdata'),
(33, 'Can add workerdoc', 9, 'add_workerdoc'),
(34, 'Can change workerdoc', 9, 'change_workerdoc'),
(35, 'Can delete workerdoc', 9, 'delete_workerdoc'),
(36, 'Can view workerdoc', 9, 'view_workerdoc'),
(37, 'Can add ownerdoc', 10, 'add_ownerdoc'),
(38, 'Can change ownerdoc', 10, 'change_ownerdoc'),
(39, 'Can delete ownerdoc', 10, 'delete_ownerdoc'),
(40, 'Can view ownerdoc', 10, 'view_ownerdoc'),
(41, 'Can add class grp', 11, 'add_classgrp'),
(42, 'Can change class grp', 11, 'change_classgrp'),
(43, 'Can delete class grp', 11, 'delete_classgrp'),
(44, 'Can view class grp', 11, 'view_classgrp'),
(45, 'Can add stream', 12, 'add_stream'),
(46, 'Can change stream', 12, 'change_stream'),
(47, 'Can delete stream', 12, 'delete_stream'),
(48, 'Can view stream', 12, 'view_stream'),
(49, 'Can add attendance', 13, 'add_attendance'),
(50, 'Can change attendance', 13, 'change_attendance'),
(51, 'Can delete attendance', 13, 'delete_attendance'),
(52, 'Can view attendance', 13, 'view_attendance'),
(53, 'Can add alert', 14, 'add_alert'),
(54, 'Can change alert', 14, 'change_alert'),
(55, 'Can delete alert', 14, 'delete_alert'),
(56, 'Can view alert', 14, 'view_alert'),
(57, 'Can add check', 15, 'add_check'),
(58, 'Can change check', 15, 'change_check'),
(59, 'Can delete check', 15, 'delete_check'),
(60, 'Can view check', 15, 'view_check'),
(61, 'Can add grade', 16, 'add_grade'),
(62, 'Can change grade', 16, 'change_grade'),
(63, 'Can delete grade', 16, 'delete_grade'),
(64, 'Can view grade', 16, 'view_grade');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$tPFynzZPKn9EJiUY8RnaAe$jgWyUZziJuSI6sSfaGNj4oZjC3Isih5uYhB+iR8HdkA=', '2022-08-22 09:18:12.774795', 0, 'Rafat', '', '', 'kingrafat82@gmail.com', 0, 1, '2021-08-14 10:09:24.781804'),
(2, 'pbkdf2_sha256$260000$BjXM1tFSn33uzPHzOWVFjk$lRzZ1EuoTV5c0H6k7i9sIiKyHh+BSKm3/pJ/9WpH6Ho=', '2021-09-04 01:41:00.000086', 0, 'Sadia', '', '', 'sadia.islam5@northsouth.edu', 0, 1, '2021-08-14 10:09:54.290793'),
(3, 'pbkdf2_sha256$260000$1MX4eyLoLntvvLkzgqkGcg$mfaCevAhG56up4RTR1VOZjI0bO/qlionrXs86dJ2M5s=', '2022-08-22 09:19:13.630686', 0, 'Lebron James', '', '', 'lebron@gmail.com', 0, 1, '2021-08-14 10:10:20.409826'),
(4, 'pbkdf2_sha256$260000$Dkd2cSunw8r0UJgsPeSy8w$6vOPxaHgRT2UHgNY7JxeMm9v9W5Yh7Abxj/LKvXH+Sc=', NULL, 0, 'Selena Gomez', '', '', 'selena_gomez@gmail.com', 0, 1, '2021-08-29 17:17:14.586203'),
(5, 'pbkdf2_sha256$260000$ue4ldSoZyQYIqIC4GFUyzY$meCdb4g9CRVyw/6uF+oyCR14g30GcKlm50OLZAVaWdk=', '2021-10-09 13:23:51.415940', 0, 'Elon Musk', '', '', 'elon@musk.com', 0, 1, '2021-08-29 17:17:42.185303'),
(6, 'pbkdf2_sha256$260000$iBEhHsrfj1xWdVW6cjLrEj$UzeGFAQuo+nwhQy+e2lBh6a7PyVWp3pq6WSBCgH4tyM=', '2021-09-04 10:11:33.761668', 0, 'Bill Gates', '', '', 'Bill@microsoft.com', 0, 1, '2021-08-29 17:18:24.151130'),
(7, 'pbkdf2_sha256$260000$RcmyhsdA908m1cfc4lo2f0$SVHMVtSTuOBcXYbMObD+39Qohu/ZT7e4oVmGDcSHoYg=', NULL, 0, 'Eminem', '', '', 'eminem@goat.com', 0, 1, '2021-08-29 17:37:10.817125'),
(8, 'pbkdf2_sha256$260000$3ZkuggRdu6hcqRxDCq9R5s$IIiFVxQSTTFS9aSMN2WYK+06plGI8OKFnMXp6wHjMo4=', NULL, 0, 'Khabib', '', '', 'nurmagomedov@goat.com', 0, 1, '2021-08-29 17:38:53.891583'),
(9, 'pbkdf2_sha256$260000$CdxJFoBkWJIvoFph7Q9Yn9$gLih8c8eZCRuR//TDH3zaMkWA9xaOOXxX9g+tVXHY00=', '2021-10-28 15:38:41.463602', 0, 'Rafat Haameem', '', '', 'kazi.meem@northsouth.edu', 0, 1, '2021-08-29 17:44:37.021993'),
(10, 'pbkdf2_sha256$260000$qLJGv5S3sk4NDiNQxguRBE$X7qMWM/yFHemXvtPcqhVzDY072U/CmzL8JEuwKnuvrE=', NULL, 0, 'Tobey ', '', '', 'tobey@gmail.com', 0, 1, '2021-08-29 17:52:50.847415'),
(11, 'pbkdf2_sha256$260000$8LBOzeFdvfqfp7QMAh0bfr$dqvfXymAQ4l6cpe76NfGXbwx1ib8vPTwwJSbkDj1P5g=', NULL, 0, 'Felix', '', '', 'pewdiepie@youtube.com', 0, 1, '2021-08-29 17:54:35.439161'),
(12, 'pbkdf2_sha256$260000$xTuXdOfTXnNiKp8E1ENyKp$wGxgCLQ1zca/yG98NfqxSM0i6xdJxye3xsg1ZAD8K7E=', NULL, 0, 'Mr.Beast', '', '', 'mrbeast@ricg.com', 0, 1, '2021-08-29 18:01:39.153133'),
(13, 'pbkdf2_sha256$260000$Jr3NGbTO25enk5KXyc1YpV$KA1V3WdZayUN7XPKV0iqT+OFcd9KNgMxglgj1r/BYO8=', NULL, 0, 'Emma Watson', '', '', 'emma@gmail.com', 0, 1, '2021-08-29 18:05:18.421884'),
(14, 'pbkdf2_sha256$260000$4YjEKPElIu0VFaozqYU5AX$nPKIypWWI+5P5hloydx3hw8T8bOHuTVmsY0P8RfVdig=', NULL, 0, 'Jacinda Ardern', '', '', 'Jacinda@nz.com', 0, 1, '2021-08-29 18:11:29.982380'),
(15, 'pbkdf2_sha256$260000$id9FISpp0X7SbBYeYoK7yk$dbwn93o9/Yus/6FGj0F+9KPnF6DjXBZns98nXuX7FNI=', '2021-09-01 21:05:30.570237', 0, 'Tushar', '', '', 'Tusahr@gmail.com', 0, 1, '2021-08-29 18:17:33.357514'),
(16, 'pbkdf2_sha256$260000$6zmMunySzXPB677BmM9a6I$BiW6KcokpiV+BjaomeADlDde6Q9T7JivopaZ6L0iqMg=', '2021-10-09 14:03:49.951955', 0, 'Sadia Islam', '', '', 'munnisadiaIslam@gmail.com', 0, 1, '2021-08-29 18:19:36.951119'),
(17, 'pbkdf2_sha256$260000$BM95oXFgbYJZ5AT8B8a0hr$yJpIlZ3XoNi+R/xc3lgCl8CajVBdhmRtGYo8L8ffw5E=', '2021-09-01 21:07:03.274381', 0, 'Tushar Pasadi', '', '', 'tusharpasadi@yahoo.com', 0, 1, '2021-09-01 21:06:46.633592'),
(18, 'pbkdf2_sha256$260000$4cQgBiW5AKfcXXkuHGGWl6$zQAUjUtZRmk39GAyqfNh48TCoaydRcbV7w/c0+zfibk=', NULL, 0, 'Christian', '', '', 'Christian_bale@yahoo.com', 0, 1, '2021-09-04 01:15:49.823567'),
(19, 'pbkdf2_sha256$260000$mWEAumL6BIz4wyHunH6CBA$PJnitPMEQCMnvSxNaM7EvCHyR/e/fZZHTEGi3graK5M=', NULL, 0, 'Test', '', '', 'Christian_bale@yahoo.com', 0, 1, '2021-09-04 01:16:27.895833');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `Cname` varchar(50) NOT NULL,
  `Cowner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `Cname`, `Cowner_id`) VALUES
(1, 'CSE299.5', 1),
(3, 'BIO103.7', 2),
(4, 'CSE331.8', 1),
(6, 'CSE299.5', 3),
(7, 'CSE299.5', 5),
(8, 'EEE111.15', 1),
(9, 'CSE299.5', 9),
(10, 'CSE299.5', 6),
(11, 'EEE111.15', 6),
(12, 'EEE111.15', 9),
(13, 'CSE299.5', 13),
(14, 'ECO101.4', 5);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(14, 'first', 'alert'),
(13, 'first', 'attendance'),
(15, 'first', 'check'),
(11, 'first', 'classgrp'),
(16, 'first', 'grade'),
(10, 'first', 'ownerdoc'),
(7, 'first', 'roles'),
(12, 'first', 'stream'),
(8, 'first', 'userdata'),
(9, 'first', 'workerdoc'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-08-14 10:06:12.942048'),
(2, 'auth', '0001_initial', '2021-08-14 10:06:13.430856'),
(3, 'admin', '0001_initial', '2021-08-14 10:06:13.565497'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-08-14 10:06:13.574506'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-08-14 10:06:13.584446'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-08-14 10:06:13.668221'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-08-14 10:06:13.711108'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-08-14 10:06:13.733048'),
(9, 'auth', '0004_alter_user_username_opts', '2021-08-14 10:06:13.746013'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-08-14 10:06:13.823805'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-08-14 10:06:13.828791'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-08-14 10:06:13.844751'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-08-14 10:06:13.865929'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-08-14 10:06:13.891858'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-08-14 10:06:13.929756'),
(16, 'auth', '0011_update_proxy_permissions', '2021-08-14 10:06:13.941726'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-08-14 10:06:13.963184'),
(18, 'first', '0001_initial', '2021-08-14 10:06:14.310620'),
(19, 'sessions', '0001_initial', '2021-08-14 10:06:14.352542'),
(20, 'first', '0002_alter_workerdoc_doc_path', '2021-08-14 11:50:09.377632'),
(21, 'first', '0003_stream', '2021-08-17 08:27:33.852573'),
(22, 'first', '0004_attendance', '2021-09-01 21:19:27.406717'),
(23, 'first', '0005_alert', '2021-09-02 08:46:05.163194'),
(24, 'first', '0006_check_grade', '2021-09-02 23:06:33.893055'),
(25, 'first', '0007_check_checkopen', '2021-09-02 23:12:12.720342'),
(26, 'first', '0008_alert_type', '2021-09-02 23:38:06.426788'),
(27, 'first', '0009_auto_20210904_0023', '2021-09-03 18:23:30.101741'),
(28, 'first', '0010_alter_grade_ownerd', '2021-09-03 18:57:22.749043'),
(29, 'first', '0011_alter_grade_workerd', '2021-09-03 19:53:46.686017');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('baf5ijpf3padvrcq1278s9t77ijxu39u', '.eJxVjcsOgjAURP-la9LQW1ooSwlLN_oB5Pa2WJVHQiExMf67JWGh25kzZ96sw20N3Rb90t0dq5lg2W9mkZ5-2gv3wOk2c5qndblbviP8aCM_z84Pp4P9EwSMIa29dZWBogCLWgoUvVCVQunRlKhBQS4NgVC6zKUmFAIIIK9MYcER6YKSdNdNOPpku2CPa4raF45N8Ol2YXWpIWM0YIwH1VxbMIYr9vkC6D5JPw:1mg7WZ:5B7arua1j1IJbpHG41a07vQsaC832xNeZTWTrdialRY', '2021-11-11 15:41:03.398122'),
('kb1963eu9dnyxc6ixcionxg60ox9dq2j', '.eJxVjUEOgjAURK9iujZNgVL4LjUuXLjyAOS3v7UolIRCYmK8u23CQrfzZt68WYfr4rs12rnriR1Yodj-N9RonjZkQg8M94mbKSxzr3mu8I1Gfp3IDset-yfwGH1ea6yJXK1b0EoAuIqsElprwBJL1YI0WECLQqjCOtVIJOdk5cBY5RDqJM26gKNNthtSj7tLHHBM4PzC8eRtOp_ZoZHw-QIF6UcP:1mZCx3:F6YdYEMD4bHWpxOLa5oVaKNZlJZwOP01j8oauGNIYUU', '2021-10-23 14:03:49.971429'),
('o6nevhogljmaypmakpcyju8p1lq48rjz', '.eJxVjcEOgjAMQH_F7EyWURxjHCVejJ78ANJ1RVAcCdPExPjvjoSDHtv3-voWLT4fffuMPLeDF7UoRPa7c0g3DgvwVwyXSdIUHvPg5KLIlUZ5mjyPu9X9C_QY-3RtDYABTaoC27ExpXLaGci1IbVVlOfEBYM1hetcpR0CE6MvuFOlp6qyKbrkAt451Y7s5ilsDmmKiexfeG96Tt9nUZsSMkEjxrjKzXkP1kotPl89CUyo:1oQ3c4:jlwUWP7UzX9fq885H84wAgxMGtdIz2BSQKmlziiruNA', '2022-09-05 09:20:52.356921'),
('vo8a9laj1dd6jz1k7gtis8u5az2klpwu', '.eJxVjUEOgyAURK_SsDZEBAW6rHHpqgcwXz4Wq0IimjRpevdi4qLdzrx58yYd7Jvr9mjXbkRyJSXJfrMezGT9UeAT_CNQE_y2jj09EHq2kbYB7Xw72T-Bg-jSukBeaahEXko9MBRKG6mYZFxxw3JhKmNL4FYMPQJHaQqlFQ69tgwV5IIn6aHzsNhka-bgL-0epxQ3L1hqZ9P1Sq5S6IyYGWI8yfreFFrTkny-TRpLZg:1mO5NR:VSsK1z7Dy6v5Zo_E-aK6-Sn4yc_UKzSzsZSMDJIhHQ0', '2021-09-22 21:45:05.799797');

-- --------------------------------------------------------

--
-- Table structure for table `first_alert`
--

CREATE TABLE `first_alert` (
  `Serialno` int(11) NOT NULL,
  `classname_a` varchar(50) NOT NULL,
  `Student_a_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `first_alert`
--

INSERT INTO `first_alert` (`Serialno`, `classname_a`, `Student_a_id`, `type`) VALUES
(6, 'CSE299.5', 9, 'Mismatch'),
(7, 'CSE299.5', 9, 'Did not open CAM.'),
(8, 'CSE299.5', 9, 'Others detected very near/Cheating'),
(9, 'CSE299.5', 9, 'Others detected very near/Cheating'),
(10, 'CSE299.5', 6, 'Mismatch'),
(14, 'CSE299.5', 5, 'Mismatch'),
(15, 'CSE299.5', 9, 'Did not open CAM.'),
(16, 'CSE299.5', 9, 'Did not open CAM.'),
(17, 'CSE299.5', 3, 'Mismatch');

-- --------------------------------------------------------

--
-- Table structure for table `first_check`
--

CREATE TABLE `first_check` (
  `aidi` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `checkopen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `first_check`
--

INSERT INTO `first_check` (`aidi`, `number`, `checkopen`) VALUES
(1, 15, 762);

-- --------------------------------------------------------

--
-- Table structure for table `first_stream`
--

CREATE TABLE `first_stream` (
  `Streamno` int(11) NOT NULL,
  `Content` longtext NOT NULL,
  `Classname` varchar(50) NOT NULL,
  `posted_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `first_stream`
--

INSERT INTO `first_stream` (`Streamno`, `Content`, `Classname`, `posted_id`) VALUES
(1, 'I am the best. So let me declare.', 'CSE299.5', 3),
(2, 'Rafat Announcement!!!', 'CSE299.5', 1),
(3, 'Do your classwork properly!!', 'CSE299.5', 1),
(4, 'I am Elon Musk. I should be the Teacher!!!', 'CSE299.5', 5),
(5, 'What happened Sir?', 'CSE299.5', 9),
(6, 'Dont know man!', 'CSE299.5', 1);

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `Serialno` int(11) NOT NULL,
  `Grade_c` varchar(5) NOT NULL,
  `ownerd` int(11) NOT NULL,
  `workerd_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`Serialno`, `Grade_c`, `ownerd`, `workerd_id`) VALUES
(4, 'A', 4, 3),
(5, 'A', 4, 9),
(8, 'A', 6, 5),
(10, '8/10', 6, 6),
(11, 'A', 4, 6),
(12, 'C', 3, 3),
(13, 'A', 8, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ownerdocument`
--

CREATE TABLE `ownerdocument` (
  `Serialo` int(11) NOT NULL,
  `Doc_name` varchar(50) NOT NULL,
  `Post_Date` datetime(6) NOT NULL,
  `Sub_Date` datetime(6) NOT NULL,
  `File` varchar(100) NOT NULL,
  `class_name_O` varchar(50) NOT NULL,
  `Cmnt` longtext NOT NULL,
  `Type` int(11) NOT NULL,
  `Owner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ownerdocument`
--

INSERT INTO `ownerdocument` (`Serialo`, `Doc_name`, `Post_Date`, `Sub_Date`, `File`, `class_name_O`, `Cmnt`, `Type`, `Owner_id`) VALUES
(1, 'TestFile', '2021-08-14 16:12:43.788868', '2021-08-14 16:12:43.788868', 'Doc/Rafat_Lab_5.pdf', 'CSE299.5', 'Yeah this is your classwork for today', 1, 1),
(2, 'Test 2', '2021-08-14 17:21:15.713195', '2021-08-14 17:21:15.713195', 'Doc/Phy_mid_1911391642.pdf', 'CSE299.5', 'Second Classwork', 1, 1),
(3, 'Test File', '2021-08-15 15:03:53.594004', '2021-08-15 11:03:00.000000', 'Doc/Rafat_425_Asgn_1.pdf', 'CSE299.5', 'Midterm', 2, 1),
(4, 'Test Quiz', '2021-08-15 18:14:46.228165', '2021-08-15 19:14:00.000000', 'Doc/331_quiz_21.pdf', 'CSE299.5', 'This is a quiz', 2, 1),
(5, 'ClassworkTest', '2021-09-04 07:26:02.167066', '2021-09-04 07:26:02.167066', 'Doc/1911391642_Rafat_Haameem.pdf', 'CSE299.5', 'September', 1, 1),
(6, 'Exam Test', '2021-09-04 07:26:38.474415', '2021-09-23 00:00:00.000000', 'Doc/18210070423.pdf', 'CSE299.5', 'September', 2, 1),
(7, 'Classwork Final', '2021-09-04 19:36:34.387758', '2021-09-04 19:36:34.387758', 'Doc/CamScanner_08-28-2021_19.53.pdf', 'CSE299.5', 'Finish it', 1, 1),
(8, 'Exam Final', '2021-09-04 19:36:58.741693', '2021-09-09 00:00:00.000000', 'Doc/Rafat_EEE_quiz_3.pdf', 'CSE299.5', 'Exam', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `Role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`Role`) VALUES
('Admin'),
('Employee'),
('Employer'),
('Student'),
('Te'),
('Teacher'),
('teaching'),
('Test'),
('Test2'),
('testing');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Serial` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `Image` varchar(100) NOT NULL,
  `Role_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Serial`, `Username`, `Email`, `password`, `Image`, `Role_id`) VALUES
(1, 'Rafat', 'kingrafat82@gmail.com', '123456', 'Avatar/WIN_20210112_16_10_59_Pro.jpg', 'Teacher'),
(2, 'Sadia', 'sadia.islam5@northsouth.edu', 'abcd1234', 'Avatar/220px-Color_icon_brown.svg.png', 'Teacher'),
(3, 'Lebron James', 'lebron@gmail.com', 'abc123', 'Avatar/lebron_hames.jpg', 'Student'),
(4, 'Selena Gomez', 'selena_gomez@gmail.com', '987654321', 'Avatar/SG.jpg', 'Student'),
(5, 'Elon Musk', 'elon@musk.com', 'elon@musk', 'Avatar/ELONMUSK1.jpg', 'Student'),
(6, 'Bill Gates', 'Bill@microsoft.com', '1738ay', 'Avatar/BILL_GATES.jpg', 'Student'),
(7, 'Eminem', 'eminem@goat.com', 'TRSSrulz', 'Avatar/Eminem.jpg', 'Student'),
(8, 'Khabib', 'nurmagomedov@GOAT.com', 'Eagle', 'Avatar/Khabib.jpg', 'Student'),
(9, 'Rafat Haameem', 'kazi.meem@northsouth.edu', 'faith12345', 'Avatar/Rafat_stud.jpg', 'Student'),
(10, 'Tobey', 'tobey@gmail.com', 'spiderman', 'Avatar/Tobey.jpg', 'Student'),
(11, 'Felix', 'pewdiepie@youtube.com', 'pewdiepie', 'Avatar/pewds.jpg', 'Student'),
(12, 'Mr.Beast', 'mrbeast@ricg.com', 'jimmyjimmy', 'Avatar/beast.jpg', 'Teacher'),
(13, 'Emma Watson', 'emma@gmail.com', 'beautyandbeast', 'Avatar/Emma.jpg', 'Teacher'),
(14, 'Jacinda Ardern', 'Jacinda@NZ.com', 'primeminister', 'Avatar/Jacinda.jpg', 'Student'),
(15, 'Tushar', 'Tusahr@gmail.com', 'a123456', 'Avatar/tushar.jpg', 'Student'),
(16, 'Sadia Islam', 'munnisadiaIslam@gmail.com', 'admin12345', 'Avatar/162132925_209318137639161_7113037853969414705_n2.jpg', 'Admin'),
(17, 'Tushar Pasadi', 'tusharpasadi@yahoo.com', 'pasadi', 'Avatar/tushar_mu5TG7N.jpg', 'Admin'),
(18, 'Christian', 'Christian_bale@yahoo.com', 'C123456', 'Avatar/Cbale.jpg', 'Student'),
(19, 'Test', 'Christian_bale@yahoo.com', '1235', 'Avatar/wallpapersden.com_batman-dc-universe-comic_2560x1440.jpg', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `worker document`
--

CREATE TABLE `worker document` (
  `Serialw` int(11) NOT NULL,
  `Doc_name_w` varchar(50) NOT NULL,
  `Sub_Date_w` datetime(6) NOT NULL,
  `class_name` varchar(50) NOT NULL,
  `Filew` varchar(100) NOT NULL,
  `Late` tinyint(1) NOT NULL,
  `Doc_path` int(11) NOT NULL,
  `Owner_w_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `worker document`
--

INSERT INTO `worker document` (`Serialw`, `Doc_name_w`, `Sub_Date_w`, `class_name`, `Filew`, `Late`, `Doc_path`, `Owner_w_id`) VALUES
(1, 'file', '2021-08-14 18:22:03.867477', 'CSE299.5', 'Document/Rafat_Lab_5_wTaxruq.pdf', 0, 1, 3),
(2, 'file classwork', '2021-08-15 17:49:46.422673', 'CSE299.5', 'Document/EEE_111_quiz_2_Rafat.pdf', 0, 2, 3),
(5, 'Submit MID', '2021-08-15 12:41:08.486850', 'CSE299.5', 'Document/Phy_mid_1911391642_0RzZaR8.pdf', 1, 3, 3),
(6, 'Submit MID test', '2021-08-16 23:29:49.853934', 'CSE299.5', 'Document/Rafat_Lab_5_eIHdrZh.pdf', 1, 4, 3),
(11, 'Elon musk Test File', '2021-08-31 20:16:49.328822', 'CSE299.5', 'Document/Phy_Final_1911391642_Z92dUKP.pdf', 1, 3, 5),
(14, 'dasdsa', '2021-09-03 04:38:03.170794', 'CSE299.5', 'Document/Rafat.pdf', 1, 4, 9),
(16, 'Quiz Camera', '2021-09-03 05:23:27.336907', 'CSE299.5', 'Document/CamScanner_08-23-2021_16.46_C0MInWk.pdf', 1, 4, 9),
(20, 'Test', '2021-09-04 07:21:48.079595', 'CSE299.5', 'Document/6-1911391642-Kazi_Rafat_Haameem.pdf', 0, 2, 9),
(21, 'Elon musk mid', '2021-09-04 07:29:00.917248', 'CSE299.5', 'Document/Phy_Final_1911391642_jb7yNBA.pdf', 0, 6, 5),
(22, '12354', '2021-09-04 16:08:51.048492', 'CSE299.5', 'Document/Rafat_EEE_quiz_3.pdf', 0, 6, 6),
(23, 'Submit MID', '2021-09-04 16:09:39.733885', 'CSE299.5', 'Document/Rafat_EEE_quiz_3_5TQXAfL.pdf', 0, 6, 6),
(24, 'file bill', '2021-09-04 16:13:35.724022', 'CSE299.5', 'Document/Phy_Final_1911391642_Gipuxq3.pdf', 1, 4, 6),
(25, 'Submit MID', '2021-09-04 17:00:22.970369', 'CSE299.5', 'Document/Rafat_EEE_quiz_3_8NgWVZL.pdf', 1, 3, 5),
(26, 'Submit MID', '2021-09-04 19:38:46.115965', 'CSE299.5', 'Document/Rafat_EEE_quiz_3_pCxHgWD.pdf', 0, 8, 5),
(27, 'Submit wthout cam', '2021-09-04 19:39:27.665163', 'CSE299.5', 'Document/Rafat_EEE_quiz_3_cYwcROC.pdf', 0, 8, 5),
(28, 'Rafat mid', '2021-09-06 09:50:36.609975', 'CSE299.5', 'Document/Phy_Quiz_3_1911391642.pdf', 0, 8, 9),
(29, 'file', '2021-09-06 09:51:11.098372', 'CSE299.5', 'Document/CamScanner_08-16-2021_21.511.pdf', 0, 8, 9),
(30, 'file', '2021-09-06 09:52:18.835422', 'CSE299.5', 'Document/Final.docx', 0, 6, 9),
(31, 'Submit MID', '2021-10-28 21:39:56.038272', 'CSE299.5', 'Document/1511.05263.pdf', 1, 8, 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Attendance_Date_attended_Student_id_17c26046_uniq` (`Date_attended`,`Student_id`),
  ADD KEY `Attendance_Student_id_98d45b7a_fk_User_Serial` (`Student_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Class_Cowner_id_e22bf0a4_fk_User_Serial` (`Cowner_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `first_alert`
--
ALTER TABLE `first_alert`
  ADD PRIMARY KEY (`Serialno`),
  ADD KEY `first_alert_Student_a_id_f79feac9_fk_User_Serial` (`Student_a_id`);

--
-- Indexes for table `first_check`
--
ALTER TABLE `first_check`
  ADD PRIMARY KEY (`aidi`);

--
-- Indexes for table `first_stream`
--
ALTER TABLE `first_stream`
  ADD PRIMARY KEY (`Streamno`),
  ADD KEY `first_stream_posted_id_0d630413_fk_User_Serial` (`posted_id`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`Serialno`),
  ADD UNIQUE KEY `first_grade_ownerd_id_workerd_id_d9ee8ae8_uniq` (`ownerd`,`workerd_id`),
  ADD KEY `Grade_workerd_id_19ab83a8_fk_User_Serial` (`workerd_id`);

--
-- Indexes for table `ownerdocument`
--
ALTER TABLE `ownerdocument`
  ADD PRIMARY KEY (`Serialo`),
  ADD KEY `OwnerDocument_Owner_id_0c9b995e_fk_User_Serial` (`Owner_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`Role`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Serial`),
  ADD KEY `User_Role_id_df36bbe3_fk_Role_Role` (`Role_id`);

--
-- Indexes for table `worker document`
--
ALTER TABLE `worker document`
  ADD PRIMARY KEY (`Serialw`),
  ADD KEY `Worker Document_Owner_w_id_5ceb5ded_fk_User_Serial` (`Owner_w_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `first_alert`
--
ALTER TABLE `first_alert`
  MODIFY `Serialno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `first_check`
--
ALTER TABLE `first_check`
  MODIFY `aidi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `first_stream`
--
ALTER TABLE `first_stream`
  MODIFY `Streamno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `Serialno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ownerdocument`
--
ALTER TABLE `ownerdocument`
  MODIFY `Serialo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Serial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `worker document`
--
ALTER TABLE `worker document`
  MODIFY `Serialw` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `Attendance_Student_id_98d45b7a_fk_User_Serial` FOREIGN KEY (`Student_id`) REFERENCES `user` (`Serial`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `Class_Cowner_id_e22bf0a4_fk_User_Serial` FOREIGN KEY (`Cowner_id`) REFERENCES `user` (`Serial`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `first_alert`
--
ALTER TABLE `first_alert`
  ADD CONSTRAINT `first_alert_Student_a_id_f79feac9_fk_User_Serial` FOREIGN KEY (`Student_a_id`) REFERENCES `user` (`Serial`);

--
-- Constraints for table `first_stream`
--
ALTER TABLE `first_stream`
  ADD CONSTRAINT `first_stream_posted_id_0d630413_fk_User_Serial` FOREIGN KEY (`posted_id`) REFERENCES `user` (`Serial`);

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `Grade_workerd_id_19ab83a8_fk_User_Serial` FOREIGN KEY (`workerd_id`) REFERENCES `user` (`Serial`);

--
-- Constraints for table `ownerdocument`
--
ALTER TABLE `ownerdocument`
  ADD CONSTRAINT `OwnerDocument_Owner_id_0c9b995e_fk_User_Serial` FOREIGN KEY (`Owner_id`) REFERENCES `user` (`Serial`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `User_Role_id_df36bbe3_fk_Role_Role` FOREIGN KEY (`Role_id`) REFERENCES `role` (`Role`);

--
-- Constraints for table `worker document`
--
ALTER TABLE `worker document`
  ADD CONSTRAINT `Worker Document_Owner_w_id_5ceb5ded_fk_User_Serial` FOREIGN KEY (`Owner_w_id`) REFERENCES `user` (`Serial`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
