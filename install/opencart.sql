-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Dec 22, 2025 at 01:16 PM
-- Server version: 5.7.41-log
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exopencart`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_address`
--

CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_1` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_2` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_api`
--

CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `username`, `key`, `status`, `date_added`, `date_modified`) VALUES
(7, 'Default', 'OMn4BBgUPFdTDPUUaeTF9gfRyv9ALwTPeLuFLZe2yeTcZSPnYyWxr6WkMBnXdhsbRA8A481vlJtR5BnfGyPKb3YzlkKq1gJsPzjQkdtpRkLYgDXfZ14aK7Zi9c9XB2HiA4dAsxXsMdvWmEBNv6nHneTf1MHdCrRohmbM2MBDMKhvsHKSUS6xrVGcTFHYFF5TB0g1cq1iA5bAYYpIlVYfJLJRFy1yW8PpL0m1xRyyk4HeU4QnFBvzJYPkQT0n0Rrx', 1, '2025-06-03 07:45:39', '2025-11-29 11:15:30');

-- --------------------------------------------------------

--
-- Table structure for table `oc_api_ip`
--

CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_api_ip`
--

INSERT INTO `oc_api_ip` (`api_ip_id`, `api_id`, `ip`) VALUES
(1, 1, '78.29.124.51'),
(2, 1, '88.147.173.176'),
(3, 1, '178.45.210.225'),
(5, 2, '127.0.0.1:3000'),
(6, 1, '88.147.184.145'),
(7, 1, '88.147.173.33'),
(8, 1, '212.102.39.204'),
(9, 1, '212.102.39.205'),
(10, 1, '212.102.39.199'),
(11, 1, '88.147.179.183'),
(12, 1, '88.147.174.227'),
(13, 3, '172.16.238.1'),
(14, 5, '172.16.238.1'),
(15, 7, '172.16.238.1');

-- --------------------------------------------------------

--
-- Table structure for table `oc_api_session`
--

CREATE TABLE `oc_api_session` (
  `api_session_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `session_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_api_session`
--

INSERT INTO `oc_api_session` (`api_session_id`, `api_id`, `session_id`, `ip`, `date_added`, `date_modified`) VALUES
(758, 7, '176594bad4c09b24c0653f8842', '172.16.238.1', '2025-12-20 21:49:38', '2025-12-20 18:49:42'),
(752, 7, '19b54725174903b3a65332f5fb', '172.16.238.1', '2025-12-20 21:13:54', '2025-12-20 18:13:59'),
(756, 7, '874203daa51969c6b4bbbd948e', '172.16.238.1', '2025-12-20 21:46:42', '2025-12-20 21:46:42'),
(757, 7, '4b8501e0d39028bcaa2bc180b0', '172.16.238.1', '2025-12-20 21:46:44', '2025-12-20 21:46:44'),
(761, 7, '4a1c6dc428517254648bb3fe91', '172.16.238.1', '2025-12-22 16:13:31', '2025-12-22 16:13:31'),
(760, 7, '70ac2a793ccbcf4a0719fb8f7f', '172.16.238.1', '2025-12-20 21:51:43', '2025-12-20 21:51:43'),
(759, 7, '7bbc7c4141cc99e1c81151b033', '172.16.238.1', '2025-12-20 21:49:42', '2025-12-20 21:49:42'),
(755, 7, '11f5a6cd582b415f8e012098cc', '172.16.238.1', '2025-12-20 21:44:56', '2025-12-20 21:44:56'),
(754, 7, '738a043ced2ef91721af56e30e', '172.16.238.1', '2025-12-20 21:44:53', '2025-12-20 18:44:55'),
(751, 7, '32adb57c2ea48656b4750fe6af', '172.16.238.1', '2025-12-20 20:20:00', '2025-12-20 20:20:00'),
(753, 7, 'a799e0bea0ae9ab59385eada2b', '172.16.238.1', '2025-12-20 21:14:00', '2025-12-20 21:14:00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_article`
--

CREATE TABLE `oc_article` (
  `article_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `article_review` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `noindex` tinyint(1) NOT NULL DEFAULT '1',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_published` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_article`
--

INSERT INTO `oc_article` (`article_id`, `image`, `sort_order`, `article_review`, `status`, `noindex`, `viewed`, `date_published`, `date_added`, `date_modified`) VALUES
(127, 'catalog/demo/news/news2.jpg', 1, 0, 1, 1, 107, '2023-04-14 00:00:00', '2025-04-23 06:25:05', '2025-04-23 11:03:34'),
(128, 'catalog/demo/news/news3.jpg', 1, 0, 1, 1, 129, '2025-04-23 06:25:05', '2025-04-23 06:25:05', '2025-11-21 15:02:19'),
(126, 'catalog/demo/news/news1.jpg', 1, 0, 1, 1, 75, '2025-04-21 00:00:00', '2025-04-23 06:25:05', '2025-11-26 16:05:44');

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_description`
--

CREATE TABLE `oc_article_description` (
  `article_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_h1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_article_description`
--

INSERT INTO `oc_article_description` (`article_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `meta_title`, `meta_h1`, `tag`) VALUES
(128, 2, 'Dry Fact Sheet', '&lt;p&gt;In trying to come up with content for demo news, everything comes to mind. You can consider this fact number one. The second fact, you just got acquainted with the first fact. And you can\'t argue. If the first fact is at least a little bit possible, then the second is reinforced concrete, don\'t even try. Do you want to know the third one? The third fact will remain unknown and this is also a fact. Already the fourth, watch your hands and hold on tight!&lt;/p&gt;&lt;p&gt;The sentences here may not be correct from the point of view of a native speaker, but this is normal, Google translator is not very good yet.&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(126, 2, 'Store owner on exopencart talks about his pleasant experience', '&lt;p&gt;&lt;b&gt;exopencart: &lt;/b&gt;Vasily, please tell us about your experience with the exopencart platform?&lt;/p&gt;&lt;p&gt;&lt;b&gt;Vasily:&lt;/b&gt; Of course, with pleasure. The experience is extremely positive! It all started with a simple request &quot;free online store&quot;, I saw a link to exopencart.ru. At first I didn’t believe it, but my soul wanted freebies so much that I decided and watched the video “How to make a free online store”. Everything turned out to be very simple, literally in two hours I bought myself a domain, hosting, set up a platform and already added products, and at the same time I dreamed about the life of the owner of a successful online store. I received my first order the next day. Something like this.&lt;/p&gt;&lt;p&gt;&lt;b&gt;exopencart:&lt;/b&gt; It\'s always great to hear success stories from our platform users. What do you wish for those who doubt?&lt;/p&gt;&lt;p&gt;&lt;b&gt;Vasily:&lt;/b&gt; Do not hesitate to find out, you have to try!&lt;/p&gt;&lt;p&gt;&lt;b&gt;exopencart: &lt;/b&gt;My life motto!&lt;/p&gt;', '', '', '', '', ''),
(127, 2, 'How to grab luck by the tail and not lose touch with reality', '&lt;p&gt;The question is relevant. First, let\'s define the terminology. It is better to see once than to hear a hundred times. For example, you want to create an online store and are looking for a platform for it. Luck is when you find exopencart.ru. Okay, luckily we figured it out. What\'s with reality? It\'s a little more complicated here, refresh your knowledge in the general theory of relativity, quantum mechanics, and then come and discuss this burning issue.&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(127, 1, 'Как схватить удачу за хвост и не потерять связь с реальностью', '&lt;p&gt;Вопрос актуальный. Для начала давайте определимся с терминологией. Лучше один раз увидеть, чем сто раз услышасть. Например, вы хотите создать интернет-магазин и ищите для него платформу. Удача - это когда вы нашли exopencart.ru. Окей, с удачей разобрались. Что с реальностью? Тут немножно сложнее, освежите ваши знания в общей теории относительности, квантовой механике, а потом приходите, обсудим этот животрепещущий вопрос.&lt;/p&gt;', '', '', '', '', ''),
(126, 1, 'Владелец магазина на exopencart рассказывает о своем приятном опыте', '&lt;p&gt;&lt;b&gt;exopencart: &lt;/b&gt;Василий, расскажите пожалуйста о вашем опыте использования платформы exopencart?&lt;/p&gt;&lt;p&gt;&lt;b&gt;Василий: &lt;/b&gt;Конечно, с удовольствием. Опыт исключительно положительный! Всё началось с простого запроса &quot;бесплатный интернет магазин&quot;, увидел ссылку на exopencart.ru. Сначала не поверил, но душа так хотела халявы, что решился и посмотрел видео &quot;Как сделать бесплатный интернет-магазин&quot;. Оказалось всё очень просто, буквально за два часа купил себе домен, хостинг, поставил платформу и уже добавлял товары, а параллельно мечтал о жизни владельца успешного интернет-магазина. На следующий день уже получил первый заказ. Как-то так.&lt;/p&gt;&lt;p&gt;&lt;b&gt;exopencart: &lt;/b&gt;Всегда приятно слышать истории успеха пользователей нашей платформы. Что пожелаете тем, кто сомневается?&lt;/p&gt;&lt;p&gt;&lt;b&gt;Василий:&lt;/b&gt; Не соменевайтесь, чтобы узнать, надо попробовать!&lt;/p&gt;&lt;p&gt;&lt;b&gt;exopencart: &lt;/b&gt;Мой девиз по жизни!&lt;/p&gt;', '', '', '', '', ''),
(128, 1, 'Сухое изложение фактов', '&lt;p&gt;В попытках придумать контент для демонстранционных новостей всякое приходит в голову. Можете считать это фактом номер раз. Второй факт, вы только ознакомились с первым фактом. И не поспоришь ведь. Если с первым фактом хоть чуть-чуть можно, то второй - железобетонный, даже не пытайтесь. Хотите узнать третий? Третий факт так и останется неизвестным и это тоже факт. Уже четвертый, следите за руками и держитесь крепче!&lt;/p&gt;', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_image`
--

CREATE TABLE `oc_article_image` (
  `article_image_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_article_image`
--

INSERT INTO `oc_article_image` (`article_image_id`, `article_id`, `image`, `title`, `sort_order`) VALUES
(4007, 128, 'catalog/demo/news/news1.jpg', 'Теперь вы можете добавлять кастомные заголовки к модулям', 4),
(4006, 128, 'catalog/demo/gaming_laptops.jpg', 'Блог облагорожен и теперь им можно пользоваться', 3),
(4009, 126, 'catalog/logo.png', 'ex', 2),
(4008, 126, 'catalog/profile-pic.png', 'avatar', 1),
(4004, 128, 'catalog/demo/computers.jpg', 'Bulma UI вместо Boostrap', 1),
(4005, 128, 'catalog/demo/gaming_computer.jpg', 'Дефолтный шаблон теперь нормально свёрстан и приятно выяглядит', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_related`
--

CREATE TABLE `oc_article_related` (
  `article_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_related_mn`
--

CREATE TABLE `oc_article_related_mn` (
  `article_id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_related_product`
--

CREATE TABLE `oc_article_related_product` (
  `article_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_article_related_product`
--

INSERT INTO `oc_article_related_product` (`article_id`, `product_id`) VALUES
(30, 123),
(31, 123),
(43, 123),
(45, 123),
(126, 41),
(126, 45),
(127, 326),
(127, 328);

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_related_wb`
--

CREATE TABLE `oc_article_related_wb` (
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_to_blog_category`
--

CREATE TABLE `oc_article_to_blog_category` (
  `article_id` int(11) NOT NULL,
  `blog_category_id` int(11) NOT NULL,
  `main_blog_category` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_article_to_blog_category`
--

INSERT INTO `oc_article_to_blog_category` (`article_id`, `blog_category_id`, `main_blog_category`) VALUES
(127, 72, 1),
(126, 72, 1),
(128, 72, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_to_download`
--

CREATE TABLE `oc_article_to_download` (
  `article_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_article_to_download`
--

INSERT INTO `oc_article_to_download` (`article_id`, `download_id`) VALUES
(128, 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_to_layout`
--

CREATE TABLE `oc_article_to_layout` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_article_to_layout`
--

INSERT INTO `oc_article_to_layout` (`article_id`, `store_id`, `layout_id`) VALUES
(127, 0, 0),
(128, 0, 0),
(126, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_to_store`
--

CREATE TABLE `oc_article_to_store` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_article_to_store`
--

INSERT INTO `oc_article_to_store` (`article_id`, `store_id`) VALUES
(126, 0),
(127, 0),
(128, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute`
--

CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`, `icon`) VALUES
(1, 1, 1, ''),
(2, 1, 1, ''),
(3, 1, 1, ''),
(4, 1, 1, '&lt;span class=&quot;icon has-text-primary mr-1&quot;&gt;&lt;svg xmlns=&quot;http://www.w3.org/2000/svg&quot; fill=&quot;none&quot; viewBox=&quot;-0.5 -0.5 16 16&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; stroke=&quot;currentColor&quot; height=&quot;100&quot; width=&quot;100&quot;&gt;     &lt;path d=&quot;M9.0625 4.375H11.25a0.625 0.625 0 0 1 0.625 0.625v5a0.625 0.625 0 0 1 -0.625 0.625h-2.1875m-4.375 -6.25H2.5a0.625 0.625 0 0 0 -0.625 0.625v5a0.625 0.625 0 0 0 0.625 0.625h2.1875M13.125 6.875v1.25m-6.249375000000001 -3.75L5.3125 7.5h3.1262499999999998L6.875 10.625&quot; stroke-width=&quot;1&quot;&gt;&lt;/path&gt;&lt;/svg&gt;&lt;/span&gt;'),
(5, 1, 1, ''),
(6, 1, 1, ''),
(7, 1, 1, ''),
(8, 1, 1, ''),
(9, 1, 1, ''),
(10, 1, 1, ''),
(11, 1, 1, ''),
(12, 1, 1, ''),
(13, 1, 1, ''),
(14, 1, 1, ''),
(15, 1, 1, ''),
(16, 1, 1, ''),
(17, 1, 1, ''),
(18, 1, 1, ''),
(19, 1, 1, ''),
(20, 1, 1, ''),
(21, 1, 1, ''),
(22, 1, 1, ''),
(23, 1, 1, ''),
(24, 1, 1, ''),
(25, 1, 1, ''),
(26, 1, 1, ''),
(27, 1, 1, ''),
(28, 1, 1, ''),
(29, 1, 1, ''),
(30, 1, 1, ''),
(31, 1, 1, ''),
(32, 1, 1, ''),
(33, 1, 1, ''),
(34, 1, 1, ''),
(35, 1, 1, ''),
(36, 1, 1, ''),
(37, 1, 1, ''),
(38, 1, 1, ''),
(39, 1, 1, ''),
(40, 1, 1, ''),
(41, 1, 1, ''),
(42, 1, 1, ''),
(43, 1, 1, ''),
(44, 1, 1, ''),
(45, 1, 1, ''),
(46, 1, 1, ''),
(47, 1, 1, ''),
(48, 1, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_description`
--

CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hint` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_values` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`, `hint`, `default_values`) VALUES
(1, 1, 'Экран', '', ''),
(2, 1, 'Процессор', '', ''),
(3, 1, 'Память', '', ''),
(5, 1, 'Поддержка сетей', '', ''),
(6, 1, 'Сканер отпечатка пальцев', '', ''),
(7, 1, 'Размеры (ШхВхТ)', '', ''),
(8, 1, 'Камеры', '', ''),
(9, 1, 'Навигация', '', ''),
(10, 1, 'Операционная система', '', ''),
(11, 1, 'Количество моторов', '', ''),
(12, 1, 'Максимальная горизонтальная скорость', '', ''),
(13, 1, 'Максимальное разрешение видео', '', ''),
(14, 1, 'Диапазон частот', '', ''),
(15, 1, 'Тип конструкции', '', ''),
(17, 1, 'Тип соединения', '', ''),
(18, 1, 'Импеданс', '', ''),
(19, 1, 'Микрофон', '', ''),
(20, 1, 'Питание', '', ''),
(22, 1, 'Особенности', '', ''),
(23, 1, 'Сила выходного тока', '', ''),
(24, 1, 'Разъем на блоке з/у', '', ''),
(25, 1, 'Разъем на конце кабеля', '', ''),
(26, 1, 'Графический процессор', '', ''),
(27, 1, 'Оперативная память', '', ''),
(28, 1, 'Диск', '', ''),
(29, 1, 'Клавиатура', '', ''),
(30, 1, 'Видеокарта', '', ''),
(31, 1, 'Накопители', '', ''),
(32, 1, 'Связь', '', ''),
(33, 1, 'Контрастность', '', ''),
(34, 1, 'Разъемы', '', ''),
(35, 1, 'Блок питания', '', ''),
(36, 1, 'Конструктив', '', ''),
(37, 1, 'Мультимедиа', '', ''),
(38, 1, 'Технология', '', ''),
(39, 1, 'Разрешение', '', ''),
(40, 1, 'Скорость печати', '', ''),
(41, 1, 'Лотки', '', ''),
(42, 1, 'Плотность бумаги', '', ''),
(43, 1, 'Подключение', '', ''),
(44, 1, 'Мобильная печать', '', ''),
(45, 1, 'Тип', '', ''),
(46, 1, 'Суммарная звуковая мощность', '', ''),
(47, 1, 'Частотный диапазон', '', ''),
(48, 1, 'Регуляторы', '', ''),
(48, 2, 'Regulators', '', ''),
(32, 2, 'Connection', '', ''),
(23, 2, 'Output current strength', '', ''),
(6, 2, 'Fingerprint Scanner', '', ''),
(40, 2, 'Print speed', '', ''),
(46, 2, 'Total sound power', '', ''),
(38, 2, 'Technology', '', ''),
(45, 2, 'Type', '', ''),
(15, 2, 'Type of construction', '', ''),
(17, 2, 'Connection type', '', ''),
(21, 2, 'Color', '', 'white|black|red|blue|green'),
(21, 1, 'Цвет', '', 'белый|чёрный|красный|синий|зелёный'),
(47, 2, 'Frequency range', '', ''),
(1, 2, 'Display', '', ''),
(26, 2, 'Graphics Processor', '', ''),
(14, 2, 'Frequency range', '', ''),
(28, 2, 'Disk', '', ''),
(18, 2, 'The impedance', '', ''),
(8, 2, 'Cameras', '', ''),
(29, 2, 'Keyboard', '', ''),
(11, 2, 'Number of motors', '', ''),
(36, 2, 'Constructive', '', ''),
(33, 2, 'Contrast ratio', '', ''),
(41, 2, 'Trays', '', ''),
(12, 2, 'Maximum horizontal speed', '', ''),
(13, 2, 'Maximum video resolution', '', ''),
(19, 2, 'Microphone', '', ''),
(44, 2, 'Mobile printing', '', ''),
(37, 2, 'Multimedia', '', ''),
(9, 2, 'Navigation', '', ''),
(31, 2, 'Storage devices', '', ''),
(27, 2, 'Random access memory', '', ''),
(10, 2, 'The operating system', '', ''),
(22, 2, 'Features', '', ''),
(3, 2, 'Memory', '', ''),
(20, 2, 'Power supply', '', ''),
(42, 2, 'Paper density', '', ''),
(5, 2, 'Network support', '', ''),
(43, 2, 'Connection', '', ''),
(2, 2, 'Processor', '', ''),
(7, 2, 'Dimensions (WxHxD)', '', ''),
(39, 2, 'Resolution', '', ''),
(24, 2, 'Connector on the power unit', '', ''),
(25, 2, 'Connector at the end of the cable', '', ''),
(34, 2, 'Connectors', '', ''),
(16, 1, 'Акустический тип', '', ''),
(4, 1, 'Аккумулятор', 'Подсказка', ''),
(4, 2, 'Battery', 'Hint', ''),
(35, 2, 'Power unit', '', ''),
(30, 2, 'Video card', '', ''),
(16, 2, 'Acoustic type', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group`
--

CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group_description`
--

CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(1, 2, 'Common'),
(1, 1, 'Основные');

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner`
--

CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(7, 'Слайдшоу на главной', 1),
(8, 'Производители', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image`
--

CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`) VALUES
(248, 8, 2, 'Makita', '/en-makita', 'catalog/demo/manufacturers/makita.gif', 7),
(247, 8, 2, 'Samsung', '/en-samsung', 'catalog/demo/manufacturers/samsung.jpg', 6),
(268, 7, 2, 'Sex sells', '', 'catalog/demo/banners/new1.jpg', 0),
(269, 7, 2, 'Kitten are not bad', '', 'catalog/demo/banners/new2.jpg', 1),
(270, 7, 2, 'Super offer', '', 'catalog/demo/banners/new3.jpg', 2),
(265, 7, 1, 'Котики неплохи', '', 'catalog/demo/banners/new1.jpg', 1),
(245, 8, 2, 'MSI', '/en-msi', 'catalog/demo/manufacturers/msi.png', 4),
(246, 8, 2, 'Philips', '/en-philips', 'catalog/demo/manufacturers/philips.png', 5),
(243, 8, 2, 'DJI', '/en-dji', 'catalog/demo/manufacturers/dji.png', 2),
(244, 8, 2, 'DeLonghi', '/en-delonghi', 'catalog/demo/manufacturers/delonge.gif', 3),
(241, 8, 1, 'Makita', '/makita', 'catalog/demo/manufacturers/makita.gif', 7),
(242, 8, 2, 'Apple', '/en-apple', 'catalog/demo/manufacturers/apple.png', 1),
(239, 8, 1, 'Philips', '/philips', 'catalog/demo/manufacturers/philips.png', 5),
(240, 8, 1, 'Samsung', '/samsung', 'catalog/demo/manufacturers/samsung.jpg', 6),
(267, 7, 1, 'Секс продает', '', 'catalog/demo/banners/new3.jpg', 3),
(238, 8, 1, 'MSI', '/msi', 'catalog/demo/manufacturers/msi.png', 4),
(237, 8, 1, 'DeLonghi', '/delonghi', 'catalog/demo/manufacturers/delonge.gif', 3),
(236, 8, 1, 'DJI', '/dji', 'catalog/demo/manufacturers/dji.png', 2),
(235, 8, 1, 'Apple', '/apple', 'catalog/demo/manufacturers/apple.png', 1),
(266, 7, 1, 'Супер-предложение', '', 'catalog/demo/banners/new2.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_blog_category`
--

CREATE TABLE `oc_blog_category` (
  `blog_category_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `noindex` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_blog_category`
--

INSERT INTO `oc_blog_category` (`blog_category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `noindex`, `date_added`, `date_modified`) VALUES
(72, '', 0, 1, 0, 1, 1, 1, '2022-11-12 15:58:05', '2024-01-30 15:49:47'),
(73, '', 0, 1, 0, 2, 1, 1, '2022-11-14 14:42:55', '2022-11-14 14:42:55');

-- --------------------------------------------------------

--
-- Table structure for table `oc_blog_category_description`
--

CREATE TABLE `oc_blog_category_description` (
  `blog_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_h1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_blog_category_description`
--

INSERT INTO `oc_blog_category_description` (`blog_category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `meta_title`, `meta_h1`) VALUES
(73, 1, 'Документация', '&lt;p&gt;Если у вас есть потребность в размещении струтурированной документации для вашей продукции, здесь ей самое место&lt;/p&gt;', '', '', '', ''),
(73, 2, 'Dosc', '&lt;p&gt;If you have a need for structured documentation for your products, this is the place for it.&lt;br&gt;&lt;/p&gt;', '', '', '', ''),
(72, 1, 'Новости', '', '', '', 'Лучшие новости', 'Лучшие новости'),
(72, 2, 'News', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_blog_category_path`
--

CREATE TABLE `oc_blog_category_path` (
  `blog_category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_blog_category_path`
--

INSERT INTO `oc_blog_category_path` (`blog_category_id`, `path_id`, `level`) VALUES
(73, 73, 0),
(72, 72, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_blog_category_to_layout`
--

CREATE TABLE `oc_blog_category_to_layout` (
  `blog_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_blog_category_to_layout`
--

INSERT INTO `oc_blog_category_to_layout` (`blog_category_id`, `store_id`, `layout_id`) VALUES
(73, 0, 0),
(72, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_blog_category_to_store`
--

CREATE TABLE `oc_blog_category_to_store` (
  `blog_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_blog_category_to_store`
--

INSERT INTO `oc_blog_category_to_store` (`blog_category_id`, `store_id`) VALUES
(72, 0),
(73, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_cart`
--

CREATE TABLE `oc_cart` (
  `cart_id` int(11) UNSIGNED NOT NULL,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category`
--

CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `redirect` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `noindex` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `redirect`, `status`, `date_added`, `date_modified`, `noindex`) VALUES
(1, 'catalog/demo/products/42071_0.jpg', 0, 1, 1, 1, '', 1, '2022-11-11 12:51:32', '2025-11-26 11:31:43', 1),
(2, 'catalog/demo/products/42071_0.jpg', 1, 0, 0, 1, '', 1, '2022-11-11 12:51:32', '2022-11-21 07:15:27', 1),
(3, 'catalog/demo/products/42126_0.jpg', 1, 0, 0, 2, '', 1, '2022-11-11 12:51:32', '2022-11-11 13:51:54', 1),
(4, 'catalog/demo/products/42167_0.jpg', 1, 0, 0, 3, '', 1, '2022-11-11 12:51:32', '2022-11-11 12:51:32', 1),
(5, 'catalog/demo/products/42190_0.jpg', 1, 0, 0, 4, '', 1, '2022-11-11 12:51:32', '2022-11-11 12:51:32', 1),
(6, 'catalog/demo/products/42234_0.jpg', 1, 0, 0, 5, '', 1, '2022-11-11 12:51:32', '2022-11-11 12:51:32', 1),
(7, 'catalog/demo/products/42288_0.jpg', 0, 1, 1, 2, '', 1, '2022-11-11 12:51:33', '2022-12-15 13:02:34', 1),
(8, 'catalog/demo/products/42288_0.jpg', 7, 0, 0, 1, '', 1, '2022-11-11 12:51:33', '2022-11-11 12:51:33', 1),
(9, 'catalog/demo/products/42328_0.jpg', 7, 0, 0, 2, '', 1, '2022-11-11 12:51:33', '2022-11-11 12:51:33', 1),
(10, 'catalog/demo/products/42375_0.jpg', 7, 0, 0, 3, '', 1, '2022-11-11 12:51:33', '2022-11-11 12:51:33', 1),
(11, 'catalog/demo/products/42430_0.jpg', 7, 0, 0, 4, '', 1, '2022-11-11 12:51:33', '2022-11-11 12:51:33', 1),
(12, 'catalog/demo/products/42476_0.jpg', 7, 0, 0, 5, '', 1, '2022-11-11 12:51:33', '2022-11-11 12:51:33', 1),
(13, 'catalog/demo/products/42527_0.jpg', 0, 1, 1, 3, '', 1, '2022-11-11 12:51:33', '2022-12-15 13:03:54', 1),
(14, 'catalog/demo/products/42527_0.jpg', 13, 0, 0, 1, '', 1, '2022-11-11 12:51:33', '2022-11-11 12:51:33', 1),
(15, 'catalog/demo/products/42561_0.jpg', 13, 0, 0, 2, '', 1, '2022-11-11 12:51:33', '2022-11-11 12:51:33', 1),
(16, 'catalog/demo/products/42612_0.jpg', 13, 0, 0, 3, '', 1, '2022-11-11 12:51:33', '2022-11-11 12:51:33', 1),
(17, 'catalog/demo/products/42657_0.jpg', 13, 0, 0, 4, '', 1, '2022-11-11 12:51:33', '2022-11-11 12:51:33', 1),
(18, 'catalog/demo/products/42709_0.jpg', 13, 0, 0, 5, '', 1, '2022-11-11 12:51:33', '2022-11-11 12:51:33', 1),
(19, 'catalog/demo/products/42806_0.jpg', 0, 1, 1, 4, '', 1, '2022-11-11 12:51:33', '2022-11-11 12:51:33', 1),
(20, 'catalog/demo/products/42752_0.jpg', 19, 0, 0, 1, '', 1, '2022-11-11 12:51:33', '2022-11-11 12:51:33', 1),
(21, 'catalog/demo/products/42806_0.jpg', 19, 0, 0, 2, '', 1, '2022-11-11 12:51:33', '2022-11-11 12:51:33', 1),
(22, 'catalog/demo/products/42848_0.jpg', 19, 0, 0, 3, '', 1, '2022-11-11 12:51:34', '2022-11-11 12:51:34', 1),
(23, 'catalog/demo/products/42900_0.jpg', 19, 0, 0, 4, '', 1, '2022-11-11 12:51:34', '2022-11-11 12:51:34', 1),
(24, 'catalog/demo/products/42945_0.jpg', 19, 0, 0, 5, '', 1, '2022-11-11 12:51:34', '2022-11-11 12:51:34', 1),
(25, 'catalog/demo/products/43066_0.jpg', 0, 1, 1, 8, '', 1, '2022-11-11 12:51:34', '2022-11-11 12:51:34', 1),
(26, 'catalog/demo/products/42994_0.jpg', 25, 0, 0, 1, '', 1, '2022-11-11 12:51:34', '2022-11-11 12:51:34', 1),
(27, 'catalog/demo/products/43024_0.jpg', 25, 0, 0, 2, '', 1, '2022-11-11 12:51:34', '2022-11-11 12:51:34', 1),
(28, 'catalog/demo/products/43066_0.jpg', 25, 0, 0, 3, '', 1, '2022-11-11 12:51:34', '2022-11-11 12:51:34', 1),
(29, 'catalog/demo/products/43121_0.jpg', 25, 0, 0, 4, '', 1, '2022-11-11 12:51:34', '2022-11-11 12:51:34', 1),
(30, 'catalog/demo/products/43137_0.jpg', 0, 1, 1, 5, '', 1, '2022-11-11 12:51:34', '2022-11-11 12:51:34', 1),
(31, 'catalog/demo/products/43137_0.jpg', 30, 0, 0, 1, '', 1, '2022-11-11 12:51:34', '2022-11-11 12:51:34', 1),
(32, 'catalog/demo/products/43182_0.jpg', 30, 0, 0, 2, '', 1, '2022-11-11 12:51:34', '2022-11-11 12:51:34', 1),
(33, 'catalog/demo/products/43230_0.jpg', 30, 0, 0, 3, '', 1, '2022-11-11 12:51:34', '2022-11-11 12:51:34', 1),
(34, 'catalog/demo/products/43311_0.jpg', 30, 0, 0, 4, '', 1, '2022-11-11 12:51:34', '2022-11-11 12:51:34', 1),
(35, 'catalog/demo/products/43320_0.jpg', 30, 0, 0, 5, '', 1, '2022-11-11 12:51:34', '2022-11-11 12:51:34', 1),
(36, 'catalog/demo/products/43437_0.jpg', 0, 1, 1, 6, '', 1, '2022-11-11 12:51:34', '2022-11-11 12:51:34', 1),
(37, 'catalog/demo/products/43366_0.jpg', 36, 0, 0, 1, '', 1, '2022-11-11 12:51:34', '2022-11-11 12:51:34', 1),
(38, 'catalog/demo/products/43437_0.jpg', 36, 0, 0, 2, '', 1, '2022-11-11 12:51:35', '2022-11-11 12:51:35', 1),
(39, 'catalog/demo/products/43448_0.jpg', 36, 0, 0, 3, '', 1, '2022-11-11 12:51:35', '2022-11-11 12:51:35', 1),
(40, 'catalog/demo/products/43493_0.jpg', 36, 0, 0, 4, '', 1, '2022-11-11 12:51:35', '2022-11-11 12:51:35', 1),
(41, 'catalog/demo/products/43495_0.jpg', 36, 0, 0, 5, '', 1, '2022-11-11 12:51:35', '2022-11-11 12:51:35', 1),
(42, 'catalog/demo/products/43691_0.jpg', 0, 1, 1, 7, '', 1, '2022-11-11 12:51:35', '2022-11-11 12:51:35', 1),
(43, 'catalog/demo/products/43542_0.jpg', 42, 0, 0, 1, '', 1, '2022-11-11 12:51:35', '2022-11-11 12:51:35', 1),
(44, 'catalog/demo/products/43599_0.jpg', 42, 0, 0, 2, '', 1, '2022-11-11 12:51:35', '2022-11-11 12:51:35', 1),
(45, 'catalog/demo/products/43639_0.jpg', 42, 0, 0, 3, '', 1, '2022-11-11 12:51:35', '2022-11-11 12:51:35', 1),
(46, 'catalog/demo/products/43691_0.jpg', 42, 0, 0, 4, '', 1, '2022-11-11 12:51:35', '2022-11-11 12:51:35', 1),
(47, 'catalog/demo/products/43737_0.jpg', 42, 0, 0, 5, '', 1, '2022-11-11 12:51:35', '2022-11-11 12:51:35', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_description`
--

CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_h1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stickers` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`, `meta_h1`, `stickers`) VALUES
(4, 1, 'Квадрокоптеры', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(5, 1, 'Наушники', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(6, 1, 'Зарядные устройства', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(7, 2, 'Laptops and computers', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(8, 1, 'Ноутбуки', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(9, 1, 'Моноблоки', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(10, 1, 'Мониторы', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(11, 1, 'Принтеры', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(12, 1, 'Колонки для компьютера', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(14, 1, 'Кофемашины', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(15, 1, 'Тепловые пушки', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(16, 1, 'Кондиционеры', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(17, 1, 'Водонагреватели', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(18, 1, 'Кулеры для воды', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(19, 1, 'Строительство и ремонт', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(20, 1, 'Генераторы', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(21, 1, 'Перфораторы', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(22, 1, 'Дрели', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(23, 1, 'Строительные пылесосы', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(24, 1, 'Шуруповерты', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(25, 1, 'Дом и дача', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(26, 1, 'Тумбы', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(27, 1, 'Газонокосилки', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(28, 1, 'Бассейны', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(29, 1, 'Матрасы', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(30, 1, 'Красота и здоровье', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(31, 1, 'Фены', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(32, 1, 'Массажеры', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(33, 1, 'Триммеры', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(34, 1, 'Эпиляторы', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(35, 1, 'Тонометры', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(36, 1, 'Детские товары', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(37, 1, 'Радиоуправляемые игрушки', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(38, 1, 'Коляски', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(39, 1, 'Автокресла', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(40, 1, 'Гироскутеры', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(41, 1, 'Детские самокаты', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(42, 1, 'Спорт и отдых', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(43, 1, 'Электросамокаты', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(44, 1, 'Велосипеды', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(45, 1, 'Скейтборды и лонгборды', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(46, 1, 'Палатки и тенты', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(47, 1, 'Лодки', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(3, 1, 'Планшеты', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(1, 1, 'Смартфоны и гаджеты', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа &quot;боли в спине пройдут если добавить это ...&quot;. Ну вы поняли.', '', '', '', '', '[{\"content\":\"&lt;b&gt;\\u0421\\u0442\\u0438\\u043a\\u0435\\u0440&lt;\\/b&gt;\",\"class\":\"tag is-warning\"},{\"content\":\"\\u0412\\u0442\\u043e\\u0440\\u043e\\u0439 \\u0441\\u0442\\u0438\\u043a\\u0435\\u0440\",\"class\":\"tag is-danger\"}]'),
(2, 2, 'Smartphones', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(5, 2, 'Headphones', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(3, 2, 'Tablets', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(4, 2, 'Quadcopters', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(6, 2, 'Charging device', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(7, 1, 'Ноутбуки и компьютеры', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(8, 2, 'Laptops', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(9, 2, 'Monoblocks', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(10, 2, 'Monitors', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(11, 2, 'Printers', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(12, 2, 'Computer speakers', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(13, 2, 'Appliances', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(14, 2, 'Coffee machines', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(15, 2, 'Heat guns', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(16, 2, 'Air conditioners', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(17, 2, 'Water heaters', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(18, 2, 'Water coolers', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(19, 2, 'Construction and repair', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(20, 2, 'Generators', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(21, 2, 'Perforators', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(22, 2, 'Drills', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(23, 2, 'Construction vacuum cleaners', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(24, 2, 'Screwdrivers', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(25, 2, 'House and cottage', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(26, 2, 'Cabinets', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(27, 2, 'Lawn mowers', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(28, 2, 'Pools', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(29, 2, 'Mattresses', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(30, 2, 'beauty and health', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(31, 2, 'Hair dryers', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(32, 2, 'Massagers', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(33, 2, 'Trimmers', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(34, 2, 'Epilators', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(35, 2, 'Tonometers', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(36, 2, 'Children&#039;s products', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(37, 2, 'Radio-controlled toys', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(38, 2, 'Strollers', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(39, 2, 'Car seats', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(40, 2, 'Gyroscooters', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(41, 2, 'Children&#039;s scooters', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(42, 2, 'Sports and recreation', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(43, 2, 'Electric scooters', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(44, 2, 'Bicycles', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(45, 2, 'Skateboards and longboards', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(46, 2, 'Tents and awnings', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(47, 2, 'Boats', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', ''),
(2, 1, 'Смартфоны', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(13, 1, 'Бытовая техника', 'Описание для категории, в основном для нужд SEO, но можно и попытаться донести суть вашего предложения до целевой аудитории, что-то типа \"боли в спине пройдут если добавить это ...\". Ну вы поняли.', '', '', '', '', ''),
(1, 2, 'Smartphones and gadgets', 'Description for the category, mainly for the needs of SEO, users are too lazy to read, give them pictures, but better videos. With boobs and asses preferably.', '', '', '', '', '[{\"content\":\"&lt;b&gt;Sticker&lt;\\/b&gt;\",\"class\":\"tag is-warning\"},{\"content\":\"Second one\",\"class\":\"tag is-danger\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_filter`
--

CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_category_filter`
--

INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_path`
--

CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(1, 1, 0),
(2, 1, 0),
(2, 2, 1),
(3, 1, 0),
(3, 3, 1),
(4, 1, 0),
(4, 4, 1),
(5, 1, 0),
(5, 5, 1),
(6, 1, 0),
(6, 6, 1),
(7, 7, 0),
(8, 7, 0),
(8, 8, 1),
(9, 7, 0),
(9, 9, 1),
(10, 7, 0),
(10, 10, 1),
(11, 7, 0),
(11, 11, 1),
(12, 7, 0),
(12, 12, 1),
(13, 13, 0),
(14, 13, 0),
(14, 14, 1),
(15, 13, 0),
(15, 15, 1),
(16, 13, 0),
(16, 16, 1),
(17, 13, 0),
(17, 17, 1),
(18, 13, 0),
(18, 18, 1),
(19, 19, 0),
(20, 19, 0),
(20, 20, 1),
(21, 19, 0),
(21, 21, 1),
(22, 19, 0),
(22, 22, 1),
(23, 19, 0),
(23, 23, 1),
(24, 19, 0),
(24, 24, 1),
(25, 25, 0),
(26, 25, 0),
(26, 26, 1),
(27, 25, 0),
(27, 27, 1),
(28, 25, 0),
(28, 28, 1),
(29, 25, 0),
(29, 29, 1),
(30, 30, 0),
(31, 30, 0),
(31, 31, 1),
(32, 30, 0),
(32, 32, 1),
(33, 30, 0),
(33, 33, 1),
(34, 30, 0),
(34, 34, 1),
(35, 30, 0),
(35, 35, 1),
(36, 36, 0),
(37, 36, 0),
(37, 37, 1),
(38, 36, 0),
(38, 38, 1),
(39, 36, 0),
(39, 39, 1),
(40, 36, 0),
(40, 40, 1),
(41, 36, 0),
(41, 41, 1),
(42, 42, 0),
(43, 42, 0),
(43, 43, 1),
(44, 42, 0),
(44, 44, 1),
(45, 42, 0),
(45, 45, 1),
(46, 42, 0),
(46, 46, 1),
(47, 42, 0),
(47, 47, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_layout`
--

CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(2, 0, 0),
(3, 0, 0),
(7, 0, 0),
(13, 0, 0),
(1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_store`
--

CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_country`
--

CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_code_2` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_code_3` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_format` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Армения', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Азербайджан', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Белоруссия (Беларусь)', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D\'Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Грузия', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Казахстан', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'South Korea', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Киргизия (Кыргызстан)', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People\'s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Молдова', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Российская Федерация', 'RU', 'RUS', '{postcode} {zone} {city} {address_1} {address_2}', 1, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Таджикистан', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Туркменистан', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Украина', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Узбекистан', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 1),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 1),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 1),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 1),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 1),
(257, 'Jersey', 'JE', 'JEY', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon`
--

CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, 'Demo купон', '2222', 'P', '10.0000', 0, 0, '0.0000', '2024-01-01', '2025-01-01', 10, '10', 1, '2009-01-27 13:55:03');

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_category`
--

CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_history`
--

CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_product`
--

CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_csvprice_pro`
--

CREATE TABLE `oc_csvprice_pro` (
  `setting_id` int(11) NOT NULL,
  `key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `serialized` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_csvprice_pro`
--

INSERT INTO `oc_csvprice_pro` (`setting_id`, `key`, `value`, `serialized`) VALUES
(1, 'version', '5.0.12.14', 0),
(2, 'ProductSetting', 'eyJ0b19zdG9yZSI6WzBdLCJsYXlvdXQiOltdLCJzdGF0dXMiOjEsInRheF9jbGFzc19pZCI6MCwibWluaW11bSI6MSwic29ydF9vcmRlciI6MTAwLCJzdWJ0cmFjdCI6MSwic3RvY2tfc3RhdHVzX2lkIjowLCJzaGlwcGluZyI6MCwibGVuZ3RoX2NsYXNzX2lkIjoxLCJ3ZWlnaHRfY2xhc3NfaWQiOjEsIm9wdGlvbl90eXBlIjoic2VsZWN0Iiwib3B0aW9uX3JlcXVpcmVkIjowLCJvcHRpb25fdmFsdWUiOiIiLCJvcHRpb25fcXVhbnRpdHkiOjAsIm9wdGlvbl9zdWJ0cmFjdF9zdG9jayI6MCwib3B0aW9uX3ByaWNlX3ByZWZpeCI6IisiLCJvcHRpb25fcG9pbnRzX3ByZWZpeCI6IisiLCJvcHRpb25fcG9pbnRzX2RlZmF1bHQiOjAsIm9wdGlvbl93ZWlnaHRfcHJlZml4IjoiKyIsIm9wdGlvbl93ZWlnaHRfZGVmYXVsdCI6MH0=', 1),
(3, 'ProductExport', 'eyJmaWxlX2VuY29kaW5nIjoiVVRGLTgiLCJjc3ZfZGVsaW1pdGVyIjoiOyIsImxhbmd1YWdlX2lkIjoiMSIsImZyb21fc3RvcmUiOlsiMCJdLCJleHBvcnRfY2F0ZWdvcnkiOiIwIiwiZGVsaW1pdGVyX2NhdGVnb3J5IjoifCIsImNhdGVnb3J5X3BhcmVudCI6IjEiLCJleHBvcnRfcmVsYXRlZCI6Im9mZiIsImltYWdlX3VybCI6IjAiLCJsaW1pdF9zdGFydCI6IjAiLCJsaW1pdF9lbmQiOiIxMDAwIiwicHJvZHVjdF9maWx0ZXIiOiIwIiwiZmlsdGVyX25hbWUiOiIiLCJmaWx0ZXJfc2t1IjoiIiwiZmlsdGVyX2xvY2F0aW9uIjoiIiwiZmlsdGVyX3ByaWNlX3ByZWZpeCI6IjEiLCJmaWx0ZXJfcHJpY2UiOiIiLCJmaWx0ZXJfcHJpY2Vfc3RhcnQiOiIiLCJmaWx0ZXJfcHJpY2VfZW5kIjoiIiwiZmlsdGVyX3F1YW50aXR5X3ByZWZpeCI6IjEiLCJmaWx0ZXJfcXVhbnRpdHkiOiIiLCJmaWx0ZXJfc3RvY2tfc3RhdHVzIjoiMCIsImZpbHRlcl9zdGF0dXMiOiIzIiwiZmllbGRzX3NldCI6eyJfSURfIjoiMSIsIl9OQU1FXyI6IjEiLCJfTUFOVUZBQ1RVUkVSXyI6IjEifX0=', 1),
(4, 'ProductImport', 'eyJmaWxlX2VuY29kaW5nIjoiVVRGLTgiLCJjc3ZfZGVsaW1pdGVyIjoiOyIsImxhbmd1YWdlX2lkIjoiMSIsIm1vZGUiOiIyIiwia2V5X2ZpZWxkIjoiX0lEXyIsImtleV9maWVsZF9tYW51ZmFjdHVyZXIiOiIiLCJpbXBvcnRfaWQiOiIwIiwiZGVsaW1pdGVyX2NhdGVnb3J5IjoifCIsImZpbGxfY2F0ZWdvcnkiOiIxIiwidG9wIjoiMSIsImNvbHVtbiI6IjEiLCJpbWFnZV9kb3dubG9hZCI6IjAiLCJpbWdfaW5pdGlhbF9kaXIiOiIiLCJjYWxjX21vZGVfMSI6IjAiLCJjYWxjX3ZhbHVlXzEiOiIiLCJjYWxjX21vZGVfMiI6IjAiLCJjYWxjX3ZhbHVlXzIiOiIiLCJlbXB0eV9maWVsZCI6IjEiLCJwcm9kdWN0X2Rpc2FibGUiOiIwIiwicXVhbnRpdHlfcmVzZXQiOiIwIiwiaXRlcl9saW1pdCI6IjAiLCJza2lwX21hbnVmYWN0dXJlciI6IjAiLCJ0b19tYW51ZmFjdHVyZXIiOiIiLCJza2lwX2ltcG9ydF9zdG9yZSI6IjEiLCJza2lwX21haW5fY2F0ZWdvcnkiOiIxIiwibWFpbl9jYXRlZ29yeV9pZCI6IiIsInNraXBfY2F0ZWdvcnkiOiIxIiwicHJvZHVjdF9jYXRlZ29yeSI6IjAiLCJpbWdfcGF0aCI6IiIsImltcG9ydF9yZWxhdGVkX3R5cGUiOiIwIiwiZXhjbHVkZV9maWx0ZXIiOiIwIiwiZXhjbHVkZV9maWx0ZXJfbmFtZSI6IiIsImV4Y2x1ZGVfZmlsdGVyX2Rlc2MiOiIiLCJleGNsdWRlX2ZpbHRlcl9hdHRyIjoiIn0=', 1),
(5, 'CategoryExport', 'eyJmaWxlX2VuY29kaW5nIjoiVVRGLTgiLCJjc3ZfZGVsaW1pdGVyIjoiOyIsImxhbmd1YWdlX2lkIjoiMSIsImZyb21fc3RvcmUiOlsiMCJdLCJkZWxpbWl0ZXJfY2F0ZWdvcnkiOiJ8IiwiY2F0ZWdvcnlfcGFyZW50IjoiMCIsImltYWdlX3VybCI6IjAiLCJmaWVsZHNfc2V0Ijp7Il9JRF8iOiIxIiwiX05BTUVfIjoiMSIsIl9TRU9fS0VZV09SRF8iOiIxIiwiX0RFU0NSSVBUSU9OXyI6IjEifX0=', 1),
(6, 'CategoryImport', 'eyJmaWxlX2VuY29kaW5nIjoiVVRGLTgiLCJjc3ZfZGVsaW1pdGVyIjoiOyIsImxhbmd1YWdlX2lkIjoiMiIsIm1vZGUiOiIyIiwia2V5X2ZpZWxkIjoiX0lEXyIsImRlbGltaXRlcl9jYXRlZ29yeSI6InwiLCJ0b19zdG9yZSI6WyIwIl0sInNvcnRfb3JkZXIiOiIxIiwic3RhdHVzIjoiMSIsImNhdGVnb3J5X2Rpc2FibGUiOiIwIiwiaW1wb3J0X2lkIjoiMCIsImltYWdlX2Rvd25sb2FkIjoiMCJ9', 1),
(7, 'ManufacturerExport', 'eyJmaWxlX2VuY29kaW5nIjoiVVRGLTgiLCJjc3ZfZGVsaW1pdGVyIjoiOyIsImxhbmd1YWdlX2lkIjoiMSIsImZyb21fc3RvcmUiOlsiMCJdLCJpbWFnZV91cmwiOiIwIiwiZmllbGRzX3NldCI6eyJfSURfIjoiMSIsIl9OQU1FXyI6IjEiLCJfU0VPX0tFWVdPUkRfIjoiMSIsIl9ERVNDUklQVElPTl8iOiIxIiwiX0lNQUdFXyI6IjEifX0=', 1),
(8, 'ManufacturerImport', 'eyJmaWxlX2VuY29kaW5nIjoiVVRGLTgiLCJjc3ZfZGVsaW1pdGVyIjoiOyIsImxhbmd1YWdlX2lkIjoiMSIsIm1vZGUiOiIyIiwia2V5X2ZpZWxkIjoiX0lEXyIsInRvX3N0b3JlIjpbIjAiXSwiaW1wb3J0X2lkIjoiMCIsInNvcnRfb3JkZXIiOiIxIiwiaW1hZ2VfZG93bmxvYWQiOiIwIn0=', 1),
(9, 'CoreType', 'eyJCQVNFX1BSSUNFX0RJU0NPVU5UIjowLCJCQVNFX1BSSUNFX1NQRUNJQUwiOjAsIk1BSU5fQ0FURUdPUlkiOjEsIk1FVEFfSDEiOjEsIkNBVEVHT1JZX01FVEFfSDEiOjEsIk1BTlVGQUNUVVJFUl9ERVNDUklQVElPTiI6MSwiTUFOVUZBQ1RVUkVSX0RFU0NSSVBUSU9OX05BTUUiOjAsIlBST0RVQ1RfT1BUSU9OX0xJTktTIjowLCJDU1ZQUklDRVBST19QTFVHSU5TIjpbXX0=', 1),
(10, 'Session', 'eyJsYW5ndWFnZSI6InJ1LXJ1IiwiY3VycmVuY3kiOiJSVUIiLCJjYXB0Y2hhIjoiZThlZWVjIiwidXNlcl9pZCI6IjEiLCJ1c2VyX3Rva2VuIjoiMzlhbHNVUVpvV0xZSmlvNTFSdmRjdXdEQ0RBR2JmNGYiLCJwYXltZW50X2FkZHJlc3MiOnsiYWRkcmVzc19pZCI6MCwiY291bnRyeV9pZCI6IjE3NiIsInpvbmVfaWQiOiIyNzYxIiwiZmlyc3RuYW1lIjoiIiwibGFzdG5hbWUiOiIiLCJjb21wYW55IjoiIiwiYWRkcmVzc18xIjoiIiwiYWRkcmVzc18yIjoiIiwiYWRkcmVzc19mb3JtYXQiOiJ7cG9zdGNvZGV9IHt6b25lfSB7Y2l0eX0ge2FkZHJlc3NfMX0ge2FkZHJlc3NfMn0iLCJwb3N0Y29kZSI6IiIsImNpdHkiOiIiLCJ6b25lIjoiXHUwNDFjXHUwNDNlXHUwNDQxXHUwNDNhXHUwNDMyXHUwNDMwIiwiem9uZV9jb2RlIjoiIiwiY291bnRyeSI6Ilx1MDQyMFx1MDQzZVx1MDQ0MVx1MDQ0MVx1MDQzOFx1MDQzOVx1MDQ0MVx1MDQzYVx1MDQzMFx1MDQ0ZiBcdTA0MjRcdTA0MzVcdTA0MzRcdTA0MzVcdTA0NDBcdTA0MzBcdTA0NDZcdTA0MzhcdTA0NGYiLCJjdXN0b21fZmllbGQiOm51bGx9LCJzaGlwcGluZ19hZGRyZXNzIjpmYWxzZSwiYWNjb3VudCI6Imd1ZXN0IiwibGFzdF9vcmRlcl9pZCI6MTcsImZpbGVfbWFuYWdlcl9kaXJlY3RvcnkiOiJcL2hvbWVcL3NcL3NvZXZ2bFwvZXguYmlkenoucnVcL3B1YmxpY19odG1sXC9pbWFnZVwvY2F0YWxvZ1wvZGVtb1wvbWFudWZhY3R1cmVycyIsImRyaXZlciI6Ik1hbnVmYWN0dXJlciIsInRhYnMiOnsiUHJvZHVjdCI6InRhYl9pbXBvcnQiLCJDYXRlZ29yeSI6InRhYl9pbXBvcnQiLCJNYW51ZmFjdHVyZXIiOiJ0YWJfaW1wb3J0In0sInVwbG9hZGVkX2ZpbGVfbmFtZSI6InByb2R1Y3RfZXhwb3J0XzAtMTAwMF8yMDIyLTExLTE0LTE2MTAgKDEpLmNzdiIsImNzdl9wcm9jZXNzaW5nX2ZpbGVfbmFtZSI6IlwvaG9tZVwvc1wvc29ldnZsXC9leC5iaWR6ei5ydVwvc3RvcmFnZVwvY3N2cHJpY2VfcHJvXC8xNjY4NDQyNTQ5IiwiY3VzdG9tZXJfaWQiOiI1OSIsInN1Y2Nlc3MiOiJcdTA0MThcdTA0M2NcdTA0M2ZcdTA0M2VcdTA0NDBcdTA0NDIgXHUwNDM0XHUwNDMwXHUwNDNkXHUwNDNkXHUwNDRiXHUwNDQ1IFx1MDQzN1x1MDQzMFx1MDQzMlx1MDQzNVx1MDQ0MFx1MDQ0OFx1MDQ1MVx1MDQzZCE8YnIgXC8+XHUwNDEyXHUwNDQxXHUwNDM1XHUwNDMzXHUwNDNlIFx1MDQzZVx1MDQzMVx1MDQ0MFx1MDQzMFx1MDQzMVx1MDQzZVx1MDQ0Mlx1MDQzMFx1MDQzZFx1MDQzZSA8Yj42PFwvYj4gXHUwNDQxXHUwNDQyXHUwNDQwXHUwNDNlXHUwNDNhITxiciBcLz48YnIgXC8+IFx1MDQxZVx1MDQzMVx1MDQzZFx1MDQzZVx1MDQzMlx1MDQzYlx1MDQzNVx1MDQzZFx1MDQzZTogPGI+NjxcL2I+PGJyIFwvPlx1MDQxNFx1MDQzZVx1MDQzMVx1MDQzMFx1MDQzMlx1MDQzYlx1MDQzNVx1MDQzZFx1MDQzZTogPGI+MDxcL2I+PFwvYj48YnIgXC8+XHUwNDFmXHUwNDQwXHUwNDNlXHUwNDNmXHUwNDQzXHUwNDQ5XHUwNDM1XHUwNDNkXHUwNDNlOiA8Yj4wPFwvYj4ifQ==', 1),
(11, 'LicenseKey', 'apeioqpoewrpqoewiurpod', 0),
(12, 'productFieldSetting', 'IiI=', 1),
(13, 'ProductAttributeField', 'IiI=', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_csvprice_pro_crontab`
--

CREATE TABLE `oc_csvprice_pro_crontab` (
  `job_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `job_key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_type` enum('import','export') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_file_location` enum('dir','web','ftp') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_time_start` datetime NOT NULL,
  `job_offline` tinyint(1) NOT NULL DEFAULT '0',
  `job_data` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `serialized` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_csvprice_pro_images`
--

CREATE TABLE `oc_csvprice_pro_images` (
  `catalog_id` int(11) NOT NULL,
  `image_key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `webp` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_csvprice_pro_profiles`
--

CREATE TABLE `oc_csvprice_pro_profiles` (
  `profile_id` int(11) NOT NULL,
  `key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `catalog` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'product',
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `serialized` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_csvprice_pro_profiles`
--

INSERT INTO `oc_csvprice_pro_profiles` (`profile_id`, `key`, `catalog`, `name`, `value`, `serialized`) VALUES
(1, 'profile_import', 'product', 'Default Product Import', 'eyJjc3Zfc2V0dGluZyI6eyJ0b19zdG9yZSI6WzBdLCJsYXlvdXQiOltdLCJzdGF0dXMiOjEsInRheF9jbGFzc19pZCI6MCwibWluaW11bSI6MSwic29ydF9vcmRlciI6MTAwLCJzdWJ0cmFjdCI6MSwic3RvY2tfc3RhdHVzX2lkIjowLCJzaGlwcGluZyI6MCwibGVuZ3RoX2NsYXNzX2lkIjoxLCJ3ZWlnaHRfY2xhc3NfaWQiOjEsIm9wdGlvbl90eXBlIjoic2VsZWN0Iiwib3B0aW9uX3JlcXVpcmVkIjowLCJvcHRpb25fdmFsdWUiOiIiLCJvcHRpb25fcXVhbnRpdHkiOjAsIm9wdGlvbl9zdWJ0cmFjdF9zdG9jayI6MCwib3B0aW9uX3ByaWNlX3ByZWZpeCI6IisiLCJvcHRpb25fcG9pbnRzX3ByZWZpeCI6IisiLCJvcHRpb25fcG9pbnRzX2RlZmF1bHQiOjAsIm9wdGlvbl93ZWlnaHRfcHJlZml4IjoiKyIsIm9wdGlvbl93ZWlnaHRfZGVmYXVsdCI6MH0sImNzdl9pbXBvcnQiOnsiZmlsZV9lbmNvZGluZyI6IlVURi04IiwiY3N2X2RlbGltaXRlciI6IjsiLCJjc3ZfaW1wb3J0IjowLCJtb2RlIjoyLCJjYWxjX21vZGUiOjAsImxhbmd1YWdlX2lkIjoxLCJrZXlfZmllbGQiOiJfSURfIiwiZXhwb3J0X3JlbGF0ZWRfdHlwZSI6MCwiaW1hZ2VfZG93bmxvYWQiOjAsInNraXBfaW1wb3J0X3N0b3JlIjoxLCJza2lwX21hbnVmYWN0dXJlciI6MSwic2tpcF9tYWluX2NhdGVnb3J5IjoxLCJza2lwX2NhdGVnb3J5IjoxLCJpdGVyX2xpbWl0IjowLCJkZWxpbWl0ZXJfY2F0ZWdvcnkiOiJ8IiwiZmlsbF9jYXRlZ29yeSI6MCwidG9wIjoxLCJjb2x1bW4iOjF9LCJjc3ZfcHJvZHVjdF9maWVsZCI6W119', 1),
(2, 'profile_export', 'product', 'Default Product Export', 'eyJjc3Zfc2V0dGluZyI6eyJ0b19zdG9yZSI6WzBdLCJsYXlvdXQiOltdLCJzdGF0dXMiOjEsInRheF9jbGFzc19pZCI6MCwibWluaW11bSI6MSwic29ydF9vcmRlciI6MTAwLCJzdWJ0cmFjdCI6MSwic3RvY2tfc3RhdHVzX2lkIjowLCJzaGlwcGluZyI6MCwibGVuZ3RoX2NsYXNzX2lkIjoxLCJ3ZWlnaHRfY2xhc3NfaWQiOjEsIm9wdGlvbl90eXBlIjoic2VsZWN0Iiwib3B0aW9uX3JlcXVpcmVkIjowLCJvcHRpb25fdmFsdWUiOiIiLCJvcHRpb25fcXVhbnRpdHkiOjAsIm9wdGlvbl9zdWJ0cmFjdF9zdG9jayI6MCwib3B0aW9uX3ByaWNlX3ByZWZpeCI6IisiLCJvcHRpb25fcG9pbnRzX3ByZWZpeCI6IisiLCJvcHRpb25fcG9pbnRzX2RlZmF1bHQiOjAsIm9wdGlvbl93ZWlnaHRfcHJlZml4IjoiKyIsIm9wdGlvbl93ZWlnaHRfZGVmYXVsdCI6MH0sImNzdl9leHBvcnQiOnsiZmlsZV9lbmNvZGluZyI6IlVURi04IiwiY3N2X2RlbGltaXRlciI6IjsiLCJsYW5ndWFnZV9pZCI6MSwiZnJvbV9zdG9yZSI6W10sInByb2R1Y3RfY2F0ZWdvcnkiOjAsImV4cG9ydF9jYXRlZ29yeSI6MCwiZXhwb3J0X3JlbGF0ZWQiOiJvZmYiLCJkZWxpbWl0ZXJfY2F0ZWdvcnkiOiJ8IiwicHJvZHVjdF9tYW51ZmFjdHVyZXIiOjAsImltYWdlX3VybCI6MCwibGltaXRfc3RhcnQiOjAsImxpbWl0X2VuZCI6MTAwMCwicHJvZHVjdF9maWx0ZXIiOjAsImZpbHRlcl9uYW1lIjoiIiwiZmlsdGVyX3NrdSI6IiIsImZpbHRlcl9sb2NhdGlvbiI6IiIsImZpbHRlcl9wcmljZV9wcmVmaXgiOjEsImZpbHRlcl9wcmljZSI6IiIsImZpbHRlcl9wcmljZV9zdGFydCI6IiIsImZpbHRlcl9wcmljZV9lbmQiOiIiLCJmaWx0ZXJfcXVhbnRpdHlfcHJlZml4IjoxLCJmaWx0ZXJfcXVhbnRpdHkiOiIiLCJmaWx0ZXJfc3RvY2tfc3RhdHVzIjowLCJmaWx0ZXJfc3RhdHVzIjozLCJmaWVsZHNfc2V0Ijp7Il9OQU1FXyI6MSwiX0lEXyI6MX19LCJjc3ZfcHJvZHVjdF9maWVsZCI6W119', 1),
(3, 'profile_import', 'order', 'Default Order Import', 'eyJjc3ZfaW1wb3J0Ijp7ImZpbGVfZW5jb2RpbmciOiJVVEYtOCIsImNzdl9kZWxpbWl0ZXIiOiI7IiwiZmllbGRfaWQiOiJfSURfIiwiZmllbGRfc3RhdHVzX2lkIjoiX1NUQVRVU19JRF8iLCJmaWVsZF9zdGF0dXMiOiJfU1RBVFVTXyIsImZpZWxkX2NvbW1lbnQiOiJfQ09NTUVOVF8iLCJmaWVsZF9ub3RpZnkiOiJfTk9USUZZXyIsImFwaV9pZCI6IjAifX0=', 1),
(4, 'profile_export', 'order', 'Default Order Export', 'eyJjc3ZfZXhwb3J0Ijp7ImZpbHRlcl9vcmRlcl9pZCI6IiIsImZpbHRlcl9jdXN0b21lciI6IiIsImZpbHRlcl9vcmRlcl9zdGF0dXNfaWQiOiIqIiwiZmlsdGVyX3RpbWVfaW50ZXJ2YWwiOiIwIiwiZmlsdGVyX2RhdGVfYWRkZWRfc3RhcnQiOiIiLCJmaWx0ZXJfZGF0ZV9hZGRlZF9lbmQiOiIiLCJmaWx0ZXJfZGF0ZV9tb2RpZmllZF9zdGFydCI6IiIsImZpbHRlcl9kYXRlX21vZGlmaWVkX2VuZCI6IiIsImZpbHRlcl90b3RhbF9wcmVmaXgiOiIxIiwiZmlsdGVyX3RvdGFsX3N1bSI6IiIsImZyb21fc3RvcmUiOlsiMCJdfSwiY3N2X3NldHRpbmciOnsiZmlsZV9lbmNvZGluZyI6IlVURi04IiwiZGVsaW1pdGVyIjoiOyIsImNzdl90aXRsZSI6IjAiLCJmaWVsZHNfc2V0Ijp7Im9yZGVyX2lkIjp7InN0YXR1cyI6IjEiLCJjYXB0aW9uIjoib3JkZXJfaWQifSwiaW52b2ljZV9ubyI6eyJzdGF0dXMiOiIwIiwiY2FwdGlvbiI6Imludm9pY2Vfbm8ifSwiaW52b2ljZV9kYXRlIjp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoiaW52b2ljZV9kYXRlIn0sInN0b3JlX2lkIjp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoic3RvcmVfaWQifSwic3RvcmVfbmFtZSI6eyJzdGF0dXMiOiIwIiwiY2FwdGlvbiI6InN0b3JlX25hbWUifSwic3RvcmVfdXJsIjp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoic3RvcmVfdXJsIn0sImN1c3RvbWVyX2lkIjp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoiY3VzdG9tZXJfaWQifSwiY3VzdG9tZXJfZ3JvdXBfaWQiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJjdXN0b21lcl9ncm91cF9pZCJ9LCJmaXJzdG5hbWUiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJmaXJzdG5hbWUifSwibGFzdG5hbWUiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJsYXN0bmFtZSJ9LCJmaXJzdG5hbWVfbGFzdG5hbWUiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJmaXJzdG5hbWVfbGFzdG5hbWUifSwiZW1haWwiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJlbWFpbCJ9LCJ0ZWxlcGhvbmUiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJ0ZWxlcGhvbmUifSwiZmF4Ijp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoiZmF4In0sInBheW1lbnRfZmlyc3RuYW1lIjp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoicGF5bWVudF9maXJzdG5hbWUifSwicGF5bWVudF9sYXN0bmFtZSI6eyJzdGF0dXMiOiIwIiwiY2FwdGlvbiI6InBheW1lbnRfbGFzdG5hbWUifSwicGF5bWVudF9jb21wYW55Ijp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoicGF5bWVudF9jb21wYW55In0sInBheW1lbnRfYWRkcmVzc18xIjp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoicGF5bWVudF9hZGRyZXNzXzEifSwicGF5bWVudF9hZGRyZXNzXzIiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJwYXltZW50X2FkZHJlc3NfMiJ9LCJwYXltZW50X2NpdHkiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJwYXltZW50X2NpdHkifSwicGF5bWVudF9wb3N0Y29kZSI6eyJzdGF0dXMiOiIwIiwiY2FwdGlvbiI6InBheW1lbnRfcG9zdGNvZGUifSwicGF5bWVudF9jb3VudHJ5Ijp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoicGF5bWVudF9jb3VudHJ5In0sInBheW1lbnRfem9uZSI6eyJzdGF0dXMiOiIwIiwiY2FwdGlvbiI6InBheW1lbnRfem9uZSJ9LCJwYXltZW50X21ldGhvZCI6eyJzdGF0dXMiOiIwIiwiY2FwdGlvbiI6InBheW1lbnRfbWV0aG9kIn0sInBheW1lbnRfY29kZSI6eyJzdGF0dXMiOiIwIiwiY2FwdGlvbiI6InBheW1lbnRfY29kZSJ9LCJzaGlwcGluZ19maXJzdG5hbWUiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJzaGlwcGluZ19maXJzdG5hbWUifSwic2hpcHBpbmdfbGFzdG5hbWUiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJzaGlwcGluZ19sYXN0bmFtZSJ9LCJzaGlwcGluZ19jb21wYW55Ijp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoic2hpcHBpbmdfY29tcGFueSJ9LCJzaGlwcGluZ19hZGRyZXNzXzEiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJzaGlwcGluZ19hZGRyZXNzXzEifSwic2hpcHBpbmdfYWRkcmVzc18yIjp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoic2hpcHBpbmdfYWRkcmVzc18yIn0sInNoaXBwaW5nX2NpdHkiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJzaGlwcGluZ19jaXR5In0sInNoaXBwaW5nX3Bvc3Rjb2RlIjp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoic2hpcHBpbmdfcG9zdGNvZGUifSwic2hpcHBpbmdfY291bnRyeSI6eyJzdGF0dXMiOiIwIiwiY2FwdGlvbiI6InNoaXBwaW5nX2NvdW50cnkifSwic2hpcHBpbmdfem9uZSI6eyJzdGF0dXMiOiIwIiwiY2FwdGlvbiI6InNoaXBwaW5nX3pvbmUifSwic2hpcHBpbmdfbWV0aG9kIjp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoic2hpcHBpbmdfbWV0aG9kIn0sInNoaXBwaW5nX2NvZGUiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJzaGlwcGluZ19jb2RlIn0sInNoaXBwaW5nX2Nvc3QiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJzaGlwcGluZ19jb3N0In0sImNvbW1lbnQiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJjb21tZW50In0sInRheF90b3RhbCI6eyJzdGF0dXMiOiIwIiwiY2FwdGlvbiI6InRheF90b3RhbCJ9LCJjb3Vwb25fdGl0bGUiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJjb3Vwb25fdGl0bGUifSwiY291cG9uX3RvdGFsIjp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoiY291cG9uX3RvdGFsIn0sInZvdWNoZXJfdGl0bGUiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJ2b3VjaGVyX3RpdGxlIn0sInZvdWNoZXJfdG90YWwiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJ2b3VjaGVyX3RvdGFsIn0sInRvdGFsIjp7InN0YXR1cyI6IjEiLCJjYXB0aW9uIjoidG90YWwifSwib3JkZXJfc3RhdHVzIjp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoib3JkZXJfc3RhdHVzIn0sIm9yZGVyX3N0YXR1c19pZCI6eyJzdGF0dXMiOiIwIiwiY2FwdGlvbiI6Im9yZGVyX3N0YXR1c19pZCJ9LCJhZmZpbGlhdGVfaWQiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJhZmZpbGlhdGVfaWQifSwiY29tbWlzc2lvbiI6eyJzdGF0dXMiOiIwIiwiY2FwdGlvbiI6ImNvbW1pc3Npb24ifSwiY3VycmVuY3lfY29kZSI6eyJzdGF0dXMiOiIwIiwiY2FwdGlvbiI6ImN1cnJlbmN5X2NvZGUifSwiaXAiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJpcCJ9LCJkYXRlX2FkZGVkIjp7InN0YXR1cyI6IjEiLCJjYXB0aW9uIjoiZGF0ZV9hZGRlZCJ9LCJkYXRlX21vZGlmaWVkIjp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoiZGF0ZV9tb2RpZmllZCJ9LCJwcm9kdWN0X2lkIjp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoicHJvZHVjdF9pZCJ9LCJwcm9kdWN0X3RvdGFsX3F1YW50aXR5Ijp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoicHJvZHVjdF90b3RhbF9xdWFudGl0eSJ9LCJwcm9kdWN0X25hbWUiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJwcm9kdWN0X25hbWUifSwicHJvZHVjdF9vcHRpb25zIjp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoicHJvZHVjdF9vcHRpb25zIn0sInByb2R1Y3RfbW9kZWwiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJwcm9kdWN0X21vZGVsIn0sInByb2R1Y3Rfc2t1Ijp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoicHJvZHVjdF9za3UifSwicHJvZHVjdF9lYW4iOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJwcm9kdWN0X2VhbiJ9LCJwcm9kdWN0X2phbiI6eyJzdGF0dXMiOiIwIiwiY2FwdGlvbiI6InByb2R1Y3RfamFuIn0sInByb2R1Y3RfaXNibiI6eyJzdGF0dXMiOiIwIiwiY2FwdGlvbiI6InByb2R1Y3RfaXNibiJ9LCJwcm9kdWN0X21wbiI6eyJzdGF0dXMiOiIwIiwiY2FwdGlvbiI6InByb2R1Y3RfbXBuIn0sInByb2R1Y3RfdXBjIjp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoicHJvZHVjdF91cGMifSwicHJvZHVjdF9sb2NhdGlvbiI6eyJzdGF0dXMiOiIwIiwiY2FwdGlvbiI6InByb2R1Y3RfbG9jYXRpb24ifSwicHJvZHVjdF93ZWlnaHQiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJwcm9kdWN0X3dlaWdodCJ9LCJwcm9kdWN0X2F0dHJpYnV0ZXMiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJwcm9kdWN0X2F0dHJpYnV0ZXMifSwicHJvZHVjdF9tYW51ZmFjdHVyZXIiOnsic3RhdHVzIjoiMCIsImNhcHRpb24iOiJwcm9kdWN0X21hbnVmYWN0dXJlciJ9LCJwcm9kdWN0X3F1YW50aXR5Ijp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoicHJvZHVjdF9xdWFudGl0eSJ9LCJwcm9kdWN0X3ByaWNlIjp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoicHJvZHVjdF9wcmljZSJ9LCJwcm9kdWN0X3RvdGFsIjp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoicHJvZHVjdF90b3RhbCJ9LCJwcm9kdWN0X3RheCI6eyJzdGF0dXMiOiIwIiwiY2FwdGlvbiI6InByb2R1Y3RfdGF4In0sInByb2R1Y3RfcmV3YXJkIjp7InN0YXR1cyI6IjAiLCJjYXB0aW9uIjoicHJvZHVjdF9yZXdhcmQifX19fQ==', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_currency`
--

CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol_left` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol_right` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_place` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Рубль', 'RUB', '', ' ₽', '0', 1.00000000, 1, '2025-12-22 11:52:46'),
(2, 'US Dollar', 'USD', '$', '', '2', 0.01238820, 1, '2025-12-22 11:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer`
--

CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart` text COLLATE utf8mb4_unicode_ci,
  `wishlist` text COLLATE utf8mb4_unicode_ci,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_activity`
--

CREATE TABLE `oc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_affiliate`
--

CREATE TABLE `oc_customer_affiliate` (
  `customer_id` int(11) NOT NULL,
  `company` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tracking` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cheque` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypal` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_branch_number` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_swift_code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_account_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_account_number` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_field` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_approval`
--

CREATE TABLE `oc_customer_approval` (
  `customer_approval_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `type` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group`
--

CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group_description`
--

CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'По-умолчанию', 'test'),
(1, 2, 'Default', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_history`
--

CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ip`
--

CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_login`
--

CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_customer_login`
--

INSERT INTO `oc_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(2, '', '79.126.71.216', 1, '2022-07-20 16:15:22', '2022-07-20 16:15:22'),
(9, '', '89.178.93.120', 1, '2022-08-05 18:09:42', '2022-08-05 18:09:42'),
(23, 'kris@krfex.ru', '212.102.39.196', 1, '2022-11-04 11:04:51', '2022-11-04 11:04:51'),
(20, 'donotstoptry@gmail.com', '89.178.93.120', 2, '2022-10-24 18:44:46', '2022-10-24 18:44:46'),
(24, 'daniel@ocean.ru', '212.102.39.196', 1, '2022-11-04 11:05:03', '2022-11-04 11:05:03'),
(31, 'sokovnin1988@mail.ru', '88.147.173.223', 1, '2022-12-30 16:38:44', '2022-12-30 16:38:44'),
(29, 'soev', '88.147.184.145', 1, '2022-11-15 10:29:59', '2022-11-15 10:29:59'),
(30, '', '176.59.119.178', 1, '2022-11-25 16:30:28', '2022-11-25 16:30:28'),
(32, 'sokovnin1988@mail.ru', '88.147.179.183', 1, '2023-02-21 15:58:23', '2023-02-21 15:58:23'),
(33, 'sokovnin1988@mail.ru', '88.147.174.227', 1, '2023-03-18 16:03:03', '2023-03-18 16:03:03'),
(34, 'jambot@mambetov.ru', '172.16.238.1', 3, '2024-01-22 11:32:52', '2024-03-10 13:43:06'),
(46, 'tinkov@exopencart.ru', '172.16.238.1', 2, '2025-12-21 20:12:29', '2025-12-22 16:13:57'),
(42, '', '172.16.238.1', 7, '2025-12-17 20:31:32', '2025-12-17 20:37:57');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_online`
--

CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_reward`
--

CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_search`
--

CREATE TABLE `oc_customer_search` (
  `customer_search_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_transaction`
--

CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_wishlist`
--

CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_customer_wishlist`
--

INSERT INTO `oc_customer_wishlist` (`customer_id`, `product_id`, `date_added`) VALUES
(42, 40, '2022-10-21 20:15:58'),
(50, 46, '2022-10-30 15:43:27'),
(42, 42, '2022-10-22 12:08:35'),
(1, 40, '2022-08-27 05:24:14');

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field`
--

CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_customer_group`
--

CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_description`
--

CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value`
--

CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value_description`
--

CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download`
--

CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL,
  `filename` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mask` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_download`
--

INSERT INTO `oc_download` (`download_id`, `filename`, `mask`, `date_added`) VALUES
(4, 'newsfile.pdf.UB6W9Sh1NZUBXG2J89iOfcLSfs0zfPoX', 'newsfile.pdf', '2024-01-29 17:09:27');

-- --------------------------------------------------------

--
-- Table structure for table `oc_download_description`
--

CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_download_description`
--

INSERT INTO `oc_download_description` (`download_id`, `language_id`, `name`) VALUES
(4, 1, 'PDF файл для новости'),
(4, 2, 'PDF file for news');

-- --------------------------------------------------------

--
-- Table structure for table `oc_event`
--

CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trigger` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(1, 'activity_customer_add', 'catalog/model/account/customer/addCustomer/after', 'event/activity/addCustomer', 1, 0),
(2, 'activity_customer_edit', 'catalog/model/account/customer/editCustomer/after', 'event/activity/editCustomer', 1, 0),
(3, 'activity_customer_password', 'catalog/model/account/customer/editPassword/after', 'event/activity/editPassword', 1, 0),
(4, 'activity_customer_forgotten', 'catalog/model/account/customer/editCode/after', 'event/activity/forgotten', 1, 0),
(5, 'activity_transaction', 'catalog/model/account/customer/addTransaction/after', 'event/activity/addTransaction', 1, 0),
(6, 'activity_customer_login', 'catalog/model/account/customer/deleteLoginAttempts/after', 'event/activity/login', 1, 0),
(7, 'activity_address_add', 'catalog/model/account/address/addAddress/after', 'event/activity/addAddress', 1, 0),
(8, 'activity_address_edit', 'catalog/model/account/address/editAddress/after', 'event/activity/editAddress', 1, 0),
(9, 'activity_address_delete', 'catalog/model/account/address/deleteAddress/after', 'event/activity/deleteAddress', 1, 0),
(10, 'activity_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'event/activity/addAffiliate', 1, 0),
(11, 'activity_affiliate_edit', 'catalog/model/account/customer/editAffiliate/after', 'event/activity/editAffiliate', 1, 0),
(12, 'activity_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'event/activity/addOrderHistory', 1, 0),
(13, 'activity_return_add', 'catalog/model/account/return/addReturn/after', 'event/activity/addReturn', 1, 0),
(14, 'mail_transaction', 'catalog/model/account/customer/addTransaction/after', 'mail/transaction', 1, 0),
(15, 'mail_forgotten', 'catalog/model/account/customer/editCode/after', 'mail/forgotten', 1, 0),
(16, 'mail_customer_add', 'catalog/model/account/customer/addCustomer/after', 'mail/register', 1, 0),
(17, 'mail_customer_alert', 'catalog/model/account/customer/addCustomer/after', 'mail/register/alert', 1, 0),
(18, 'mail_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate', 1, 0),
(19, 'mail_affiliate_alert', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate/alert', 1, 0),
(20, 'mail_voucher', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/total/voucher/send', 1, 0),
(21, 'mail_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order', 1, 0),
(22, 'mail_order_alert', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order/alert', 1, 0),
(23, 'statistics_review_add', 'catalog/model/catalog/review/addReview/after', 'event/statistics/addReview', 1, 0),
(24, 'statistics_return_add', 'catalog/model/account/return/addReturn/after', 'event/statistics/addReturn', 1, 0),
(25, 'statistics_order_history', 'catalog/model/checkout/order/addOrderHistory/after', 'event/statistics/addOrderHistory', 1, 0),
(26, 'admin_mail_affiliate_approve', 'admin/model/customer/customer_approval/approveAffiliate/after', 'mail/affiliate/approve', 1, 0),
(27, 'admin_mail_affiliate_deny', 'admin/model/customer/customer_approval/denyAffiliate/after', 'mail/affiliate/deny', 1, 0),
(28, 'admin_mail_customer_approve', 'admin/model/customer/customer_approval/approveCustomer/after', 'mail/customer/approve', 1, 0),
(29, 'admin_mail_customer_deny', 'admin/model/customer/customer_approval/denyCustomer/after', 'mail/customer/deny', 1, 0),
(30, 'admin_mail_reward', 'admin/model/customer/customer/addReward/after', 'mail/reward', 1, 0),
(31, 'admin_mail_transaction', 'admin/model/customer/customer/addTransaction/after', 'mail/transaction', 1, 0),
(32, 'admin_mail_return', 'admin/model/sale/return/addReturnHistory/after', 'mail/return', 1, 0),
(33, 'admin_mail_forgotten', 'admin/model/user/user/editCode/after', 'mail/forgotten', 1, 0),
(34, 'advertise_google', 'admin/model/catalog/product/deleteProduct/after', 'extension/advertise/google/deleteProduct', 1, 0),
(35, 'advertise_google', 'admin/model/catalog/product/copyProduct/after', 'extension/advertise/google/copyProduct', 1, 0),
(36, 'advertise_google', 'admin/view/common/column_left/before', 'extension/advertise/google/admin_link', 1, 0),
(37, 'advertise_google', 'admin/model/catalog/product/addProduct/after', 'extension/advertise/google/addProduct', 1, 0),
(38, 'advertise_google', 'catalog/controller/checkout/success/before', 'extension/advertise/google/before_checkout_success', 1, 0),
(39, 'advertise_google', 'catalog/view/common/header/after', 'extension/advertise/google/google_global_site_tag', 1, 0),
(40, 'advertise_google', 'catalog/view/common/success/after', 'extension/advertise/google/google_dynamic_remarketing_purchase', 1, 0),
(41, 'advertise_google', 'catalog/view/product/product/after', 'extension/advertise/google/google_dynamic_remarketing_product', 1, 0),
(42, 'advertise_google', 'catalog/view/product/search/after', 'extension/advertise/google/google_dynamic_remarketing_searchresults', 1, 0),
(43, 'advertise_google', 'catalog/view/product/category/after', 'extension/advertise/google/google_dynamic_remarketing_category', 1, 0),
(44, 'advertise_google', 'catalog/view/common/home/after', 'extension/advertise/google/google_dynamic_remarketing_home', 1, 0),
(45, 'advertise_google', 'catalog/view/checkout/cart/after', 'extension/advertise/google/google_dynamic_remarketing_cart', 1, 0),
(46, 'unisender_subscribe', 'catalog/model/account/customer/addCustomer/after', 'extension/feed/unisender/subscribe_customer', 0, 0),
(47, 'unisender_update', 'catalog/model/account/customer/editNewsletter/after', 'extension/feed/unisender/update', 0, 0),
(48, 'unisender_guest', 'catalog/model/checkout/order/addOrderHistory/before', 'extension/feed/unisender/subscribe_guest', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension`
--

CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(88, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(57, 'payment', 'bank_transfer'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'theme', 'default'),
(21, 'dashboard', 'activity'),
(22, 'dashboard', 'sale'),
(23, 'dashboard', 'recent'),
(24, 'dashboard', 'order'),
(25, 'dashboard', 'online'),
(26, 'dashboard', 'map'),
(27, 'dashboard', 'customer'),
(28, 'dashboard', 'chart'),
(29, 'report', 'sale_coupon'),
(31, 'report', 'customer_search'),
(32, 'report', 'customer_transaction'),
(33, 'report', 'product_purchased'),
(34, 'report', 'product_viewed'),
(35, 'report', 'sale_return'),
(36, 'report', 'sale_order'),
(37, 'report', 'sale_shipping'),
(38, 'report', 'sale_tax'),
(39, 'report', 'customer_activity'),
(40, 'report', 'customer_order'),
(41, 'report', 'customer_reward'),
(42, 'advertise', 'google'),
(43, 'module', 'blog_latest'),
(44, 'module', 'blog_featured'),
(45, 'module', 'blog_category'),
(48, 'currency', 'cbr'),
(49, 'currency', 'ecb'),
(50, 'currency', 'nbu'),
(98, 'module', 'anycategories'),
(103, 'shipping', 'free'),
(55, 'shipping', 'pickup'),
(100, 'captcha', 'google'),
(59, 'module', 'html'),
(91, 'menu', 'default'),
(62, 'module', 'latest'),
(65, 'module', 'special'),
(66, 'module', 'bestseller'),
(68, 'module', 'filter'),
(80, 'module', 'information'),
(79, 'module', 'store'),
(75, 'feed', 'google_base'),
(93, 'module', 'extheme'),
(94, 'module', 'privacy'),
(101, 'module', 'exbot');

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension_install`
--

CREATE TABLE `oc_extension_install` (
  `extension_install_id` int(11) NOT NULL,
  `extension_download_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension_path`
--

CREATE TABLE `oc_extension_path` (
  `extension_path_id` int(11) NOT NULL,
  `extension_install_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter`
--

CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_filter`
--

INSERT INTO `oc_filter` (`filter_id`, `filter_group_id`, `sort_order`) VALUES
(4, 1, 4),
(3, 1, 3),
(2, 1, 2),
(1, 1, 1),
(7, 2, 3),
(6, 2, 2),
(5, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_description`
--

CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_filter_description`
--

INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES
(3, 2, 1, 'Green'),
(3, 1, 1, 'Зелёный'),
(2, 2, 1, 'Red'),
(6, 2, 2, 'Middleprice'),
(6, 1, 2, 'Середнячок'),
(5, 2, 2, 'Cheap'),
(5, 1, 2, 'Недорогие'),
(2, 1, 1, 'Красный'),
(7, 1, 2, 'Дорогие'),
(7, 2, 2, 'Expencive'),
(1, 2, 1, 'White'),
(1, 1, 1, 'Белый'),
(4, 1, 1, 'Синий'),
(4, 2, 1, 'Blue');

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group`
--

CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_filter_group`
--

INSERT INTO `oc_filter_group` (`filter_group_id`, `sort_order`) VALUES
(1, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group_description`
--

CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_filter_group_description`
--

INSERT INTO `oc_filter_group_description` (`filter_group_id`, `language_id`, `name`) VALUES
(1, 2, 'Color'),
(2, 1, 'Цена'),
(2, 2, 'Price'),
(1, 1, 'Цвет');

-- --------------------------------------------------------

--
-- Table structure for table `oc_fraudlabspro`
--

CREATE TABLE `oc_fraudlabspro` (
  `order_id` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_country_match` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_high_risk_country` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance_in_km` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance_in_mile` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_country` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_continent` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_region` varchar(21) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_city` varchar(21) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_latitude` varchar(21) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_longitude` varchar(21) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_timezone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_elevation` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_domain` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_mobile_mnc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_mobile_mcc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_mobile_brand` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_netspeed` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_isp_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_usage_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_free_email` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_new_domain_name` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_proxy_ip_address` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bin_found` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bin_country_match` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bin_name_match` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bin_phone_match` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bin_prepaid` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_address_ship_forward` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bill_ship_city_match` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bill_ship_state_match` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bill_ship_country_match` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bill_ship_postal_match` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_ip_blacklist` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_email_blacklist` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_credit_card_blacklist` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_device_blacklist` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user_blacklist` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fraudlabspro_score` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fraudlabspro_distribution` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fraudlabspro_status` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fraudlabspro_id` char(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fraudlabspro_error` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fraudlabspro_message` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fraudlabspro_credits` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_geo_zone`
--

CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_added`, `date_modified`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2009-01-06 23:26:25', '2010-02-26 22:33:24');

-- --------------------------------------------------------

--
-- Table structure for table `oc_googleshopping_category`
--

CREATE TABLE `oc_googleshopping_category` (
  `google_product_category` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_googleshopping_product`
--

CREATE TABLE `oc_googleshopping_product` (
  `product_advertise_google_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `has_issues` tinyint(1) DEFAULT NULL,
  `destination_status` enum('pending','approved','disapproved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `impressions` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `conversions` int(11) NOT NULL DEFAULT '0',
  `cost` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `conversion_value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `google_product_category` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition` enum('new','refurbished','used') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adult` tinyint(1) DEFAULT NULL,
  `multipack` int(11) DEFAULT NULL,
  `is_bundle` tinyint(1) DEFAULT NULL,
  `age_group` enum('newborn','infant','toddler','kids','adult') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` int(11) DEFAULT NULL,
  `gender` enum('male','female','unisex') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_type` enum('regular','petite','plus','big and tall','maternity') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_system` enum('AU','BR','CN','DE','EU','FR','IT','JP','MEX','UK','US') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `is_modified` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_googleshopping_product`
--

INSERT INTO `oc_googleshopping_product` (`product_advertise_google_id`, `product_id`, `store_id`, `has_issues`, `destination_status`, `impressions`, `clicks`, `conversions`, `cost`, `conversion_value`, `google_product_category`, `condition`, `adult`, `multipack`, `is_bundle`, `age_group`, `color`, `gender`, `size_type`, `size_system`, `size`, `is_modified`) VALUES
(2, 1, 0, NULL, 'pending', 0, 0, 0, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 2, 0, NULL, 'pending', 0, 0, 0, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_googleshopping_product_status`
--

CREATE TABLE `oc_googleshopping_product_status` (
  `product_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `product_variation_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `destination_statuses` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_quality_issues` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_level_issues` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_expiration_date` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_googleshopping_product_target`
--

CREATE TABLE `oc_googleshopping_product_target` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `advertise_google_target_id` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_googleshopping_target`
--

CREATE TABLE `oc_googleshopping_target` (
  `advertise_google_target_id` int(11) UNSIGNED NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `campaign_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `budget` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `feeds` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('paused','active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'paused',
  `date_added` date DEFAULT NULL,
  `roas` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_google_base_category`
--

CREATE TABLE `oc_google_base_category` (
  `google_base_category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_google_base_category_to_category`
--

CREATE TABLE `oc_google_base_category_to_category` (
  `google_base_category_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_information`
--

CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL,
  `top` int(1) NOT NULL DEFAULT '0',
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `noindex` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `top`, `bottom`, `sort_order`, `status`, `noindex`) VALUES
(9, 0, 0, 0, 1, 1),
(13, 1, 1, 4, 1, 1),
(10, 0, 0, 2, 1, 1),
(12, 1, 1, 3, 1, 1),
(11, 0, 1, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_description`
--

CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_h1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`, `meta_h1`) VALUES
(11, 1, 'Условия возврата', '&lt;p&gt;Понимаю, тема неприятная, но придется проглотить горькую пилюлю, порой клиенты хотят вернуть товар, так что вы сможете похвастаться тем, что у вас на сайте есть автоматизированная система возврата товаров с историей статусов и удобным интерфейсом, как для клиентов, так и для менеджеров. Не благодарите.&lt;/p&gt;', '', '', '', ''),
(9, 2, 'Terms and conditions', '&lt;p&gt;In a good way, the legal aspects of the interaction of your customers with you through the functionality of this site should be indicated here, but in general you are free to write anything here, so go ahead.&lt;br&gt;&lt;/p&gt;', '', '', '', ''),
(10, 1, 'Правила партнерства', 'Поскольку платформа из коробки имеет базовый функционал партнерских вознаграждений за размещение ссылок на отдельные товары/услуги или весь сайт, здесь есть смысл обозначить условия партнерства с вами. С условиями этой статьи будет необходимо согласиться при регистрации партерского аккаунта.', '', '', '', ''),
(9, 1, 'Правила и условия', 'По-хорошему здесь должны быть обозначены юричидеские аспекты взаимодействия ваших клиентов с вами посредством функционала данного сайта, но вообще вы вольны написать здесь что угодно, так что дерзайте.', '', '', '', ''),
(10, 2, 'Partnership rules', '&lt;p&gt;Since the platform out of the box has the basic functionality of affiliate rewards for posting links to individual products / services or the entire site, it makes sense here to indicate the terms of partnership with you. Your customers will need to agree to the terms of this article when registering an affiliate account.&lt;br&gt;&lt;/p&gt;', '', '', '', ''),
(11, 2, 'Return conditions', '&lt;p&gt;I understand that the topic is unpleasant, but you have to swallow a bitter pill, sometimes customers want to return the goods, so you can brag that you have an automated system for returning goods on your site with a history of statuses and a convenient interface, both for customers and managers. Don\'t thank.&lt;br&gt;&lt;/p&gt;', '', '', '', ''),
(12, 2, 'Payment', '&lt;p&gt;Once you\'ve decided to sell something online, it\'s a good idea to inform potential customers about how to pay for your products and services. The text of this article is just intended for the purposes of this information. There can be not only just text, but formatted text, headings, subheadings, columns, lists, images, videos, whatever your heart desires, because here is arbitrary HTML.&lt;br&gt;&lt;/p&gt;', '', '', '', ''),
(13, 2, 'Delivery', '&lt;p&gt;If you\'re selling physical products, chances are you\'re shipping your products to your customers, right? It was a rhetorical question. Here you can (and actually need to) talk about the conditions and methods of delivery, your customers will thank you.&lt;br&gt;&lt;/p&gt;', '', '', '', ''),
(13, 1, 'Доставка', 'Если вы продаете физические товары, скорее всего вы осуществляете доставка ваших товаров до ваших же покупателей, верно? Это был риторический вопрос. Тут можно (а вообще-то нужно) рассказать об условиях и способах доставки, ваши клиенты скажут вам спасибо.', '', '', '', ''),
(12, 1, 'Оплата', '&lt;p&gt;Раз уже вы решили продовать что-то онлайн, неплохой идеей будет проинформировать потенциальных клиентов о способах оплаты ваших товаров и услуг. Текст этой статьи как раз предназначен для целей этого информирования. Здесь может быть не только просто текст, а форматированный текст, заголовки, подзаголовки, колонки, списки, изображения, видео, что душе угодно, ибо тут произвольный HTML.&lt;/p&gt;', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_layout`
--

CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_information_to_layout`
--

INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(12, 0, 0),
(13, 0, 0),
(11, 0, 0),
(9, 0, 0),
(10, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_store`
--

CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_language`
--

CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `directory` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'RU ', 'ru-ru', 'ru_RU.UTF-8,ru_RU,russian', 'gb.png', 'english', 1, 1),
(2, 'EN ', 'en-gb', 'en-US,en_US.UTF-8,en_US,en-gb,english', '', '', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout`
--

CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Главная'),
(2, 'Товар'),
(3, 'Категория'),
(4, 'По-умолчанию'),
(5, 'Список Производителей'),
(6, 'Аккаунт'),
(7, 'Оформление заказа'),
(8, 'Контакты'),
(9, 'Карта сайта'),
(10, 'Партнерская программа'),
(11, 'Информация'),
(12, 'Сравнение'),
(13, 'Поиск'),
(14, 'Блог'),
(15, 'Категории Блога'),
(16, 'Статьи Блога'),
(17, 'Страница Производителя'),
(18, 'Новый товар'),
(19, 'Акции'),
(21, 'Login'),
(22, 'Register');

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_module`
--

CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(330, 1, 'bestseller.39', 'content_top', 7),
(331, 1, 'blog_latest.32', 'content_top', 8),
(248, 6, 'account', 'column_right', 0),
(281, 3, 'blog_featured.33', 'content_bottom', 0),
(332, 1, 'blog_featured.33', 'content_top', 9),
(329, 1, 'featured.28', 'content_top', 6),
(280, 3, 'filter', 'column_left', 0),
(328, 1, 'latest.37', 'content_top', 5),
(327, 1, 'special.38', 'content_top', 4),
(326, 1, 'html.41', 'content_top', 3),
(325, 1, 'anycategories.42', 'content_top', 2),
(324, 1, 'slideshow.27', 'content_top', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_route`
--

CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(169, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(213, 3, 0, 'product/category'),
(222, 2, 0, 'product/product'),
(249, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(223, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search'),
(225, 14, 0, 'blog/latest'),
(226, 15, 0, 'blog/category'),
(227, 16, 0, 'blog/article'),
(79, 17, 0, 'product/manufacturer/info'),
(97, 18, 0, 'product/product'),
(254, 1, 0, 'common/home'),
(171, 19, 0, 'product/special'),
(251, 22, 0, 'account/register'),
(250, 21, 0, 'account/login');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class`
--

CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class_description`
--

CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Сантиметр', 'см'),
(1, 2, 'Centimeter', 'cm'),
(2, 1, 'Миллиметр', 'мм'),
(2, 2, 'Millimeter', 'mm'),
(3, 1, 'Дюйм', 'in'),
(3, 2, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `oc_location`
--

CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `geocode` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_location`
--

INSERT INTO `oc_location` (`location_id`, `name`, `address`, `telephone`, `fax`, `geocode`, `image`, `open`, `comment`) VALUES
(1, 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '+7 987 654 32 10', '', '', '', '09:00 - 21:00', ''),
(2, 'Магазин на Соборной', 'г. Саратов ул. Соборная 46', '+ 7987 654 32 10', '', '', '', '10:00 - 20:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer`
--

CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  `noindex` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`, `noindex`) VALUES
(1, 'Apple', 'catalog/demo/manufacturers/apple.png', 1, 1),
(2, 'Samsung', 'catalog/demo/manufacturers/samsung.jpg', 1, 1),
(3, 'DJI', 'catalog/demo/manufacturers/dji.png', 1, 1),
(4, 'Philips', 'catalog/demo/manufacturers/philips.png', 1, 1),
(5, 'MSI', 'catalog/demo/manufacturers/msi.png', 1, 1),
(6, 'DeLonghi', 'catalog/demo/manufacturers/delonge.gif', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer_description`
--

CREATE TABLE `oc_manufacturer_description` (
  `manufacturer_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description3` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_h1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_manufacturer_description`
--

INSERT INTO `oc_manufacturer_description` (`manufacturer_id`, `language_id`, `description`, `description3`, `meta_description`, `meta_keyword`, `meta_title`, `meta_h1`) VALUES
(1, 2, '&lt;p&gt;This description is for the manufacturer. If you dream about high-quality SEO, then it makes sense to write a couple of lines so that search engines do not feel offended.&lt;/p&gt;', '', '', '', '', 'Apple'),
(1, 1, '&lt;p&gt;Это описание для производителя. Если грезите о качественном SEO, тогде есть смысл написать пару строк, чтобы поисковикам не было обидно.&lt;br&gt;&lt;/p&gt;', '', '', '', '', 'Apple'),
(2, 1, '&lt;p&gt;Это описание для производителя. Если грезите о качественном SEO, тогде есть смысл написать пару строк, чтобы поисковикам не было обидно.&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(3, 1, '&lt;p&gt;Это описание для производителя. Если грезите о качественном SEO, тогде есть смысл написать пару строк, чтобы поисковикам не было обидно.&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(4, 1, '&lt;p&gt;Это описание для производителя. Если грезите о качественном SEO, тогде есть смысл написать пару строк, чтобы поисковикам не было обидно.&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(5, 1, '&lt;p&gt;Это описание для производителя. Если грезите о качественном SEO, тогде есть смысл написать пару строк, чтобы поисковикам не было обидно.&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(6, 1, '&lt;p&gt;Это описание для производителя. Если грезите о качественном SEO, тогде есть смысл написать пару строк, чтобы поисковикам не было обидно.&lt;br&gt;&lt;/p&gt;', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer_to_layout`
--

CREATE TABLE `oc_manufacturer_to_layout` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_manufacturer_to_layout`
--

INSERT INTO `oc_manufacturer_to_layout` (`manufacturer_id`, `store_id`, `layout_id`) VALUES
(1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer_to_store`
--

CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_marketing`
--

CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_modification`
--

CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL,
  `extension_install_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xml` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_modification_backup`
--

CREATE TABLE `oc_modification_backup` (
  `backup_id` int(11) NOT NULL,
  `modification_id` int(11) NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xml` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_module`
--

CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `setting` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(29, 'Производители на главной', 'carousel', '{\"name\":\"\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u0438 \\u043d\\u0430 \\u0433\\u043b\\u0430\\u0432\\u043d\\u043e\\u0439\",\"banner_id\":\"8\",\"desktop_items\":\"6\",\"tablet_items\":\"4\",\"mobile_items\":\"2\",\"width\":\"120\",\"height\":\"120\",\"status\":\"1\"}'),
(28, 'На главной ', 'featured', '{\"name\":\"\\u041d\\u0430 \\u0433\\u043b\\u0430\\u0432\\u043d\\u043e\\u0439 \",\"text\":{\"1\":{\"heading\":\"\\u0421\\u043c\\u0435\\u043b\\u043e \\u0440\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0443\\u0435\\u043c\"},\"2\":{\"heading\":\"We recommend \"}},\"product_name\":\"\",\"product\":[\"43\",\"42\",\"30\",\"45\"],\"limit\":\"4\",\"width\":\"480\",\"height\":\"360\",\"status\":\"1\"}'),
(27, 'Слайдер на главной', 'slideshow', '{\"apply\":\"1\",\"name\":\"\\u0421\\u043b\\u0430\\u0439\\u0434\\u0435\\u0440 \\u043d\\u0430 \\u0433\\u043b\\u0430\\u0432\\u043d\\u043e\\u0439\",\"banner_id\":\"7\",\"width\":\"1344\",\"height\":\"756\",\"status\":\"1\"}'),
(32, 'Свежие новости', 'blog_latest', '{\"name\":\"\\u0421\\u0432\\u0435\\u0436\\u0438\\u0435 \\u043d\\u043e\\u0432\\u043e\\u0441\\u0442\\u0438\",\"text\":{\"1\":{\"heading\":\"\\u0421\\u0432\\u0435\\u0436\\u0438\\u0435 \\u043d\\u043e\\u0432\\u043e\\u0441\\u0442\\u0438\"},\"2\":{\"heading\":\"Fresh news\"}},\"limit\":\"3\",\"width\":\"450\",\"height\":\"300\",\"status\":\"1\"}'),
(33, 'Рекомендуемые статьи', 'blog_featured', '{\"apply\":\"1\",\"name\":\"\\u0420\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0443\\u0435\\u043c\\u044b\\u0435 \\u0441\\u0442\\u0430\\u0442\\u044c\\u0438\",\"text\":{\"1\":{\"heading\":\"\\u0418\\u043d\\u0442\\u0435\\u0440\\u0435\\u0441\\u043d\\u043e \\u043f\\u043e\\u0447\\u0438\\u0442\\u0430\\u0442\\u044c\"},\"2\":{\"heading\":\"Interesting to read\"}},\"article_name\":\"\",\"article\":[\"126\",\"127\",\"128\"],\"limit\":\"4\",\"width\":\"450\",\"height\":\"300\",\"status\":\"1\"}'),
(42, 'Каталог на главной', 'anycategories', '{\"apply\":\"1\",\"name\":\"\\u041a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433 \\u043d\\u0430 \\u0433\\u043b\\u0430\\u0432\\u043d\\u043e\\u0439\",\"text\":{\"1\":{\"heading\":\"\\u041a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433\"},\"2\":{\"heading\":\"Catalog\"}},\"category_name\":\"\",\"category\":[\"1\",\"7\",\"13\",\"19\",\"30\",\"36\",\"42\",\"25\"],\"limit\":\"8\",\"width\":\"280\",\"height\":\"140\",\"status\":\"1\"}'),
(37, 'Новинки', 'latest', '{\"name\":\"\\u041d\\u043e\\u0432\\u0438\\u043d\\u043a\\u0438\",\"text\":{\"1\":{\"heading\":\"\\u041d\\u043e\\u0432\\u044b\\u0435 \\u043f\\u043e\\u0441\\u0442\\u0443\\u043f\\u043b\\u0435\\u043d\\u0438\\u044f\"},\"2\":{\"heading\":\"New products\"}},\"limit\":\"8\",\"width\":\"480\",\"height\":\"360\",\"status\":\"1\"}'),
(38, 'Акции', 'special', '{\"name\":\"\\u0410\\u043a\\u0446\\u0438\\u0438\",\"text\":{\"1\":{\"heading\":\"\\u041b\\u0443\\u0447\\u0448\\u0438\\u0435 \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f\"},\"2\":{\"heading\":\"Best offers\"}},\"limit\":\"8\",\"width\":\"480\",\"height\":\"360\",\"status\":\"1\"}'),
(39, 'Хиты продаж', 'bestseller', '{\"name\":\"\\u0425\\u0438\\u0442\\u044b \\u043f\\u0440\\u043e\\u0434\\u0430\\u0436\",\"text\":{\"1\":{\"heading\":\"\\u041a\\u0430\\u043a \\u0433\\u043e\\u0440\\u044f\\u0447\\u0438\\u0435 \\u043f\\u0438\\u0440\\u043e\\u0436\\u043a\\u0438\"},\"2\":{\"heading\":\"Lika a hot cakes\"}},\"limit\":\"8\",\"width\":\"480\",\"height\":\"360\",\"status\":\"1\"}'),
(40, 'Баннеры', 'slideshow', '{\"name\":\"\\u0411\\u0430\\u043d\\u043d\\u0435\\u0440\\u044b\",\"banner_id\":\"6\",\"width\":\"400\",\"height\":\"600\",\"status\":\"1\"}'),
(41, 'Home page marketing', 'html', '{\"apply\":\"1\",\"name\":\"Home page marketing\",\"module_description\":{\"1\":{\"description\":\"&lt;div class=&quot;py-6 has-background-white&quot;&gt;\\r\\n  &lt;div class=&quot;container&quot;&gt;\\r\\n    &lt;div class=&quot;columns is-mobile is-multiline&quot;&gt;\\r\\n      &lt;div class=&quot;column is-12&quot;&gt;\\r\\n        &lt;div class=&quot;title is-2 has-text-centered mb-6&quot;&gt;\\u041d\\u0435\\u043c\\u043d\\u043e\\u0433\\u043e \\u043c\\u0430\\u0440\\u043a\\u0435\\u0442\\u0438\\u043d\\u0433\\u0430&lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n      &lt;div class=&quot;column is-4-fullhd is-4-widescreen is-4-desktop is-6-tablet is-12-mobile&quot;&gt;\\r\\n        &lt;div class=&quot;box&quot;&gt;\\r\\n          &lt;div class=&quot;block is-flex is-align-items-center&quot;&gt;\\r\\n            &lt;span class=&quot;icon is-large has-text-primary&quot;&gt;\\r\\n              &lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; fill=&quot;none&quot; viewBox=&quot;-0.5 -0.5 16 16&quot; stroke-linecap=&quot;round&quot;\\r\\n                stroke-linejoin=&quot;round&quot; stroke=&quot;currentColor&quot; height=&quot;100&quot; width=&quot;100&quot;&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;M12.497499999999999 6.6381250000000005V11.875a1.25 1.25 0 0 1 -1.25 1.25H3.7524999999999995a1.25 1.25 0 0 1 -1.2493750000000001 -1.25v-5.2368749999999995M4.68875 5.46875l0.3125 -3.59375m-0.3125 3.59375c0 1.8137500000000002 2.8112500000000002 1.8137500000000002 2.8112500000000002 0m-2.8112500000000002 0c0 1.985 -3.2218750000000003 1.575 -2.770625 -0.155l0.653125 -2.5043749999999996A1.25 1.25 0 0 1 3.7800000000000002 1.875h7.4399999999999995a1.25 1.25 0 0 1 1.20875 0.9343750000000001l0.653125 2.5043749999999996c0.45125 1.730625 -2.770625 2.14 -2.770625 0.155M7.5 5.46875V1.875m0 3.59375c0 1.8137500000000002 2.8112500000000002 1.8137500000000002 2.8112500000000002 0m0 0 -0.3125 -3.59375&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n              &lt;\\/svg&gt;\\r\\n            &lt;\\/span&gt;\\r\\n            &lt;span class=&quot;title is-5 pl-3&quot;&gt;\\r\\n              \\u041f\\u0440\\u043e\\u0441\\u0442\\u043e\\u0439, \\u0443\\u0434\\u043e\\u0431\\u043d\\u044b\\u0439, \\u043e\\u0442\\u043a\\u0440\\u044b\\u0442\\u044b\\u0439\\r\\n            &lt;\\/span&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;div class=&quot;content&quot;&gt;\\r\\n            OpenCart \\u043f\\u0440\\u043e\\u0441\\u0442 \\u0438 \\u0443\\u0434\\u043e\\u0431\\u0435\\u043d \\u043f\\u043e-\\u0443\\u043c\\u043e\\u043b\\u0447\\u0430\\u043d\\u0438\\u044e, \\u0430 \\u0441 \\u043d\\u043e\\u0432\\u044b\\u043c\\u0438 \\u0444\\u0443\\u043d\\u043a\\u0446\\u0438\\u044f\\u043c\\u0438 \\u0443\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435 \\u043e\\u043d\\u043b\\u0430\\u0439\\u043d-\\u0431\\u0438\\u0437\\u043d\\u0435\\u0441\\u043e\\u043c \\u0441\\u0442\\u0430\\u043d\\u043e\\u0432\\u0438\\u0442\\u0441\\u044f \\u043c\\u0430\\u043a\\u0441\\u0438\\u043c\\u0430\\u043b\\u044c\\u043d\\u043e\\r\\n            \\u043a\\u043e\\u043c\\u0444\\u043e\\u0440\\u0442\\u043d\\u044b\\u043c\\r\\n          &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n      &lt;div class=&quot;column is-4-fullhd is-4-widescreen is-4-desktop is-6-tablet is-12-mobile&quot;&gt;\\r\\n        &lt;div class=&quot;box&quot;&gt;\\r\\n          &lt;div class=&quot;block is-flex is-align-items-center&quot;&gt;\\r\\n            &lt;span class=&quot;icon is-large has-text-primary&quot;&gt;\\r\\n              &lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; fill=&quot;none&quot; viewBox=&quot;-0.5 -0.5 16 16&quot; stroke-linecap=&quot;round&quot;\\r\\n                stroke-linejoin=&quot;round&quot; stroke=&quot;currentColor&quot; height=&quot;100&quot; width=&quot;100&quot;&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;M6.5625 7.1875h1.875M12.5 5v6.875a1.25 1.25 0 0 1 -1.25 1.25H3.75a1.25 1.25 0 0 1 -1.25 -1.25V5m10.625 0V3.125a1.25 1.25 0 0 0 -1.25 -1.25H3.125a1.25 1.25 0 0 0 -1.25 1.25v1.875z&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n              &lt;\\/svg&gt;\\r\\n            &lt;\\/span&gt;\\r\\n            &lt;span class=&quot;title is-5 pl-3&quot;&gt;\\r\\n              \\u042e\\u0437\\u0430\\u0431\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0438\\u0437 \\u043a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0438\\r\\n            &lt;\\/span&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;div class=&quot;content&quot;&gt;\\r\\n            \\u0412\\u0441\\u0442\\u0440\\u043e\\u0435\\u043d\\u043d\\u044b\\u0435 \\u043d\\u0443\\u0436\\u043d\\u044b\\u0435 \\u0444\\u0443\\u043d\\u043a\\u0446\\u0438\\u0438 \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0445 \\u043d\\u0435\\u0442 \\u0432 \\u0434\\u0435\\u0444\\u043e\\u043b\\u0442\\u043d\\u043e\\u0439 \\u0432\\u0435\\u0440\\u0441\\u0438\\u0438 OpenCart, \\u0447\\u0442\\u043e\\u0431\\u044b \\u0432\\u044b \\u043c\\u043e\\u0433\\u043b\\u0438 \\u0441\\u0440\\u0430\\u0437\\u0443 \\u043d\\u0430\\u0447\\u0430\\u0442\\u044c \\u043f\\u0440\\u043e\\u0434\\u0430\\u0432\\u0430\\u0442\\u044c\\r\\n          &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n      &lt;div class=&quot;column is-4-fullhd is-4-widescreen is-4-desktop is-6-tablet is-12-mobile&quot;&gt;\\r\\n        &lt;div class=&quot;box&quot;&gt;\\r\\n          &lt;div class=&quot;block is-flex is-align-items-center&quot;&gt;\\r\\n            &lt;span class=&quot;icon is-large has-text-primary&quot;&gt;\\r\\n              &lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; fill=&quot;none&quot; viewBox=&quot;-0.5 -0.5 16 16&quot; stroke-linecap=&quot;round&quot;\\r\\n                stroke-linejoin=&quot;round&quot; stroke=&quot;currentColor&quot; height=&quot;100&quot; width=&quot;100&quot;&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;M5.625 6.25v6.25M12.8125 5.9375h-10.625M1.875 5.875c0 -1.4000000000000001 0 -2.1 0.2725 -2.6350000000000002a2.5 2.5 0 0 1 1.0925 -1.0925C3.775 1.875 4.475 1.875 5.875 1.875h3.25c1.4000000000000001 0 2.1 0 2.6350000000000002 0.2725a2.5 2.5 0 0 1 1.0925 1.0925C13.125 3.775 13.125 4.475 13.125 5.875v3.25c0 1.4000000000000001 0 2.1 -0.2725 2.6350000000000002a2.5 2.5 0 0 1 -1.0925 1.0925C11.225000000000001 13.125 10.525 13.125 9.125 13.125H5.875c-1.4000000000000001 0 -2.1 0 -2.6350000000000002 -0.2725a2.5 2.5 0 0 1 -1.0925 -1.0925C1.875 11.225000000000001 1.875 10.525 1.875 9.125z&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n              &lt;\\/svg&gt;\\r\\n            &lt;\\/span&gt;\\r\\n            &lt;span class=&quot;title is-5 pl-3&quot;&gt;\\r\\n              \\u0421\\u043e\\u0432\\u0440\\u0435\\u043c\\u0435\\u043d\\u043d\\u044b\\u0439 UI\\r\\n            &lt;\\/span&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;div class=&quot;content&quot;&gt;\\r\\n            \\u041d\\u0430 \\u0431\\u043e\\u0440\\u0442\\u0443 \\u043b\\u0435\\u0433\\u043a\\u0438\\u0439 \\u0438 \\u0433\\u0438\\u0431\\u043a\\u0438\\u0439 UI \\u0444\\u0440\\u0435\\u0439\\u043c\\u0432\\u043e\\u0440\\u043a Bulma \\u0441 \\u043f\\u043e\\u0434\\u0434\\u0435\\u0440\\u0436\\u043a\\u043e\\u0439 SASS-\\u043a\\u043e\\u043c\\u043f\\u0438\\u043b\\u044f\\u0446\\u0438\\u0438 \\u0438 \\u043e\\u043f\\u0446\\u0438\\u043e\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439 \\u0442\\u0435\\u043c\\u043d\\u043e\\u0439 \\u0442\\u0435\\u043c\\u044b \\u0434\\u043b\\u044f\\r\\n            \\u0443\\u0434\\u043e\\u0431\\u0441\\u0442\\u0432\\u0430 \\u043a\\u0430\\u0441\\u0442\\u043e\\u043c\\u0438\\u0437\\u0430\\u0446\\u0438\\u0438\\r\\n          &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n      &lt;div class=&quot;column is-4-fullhd is-4-widescreen is-4-desktop is-6-tablet is-12-mobile&quot;&gt;\\r\\n        &lt;div class=&quot;box&quot;&gt;\\r\\n          &lt;div class=&quot;block is-flex is-align-items-center&quot;&gt;\\r\\n            &lt;span class=&quot;icon is-large has-text-primary&quot;&gt;\\r\\n              &lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; fill=&quot;none&quot; viewBox=&quot;-0.5 -0.5 16 16&quot; stroke-linecap=&quot;round&quot;\\r\\n                stroke-linejoin=&quot;round&quot; stroke=&quot;currentColor&quot; height=&quot;100&quot; width=&quot;100&quot;&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;m6.875 6.401250000000001 0.64625 0.738125c0.059375 0.068125 0.16625 0.0625 0.21875 -0.01l1.3125 -1.816875M10.3125 13.125a0.9375 0.9375 0 1 0 0 -1.875 0.9375 0.9375 0 0 0 0 1.875m-5 0a0.9375 0.9375 0 1 0 0 -1.875 0.9375 0.9375 0 0 0 0 1.875&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;M2.31875 3.375h9.508750000000001c0.86125 0 1.4831250000000002 0.79375 1.2468750000000002 1.5925l-1.03375 3.5C11.881250000000001 9.004999999999999 11.3725 9.375 10.79375 9.375H5.07c-0.579375 0 -1.08875 -0.370625 -1.2475 -0.9075zm0 0L1.875 1.875&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n              &lt;\\/svg&gt;\\r\\n            &lt;\\/span&gt;\\r\\n            &lt;span class=&quot;title is-5 pl-3&quot;&gt;\\r\\n              \\u0423\\u0434\\u043e\\u0431\\u043d\\u043e\\u0435 \\u043e\\u0444\\u043e\\u0440\\u043c\\u043b\\u0435\\u043d\\u0438\\u0435 \\u0437\\u0430\\u043a\\u0430\\u0437\\u0430\\r\\n            &lt;\\/span&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;div class=&quot;content&quot;&gt;\\r\\n            \\u041f\\u043e\\u043b\\u043d\\u043e\\u0441\\u0442\\u044c\\u044e \\u043f\\u0435\\u0440\\u0435\\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u043d\\u043d\\u044b\\u0439 \\u0438\\u043d\\u0442\\u0435\\u0440\\u0444\\u0435\\u0439\\u0441 \\u043e\\u0444\\u043e\\u0440\\u043c\\u043b\\u0435\\u043d\\u0438\\u044f \\u0437\\u0430\\u043a\\u0430\\u0437\\u0430 \\u0443\\u043f\\u0440\\u043e\\u0449\\u0430\\u0435\\u0442 \\u043f\\u0440\\u043e\\u0446\\u0435\\u0441\\u0441, \\u0440\\u0430\\u0434\\u0443\\u0435\\u0442 \\u0433\\u043b\\u0430\\u0437 \\u0438 \\u043f\\u043e\\u0432\\u044b\\u0448\\u0430\\u0435\\u0442 \\u043a\\u043e\\u043d\\u0432\\u0435\\u0440\\u0441\\u0438\\u044e\\r\\n          &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n      &lt;div class=&quot;column is-4-fullhd is-4-widescreen is-4-desktop is-6-tablet is-12-mobile&quot;&gt;\\r\\n        &lt;div class=&quot;box&quot;&gt;\\r\\n          &lt;div class=&quot;block is-flex is-align-items-center&quot;&gt;\\r\\n            &lt;span class=&quot;icon is-large has-text-primary&quot;&gt;\\r\\n              &lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; fill=&quot;none&quot; viewBox=&quot;-0.5 -0.5 16 16&quot; stroke-linecap=&quot;round&quot;\\r\\n                stroke-linejoin=&quot;round&quot; stroke=&quot;currentColor&quot; height=&quot;100&quot; width=&quot;100&quot;&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;m6.862500000000001 12.62125 -4.56125 -4.56125c-0.23125 -0.23125 -0.3625 -0.54375 -0.36687499999999995 -0.8699999999999999L1.875 2.509375A0.62625 0.62625 0 0 1 2.509375 1.875l4.680625 0.059375a1.2531249999999998 1.2531249999999998 0 0 1 0.8699999999999999 0.36687499999999995l4.56125 4.56125c0.42125 0.420625 0.745 1.224375 0.265 1.704375l-4.31875 4.31875c-0.480625 0.480625 -1.284375 0.15625 -1.705 -0.26437499999999997M5.011875 4.72l-0.44187499999999996 -0.44187499999999996&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n              &lt;\\/svg&gt;\\r\\n            &lt;\\/span&gt;\\r\\n            &lt;span class=&quot;title is-5 pl-3&quot;&gt;\\r\\n              \\u0421\\u0442\\u0438\\u043a\\u0435\\u0440\\u044b \\u0434\\u043b\\u044f \\u0442\\u043e\\u0432\\u0430\\u0440\\u043e\\u0432\\r\\n            &lt;\\/span&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;div class=&quot;content&quot;&gt;\\r\\n            \\u0414\\u043e\\u0431\\u0430\\u0432\\u043b\\u044f\\u0439\\u0442\\u0435 \\u0443\\u043d\\u0438\\u043a\\u0430\\u043b\\u044c\\u043d\\u044b\\u0435 \\u0441\\u0442\\u0438\\u043a\\u0435\\u0440\\u044b \\u043a \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\\u043c \\u0441 \\u0438\\u043d\\u0434\\u0438\\u0432\\u0438\\u0434\\u0443\\u0430\\u043b\\u044c\\u043d\\u044b\\u043c \\u0434\\u0438\\u0437\\u0430\\u0439\\u043d\\u043e\\u043c \\u0438\\u043b\\u0438 \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u0443\\u0439\\u0442\\u0435 \\u0438\\u043d\\u0441\\u0442\\u0440\\u0443\\u043c\\u0435\\u043d\\u0442\\u044b \\u0434\\u043b\\u044f \\u043c\\u0430\\u0441\\u0441\\u043e\\u0432\\u043e\\u0433\\u043e\\r\\n            \\u0440\\u0435\\u0434\\u0430\\u043a\\u0442\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f\\r\\n          &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n      &lt;div class=&quot;column is-4-fullhd is-4-widescreen is-4-desktop is-6-tablet is-12-mobile&quot;&gt;\\r\\n        &lt;div class=&quot;box&quot;&gt;\\r\\n          &lt;div class=&quot;block is-flex is-align-items-center&quot;&gt;\\r\\n            &lt;span class=&quot;icon is-large has-text-primary&quot;&gt;\\r\\n              &lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; fill=&quot;none&quot; viewBox=&quot;-0.5 -0.5 16 16&quot; stroke-linecap=&quot;round&quot;\\r\\n                stroke-linejoin=&quot;round&quot; stroke=&quot;currentColor&quot; height=&quot;100&quot; width=&quot;100&quot;&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;M6.1587499999999995 6.1587499999999995 5.9375 5.9375m3.1274999999999995 3.1274999999999995 -0.22125 -0.22125m-2.90625 0.21875 3.125 -3.125M6.070625 2.275c0.363125 -0.309375 0.545 -0.464375 0.735 -0.555a1.610625 1.610625 0 0 1 1.38875 0c0.19 0.090625 0.37187499999999996 0.245625 0.735 0.555 0.374375 0.31875 0.754375 0.48 1.254375 0.5193749999999999 0.475625 0.038125 0.7137499999999999 0.057499999999999996 0.9125 0.1275 0.45875 0.1625 0.8200000000000001 0.523125 0.9818749999999999 0.9825 0.07 0.198125 0.089375 0.43624999999999997 0.1275 0.9125 0.039375 0.5 0.2 0.879375 0.5187499999999999 1.25375 0.31 0.363125 0.46499999999999997 0.545 0.555625 0.735 0.21000000000000002 0.43937499999999996 0.21000000000000002 0.95 0 1.38875 -0.090625 0.19 -0.245625 0.37187499999999996 -0.555 0.735a2.06625 2.06625 0 0 0 -0.5193749999999999 1.254375c-0.038125 0.475625 -0.057499999999999996 0.7137499999999999 -0.1275 0.9125a1.610625 1.610625 0 0 1 -0.9825 0.9818749999999999c-0.198125 0.07 -0.43624999999999997 0.089375 -0.9125 0.1275 -0.5 0.039375 -0.879375 0.2 -1.25375 0.5187499999999999 -0.363125 0.31 -0.545 0.46499999999999997 -0.735 0.555625a1.610625 1.610625 0 0 1 -1.38875 0c-0.19 -0.090625 -0.37187499999999996 -0.245625 -0.735 -0.555a2.06625 2.06625 0 0 0 -1.254375 -0.5193749999999999c-0.475625 -0.038125 -0.7137499999999999 -0.057499999999999996 -0.9125 -0.1275a1.610625 1.610625 0 0 1 -0.9818749999999999 -0.9825c-0.07 -0.198125 -0.089375 -0.43624999999999997 -0.1275 -0.9125a2.0656250000000003 2.0656250000000003 0 0 0 -0.5187499999999999 -1.25375c-0.31 -0.363125 -0.46499999999999997 -0.545 -0.55625 -0.735a1.610625 1.610625 0 0 1 0.000625 -1.38875c0.090625 -0.19 0.245625 -0.37187499999999996 0.555 -0.735 0.325 -0.38187499999999996 0.480625 -0.764375 0.5193749999999999 -1.254375 0.038125 -0.475625 0.057499999999999996 -0.7137499999999999 0.1275 -0.9125a1.610625 1.610625 0 0 1 0.9825 -0.9818749999999999c0.198125 -0.07 0.43624999999999997 -0.089375 0.9125 -0.1275a2.0656250000000003 2.0656250000000003 0 0 0 1.25375 -0.5187499999999999&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n              &lt;\\/svg&gt;\\r\\n            &lt;\\/span&gt;\\r\\n            &lt;span class=&quot;title is-5 pl-3&quot;&gt;\\r\\n              \\u041c\\u0430\\u0441\\u0441\\u043e\\u0432\\u043e\\u0435 \\u0443\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435 \\u0441\\u043a\\u0438\\u0434\\u043a\\u0430\\u043c\\u0438\\r\\n            &lt;\\/span&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;div class=&quot;content&quot;&gt;\\r\\n            \\u0423\\u0434\\u043e\\u0431\\u043d\\u044b\\u0439 \\u0432\\u0441\\u0442\\u0440\\u043e\\u0435\\u043d\\u043d\\u044b\\u0439 \\u043c\\u0435\\u0445\\u0430\\u043d\\u0438\\u0437\\u043c \\u043f\\u043e\\u0437\\u0432\\u043e\\u043b\\u044f\\u0435\\u0442 \\u0431\\u044b\\u0441\\u0442\\u0440\\u043e \\u0434\\u043e\\u0431\\u0430\\u0432\\u043b\\u044f\\u0442\\u044c \\u0438\\u043b\\u0438 \\u0443\\u0434\\u0430\\u043b\\u044f\\u0442\\u044c \\u0441\\u043a\\u0438\\u0434\\u043a\\u0438 \\u0434\\u043b\\u044f \\u0431\\u043e\\u043b\\u044c\\u0448\\u043e\\u0433\\u043e \\u043a\\u043e\\u043b\\u0438\\u0447\\u0435\\u0441\\u0442\\u0432\\u0430 \\u0442\\u043e\\u0432\\u0430\\u0440\\u043e\\u0432\\r\\n          &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n      &lt;div class=&quot;column is-4-fullhd is-4-widescreen is-4-desktop is-6-tablet is-12-mobile&quot;&gt;\\r\\n        &lt;div class=&quot;box&quot;&gt;\\r\\n          &lt;div class=&quot;block is-flex is-align-items-center&quot;&gt;\\r\\n            &lt;span class=&quot;icon is-large has-text-primary&quot;&gt;\\r\\n              &lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; fill=&quot;none&quot; viewBox=&quot;-0.5 -0.5 16 16&quot; stroke-linecap=&quot;round&quot;\\r\\n                stroke-linejoin=&quot;round&quot; stroke=&quot;currentColor&quot; height=&quot;100&quot; width=&quot;100&quot;&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;M5.25 11.396875a4.5 4.5 0 1 0 4.5 -7.79375m-4.5 7.79375A4.5 4.5 0 0 1 3.603125 5.25M5.25 11.396875l-0.5625 0.9750000000000001m5.0625 -8.768749999999999A4.5 4.5 0 0 0 3.603125 5.25M9.75 3.603125l0.5625 -0.9750000000000001M3.603125 5.25l-0.9750000000000001 -0.5625m6.434375 3.75 3.30875 1.875M7.5 13.125v-1.125M7.5 5.625V1.875m2.8125 10.49625 -0.561875 -0.97375m-5.0625 -8.768749999999999 0.56125 0.97375M13.124374999999999 7.5h-1.12375m-10.125 0h1.12375m9.371875 -2.8125 -0.97375 0.561875M5.9375 8.4375l-3.30875 1.875&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n                &lt;path stroke-miterlimit=&quot;1&quot; d=&quot;M5.9375 7.5a1.5625 1.5625 0 1 1 3.125 0 1.5625 1.5625 0 1 1 -3.125 0&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n              &lt;\\/svg&gt;\\r\\n            &lt;\\/span&gt;\\r\\n            &lt;span class=&quot;title is-5 pl-3&quot;&gt;\\r\\n              \\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u044c\\r\\n            &lt;\\/span&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;div class=&quot;content&quot;&gt;\\r\\n            \\u0412\\u0441\\u0442\\u0440\\u043e\\u0435\\u043d\\u043d\\u043e\\u0435 \\u0441\\u0436\\u0430\\u0442\\u0438\\u0435 CSS \\u0438 JS, \\u043f\\u043e\\u0434\\u0434\\u0435\\u0440\\u0436\\u043a\\u0430 \\u043b\\u043e\\u043a\\u0430\\u043b\\u044c\\u043d\\u044b\\u0445 \\u0448\\u0440\\u0438\\u0444\\u0442\\u043e\\u0432 \\u0438 \\u0430\\u0432\\u0442\\u043e\\u043c\\u0430\\u0442\\u0438\\u0447\\u0435\\u0441\\u043a\\u0430\\u044f \\u043a\\u043e\\u043d\\u0432\\u0435\\u0440\\u0442\\u0430\\u0446\\u0438\\u044f \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0439 \\u0432 \\u0444\\u043e\\u0440\\u043c\\u0430\\u0442\\r\\n            WebP\\r\\n          &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n      &lt;div class=&quot;column is-4-fullhd is-4-widescreen is-4-desktop is-6-tablet is-12-mobile&quot;&gt;\\r\\n        &lt;div class=&quot;box&quot;&gt;\\r\\n          &lt;div class=&quot;block is-flex is-align-items-center&quot;&gt;\\r\\n            &lt;span class=&quot;icon is-large has-text-primary&quot;&gt;\\r\\n              &lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; fill=&quot;none&quot; viewBox=&quot;-0.5 -0.5 16 16&quot; stroke-linecap=&quot;round&quot;\\r\\n                stroke-linejoin=&quot;round&quot; stroke=&quot;currentColor&quot; height=&quot;100&quot; width=&quot;100&quot;&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;M4.0625 5a1.25 1.25 0 1 0 2.5 0 1.25 1.25 0 0 0 -2.5 0m9.016874999999999 1.24375c-4.1312500000000005 -0.5675 -7.6937500000000005 2.5 -7.454375 6.56875&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n                &lt;path d=&quot;M1.875 8.16625c1.7374999999999998 -0.240625 3.296875 0.59875 4.14 1.9375&quot; stroke-width=&quot;1&quot;&gt;\\r\\n                &lt;\\/path&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;M1.875 5.875c0 -1.4000000000000001 0 -2.1 0.2725 -2.6350000000000002a2.5 2.5 0 0 1 1.0925 -1.0925C3.775 1.875 4.475 1.875 5.875 1.875h3.25c1.4000000000000001 0 2.1 0 2.6350000000000002 0.2725a2.5 2.5 0 0 1 1.0925 1.0925C13.125 3.775 13.125 4.475 13.125 5.875v3.25c0 1.4000000000000001 0 2.1 -0.2725 2.6350000000000002a2.5 2.5 0 0 1 -1.0925 1.0925C11.225000000000001 13.125 10.525 13.125 9.125 13.125H5.875c-1.4000000000000001 0 -2.1 0 -2.6350000000000002 -0.2725a2.5 2.5 0 0 1 -1.0925 -1.0925C1.875 11.225000000000001 1.875 10.525 1.875 9.125z&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n              &lt;\\/svg&gt;\\r\\n            &lt;\\/span&gt;\\r\\n            &lt;span class=&quot;title is-5 pl-3&quot;&gt;\\r\\n              \\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f \\u0431\\u0435\\u0437 \\u0431\\u0435\\u043b\\u044b\\u0445 \\u043f\\u043e\\u043b\\u0435\\u0439\\r\\n            &lt;\\/span&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;div class=&quot;content&quot;&gt;\\r\\n            \\u041a\\u044d\\u0448 \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0439 \\u0442\\u0435\\u043f\\u0435\\u0440\\u044c \\u043c\\u043e\\u0436\\u0435\\u0442 \\u0433\\u0435\\u043d\\u0435\\u0440\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c\\u0441\\u044f \\u0432 \\u0440\\u0435\\u0436\\u0438\\u043c\\u0430\\u0445 default, crop \\u0438 scale, \\u0430 \\u0440\\u0435\\u0436\\u0438\\u043c \\u043c\\u043e\\u0436\\u043d\\u043e \\u0432\\u044b\\u0431\\u0438\\u0440\\u0430\\u0442\\u044c \\u0432\\r\\n            \\u043d\\u0430\\u0441\\u0442\\u0440\\u043e\\u0439\\u043a\\u0430\\u0445\\r\\n          &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n      &lt;div class=&quot;column is-4-fullhd is-4-widescreen is-4-desktop is-6-tablet is-12-mobile&quot;&gt;\\r\\n        &lt;div class=&quot;box&quot;&gt;\\r\\n          &lt;div class=&quot;block is-flex is-align-items-center&quot;&gt;\\r\\n            &lt;span class=&quot;icon is-large has-text-primary&quot;&gt;\\r\\n              &lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; fill=&quot;none&quot; viewBox=&quot;-0.5 -0.5 16 16&quot; stroke-linecap=&quot;round&quot;\\r\\n                stroke-linejoin=&quot;round&quot; stroke=&quot;currentColor&quot; height=&quot;100&quot; width=&quot;100&quot;&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;M3.4375 8.125 4.375 7.1875l3.4375 3.4375 -0.9375 0.9375c-0.46875 0.46875 -2.1875 1.25 -3.4375 0s-0.46875 -2.96875 0 -3.4375M1.875 13.125l1.5625 -1.5625m8.125 -4.6875L10.625 7.8125 7.1875 4.375 8.125 3.4375c0.46875 -0.46875 2.1875 -1.25 3.4375 0s0.46875 2.96875 0 3.4375m-3.75 -1.875 -1.25 1.25M13.125 1.875l-1.5625 1.5625m-1.5625 3.75 -1.25 1.25&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n              &lt;\\/svg&gt;\\r\\n            &lt;\\/span&gt;\\r\\n            &lt;span class=&quot;title is-5 pl-3&quot;&gt;\\r\\n              \\u0418\\u043d\\u0442\\u0435\\u0433\\u0440\\u0430\\u0446\\u0438\\u044f \\u0441 \\u0441\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430\\u043c\\u0438\\r\\n            &lt;\\/span&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;div class=&quot;content&quot;&gt;\\r\\n            \\u041b\\u0435\\u0433\\u043a\\u043e \\u043f\\u043e\\u0434\\u043a\\u043b\\u044e\\u0447\\u0430\\u0439\\u0442\\u0435\\u0441\\u044c \\u043a \\u0441\\u0442\\u043e\\u0440\\u043e\\u043d\\u043d\\u0438\\u043c \\u0441\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430\\u043c \\u043f\\u043b\\u0430\\u0442\\u0435\\u0436\\u0435\\u0439, \\u043b\\u043e\\u0433\\u0438\\u0441\\u0442\\u0438\\u043a\\u0438, \\u0443\\u0447\\u0451\\u0442\\u0430, CRM, SMS-\\u0443\\u0432\\u0435\\u0434\\u043e\\u043c\\u043b\\u0435\\u043d\\u0438\\u0439, \\u0430\\u043d\\u0430\\u043b\\u0438\\u0442\\u0438\\u043a\\u0438,\\r\\n            \\u0440\\u0435\\u043c\\u0430\\u0440\\u043a\\u0435\\u0442\\u0438\\u043d\\u0433\\u0430 \\u0438 \\u0442. \\u043f.\\r\\n          &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n    &lt;\\/div&gt;\\r\\n  &lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"},\"2\":{\"description\":\"&lt;div class=&quot;py-6 has-background-white&quot;&gt;\\r\\n  &lt;div class=&quot;container&quot;&gt;\\r\\n    &lt;div class=&quot;columns is-mobile is-multiline&quot;&gt;\\r\\n      &lt;div class=&quot;column is-12&quot;&gt;\\r\\n        &lt;div class=&quot;title is-2 has-text-centered mb-6&quot;&gt;Key Features&lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n      &lt;div class=&quot;column is-4-fullhd is-4-widescreen is-4-desktop is-6-tablet is-12-mobile&quot;&gt;\\r\\n        &lt;div class=&quot;box&quot;&gt;\\r\\n          &lt;div class=&quot;block is-flex is-align-items-center&quot;&gt;\\r\\n            &lt;span class=&quot;icon is-large has-text-primary&quot;&gt;\\r\\n              &lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; fill=&quot;none&quot; viewBox=&quot;-0.5 -0.5 16 16&quot; stroke-linecap=&quot;round&quot;\\r\\n                stroke-linejoin=&quot;round&quot; stroke=&quot;currentColor&quot; height=&quot;100&quot; width=&quot;100&quot;&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;M12.497499999999999 6.6381250000000005V11.875a1.25 1.25 0 0 1 -1.25 1.25H3.7524999999999995a1.25 1.25 0 0 1 -1.2493750000000001 -1.25v-5.2368749999999995M4.68875 5.46875l0.3125 -3.59375m-0.3125 3.59375c0 1.8137500000000002 2.8112500000000002 1.8137500000000002 2.8112500000000002 0m-2.8112500000000002 0c0 1.985 -3.2218750000000003 1.575 -2.770625 -0.155l0.653125 -2.5043749999999996A1.25 1.25 0 0 1 3.7800000000000002 1.875h7.4399999999999995a1.25 1.25 0 0 1 1.20875 0.9343750000000001l0.653125 2.5043749999999996c0.45125 1.730625 -2.770625 2.14 -2.770625 0.155M7.5 5.46875V1.875m0 3.59375c0 1.8137500000000002 2.8112500000000002 1.8137500000000002 2.8112500000000002 0m0 0 -0.3125 -3.59375&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n              &lt;\\/svg&gt;\\r\\n            &lt;\\/span&gt;\\r\\n            &lt;span class=&quot;title is-5 pl-3&quot;&gt;\\r\\n              Simple, Convenient, Self-hosted\\r\\n            &lt;\\/span&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;div class=&quot;content&quot;&gt;\\r\\n            OpenCart is simple and convenient by default, and with new features, managing your online business becomes\\r\\n            as comfortable as possible.\\r\\n          &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n      &lt;div class=&quot;column is-4-fullhd is-4-widescreen is-4-desktop is-6-tablet is-12-mobile&quot;&gt;\\r\\n        &lt;div class=&quot;box&quot;&gt;\\r\\n          &lt;div class=&quot;block is-flex is-align-items-center&quot;&gt;\\r\\n            &lt;span class=&quot;icon is-large has-text-primary&quot;&gt;\\r\\n              &lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; fill=&quot;none&quot; viewBox=&quot;-0.5 -0.5 16 16&quot; stroke-linecap=&quot;round&quot;\\r\\n                stroke-linejoin=&quot;round&quot; stroke=&quot;currentColor&quot; height=&quot;100&quot; width=&quot;100&quot;&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;M6.5625 7.1875h1.875M12.5 5v6.875a1.25 1.25 0 0 1 -1.25 1.25H3.75a1.25 1.25 0 0 1 -1.25 -1.25V5m10.625 0V3.125a1.25 1.25 0 0 0 -1.25 -1.25H3.125a1.25 1.25 0 0 0 -1.25 1.25v1.875z&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n              &lt;\\/svg&gt;\\r\\n            &lt;\\/span&gt;\\r\\n            &lt;span class=&quot;title is-5 pl-3&quot;&gt;\\r\\n              Ready to Use Out of the Box\\r\\n            &lt;\\/span&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;div class=&quot;content&quot;&gt;\\r\\n            Built-in essential features not present in the default OpenCart version, allowing you to start selling\\r\\n            immediately.\\r\\n          &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n      &lt;div class=&quot;column is-4-fullhd is-4-widescreen is-4-desktop is-6-tablet is-12-mobile&quot;&gt;\\r\\n        &lt;div class=&quot;box&quot;&gt;\\r\\n          &lt;div class=&quot;block is-flex is-align-items-center&quot;&gt;\\r\\n            &lt;span class=&quot;icon is-large has-text-primary&quot;&gt;\\r\\n              &lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; fill=&quot;none&quot; viewBox=&quot;-0.5 -0.5 16 16&quot; stroke-linecap=&quot;round&quot;\\r\\n                stroke-linejoin=&quot;round&quot; stroke=&quot;currentColor&quot; height=&quot;100&quot; width=&quot;100&quot;&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;M5.625 6.25v6.25M12.8125 5.9375h-10.625M1.875 5.875c0 -1.4000000000000001 0 -2.1 0.2725 -2.6350000000000002a2.5 2.5 0 0 1 1.0925 -1.0925C3.775 1.875 4.475 1.875 5.875 1.875h3.25c1.4000000000000001 0 2.1 0 2.6350000000000002 0.2725a2.5 2.5 0 0 1 1.0925 1.0925C13.125 3.775 13.125 4.475 13.125 5.875v3.25c0 1.4000000000000001 0 2.1 -0.2725 2.6350000000000002a2.5 2.5 0 0 1 -1.0925 1.0925C11.225000000000001 13.125 10.525 13.125 9.125 13.125H5.875c-1.4000000000000001 0 -2.1 0 -2.6350000000000002 -0.2725a2.5 2.5 0 0 1 -1.0925 -1.0925C1.875 11.225000000000001 1.875 10.525 1.875 9.125z&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n              &lt;\\/svg&gt;\\r\\n            &lt;\\/span&gt;\\r\\n            &lt;span class=&quot;title is-5 pl-3&quot;&gt;\\r\\n              Modern UI\\r\\n            &lt;\\/span&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;div class=&quot;content&quot;&gt;\\r\\n            Includes a lightweight and flexible Bulma UI framework with SASS compilation support and optional dark theme\\r\\n            for easy customization.\\r\\n          &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n      &lt;div class=&quot;column is-4-fullhd is-4-widescreen is-4-desktop is-6-tablet is-12-mobile&quot;&gt;\\r\\n        &lt;div class=&quot;box&quot;&gt;\\r\\n          &lt;div class=&quot;block is-flex is-align-items-center&quot;&gt;\\r\\n            &lt;span class=&quot;icon is-large has-text-primary&quot;&gt;\\r\\n              &lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; fill=&quot;none&quot; viewBox=&quot;-0.5 -0.5 16 16&quot; stroke-linecap=&quot;round&quot;\\r\\n                stroke-linejoin=&quot;round&quot; stroke=&quot;currentColor&quot; height=&quot;100&quot; width=&quot;100&quot;&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;m6.875 6.401250000000001 0.64625 0.738125c0.059375 0.068125 0.16625 0.0625 0.21875 -0.01l1.3125 -1.816875M10.3125 13.125a0.9375 0.9375 0 1 0 0 -1.875 0.9375 0.9375 0 0 0 0 1.875m-5 0a0.9375 0.9375 0 1 0 0 -1.875 0.9375 0.9375 0 0 0 0 1.875&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;M2.31875 3.375h9.508750000000001c0.86125 0 1.4831250000000002 0.79375 1.2468750000000002 1.5925l-1.03375 3.5C11.881250000000001 9.004999999999999 11.3725 9.375 10.79375 9.375H5.07c-0.579375 0 -1.08875 -0.370625 -1.2475 -0.9075zm0 0L1.875 1.875&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n              &lt;\\/svg&gt;\\r\\n            &lt;\\/span&gt;\\r\\n            &lt;span class=&quot;title is-5 pl-3&quot;&gt;\\r\\n              Convenient Order Checkout\\r\\n            &lt;\\/span&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;div class=&quot;content&quot;&gt;\\r\\n            Completely redesigned order checkout interface simplifies the process, enhances visual appeal, and boosts\\r\\n            conversion rates.\\r\\n          &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n      &lt;div class=&quot;column is-4-fullhd is-4-widescreen is-4-desktop is-6-tablet is-12-mobile&quot;&gt;\\r\\n        &lt;div class=&quot;box&quot;&gt;\\r\\n          &lt;div class=&quot;block is-flex is-align-items-center&quot;&gt;\\r\\n            &lt;span class=&quot;icon is-large has-text-primary&quot;&gt;\\r\\n              &lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; fill=&quot;none&quot; viewBox=&quot;-0.5 -0.5 16 16&quot; stroke-linecap=&quot;round&quot;\\r\\n                stroke-linejoin=&quot;round&quot; stroke=&quot;currentColor&quot; height=&quot;100&quot; width=&quot;100&quot;&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;m6.862500000000001 12.62125 -4.56125 -4.56125c-0.23125 -0.23125 -0.3625 -0.54375 -0.36687499999999995 -0.8699999999999999L1.875 2.509375A0.62625 0.62625 0 0 1 2.509375 1.875l4.680625 0.059375a1.2531249999999998 1.2531249999999998 0 0 1 0.8699999999999999 0.36687499999999995l4.56125 4.56125c0.42125 0.420625 0.745 1.224375 0.265 1.704375l-4.31875 4.31875c-0.480625 0.480625 -1.284375 0.15625 -1.705 -0.26437499999999997M5.011875 4.72l-0.44187499999999996 -0.44187499999999996&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n              &lt;\\/svg&gt;\\r\\n            &lt;\\/span&gt;\\r\\n            &lt;span class=&quot;title is-5 pl-3&quot;&gt;\\r\\n              Product Stickers\\r\\n            &lt;\\/span&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;div class=&quot;content&quot;&gt;\\r\\n            Add unique stickers to products with custom designs or use bulk editing tools for efficient management.\\r\\n          &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n      &lt;div class=&quot;column is-4-fullhd is-4-widescreen is-4-desktop is-6-tablet is-12-mobile&quot;&gt;\\r\\n        &lt;div class=&quot;box&quot;&gt;\\r\\n          &lt;div class=&quot;block is-flex is-align-items-center&quot;&gt;\\r\\n            &lt;span class=&quot;icon is-large has-text-primary&quot;&gt;\\r\\n              &lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; fill=&quot;none&quot; viewBox=&quot;-0.5 -0.5 16 16&quot; stroke-linecap=&quot;round&quot;\\r\\n                stroke-linejoin=&quot;round&quot; stroke=&quot;currentColor&quot; height=&quot;100&quot; width=&quot;100&quot;&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;M6.1587499999999995 6.1587499999999995 5.9375 5.9375m3.1274999999999995 3.1274999999999995 -0.22125 -0.22125m-2.90625 0.21875 3.125 -3.125M6.070625 2.275c0.363125 -0.309375 0.545 -0.464375 0.735 -0.555a1.610625 1.610625 0 0 1 1.38875 0c0.19 0.090625 0.37187499999999996 0.245625 0.735 0.555 0.374375 0.31875 0.754375 0.48 1.254375 0.5193749999999999 0.475625 0.038125 0.7137499999999999 0.057499999999999996 0.9125 0.1275 0.45875 0.1625 0.8200000000000001 0.523125 0.9818749999999999 0.9825 0.07 0.198125 0.089375 0.43624999999999997 0.1275 0.9125 0.039375 0.5 0.2 0.879375 0.5187499999999999 1.25375 0.31 0.363125 0.46499999999999997 0.545 0.555625 0.735 0.21000000000000002 0.43937499999999996 0.21000000000000002 0.95 0 1.38875 -0.090625 0.19 -0.245625 0.37187499999999996 -0.555 0.735a2.06625 2.06625 0 0 0 -0.5193749999999999 1.254375c-0.038125 0.475625 -0.057499999999999996 0.7137499999999999 -0.1275 0.9125a1.610625 1.610625 0 0 1 -0.9825 0.9818749999999999c-0.198125 0.07 -0.43624999999999997 0.089375 -0.9125 0.1275 -0.5 0.039375 -0.879375 0.2 -1.25375 0.5187499999999999 -0.363125 0.31 -0.545 0.46499999999999997 -0.735 0.555625a1.610625 1.610625 0 0 1 -1.38875 0c-0.19 -0.090625 -0.37187499999999996 -0.245625 -0.735 -0.555a2.06625 2.06625 0 0 0 -1.254375 -0.5193749999999999c-0.475625 -0.038125 -0.7137499999999999 -0.057499999999999996 -0.9125 -0.1275a1.610625 1.610625 0 0 1 -0.9818749999999999 -0.9825c-0.07 -0.198125 -0.089375 -0.43624999999999997 -0.1275 -0.9125a2.0656250000000003 2.0656250000000003 0 0 0 -0.5187499999999999 -1.25375c-0.31 -0.363125 -0.46499999999999997 -0.545 -0.55625 -0.735a1.610625 1.610625 0 0 1 0.000625 -1.38875c0.090625 -0.19 0.245625 -0.37187499999999996 0.555 -0.735 0.325 -0.38187499999999996 0.480625 -0.764375 0.5193749999999999 -1.254375 0.038125 -0.475625 0.057499999999999996 -0.7137499999999999 0.1275 -0.9125a1.610625 1.610625 0 0 1 0.9825 -0.9818749999999999c0.198125 -0.07 0.43624999999999997 -0.089375 0.9125 -0.1275a2.0656250000000003 2.0656250000000003 0 0 0 1.25375 -0.5187499999999999&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n              &lt;\\/svg&gt;\\r\\n            &lt;\\/span&gt;\\r\\n            &lt;span class=&quot;title is-5 pl-3&quot;&gt;\\r\\n              Bulk Discount Management\\r\\n            &lt;\\/span&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;div class=&quot;content&quot;&gt;\\r\\n            Convenient built-in mechanism enables quick addition or removal of discounts for multiple products at once.\\r\\n          &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n      &lt;div class=&quot;column is-4-fullhd is-4-widescreen is-4-desktop is-6-tablet is-12-mobile&quot;&gt;\\r\\n        &lt;div class=&quot;box&quot;&gt;\\r\\n          &lt;div class=&quot;block is-flex is-align-items-center&quot;&gt;\\r\\n            &lt;span class=&quot;icon is-large has-text-primary&quot;&gt;\\r\\n              &lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; fill=&quot;none&quot; viewBox=&quot;-0.5 -0.5 16 16&quot; stroke-linecap=&quot;round&quot;\\r\\n                stroke-linejoin=&quot;round&quot; stroke=&quot;currentColor&quot; height=&quot;100&quot; width=&quot;100&quot;&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;M5.25 11.396875a4.5 4.5 0 1 0 4.5 -7.79375m-4.5 7.79375A4.5 4.5 0 0 1 3.603125 5.25M5.25 11.396875l-0.5625 0.9750000000000001m5.0625 -8.768749999999999A4.5 4.5 0 0 0 3.603125 5.25M9.75 3.603125l0.5625 -0.9750000000000001M3.603125 5.25l-0.9750000000000001 -0.5625m6.434375 3.75 3.30875 1.875M7.5 13.125v-1.125M7.5 5.625V1.875m2.8125 10.49625 -0.561875 -0.97375m-5.0625 -8.768749999999999 0.56125 0.97375M13.124374999999999 7.5h-1.12375m-10.125 0h1.12375m9.371875 -2.8125 -0.97375 0.561875M5.9375 8.4375l-3.30875 1.875&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n                &lt;path stroke-miterlimit=&quot;1&quot; d=&quot;M5.9375 7.5a1.5625 1.5625 0 1 1 3.125 0 1.5625 1.5625 0 1 1 -3.125 0&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n              &lt;\\/svg&gt;\\r\\n            &lt;\\/span&gt;\\r\\n            &lt;span class=&quot;title is-5 pl-3&quot;&gt;\\r\\n              Performance\\r\\n            &lt;\\/span&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;div class=&quot;content&quot;&gt;\\r\\n            Built-in CSS and JS compression, local font support, and automatic image conversion to WebP format for\\r\\n            better performance.\\r\\n          &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n      &lt;div class=&quot;column is-4-fullhd is-4-widescreen is-4-desktop is-6-tablet is-12-mobile&quot;&gt;\\r\\n        &lt;div class=&quot;box&quot;&gt;\\r\\n          &lt;div class=&quot;block is-flex is-align-items-center&quot;&gt;\\r\\n            &lt;span class=&quot;icon is-large has-text-primary&quot;&gt;\\r\\n              &lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; fill=&quot;none&quot; viewBox=&quot;-0.5 -0.5 16 16&quot; stroke-linecap=&quot;round&quot;\\r\\n                stroke-linejoin=&quot;round&quot; stroke=&quot;currentColor&quot; height=&quot;100&quot; width=&quot;100&quot;&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;M4.0625 5a1.25 1.25 0 1 0 2.5 0 1.25 1.25 0 0 0 -2.5 0m9.016874999999999 1.24375c-4.1312500000000005 -0.5675 -7.6937500000000005 2.5 -7.454375 6.56875&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n                &lt;path d=&quot;M1.875 8.16625c1.7374999999999998 -0.240625 3.296875 0.59875 4.14 1.9375&quot; stroke-width=&quot;1&quot;&gt;\\r\\n                &lt;\\/path&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;M1.875 5.875c0 -1.4000000000000001 0 -2.1 0.2725 -2.6350000000000002a2.5 2.5 0 0 1 1.0925 -1.0925C3.775 1.875 4.475 1.875 5.875 1.875h3.25c1.4000000000000001 0 2.1 0 2.6350000000000002 0.2725a2.5 2.5 0 0 1 1.0925 1.0925C13.125 3.775 13.125 4.475 13.125 5.875v3.25c0 1.4000000000000001 0 2.1 -0.2725 2.6350000000000002a2.5 2.5 0 0 1 -1.0925 1.0925C11.225000000000001 13.125 10.525 13.125 9.125 13.125H5.875c-1.4000000000000001 0 -2.1 0 -2.6350000000000002 -0.2725a2.5 2.5 0 0 1 -1.0925 -1.0925C1.875 11.225000000000001 1.875 10.525 1.875 9.125z&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n              &lt;\\/svg&gt;\\r\\n            &lt;\\/span&gt;\\r\\n            &lt;span class=&quot;title is-5 pl-3&quot;&gt;\\r\\n              Images Without White Margins\\r\\n            &lt;\\/span&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;div class=&quot;content&quot;&gt;\\r\\n            Image cache can now be generated in default, crop, and scale modes, with the option to select the mode in\\r\\n            settings.\\r\\n          &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n      &lt;div class=&quot;column is-4-fullhd is-4-widescreen is-4-desktop is-6-tablet is-12-mobile&quot;&gt;\\r\\n        &lt;div class=&quot;box&quot;&gt;\\r\\n          &lt;div class=&quot;block is-flex is-align-items-center&quot;&gt;\\r\\n            &lt;span class=&quot;icon is-large has-text-primary&quot;&gt;\\r\\n              &lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; fill=&quot;none&quot; viewBox=&quot;-0.5 -0.5 16 16&quot; stroke-linecap=&quot;round&quot;\\r\\n                stroke-linejoin=&quot;round&quot; stroke=&quot;currentColor&quot; height=&quot;100&quot; width=&quot;100&quot;&gt;\\r\\n                &lt;path\\r\\n                  d=&quot;M3.4375 8.125 4.375 7.1875l3.4375 3.4375 -0.9375 0.9375c-0.46875 0.46875 -2.1875 1.25 -3.4375 0s-0.46875 -2.96875 0 -3.4375M1.875 13.125l1.5625 -1.5625m8.125 -4.6875L10.625 7.8125 7.1875 4.375 8.125 3.4375c0.46875 -0.46875 2.1875 -1.25 3.4375 0s0.46875 2.96875 0 3.4375m-3.75 -1.875 -1.25 1.25M13.125 1.875l-1.5625 1.5625m-1.5625 3.75 -1.25 1.25&quot;\\r\\n                  stroke-width=&quot;1&quot;&gt;&lt;\\/path&gt;\\r\\n              &lt;\\/svg&gt;\\r\\n            &lt;\\/span&gt;\\r\\n            &lt;span class=&quot;title is-5 pl-3&quot;&gt;\\r\\n              Service Integration\\r\\n            &lt;\\/span&gt;\\r\\n          &lt;\\/div&gt;\\r\\n          &lt;div class=&quot;content&quot;&gt;\\r\\n            Easily integrate with third-party services for payments, logistics, accounting, CRM, SMS notifications,\\r\\n            analytics, retargeting, and more.\\r\\n          &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n      &lt;\\/div&gt;\\r\\n    &lt;\\/div&gt;\\r\\n  &lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"}},\"include_swiper\":\"0\",\"include_fancybox\":\"0\",\"status\":\"1\"}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option`
--

CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(14, 'radio', 1),
(15, 'checkbox', 2),
(16, 'select', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_description`
--

CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(14, 2, 'Test radio'),
(14, 1, 'Тестовая радиокнопка'),
(15, 1, 'Тестовый чекбокс'),
(15, 2, 'Test checkbox'),
(16, 1, 'Тестовый список'),
(16, 2, 'Test select');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value`
--

CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(51, 14, '', 3),
(50, 14, '', 2),
(49, 14, '', 1),
(56, 15, '', 5),
(55, 15, '', 4),
(54, 15, '', 3),
(53, 15, '', 2),
(52, 15, '', 1),
(57, 14, '', 4),
(58, 14, '', 5),
(59, 14, '', 6),
(60, 15, '', 6),
(64, 16, '', 4),
(63, 16, '', 3),
(62, 16, '', 2),
(61, 16, '', 1),
(65, 16, '', 5),
(66, 16, '', 6);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value_description`
--

CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(51, 1, 14, 'Радиокнопка минус'),
(50, 2, 14, 'Plus radio'),
(50, 1, 14, 'Радиокнопка плюс'),
(49, 2, 14, 'Default radio'),
(49, 1, 14, 'Радиокнопка по-умолчанию'),
(56, 1, 15, 'Чекбокс разделить'),
(55, 2, 15, 'Multiply checkbox'),
(54, 2, 15, 'Minus checkbox'),
(55, 1, 15, 'Чекбокс умножить'),
(54, 1, 15, 'Чекбокс минус'),
(53, 2, 15, 'Plus checkbox'),
(53, 1, 15, 'Чекбокс плюс'),
(52, 2, 15, 'Default checkbox'),
(52, 1, 15, 'Чекбокс по-умолчанию'),
(51, 2, 14, 'Minus radio'),
(57, 1, 14, 'Радиокнопка умножить'),
(57, 2, 14, 'Multiply checkbox'),
(58, 1, 14, 'Радиокнопка разделить'),
(58, 2, 14, 'Divide radio'),
(59, 1, 14, 'Радиокнопка равно'),
(59, 2, 14, 'Equal radio'),
(56, 2, 15, 'Divide checkbox'),
(60, 1, 15, 'Чекбокс равно'),
(60, 2, 15, 'Equal checkbox'),
(63, 2, 16, 'Minus select'),
(64, 1, 16, 'Список умножить'),
(63, 1, 16, 'Список минус'),
(62, 2, 16, 'Plus select'),
(62, 1, 16, 'Список плюс'),
(61, 2, 16, 'Default select'),
(61, 1, 16, 'Список по-умолчанию'),
(64, 2, 16, 'Multiply select'),
(65, 1, 16, 'Список разделить'),
(65, 2, 16, 'Divide select'),
(66, 1, 16, 'Список равно'),
(66, 2, 16, 'Equal select');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order`
--

CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_field` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_firstname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_lastname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_company` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_address_1` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_address_2` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_city` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_postcode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_country` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_custom_field` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_firstname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_lastname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_company` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address_1` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address_2` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_city` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_postcode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_country` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_custom_field` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_method` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forwarded_ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accept_language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_order`
--

INSERT INTO `oc_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `custom_field`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_custom_field`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_custom_field`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `marketing_id`, `tracking`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(48, 0, 'INV-2023-00', 0, 'exopencart', 'https://exbasic.loc/', 0, 1, 'Tommy', 'Gun', 'asdf@asdf.ru', '89876543210', '', '', 'Tommy', 'Gun', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Tommy', 'Gun', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '112490.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'ru', '2024-03-23 09:45:44', '2024-03-23 09:45:44'),
(47, 0, 'INV-2023-00', 0, 'exopencart', 'https://exbasic.loc/', 0, 0, 'Tommy', 'Gun', 'asdf@asdf.ru', '89876543210', '', '', '', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', '', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '112490.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'ru', '2024-03-23 09:36:40', '2024-03-23 09:36:40'),
(50, 0, 'INV-2023-00', 0, 'exopencart', 'https://exbasic.loc/', 0, 1, 'Tommy', 'Gun', 'asdf@asdf.ru', '1234123412', '', '[]', '', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', '', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '112490.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'ru', '2024-03-23 11:12:37', '2024-03-23 11:12:37'),
(51, 0, 'INV-2023-00', 0, 'exopencart', 'https://exbasic.loc/', 0, 1, 'Tommy', 'Gun', 'asdf@asdf.ru', '1234123412', '', '[]', 'Tommy', 'Gun', '', '', '', '', '', 'Российская Федерация', 176, 'Московская область', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Tommy', 'Gun', '', '', '', '', '', 'Российская Федерация', 176, 'Московская область', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '112490.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'ru', '2024-03-23 11:22:34', '2024-03-23 11:22:34'),
(53, 0, 'INV-2023-00', 0, 'exopencart', 'https://exbasic.loc/', 66, 1, 'Олег', 'Тиньков', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', '', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', '', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '274990.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'ru', '2024-03-24 10:56:57', '2024-03-24 10:56:57'),
(54, 0, 'INV-2023-00', 0, 'exopencart', 'https://exbasic.loc/', 66, 1, 'Олег', 'Тиньков', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', '', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', '', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '274990.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'ru', '2024-03-24 10:57:13', '2024-03-24 10:57:13'),
(55, 0, 'INV-2023-00', 0, 'exopencart', 'https://exbasic.loc/', 0, 1, '', '', 'tinkov@exopencart.ru', '', '', '[]', '', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', '', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '13990.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'ru', '2024-03-24 10:58:59', '2024-03-24 10:58:59'),
(56, 0, 'INV-2023-00', 0, 'exopencart', 'https://exbasic.loc/', 0, 1, '', '', 'tinkov@exopencart.ru', '', '', '[]', '', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', '', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '13990.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'ru', '2024-03-24 11:06:42', '2024-03-24 11:06:42'),
(58, 0, 'INV-2023-00', 0, 'exopencart', 'https://exbasic.loc/', 66, 1, 'Олег', 'Тиньков', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', '', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', '', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '13990.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'ru', '2024-03-24 11:17:20', '2024-03-24 11:17:20'),
(59, 0, 'INV-2023-00', 0, 'exopencart', 'https://exbasic.loc/', 66, 1, 'Олег', 'Тиньков', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', '', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', '', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '70380.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'ru', '2024-03-24 11:24:54', '2024-03-24 11:24:54'),
(60, 0, 'INV-2023-00', 0, 'exopencart', 'https://exbasic.loc/', 72, 1, 'Tommy', 'Gun', 'asdf@asdf.ru', '98741234123', '', '', '', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', '', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '13990.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'ru', '2024-03-24 12:18:37', '2024-03-24 12:18:37'),
(82, 0, 'INV-2025-00', 0, 'exopencart', 'https://exopencart.loc/', 85, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Евгений', 'Соковнин', 'ООО &quot;Экс&quot;', 'Ленина 56', '12/16 кв 120, 10 этаж', 'Москва', '123123', 'Российская Федерация', 176, 'Московская область', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Банковский перевод', 'bank_transfer', 'Евгений', 'Соковнин', 'ООО &quot;Экс&quot;', 'Ленина 56', '12/16 кв 120, 10 этаж', 'Москва', '123123', 'Российская Федерация', 176, 'Московская область', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Бесплатная доставка', 'free.free', '', '92040.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-10 19:58:37', '2025-12-10 19:58:37'),
(78, 0, 'INV-2025-00', 0, 'exopencart', 'https://exopencart.loc/', 85, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Евгений', 'Соковнин', 'ООО &quot;Экс&quot;', 'Ленина 56', '12/16 кв 120, 10 этаж', 'Москва', '123123', 'Российская Федерация', 176, 'Московская область', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Евгений', 'Соковнин', 'ООО &quot;Экс&quot;', 'Ленина 56', '12/16 кв 120, 10 этаж', 'Москва', '123123', 'Российская Федерация', 176, 'Московская область', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Бесплатная доставка', 'free.free', '', '112490.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-10 16:32:46', '2025-12-10 16:32:46'),
(79, 0, 'INV-2025-00', 0, 'exopencart', 'https://exopencart.loc/', 85, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Евгений', 'Соковнин', 'ООО &quot;Экс&quot;', 'Ленина 56', '12/16 кв 120, 10 этаж', 'Москва', '123123', 'Российская Федерация', 176, 'Московская область', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Евгений', 'Соковнин', 'ООО &quot;Экс&quot;', 'Ленина 56', '12/16 кв 120, 10 этаж', 'Москва', '123123', 'Российская Федерация', 176, 'Московская область', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Бесплатная доставка', 'free.free', '', '112490.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-10 16:33:36', '2025-12-10 16:33:36'),
(81, 0, 'INV-2025-00', 0, 'exopencart', 'https://exopencart.loc/', 85, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Евгений', 'Соковнин', 'ООО &quot;Экс&quot;', 'Ленина 56', '12/16 кв 120, 10 этаж', 'Москва', '123123', 'Российская Федерация', 176, 'Московская область', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Банковский перевод', 'bank_transfer', 'Евгений', 'Соковнин', 'ООО &quot;Экс&quot;', 'Ленина 56', '12/16 кв 120, 10 этаж', 'Москва', '123123', 'Российская Федерация', 176, 'Московская область', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Бесплатная доставка', 'free.free', '', '92040.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-10 19:58:03', '2025-12-10 19:58:03'),
(85, 0, 'INV-2025-00', 0, 'exopencart', 'https://exopencart.loc/', 0, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '[]', 'Андрей', 'Мерзликин', 'ООО &quot;ЭКС&quot;', 'Ленина 56', '32', 'Москва', '123123', '', 176, 'Московская область', 2751, '', '[]', 'Банковский перевод', 'bank_transfer', 'Василий', 'Залупин', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '113030.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-11 16:23:46', '2025-12-11 16:23:46'),
(86, 0, 'INV-2025-00', 0, 'exopencart', 'https://exopencart.loc/', 0, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '[]', 'Андрей', 'Мерзликин', 'ООО &quot;ЭКС&quot;', 'Ленина 56', '32', 'Москва', '123123', '', 176, 'Московская область', 2751, '', '[]', 'Оплата при доставке', 'cod', 'Василий', 'Залупин', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '113030.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-11 16:35:00', '2025-12-11 16:35:00'),
(87, 0, 'INV-2025-00', 0, 'exopencart', 'https://exopencart.loc/', 0, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '[]', 'Андрей', 'Мерзликин', '', 'Чкалова', '32', 'Москва', '603002', '', 176, 'Московская область', 2751, '', '[]', 'Оплата при доставке', 'cod', 'Василий', 'Залупин', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '113030.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-11 18:41:05', '2025-12-11 18:41:05'),
(88, 0, 'INV-2025-00', 0, 'exopencart', 'https://exopencart.loc/', 0, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '[]', 'Андрей', 'Мерзликин', '', 'Чкалова', '32', 'Москва', '603002', '', 176, 'Московская область', 2751, '', '[]', 'Оплата при доставке', 'cod', 'Андрей', 'Мерзликин', '', 'Чкалова', '32', 'Москва', '603002', '', 176, 'Московская область', 2751, '', '[]', 'Бесплатная доставка', 'free.free', '', '113030.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-11 18:42:20', '2025-12-11 18:42:20'),
(143, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Доставка до адреса', 'flat.flat', '', '625082.4000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-19 22:10:59', '2025-12-19 22:10:59'),
(91, 0, 'INV-2025-00', 0, 'exopencart', 'https://exopencart.loc/', 0, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '[]', 'Андрей', 'Мерзликин', '', 'Бахметьевская', '43', 'Нижний Новогород', '603002', 'Российская Федерация', 176, 'Московская область', 2751, '', '[]', 'Оплата при доставке', 'cod', 'Василий', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '274990.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-12 08:22:56', '2025-12-12 08:22:56'),
(100, 0, 'INV-2025-00', 0, 'exopencart', 'https://exopencart.loc/', 86, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Василий', 'Залупин', 'ООО &quot;ЭКС&quot;', 'Чкалова', '32', 'Москва', '123123', '', 176, '', 2751, '', '\"\"', 'Оплата при доставке', 'cod', '', '', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '159990.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-12 15:50:54', '2025-12-12 15:50:54'),
(139, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата онлайн', 'bank_transfer', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Доставка до адреса', 'flat.flat', '', '625082.4000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-19 22:04:03', '2025-12-19 22:04:03'),
(140, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата онлайн', 'bank_transfer', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Доставка до адреса', 'flat.flat', '', '625082.4000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-19 22:07:24', '2025-12-19 22:07:24'),
(141, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата онлайн', 'bank_transfer', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Доставка до адреса', 'flat.flat', '', '625082.4000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-19 22:07:33', '2025-12-19 22:07:33'),
(142, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Доставка до адреса', 'flat.flat', '', '625082.4000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-19 22:09:19', '2025-12-19 22:09:19'),
(108, 0, 'INV-2025-00', 0, 'exopencart', 'https://exopencart.loc/', 90, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '[]', 'Андрей', 'Мерзликин', '', 'Чкалова', '32', 'Нижний Новогород', '123123', 'Российская Федерация', 176, 'Нижегородская область', 2766, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Андрей', 'Мерзликин', '', 'Чкалова', '32', 'Нижний Новогород', '123123', 'Российская Федерация', 176, 'Нижегородская область', 2766, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Доставка до адреса', 'flat.flat', '', '28280.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-14 10:29:20', '2025-12-14 10:29:20'),
(109, 0, 'INV-2025-00', 0, 'exopencart', 'https://exopencart.loc/', 90, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '[]', 'Андрей', 'Мерзликин', '', 'Чкалова', '32', 'Нижний Новогород', '123123', 'Российская Федерация', 176, 'Нижегородская область', 2766, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Андрей', 'Мерзликин', '', 'Чкалова', '32', 'Нижний Новогород', '123123', 'Российская Федерация', 176, 'Нижегородская область', 2766, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Доставка до адреса', 'flat.flat', '', '28280.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-14 10:31:43', '2025-12-14 10:31:43'),
(144, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата онлайн', 'bank_transfer', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Доставка до адреса', 'flat.flat', '', '625082.4000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-19 22:11:04', '2025-12-19 22:11:04'),
(147, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата онлайн', 'bank_transfer', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Доставка до адреса', 'flat.flat', '', '70680.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-20 10:28:20', '2025-12-20 10:28:20'),
(148, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Василий', 'Залупин', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '70380.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-20 10:28:35', '2025-12-20 10:28:35'),
(149, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата онлайн', 'bank_transfer', 'Василий', 'Залупин', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '70380.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-20 11:07:43', '2025-12-20 11:07:43'),
(151, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Василий', 'Залупин', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '95450.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-20 19:55:09', '2025-12-20 19:55:09'),
(153, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Доставка до адреса', 'flat.flat', '', '70250.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-20 20:41:59', '2025-12-20 20:41:59'),
(154, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Василий', 'Залупин', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '69950.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-20 20:42:14', '2025-12-20 20:42:14'),
(155, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Василий', 'Залупин', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '69950.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-20 20:42:31', '2025-12-20 20:42:31'),
(156, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата онлайн', 'bank_transfer', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Доставка до адреса', 'flat.flat', '', '70250.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-20 20:42:46', '2025-12-20 20:42:46'),
(157, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Василий', 'Залупин', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '4500.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-20 20:51:12', '2025-12-20 20:51:12'),
(158, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', '', '', '', '', '', '', '', 'Российская Федерация', 176, 'Московская область', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Василий', 'Залупин', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '164490.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-20 20:53:31', '2025-12-20 20:53:31'),
(159, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', '', '', '', '', '', '', '', 'Российская Федерация', 176, 'Московская область', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата онлайн', 'bank_transfer', 'Василий', 'Залупин', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '164490.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-20 20:56:38', '2025-12-20 20:56:38'),
(160, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', '', '', '', '', '', '', '', 'Российская Федерация', 176, 'Московская область', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Василий', 'Залупин', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '164490.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-20 20:56:40', '2025-12-20 20:56:40'),
(161, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Доставка до адреса', 'flat.flat', '', '164790.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-20 20:56:43', '2025-12-20 20:56:43'),
(162, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', 'Василий', 'Залупин', '', 'Чкалова', '32', 'Москва', '603002', 'Российская Федерация', 176, 'Москва', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Василий', 'Залупин', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '164490.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-20 20:59:51', '2025-12-20 20:59:51'),
(164, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', '', '', '', '', '', '', '', 'Российская Федерация', 176, 'Московская область', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Василий', 'Залупин', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '27980.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-20 21:04:56', '2025-12-20 21:04:56'),
(165, 0, 'INV-2025-00flex-start', 0, 'exopencart', 'https://exopencart.loc/', 95, 1, 'Василий', 'Залупин', 'tinkov@exopencart.ru', '+7 987 654 32 10', '', '', '', '', '', '', '', '', '', 'Российская Федерация', 176, 'Московская область', 2751, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Оплата при доставке', 'cod', 'Василий', 'Залупин', '', 'Магазин на Рабочей', 'г. Саратов ул. Рабочая 55', '', '', 'Российская Федерация', 176, '', 2761, '{postcode} {zone} {city} {address_1} {address_2}', '[]', 'Самовывоз из ПВЗ', 'pickup.pickup', '', '27980.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '172.16.238.1', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'en-US,en;q=0.9', '2025-12-20 21:13:41', '2025-12-20 21:13:41');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_history`
--

CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_option`
--

CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_order_option`
--

INSERT INTO `oc_order_option` (`order_option_id`, `order_id`, `order_product_id`, `product_option_id`, `product_option_value_id`, `name`, `value`, `type`) VALUES
(22, 151, 179, 1, 2, 'Тестовая радиокнопка', 'Радиокнопка плюс', 'radio'),
(23, 151, 179, 4, 11, 'Тестовый чекбокс', 'Чекбокс плюс', 'checkbox'),
(26, 157, 186, 1, 1, 'Тестовая радиокнопка', 'Радиокнопка по-умолчанию', 'radio'),
(27, 157, 186, 4, 10, 'Тестовый чекбокс', 'Чекбокс по-умолчанию', 'checkbox'),
(28, 158, 188, 1, 1, 'Тестовая радиокнопка', 'Радиокнопка по-умолчанию', 'radio'),
(29, 158, 188, 4, 10, 'Тестовый чекбокс', 'Чекбокс по-умолчанию', 'checkbox'),
(30, 159, 190, 1, 1, 'Тестовая радиокнопка', 'Радиокнопка по-умолчанию', 'radio'),
(31, 159, 190, 4, 10, 'Тестовый чекбокс', 'Чекбокс по-умолчанию', 'checkbox'),
(32, 160, 192, 1, 1, 'Тестовая радиокнопка', 'Радиокнопка по-умолчанию', 'radio'),
(33, 160, 192, 4, 10, 'Тестовый чекбокс', 'Чекбокс по-умолчанию', 'checkbox'),
(34, 161, 194, 1, 1, 'Тестовая радиокнопка', 'Радиокнопка по-умолчанию', 'radio'),
(35, 161, 194, 4, 10, 'Тестовый чекбокс', 'Чекбокс по-умолчанию', 'checkbox'),
(36, 162, 196, 1, 1, 'Тестовая радиокнопка', 'Радиокнопка по-умолчанию', 'radio'),
(37, 162, 196, 4, 10, 'Тестовый чекбокс', 'Чекбокс по-умолчанию', 'checkbox');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_product`
--

CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_order_product`
--

INSERT INTO `oc_order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(185, 156, 41, 'Беспроводное зарядное устройство Apple MagSafe Duo,  белый', '42231', '5.0000', '13990.0000', '69950.0000', '0.0000', 0),
(103, 100, 18, 'Планшет Apple iPad Pro 2021 11&quot; 2Tb Wi-Fi MHR23RU/A,  16ГБ, 2ТБ серый космос', '42124', '1.0000', '159990.0000', '159990.0000', '0.0000', 0),
(94, 91, 11, 'Планшет Apple iPad Pro 2021 11&quot; 2Tb Wi-Fi + Cellular MHWE3RU/A,  16ГБ, 2ТБ,  4G серый космос', '42117', '1.0000', '274990.0000', '274990.0000', '0.0000', 0),
(91, 88, 74, 'Монитор игровой ASUS ROG Swift PG259QNR 24.5&quot; темно-серый', '42378', '1.0000', '113030.0000', '113030.0000', '0.0000', 0),
(90, 87, 74, 'Монитор игровой ASUS ROG Swift PG259QNR 24.5&quot; темно-серый', '42378', '1.0000', '113030.0000', '113030.0000', '0.0000', 0),
(88, 85, 74, 'Монитор игровой ASUS ROG Swift PG259QNR 24.5&quot; темно-серый', '42378', '1.0000', '113030.0000', '113030.0000', '0.0000', 0),
(84, 81, 75, 'Монитор игровой Acer CB382CURbmiiphuzx 37.5&quot; черный', '42379', '1.0000', '92040.0000', '92040.0000', '0.0000', 0),
(85, 82, 75, 'Монитор игровой Acer CB382CURbmiiphuzx 37.5&quot; черный', '42379', '1.0000', '92040.0000', '92040.0000', '0.0000', 0),
(82, 79, 3, 'Смартфон Apple iPhone 13 Pro 512Gb,  MLWA3RU/A,  серебристый', '42071', '1.0000', '112490.0000', '112490.0000', '0.0000', 0),
(89, 86, 74, 'Монитор игровой ASUS ROG Swift PG259QNR 24.5&quot; темно-серый', '42378', '1.0000', '113030.0000', '113030.0000', '0.0000', 0),
(81, 78, 3, 'Смартфон Apple iPhone 13 Pro 512Gb,  MLWA3RU/A,  серебристый', '42071', '1.0000', '112490.0000', '112490.0000', '0.0000', 0),
(163, 141, 21, 'Квадрокоптер DJI Mavic 3 Fly More Combo с камерой,  серый', '42165', '1.0000', '395991.2000', '395991.2000', '0.0000', 0),
(162, 140, 22, 'Квадрокоптер DJI AIR 2S Fly More Combo Smart Controller с камерой,  серый', '42166', '1.0000', '228791.2000', '228791.2000', '0.0000', 0),
(159, 139, 21, 'Квадрокоптер DJI Mavic 3 Fly More Combo с камерой,  серый', '42165', '1.0000', '395991.2000', '395991.2000', '0.0000', 0),
(160, 139, 22, 'Квадрокоптер DJI AIR 2S Fly More Combo Smart Controller с камерой,  серый', '42166', '1.0000', '228791.2000', '228791.2000', '0.0000', 0),
(161, 140, 21, 'Квадрокоптер DJI Mavic 3 Fly More Combo с камерой,  серый', '42165', '1.0000', '395991.2000', '395991.2000', '0.0000', 0),
(113, 108, 41, 'Беспроводное зарядное устройство Apple MagSafe Duo,  белый', '42231', '2.0000', '13990.0000', '27980.0000', '0.0000', 0),
(114, 109, 41, 'Беспроводное зарядное устройство Apple MagSafe Duo,  белый', '42231', '2.0000', '13990.0000', '27980.0000', '0.0000', 0),
(184, 155, 41, 'Беспроводное зарядное устройство Apple MagSafe Duo,  белый', '42231', '5.0000', '13990.0000', '69950.0000', '0.0000', 0),
(164, 141, 22, 'Квадрокоптер DJI AIR 2S Fly More Combo Smart Controller с камерой,  серый', '42166', '1.0000', '228791.2000', '228791.2000', '0.0000', 0),
(165, 142, 21, 'Квадрокоптер DJI Mavic 3 Fly More Combo с камерой,  серый', '42165', '1.0000', '395991.2000', '395991.2000', '0.0000', 0),
(166, 142, 22, 'Квадрокоптер DJI AIR 2S Fly More Combo Smart Controller с камерой,  серый', '42166', '1.0000', '228791.2000', '228791.2000', '0.0000', 0),
(167, 143, 21, 'Квадрокоптер DJI Mavic 3 Fly More Combo с камерой,  серый', '42165', '1.0000', '395991.2000', '395991.2000', '0.0000', 0),
(168, 143, 22, 'Квадрокоптер DJI AIR 2S Fly More Combo Smart Controller с камерой,  серый', '42166', '1.0000', '228791.2000', '228791.2000', '0.0000', 0),
(169, 144, 21, 'Квадрокоптер DJI Mavic 3 Fly More Combo с камерой,  серый', '42165', '1.0000', '395991.2000', '395991.2000', '0.0000', 0),
(170, 144, 22, 'Квадрокоптер DJI AIR 2S Fly More Combo Smart Controller с камерой,  серый', '42166', '1.0000', '228791.2000', '228791.2000', '0.0000', 0),
(174, 147, 24, 'Квадрокоптер AUTEL EVO Nano+ Standard Package MDA2 с камерой,  оранжевый', '42168', '1.0000', '70380.0000', '70380.0000', '0.0000', 0),
(175, 148, 24, 'Квадрокоптер AUTEL EVO Nano+ Standard Package MDA2 с камерой,  оранжевый', '42168', '1.0000', '70380.0000', '70380.0000', '0.0000', 0),
(176, 149, 24, 'Квадрокоптер AUTEL EVO Nano+ Standard Package MDA2 с камерой,  оранжевый', '42168', '1.0000', '70380.0000', '70380.0000', '0.0000', 0),
(178, 151, 41, 'Беспроводное зарядное устройство Apple MagSafe Duo,  белый', '42231', '5.0000', '13990.0000', '69950.0000', '0.0000', 0),
(179, 151, 45, 'Беспроводное зар./устр. Xiaomi 50W Wireless Charging Stand 3.25A (PD) универсальное черный/золотисты', '42235', '5.0000', '5100.0000', '25500.0000', '0.0000', 0),
(182, 153, 41, 'Беспроводное зарядное устройство Apple MagSafe Duo,  белый', '42231', '5.0000', '13990.0000', '69950.0000', '0.0000', 0),
(183, 154, 41, 'Беспроводное зарядное устройство Apple MagSafe Duo,  белый', '42231', '5.0000', '13990.0000', '69950.0000', '0.0000', 0),
(186, 157, 45, 'Беспроводное зар./устр. Xiaomi 50W Wireless Charging Stand 3.25A (PD) универсальное черный/золотисты', '42235', '1.0000', '4500.0000', '4500.0000', '0.0000', 0),
(187, 158, 18, 'Планшет Apple iPad Pro 2021 11&quot; 2Tb Wi-Fi MHR23RU/A,  16ГБ, 2ТБ серый космос', '42124', '1.0000', '159990.0000', '159990.0000', '0.0000', 0),
(188, 158, 45, 'Беспроводное зар./устр. Xiaomi 50W Wireless Charging Stand 3.25A (PD) универсальное черный/золотисты', '42235', '1.0000', '4500.0000', '4500.0000', '0.0000', 0),
(189, 159, 18, 'Планшет Apple iPad Pro 2021 11&quot; 2Tb Wi-Fi MHR23RU/A,  16ГБ, 2ТБ серый космос', '42124', '1.0000', '159990.0000', '159990.0000', '0.0000', 0),
(190, 159, 45, 'Беспроводное зар./устр. Xiaomi 50W Wireless Charging Stand 3.25A (PD) универсальное черный/золотисты', '42235', '1.0000', '4500.0000', '4500.0000', '0.0000', 0),
(191, 160, 18, 'Планшет Apple iPad Pro 2021 11&quot; 2Tb Wi-Fi MHR23RU/A,  16ГБ, 2ТБ серый космос', '42124', '1.0000', '159990.0000', '159990.0000', '0.0000', 0),
(192, 160, 45, 'Беспроводное зар./устр. Xiaomi 50W Wireless Charging Stand 3.25A (PD) универсальное черный/золотисты', '42235', '1.0000', '4500.0000', '4500.0000', '0.0000', 0),
(193, 161, 18, 'Планшет Apple iPad Pro 2021 11&quot; 2Tb Wi-Fi MHR23RU/A,  16ГБ, 2ТБ серый космос', '42124', '1.0000', '159990.0000', '159990.0000', '0.0000', 0),
(194, 161, 45, 'Беспроводное зар./устр. Xiaomi 50W Wireless Charging Stand 3.25A (PD) универсальное черный/золотисты', '42235', '1.0000', '4500.0000', '4500.0000', '0.0000', 0),
(195, 162, 18, 'Планшет Apple iPad Pro 2021 11&quot; 2Tb Wi-Fi MHR23RU/A,  16ГБ, 2ТБ серый космос', '42124', '1.0000', '159990.0000', '159990.0000', '0.0000', 0),
(196, 162, 45, 'Беспроводное зар./устр. Xiaomi 50W Wireless Charging Stand 3.25A (PD) универсальное черный/золотисты', '42235', '1.0000', '4500.0000', '4500.0000', '0.0000', 0),
(200, 164, 41, 'Беспроводное зарядное устройство Apple MagSafe Duo,  белый', '42231', '2.0000', '13990.0000', '27980.0000', '0.0000', 0),
(201, 165, 41, 'Беспроводное зарядное устройство Apple MagSafe Duo,  белый', '42231', '2.0000', '13990.0000', '27980.0000', '0.0000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring`
--

CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurring_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurring_frequency` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring_transaction`
--

CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_shipment`
--

CREATE TABLE `oc_order_shipment` (
  `order_shipment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `shipping_courier_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tracking_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_status`
--

CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'В обработке'),
(3, 1, 'Доставлено'),
(7, 1, 'Отменено'),
(5, 1, 'Сделка завершена'),
(8, 1, 'Возврат'),
(9, 1, 'Отмена и аннулирование'),
(10, 1, 'Неудавшийся'),
(11, 1, 'Возмещенный'),
(12, 1, 'Полностью измененный'),
(13, 1, 'Полный возврат'),
(1, 1, 'Ожидание'),
(15, 1, 'Обработано'),
(14, 1, 'Истекло'),
(2, 2, 'Processing'),
(8, 2, 'Denied'),
(11, 2, 'Refunded'),
(3, 2, 'Shipped'),
(10, 2, 'Failed'),
(1, 2, 'Pending'),
(9, 2, 'Canceled Reversal'),
(7, 2, 'Canceled'),
(12, 2, 'Reversed'),
(13, 2, 'Chargeback'),
(5, 2, 'Complete'),
(14, 2, 'Expired'),
(16, 1, 'Анулированный'),
(16, 2, 'Voided'),
(15, 2, 'Processed');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_total`
--

CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_order_total`
--

INSERT INTO `oc_order_total` (`order_total_id`, `order_id`, `code`, `title`, `value`, `sort_order`) VALUES
(148, 47, 'sub_total', 'Итого', '112490.0000', 1),
(150, 47, 'total', 'К оплате', '112490.0000', 9),
(149, 47, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(151, 48, 'sub_total', 'Итого', '112490.0000', 1),
(152, 48, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(153, 48, 'total', 'К оплате', '112490.0000', 9),
(159, 50, 'total', 'К оплате', '112490.0000', 9),
(158, 50, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(157, 50, 'sub_total', 'Итого', '112490.0000', 1),
(160, 51, 'sub_total', 'Итого', '112490.0000', 1),
(161, 51, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(162, 51, 'total', 'К оплате', '112490.0000', 9),
(166, 53, 'sub_total', 'Итого', '274990.0000', 1),
(167, 53, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(168, 53, 'total', 'К оплате', '274990.0000', 9),
(169, 54, 'sub_total', 'Итого', '274990.0000', 1),
(170, 54, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(171, 54, 'total', 'К оплате', '274990.0000', 9),
(172, 55, 'sub_total', 'Итого', '13990.0000', 1),
(173, 55, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(174, 55, 'total', 'К оплате', '13990.0000', 9),
(175, 56, 'sub_total', 'Итого', '13990.0000', 1),
(176, 56, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(177, 56, 'total', 'К оплате', '13990.0000', 9),
(181, 58, 'sub_total', 'Итого', '13990.0000', 1),
(182, 58, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(183, 58, 'total', 'К оплате', '13990.0000', 9),
(184, 59, 'sub_total', 'Итого', '70380.0000', 1),
(185, 59, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(186, 59, 'total', 'К оплате', '70380.0000', 9),
(187, 60, 'sub_total', 'Итого', '13990.0000', 1),
(188, 60, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(189, 60, 'total', 'К оплате', '13990.0000', 9),
(244, 78, 'shipping', 'Бесплатная доставка', '0.0000', 3),
(243, 78, 'sub_total', 'Итого', '112490.0000', 1),
(257, 82, 'total', 'К оплате', '92040.0000', 9),
(255, 82, 'sub_total', 'Итого', '92040.0000', 1),
(256, 82, 'shipping', 'Бесплатная доставка', '0.0000', 3),
(245, 78, 'total', 'К оплате', '112490.0000', 9),
(246, 79, 'sub_total', 'Итого', '112490.0000', 1),
(247, 79, 'shipping', 'Бесплатная доставка', '0.0000', 3),
(248, 79, 'total', 'К оплате', '112490.0000', 9),
(254, 81, 'total', 'К оплате', '92040.0000', 9),
(253, 81, 'shipping', 'Бесплатная доставка', '0.0000', 3),
(252, 81, 'sub_total', 'Итого', '92040.0000', 1),
(266, 85, 'total', 'К оплате', '113030.0000', 9),
(265, 85, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(264, 85, 'sub_total', 'Итого', '113030.0000', 1),
(267, 86, 'sub_total', 'Итого', '113030.0000', 1),
(268, 86, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(269, 86, 'total', 'К оплате', '113030.0000', 9),
(270, 87, 'sub_total', 'Итого', '113030.0000', 1),
(271, 87, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(272, 87, 'total', 'К оплате', '113030.0000', 9),
(273, 88, 'sub_total', 'Итого', '113030.0000', 1),
(274, 88, 'shipping', 'Бесплатная доставка', '0.0000', 3),
(275, 88, 'total', 'К оплате', '113030.0000', 9),
(310, 100, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(311, 100, 'total', 'К оплате', '159990.0000', 9),
(282, 91, 'sub_total', 'Итого', '274990.0000', 1),
(283, 91, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(284, 91, 'total', 'К оплате', '274990.0000', 9),
(309, 100, 'sub_total', 'Итого', '159990.0000', 1),
(433, 141, 'shipping', 'Доставка до адреса', '300.0000', 3),
(432, 141, 'sub_total', 'Итого', '624782.4000', 1),
(431, 140, 'total', 'К оплате', '625082.4000', 9),
(430, 140, 'shipping', 'Доставка до адреса', '300.0000', 3),
(429, 140, 'sub_total', 'Итого', '624782.4000', 1),
(428, 139, 'total', 'К оплате', '625082.4000', 9),
(426, 139, 'sub_total', 'Итого', '624782.4000', 1),
(427, 139, 'shipping', 'Доставка до адреса', '300.0000', 3),
(333, 108, 'sub_total', 'Итого', '27980.0000', 1),
(334, 108, 'shipping', 'Доставка до адреса', '300.0000', 3),
(335, 108, 'total', 'К оплате', '28280.0000', 9),
(336, 109, 'sub_total', 'Итого', '27980.0000', 1),
(337, 109, 'shipping', 'Доставка до адреса', '300.0000', 3),
(338, 109, 'total', 'К оплате', '28280.0000', 9),
(464, 151, 'total', 'К оплате', '95450.0000', 9),
(434, 141, 'total', 'К оплате', '625082.4000', 9),
(435, 142, 'sub_total', 'Итого', '624782.4000', 1),
(436, 142, 'shipping', 'Доставка до адреса', '300.0000', 3),
(437, 142, 'total', 'К оплате', '625082.4000', 9),
(438, 143, 'sub_total', 'Итого', '624782.4000', 1),
(439, 143, 'shipping', 'Доставка до адреса', '300.0000', 3),
(440, 143, 'total', 'К оплате', '625082.4000', 9),
(441, 144, 'sub_total', 'Итого', '624782.4000', 1),
(442, 144, 'shipping', 'Доставка до адреса', '300.0000', 3),
(443, 144, 'total', 'К оплате', '625082.4000', 9),
(450, 147, 'sub_total', 'Итого', '70380.0000', 1),
(451, 147, 'shipping', 'Доставка до адреса', '300.0000', 3),
(452, 147, 'total', 'К оплате', '70680.0000', 9),
(453, 148, 'sub_total', 'Итого', '70380.0000', 1),
(454, 148, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(455, 148, 'total', 'К оплате', '70380.0000', 9),
(456, 149, 'sub_total', 'Итого', '70380.0000', 1),
(457, 149, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(458, 149, 'total', 'К оплате', '70380.0000', 9),
(462, 151, 'sub_total', 'Итого', '95450.0000', 1),
(463, 151, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(468, 153, 'sub_total', 'Итого', '69950.0000', 1),
(469, 153, 'shipping', 'Доставка до адреса', '300.0000', 3),
(470, 153, 'total', 'К оплате', '70250.0000', 9),
(471, 154, 'sub_total', 'Итого', '69950.0000', 1),
(472, 154, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(473, 154, 'total', 'К оплате', '69950.0000', 9),
(474, 155, 'sub_total', 'Итого', '69950.0000', 1),
(475, 155, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(476, 155, 'total', 'К оплате', '69950.0000', 9),
(477, 156, 'sub_total', 'Итого', '69950.0000', 1),
(478, 156, 'shipping', 'Доставка до адреса', '300.0000', 3),
(479, 156, 'total', 'К оплате', '70250.0000', 9),
(480, 157, 'sub_total', 'Итого', '4500.0000', 1),
(481, 157, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(482, 157, 'total', 'К оплате', '4500.0000', 9),
(483, 158, 'sub_total', 'Итого', '164490.0000', 1),
(484, 158, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(485, 158, 'total', 'К оплате', '164490.0000', 9),
(486, 159, 'sub_total', 'Итого', '164490.0000', 1),
(487, 159, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(488, 159, 'total', 'К оплате', '164490.0000', 9),
(489, 160, 'sub_total', 'Итого', '164490.0000', 1),
(490, 160, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(491, 160, 'total', 'К оплате', '164490.0000', 9),
(492, 161, 'sub_total', 'Итого', '164490.0000', 1),
(493, 161, 'shipping', 'Доставка до адреса', '300.0000', 3),
(494, 161, 'total', 'К оплате', '164790.0000', 9),
(495, 162, 'sub_total', 'Итого', '164490.0000', 1),
(496, 162, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(497, 162, 'total', 'К оплате', '164490.0000', 9),
(501, 164, 'sub_total', 'Итого', '27980.0000', 1),
(502, 164, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(503, 164, 'total', 'К оплате', '27980.0000', 9),
(504, 165, 'sub_total', 'Итого', '27980.0000', 1),
(505, 165, 'shipping', 'Самовывоз из ПВЗ', '0.0000', 3),
(506, 165, 'total', 'К оплате', '27980.0000', 9);

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_voucher`
--

CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product`
--

CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL,
  `model` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `upc` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ean` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jan` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isbn` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mpn` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `quantity_class_id` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `redirect` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `noindex` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `quantity_class_id`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `redirect`, `status`, `viewed`, `date_added`, `date_modified`, `noindex`) VALUES
(1, '42069', '', '', '', '', '', '', '', '200.0000', 0, 5, 'catalog/demo/products/42069_0.jpg', 2, 1, '154990.0000', 0, 9, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 34, '2021-11-11 12:51:32', '2025-12-21 12:33:04', 1),
(2, '42070', '', '', '', '', '', '', '', '1.0000', 0, 5, 'catalog/demo/products/42070_0.jpg', 2, 1, '147940.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2021-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(3, '42071', '', '', '', '', '', '', '', '2.0000', 0, 5, 'catalog/demo/products/42071_0.jpg', 1, 1, '142490.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 19, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(4, '42072', '', '', '', '', '', '', '', '3.0000', 0, 5, 'catalog/demo/products/42072_0.jpg', 2, 1, '139990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(5, '42073', '', '', '', '', '', '', '', '4.0000', 0, 5, 'catalog/demo/products/42073_0.jpg', 2, 1, '139990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(6, '42074', '', '', '', '', '', '', '', '5.0000', 0, 5, 'catalog/demo/products/42074_0.jpg', 1, 1, '134990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 1, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(7, '42075', '', '', '', '', '', '', '', '6.0000', 1, 5, 'catalog/demo/products/42075_0.jpg', 1, 1, '129990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 211, '2022-11-11 12:51:32', '2025-12-03 15:08:18', 1),
(8, '42076', '', '', '', '', '', '', '', '7.0000', 0, 5, 'catalog/demo/products/42076_0.jpg', 2, 1, '128370.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 1, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(9, '42077', '', '', '', '', '', '', '', '8.0000', 0, 5, 'catalog/demo/products/42077_0.jpg', 2, 1, '124999.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(10, '42078', '', '', '', '', '', '', '', '9.0000', 0, 5, 'catalog/demo/products/42078_0.jpg', 2, 1, '124990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(11, '42117', '', '', '', '', '', '', '', '10.0000', 0, 5, 'catalog/demo/products/42117_0.jpg', 1, 1, '274990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 9, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(12, '42118', '', '', '', '', '', '', '', '11.0000', 0, 5, 'catalog/demo/products/42118_0.jpg', 1, 1, '201990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(13, '42119', '', '', '', '', '', '', '', '12.0000', 0, 5, 'catalog/demo/products/42119_0.jpg', 1, 1, '179990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(14, '42120', '', '', '', '', '', '', '', '13.0000', 0, 5, 'catalog/demo/products/42120_0.jpg', 1, 1, '179990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(15, '42121', '', '', '', '', '', '', '', '14.0000', 0, 5, 'catalog/demo/products/42121_0.jpg', 1, 1, '178990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(16, '42122', '', '', '', '', '', '', '', '15.0000', 0, 5, 'catalog/demo/products/42122_0.jpg', 1, 1, '165990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(17, '42123', '', '', '', '', '', '', '', '16.0000', 0, 5, 'catalog/demo/products/42123_0.jpg', 1, 1, '159990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(18, '42124', '', '', '', '', '', '', '', '17.0000', 0, 5, 'catalog/demo/products/42124_0.jpg', 1, 1, '159990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(19, '42125', '', '', '', '', '', '', '', '18.0000', 0, 5, 'catalog/demo/products/42125_0.jpg', 1, 1, '159990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(20, '42126', '', '', '', '', '', '', '', '19.0000', 0, 5, 'catalog/demo/products/42126_0.jpg', 1, 1, '154990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 18, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(21, '42165', '', '', '', '', '', '', '', '20.0000', 0, 5, 'catalog/demo/products/42165_0.jpg', 3, 1, '449990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 1, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(22, '42166', '', '', '', '', '', '', '', '21.0000', 0, 5, 'catalog/demo/products/42166_0.jpg', 3, 1, '259990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 16, '2022-11-11 12:51:32', '2025-11-27 19:02:33', 1),
(23, '42167', '', '', '', '', '', '', '', '22.0000', 0, 5, 'catalog/demo/products/42167_0.jpg', 0, 1, '118840.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 1, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(24, '42168', '', '', '', '', '', '', '', '23.0000', 0, 5, 'catalog/demo/products/42168_0.jpg', 0, 1, '70380.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(25, '42169', '', '', '', '', '', '', '', '24.0000', 0, 5, 'catalog/demo/products/42169_0.jpg', 0, 1, '8290.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 3, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(26, '42170', '', '', '', '', '', '', '', '25.0000', 0, 5, 'catalog/demo/products/42170_0.jpg', 0, 1, '5950.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(27, '42171', '', '', '', '', '', '', '', '26.0000', 0, 5, 'catalog/demo/products/42171_0.jpg', 0, 1, '5660.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(28, '42172', '', '', '', '', '', '', '', '27.0000', 0, 5, 'catalog/demo/products/42172_0.jpg', 0, 1, '5399.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(29, '42173', '', '', '', '', '', '', '', '28.0000', 0, 5, 'catalog/demo/products/42173_0.jpg', 0, 1, '5290.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(30, '42174', '', '', '', '', '', '', '', '0.0000', 0, 5, 'catalog/demo/products/42174_0.jpg', 0, 1, '4890.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(31, '42183', '', '', '', '', '', '', '', '1.0000', 0, 5, 'catalog/demo/products/42183_0.jpg', 0, 1, '47590.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(32, '42184', '', '', '', '', '', '', '', '2.0000', 0, 5, 'catalog/demo/products/42184_0.jpg', 0, 1, '37590.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(33, '42185', '', '', '', '', '', '', '', '3.0000', 0, 5, 'catalog/demo/products/42185_0.jpg', 0, 1, '35600.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(34, '42186', '', '', '', '', '', '', '', '4.0000', 0, 5, 'catalog/demo/products/42186_0.jpg', 0, 1, '29990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(35, '42187', '', '', '', '', '', '', '', '5.0000', 0, 5, 'catalog/demo/products/42187_0.jpg', 4, 1, '29990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 1, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(36, '42188', '', '', '', '', '', '', '', '6.0000', 0, 5, 'catalog/demo/products/42188_0.jpg', 0, 1, '28390.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 10, '2022-11-11 12:51:32', '2025-12-03 16:19:56', 1),
(37, '42189', '', '', '', '', '', '', '', '7.0000', 0, 5, 'catalog/demo/products/42189_0.jpg', 0, 1, '27570.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(38, '42190', '', '', '', '', '', '', '', '8.0000', 0, 5, 'catalog/demo/products/42190_0.jpg', 0, 1, '26490.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 4, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(39, '42191', '', '', '', '', '', '', '', '9.0000', 0, 5, 'catalog/demo/products/42191_0.jpg', 0, 1, '25190.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 4, '2022-11-11 12:51:32', '2025-12-03 16:30:07', 1),
(40, '42192', '', '', '', '', '', '', '', '10.0000', 0, 5, 'catalog/demo/products/42192_0.jpg', 0, 1, '23990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 3, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(41, '42231', '', '', '', '', '', '', '', '11.0000', 0, 5, 'catalog/demo/products/42231_0.jpg', 0, 1, '13990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '2.0000', 100, '', 1, 74, '2022-11-11 12:51:32', '2025-12-20 18:50:00', 1),
(42, '42232', '', '', '', '', '', '', '', '12.0000', 0, 5, 'catalog/demo/products/42232_0.jpg', 0, 1, '6590.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 1, '2022-11-11 12:51:32', '2025-12-22 16:12:33', 1),
(43, '42233', '', '', '', '', '', '', '', '13.0000', 0, 5, 'catalog/demo/products/42233_0.jpg', 0, 1, '5990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 5, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(44, '42234', '', '', '', '', '', '', '', '14.0000', 0, 5, 'catalog/demo/products/42234_0.jpg', 0, 1, '5890.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 1, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(45, '42235', '', '', '', '', '', '', '', '15.0000', 0, 5, 'catalog/demo/products/42235_0.jpg', 0, 1, '5230.0000', 0, 9, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 657, '2022-11-11 12:51:32', '2025-12-22 13:48:36', 1),
(46, '42236', '', '', '', '', '', '', '', '16.0000', 0, 5, 'catalog/demo/products/42236_0.jpg', 0, 1, '4990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(47, '42237', '', '', '', '', '', '', '', '17.0000', 0, 5, 'catalog/demo/products/42237_0.jpg', 0, 1, '4990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:32', '2022-11-14 16:15:51', 1),
(48, '42238', '', '', '', '', '', '', '', '18.0000', 0, 5, 'catalog/demo/products/42238_0.jpg', 1, 1, '4990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 5, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(49, '42239', '', '', '', '', '', '', '', '19.0000', 0, 5, 'catalog/demo/products/42239_0.jpg', 2, 1, '4890.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(50, '42240', '', '', '', '', '', '', '', '20.0000', 0, 5, 'catalog/demo/products/42240_0.jpg', 2, 1, '4890.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(51, '42279', '', '', '', '', '', '', '', '21.0000', 0, 5, 'catalog/demo/products/42279_0.jpg', 5, 1, '402990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(52, '42280', '', '', '', '', '', '', '', '22.0000', 0, 5, 'catalog/demo/products/42280_0.jpg', 1, 1, '334990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 5, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(53, '42281', '', '', '', '', '', '', '', '23.0000', 0, 5, 'catalog/demo/products/42281_0.jpg', 5, 1, '329990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(54, '42282', '', '', '', '', '', '', '', '24.0000', 0, 5, 'catalog/demo/products/42282_0.jpg', 5, 1, '321990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(55, '42283', '', '', '', '', '', '', '', '25.0000', 0, 5, 'catalog/demo/products/42283_0.jpg', 1, 1, '299990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(56, '42284', '', '', '', '', '', '', '', '26.0000', 0, 5, 'catalog/demo/products/42284_0.jpg', 1, 1, '299990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 1, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(57, '42285', '', '', '', '', '', '', '', '27.0000', 0, 5, 'catalog/demo/products/42285_0.jpg', 5, 1, '298990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(58, '42287', '', '', '', '', '', '', '', '28.0000', 0, 5, 'catalog/demo/products/42287_0.jpg', 5, 1, '249990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(59, '42288', '', '', '', '', '', '', '', '29.0000', 0, 5, 'catalog/demo/products/42288_0.jpg', 1, 1, '234990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(60, '42289', '', '', '', '', '', '', '', '0.0000', 0, 5, 'catalog/demo/products/42289_0.jpg', 1, 1, '234990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 2, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(61, '42327', '', '', '', '', '', '', '', '1.0000', 0, 5, 'catalog/demo/products/42327_0.jpg', 0, 1, '151990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(62, '42328', '', '', '', '', '', '', '', '2.0000', 0, 5, 'catalog/demo/products/42328_0.jpg', 0, 1, '104990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(63, '42329', '', '', '', '', '', '', '', '3.0000', 0, 5, 'catalog/demo/products/42329_0.jpg', 0, 1, '99680.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 66, '2022-11-11 12:51:33', '2025-12-04 09:08:17', 1),
(64, '42330', '', '', '', '', '', '', '', '4.0000', 0, 5, 'catalog/demo/products/42330_0.jpg', 0, 1, '93990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(65, '42333', '', '', '', '', '', '', '', '5.0000', 0, 5, 'catalog/demo/products/42333_0.jpg', 0, 1, '79990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(66, '42335', '', '', '', '', '', '', '', '6.0000', 0, 5, 'catalog/demo/products/42335_0.jpg', 0, 1, '73990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 2, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(67, '42338', '', '', '', '', '', '', '', '7.0000', 0, 5, 'catalog/demo/products/42338_0.jpg', 0, 1, '72990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 1, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(68, '42339', '', '', '', '', '', '', '', '8.0000', 0, 5, 'catalog/demo/products/42339_0.jpg', 0, 1, '71060.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 10, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(69, '42340', '', '', '', '', '', '', '', '9.0000', 0, 5, 'catalog/demo/products/42340_0.jpg', 0, 1, '69990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(70, '42342', '', '', '', '', '', '', '', '10.0000', 0, 5, 'catalog/demo/products/42342_0.jpg', 0, 1, '67990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(71, '42375', '', '', '', '', '', '', '', '11.0000', 0, 5, 'catalog/demo/products/42375_0.jpg', 0, 1, '409030.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 3, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(72, '42376', '', '', '', '', '', '', '', '12.0000', 0, 5, 'catalog/demo/products/42376_0.jpg', 0, 1, '137790.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 2, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(73, '42377', '', '', '', '', '', '', '', '13.0000', 0, 5, 'catalog/demo/products/42377_0.jpg', 0, 1, '119120.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 1, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(74, '42378', '', '', '', '', '', '', '', '14.0000', 0, 5, 'catalog/demo/products/42378_0.jpg', 0, 1, '113030.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 4, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(75, '42379', '', '', '', '', '', '', '', '15.0000', 0, 5, 'catalog/demo/products/42379_0.jpg', 0, 1, '92040.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 15, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(76, '42380', '', '', '', '', '', '', '', '16.0000', 0, 5, 'catalog/demo/products/42380_0.jpg', 4, 1, '89690.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(77, '42381', '', '', '', '', '', '', '', '17.0000', 0, 5, 'catalog/demo/products/42381_0.jpg', 4, 1, '86800.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(78, '42382', '', '', '', '', '', '', '', '18.0000', 0, 5, 'catalog/demo/products/42382_0.jpg', 0, 1, '85030.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(79, '42383', '', '', '', '', '', '', '', '19.0000', 0, 5, 'catalog/demo/products/42383_0.jpg', 0, 1, '81360.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(80, '42384', '', '', '', '', '', '', '', '20.0000', 0, 5, 'catalog/demo/products/42384_0.jpg', 0, 1, '79800.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(81, '42423', '', '', '', '', '', '', '', '21.0000', 0, 5, 'catalog/demo/products/42423_0.jpg', 0, 1, '404000.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(82, '42424', '', '', '', '', '', '', '', '22.0000', 0, 5, 'catalog/demo/products/42424_0.jpg', 0, 1, '194680.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(83, '42425', '', '', '', '', '', '', '', '23.0000', 0, 5, 'catalog/demo/products/42425_0.jpg', 0, 1, '187840.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(84, '42426', '', '', '', '', '', '', '', '24.0000', 0, 5, 'catalog/demo/products/42426_0.jpg', 0, 1, '119110.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(85, '42427', '', '', '', '', '', '', '', '25.0000', 0, 5, 'catalog/demo/products/42427_0.jpg', 0, 1, '108990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(86, '42428', '', '', '', '', '', '', '', '26.0000', 0, 5, 'catalog/demo/products/42428_0.jpg', 0, 1, '99790.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(87, '42429', '', '', '', '', '', '', '', '27.0000', 0, 5, 'catalog/demo/products/42429_0.jpg', 0, 1, '98990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(88, '42430', '', '', '', '', '', '', '', '28.0000', 0, 5, 'catalog/demo/products/42430_0.jpg', 0, 1, '94990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(89, '42431', '', '', '', '', '', '', '', '29.0000', 0, 5, 'catalog/demo/products/42431_0.jpg', 0, 1, '94290.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(90, '42432', '', '', '', '', '', '', '', '30.0000', 0, 5, 'catalog/demo/products/42432_0.jpg', 0, 1, '92990.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(91, '42471', '', '', '', '', '', '', '', '31.0000', 0, 5, 'catalog/demo/products/42471_0.jpg', 0, 1, '17789.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(92, '42472', '', '', '', '', '', '', '', '32.0000', 1, 5, 'catalog/demo/products/42472_0.jpg', 0, 1, '15299.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 11, '2022-11-11 12:51:33', '2025-12-04 11:22:21', 1),
(93, '42473', '', '', '', '', '', '', '', '33.0000', 0, 5, 'catalog/demo/products/42473_0.jpg', 0, 1, '15199.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 17, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(94, '42474', '', '', '', '', '', '', '', '0.0000', 0, 5, 'catalog/demo/products/42474_0.jpg', 0, 1, '0.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 1, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(95, '42475', '', '', '', '', '', '', '', '1.0000', 0, 5, 'catalog/demo/products/42475_0.jpg', 0, 1, '11885.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 1, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(96, '42476', '', '', '', '', '', '', '', '2.0000', 0, 5, 'catalog/demo/products/42476_0.jpg', 0, 1, '11649.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(97, '42477', '', '', '', '', '', '', '', '3.0000', 0, 5, 'catalog/demo/products/42477_0.jpg', 0, 1, '11499.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(98, '42478', '', '', '', '', '', '', '', '4.0000', 0, 5, 'catalog/demo/products/42478_0.jpg', 0, 1, '10489.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 1, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(99, '42479', '', '', '', '', '', '', '', '5.0000', 0, 5, 'catalog/demo/products/42479_0.jpg', 0, 1, '10399.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1),
(100, '42480', '', '', '', '', '', '', '', '6.0000', 0, 5, 'catalog/demo/products/42480_0.jpg', 0, 1, '9750.0000', 0, 0, '2022-11-11 00:00:00', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, '1.0000', 100, '', 1, 0, '2022-11-11 12:51:33', '2022-11-14 16:15:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_attribute`
--

CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_product_attribute`
--

INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(1, 4, 1, '4400мAч'),
(6, 3, 2, '12GB RAM, 256GB storage'),
(1, 5, 1, '3G 4G 5G'),
(6, 2, 2, 'Snapdragon 8 Gen1, 3000MHz, 8-core'),
(2, 1, 1, '7.6\", AMOLED, 2176x1812,'),
(2, 2, 1, 'Snapdragon 8 Plus Gen 1, 3180МГц, 8'),
(2, 3, 1, 'оперативная 12ГБ, встроенная 512ГБ,'),
(2, 4, 1, '4400мAч'),
(2, 5, 1, '3G 4G 5G'),
(2, 6, 1, 'торцевой'),
(2, 7, 1, '130.1 х 155.1 х 6.3 мм'),
(3, 1, 1, '6.1\", OLED, 2532x1170, 460PPI'),
(3, 2, 1, 'Apple A15 Bionic, 6'),
(3, 3, 1, 'оперативная 6ГБ, встроенная 512ГБ,'),
(3, 5, 1, '3G 4G 5G'),
(3, 7, 1, '71.5 х 146.7 х 7.65 мм'),
(4, 1, 1, '7.6\", AMOLED, 2176x1812,'),
(4, 2, 1, 'Snapdragon 8 Plus Gen 1, 3180МГц, 8'),
(4, 3, 1, 'оперативная 12ГБ, встроенная 512ГБ,'),
(4, 4, 1, '4400мAч'),
(4, 5, 1, '3G 4G 5G'),
(4, 6, 1, 'торцевой'),
(4, 7, 1, '130.1 х 155.1 х 6.3 мм'),
(5, 1, 1, '7.6\", Dynamic AMOLED 2X, 2176x1812,'),
(5, 2, 1, 'Qualcomm Snapdragon 8 Plus Gen 1, 3180МГц, 8'),
(5, 3, 1, 'оперативная 12ГБ, встроенная 512ГБ,'),
(5, 4, 1, '4400мAч'),
(5, 5, 1, '3G 4G 5G'),
(5, 6, 1, 'торцевой'),
(5, 7, 1, '130.1 х 155.1 х 6.3 мм'),
(6, 1, 1, '6.73\", AMOLED, 3200x1440, 522PPI'),
(6, 2, 1, 'Snapdragon 8 Gen1, 3000МГц, 8'),
(6, 3, 1, 'оперативная 12ГБ, встроенная 256ГБ,'),
(6, 4, 1, '4600мAч'),
(6, 5, 1, '3G 4G 5G'),
(6, 6, 1, 'подэкранный'),
(6, 7, 1, '74.6 х 163.6 х 8.2 мм'),
(8, 1, 1, '7.6\", AMOLED, 2176x1812,'),
(8, 2, 1, 'Snapdragon 8 Plus Gen 1, 3180МГц, 8'),
(8, 3, 1, 'оперативная 12ГБ, встроенная 256ГБ,'),
(8, 4, 1, '4400мAч'),
(8, 5, 1, '3G 4G 5G'),
(8, 6, 1, 'торцевой'),
(8, 7, 1, '130.1 х 155.1 х 6.3 мм'),
(9, 1, 1, '7.6\", AMOLED, 2176x1812,'),
(9, 2, 1, 'Snapdragon 8 Plus Gen 1, 3180МГц, 8'),
(9, 3, 1, 'оперативная 12ГБ, встроенная 256ГБ,'),
(9, 4, 1, '4400мAч'),
(9, 5, 1, '3G 4G 5G'),
(9, 6, 1, 'торцевой'),
(9, 7, 1, '130.1 х 155.1 х 6.3 мм'),
(10, 1, 1, '7.6\", AMOLED, 2176x1812,'),
(10, 2, 1, 'Snapdragon 8 Plus Gen 1, 3180МГц, 8'),
(10, 3, 1, 'оперативная 12ГБ, встроенная 256ГБ,'),
(10, 4, 1, '4400мAч'),
(10, 5, 1, '3G 4G 5G'),
(10, 6, 1, 'торцевой'),
(10, 7, 1, '130.1 х 155.1 х 6.3 мм'),
(11, 1, 1, '11\" (27.94 см), 2388 x 1668, IPS, 264PPI,'),
(11, 2, 1, 'Apple  M1 , восьмиядерный,'),
(11, 3, 1, '16384 Мб, LPDDR4x/ 2ТБ,'),
(11, 8, 1, 'основная 12Мп, фронтальная 12Мп,'),
(11, 9, 1, 'GPS, ГЛОНАСС,'),
(11, 10, 1, 'iOS,'),
(11, 4, 1, 'Li-Pol,'),
(12, 1, 1, '12.9\" (32.7см), 2732 x 2048, IPS, 264PPI,'),
(12, 2, 1, 'Apple  M1 , восьмиядерный,'),
(12, 3, 1, '16384 Мб, LPDDR4x/ 2ТБ,'),
(12, 8, 1, 'основная 12Мп, фронтальная 12Мп,'),
(12, 10, 1, 'iOS,'),
(12, 4, 1, 'Li-Pol,'),
(13, 1, 1, '12.9\" (32.7см), 2732 x 2048, IPS, 264PPI,'),
(13, 2, 1, 'Apple  M1 , восьмиядерный,'),
(13, 3, 1, '16384 Мб, LPDDR4x/ 1ТБ,'),
(13, 8, 1, 'основная 12Мп, фронтальная 12Мп,'),
(13, 10, 1, 'iOS,'),
(13, 4, 1, 'Li-Pol,'),
(14, 1, 1, '12.9\" (32.7см), 2732 x 2048, IPS, 264PPI,'),
(14, 2, 1, 'Apple  M1 , восьмиядерный,'),
(14, 3, 1, '16384 Мб, LPDDR4x/ 2ТБ,'),
(14, 8, 1, 'основная 12Мп, фронтальная 12Мп,'),
(14, 10, 1, 'iOS,'),
(14, 4, 1, 'Li-Pol,'),
(15, 1, 1, '12.9\" (32.7см), 2732 x 2048, IPS, 264PPI,'),
(15, 2, 1, 'Apple  M1 , восьмиядерный,'),
(15, 3, 1, '16384 Мб, LPDDR4x/ 2ТБ,'),
(15, 8, 1, 'основная 12Мп, фронтальная 12Мп,'),
(15, 10, 1, 'iOS,'),
(15, 4, 1, 'Li-Pol,'),
(16, 1, 1, '12.9\" (32.7см), 2732 x 2048, IPS, 264PPI,'),
(16, 2, 1, 'Apple  M1 , восьмиядерный,'),
(16, 3, 1, '8192 Мб, LPDDR4x/ 512ГБ,'),
(16, 8, 1, 'основная 12Мп, фронтальная 12Мп,'),
(16, 10, 1, 'iOS,'),
(16, 4, 1, 'Li-Pol,'),
(17, 1, 1, '11\" (27.94 см), 2388 x 1668, IPS, 264PPI,'),
(17, 2, 1, 'Apple  M1 , восьмиядерный,'),
(17, 3, 1, '16384 Мб, LPDDR4x/ 2ТБ,'),
(17, 8, 1, 'основная 12Мп, фронтальная 12Мп,'),
(17, 10, 1, 'iOS,'),
(17, 4, 1, 'Li-Pol,'),
(18, 1, 1, '11\" (27.94 см), 2388 x 1668, IPS, 264PPI,'),
(18, 2, 1, 'Apple  M1 , восьмиядерный,'),
(18, 3, 1, '16384 Мб, LPDDR4x/ 2ТБ,'),
(18, 8, 1, 'основная 12Мп, фронтальная 12Мп,'),
(18, 10, 1, 'iOS,'),
(18, 4, 1, 'Li-Pol,'),
(19, 1, 1, '12.9\" (32.7см), 2732 x 2048, IPS, 264PPI,'),
(19, 2, 1, 'Apple  M1 , восьмиядерный,'),
(19, 3, 1, '16384 Мб, LPDDR4x/ 1ТБ,'),
(19, 8, 1, 'основная 12Мп, фронтальная 12Мп,'),
(19, 10, 1, 'iOS,'),
(19, 4, 1, 'Li-Pol,'),
(20, 1, 1, '11\" (27.94 см), 2388 x 1668, IPS, 264PPI,'),
(20, 2, 1, 'Apple  M1 , восьмиядерный,'),
(20, 3, 1, '16384 Мб, LPDDR4x/ 1ТБ,'),
(20, 8, 1, 'основная 12Мп, фронтальная 12Мп,'),
(20, 10, 1, 'iOS,'),
(20, 4, 1, 'Li-Pol,'),
(21, 11, 1, '4'),
(21, 12, 1, '21 метр/сек'),
(21, 13, 1, '5120 х  2700'),
(22, 12, 1, '19 метр/сек'),
(22, 11, 1, '4'),
(23, 11, 1, '4'),
(23, 12, 1, '18 метр/сек'),
(23, 13, 1, '5472 х  3076'),
(24, 12, 1, '15 метр/сек'),
(24, 13, 1, '3840 х  2160'),
(25, 11, 1, '4'),
(25, 13, 1, '1280 х  720'),
(26, 11, 1, '4'),
(27, 11, 1, '4'),
(27, 12, 1, '2 метр/сек'),
(28, 11, 1, '4'),
(28, 13, 1, '640 х  480'),
(29, 11, 1, '4'),
(29, 13, 1, '640 х  480'),
(30, 11, 1, '4'),
(31, 14, 1, 'от 3 Гц до 40 кГц'),
(31, 15, 1, 'вкладыши'),
(31, 16, 1, 'закрытые'),
(31, 17, 1, 'проводные,'),
(32, 14, 1, 'от 5 Гц до 40 кГц'),
(32, 18, 1, '32Ом'),
(32, 15, 1, 'накладные'),
(32, 16, 1, 'закрытые'),
(32, 17, 1, 'проводные,'),
(33, 14, 1, 'от 10 Гц до 20 кГц'),
(33, 18, 1, '16Ом'),
(33, 15, 1, 'вкладыши'),
(33, 16, 1, 'закрытые'),
(33, 17, 1, 'беспроводные bluetooth,'),
(33, 19, 1, 'на шейном ободе, от 100 Гц до 10 кГц,'),
(34, 14, 1, 'от 15 Гц до 40 кГц'),
(34, 18, 1, '16Ом'),
(34, 15, 1, 'вкладыши'),
(34, 16, 1, 'закрытые'),
(34, 17, 1, 'проводные,'),
(35, 14, 1, 'от 7 Гц до 40 кГц'),
(35, 18, 1, '16Ом'),
(35, 15, 1, 'мониторные'),
(35, 16, 1, 'закрытые'),
(35, 17, 1, 'беспроводные bluetooth,'),
(35, 19, 1, 'встроенный,'),
(36, 17, 1, 'беспроводные bluetooth,'),
(6, 1, 2, '6.73\", AMOLED, 3200x1440, 522PPI'),
(36, 16, 1, 'закрытые'),
(36, 15, 1, 'накладные'),
(37, 14, 1, 'от 5 Гц до 40 кГц'),
(37, 18, 1, '48Ом'),
(37, 15, 1, 'накладные'),
(37, 16, 1, 'закрытые'),
(37, 17, 1, 'проводные,'),
(38, 14, 1, 'от 7 Гц до 40 кГц'),
(38, 18, 1, '48Ом'),
(38, 15, 1, 'накладные'),
(38, 16, 1, 'закрытые'),
(38, 17, 1, 'беспроводные bluetooth,'),
(38, 19, 1, 'встроенный,'),
(5, 7, 2, '130.1 x 155.1 x 6.3 mm'),
(39, 16, 1, 'закрытые'),
(5, 6, 2, 'side-mounted'),
(39, 17, 1, 'проводные,'),
(40, 15, 1, 'внутриканальные'),
(40, 16, 1, 'закрытые'),
(40, 17, 1, 'беспроводные bluetooth, True Wireless,'),
(40, 19, 1, 'встроенный,'),
(41, 20, 1, 'от порта USB'),
(42, 21, 1, 'черный'),
(43, 24, 1, 'USB-C'),
(43, 20, 1, 'от бытовой сети'),
(43, 23, 1, '5A,'),
(43, 21, 1, 'серый'),
(44, 24, 1, 'USB type-C'),
(44, 20, 1, 'от бытовой сети'),
(44, 23, 1, '3A,'),
(44, 21, 1, 'черный'),
(44, 22, 1, 'data-кабель в комплекте'),
(5, 5, 2, '3G 4G 5G'),
(46, 24, 1, '2xUSB-A + 2xUSB-C'),
(46, 20, 1, 'от бытовой сети'),
(46, 23, 1, '1.5A, 3A, 5A, 2.5A,'),
(46, 21, 1, 'белый'),
(47, 24, 1, 'USB type-C'),
(47, 20, 1, 'от бытовой сети'),
(47, 23, 1, '3A,'),
(47, 21, 1, 'серый'),
(47, 22, 1, 'data-кабель в комплекте'),
(48, 25, 1, 'USB type-C'),
(48, 20, 1, 'от порта USB'),
(48, 21, 1, 'белый'),
(49, 24, 1, 'USB type-C'),
(49, 25, 1, 'USB'),
(49, 20, 1, 'от порта USB'),
(49, 23, 1, '2.77A,'),
(49, 21, 1, 'белый'),
(50, 24, 1, 'USB type-C'),
(50, 25, 1, 'USB'),
(50, 20, 1, 'от порта USB'),
(50, 23, 1, '2.77A,'),
(50, 21, 1, 'черный'),
(51, 1, 1, '17.3\" 3840х2160 IPS'),
(51, 2, 1, 'Intel  Core i9  12900HX 2.3 ГГц (5.0 ГГц, в режиме Turbo)'),
(51, 26, 1, 'NVIDIA GeForce  RTX A5500 - 16384 Мб'),
(51, 27, 1, '64ГБ DDR5'),
(51, 28, 1, 'SSD 2048 ГБ'),
(51, 10, 1, 'Windows 11 Professional'),
(51, 29, 1, 'с русскими буквами'),
(52, 1, 1, '16.2\" 3456х2234'),
(52, 2, 1, 'Apple  M1 Max  10 core'),
(52, 27, 1, '32ГБ'),
(52, 28, 1, 'SSD 1024 ГБ'),
(52, 10, 1, 'Mac OS'),
(52, 29, 1, 'с русскими буквами'),
(53, 1, 1, '17.3\" 3840х2160 IPS'),
(53, 2, 1, 'Intel  Core i9  12900HX 2.3 ГГц (5.0 ГГц, в режиме Turbo)'),
(53, 26, 1, 'NVIDIA GeForce  RTX A3000 - 12288 Мб'),
(53, 27, 1, '64ГБ DDR5'),
(53, 28, 1, 'SSD 2048 ГБ'),
(53, 10, 1, 'Windows 11 Professional'),
(53, 29, 1, 'с русскими буквами'),
(54, 1, 1, '16\" 2560х1600 IPS'),
(54, 2, 1, 'Intel  Core i9  12900H 3.8 ГГц (5.0 ГГц, в режиме Turbo)'),
(54, 26, 1, 'NVIDIA GeForce  RTX 3080 Ti для ноутбуков - 16384 Мб'),
(54, 27, 1, '32ГБ DDR5 4800МГц'),
(54, 28, 1, 'SSD 2048 ГБ'),
(54, 10, 1, 'Windows 11 Home'),
(54, 29, 1, 'с русскими буквами'),
(55, 1, 1, '14.2\" 3024х1964'),
(55, 2, 1, 'Apple  M1 Max  10 core'),
(55, 27, 1, '32ГБ'),
(55, 28, 1, 'SSD 1024 ГБ'),
(55, 10, 1, 'Mac OS'),
(55, 29, 1, 'с русскими буквами'),
(56, 1, 1, '16.2\" 3456х2234'),
(56, 2, 1, 'Apple  M1 Max  10 core'),
(56, 27, 1, '32ГБ'),
(56, 28, 1, 'SSD 1024 ГБ'),
(56, 10, 1, 'Mac OS'),
(56, 29, 1, 'только с латинскими буквами'),
(57, 1, 1, '17.3\" 2560х1440 IPS'),
(57, 2, 1, 'Intel  Core i7  12800HX 2.0 ГГц (4.8 ГГц, в режиме Turbo)'),
(57, 26, 1, 'NVIDIA GeForce  RTX 3080 Ti для ноутбуков - 16384 Мб'),
(57, 27, 1, '32ГБ DDR5'),
(57, 28, 1, 'SSD 2048 ГБ'),
(57, 10, 1, 'Windows 11 Home'),
(57, 29, 1, 'с русскими буквами'),
(58, 1, 1, '16\" 2560х1600 IPS'),
(58, 2, 1, 'Intel  Core i7  12700H 2.3 ГГц (4.7 ГГц, в режиме Turbo)'),
(58, 26, 1, 'NVIDIA GeForce  RTX A3000 - 12288 Мб'),
(58, 27, 1, '32ГБ DDR5 4800МГц'),
(58, 28, 1, 'SSD 1024 ГБ'),
(58, 10, 1, 'Windows 11 Professional'),
(58, 29, 1, 'с русскими буквами'),
(59, 1, 1, '16.2\" 3456х2234'),
(59, 2, 1, 'Apple  M1 Pro  10 core'),
(59, 27, 1, '16ГБ SMA'),
(59, 28, 1, 'SSD 512 ГБ'),
(59, 10, 1, 'Mac OS'),
(59, 29, 1, 'с русскими буквами'),
(60, 1, 1, '16.2\" 3456х2234'),
(60, 2, 1, 'Apple  M1 Pro  10 core'),
(60, 27, 1, '16ГБ'),
(60, 28, 1, 'SSD 512 ГБ'),
(60, 10, 1, 'Mac OS'),
(60, 29, 1, 'с русскими буквами'),
(61, 1, 1, '23.8\", 1920 х 1080 Web-камера'),
(61, 2, 1, 'Intel Core i5 11500, 2.7 ГГц (4.6 ГГц, в режиме Turbo)'),
(61, 27, 1, '8 ГБ, DDR4, SO-DIMM, 3200 МГц'),
(61, 30, 1, 'Intel UHD Graphics 750'),
(61, 31, 1, 'SSD: 512 ГБ'),
(61, 32, 1, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(61, 10, 1, 'Windows 10 Professional'),
(62, 1, 1, '21.5\", 1920 х 1080 Web-камера'),
(62, 2, 1, 'Intel Core i5 7360U, 2.3 ГГц (3.6 ГГц, в режиме Turbo)'),
(62, 27, 1, '8 ГБ, DDR4, 2133 МГц'),
(62, 30, 1, 'Intel Iris Plus Graphics 640'),
(62, 31, 1, 'SSD: 256 ГБ'),
(62, 32, 1, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(62, 10, 1, 'macOS'),
(5, 4, 2, '4400mAh'),
(63, 27, 1, '8 ГБ, DDR4, SO-DIMM, 2666 МГц'),
(63, 30, 1, 'Intel UHD Graphics 630'),
(5, 3, 2, '12GB RAM, 512GB storage'),
(63, 31, 1, 'SSD: 1000 ГБ'),
(63, 32, 1, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(64, 1, 1, '23.8\", 1920 х 1080 Web-камера'),
(64, 2, 1, 'Intel Core i5 1035G1, 1 ГГц (3.6 ГГц, в режиме Turbo)'),
(64, 27, 1, '8 ГБ, DDR4, SO-DIMM, 3200 МГц'),
(64, 30, 1, 'Intel UHD Graphics'),
(64, 31, 1, 'SSD: 512 ГБ оптический привод: DVD-RW'),
(64, 32, 1, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(64, 10, 1, 'Windows 10 Professional'),
(65, 1, 1, '23.8\", 1920 х 1080 Web-камера'),
(65, 2, 1, 'Intel Core i5 1035G1, 1 ГГц (3.6 ГГц, в режиме Turbo)'),
(65, 27, 1, '8 ГБ, DDR4, SO-DIMM, 3200 МГц'),
(65, 30, 1, 'Intel UHD Graphics'),
(65, 31, 1, 'SSD: 512 ГБ оптический привод: DVD-RW'),
(65, 32, 1, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(65, 10, 1, 'noOS'),
(66, 1, 1, '23.8\", 1920 х 1080 Web-камера'),
(66, 2, 1, 'Intel Core i3 1115G4, 3 ГГц (4.1 ГГц, в режиме Turbo)'),
(66, 27, 1, '8 ГБ, DDR4, SO-DIMM'),
(66, 30, 1, 'Intel UHD Graphics'),
(66, 31, 1, 'SSD: 512 ГБ'),
(66, 32, 1, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(66, 10, 1, 'Windows 11 Home'),
(67, 1, 1, '23.8\", 1920 х 1080 Web-камера'),
(67, 2, 1, 'Intel Core i3 1115G4, 3 ГГц (4.1 ГГц, в режиме Turbo)'),
(67, 27, 1, '8 ГБ, DDR4, SO-DIMM'),
(67, 30, 1, 'Intel UHD Graphics'),
(67, 31, 1, 'SSD: 256 ГБ'),
(67, 32, 1, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(67, 10, 1, 'Windows 10 Professional'),
(68, 1, 1, '23.8\", 1920 х 1080 Web-камера'),
(68, 2, 1, 'Intel Core i3 1115G4, 3 ГГц (4.1 ГГц, в режиме Turbo)'),
(68, 27, 1, '8 ГБ, DDR4, SO-DIMM, 3200 МГц'),
(68, 30, 1, 'Intel UHD Graphics'),
(68, 31, 1, 'SSD: 256 ГБ'),
(68, 32, 1, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(68, 10, 1, 'Windows 11 Home'),
(69, 1, 1, '23.8\", 1920 х 1080 Web-камера'),
(69, 2, 1, 'Intel Core i3 1005G1, 1.2 ГГц (3.4 ГГц, в режиме Turbo)'),
(69, 27, 1, '8 ГБ, DDR4, SO-DIMM, 3200 МГц'),
(69, 30, 1, 'Intel UHD Graphics'),
(69, 31, 1, 'SSD: 256 ГБ'),
(69, 32, 1, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(69, 10, 1, 'Windows 10 Professional'),
(70, 1, 1, '23.8\", 1920 х 1080 Web-камера'),
(70, 2, 1, 'Intel Core i3 10105, 3.7 ГГц (4.4 ГГц, в режиме Turbo)'),
(70, 27, 1, '8 ГБ, DDR4, SO-DIMM, 2666 МГц'),
(70, 30, 1, 'Intel UHD Graphics 630'),
(70, 31, 1, 'SSD: 256 ГБ'),
(70, 32, 1, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(70, 10, 1, 'noOS'),
(71, 1, 1, '31.5\", 3840x2160, 16:9, IPS, 60Гц, 1000кд/м2, GTG 6мс,'),
(71, 33, 1, 'статическая 1300:1, динамическая 1000000:1,'),
(71, 34, 1, 'Display Port х 1шт, HDMI х 2, Thunderbolt,'),
(71, 35, 1, 'внутренний'),
(71, 36, 1, 'регулировка высоты, регулировка наклона, поворот экрана, крепление VESA 100х100,'),
(72, 1, 1, '43\", 3840x2160, 16:9, VA, 120Гц, 600кд/м2, GTG 4мс, AMD FreeSync,'),
(72, 33, 1, 'статическая 4000:1, динамическая 50000:1,'),
(72, 34, 1, 'Display Port х 1шт, HDMI х 3,'),
(72, 37, 1, 'встроенные динамики,'),
(72, 35, 1, 'внешний'),
(72, 36, 1, 'регулировка наклона, крепление VESA 100х100,'),
(73, 1, 1, '27\", 3840x2160, 16:9, IPS, 60Гц, 300кд/м2, GTG 5мс,'),
(73, 33, 1, 'статическая 1000:1, динамическая 20000000:1,'),
(73, 34, 1, 'Display Port х 1шт, HDMI х 2,'),
(73, 35, 1, 'внутренний'),
(73, 36, 1, 'регулировка высоты, регулировка наклона, поворот экрана, крепление VESA 100х100,'),
(74, 1, 1, '24.5\", 1920x1080, 16:9, IPS, 360Гц, 400кд/м2, GTG 1мс, NVIDIA G-Sync,'),
(74, 33, 1, 'статическая 1000:1,'),
(74, 34, 1, 'Display Port х 1шт, HDMI х 1, выход на наушники,'),
(74, 35, 1, 'внешний'),
(74, 36, 1, 'регулировка высоты, регулировка наклона, поворот экрана, крепление VESA 100х100,'),
(75, 1, 1, '37.5\", 3840x1600, 21:9, IPS, 60Гц, 300кд/м2, 1мс, изогнутый,'),
(75, 33, 1, 'статическая 1000:1, динамическая 100000000:1,'),
(75, 34, 1, 'Display Port х 1шт, HDMI х 2, выход на наушники,'),
(75, 35, 1, 'внутренний'),
(75, 36, 1, 'регулировка высоты, регулировка наклона, крепление VESA 100х100,'),
(76, 1, 1, '49\", 5120x1440, 32:9, VA, 165Гц, 550кд/м2, GTG 4мс,'),
(76, 33, 1, 'статическая 3000:1, динамическая 80000000:1,'),
(76, 34, 1, 'Display Port х 1шт, HDMI х 2,'),
(76, 37, 1, 'встроенные динамики,'),
(76, 35, 1, 'внутренний'),
(76, 36, 1, 'регулировка высоты, регулировка наклона, поворот экрана, крепление VESA 100х100,'),
(77, 1, 1, '48.8\", 5120x1440, 32:9, VA, 60Гц, 450кд/м2, 5мс, GTG 5мс, изогнутый,'),
(77, 33, 1, '3000:1, статическая 80000000:1, динамическая 80000000:1,'),
(77, 34, 1, 'Display Port х 1шт, HDMI х 2, выход на наушники,'),
(77, 37, 1, 'встроенные динамики, встроенная вебкамера,'),
(77, 35, 1, 'внутренний'),
(77, 36, 1, 'регулировка высоты, регулировка наклона, поворот экрана, крепление VESA 100х100,'),
(78, 1, 1, '27\", 2560x1440, 16:9, IPS, 240Гц, 350кд/м2, GTG 1мс, NVIDIA G-Sync,'),
(78, 33, 1, 'статическая 1000:1,'),
(78, 34, 1, 'Display Port х 1шт, HDMI х 3, выход на наушники,'),
(78, 37, 1, 'встроенные динамики,'),
(78, 35, 1, 'внешний'),
(78, 36, 1, 'регулировка высоты, регулировка наклона, поворот экрана, крепление VESA 100x100,'),
(79, 1, 1, '31.5\", 3840x2160, 16:9, VA, 144Гц, 350кд/м2, 1мс, GTG 2мс, AMD FreeSync, изогнутый,'),
(79, 33, 1, 'статическая 3000:1,'),
(79, 34, 1, 'Display Port х 1шт, HDMI х 2, выход на наушники,'),
(79, 37, 1, 'встроенные динамики,'),
(79, 35, 1, 'внешний'),
(79, 36, 1, 'регулировка высоты, регулировка наклона, крепление VESA 100x100,'),
(80, 1, 1, '32\", 2560x1440, 16:9, IPS, 240Гц, 400кд/м2, GTG 1мс,'),
(80, 33, 1, 'статическая 1000:1,'),
(80, 34, 1, 'Display Port х 1шт, HDMI х 2, выход на наушники,'),
(80, 35, 1, 'внутренний'),
(80, 36, 1, 'регулировка высоты, регулировка наклона, поворот экрана, крепление VESA 100х100,'),
(81, 38, 1, 'лазерный, черно-белый, двусторонняя печать, A3,'),
(81, 39, 1, 'ч/б 1200 x 1200 dpi,'),
(81, 40, 1, 'ч/б (A4) до 56 стр/мин'),
(81, 41, 1, 'подача 600 листов, выход 600 листов'),
(81, 42, 1, 'от 60 г/м2 до 220 г/м2'),
(81, 43, 1, 'USB, RJ-45,'),
(81, 44, 1, 'Air Print,'),
(82, 38, 1, 'лазерный, черно-белый, двусторонняя печать, A4,'),
(82, 39, 1, 'ч/б 1200 x 1200 dpi,'),
(82, 40, 1, 'ч/б (A4) до 55 стр/мин'),
(82, 41, 1, 'подача 500 листов, выход 250 листов'),
(82, 42, 1, 'от 60 г/м2 до 220 г/м2'),
(82, 43, 1, 'USB, RJ-45,'),
(83, 38, 1, 'лазерный, черно-белый, двусторонняя печать, A4,'),
(83, 39, 1, 'ч/б 1200 x 1200 dpi,'),
(83, 40, 1, 'ч/б (A4) до 55 стр/мин'),
(83, 41, 1, 'подача 500 листов, выход 500 листов'),
(83, 42, 1, 'от 60 г/м2 до 220 г/м2'),
(83, 43, 1, 'USB, RJ-45,'),
(83, 44, 1, 'Air Print, Mopria,'),
(84, 38, 1, 'лазерный, черно-белый, двусторонняя печать, A4,'),
(84, 39, 1, 'ч/б 1200 x 1200 dpi,'),
(84, 40, 1, 'ч/б (A4) до 45 стр/мин'),
(84, 41, 1, 'подача 500 листов, выход 250 листов'),
(84, 42, 1, 'от 60 г/м2 до 220 г/м2'),
(84, 43, 1, 'USB, RJ-45,'),
(84, 44, 1, 'Air Print, Mopria,'),
(85, 38, 1, 'лазерный, черно-белый, двусторонняя печать, A4,'),
(85, 39, 1, 'ч/б 1200 x 1200 dpi,'),
(85, 40, 1, 'ч/б (A4) до 45 стр/мин'),
(85, 41, 1, 'подача 500 листов, выход 250 листов'),
(85, 42, 1, 'от 60 г/м2 до 220 г/м2'),
(85, 43, 1, 'USB, RJ-45,'),
(85, 44, 1, 'Air Print, Mopria,'),
(86, 38, 1, 'лазерный, черно-белый, двусторонняя печать, A4,'),
(86, 39, 1, 'ч/б 1200 x 1200 dpi,'),
(86, 40, 1, 'ч/б (A4) до 47 стр/мин'),
(86, 41, 1, 'подача 500 листов, выход 250 листов'),
(86, 42, 1, 'от 60 г/м2 до 200 г/м2'),
(86, 43, 1, 'USB, RJ-45, Wi-Fi,'),
(87, 38, 1, 'лазерный, цветной, двусторонняя печать, A4,'),
(87, 39, 1, 'ч/б 2400 x 600 dpi, цвет 2400 x 600 dpi,'),
(87, 40, 1, 'ч/б (A4) до 31 стр/мин цвет (A4) до 31 стр/мин'),
(87, 41, 1, 'подача 300 листов, выход 150 листов'),
(87, 42, 1, 'от 60 г/м2 до 163 г/м2'),
(87, 43, 1, 'USB, RJ-45, Wi-Fi, NFC,'),
(87, 44, 1, 'Air Print, Mopria,'),
(88, 38, 1, 'лазерный, цветной, двусторонняя печать, A4,'),
(88, 39, 1, 'ч/б 9600 x 600 dpi, цвет 9600 x 600 dpi,'),
(88, 40, 1, 'ч/б (A4) до 21 стр/мин цвет (A4) до 21 стр/мин'),
(88, 41, 1, 'подача 300 листов, выход 150 листов'),
(88, 42, 1, 'от 60 г/м2 до 220 г/м2'),
(88, 43, 1, 'USB, RJ-45, Wi-Fi,'),
(88, 44, 1, 'Air Print,'),
(89, 38, 1, 'струйный, цветной, A3,'),
(89, 39, 1, 'цвет 5760 x 1440 dpi,'),
(89, 40, 1, 'ч/б (A4) до 15 стр/мин цвет (A4) до 15 стр/мин'),
(89, 41, 1, 'подача 100 листов, выход 30 листов'),
(89, 42, 1, 'от 64 г/м2 до 300 г/м2'),
(89, 43, 1, 'USB,'),
(90, 38, 1, 'лазерный, цветной, двусторонняя печать, A4,'),
(90, 39, 1, 'ч/б 600 x 600 dpi,'),
(90, 40, 1, 'ч/б (A4) до 33 стр/мин цвет (A4) до 33 стр/мин'),
(90, 41, 1, 'подача 550 листов, выход 250 листов'),
(90, 42, 1, 'от 60 г/м2 до 220 г/м2'),
(90, 43, 1, 'USB, RJ-45,'),
(90, 44, 1, 'Air Print, Mopria,'),
(91, 45, 1, 'стационарная, 2.0 Bluetooth'),
(91, 46, 1, '200Вт'),
(91, 47, 1, '30Гц-27КГц'),
(91, 48, 1, 'на передней панели'),
(91, 20, 1, 'от сети'),
(91, 21, 1, 'черный'),
(92, 45, 1, 'стационарная, 2.1 Bluetooth'),
(5, 2, 2, 'Qualcomm Snapdragon 8 Plus Gen 1, 3180MHz, 8-core'),
(92, 21, 1, 'черный'),
(5, 1, 2, '7.6\", Dynamic AMOLED 2X, 2176x1812'),
(93, 45, 1, 'стационарная, 1.1 Bluetooth'),
(93, 46, 1, '86Вт'),
(93, 47, 1, '160Гц-20КГц'),
(93, 48, 1, 'на верхней панели'),
(93, 20, 1, 'от сети'),
(93, 21, 1, 'черный'),
(94, 45, 1, 'стационарная, 2.0 Bluetooth'),
(94, 46, 1, '66Вт'),
(94, 47, 1, '52Гц-20КГц'),
(94, 48, 1, 'на боковой панели'),
(94, 20, 1, 'от сети'),
(94, 21, 1, 'коричневый'),
(95, 45, 1, 'стационарная, 5.1'),
(95, 46, 1, '80Вт'),
(95, 47, 1, '40Гц-22КГц'),
(95, 48, 1, 'на передней панели'),
(95, 20, 1, 'от сети'),
(95, 21, 1, 'черный'),
(96, 45, 1, 'стационарная, 2.0 беспроводная Bluetooth'),
(96, 46, 1, '80Вт'),
(96, 47, 1, '35Гц-20КГц'),
(96, 48, 1, 'на боковой панели/ на пульте ДУ'),
(96, 20, 1, 'от сети'),
(96, 21, 1, 'черный'),
(97, 45, 1, 'стационарная, 2.0'),
(97, 46, 1, '20Вт'),
(97, 47, 1, '60Гц-20КГц'),
(97, 48, 1, 'на верхней панели/ на передней панели'),
(97, 20, 1, 'от сети'),
(97, 21, 1, 'черный'),
(98, 45, 1, 'стационарная, 5.1'),
(98, 46, 1, '125Вт'),
(98, 47, 1, '40Гц-20КГц'),
(98, 48, 1, 'на передней панели/ на пульте ДУ'),
(98, 20, 1, 'от сети'),
(98, 21, 1, 'черный'),
(99, 45, 1, 'стационарная, 2.0'),
(99, 46, 1, '32Вт'),
(99, 47, 1, '50Гц-20КГц'),
(99, 48, 1, 'на передней панели'),
(99, 20, 1, 'от сети'),
(99, 21, 1, 'черный'),
(100, 45, 1, 'стационарная, 2.1 Bluetooth'),
(100, 46, 1, '80Вт'),
(100, 47, 1, '200Гц-20КГц'),
(100, 48, 1, 'на передней панели'),
(100, 20, 1, 'от сети'),
(100, 21, 1, 'черный'),
(4, 6, 2, 'side-mounted'),
(4, 7, 2, '130.1 x 155.1 x 6.3 mm'),
(1, 3, 1, 'оперативная 12ГБ, встроенная 256ГБ,'),
(4, 4, 2, '4400mAh'),
(4, 5, 2, '3G 4G 5G'),
(7, 3, 1, 'оперативная 4ГБ, встроенная 512ГБ,'),
(4, 3, 2, '12GB RAM, 512GB storage'),
(1, 6, 1, 'торцевой'),
(1, 7, 1, '130.1 х 155.1 х 6.3 мм'),
(7, 2, 1, 'A13 Bionic, 2650МГц, 6'),
(45, 23, 1, '3.25A'),
(4, 2, 2, 'Snapdragon 8 Plus Gen 1, 3180MHz, 8-core'),
(7, 1, 1, '5.8&quot, OLED, 2436x1125, 458PPI'),
(4, 1, 2, '7.6\", AMOLED, 2176x1812'),
(41, 21, 1, 'белый'),
(3, 5, 2, '3G 4G 5G'),
(3, 7, 2, '71.5 x 146.7 x 7.65 mm'),
(7, 7, 1, '71.4 х 144 х 8.1 мм'),
(3, 3, 2, '6GB RAM, 512GB storage'),
(36, 18, 1, '35Ом'),
(3, 2, 2, 'Apple A15 Bionic, 6-core'),
(36, 19, 1, 'встроенный,'),
(63, 10, 1, 'Free DOS'),
(63, 2, 1, 'Intel Core i5 9400T, 1.8 ГГц (3.4 ГГц, в режиме Turbo)'),
(3, 1, 2, '6.1\", OLED, 2532x1170, 460PPI'),
(22, 13, 1, '5472 х  3078'),
(2, 7, 2, '130.1 x 155.1 x 6.3 mm'),
(7, 5, 1, '3G 4G'),
(2, 6, 2, 'side-mounted'),
(2, 5, 2, '3G 4G 5G'),
(7, 4, 1, '3046мAч'),
(36, 14, 1, 'от 50 Гц до 4 кГц'),
(39, 15, 1, 'вкладыши'),
(2, 4, 2, '4400mAh'),
(39, 14, 1, 'от 10 Гц до 40 кГц'),
(39, 18, 1, '32Ом'),
(2, 3, 2, '12GB RAM, 512GB storage'),
(92, 46, 1, '120Вт'),
(63, 1, 1, '23.8&quot, 1920 х 1080 Web-камера'),
(42, 21, 2, 'black'),
(92, 47, 1, '50Гц-20КГц'),
(92, 48, 1, 'на верхней панели'),
(92, 20, 1, 'от сети'),
(2, 2, 2, 'Snapdragon 8 Plus Gen 1, 3180MHz, 8-core'),
(2, 1, 2, '7.6\", AMOLED, 2176x1812'),
(41, 22, 1, 'data-кабель в комплекте'),
(1, 2, 1, 'Snapdragon 8 Plus Gen 1, 3180МГц, 8'),
(1, 5, 2, '3G 4G 5G'),
(1, 1, 1, '7.6&quot, AMOLED, 2176x1812,'),
(1, 4, 2, '4400mAh'),
(6, 4, 2, '4600mAh'),
(6, 5, 2, '3G 4G 5G'),
(6, 6, 2, 'under-display'),
(6, 7, 2, '74.6 x 163.6 x 8.2 mm'),
(8, 1, 2, '7.6\", AMOLED, 2176x1812'),
(8, 2, 2, 'Snapdragon 8 Plus Gen 1, 3180MHz, 8-core'),
(8, 3, 2, '12GB RAM, 256GB storage'),
(8, 4, 2, '4400mAh'),
(8, 5, 2, '3G 4G 5G'),
(8, 6, 2, 'side-mounted'),
(8, 7, 2, '130.1 x 155.1 x 6.3 mm'),
(9, 1, 2, '7.6\", AMOLED, 2176x1812'),
(9, 2, 2, 'Snapdragon 8 Plus Gen 1, 3180MHz, 8-core'),
(9, 3, 2, '12GB RAM, 256GB storage'),
(9, 4, 2, '4400mAh'),
(9, 5, 2, '3G 4G 5G'),
(9, 6, 2, 'side-mounted'),
(9, 7, 2, '130.1 x 155.1 x 6.3 mm'),
(10, 1, 2, '7.6\", AMOLED, 2176x1812'),
(10, 2, 2, 'Snapdragon 8 Plus Gen 1, 3180MHz, 8-core'),
(10, 3, 2, '12GB RAM, 256GB storage'),
(10, 4, 2, '4400mAh'),
(10, 5, 2, '3G 4G 5G'),
(10, 6, 2, 'side-mounted'),
(10, 7, 2, '130.1 x 155.1 x 6.3 mm'),
(11, 1, 2, '11\" (27.94 cm), 2388 x 1668, IPS, 264PPI'),
(11, 2, 2, 'Apple M1, 8-core'),
(11, 3, 2, '16384 MB LPDDR4x / 2TB'),
(11, 8, 2, 'rear 12MP, front 12MP'),
(11, 9, 2, 'GPS, GLONASS'),
(11, 10, 2, 'iOS'),
(11, 4, 2, 'Li-Pol'),
(12, 1, 2, '12.9\" (32.7 cm), 2732 x 2048, IPS, 264PPI'),
(12, 2, 2, 'Apple M1, 8-core'),
(12, 3, 2, '16384 MB LPDDR4x / 2TB'),
(12, 8, 2, 'rear 12MP, front 12MP'),
(12, 10, 2, 'iOS'),
(12, 4, 2, 'Li-Pol'),
(13, 1, 2, '12.9\" (32.7 cm), 2732 x 2048, IPS, 264PPI'),
(13, 2, 2, 'Apple M1, 8-core'),
(13, 3, 2, '16384 MB LPDDR4x / 1TB'),
(13, 8, 2, 'rear 12MP, front 12MP'),
(13, 10, 2, 'iOS'),
(13, 4, 2, 'Li-Pol'),
(14, 1, 2, '12.9\" (32.7 cm), 2732 x 2048, IPS, 264PPI'),
(14, 2, 2, 'Apple M1, 8-core'),
(14, 3, 2, '16384 MB LPDDR4x / 2TB'),
(14, 8, 2, 'rear 12MP, front 12MP'),
(14, 10, 2, 'iOS'),
(14, 4, 2, 'Li-Pol'),
(15, 1, 2, '12.9\" (32.7 cm), 2732 x 2048, IPS, 264PPI'),
(15, 2, 2, 'Apple M1, 8-core'),
(15, 3, 2, '16384 MB LPDDR4x / 2TB'),
(15, 8, 2, 'rear 12MP, front 12MP'),
(15, 10, 2, 'iOS'),
(15, 4, 2, 'Li-Pol'),
(16, 1, 2, '12.9\" (32.7 cm), 2732 x 2048, IPS, 264PPI'),
(16, 2, 2, 'Apple M1, 8-core'),
(16, 3, 2, '8192 MB LPDDR4x / 512GB'),
(16, 8, 2, 'rear 12MP, front 12MP'),
(16, 10, 2, 'iOS'),
(16, 4, 2, 'Li-Pol'),
(17, 1, 2, '11\" (27.94 cm), 2388 x 1668, IPS, 264PPI'),
(17, 2, 2, 'Apple M1, 8-core'),
(17, 3, 2, '16384 MB LPDDR4x / 2TB'),
(17, 8, 2, 'rear 12MP, front 12MP'),
(17, 10, 2, 'iOS'),
(17, 4, 2, 'Li-Pol'),
(18, 1, 2, '11\" (27.94 cm), 2388 x 1668, IPS, 264PPI'),
(18, 2, 2, 'Apple M1, 8-core'),
(18, 3, 2, '16384 MB LPDDR4x / 2TB'),
(18, 8, 2, 'rear 12MP, front 12MP'),
(18, 10, 2, 'iOS'),
(18, 4, 2, 'Li-Pol'),
(19, 1, 2, '12.9\" (32.7 cm), 2732 x 2048, IPS, 264PPI'),
(19, 2, 2, 'Apple M1, 8-core'),
(19, 3, 2, '16384 MB LPDDR4x / 1TB'),
(19, 8, 2, 'rear 12MP, front 12MP'),
(19, 10, 2, 'iOS'),
(19, 4, 2, 'Li-Pol'),
(20, 1, 2, '11\" (27.94 cm), 2388 x 1668, IPS, 264PPI'),
(20, 2, 2, 'Apple M1, 8-core'),
(20, 3, 2, '16384 MB LPDDR4x / 1TB'),
(20, 8, 2, 'rear 12MP, front 12MP'),
(20, 10, 2, 'iOS'),
(20, 4, 2, 'Li-Pol'),
(21, 11, 2, '4'),
(21, 12, 2, '21 meters per second'),
(21, 13, 2, '5120 x 2700'),
(22, 12, 2, '19 meters per second'),
(22, 11, 2, '4'),
(23, 11, 2, '4'),
(23, 12, 2, '18 meters per second'),
(23, 13, 2, '5472 x 3076'),
(24, 12, 2, '15 meters per second'),
(24, 13, 2, '3840 x 2160'),
(25, 11, 2, '4'),
(25, 13, 2, '1280 x 720'),
(26, 11, 2, '4'),
(27, 11, 2, '4'),
(27, 12, 2, '2 meters per second'),
(28, 11, 2, '4'),
(28, 13, 2, '640 x 480'),
(29, 11, 2, '4'),
(29, 13, 2, '640 x 480'),
(30, 11, 2, '4'),
(31, 14, 2, '3 Hz to 40 kHz'),
(31, 15, 2, 'earbuds'),
(31, 16, 2, 'closed-back'),
(31, 17, 2, 'wired'),
(32, 14, 2, '5 Hz to 40 kHz'),
(32, 18, 2, '32 ohms'),
(32, 15, 2, 'on-ear'),
(32, 16, 2, 'closed-back'),
(32, 17, 2, 'wired'),
(33, 14, 2, '10 Hz to 20 kHz'),
(33, 18, 2, '16 ohms'),
(33, 15, 2, 'earbuds'),
(33, 16, 2, 'closed-back'),
(33, 17, 2, 'wireless Bluetooth'),
(33, 19, 2, 'neckband, 100 Hz to 10 kHz'),
(34, 14, 2, '15 Hz to 40 kHz'),
(34, 18, 2, '16 ohms'),
(34, 15, 2, 'earbuds'),
(34, 16, 2, 'closed-back'),
(34, 17, 2, 'wired'),
(35, 14, 2, '7 Hz to 40 kHz'),
(35, 18, 2, '16 ohms'),
(35, 15, 2, 'monitor headphones'),
(35, 16, 2, 'closed-back'),
(35, 17, 2, 'wireless Bluetooth'),
(35, 19, 2, 'built-in'),
(36, 17, 2, 'wireless Bluetooth'),
(36, 16, 2, 'closed-back'),
(36, 15, 2, 'on-ear'),
(37, 14, 2, '5 Hz to 40 kHz'),
(37, 18, 2, '48 ohms'),
(37, 15, 2, 'on-ear'),
(37, 16, 2, 'closed-back'),
(37, 17, 2, 'wired'),
(38, 14, 2, '7 Hz to 40 kHz'),
(38, 18, 2, '48 ohms'),
(38, 15, 2, 'on-ear'),
(38, 16, 2, 'closed-back'),
(38, 17, 2, 'wireless Bluetooth'),
(38, 19, 2, 'built-in'),
(39, 16, 2, 'closed-back'),
(39, 17, 2, 'wired'),
(40, 15, 2, 'in-ear'),
(40, 16, 2, 'closed-back'),
(40, 17, 2, 'wireless Bluetooth True Wireless'),
(40, 19, 2, 'built-in'),
(41, 20, 2, 'from USB port'),
(42, 20, 2, 'from mains'),
(42, 20, 1, 'от бытовой сети'),
(43, 24, 2, 'USB-C'),
(43, 20, 2, 'from mains'),
(43, 23, 2, '5A'),
(43, 21, 2, 'grey'),
(44, 24, 2, 'USB Type-C'),
(44, 20, 2, 'from mains'),
(44, 23, 2, '3A'),
(44, 21, 2, 'black'),
(44, 22, 2, 'data cable included'),
(46, 24, 2, '2xUSB-A + 2xUSB-C'),
(46, 20, 2, 'from mains'),
(46, 23, 2, '1.5A, 3A, 5A, 2.5A'),
(46, 21, 2, 'white'),
(47, 24, 2, 'USB Type-C'),
(47, 20, 2, 'from mains'),
(47, 23, 2, '3A'),
(47, 21, 2, 'grey'),
(47, 22, 2, 'data cable included'),
(48, 25, 2, 'USB Type-C'),
(48, 20, 2, 'from USB port'),
(48, 21, 2, 'white'),
(49, 24, 2, 'USB Type-C'),
(49, 25, 2, 'USB'),
(49, 20, 2, 'from USB port'),
(49, 23, 2, '2.77A'),
(49, 21, 2, 'white'),
(50, 24, 2, 'USB Type-C'),
(50, 25, 2, 'USB'),
(50, 20, 2, 'from USB port'),
(50, 23, 2, '2.77A'),
(50, 21, 2, 'black'),
(51, 1, 2, '17.3\", 3840x2160, IPS'),
(51, 2, 2, 'Intel Core i9 12900HX 2.3 GHz (5.0 GHz Turbo Boost)'),
(51, 26, 2, 'NVIDIA GeForce RTX A5500 - 16384 MB'),
(51, 27, 2, '64GB DDR5'),
(51, 28, 2, '2048GB SSD'),
(51, 10, 2, 'Windows 11 Professional'),
(51, 29, 2, 'with Cyrillic letters'),
(52, 1, 2, '16.2\", 3456x2234'),
(52, 2, 2, 'Apple M1 Max 10-core'),
(52, 27, 2, '32GB'),
(52, 28, 2, '1024GB SSD'),
(52, 10, 2, 'macOS'),
(52, 29, 2, 'with Cyrillic letters'),
(53, 1, 2, '17.3\", 3840x2160, IPS'),
(53, 2, 2, 'Intel Core i9 12900HX 2.3 GHz (5.0 GHz Turbo Boost)'),
(53, 26, 2, 'NVIDIA GeForce RTX A3000 - 12288 MB'),
(53, 27, 2, '64GB DDR5'),
(53, 28, 2, '2048GB SSD'),
(53, 10, 2, 'Windows 11 Professional'),
(53, 29, 2, 'with Cyrillic letters'),
(54, 1, 2, '16\", 2560x1600, IPS'),
(54, 2, 2, 'Intel Core i9 12900H 3.8 GHz (5.0 GHz Turbo Boost)'),
(54, 26, 2, 'NVIDIA GeForce RTX 3080 Ti Laptop - 16384 MB'),
(54, 27, 2, '32GB DDR5 4800MHz'),
(54, 28, 2, '2048GB SSD'),
(54, 10, 2, 'Windows 11 Home'),
(54, 29, 2, 'with Cyrillic letters'),
(55, 1, 2, '14.2\", 3024x1964'),
(55, 2, 2, 'Apple M1 Max 10-core'),
(55, 27, 2, '32GB'),
(55, 28, 2, '1024GB SSD'),
(55, 10, 2, 'macOS'),
(55, 29, 2, 'with Cyrillic letters'),
(56, 1, 2, '16.2\", 3456x2234'),
(56, 2, 2, 'Apple M1 Max 10-core'),
(56, 27, 2, '32GB'),
(56, 28, 2, '1024GB SSD'),
(56, 10, 2, 'macOS'),
(56, 29, 2, 'Latin letters only'),
(57, 1, 2, '17.3\", 2560x1440, IPS'),
(57, 2, 2, 'Intel Core i7 12800HX 2.0 GHz (4.8 GHz Turbo Boost)'),
(57, 26, 2, 'NVIDIA GeForce RTX 3080 Ti Laptop - 16384 MB'),
(57, 27, 2, '32GB DDR5'),
(57, 28, 2, '2048GB SSD'),
(57, 10, 2, 'Windows 11 Home'),
(57, 29, 2, 'with Cyrillic letters'),
(58, 1, 2, '16\", 2560x1600, IPS'),
(58, 2, 2, 'Intel Core i7 12700H 2.3 GHz (4.7 GHz Turbo Boost)'),
(58, 26, 2, 'NVIDIA GeForce RTX A3000 - 12288 MB'),
(58, 27, 2, '32GB DDR5 4800MHz'),
(58, 28, 2, '1024GB SSD'),
(58, 10, 2, 'Windows 11 Professional'),
(58, 29, 2, 'with Cyrillic letters'),
(59, 1, 2, '16.2\", 3456x2234'),
(59, 2, 2, 'Apple M1 Pro 10-core'),
(59, 27, 2, '16GB unified memory'),
(59, 28, 2, '512GB SSD'),
(59, 10, 2, 'macOS'),
(59, 29, 2, 'with Cyrillic letters'),
(60, 1, 2, '16.2\", 3456x2234'),
(60, 2, 2, 'Apple M1 Pro 10-core'),
(60, 27, 2, '16GB'),
(60, 28, 2, '512GB SSD'),
(60, 10, 2, 'macOS'),
(60, 29, 2, 'with Cyrillic letters'),
(61, 1, 2, '23.8\", 1920x1080, webcam'),
(61, 2, 2, 'Intel Core i5 11500, 2.7 GHz (4.6 GHz Turbo Boost)'),
(61, 27, 2, '8 GB DDR4 SO-DIMM 3200 MHz'),
(61, 30, 2, 'Intel UHD Graphics 750'),
(61, 31, 2, '512GB SSD'),
(61, 32, 2, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(61, 10, 2, 'Windows 10 Professional'),
(62, 1, 2, '21.5\", 1920x1080, webcam'),
(62, 2, 2, 'Intel Core i5 7360U, 2.3 GHz (3.6 GHz Turbo Boost)'),
(62, 27, 2, '8 GB DDR4 2133 MHz'),
(62, 30, 2, 'Intel Iris Plus Graphics 640'),
(62, 31, 2, '256GB SSD'),
(62, 32, 2, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(62, 10, 2, 'macOS'),
(63, 27, 2, '8 GB DDR4 SO-DIMM 2666 MHz'),
(63, 30, 2, 'Intel UHD Graphics 630'),
(63, 31, 2, '1000GB SSD'),
(63, 32, 2, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(63, 10, 2, 'FreeDOS'),
(63, 2, 2, 'Intel Core i5 9400T, 1.8 GHz (3.4 GHz Turbo Boost)'),
(63, 1, 2, '23.8\", 1920x1080, webcam'),
(64, 1, 2, '23.8\", 1920x1080, webcam'),
(64, 2, 2, 'Intel Core i5 1035G1, 1 GHz (3.6 GHz Turbo Boost)'),
(64, 27, 2, '8 GB DDR4 SO-DIMM 3200 MHz'),
(64, 30, 2, 'Intel UHD Graphics'),
(64, 31, 2, '512GB SSD, DVD-RW optical drive'),
(64, 32, 2, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(64, 10, 2, 'Windows 10 Professional'),
(65, 1, 2, '23.8\", 1920x1080, webcam'),
(65, 2, 2, 'Intel Core i5 1035G1, 1 GHz (3.6 GHz Turbo Boost)'),
(65, 27, 2, '8 GB DDR4 SO-DIMM 3200 MHz'),
(65, 30, 2, 'Intel UHD Graphics'),
(65, 31, 2, '512GB SSD, DVD-RW optical drive'),
(65, 32, 2, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(65, 10, 2, 'no OS'),
(66, 1, 2, '23.8\", 1920x1080, webcam'),
(66, 2, 2, 'Intel Core i3 1115G4, 3 GHz (4.1 GHz Turbo Boost)'),
(66, 27, 2, '8 GB DDR4 SO-DIMM'),
(66, 30, 2, 'Intel UHD Graphics'),
(66, 31, 2, '512GB SSD'),
(66, 32, 2, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(66, 10, 2, 'Windows 11 Home'),
(67, 1, 2, '23.8\", 1920x1080, webcam'),
(67, 2, 2, 'Intel Core i3 1115G4, 3 GHz (4.1 GHz Turbo Boost)'),
(67, 27, 2, '8 GB DDR4 SO-DIMM'),
(67, 30, 2, 'Intel UHD Graphics'),
(67, 31, 2, '256GB SSD'),
(67, 32, 2, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(67, 10, 2, 'Windows 10 Professional'),
(68, 1, 2, '23.8\", 1920x1080, webcam'),
(68, 2, 2, 'Intel Core i3 1115G4, 3 GHz (4.1 GHz Turbo Boost)'),
(68, 27, 2, '8 GB DDR4 SO-DIMM 3200 MHz'),
(68, 30, 2, 'Intel UHD Graphics'),
(68, 31, 2, '256GB SSD'),
(68, 32, 2, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(68, 10, 2, 'Windows 11 Home'),
(69, 1, 2, '23.8\", 1920x1080, webcam'),
(69, 2, 2, 'Intel Core i3 1005G1, 1.2 GHz (3.4 GHz Turbo Boost)'),
(69, 27, 2, '8 GB DDR4 SO-DIMM 3200 MHz'),
(69, 30, 2, 'Intel UHD Graphics'),
(69, 31, 2, '256GB SSD'),
(69, 32, 2, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(69, 10, 2, 'Windows 10 Professional'),
(70, 1, 2, '23.8\", 1920x1080, webcam'),
(70, 2, 2, 'Intel Core i3 10105, 3.7 GHz (4.4 GHz Turbo Boost)'),
(70, 27, 2, '8 GB DDR4 SO-DIMM 2666 MHz'),
(70, 30, 2, 'Intel UHD Graphics 630'),
(70, 31, 2, '256GB SSD'),
(70, 32, 2, 'Wi-Fi Bluetooth Gigabit Ethernet'),
(70, 10, 2, 'no OS'),
(71, 1, 2, '31.5\", 3840x2160, 16:9, IPS, 60Hz, 1000 cd/m², 6ms GTG'),
(71, 33, 2, 'static 1300:1, dynamic 1000000:1'),
(71, 34, 2, '1x DisplayPort, 2x HDMI, Thunderbolt'),
(71, 35, 2, 'integrated'),
(71, 36, 2, 'height adjustment, tilt adjustment, swivel, VESA 100x100 mount'),
(72, 1, 2, '43\", 3840x2160, 16:9, VA, 120Hz, 600 cd/m², 4ms GTG, AMD FreeSync'),
(72, 33, 2, 'static 4000:1, dynamic 50000:1'),
(72, 34, 2, '1x DisplayPort, 3x HDMI'),
(72, 37, 2, 'built-in speakers'),
(72, 35, 2, 'external'),
(72, 36, 2, 'tilt adjustment, VESA 100x100 mount'),
(73, 1, 2, '27\", 3840x2160, 16:9, IPS, 60Hz, 300 cd/m², 5ms GTG'),
(73, 33, 2, 'static 1000:1, dynamic 20000000:1'),
(73, 34, 2, '1x DisplayPort, 2x HDMI'),
(73, 35, 2, 'integrated'),
(73, 36, 2, 'height adjustment, tilt adjustment, swivel, VESA 100x100 mount'),
(74, 1, 2, '24.5\", 1920x1080, 16:9, IPS, 360Hz, 400 cd/m², 1ms GTG, NVIDIA G-Sync'),
(74, 33, 2, 'static 1000:1'),
(74, 34, 2, '1x DisplayPort, 1x HDMI, headphone output'),
(74, 35, 2, 'external'),
(74, 36, 2, 'height adjustment, tilt adjustment, swivel, VESA 100x100 mount'),
(75, 1, 2, '37.5\", 3840x1600, 21:9, IPS, 60Hz, 300 cd/m², 1ms, curved'),
(75, 33, 2, 'static 1000:1, dynamic 100000000:1'),
(75, 34, 2, '1x DisplayPort, 2x HDMI, headphone output'),
(75, 35, 2, 'integrated'),
(75, 36, 2, 'height adjustment, tilt adjustment, VESA 100x100 mount'),
(76, 1, 2, '49\", 5120x1440, 32:9, VA, 165Hz, 550 cd/m², 4ms GTG'),
(76, 33, 2, 'static 3000:1, dynamic 80000000:1'),
(76, 34, 2, '1x DisplayPort, 2x HDMI'),
(76, 37, 2, 'built-in speakers'),
(76, 35, 2, 'integrated'),
(76, 36, 2, 'height adjustment, tilt adjustment, swivel, VESA 100x100 mount'),
(77, 1, 2, '48.8\", 5120x1440, 32:9, VA, 60Hz, 450 cd/m², 5ms GTG, curved'),
(77, 33, 2, '3000:1 static, 80000000:1 dynamic'),
(77, 34, 2, '1x DisplayPort, 2x HDMI, headphone output'),
(77, 37, 2, 'built-in speakers, built-in webcam'),
(77, 35, 2, 'integrated'),
(77, 36, 2, 'height adjustment, tilt adjustment, swivel, VESA 100x100 mount'),
(78, 1, 2, '27\", 2560x1440, 16:9, IPS, 240Hz, 350 cd/m², 1ms GTG, NVIDIA G-Sync'),
(78, 33, 2, 'static 1000:1'),
(78, 34, 2, '1x DisplayPort, 3x HDMI, headphone output'),
(78, 37, 2, 'built-in speakers'),
(78, 35, 2, 'external'),
(78, 36, 2, 'height adjustment, tilt adjustment, swivel, VESA 100x100 mount'),
(79, 1, 2, '31.5\", 3840x2160, 16:9, VA, 144Hz, 350 cd/m², 1ms GTG, AMD FreeSync, curved'),
(79, 33, 2, 'static 3000:1'),
(79, 34, 2, '1x DisplayPort, 2x HDMI, headphone output'),
(79, 37, 2, 'built-in speakers'),
(79, 35, 2, 'external'),
(79, 36, 2, 'height adjustment, tilt adjustment, VESA 100x100 mount'),
(80, 1, 2, '32\", 2560x1440, 16:9, IPS, 240Hz, 400 cd/m², 1ms GTG'),
(80, 33, 2, 'static 1000:1'),
(80, 34, 2, '1x DisplayPort, 2x HDMI, headphone output'),
(80, 35, 2, 'integrated'),
(80, 36, 2, 'height adjustment, tilt adjustment, swivel, VESA 100x100 mount'),
(81, 38, 2, 'laser, monochrome, duplex, A3'),
(81, 39, 2, 'mono 1200 x 1200 dpi'),
(81, 40, 2, 'mono (A4) up to 56 ppm'),
(81, 41, 2, '600-sheet input, 600-sheet output'),
(81, 42, 2, '60 g/m² to 220 g/m²'),
(81, 43, 2, 'USB, RJ-45'),
(81, 44, 2, 'AirPrint'),
(82, 38, 2, 'laser, monochrome, duplex, A4'),
(82, 39, 2, 'mono 1200 x 1200 dpi'),
(82, 40, 2, 'mono (A4) up to 55 ppm'),
(82, 41, 2, '500-sheet input, 250-sheet output'),
(82, 42, 2, '60 g/m² to 220 g/m²'),
(82, 43, 2, 'USB, RJ-45'),
(83, 38, 2, 'laser, monochrome, duplex, A4'),
(83, 39, 2, 'mono 1200 x 1200 dpi'),
(83, 40, 2, 'mono (A4) up to 55 ppm'),
(83, 41, 2, '500-sheet input, 500-sheet output'),
(83, 42, 2, '60 g/m² to 220 g/m²'),
(83, 43, 2, 'USB, RJ-45'),
(83, 44, 2, 'AirPrint, Mopria'),
(84, 38, 2, 'laser, monochrome, duplex, A4'),
(84, 39, 2, 'mono 1200 x 1200 dpi'),
(84, 40, 2, 'mono (A4) up to 45 ppm'),
(84, 41, 2, '500-sheet input, 250-sheet output'),
(84, 42, 2, '60 g/m² to 220 g/m²'),
(84, 43, 2, 'USB, RJ-45'),
(84, 44, 2, 'AirPrint, Mopria'),
(85, 38, 2, 'laser, monochrome, duplex, A4'),
(85, 39, 2, 'mono 1200 x 1200 dpi'),
(85, 40, 2, 'mono (A4) up to 45 ppm'),
(85, 41, 2, '500-sheet input, 250-sheet output'),
(85, 42, 2, '60 g/m² to 220 g/m²'),
(85, 43, 2, 'USB, RJ-45'),
(85, 44, 2, 'AirPrint, Mopria'),
(86, 38, 2, 'laser, monochrome, duplex, A4'),
(86, 39, 2, 'mono 1200 x 1200 dpi'),
(86, 40, 2, 'mono (A4) up to 47 ppm'),
(86, 41, 2, '500-sheet input, 250-sheet output'),
(86, 42, 2, '60 g/m² to 200 g/m²'),
(86, 43, 2, 'USB, RJ-45, Wi-Fi'),
(87, 38, 2, 'laser, color, duplex, A4'),
(87, 39, 2, 'mono 2400 x 600 dpi, color 2400 x 600 dpi'),
(87, 40, 2, 'mono (A4) up to 31 ppm, color (A4) up to 31 ppm'),
(87, 41, 2, '300-sheet input, 150-sheet output'),
(87, 42, 2, '60 g/m² to 163 g/m²'),
(87, 43, 2, 'USB, RJ-45, Wi-Fi, NFC'),
(87, 44, 2, 'AirPrint, Mopria'),
(88, 38, 2, 'laser, color, duplex, A4'),
(88, 39, 2, 'mono 9600 x 600 dpi, color 9600 x 600 dpi'),
(88, 40, 2, 'mono (A4) up to 21 ppm, color (A4) up to 21 ppm'),
(88, 41, 2, '300-sheet input, 150-sheet output'),
(88, 42, 2, '60 g/m² to 220 g/m²'),
(88, 43, 2, 'USB, RJ-45, Wi-Fi'),
(88, 44, 2, 'AirPrint'),
(89, 38, 2, 'inkjet, color, A3'),
(89, 39, 2, 'color 5760 x 1440 dpi'),
(89, 40, 2, 'mono (A4) up to 15 ppm, color (A4) up to 15 ppm'),
(89, 41, 2, '100-sheet input, 30-sheet output'),
(89, 42, 2, '64 g/m² to 300 g/m²'),
(89, 43, 2, 'USB'),
(90, 38, 2, 'laser, color, duplex, A4'),
(90, 39, 2, 'mono 600 x 600 dpi'),
(90, 40, 2, 'mono (A4) up to 33 ppm, color (A4) up to 33 ppm'),
(90, 41, 2, '550-sheet input, 250-sheet output'),
(90, 42, 2, '60 g/m² to 220 g/m²'),
(90, 43, 2, 'USB, RJ-45'),
(90, 44, 2, 'AirPrint, Mopria'),
(91, 45, 2, 'stationary, 2.0, Bluetooth'),
(91, 46, 2, '200W'),
(91, 47, 2, '30Hz–27kHz'),
(91, 48, 2, 'on front panel'),
(91, 20, 2, 'from mains'),
(91, 21, 2, 'black'),
(92, 45, 2, 'stationary, 2.1, Bluetooth'),
(92, 46, 2, '120W'),
(92, 47, 2, '50Hz–20kHz'),
(92, 48, 2, 'on top panel'),
(92, 20, 2, 'from mains'),
(92, 21, 2, 'black'),
(93, 45, 2, 'stationary, 1.1, Bluetooth'),
(93, 46, 2, '86W'),
(93, 47, 2, '160Hz–20kHz'),
(93, 48, 2, 'on top panel'),
(93, 20, 2, 'from mains'),
(93, 21, 2, 'black'),
(94, 45, 2, 'stationary, 2.0, Bluetooth'),
(94, 46, 2, '66W'),
(94, 47, 2, '52Hz–20kHz'),
(94, 48, 2, 'on side panel'),
(94, 20, 2, 'from mains'),
(94, 21, 2, 'brown'),
(95, 45, 2, 'stationary, 5.1'),
(95, 46, 2, '80W'),
(95, 47, 2, '40Hz–22kHz'),
(95, 48, 2, 'on front panel'),
(95, 20, 2, 'from mains'),
(95, 21, 2, 'black'),
(96, 45, 2, 'stationary, 2.0, wireless, Bluetooth'),
(96, 46, 2, '80W'),
(96, 47, 2, '35Hz–20kHz'),
(96, 48, 2, 'on side panel / on remote control'),
(96, 20, 2, 'from mains'),
(96, 21, 2, 'black'),
(97, 45, 2, 'stationary, 2.0'),
(97, 46, 2, '20W'),
(97, 47, 2, '60Hz–20kHz'),
(97, 48, 2, 'on top panel / on front panel'),
(97, 20, 2, 'from mains'),
(97, 21, 2, 'black'),
(98, 45, 2, 'stationary, 5.1'),
(98, 46, 2, '125W'),
(98, 47, 2, '40Hz–20kHz'),
(98, 48, 2, 'on front panel / on remote control'),
(98, 20, 2, 'from mains'),
(98, 21, 2, 'black'),
(99, 45, 2, 'stationary, 2.0'),
(99, 46, 2, '32W'),
(99, 47, 2, '50Hz–20kHz'),
(99, 48, 2, 'on front panel'),
(99, 20, 2, 'from mains'),
(99, 21, 2, 'black'),
(100, 45, 2, 'stationary, 2.1, Bluetooth'),
(100, 46, 2, '80W'),
(100, 47, 2, '200Hz–20kHz'),
(100, 48, 2, 'on front panel'),
(100, 20, 2, 'from mains'),
(100, 21, 2, 'black'),
(1, 3, 2, '12GB RAM, 256GB storage'),
(7, 3, 2, '4GB RAM, 512GB storage'),
(1, 6, 2, 'side-mounted'),
(1, 7, 2, '130.1 x 155.1 x 6.3 mm'),
(7, 2, 2, 'A13 Bionic, 2650MHz, 6-core'),
(45, 23, 2, '3.25A'),
(7, 1, 2, '5.8\", OLED, 2436x1125, 458PPI'),
(41, 21, 2, 'white'),
(7, 7, 2, '71.4 x 144 x 8.1 mm'),
(36, 18, 2, '35 ohms'),
(36, 19, 2, 'built-in'),
(42, 23, 1, '3A,'),
(42, 23, 2, '3A');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_description`
--

CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_h1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stickers` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `meta_h1`, `stickers`) VALUES
(2, 1, 'Смартфон Samsung Galaxy Z Fold 4 SM-F936B 512Gb 12Gb сер.зелен. 3G 4G 2Sim 7.6&quot; AMOLED 1812x2176 And', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(3, 1, 'Смартфон Apple iPhone 13 Pro 512Gb,  MLWA3RU/A,  серебристый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(4, 1, 'Смартфон Samsung Galaxy Z Fold 4 SM-F936B 512Gb 12Gb черный 3G 4G 2Sim 7.6&quot; AMOLED 1812x2176 And12 5', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(5, 1, 'Смартфон Samsung Galaxy Z Fold 4 SM-F936B 512Gb 12Gb бежевый 3G 4G 2Sim 7.6&quot; Dynamic AMOLED 2X 1812x', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(6, 1, 'Смартфон Xiaomi 12 Pro 12/256Gb,  пурпурный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(8, 1, 'Смартфон Samsung Galaxy Z Fold 4 12/256Gb,  SM-F936B,  черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(9, 1, 'Смартфон Samsung Galaxy Z Fold 4 12/256Gb,  SM-F936B,  черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(10, 1, 'Смартфон Samsung Galaxy Z Fold 4 SM-F936B 256Gb 12Gb черный 3G 4G 2Sim 7.6&quot; AMOLED 1812x2176 And12 5', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(11, 1, 'Планшет Apple iPad Pro 2021 11&quot; 2Tb Wi-Fi + Cellular MHWE3RU/A,  16ГБ, 2ТБ,  4G серый космос', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(12, 1, 'Планшет Apple iPad Pro 2021 12.9&quot; 2Tb Wi-Fi MHNQ3RU/A,  16ГБ, 2ТБ серебристый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(13, 1, 'Планшет Apple iPad Pro 2021 12.9&quot; 1Tb Wi-Fi MHNN3RU/A,  16ГБ, 1ТБ серебристый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(14, 1, 'Планшет Apple iPad Pro 2021 12.9&quot; 2Tb Wi-Fi MHNP3RU/A,  16ГБ, 2ТБ серый космос', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(15, 1, 'Планшет Apple iPad Pro 2021 12.9&quot; 2Tb Wi-Fi MHNQ3RU/A,  16ГБ, 2ТБ серебристый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(16, 1, 'Планшет Apple iPad Pro 2021 12.9&quot; 512Gb Wi-Fi MHNK3RU/A,  8ГБ, 512ГБ серый космос', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(17, 1, 'Планшет Apple iPad Pro 2021 11&quot; 2Tb Wi-Fi MHR33RU/A,  16ГБ, 2ТБ серебристый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(18, 1, 'Планшет Apple iPad Pro 2021 11&quot; 2Tb Wi-Fi MHR23RU/A,  16ГБ, 2ТБ серый космос', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(19, 1, 'Планшет Apple iPad Pro 2021 12.9&quot; 1Tb Wi-Fi MHNN3RU/A,  16ГБ, 1ТБ серебристый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(20, 1, 'Планшет Apple iPad Pro 2021 11&quot; 1Tb Wi-Fi MHQY3RU/A,  16ГБ, 1ТБ серый космос', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(21, 1, 'Квадрокоптер DJI Mavic 3 Fly More Combo с камерой,  серый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', '[{\"content\":\"\\u0425\\u0438\\u0442\",\"class\":\"tag is-warning\"}]'),
(22, 2, 'DJI AIR 2S Fly More Combo Smart Controller Quadcopter with Camera, Gray', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', '[{\"content\":\"Hot\",\"class\":\"tag is-warning\"}]'),
(23, 1, 'Квадрокоптер AUTEL EVO Lite+ Standard Package MDXM2 с камерой,  оранжевый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(24, 1, 'Квадрокоптер AUTEL EVO Nano+ Standard Package MDA2 с камерой,  оранжевый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', '[]'),
(25, 1, 'Квадрокоптер HIPER HQC-0001 Shadow FPV с камерой,  черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', '[]'),
(26, 1, 'Квадрокоптер Syma X5UW-D с камерой,  белый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', '[]'),
(27, 1, 'Квадрокоптер FLYBOTIC Бампер Дрон без камеры,  синий', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', '[]'),
(28, 1, 'Квадрокоптер HIPER HQC-0030 Sky Patrol FPV с камерой,  черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', '[]'),
(29, 1, 'Квадрокоптер HIPER HQC-0003 Falcon X FPV с камерой,  черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', '[]'),
(30, 1, 'Квадрокоптер Syma X5UW с камерой,  красный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', '[]'),
(31, 1, 'Наушники Sony XBA-Z5, 3.5 мм, черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(32, 1, 'Наушники Pioneer HDJ-X10-S, 6.3 мм, серебристый/черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(33, 1, 'Наушники Sennheiser IE 80S BT, Bluetooth, черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(34, 1, 'Наушники FIIO FH7, 3.5 мм, черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(35, 1, 'Гарнитура Philips L3/00, Bluetooth/USB Type-C, черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(36, 2, 'Headphones Audio-Technica ATH-ANC900BT, 3.5 mm/Bluetooth, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', '[{\"content\":\"Good price\",\"class\":\"tag is-success\"}]'),
(37, 1, 'Наушники Pioneer HDJ-S7, 3.5 мм/6.3 мм, черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(38, 1, 'Гарнитура Sony WH-H910N, 3.5 мм/Bluetooth, синий', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(39, 2, 'Headphones FIIO FD5, 2.5 mm/3.5 mm/4.4 mm, silver', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', '[]'),
(40, 1, 'Гарнитура внутриканальные Apple AirPods Pro 2 A2698 A2699 A2700 белый беспроводные bluetooth (MQD83Z', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(42, 2, 'Wireless charger Canyon WS-404, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', '[]'),
(43, 1, 'Сетевое зарядное устройство SATECHI Compact Charger,  серый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(44, 1, 'Беспроводное зарядное устройство Prestigio ReVolt A7 3 в 1,  черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(46, 1, 'Сетевое зарядное устройство Canyon H-100,  белый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(47, 1, 'Беспроводное зарядное устройство Prestigio Revolt A9 3 в 1,  серый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(48, 1, 'Беспроводное зарядное устройство Apple MagSafe MHXH3ZE/A,  белый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(49, 1, 'Беспроводное зарядное устройство Samsung EP-P2400,  белый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(50, 1, 'Беспроводное зарядное устройство Samsung EP-P2400,  черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(51, 1, 'Ноутбук MSI CreatorPro X17 A12UMS-205RU, 9S7-17Q121-205,  черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(52, 1, 'Ноутбук Apple MacBook Pro A2485 M1 Max 10 core/32Gb/SSD1Tb/32 core GPU/16.2&quot;/Mac OS/grey space', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(53, 1, 'Ноутбук MSI CreatorPro X17 A12UKS-206RU, 9S7-17Q121-206,  черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(54, 1, 'Ноутбук MSI Creator Z16P B12UHST-028RU, 9S7-15G121-028,  серый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(55, 1, 'Ноутбук Apple MacBook Pro, Z15K0007A,  серебристый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(56, 1, 'Ноутбук Apple MacBook Pro A2485, MK1A3B/A,  серый космос', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(57, 1, 'Ноутбук MSI Raider GE77HX 12UHS-232RU, 9S7-17K514-232,  темно-серый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(58, 1, 'Ноутбук MSI CreatorPro Z16P B12UKST-222RU, 9S7-15G121-222,  серый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(59, 1, 'Ноутбук Apple MacBook Pro A2485 M1 Pro 10 core/16Gb/SSD512Gb/16 core GPU/16.2&quot;/Mac OS/silver', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(60, 1, 'Ноутбук Apple MacBook Pro A2485 M1 Pro 10 core/16Gb/SSD512Gb/16 core GPU/16.2&quot;/Mac OS/grey space', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(61, 1, 'Моноблок DELL Optiplex 7490, 23.8&quot;, Intel Core i5 11500, 8ГБ, 512ГБ SSD,  Intel UHD Graphics 750, Windows 10 Professional, черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(62, 1, 'Моноблок Apple iMac MHK03RU/A, 21.5&quot;, Intel Core i5 7360U, 8ГБ, 256ГБ SSD,  Intel Iris Plus Graphics 640, macOS, серебристый и черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(63, 2, 'Monoblock Lenovo IdeaCentre А540-ICB, 23.8&quot;, Intel Core i5 9400T, 8GB, 1000GB SSD, Intel UHD Graphics 630, Free DOS, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', '[{\"content\":\"New\",\"class\":\"tag is-black\"}]'),
(64, 1, 'Моноблок Lenovo V30a-24IIL, 23.8&quot;, Intel Core i5 1035G1, 8ГБ, 512ГБ SSD,  Intel UHD Graphics, DVD-RW, Windows 10 Professional, черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(65, 1, 'Моноблок Lenovo V30a-24IIL, 23.8&quot;, Intel Core i5 1035G1, 8ГБ, 512ГБ SSD,  Intel UHD Graphics, DVD-RW, noOS, черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(66, 1, 'Моноблок Acer Aspire C24-1650, 23.8&quot;, Intel Core i3 1115G4, 8ГБ, 512ГБ SSD,  Intel UHD Graphics, Windows 11 Home, серебристый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(67, 1, 'Моноблок Acer Veriton EZ2740G, 23.8&quot;, Intel Core i3 1115G4, 8ГБ, 256ГБ SSD,  Intel UHD Graphics, Windows 10 Professional, черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(68, 1, 'Моноблок Acer Aspire C24-1650, 23.8&quot;, Intel Core i3 1115G4, 8ГБ, 256ГБ SSD,  Intel UHD Graphics, Windows 11 Home, серебристый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(69, 1, 'Моноблок Lenovo V30a-24IIL, 23.8&quot;, Intel Core i3 1005G1, 8ГБ, 256ГБ SSD,  Intel UHD Graphics, Windows 10 Professional, черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(70, 1, 'Моноблок Acer Veriton Z4880G, 23.8&quot;, Intel Core i3 10105, 8ГБ, 256ГБ SSD,  Intel UHD Graphics 630, noOS, черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(71, 1, 'Монитор DELL UltraSharp UP3221Q 31.5&quot;, черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(72, 1, 'Монитор игровой ASUS ROG Strix XG438QR 43&quot; черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(73, 1, 'Монитор BenQ SW271C 27&quot;, черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(74, 1, 'Монитор игровой ASUS ROG Swift PG259QNR 24.5&quot; темно-серый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(75, 1, 'Монитор игровой Acer CB382CURbmiiphuzx 37.5&quot; черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(76, 1, 'Монитор Philips 498P9Z 49&quot;, черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(77, 1, 'Монитор Philips 499P9H 48.8&quot;, черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(78, 1, 'Монитор игровой ASUS ROG Swift PG279QM 27&quot; черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(79, 1, 'Монитор игровой GIGABYTE M32UC 31.5&quot; черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(80, 1, 'Монитор игровой GIGABYTE Aorus FI32Q-X 32&quot; черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(81, 1, 'Принтер лазерный HP LaserJet Enterprise 800 M806dn черно-белый, цвет черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(82, 1, 'Принтер лазерный Kyocera P3155dn + картридж,  черно-белый, цвет белый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(83, 1, 'Принтер лазерный Kyocera P3155dn черно-белый, цвет белый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(84, 1, 'Принтер лазерный Kyocera P3145dn + картридж,  черно-белый, цвет белый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(85, 1, 'Принтер лазерный Kyocera P3145dn черно-белый, цвет белый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(86, 1, 'Принтер лазерный КАТЮША P247 черно-белый, цвет черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(87, 1, 'Принтер лазерный Brother HL-L9310CDW цветной, цвет белый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(88, 1, 'Принтер лазерный Kyocera Color P5021cdw цветной, цвет белый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(89, 1, 'Принтер струйный Epson L1800 цветной, цвет черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(90, 1, 'Принтер лазерный HP Color LaserJet Enterprise M554dn цветной, цвет белый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(91, 1, 'Колонки Bluetooth Sven MC-30,  2.0,  черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(92, 2, 'Bluetooth speakers Creative Stage 360, 2.1, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', '[]'),
(93, 1, 'Колонки Bluetooth Edifier G7000,  1.1,  черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(94, 1, 'Колонки Bluetooth Edifier R1700BTs,  2.0,  коричневый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(95, 1, 'Колонки Sven HT-200,  5.1,  черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(96, 1, 'Колонки Bluetooth Oklick OK-117 BT,  2.0,  черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(97, 1, 'Колонки JBL Quantum Duo,  2.0,  черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(98, 1, 'Колонки Sven HT-210,  5.1,  черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(99, 1, 'Колонки Creative GigaWorks T40 series II,  2.0,  черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(100, 1, 'Колонки Bluetooth Sven MS-2250,  2.1,  черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', ''),
(1, 2, 'Smartphone Samsung Galaxy Z Fold 4 12/256Gb, SM-F936B, beige', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', '[]'),
(2, 2, 'Smartphone Samsung Galaxy Z Fold 4 SM-F936B 512Gb 12Gb gray green 3G 4G 2Sim 7.6&quot; AMOLED 1812x2176 And', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(3, 2, 'Smartphone Apple iPhone 13 Pro 512Gb, MLWA3RU/A, silver', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(4, 2, 'Smartphone Samsung Galaxy Z Fold 4 SM-F936B 512Gb 12Gb black 3G 4G 2Sim 7.6&quot; AMOLED 1812x2176 And12 5', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(5, 2, 'Smartphone Samsung Galaxy Z Fold 4 SM-F936B 512Gb 12Gb beige 3G 4G 2Sim 7.6&quot; Dynamic AMOLED 2X 1812x', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(6, 2, 'Smartphone Xiaomi 12 Pro 12/256Gb, purple', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(7, 2, 'Smartphone Apple iPhone 11 Pro 512Gb, MWCE2RU/A, silver', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', '[{\"content\":\"Trade In\",\"class\":\"tag is-danger\"}]'),
(8, 2, 'Smartphone Samsung Galaxy Z Fold 4 12/256Gb, SM-F936B, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(9, 2, 'Smartphone Samsung Galaxy Z Fold 4 12/256Gb, SM-F936B, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(10, 2, 'Smartphone Samsung Galaxy Z Fold 4 SM-F936B 256Gb 12Gb black 3G 4G 2Sim 7.6&quot; AMOLED 1812x2176 And12 5', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `meta_h1`, `stickers`) VALUES
(11, 2, 'Tablet Apple iPad Pro 2021 11&quot; 2Tb Wi-Fi + Cellular MHWE3RU/A, 16GB, 2TB, 4G space gray', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(12, 2, 'Tablet Apple iPad Pro 2021 12.9&quot; 2Tb Wi-Fi MHNQ3RU/A, 16GB, 2TB silver', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(13, 2, 'Tablet Apple iPad Pro 2021 12.9&quot; 1Tb Wi-Fi MHNN3RU/A, 16GB, 1TB silver', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(14, 2, 'Tablet Apple iPad Pro 2021 12.9&quot; 2Tb Wi-Fi MHNP3RU/A, 16GB, 2TB space gray', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(15, 2, 'Tablet Apple iPad Pro 2021 12.9&quot; 2Tb Wi-Fi MHNQ3RU/A, 16GB, 2TB silver', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(16, 2, 'Tablet Apple iPad Pro 2021 12.9&quot; 512Gb Wi-Fi MHNK3RU/A, 8GB, 512GB space gray', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(17, 2, 'Tablet Apple iPad Pro 2021 11&quot; 2Tb Wi-Fi MHR33RU/A, 16GB, 2TB silver', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(18, 2, 'Tablet Apple iPad Pro 2021 11&quot; 2Tb Wi-Fi MHR23RU/A, 16GB, 2TB space gray', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(19, 2, 'Tablet Apple iPad Pro 2021 12.9&quot; 1Tb Wi-Fi MHNN3RU/A, 16GB, 1TB silver', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(20, 2, 'Tablet Apple iPad Pro 2021 11&quot; 1Tb Wi-Fi MHQY3RU/A, 16GB, 1TB space gray', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(21, 2, 'Quadcopter DJI Mavic 3 Fly More Combo with camera, gray', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', '[{\"content\":\"Hot\",\"class\":\"tag is-warning\"}]'),
(23, 2, 'Quadcopter AUTEL EVO Lite+ Standard Package MDXM2 with camera, orange', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(24, 2, 'Quadcopter AUTEL EVO Nano+ Standard Package MDA2 with camera, orange', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', '[]'),
(25, 2, 'HIPER HQC-0001 Shadow FPV quadcopter with camera, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', '[]'),
(26, 2, 'Quadcopter Syma X5UW-D with camera, white', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', '[]'),
(27, 2, 'Quadcopter FLYBOTIC Bumper Drone without camera, blue', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', '[]'),
(28, 2, 'Quadcopter HIPER HQC-0030 Sky Patrol FPV with camera, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', '[]'),
(29, 2, 'Quadcopter HIPER HQC-0003 Falcon X FPV with camera, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', '[]'),
(30, 2, 'Quadcopter Syma X5UW with camera, red', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', '[]'),
(31, 2, 'Headphones Sony XBA-Z5, 3.5 mm, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(32, 2, 'Headphones Pioneer HDJ-X10-S, 6.3 mm, silver/black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(33, 2, 'Headphones Sennheiser IE 80S BT, Bluetooth, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(34, 2, 'Headphones FIIO FH7, 3.5 mm, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(35, 2, 'Headset Philips L3/00, Bluetooth/USB Type-C, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(37, 2, 'Headphones Pioneer HDJ-S7, 3.5 mm/6.3 mm, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(38, 2, 'Headset Sony WH-H910N, 3.5 mm/Bluetooth, blue', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(1, 1, 'Смартфон Samsung Galaxy Z Fold 4 12/256Gb,  SM-F936B,  бежевый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', '[]'),
(40, 2, 'Headset in-ear Apple AirPods Pro 2 A2698 A2699 A2700 white wireless bluetooth (MQD83Z', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(41, 1, 'Беспроводное зарядное устройство Apple MagSafe Duo,  белый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', '[]'),
(42, 1, 'Беспроводное зарядное устройство Canyon WS-404,  черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', '[]'),
(43, 2, 'AC charger SATECHI Compact Charger, gray', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(44, 2, 'Wireless charger Prestigio ReVolt A7 3 in 1, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(45, 1, 'Беспроводное зар./устр. Xiaomi 50W Wireless Charging Stand 3.25A (PD) универсальное черный/золотисты', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', 'хороший продукт, куплю ещё', '', '', '', '', '[{\"content\":\"&lt;b&gt;\\u041d\\u0430\\u0448 \\u0432\\u044b\\u0431\\u043e\\u0440&lt;\\/b&gt;\",\"class\":\"tag is-warning mb-1\"},{\"content\":\"\\u0412\\u0430\\u0448\\u0430 \\u0432\\u044b\\u0433\\u043e\\u0434\\u0430\",\"class\":\"tag is-success\"}]'),
(46, 2, 'Mains charger Canyon H-100, white', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(47, 2, 'Wireless charger Prestigio Revolt A9 3 in 1, gray', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(48, 2, 'Apple MagSafe MHXH3ZE/A Wireless Charger, White', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(49, 2, 'Wireless charger Samsung EP-P2400, white', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(50, 2, 'Wireless charger Samsung EP-P2400, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(51, 2, 'Notebook MSI CreatorPro X17 A12UMS-205RU, 9S7-17Q121-205, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(52, 2, 'Notebook Apple MacBook Pro A2485 M1 Max 10 core/32Gb/SSD1Tb/32 core GPU/16.2&quot;/Mac OS/grey space', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(53, 2, 'Notebook MSI CreatorPro X17 A12UKS-206RU, 9S7-17Q121-206, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(54, 2, 'Notebook MSI Creator Z16P B12UHST-028RU, 9S7-15G121-028, gray', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(55, 2, 'Notebook Apple MacBook Pro, Z15K0007A, silver', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(56, 2, 'Notebook Apple MacBook Pro A2485, MK1A3B/A, space gray', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(57, 2, 'Notebook MSI Raider GE77HX 12UHS-232RU, 9S7-17K514-232, dark gray', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(58, 2, 'Notebook MSI CreatorPro Z16P B12UKST-222RU, 9S7-15G121-222, gray', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(59, 2, 'Notebook Apple MacBook Pro A2485 M1 Pro 10 core/16Gb/SSD512Gb/16 core GPU/16.2&quot;/Mac OS/silver', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(60, 2, 'Notebook Apple MacBook Pro A2485 M1 Pro 10 core/16Gb/SSD512Gb/16 core GPU/16.2&quot;/Mac OS/grey space', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(61, 2, 'Monoblock DELL Optiplex 7490, 23.8&quot;, Intel Core i5 11500, 8GB, 512GB SSD, Intel UHD Graphics 750, Windows 10 Professional, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(62, 2, 'Apple iMac MHK03RU/A All-in-One, 21.5&quot;, Intel Core i5 7360U, 8GB, 256GB SSD, Intel Iris Plus Graphics 640, macOS, Silver &amp; Black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(64, 2, 'Monoblock Lenovo V30a-24IIL, 23.8&quot;, Intel Core i5 1035G1, 8GB, 512GB SSD, Intel UHD Graphics, DVD-RW, Windows 10 Professional, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(65, 2, 'Monoblock Lenovo V30a-24IIL, 23.8&quot;, Intel Core i5 1035G1, 8GB, 512GB SSD, Intel UHD Graphics, DVD-RW, noOS, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(66, 2, 'Monoblock Acer Aspire C24-1650, 23.8&quot;, Intel Core i3 1115G4, 8GB, 512GB SSD, Intel UHD Graphics, Windows 11 Home, silver', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(67, 2, 'Monoblock Acer Veriton EZ2740G, 23.8&quot;, Intel Core i3 1115G4, 8GB, 256GB SSD, Intel UHD Graphics, Windows 10 Professional, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(68, 2, 'Monoblock Acer Aspire C24-1650, 23.8&quot;, Intel Core i3 1115G4, 8GB, 256GB SSD, Intel UHD Graphics, Windows 11 Home, silver', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(69, 2, 'Monoblock Lenovo V30a-24IIL, 23.8&quot;, Intel Core i3 1005G1, 8GB, 256GB SSD, Intel UHD Graphics, Windows 10 Professional, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(70, 2, 'Monoblock Acer Veriton Z4880G, 23.8&quot;, Intel Core i3 10105, 8GB, 256GB SSD, Intel UHD Graphics 630, noOS, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(71, 2, 'Monitor DELL UltraSharp UP3221Q 31.5&quot;, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(72, 2, 'Gaming monitor ASUS ROG Strix XG438QR 43&quot; black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(73, 2, 'Monitor BenQ SW271C 27&quot;, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(74, 2, 'ASUS ROG Swift PG259QNR 24.5&quot; gaming monitor dark gray', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(75, 2, 'Gaming monitor Acer CB382CURbmiiphuzx 37.5&quot; black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(76, 2, 'Philips 498P9Z 49&quot; monitor, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(77, 2, 'Monitor Philips 499P9H 48.8&quot;, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(78, 2, 'Gaming monitor ASUS ROG Swift PG279QM 27&quot; black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(79, 2, 'Gaming monitor GIGABYTE M32UC 31.5&quot; black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(80, 2, 'GIGABYTE Aorus FI32Q-X 32&quot; gaming monitor black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(81, 2, 'Printer laser HP LaserJet Enterprise 800 M806dn black and white, color black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(82, 2, 'Laser printer Kyocera P3155dn + cartridge, black and white, color white', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(83, 2, 'Laser printer Kyocera P3155dn black and white, color white', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(84, 2, 'Laser printer Kyocera P3145dn + cartridge, black and white, color white', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(85, 2, 'Laser printer Kyocera P3145dn black and white, color white', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(86, 2, 'Printer laser KATYUSHA P247 black and white, color black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(87, 2, 'Printer laser Brother HL-L9310CDW color, color white', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(88, 2, 'Printer laser Kyocera Color P5021cdw color, color white', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(89, 2, 'Inkjet printer Epson L1800 color, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(90, 2, 'Laser printer HP Color LaserJet Enterprise M554dn color, white', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(91, 2, 'Bluetooth speakers Sven MC-30, 2.0, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(92, 1, 'Колонки Bluetooth Creative Stage 360,  2.1,  черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', '[]'),
(93, 2, 'Bluetooth speakers Edifier G7000, 1.1, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(94, 2, 'Bluetooth speakers Edifier R1700BTs, 2.0, brown', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(95, 2, 'Speakers Sven HT-200, 5.1, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(96, 2, 'Bluetooth speakers Oklick OK-117 BT, 2.0, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(97, 2, 'Speakers JBL Quantum Duo, 2.0, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(98, 2, 'Speakers Sven HT-210, 5.1, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(99, 2, 'Speakers Creative GigaWorks T40 series II, 2.0, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(100, 2, 'Bluetooth speakers Sven MS-2250, 2.1, black', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', ''),
(7, 1, 'Смартфон Apple iPhone 11 Pro 512Gb,  MWCE2RU/A,  серебристый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', '[{\"content\":\"Trade In\",\"class\":\"tag is-danger\"}]'),
(41, 2, 'Apple MagSafe Duo Wireless Charger, White', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', '[]'),
(45, 2, 'Wireless Charger/Device Xiaomi 50W Wireless Charging Stand 3.25A (PD) universal black/gold', 'This is the description for the item. It can be a couple of sentences about nothing, or it can be meaningful text informing the user about your product or service. It all depends on the approach, the more detailed it is, the more responsibly you need to approach the content on the site, do you want to sell what you sell? It was a rhetorical question, food for thought.', '', '', '', '', '', '[{\"content\":\"&lt;b&gt;Our choice&lt;\\/b&gt;\",\"class\":\"tag is-warning\"},{\"content\":\"Your benefit\",\"class\":\"tag is-success\"}]'),
(39, 1, 'Наушники FIIO FD5, 2.5 мм/3.5 мм/4.4 мм, серебристый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', '[]'),
(63, 1, 'Моноблок Lenovo IdeaCentre А540-ICB, 23.8&quot;, Intel Core i5 9400T, 8ГБ, 1000ГБ SSD,  Intel UHD Graphics 630, Free DOS, черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', '[{\"content\":\"\\u041d\\u043e\\u0432\\u0438\\u043d\\u043a\\u0430\",\"class\":\"tag is-black\"}]'),
(22, 1, 'Квадрокоптер DJI AIR 2S Fly More Combo Smart Controller с камерой,  серый', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', '[{\"content\":\"\\u0425\\u0438\\u0442\",\"class\":\"tag is-warning\"}]'),
(36, 1, 'Наушники Audio-Technica ATH-ANC900BT, 3.5 мм/Bluetooth, черный', 'Это описание для товара. Может быть парой предложений ни о чем, а может быть содержательным текстом информирующим пользователя о вашем продукте или услуге. Тут все зависит от подхода, чем он обстоятельнее, тем ответственнее нужно подходить к контенту на сайте, вы же хотите продать то что вы продаете? Это был риторический вопрос, пища для размышлений.', '', '', '', '', '', '[{\"content\":\"\\u0412\\u044b\\u0433\\u043e\\u0434\\u043d\\u043e\",\"class\":\"tag is-success\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_discount`
--

CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_filter`
--

CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_product_filter`
--

INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES
(1, 7),
(7, 1),
(7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_image`
--

CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `title`, `sort_order`) VALUES
(1993, 1, 'catalog/demo/products/42069_5.jpg', '', 5),
(1992, 1, 'catalog/demo/products/42069_4.jpg', '', 4),
(1991, 1, 'catalog/demo/products/42069_3.jpg', '', 3),
(1990, 1, 'catalog/demo/products/42069_2.jpg', '', 2),
(1989, 1, 'catalog/demo/products/42069_1.jpg', '', 1),
(6, 2, 'catalog/demo/products/42070_1.jpg', '', 1),
(7, 2, 'catalog/demo/products/42070_2.jpg', '', 2),
(8, 2, 'catalog/demo/products/42070_3.jpg', '', 3),
(9, 2, 'catalog/demo/products/42070_4.jpg', '', 4),
(10, 2, 'catalog/demo/products/42070_5.jpg', '', 5),
(11, 3, 'catalog/demo/products/42071_1.jpg', '', 1),
(12, 3, 'catalog/demo/products/42071_2.jpg', '', 2),
(13, 3, 'catalog/demo/products/42071_3.jpg', '', 3),
(14, 3, 'catalog/demo/products/42071_4.jpg', '', 4),
(15, 3, 'catalog/demo/products/42071_5.jpg', '', 5),
(16, 4, 'catalog/demo/products/42072_1.jpg', '', 1),
(17, 4, 'catalog/demo/products/42072_2.jpg', '', 2),
(18, 4, 'catalog/demo/products/42072_3.jpg', '', 3),
(19, 4, 'catalog/demo/products/42072_4.jpg', '', 4),
(20, 4, 'catalog/demo/products/42072_5.jpg', '', 5),
(21, 5, 'catalog/demo/products/42073_1.jpg', '', 1),
(22, 5, 'catalog/demo/products/42073_2.jpg', '', 2),
(23, 5, 'catalog/demo/products/42073_3.jpg', '', 3),
(24, 5, 'catalog/demo/products/42073_4.jpg', '', 4),
(25, 5, 'catalog/demo/products/42073_5.jpg', '', 5),
(26, 6, 'catalog/demo/products/42074_1.jpg', '', 1),
(27, 6, 'catalog/demo/products/42074_2.jpg', '', 2),
(28, 6, 'catalog/demo/products/42074_3.jpg', '', 3),
(29, 6, 'catalog/demo/products/42074_4.jpg', '', 4),
(30, 6, 'catalog/demo/products/42074_5.jpg', '', 5),
(35, 8, 'catalog/demo/products/42076_1.jpg', '', 1),
(36, 8, 'catalog/demo/products/42076_2.jpg', '', 2),
(37, 8, 'catalog/demo/products/42076_3.jpg', '', 3),
(38, 8, 'catalog/demo/products/42076_4.jpg', '', 4),
(39, 8, 'catalog/demo/products/42076_5.jpg', '', 5),
(40, 9, 'catalog/demo/products/42077_1.jpg', '', 1),
(41, 9, 'catalog/demo/products/42077_2.jpg', '', 2),
(42, 9, 'catalog/demo/products/42077_3.jpg', '', 3),
(43, 9, 'catalog/demo/products/42077_4.jpg', '', 4),
(44, 9, 'catalog/demo/products/42077_5.jpg', '', 5),
(45, 10, 'catalog/demo/products/42078_1.jpg', '', 1),
(46, 10, 'catalog/demo/products/42078_2.jpg', '', 2),
(47, 10, 'catalog/demo/products/42078_3.jpg', '', 3),
(48, 10, 'catalog/demo/products/42078_4.jpg', '', 4),
(49, 10, 'catalog/demo/products/42078_5.jpg', '', 5),
(50, 11, 'catalog/demo/products/42117_1.jpg', '', 1),
(51, 11, 'catalog/demo/products/42117_2.jpg', '', 2),
(52, 11, 'catalog/demo/products/42117_3.jpg', '', 3),
(53, 11, 'catalog/demo/products/42117_4.jpg', '', 4),
(54, 11, 'catalog/demo/products/42117_5.jpg', '', 5),
(55, 12, 'catalog/demo/products/42118_1.jpg', '', 1),
(56, 12, 'catalog/demo/products/42118_2.jpg', '', 2),
(57, 12, 'catalog/demo/products/42118_3.jpg', '', 3),
(58, 12, 'catalog/demo/products/42118_4.jpg', '', 4),
(59, 12, 'catalog/demo/products/42118_5.jpg', '', 5),
(60, 13, 'catalog/demo/products/42119_1.jpg', '', 1),
(61, 13, 'catalog/demo/products/42119_2.jpg', '', 2),
(62, 13, 'catalog/demo/products/42119_3.jpg', '', 3),
(63, 13, 'catalog/demo/products/42119_4.jpg', '', 4),
(64, 13, 'catalog/demo/products/42119_5.jpg', '', 5),
(65, 14, 'catalog/demo/products/42120_1.jpg', '', 1),
(66, 14, 'catalog/demo/products/42120_2.jpg', '', 2),
(67, 14, 'catalog/demo/products/42120_3.jpg', '', 3),
(68, 14, 'catalog/demo/products/42120_4.jpg', '', 4),
(69, 14, 'catalog/demo/products/42120_5.jpg', '', 5),
(70, 15, 'catalog/demo/products/42121_1.jpg', '', 1),
(71, 15, 'catalog/demo/products/42121_2.jpg', '', 2),
(72, 15, 'catalog/demo/products/42121_3.jpg', '', 3),
(73, 15, 'catalog/demo/products/42121_4.jpg', '', 4),
(74, 15, 'catalog/demo/products/42121_5.jpg', '', 5),
(75, 16, 'catalog/demo/products/42122_1.jpg', '', 1),
(76, 16, 'catalog/demo/products/42122_2.jpg', '', 2),
(77, 16, 'catalog/demo/products/42122_3.jpg', '', 3),
(78, 16, 'catalog/demo/products/42122_4.jpg', '', 4),
(79, 16, 'catalog/demo/products/42122_5.jpg', '', 5),
(80, 17, 'catalog/demo/products/42123_1.jpg', '', 1),
(81, 17, 'catalog/demo/products/42123_2.jpg', '', 2),
(82, 17, 'catalog/demo/products/42123_3.jpg', '', 3),
(83, 17, 'catalog/demo/products/42123_4.jpg', '', 4),
(84, 17, 'catalog/demo/products/42123_5.jpg', '', 5),
(85, 18, 'catalog/demo/products/42124_1.jpg', '', 1),
(86, 18, 'catalog/demo/products/42124_2.jpg', '', 2),
(87, 18, 'catalog/demo/products/42124_3.jpg', '', 3),
(88, 18, 'catalog/demo/products/42124_4.jpg', '', 4),
(89, 18, 'catalog/demo/products/42124_5.jpg', '', 5),
(90, 19, 'catalog/demo/products/42125_1.jpg', '', 1),
(91, 19, 'catalog/demo/products/42125_2.jpg', '', 2),
(92, 19, 'catalog/demo/products/42125_3.jpg', '', 3),
(93, 19, 'catalog/demo/products/42125_4.jpg', '', 4),
(94, 19, 'catalog/demo/products/42125_5.jpg', '', 5),
(95, 20, 'catalog/demo/products/42126_1.jpg', '', 1),
(96, 20, 'catalog/demo/products/42126_2.jpg', '', 2),
(97, 20, 'catalog/demo/products/42126_3.jpg', '', 3),
(98, 20, 'catalog/demo/products/42126_4.jpg', '', 4),
(99, 20, 'catalog/demo/products/42126_5.jpg', '', 5),
(100, 21, 'catalog/demo/products/42165_1.jpg', '', 1),
(101, 21, 'catalog/demo/products/42165_2.jpg', '', 2),
(102, 21, 'catalog/demo/products/42165_3.jpg', '', 3),
(103, 21, 'catalog/demo/products/42165_4.jpg', '', 4),
(104, 21, 'catalog/demo/products/42165_5.jpg', '', 5),
(1777, 22, 'catalog/demo/products/42166_5.jpg', '', 5),
(1776, 22, 'catalog/demo/products/42166_4.jpg', '', 4),
(1775, 22, 'catalog/demo/products/42166_3.jpg', '', 3),
(1774, 22, 'catalog/demo/products/42166_2.jpg', '', 2),
(1773, 22, 'catalog/demo/products/42166_1.jpg', '', 1),
(110, 23, 'catalog/demo/products/42167_1.jpg', '', 1),
(111, 23, 'catalog/demo/products/42167_2.jpg', '', 2),
(112, 23, 'catalog/demo/products/42167_3.jpg', '', 3),
(113, 23, 'catalog/demo/products/42167_4.jpg', '', 4),
(114, 23, 'catalog/demo/products/42167_5.jpg', '', 5),
(115, 24, 'catalog/demo/products/42168_1.jpg', '', 1),
(116, 24, 'catalog/demo/products/42168_2.jpg', '', 2),
(117, 24, 'catalog/demo/products/42168_3.jpg', '', 3),
(118, 24, 'catalog/demo/products/42168_4.jpg', '', 4),
(119, 24, 'catalog/demo/products/42168_5.jpg', '', 5),
(120, 25, 'catalog/demo/products/42169_1.jpg', '', 1),
(121, 25, 'catalog/demo/products/42169_2.jpg', '', 2),
(122, 25, 'catalog/demo/products/42169_3.jpg', '', 3),
(123, 25, 'catalog/demo/products/42169_4.jpg', '', 4),
(124, 25, 'catalog/demo/products/42169_5.jpg', '', 5),
(125, 26, 'catalog/demo/products/42170_1.jpg', '', 1),
(126, 26, 'catalog/demo/products/42170_2.jpg', '', 2),
(127, 26, 'catalog/demo/products/42170_3.jpg', '', 3),
(128, 26, 'catalog/demo/products/42170_4.jpg', '', 4),
(129, 26, 'catalog/demo/products/42170_5.jpg', '', 5),
(130, 27, 'catalog/demo/products/42171_1.jpg', '', 1),
(131, 27, 'catalog/demo/products/42171_2.jpg', '', 2),
(132, 27, 'catalog/demo/products/42171_3.jpg', '', 3),
(133, 28, 'catalog/demo/products/42172_1.jpg', '', 1),
(134, 28, 'catalog/demo/products/42172_2.jpg', '', 2),
(135, 28, 'catalog/demo/products/42172_3.jpg', '', 3),
(136, 28, 'catalog/demo/products/42172_4.jpg', '', 4),
(137, 28, 'catalog/demo/products/42172_5.jpg', '', 5),
(138, 29, 'catalog/demo/products/42173_1.jpg', '', 1),
(139, 29, 'catalog/demo/products/42173_2.jpg', '', 2),
(140, 29, 'catalog/demo/products/42173_3.jpg', '', 3),
(141, 29, 'catalog/demo/products/42173_4.jpg', '', 4),
(142, 29, 'catalog/demo/products/42173_5.jpg', '', 5),
(143, 30, 'catalog/demo/products/42174_1.jpg', '', 1),
(144, 30, 'catalog/demo/products/42174_2.jpg', '', 2),
(145, 30, 'catalog/demo/products/42174_3.jpg', '', 3),
(146, 30, 'catalog/demo/products/42174_4.jpg', '', 4),
(147, 30, 'catalog/demo/products/42174_5.jpg', '', 5),
(148, 31, 'catalog/demo/products/42183_1.jpg', '', 1),
(149, 31, 'catalog/demo/products/42183_2.jpg', '', 2),
(150, 31, 'catalog/demo/products/42183_3.jpg', '', 3),
(151, 31, 'catalog/demo/products/42183_4.jpg', '', 4),
(152, 31, 'catalog/demo/products/42183_5.jpg', '', 5),
(153, 32, 'catalog/demo/products/42184_1.jpg', '', 1),
(154, 32, 'catalog/demo/products/42184_2.jpg', '', 2),
(155, 32, 'catalog/demo/products/42184_3.jpg', '', 3),
(156, 32, 'catalog/demo/products/42184_4.jpg', '', 4),
(157, 32, 'catalog/demo/products/42184_5.jpg', '', 5),
(158, 33, 'catalog/demo/products/42185_1.jpg', '', 1),
(159, 33, 'catalog/demo/products/42185_2.jpg', '', 2),
(160, 33, 'catalog/demo/products/42185_3.jpg', '', 3),
(161, 33, 'catalog/demo/products/42185_4.jpg', '', 4),
(162, 33, 'catalog/demo/products/42185_5.jpg', '', 5),
(163, 34, 'catalog/demo/products/42186_1.jpg', '', 1),
(164, 34, 'catalog/demo/products/42186_2.jpg', '', 2),
(165, 34, 'catalog/demo/products/42186_3.jpg', '', 3),
(166, 34, 'catalog/demo/products/42186_4.jpg', '', 4),
(167, 34, 'catalog/demo/products/42186_5.jpg', '', 5),
(168, 35, 'catalog/demo/products/42187_1.jpg', '', 1),
(169, 35, 'catalog/demo/products/42187_2.jpg', '', 2),
(170, 35, 'catalog/demo/products/42187_3.jpg', '', 3),
(171, 35, 'catalog/demo/products/42187_4.jpg', '', 4),
(172, 35, 'catalog/demo/products/42187_5.jpg', '', 5),
(1845, 36, 'catalog/demo/products/42188_5.jpg', '', 5),
(1844, 36, 'catalog/demo/products/42188_4.jpg', '', 4),
(1843, 36, 'catalog/demo/products/42188_3.jpg', '', 3),
(1842, 36, 'catalog/demo/products/42188_2.jpg', '', 2),
(1841, 36, 'catalog/demo/products/42188_1.jpg', '', 1),
(178, 37, 'catalog/demo/products/42189_1.jpg', '', 1),
(179, 37, 'catalog/demo/products/42189_2.jpg', '', 2),
(180, 37, 'catalog/demo/products/42189_3.jpg', '', 3),
(181, 37, 'catalog/demo/products/42189_4.jpg', '', 4),
(182, 37, 'catalog/demo/products/42189_5.jpg', '', 5),
(183, 38, 'catalog/demo/products/42190_1.jpg', '', 1),
(184, 38, 'catalog/demo/products/42190_2.jpg', '', 2),
(185, 38, 'catalog/demo/products/42190_3.jpg', '', 3),
(186, 38, 'catalog/demo/products/42190_4.jpg', '', 4),
(1855, 39, 'catalog/demo/products/42191_5.jpg', '', 5),
(1854, 39, 'catalog/demo/products/42191_4.jpg', '', 4),
(1853, 39, 'catalog/demo/products/42191_3.jpg', '', 3),
(1852, 39, 'catalog/demo/products/42191_2.jpg', '', 2),
(1851, 39, 'catalog/demo/products/42191_1.jpg', '', 1),
(192, 40, 'catalog/demo/products/42192_1.jpg', '', 1),
(193, 40, 'catalog/demo/products/42192_2.jpg', '', 2),
(194, 40, 'catalog/demo/products/42192_3.jpg', '', 3),
(195, 40, 'catalog/demo/products/42192_4.jpg', '', 4),
(196, 40, 'catalog/demo/products/42192_5.jpg', '', 5),
(1983, 41, 'catalog/demo/products/42231_5.jpg', '', 5),
(1982, 41, 'catalog/demo/products/42231_4.jpg', '', 4),
(1981, 41, 'catalog/demo/products/42231_3.jpg', '', 3),
(1980, 41, 'catalog/demo/products/42231_2.jpg', '', 2),
(1979, 41, 'catalog/demo/products/42231_1.jpg', '', 1),
(2002, 42, 'catalog/demo/products/42232_3.jpg', '', 3),
(2001, 42, 'catalog/demo/products/42232_2.jpg', '', 2),
(2000, 42, 'catalog/demo/products/42232_1.jpg', '', 1),
(205, 43, 'catalog/demo/products/42233_1.jpg', '', 1),
(206, 43, 'catalog/demo/products/42233_2.jpg', '', 2),
(207, 43, 'catalog/demo/products/42233_3.jpg', '', 3),
(208, 43, 'catalog/demo/products/42233_4.jpg', '', 4),
(209, 43, 'catalog/demo/products/42233_5.jpg', '', 5),
(210, 44, 'catalog/demo/products/42234_1.jpg', '', 1),
(211, 44, 'catalog/demo/products/42234_2.jpg', '', 2),
(212, 44, 'catalog/demo/products/42234_3.jpg', '', 3),
(213, 44, 'catalog/demo/products/42234_4.jpg', '', 4),
(1999, 45, 'catalog/demo/products/42235_3.jpg', '', 3),
(1998, 45, 'catalog/demo/products/42235_2.jpg', '', 2),
(1997, 45, 'catalog/demo/products/42235_1.jpg', '', 1),
(217, 46, 'catalog/demo/products/42236_1.jpg', '', 1),
(218, 46, 'catalog/demo/products/42236_2.jpg', '', 2),
(219, 46, 'catalog/demo/products/42236_3.jpg', '', 3),
(220, 47, 'catalog/demo/products/42237_1.jpg', '', 1),
(221, 47, 'catalog/demo/products/42237_2.jpg', '', 2),
(222, 47, 'catalog/demo/products/42237_3.jpg', '', 3),
(223, 47, 'catalog/demo/products/42237_4.jpg', '', 4),
(224, 47, 'catalog/demo/products/42237_5.jpg', '', 5),
(225, 48, 'catalog/demo/products/42238_1.jpg', '', 1),
(226, 48, 'catalog/demo/products/42238_2.jpg', '', 2),
(227, 49, 'catalog/demo/products/42239_1.jpg', '', 1),
(228, 49, 'catalog/demo/products/42239_2.jpg', '', 2),
(229, 49, 'catalog/demo/products/42239_3.jpg', '', 3),
(230, 49, 'catalog/demo/products/42239_4.jpg', '', 4),
(231, 49, 'catalog/demo/products/42239_5.jpg', '', 5),
(232, 50, 'catalog/demo/products/42240_1.jpg', '', 1),
(233, 50, 'catalog/demo/products/42240_2.jpg', '', 2),
(234, 50, 'catalog/demo/products/42240_3.jpg', '', 3),
(235, 50, 'catalog/demo/products/42240_4.jpg', '', 4),
(236, 50, 'catalog/demo/products/42240_5.jpg', '', 5),
(237, 51, 'catalog/demo/products/42279_1.jpg', '', 1),
(238, 51, 'catalog/demo/products/42279_2.jpg', '', 2),
(239, 52, 'catalog/demo/products/42280_1.jpg', '', 1),
(240, 52, 'catalog/demo/products/42280_2.jpg', '', 2),
(241, 52, 'catalog/demo/products/42280_3.jpg', '', 3),
(242, 52, 'catalog/demo/products/42280_4.jpg', '', 4),
(243, 52, 'catalog/demo/products/42280_5.jpg', '', 5),
(244, 53, 'catalog/demo/products/42281_1.jpg', '', 1),
(245, 53, 'catalog/demo/products/42281_2.jpg', '', 2),
(246, 54, 'catalog/demo/products/42282_1.jpg', '', 1),
(247, 54, 'catalog/demo/products/42282_2.jpg', '', 2),
(248, 54, 'catalog/demo/products/42282_3.jpg', '', 3),
(249, 54, 'catalog/demo/products/42282_4.jpg', '', 4),
(250, 54, 'catalog/demo/products/42282_5.jpg', '', 5),
(251, 55, 'catalog/demo/products/42283_1.jpg', '', 1),
(252, 55, 'catalog/demo/products/42283_2.jpg', '', 2),
(253, 55, 'catalog/demo/products/42283_3.jpg', '', 3),
(254, 55, 'catalog/demo/products/42283_4.jpg', '', 4),
(255, 55, 'catalog/demo/products/42283_5.jpg', '', 5),
(256, 56, 'catalog/demo/products/42284_1.jpg', '', 1),
(257, 56, 'catalog/demo/products/42284_2.jpg', '', 2),
(258, 56, 'catalog/demo/products/42284_3.jpg', '', 3),
(259, 56, 'catalog/demo/products/42284_4.jpg', '', 4),
(260, 56, 'catalog/demo/products/42284_5.jpg', '', 5),
(261, 57, 'catalog/demo/products/42285_1.jpg', '', 1),
(262, 57, 'catalog/demo/products/42285_2.jpg', '', 2),
(263, 57, 'catalog/demo/products/42285_3.jpg', '', 3),
(264, 57, 'catalog/demo/products/42285_4.jpg', '', 4),
(265, 57, 'catalog/demo/products/42285_5.jpg', '', 5),
(266, 58, 'catalog/demo/products/42287_1.jpg', '', 1),
(267, 58, 'catalog/demo/products/42287_2.jpg', '', 2),
(268, 58, 'catalog/demo/products/42287_3.jpg', '', 3),
(269, 58, 'catalog/demo/products/42287_4.jpg', '', 4),
(270, 58, 'catalog/demo/products/42287_5.jpg', '', 5),
(271, 59, 'catalog/demo/products/42288_1.jpg', '', 1),
(272, 59, 'catalog/demo/products/42288_2.jpg', '', 2),
(273, 59, 'catalog/demo/products/42288_3.jpg', '', 3),
(274, 59, 'catalog/demo/products/42288_4.jpg', '', 4),
(275, 59, 'catalog/demo/products/42288_5.jpg', '', 5),
(276, 60, 'catalog/demo/products/42289_1.jpg', '', 1),
(277, 60, 'catalog/demo/products/42289_2.jpg', '', 2),
(278, 60, 'catalog/demo/products/42289_3.jpg', '', 3),
(279, 60, 'catalog/demo/products/42289_4.jpg', '', 4),
(280, 60, 'catalog/demo/products/42289_5.jpg', '', 5),
(281, 61, 'catalog/demo/products/42327_1.jpg', '', 1),
(282, 61, 'catalog/demo/products/42327_2.jpg', '', 2),
(283, 61, 'catalog/demo/products/42327_3.jpg', '', 3),
(284, 61, 'catalog/demo/products/42327_4.jpg', '', 4),
(285, 61, 'catalog/demo/products/42327_5.jpg', '', 5),
(286, 62, 'catalog/demo/products/42328_1.jpg', '', 1),
(287, 62, 'catalog/demo/products/42328_2.jpg', '', 2),
(288, 62, 'catalog/demo/products/42328_3.jpg', '', 3),
(289, 62, 'catalog/demo/products/42328_4.jpg', '', 4),
(1913, 63, 'catalog/demo/products/42329_5.jpg', '', 5),
(1912, 63, 'catalog/demo/products/42329_4.jpg', '', 4),
(1911, 63, 'catalog/demo/products/42329_3.jpg', '', 3),
(1910, 63, 'catalog/demo/products/42329_2.jpg', '', 2),
(1909, 63, 'catalog/demo/products/42329_1.jpg', '', 1),
(295, 64, 'catalog/demo/products/42330_1.jpg', '', 1),
(296, 64, 'catalog/demo/products/42330_2.jpg', '', 2),
(297, 64, 'catalog/demo/products/42330_3.jpg', '', 3),
(298, 64, 'catalog/demo/products/42330_4.jpg', '', 4),
(299, 64, 'catalog/demo/products/42330_5.jpg', '', 5),
(300, 65, 'catalog/demo/products/42333_1.jpg', '', 1),
(301, 65, 'catalog/demo/products/42333_2.jpg', '', 2),
(302, 65, 'catalog/demo/products/42333_3.jpg', '', 3),
(303, 65, 'catalog/demo/products/42333_4.jpg', '', 4),
(304, 65, 'catalog/demo/products/42333_5.jpg', '', 5),
(305, 66, 'catalog/demo/products/42335_1.jpg', '', 1),
(306, 66, 'catalog/demo/products/42335_2.jpg', '', 2),
(307, 66, 'catalog/demo/products/42335_3.jpg', '', 3),
(308, 66, 'catalog/demo/products/42335_4.jpg', '', 4),
(309, 66, 'catalog/demo/products/42335_5.jpg', '', 5),
(310, 67, 'catalog/demo/products/42338_1.jpg', '', 1),
(311, 67, 'catalog/demo/products/42338_2.jpg', '', 2),
(312, 67, 'catalog/demo/products/42338_3.jpg', '', 3),
(313, 67, 'catalog/demo/products/42338_4.jpg', '', 4),
(314, 67, 'catalog/demo/products/42338_5.jpg', '', 5),
(315, 68, 'catalog/demo/products/42339_1.jpg', '', 1),
(316, 68, 'catalog/demo/products/42339_2.jpg', '', 2),
(317, 68, 'catalog/demo/products/42339_3.jpg', '', 3),
(318, 68, 'catalog/demo/products/42339_4.jpg', '', 4),
(319, 68, 'catalog/demo/products/42339_5.jpg', '', 5),
(320, 70, 'catalog/demo/products/42342_1.jpg', '', 1),
(321, 70, 'catalog/demo/products/42342_2.jpg', '', 2),
(322, 70, 'catalog/demo/products/42342_3.jpg', '', 3),
(323, 70, 'catalog/demo/products/42342_4.jpg', '', 4),
(324, 70, 'catalog/demo/products/42342_5.jpg', '', 5),
(325, 71, 'catalog/demo/products/42375_1.jpg', '', 1),
(326, 71, 'catalog/demo/products/42375_2.jpg', '', 2),
(327, 71, 'catalog/demo/products/42375_3.jpg', '', 3),
(328, 71, 'catalog/demo/products/42375_4.jpg', '', 4),
(329, 71, 'catalog/demo/products/42375_5.jpg', '', 5),
(330, 72, 'catalog/demo/products/42376_1.jpg', '', 1),
(331, 72, 'catalog/demo/products/42376_2.jpg', '', 2),
(332, 72, 'catalog/demo/products/42376_3.jpg', '', 3),
(333, 72, 'catalog/demo/products/42376_4.jpg', '', 4),
(334, 73, 'catalog/demo/products/42377_1.jpg', '', 1),
(335, 73, 'catalog/demo/products/42377_2.jpg', '', 2),
(336, 73, 'catalog/demo/products/42377_3.jpg', '', 3),
(337, 73, 'catalog/demo/products/42377_4.jpg', '', 4),
(338, 73, 'catalog/demo/products/42377_5.jpg', '', 5),
(339, 74, 'catalog/demo/products/42378_1.jpg', '', 1),
(340, 74, 'catalog/demo/products/42378_2.jpg', '', 2),
(341, 74, 'catalog/demo/products/42378_3.jpg', '', 3),
(342, 74, 'catalog/demo/products/42378_4.jpg', '', 4),
(343, 75, 'catalog/demo/products/42379_1.jpg', '', 1),
(344, 75, 'catalog/demo/products/42379_2.jpg', '', 2),
(345, 75, 'catalog/demo/products/42379_3.jpg', '', 3),
(346, 75, 'catalog/demo/products/42379_4.jpg', '', 4),
(347, 75, 'catalog/demo/products/42379_5.jpg', '', 5),
(348, 76, 'catalog/demo/products/42380_1.jpg', '', 1),
(349, 76, 'catalog/demo/products/42380_2.jpg', '', 2),
(350, 76, 'catalog/demo/products/42380_3.jpg', '', 3),
(351, 76, 'catalog/demo/products/42380_4.jpg', '', 4),
(352, 76, 'catalog/demo/products/42380_5.jpg', '', 5),
(353, 77, 'catalog/demo/products/42381_1.jpg', '', 1),
(354, 77, 'catalog/demo/products/42381_2.jpg', '', 2),
(355, 77, 'catalog/demo/products/42381_3.jpg', '', 3),
(356, 77, 'catalog/demo/products/42381_4.jpg', '', 4),
(357, 77, 'catalog/demo/products/42381_5.jpg', '', 5),
(358, 78, 'catalog/demo/products/42382_1.jpg', '', 1),
(359, 78, 'catalog/demo/products/42382_2.jpg', '', 2),
(360, 78, 'catalog/demo/products/42382_3.jpg', '', 3),
(361, 78, 'catalog/demo/products/42382_4.jpg', '', 4),
(362, 78, 'catalog/demo/products/42382_5.jpg', '', 5),
(363, 79, 'catalog/demo/products/42383_1.jpg', '', 1),
(364, 79, 'catalog/demo/products/42383_2.jpg', '', 2),
(365, 79, 'catalog/demo/products/42383_3.jpg', '', 3),
(366, 79, 'catalog/demo/products/42383_4.jpg', '', 4),
(367, 79, 'catalog/demo/products/42383_5.jpg', '', 5),
(368, 80, 'catalog/demo/products/42384_1.jpg', '', 1),
(369, 80, 'catalog/demo/products/42384_2.jpg', '', 2),
(370, 80, 'catalog/demo/products/42384_3.jpg', '', 3),
(371, 80, 'catalog/demo/products/42384_4.jpg', '', 4),
(372, 80, 'catalog/demo/products/42384_5.jpg', '', 5),
(373, 81, 'catalog/demo/products/42423_1.jpg', '', 1),
(374, 81, 'catalog/demo/products/42423_2.jpg', '', 2),
(375, 81, 'catalog/demo/products/42423_3.jpg', '', 3),
(376, 81, 'catalog/demo/products/42423_4.jpg', '', 4),
(377, 81, 'catalog/demo/products/42423_5.jpg', '', 5),
(378, 82, 'catalog/demo/products/42424_1.jpg', '', 1),
(379, 83, 'catalog/demo/products/42425_1.jpg', '', 1),
(380, 84, 'catalog/demo/products/42426_1.jpg', '', 1),
(381, 84, 'catalog/demo/products/42426_2.jpg', '', 2),
(382, 84, 'catalog/demo/products/42426_3.jpg', '', 3),
(383, 84, 'catalog/demo/products/42426_4.jpg', '', 4),
(384, 84, 'catalog/demo/products/42426_5.jpg', '', 5),
(385, 85, 'catalog/demo/products/42427_1.jpg', '', 1),
(386, 85, 'catalog/demo/products/42427_2.jpg', '', 2),
(387, 85, 'catalog/demo/products/42427_3.jpg', '', 3),
(388, 85, 'catalog/demo/products/42427_4.jpg', '', 4),
(389, 85, 'catalog/demo/products/42427_5.jpg', '', 5),
(390, 87, 'catalog/demo/products/42429_1.jpg', '', 1),
(391, 87, 'catalog/demo/products/42429_2.jpg', '', 2),
(392, 88, 'catalog/demo/products/42430_1.jpg', '', 1),
(393, 89, 'catalog/demo/products/42431_1.jpg', '', 1),
(394, 89, 'catalog/demo/products/42431_2.jpg', '', 2),
(395, 89, 'catalog/demo/products/42431_3.jpg', '', 3),
(396, 89, 'catalog/demo/products/42431_4.jpg', '', 4),
(397, 90, 'catalog/demo/products/42432_1.jpg', '', 1),
(398, 90, 'catalog/demo/products/42432_2.jpg', '', 2),
(399, 90, 'catalog/demo/products/42432_3.jpg', '', 3),
(400, 90, 'catalog/demo/products/42432_4.jpg', '', 4),
(401, 90, 'catalog/demo/products/42432_5.jpg', '', 5),
(402, 91, 'catalog/demo/products/42471_1.jpg', '', 1),
(403, 91, 'catalog/demo/products/42471_2.jpg', '', 2),
(404, 91, 'catalog/demo/products/42471_3.jpg', '', 3),
(405, 91, 'catalog/demo/products/42471_4.jpg', '', 4),
(406, 91, 'catalog/demo/products/42471_5.jpg', '', 5),
(1928, 92, 'catalog/demo/products/42472_5.jpg', '', 5),
(1927, 92, 'catalog/demo/products/42472_4.jpg', '', 4),
(1926, 92, 'catalog/demo/products/42472_3.jpg', '', 3),
(1925, 92, 'catalog/demo/products/42472_2.jpg', '', 2),
(1924, 92, 'catalog/demo/products/42472_1.jpg', '', 1),
(412, 93, 'catalog/demo/products/42473_1.jpg', '', 1),
(413, 93, 'catalog/demo/products/42473_2.jpg', '', 2),
(414, 93, 'catalog/demo/products/42473_3.jpg', '', 3),
(415, 94, 'catalog/demo/products/42474_1.jpg', '', 1),
(416, 94, 'catalog/demo/products/42474_2.jpg', '', 2),
(417, 94, 'catalog/demo/products/42474_3.jpg', '', 3),
(418, 94, 'catalog/demo/products/42474_4.jpg', '', 4),
(419, 94, 'catalog/demo/products/42474_5.jpg', '', 5),
(420, 95, 'catalog/demo/products/42475_1.jpg', '', 1),
(421, 95, 'catalog/demo/products/42475_2.jpg', '', 2),
(422, 95, 'catalog/demo/products/42475_3.jpg', '', 3),
(423, 95, 'catalog/demo/products/42475_4.jpg', '', 4),
(424, 95, 'catalog/demo/products/42475_5.jpg', '', 5),
(425, 96, 'catalog/demo/products/42476_1.jpg', '', 1),
(426, 96, 'catalog/demo/products/42476_2.jpg', '', 2),
(427, 96, 'catalog/demo/products/42476_3.jpg', '', 3),
(428, 96, 'catalog/demo/products/42476_4.jpg', '', 4),
(429, 96, 'catalog/demo/products/42476_5.jpg', '', 5),
(430, 97, 'catalog/demo/products/42477_1.jpg', '', 1),
(431, 97, 'catalog/demo/products/42477_2.jpg', '', 2),
(432, 97, 'catalog/demo/products/42477_3.jpg', '', 3),
(433, 97, 'catalog/demo/products/42477_4.jpg', '', 4),
(434, 97, 'catalog/demo/products/42477_5.jpg', '', 5),
(435, 98, 'catalog/demo/products/42478_1.jpg', '', 1),
(436, 98, 'catalog/demo/products/42478_2.jpg', '', 2),
(437, 98, 'catalog/demo/products/42478_3.jpg', '', 3),
(438, 98, 'catalog/demo/products/42478_4.jpg', '', 4),
(439, 98, 'catalog/demo/products/42478_5.jpg', '', 5),
(440, 99, 'catalog/demo/products/42479_1.jpg', '', 1),
(441, 99, 'catalog/demo/products/42479_2.jpg', '', 2),
(442, 99, 'catalog/demo/products/42479_3.jpg', '', 3),
(443, 99, 'catalog/demo/products/42479_4.jpg', '', 4),
(444, 99, 'catalog/demo/products/42479_5.jpg', '', 5),
(445, 100, 'catalog/demo/products/42480_1.jpg', '', 1),
(446, 100, 'catalog/demo/products/42480_2.jpg', '', 2),
(447, 100, 'catalog/demo/products/42480_3.jpg', '', 3),
(448, 100, 'catalog/demo/products/42480_4.jpg', '', 4),
(449, 100, 'catalog/demo/products/42480_5.jpg', '', 5),
(1835, 7, 'catalog/demo/products/42075_4.jpg', 'влагозащита', 4),
(1834, 7, 'catalog/demo/products/42075_3.jpg', 'аксессуары', 3),
(1833, 7, 'catalog/demo/products/42075_2.jpg', 'камера', 2),
(1832, 7, 'catalog/demo/products/42075_1.jpg', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option`
--

CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_product_option`
--

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(4, 45, 15, '', 0),
(3, 7, 14, '', 1),
(1, 45, 14, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option_value`
--

CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `quantity` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_product_option_value`
--

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `is_default`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(18, 4, 45, 15, 60, 0, '1.0000', 1, '7777.0000', '=', 0, '+', '0.00000000', '+'),
(17, 4, 45, 15, 56, 0, '1.0000', 1, '2.0000', '/', 0, '+', '0.00000000', '+'),
(16, 4, 45, 15, 55, 0, '1.0000', 1, '2.0000', '*', 0, '+', '0.00000000', '+'),
(9, 3, 7, 14, 51, 0, '10.0000', 1, '5000.0000', '+', 0, '+', '0.00000000', '+'),
(8, 3, 7, 14, 50, 0, '10.0000', 1, '2000.0000', '+', 0, '+', '0.00000000', '+'),
(7, 3, 7, 14, 49, 0, '10.0000', 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(15, 4, 45, 15, 54, 0, '1.0000', 1, '300.0000', '-', 0, '+', '0.00000000', '+'),
(11, 4, 45, 15, 53, 0, '1.0000', 0, '500.0000', '+', 0, '+', '0.00000000', '+'),
(10, 4, 45, 15, 52, 1, '1.0000', 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(14, 1, 45, 14, 59, 0, '10.0000', 1, '9999.0000', '=', 0, '+', '0.00000000', '+'),
(13, 1, 45, 14, 58, 0, '10.0000', 1, '3.0000', '/', 0, '+', '0.00000000', '+'),
(12, 1, 45, 14, 57, 0, '10.0000', 1, '3.0000', '*', 0, '+', '0.00000000', '+'),
(3, 1, 45, 14, 51, 0, '10.0000', 1, '200.0000', '-', 0, '+', '0.00000000', '+'),
(2, 1, 45, 14, 50, 0, '10.0000', 1, '100.0000', '+', 0, '+', '0.00000000', '+'),
(1, 1, 45, 14, 49, 1, '10.0000', 1, '0.0000', '+', 0, '+', '0.00000000', '+');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_recurring`
--

CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related`
--

CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_product_related`
--

INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES
(7, 36),
(7, 39),
(36, 7),
(39, 7);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related_article`
--

CREATE TABLE `oc_product_related_article` (
  `article_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related_mn`
--

CREATE TABLE `oc_product_related_mn` (
  `product_id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related_wb`
--

CREATE TABLE `oc_product_related_wb` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_reward`
--

CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_special`
--

CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_product_special`
--

INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(89, 7, 1, 1, '99990.0000', '0000-00-00', '0000-00-00'),
(115, 1, 1, 1, '124990.0000', '0000-00-00', '0000-00-00'),
(3, 2, 1, 1, '117940.0000', '0000-00-00', '0000-00-00'),
(4, 3, 1, 1, '112490.0000', '0000-00-00', '0000-00-00'),
(5, 4, 1, 1, '109990.0000', '0000-00-00', '0000-00-00'),
(6, 5, 1, 1, '109990.0000', '0000-00-00', '0000-00-00'),
(7, 6, 1, 1, '104990.0000', '0000-00-00', '0000-00-00'),
(9, 8, 1, 1, '98370.0000', '0000-00-00', '0000-00-00'),
(10, 9, 1, 1, '94999.0000', '0000-00-00', '0000-00-00'),
(11, 10, 1, 1, '94990.0000', '0000-00-00', '0000-00-00'),
(117, 45, 1, 1, '4500.0000', '0000-00-00', '0000-00-00'),
(103, 63, 1, 1, '87718.4000', '0000-00-00', '0000-00-00'),
(72, 21, 1, 1, '395991.2000', '0000-00-00', '0000-00-00'),
(91, 36, 1, 1, '9900.0000', '0000-00-00', '0000-00-00'),
(73, 22, 1, 1, '228791.2000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_category`
--

CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `main_category` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`, `main_category`) VALUES
(1, 1, 0),
(1, 2, 1),
(2, 1, 0),
(2, 2, 1),
(3, 1, 0),
(3, 2, 1),
(4, 1, 0),
(4, 2, 1),
(5, 1, 0),
(5, 2, 1),
(6, 1, 0),
(6, 2, 1),
(7, 2, 0),
(7, 1, 1),
(8, 1, 0),
(8, 2, 1),
(9, 1, 0),
(9, 2, 1),
(10, 1, 0),
(10, 2, 1),
(11, 1, 0),
(11, 3, 1),
(12, 1, 0),
(12, 3, 1),
(13, 1, 0),
(13, 3, 1),
(14, 1, 0),
(14, 3, 1),
(15, 1, 0),
(15, 3, 1),
(16, 1, 0),
(16, 3, 1),
(17, 1, 0),
(17, 3, 1),
(18, 1, 0),
(18, 3, 1),
(19, 1, 0),
(19, 3, 1),
(20, 1, 0),
(20, 3, 1),
(21, 1, 0),
(21, 4, 1),
(22, 4, 1),
(22, 1, 0),
(23, 1, 0),
(23, 4, 1),
(24, 1, 0),
(24, 4, 1),
(25, 1, 0),
(25, 4, 1),
(26, 1, 0),
(26, 4, 1),
(27, 1, 0),
(27, 4, 1),
(28, 1, 0),
(28, 4, 1),
(29, 1, 0),
(29, 4, 1),
(30, 1, 0),
(30, 4, 1),
(31, 1, 0),
(31, 5, 1),
(32, 1, 0),
(32, 5, 1),
(33, 1, 0),
(33, 5, 1),
(34, 1, 0),
(34, 5, 1),
(35, 1, 0),
(35, 5, 1),
(36, 5, 1),
(36, 1, 0),
(37, 1, 0),
(37, 5, 1),
(38, 1, 0),
(38, 5, 1),
(39, 1, 0),
(39, 5, 1),
(40, 1, 0),
(40, 5, 1),
(41, 6, 1),
(41, 1, 0),
(42, 6, 1),
(42, 1, 0),
(43, 1, 0),
(43, 6, 1),
(44, 1, 0),
(44, 6, 1),
(45, 6, 1),
(45, 1, 0),
(46, 1, 0),
(46, 6, 1),
(47, 1, 0),
(47, 6, 1),
(48, 1, 0),
(48, 6, 1),
(49, 1, 0),
(49, 6, 1),
(50, 1, 0),
(50, 6, 1),
(51, 7, 0),
(51, 8, 1),
(52, 7, 0),
(52, 8, 1),
(53, 7, 0),
(53, 8, 1),
(54, 7, 0),
(54, 8, 1),
(55, 7, 0),
(55, 8, 1),
(56, 7, 0),
(56, 8, 1),
(57, 7, 0),
(57, 8, 1),
(58, 7, 0),
(58, 8, 1),
(59, 7, 0),
(59, 8, 1),
(60, 7, 0),
(60, 8, 1),
(61, 7, 0),
(61, 9, 1),
(62, 7, 0),
(62, 9, 1),
(63, 7, 0),
(63, 9, 1),
(64, 7, 0),
(64, 9, 1),
(65, 7, 0),
(65, 9, 1),
(66, 7, 0),
(66, 9, 1),
(67, 7, 0),
(67, 9, 1),
(68, 7, 0),
(68, 9, 1),
(69, 7, 0),
(69, 9, 1),
(70, 7, 0),
(70, 9, 1),
(71, 7, 0),
(71, 10, 1),
(72, 7, 0),
(72, 10, 1),
(73, 7, 0),
(73, 10, 1),
(74, 7, 0),
(74, 10, 1),
(75, 7, 0),
(75, 10, 1),
(76, 7, 0),
(76, 10, 1),
(77, 7, 0),
(77, 10, 1),
(78, 7, 0),
(78, 10, 1),
(79, 7, 0),
(79, 10, 1),
(80, 7, 0),
(80, 10, 1),
(81, 7, 0),
(81, 11, 1),
(82, 7, 0),
(82, 11, 1),
(83, 7, 0),
(83, 11, 1),
(84, 7, 0),
(84, 11, 1),
(85, 7, 0),
(85, 11, 1),
(86, 7, 0),
(86, 11, 1),
(87, 7, 0),
(87, 11, 1),
(88, 7, 0),
(88, 11, 1),
(89, 7, 0),
(89, 11, 1),
(90, 7, 0),
(90, 11, 1),
(91, 7, 0),
(91, 12, 1),
(92, 12, 1),
(92, 7, 0),
(93, 7, 0),
(93, 12, 1),
(94, 7, 0),
(94, 12, 1),
(95, 7, 0),
(95, 12, 1),
(96, 7, 0),
(96, 12, 1),
(97, 7, 0),
(97, 12, 1),
(98, 7, 0),
(98, 12, 1),
(99, 7, 0),
(99, 12, 1),
(100, 7, 0),
(100, 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_download`
--

CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_layout`
--

CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(1, 0, 0),
(7, 0, 0),
(45, 0, 0),
(41, 0, 0),
(36, 0, 0),
(63, 0, 0),
(22, 0, 0),
(39, 0, 0),
(92, 0, 0),
(42, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_store`
--

CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_quantity_class`
--

CREATE TABLE `oc_quantity_class` (
  `quantity_class_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_quantity_class`
--

INSERT INTO `oc_quantity_class` (`quantity_class_id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- --------------------------------------------------------

--
-- Table structure for table `oc_quantity_class_description`
--

CREATE TABLE `oc_quantity_class_description` (
  `quantity_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_quantity_class_description`
--

INSERT INTO `oc_quantity_class_description` (`quantity_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Штуки', 'шт'),
(2, 1, 'Килограммы', 'кг'),
(3, 1, 'Литры', 'л'),
(4, 1, 'Метры', 'м'),
(6, 1, 'Кубические метры', 'м³'),
(8, 1, 'Миллилитры', 'мл'),
(9, 1, 'Сантиметры', 'см'),
(10, 1, 'Упаковка', 'упак'),
(1, 2, 'Pieces', 'pcs'),
(2, 2, 'Kilograms', 'kg'),
(3, 2, 'Liters', 'l'),
(4, 2, 'Meters', 'm'),
(5, 2, 'Square meters', 'm²'),
(6, 2, 'Cubic meters', 'm³'),
(7, 2, 'Grams', 'g'),
(8, 2, 'Milliliters', 'ml'),
(9, 2, 'Centimeters', 'cm'),
(10, 2, 'Package', 'pkg'),
(5, 1, 'Квадратные метры', 'м²'),
(7, 1, 'Граммы', 'г');

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring`
--

CREATE TABLE `oc_recurring` (
  `recurring_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `cycle` int(10) UNSIGNED NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `trial_duration` int(10) UNSIGNED NOT NULL,
  `trial_cycle` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring_description`
--

CREATE TABLE `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return`
--

CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_action`
--

CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Возмещенный'),
(2, 1, 'Возврат средств'),
(3, 1, 'Отправлена замена'),
(1, 2, 'Refunded'),
(3, 2, 'Replacement Sent'),
(2, 2, 'Credit Issued');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_history`
--

CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_reason`
--

CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Получен неисправным (сломанным)'),
(1, 2, 'Dead On Arrival'),
(2, 1, 'Получен не тот (ошибочный) товар'),
(2, 2, 'Received Wrong Item'),
(3, 1, 'Заказан по ошибке'),
(3, 2, 'Order Error'),
(4, 1, 'Неисправен, пожалуйста укажите/приложите подробности'),
(4, 2, 'Faulty, please supply details'),
(5, 1, 'Другое (другая причина), пожалуйста укажите/приложите подробности'),
(5, 2, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_status`
--

CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'В ожидании'),
(3, 1, 'Выполнен'),
(2, 1, 'Ожидание товара'),
(1, 2, 'Pending'),
(2, 2, 'Awaiting Products'),
(3, 2, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `oc_review`
--

CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(1) NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_review`
--

INSERT INTO `oc_review` (`review_id`, `product_id`, `customer_id`, `author`, `text`, `reply`, `rating`, `images`, `status`, `date_added`, `date_modified`) VALUES
(1, 7, 0, 'Jimmy', 'This thing is so outdated, no way I\'d buy it now', 'Yeah, time has no mercy to anyone 😞', 3, '[]', 1, '2022-11-12 21:43:01', '2025-11-24 12:02:54'),
(2, 45, 0, 'Donald', 'This is incredable 🔥', 'Oh, thank you so much', 5, '[]', 1, '2023-12-05 16:37:59', '2025-11-21 14:37:10'),
(3, 7, 0, 'Василий', 'Нормальный такой, я бы взял', '', 5, '[]', 1, '2025-11-21 13:56:44', '2025-11-21 14:35:08'),
(16, 7, 0, 'Joe', 'Old, but gold!', '', 5, '[{\"filename\":\"catalog\\/reviews\\/69241ebfc4293.png\",\"size\":1581575,\"mime\":\"image\\/png\"},{\"filename\":\"catalog\\/reviews\\/69241ebfc6bab.png\",\"size\":1085047,\"mime\":\"image\\/png\"}]', 1, '2025-11-24 12:00:47', '2025-11-24 12:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `oc_review_article`
--

CREATE TABLE `oc_review_article` (
  `review_article_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_review_article`
--

INSERT INTO `oc_review_article` (`review_article_id`, `article_id`, `customer_id`, `author`, `text`, `reply`, `rating`, `status`, `date_added`, `date_modified`) VALUES
(27, 127, 0, 'Вин Дизель', 'Ну ты брат выдал, хоть стой, хоть падай', 'Положение обязывает делать больше чем делают другие, чтобы жить лучше чем живут другие', 0, 1, '2024-02-08 17:25:26', '2024-02-09 16:11:40');

-- --------------------------------------------------------

--
-- Table structure for table `oc_seo_url`
--

CREATE TABLE `oc_seo_url` (
  `seo_url_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `query` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_seo_url`
--

INSERT INTO `oc_seo_url` (`seo_url_id`, `store_id`, `language_id`, `query`, `keyword`) VALUES
(54, 0, 1, 'category_id=3', 'planshety'),
(4, 0, 1, 'category_id=4', 'kvadrokoptery'),
(5, 0, 1, 'category_id=5', 'naushniki'),
(6, 0, 1, 'category_id=6', 'zaryadnye-ustrojstva'),
(976, 0, 2, 'category_id=7', 'laptops-and-computers'),
(8, 0, 1, 'category_id=8', 'noutbuki'),
(9, 0, 1, 'category_id=9', 'monobloki'),
(10, 0, 1, 'category_id=10', 'monitory'),
(11, 0, 1, 'category_id=11', 'printery'),
(12, 0, 1, 'category_id=12', 'kolonki-dlya-kompyutera'),
(14, 0, 1, 'category_id=14', 'kofemashiny'),
(15, 0, 1, 'category_id=15', 'teplovye-pushki'),
(16, 0, 1, 'category_id=16', 'kondicionery'),
(17, 0, 1, 'category_id=17', 'vodonagrevateli'),
(18, 0, 1, 'category_id=18', 'kulery-dlya-vody'),
(19, 0, 1, 'category_id=19', 'stroitelstvo-i-remont'),
(20, 0, 1, 'category_id=20', 'generatory'),
(21, 0, 1, 'category_id=21', 'perforatory'),
(22, 0, 1, 'category_id=22', 'dreli'),
(23, 0, 1, 'category_id=23', 'stroitelnye-pylesosy'),
(24, 0, 1, 'category_id=24', 'shurupoverty'),
(25, 0, 1, 'category_id=25', 'dom-i-dacha'),
(26, 0, 1, 'category_id=26', 'tumby'),
(27, 0, 1, 'category_id=27', 'gazonokosilki'),
(28, 0, 1, 'category_id=28', 'bassejny'),
(29, 0, 1, 'category_id=29', 'matrasy'),
(30, 0, 1, 'category_id=30', 'krasota-i-zdorove'),
(31, 0, 1, 'category_id=31', 'feny'),
(32, 0, 1, 'category_id=32', 'massazhery'),
(33, 0, 1, 'category_id=33', 'trimmery'),
(34, 0, 1, 'category_id=34', 'ehpilyatory'),
(35, 0, 1, 'category_id=35', 'tonometry'),
(36, 0, 1, 'category_id=36', 'detskie-tovary'),
(37, 0, 1, 'category_id=37', 'radioupravlyaemye-igrushki'),
(38, 0, 1, 'category_id=38', 'kolyaski'),
(39, 0, 1, 'category_id=39', 'avtokresla'),
(40, 0, 1, 'category_id=40', 'giroskutery'),
(41, 0, 1, 'category_id=41', 'detskie-samokaty'),
(42, 0, 1, 'category_id=42', 'sport-i-otdyh'),
(43, 0, 1, 'category_id=43', 'ehlektrosamokaty'),
(44, 0, 1, 'category_id=44', 'velosipedy'),
(45, 0, 1, 'category_id=45', 'skejtbordy-i-longbordy'),
(46, 0, 1, 'category_id=46', 'palatki-i-tenty'),
(47, 0, 1, 'category_id=47', 'lodki'),
(1264, 0, 2, 'category_id=1', 'smartphones-and-gadgets'),
(951, 0, 1, 'category_id=2', 'smartfony'),
(58, 0, 2, 'category_id=3', 'tablets'),
(59, 0, 2, 'category_id=4', 'quadcopters'),
(60, 0, 2, 'category_id=5', 'headphones'),
(61, 0, 2, 'category_id=6', 'charging-device'),
(975, 0, 1, 'category_id=7', 'noutbuki-i-kompyutery'),
(63, 0, 2, 'category_id=8', 'laptops'),
(64, 0, 2, 'category_id=9', 'monoblocks'),
(65, 0, 2, 'category_id=10', 'monitors'),
(66, 0, 2, 'category_id=11', 'printers'),
(67, 0, 2, 'category_id=12', 'computer-speakers'),
(992, 0, 2, 'category_id=13', 'appliances'),
(69, 0, 2, 'category_id=14', 'coffee-machines'),
(70, 0, 2, 'category_id=15', 'heat-guns'),
(71, 0, 2, 'category_id=16', 'air-conditioners'),
(72, 0, 2, 'category_id=17', 'water-heaters'),
(73, 0, 2, 'category_id=18', 'water-coolers'),
(74, 0, 2, 'category_id=19', 'construction-and-repair'),
(75, 0, 2, 'category_id=20', 'generators'),
(76, 0, 2, 'category_id=21', 'perforators'),
(77, 0, 2, 'category_id=22', 'drills'),
(78, 0, 2, 'category_id=23', 'construction-vacuum-cleaners'),
(79, 0, 2, 'category_id=24', 'screwdrivers'),
(80, 0, 2, 'category_id=25', 'house-and-cottage'),
(81, 0, 2, 'category_id=26', 'cabinets'),
(82, 0, 2, 'category_id=27', 'lawn-mowers'),
(83, 0, 2, 'category_id=28', 'pools'),
(84, 0, 2, 'category_id=29', 'mattresses'),
(85, 0, 2, 'category_id=30', 'beauty-and-health'),
(86, 0, 2, 'category_id=31', 'hair-dryers'),
(87, 0, 2, 'category_id=32', 'massagers'),
(88, 0, 2, 'category_id=33', 'trimmers'),
(89, 0, 2, 'category_id=34', 'epilators'),
(90, 0, 2, 'category_id=35', 'tonometers'),
(91, 0, 2, 'category_id=36', 'children-s-products'),
(92, 0, 2, 'category_id=37', 'radio-controlled-toys'),
(93, 0, 2, 'category_id=38', 'strollers'),
(94, 0, 2, 'category_id=39', 'car-seats'),
(95, 0, 2, 'category_id=40', 'gyroscooters'),
(96, 0, 2, 'category_id=41', 'children-s-scooters'),
(97, 0, 2, 'category_id=42', 'sports-and-recreation'),
(98, 0, 2, 'category_id=43', 'electric-scooters'),
(99, 0, 2, 'category_id=44', 'bicycles'),
(100, 0, 2, 'category_id=45', 'skateboards-and-longboards'),
(101, 0, 2, 'category_id=46', 'tents-and-awnings'),
(102, 0, 2, 'category_id=47', 'boats'),
(104, 0, 2, 'product_id=2', 'smartphone-samsung-galaxy-z-fold-4-sm-f936b-512gb-12gb-gray-green-3g-4g-2sim-7-6-amoled-1812x2176-and'),
(105, 0, 2, 'product_id=3', 'smartphone-apple-iphone-13-pro-512gb-mlwa3ru-a-silver'),
(106, 0, 2, 'product_id=4', 'smartphone-samsung-galaxy-z-fold-4-sm-f936b-512gb-12gb-black-3g-4g-2sim-7-6-amoled-1812x2176-and12-5'),
(107, 0, 2, 'product_id=5', 'smartphone-samsung-galaxy-z-fold-4-sm-f936b-512gb-12gb-beige-3g-4g-2sim-7-6-dynamic-amoled-2x-1812x'),
(108, 0, 2, 'product_id=6', 'smartphone-xiaomi-12-pro-12-256gb-purple'),
(1310, 0, 2, 'product_id=7', 'smartphone-apple-iphone-11-pro-512gb-mwce2ru-a-silver'),
(110, 0, 2, 'product_id=8', 'smartphone-samsung-galaxy-z-fold-4-12-256gb-sm-f936b-black'),
(111, 0, 2, 'product_id=9', 'smartphone-samsung-galaxy-z-fold-4-12-256gb-sm-f936b-black'),
(112, 0, 2, 'product_id=10', 'smartphone-samsung-galaxy-z-fold-4-sm-f936b-256gb-12gb-black-3g-4g-2sim-7-6-amoled-1812x2176-and12-5'),
(113, 0, 2, 'product_id=11', 'tablet-apple-ipad-pro-2021-11-2tb-wi-fi-cellular-mhwe3ru-a-16gb-2tb-4g-space-gray'),
(114, 0, 2, 'product_id=12', 'tablet-apple-ipad-pro-2021-12-9-2tb-wi-fi-mhnq3ru-a-16gb-2tb-silver'),
(115, 0, 2, 'product_id=13', 'tablet-apple-ipad-pro-2021-12-9-1tb-wi-fi-mhnn3ru-a-16gb-1tb-silver'),
(116, 0, 2, 'product_id=14', 'tablet-apple-ipad-pro-2021-12-9-2tb-wi-fi-mhnp3ru-a-16gb-2tb-space-gray'),
(117, 0, 2, 'product_id=15', 'tablet-apple-ipad-pro-2021-12-9-2tb-wi-fi-mhnq3ru-a-16gb-2tb-silver'),
(118, 0, 2, 'product_id=16', 'tablet-apple-ipad-pro-2021-12-9-512gb-wi-fi-mhnk3ru-a-8gb-512gb-space-gray'),
(119, 0, 2, 'product_id=17', 'tablet-apple-ipad-pro-2021-11-2tb-wi-fi-mhr33ru-a-16gb-2tb-silver'),
(120, 0, 2, 'product_id=18', 'tablet-apple-ipad-pro-2021-11-2tb-wi-fi-mhr23ru-a-16gb-2tb-space-gray'),
(121, 0, 2, 'product_id=19', 'tablet-apple-ipad-pro-2021-12-9-1tb-wi-fi-mhnn3ru-a-16gb-1tb-silver'),
(122, 0, 2, 'product_id=20', 'tablet-apple-ipad-pro-2021-11-1tb-wi-fi-mhqy3ru-a-16gb-1tb-space-gray'),
(123, 0, 2, 'product_id=21', 'quadcopter-dji-mavic-3-fly-more-combo-with-camera-gray'),
(1282, 0, 2, 'product_id=22', 'dji-air-2s-fly-more-combo-smart-controller-quadcopter-with-camera-gray'),
(125, 0, 2, 'product_id=23', 'quadcopter-autel-evo-lite-standard-package-mdxm2-with-camera-orange'),
(126, 0, 2, 'product_id=24', 'quadcopter-autel-evo-nano-standard-package-mda2-with-camera-orange'),
(127, 0, 2, 'product_id=25', 'hiper-hqc-0001-shadow-fpv-quadcopter-with-camera-black'),
(128, 0, 2, 'product_id=26', 'quadcopter-syma-x5uw-d-with-camera-white'),
(129, 0, 2, 'product_id=27', 'quadcopter-flybotic-bumper-drone-without-camera-blue'),
(130, 0, 2, 'product_id=28', 'quadcopter-hiper-hqc-0030-sky-patrol-fpv-with-camera-black'),
(131, 0, 2, 'product_id=29', 'quadcopter-hiper-hqc-0003-falcon-x-fpv-with-camera-black'),
(132, 0, 2, 'product_id=30', 'quadcopter-syma-x5uw-with-camera-red'),
(133, 0, 2, 'product_id=31', 'headphones-sony-xba-z5-3-5-mm-black'),
(134, 0, 2, 'product_id=32', 'headphones-pioneer-hdj-x10-s-6-3-mm-silver-black'),
(135, 0, 2, 'product_id=33', 'headphones-sennheiser-ie-80s-bt-bluetooth-black'),
(136, 0, 2, 'product_id=34', 'headphones-fiio-fh7-3-5-mm-black'),
(137, 0, 2, 'product_id=35', 'headset-philips-l3-00-bluetooth-usb-type-c-black'),
(1314, 0, 2, 'product_id=36', 'headphones-audio-technica-ath-anc900bt-3-5-mm-bluetooth-black'),
(139, 0, 2, 'product_id=37', 'headphones-pioneer-hdj-s7-3-5-mm-6-3-mm-black'),
(140, 0, 2, 'product_id=38', 'headset-sony-wh-h910n-3-5-mm-bluetooth-blue'),
(1318, 0, 2, 'product_id=39', 'headphones-fiio-fd5-2-5-mm-3-5-mm-4-4-mm-silver'),
(142, 0, 2, 'product_id=40', 'headset-in-ear-apple-airpods-pro-2-a2698-a2699-a2700-white-wireless-bluetooth-mqd83z'),
(1384, 0, 2, 'product_id=41', 'apple-magsafe-duo-wireless-charger-white'),
(1394, 0, 2, 'product_id=42', 'wireless-charger-canyon-ws-404-black'),
(145, 0, 2, 'product_id=43', 'ac-charger-satechi-compact-charger-gray'),
(146, 0, 2, 'product_id=44', 'wireless-charger-prestigio-revolt-a7-3-in-1-black'),
(1392, 0, 2, 'product_id=45', 'wireless-charger-device-xiaomi-50w-wireless-charging-stand-3-25a-pd-universal-black-gold'),
(148, 0, 2, 'product_id=46', 'mains-charger-canyon-h-100-white'),
(149, 0, 2, 'product_id=47', 'wireless-charger-prestigio-revolt-a9-3-in-1-gray'),
(150, 0, 2, 'product_id=48', 'apple-magsafe-mhxh3ze-a-wireless-charger-white'),
(151, 0, 2, 'product_id=49', 'wireless-charger-samsung-ep-p2400-white'),
(152, 0, 2, 'product_id=50', 'wireless-charger-samsung-ep-p2400-black'),
(153, 0, 2, 'product_id=51', 'notebook-msi-creatorpro-x17-a12ums-205ru-9s7-17q121-205-black'),
(154, 0, 2, 'product_id=52', 'notebook-apple-macbook-pro-a2485-m1-max-10-core-32gb-ssd1tb-32-core-gpu-16-2-mac-os-grey-space'),
(155, 0, 2, 'product_id=53', 'notebook-msi-creatorpro-x17-a12uks-206ru-9s7-17q121-206-black'),
(156, 0, 2, 'product_id=54', 'notebook-msi-creator-z16p-b12uhst-028ru-9s7-15g121-028-gray'),
(157, 0, 2, 'product_id=55', 'notebook-apple-macbook-pro-z15k0007a-silver'),
(158, 0, 2, 'product_id=56', 'notebook-apple-macbook-pro-a2485-mk1a3b-a-space-gray'),
(159, 0, 2, 'product_id=57', 'notebook-msi-raider-ge77hx-12uhs-232ru-9s7-17k514-232-dark-gray'),
(160, 0, 2, 'product_id=58', 'notebook-msi-creatorpro-z16p-b12ukst-222ru-9s7-15g121-222-gray'),
(161, 0, 2, 'product_id=59', 'notebook-apple-macbook-pro-a2485-m1-pro-10-core-16gb-ssd512gb-16-core-gpu-16-2-mac-os-silver'),
(162, 0, 2, 'product_id=60', 'notebook-apple-macbook-pro-a2485-m1-pro-10-core-16gb-ssd512gb-16-core-gpu-16-2-mac-os-grey-space'),
(163, 0, 2, 'product_id=61', 'monoblock-dell-optiplex-7490-23-8-intel-core-i5-11500-8gb-512gb-ssd-intel-uhd-graphics-750-windows-10-professional-black'),
(164, 0, 2, 'product_id=62', 'apple-imac-mhk03ru-a-all-in-one-21-5-intel-core-i5-7360u-8gb-256gb-ssd-intel-iris-plus-graphics-640-macos-silver-black'),
(1342, 0, 2, 'product_id=63', 'monoblock-lenovo-ideacentre-a540-icb-23-8-intel-core-i5-9400t-8gb-1000gb-ssd-intel-uhd-graphics-630-free-dos-black'),
(166, 0, 2, 'product_id=64', 'monoblock-lenovo-v30a-24iil-23-8-intel-core-i5-1035g1-8gb-512gb-ssd-intel-uhd-graphics-dvd-rw-windows-10-professional-black'),
(167, 0, 2, 'product_id=65', 'monoblock-lenovo-v30a-24iil-23-8-intel-core-i5-1035g1-8gb-512gb-ssd-intel-uhd-graphics-dvd-rw-noos-black'),
(168, 0, 2, 'product_id=66', 'monoblock-acer-aspire-c24-1650-23-8-intel-core-i3-1115g4-8gb-512gb-ssd-intel-uhd-graphics-windows-11-home-silver'),
(169, 0, 2, 'product_id=67', 'monoblock-acer-veriton-ez2740g-23-8-intel-core-i3-1115g4-8gb-256gb-ssd-intel-uhd-graphics-windows-10-professional-black'),
(170, 0, 2, 'product_id=68', 'monoblock-acer-aspire-c24-1650-23-8-intel-core-i3-1115g4-8gb-256gb-ssd-intel-uhd-graphics-windows-11-home-silver'),
(171, 0, 2, 'product_id=69', 'monoblock-lenovo-v30a-24iil-23-8-intel-core-i3-1005g1-8gb-256gb-ssd-intel-uhd-graphics-windows-10-professional-black'),
(172, 0, 2, 'product_id=70', 'monoblock-acer-veriton-z4880g-23-8-intel-core-i3-10105-8gb-256gb-ssd-intel-uhd-graphics-630-noos-black'),
(173, 0, 2, 'product_id=71', 'monitor-dell-ultrasharp-up3221q-31-5-black'),
(174, 0, 2, 'product_id=72', 'gaming-monitor-asus-rog-strix-xg438qr-43-black'),
(175, 0, 2, 'product_id=73', 'monitor-benq-sw271c-27-black'),
(176, 0, 2, 'product_id=74', 'asus-rog-swift-pg259qnr-24-5-gaming-monitor-dark-gray'),
(177, 0, 2, 'product_id=75', 'gaming-monitor-acer-cb382curbmiiphuzx-37-5-black'),
(178, 0, 2, 'product_id=76', 'philips-498p9z-49-monitor-black'),
(179, 0, 2, 'product_id=77', 'monitor-philips-499p9h-48-8-black'),
(180, 0, 2, 'product_id=78', 'gaming-monitor-asus-rog-swift-pg279qm-27-black'),
(181, 0, 2, 'product_id=79', 'gaming-monitor-gigabyte-m32uc-31-5-black'),
(182, 0, 2, 'product_id=80', 'gigabyte-aorus-fi32q-x-32-gaming-monitor-black'),
(183, 0, 2, 'product_id=81', 'printer-laser-hp-laserjet-enterprise-800-m806dn-black-and-white-color-black'),
(184, 0, 2, 'product_id=82', 'laser-printer-kyocera-p3155dn-cartridge-black-and-white-color-white'),
(185, 0, 2, 'product_id=83', 'laser-printer-kyocera-p3155dn-black-and-white-color-white'),
(186, 0, 2, 'product_id=84', 'laser-printer-kyocera-p3145dn-cartridge-black-and-white-color-white'),
(187, 0, 2, 'product_id=85', 'laser-printer-kyocera-p3145dn-black-and-white-color-white'),
(188, 0, 2, 'product_id=86', 'printer-laser-katyusha-p247-black-and-white-color-black'),
(189, 0, 2, 'product_id=87', 'printer-laser-brother-hl-l9310cdw-color-color-white'),
(190, 0, 2, 'product_id=88', 'printer-laser-kyocera-color-p5021cdw-color-color-white'),
(191, 0, 2, 'product_id=89', 'inkjet-printer-epson-l1800-color-black'),
(192, 0, 2, 'product_id=90', 'laser-printer-hp-color-laserjet-enterprise-m554dn-color-white'),
(193, 0, 2, 'product_id=91', 'bluetooth-speakers-sven-mc-30-2-0-black'),
(1348, 0, 2, 'product_id=92', 'bluetooth-speakers-creative-stage-360-2-1-black'),
(195, 0, 2, 'product_id=93', 'bluetooth-speakers-edifier-g7000-1-1-black'),
(196, 0, 2, 'product_id=94', 'bluetooth-speakers-edifier-r1700bts-2-0-brown'),
(197, 0, 2, 'product_id=95', 'speakers-sven-ht-200-5-1-black'),
(198, 0, 2, 'product_id=96', 'bluetooth-speakers-oklick-ok-117-bt-2-0-black'),
(199, 0, 2, 'product_id=97', 'speakers-jbl-quantum-duo-2-0-black'),
(200, 0, 2, 'product_id=98', 'speakers-sven-ht-210-5-1-black'),
(201, 0, 2, 'product_id=99', 'speakers-creative-gigaworks-t40-series-ii-2-0-black'),
(202, 0, 2, 'product_id=100', 'bluetooth-speakers-sven-ms-2250-2-1-black'),
(1111, 0, 2, 'blog_category_id=72', 'news'),
(1110, 0, 1, 'blog_category_id=72', 'novosti'),
(507, 0, 2, 'information_id=9', 'terms-and-conditions'),
(506, 0, 1, 'information_id=9', 'pravila-i-usloviya'),
(1381, 0, 1, 'information_id=10', 'pravila-partnerstva'),
(508, 0, 1, 'information_id=11', 'usloviya-vozvrata'),
(509, 0, 2, 'information_id=11', 'return-conditions'),
(1131, 0, 2, 'information_id=12', 'payment'),
(1130, 0, 1, 'information_id=12', 'oplata'),
(1051, 0, 2, 'information_id=13', 'delivery'),
(1050, 0, 1, 'information_id=13', 'dostavka'),
(1388, 0, 2, 'product_id=1', 'smartphone-samsung-galaxy-z-fold-4-12-256gb-sm-f936b-beige'),
(1387, 0, 1, 'product_id=1', 'smartfon-samsung-galaxy-z-fold-4-12-256gb-sm-f936b-bezhevyj'),
(517, 0, 1, 'product_id=2', 'smartfon-samsung-galaxy-z-fold-4-sm-f936b-512gb-12gb-ser-zelen-3g-4g-2sim-7-6-amoled-1812x2176-and'),
(518, 0, 1, 'product_id=3', 'smartfon-apple-iphone-13-pro-512gb-mlwa3ru-a-serebristyj'),
(519, 0, 1, 'product_id=4', 'smartfon-samsung-galaxy-z-fold-4-sm-f936b-512gb-12gb-chernyj-3g-4g-2sim-7-6-amoled-1812x2176-and12-5'),
(520, 0, 1, 'product_id=5', 'smartfon-samsung-galaxy-z-fold-4-sm-f936b-512gb-12gb-bezhevyj-3g-4g-2sim-7-6-dynamic-amoled-2x-1812x'),
(521, 0, 1, 'product_id=6', 'smartfon-xiaomi-12-pro-12-256gb-purpurnyj'),
(1309, 0, 1, 'product_id=7', 'smartfon-apple-iphone-11-pro-512gb-mwce2ru-a-serebristyj'),
(523, 0, 1, 'product_id=8', 'smartfon-samsung-galaxy-z-fold-4-12-256gb-sm-f936b-chernyj'),
(524, 0, 1, 'product_id=9', 'smartfon-samsung-galaxy-z-fold-4-12-256gb-sm-f936b-chernyj'),
(525, 0, 1, 'product_id=10', 'smartfon-samsung-galaxy-z-fold-4-sm-f936b-256gb-12gb-chernyj-3g-4g-2sim-7-6-amoled-1812x2176-and12-5'),
(526, 0, 1, 'product_id=11', 'planshet-apple-ipad-pro-2021-11-2tb-wi-fi-cellular-mhwe3ru-a-16gb-2tb-4g-seryj-kosmos'),
(527, 0, 1, 'product_id=12', 'planshet-apple-ipad-pro-2021-12-9-2tb-wi-fi-mhnq3ru-a-16gb-2tb-serebristyj'),
(528, 0, 1, 'product_id=13', 'planshet-apple-ipad-pro-2021-12-9-1tb-wi-fi-mhnn3ru-a-16gb-1tb-serebristyj'),
(529, 0, 1, 'product_id=14', 'planshet-apple-ipad-pro-2021-12-9-2tb-wi-fi-mhnp3ru-a-16gb-2tb-seryj-kosmos'),
(530, 0, 1, 'product_id=15', 'planshet-apple-ipad-pro-2021-12-9-2tb-wi-fi-mhnq3ru-a-16gb-2tb-serebristyj'),
(531, 0, 1, 'product_id=16', 'planshet-apple-ipad-pro-2021-12-9-512gb-wi-fi-mhnk3ru-a-8gb-512gb-seryj-kosmos'),
(532, 0, 1, 'product_id=17', 'planshet-apple-ipad-pro-2021-11-2tb-wi-fi-mhr33ru-a-16gb-2tb-serebristyj'),
(533, 0, 1, 'product_id=18', 'planshet-apple-ipad-pro-2021-11-2tb-wi-fi-mhr23ru-a-16gb-2tb-seryj-kosmos'),
(534, 0, 1, 'product_id=19', 'planshet-apple-ipad-pro-2021-12-9-1tb-wi-fi-mhnn3ru-a-16gb-1tb-serebristyj'),
(535, 0, 1, 'product_id=20', 'planshet-apple-ipad-pro-2021-11-1tb-wi-fi-mhqy3ru-a-16gb-1tb-seryj-kosmos'),
(536, 0, 1, 'product_id=21', 'kvadrokopter-dji-mavic-3-fly-more-combo-s-kameroj-seryj'),
(1281, 0, 1, 'product_id=22', 'kvadrokopter-dji-air-2s-fly-more-combo-smart-controller-s-kameroj-seryj'),
(538, 0, 1, 'product_id=23', 'kvadrokopter-autel-evo-lite-standard-package-mdxm2-s-kameroj-oranzhevyj'),
(539, 0, 1, 'product_id=24', 'kvadrokopter-autel-evo-nano-standard-package-mda2-s-kameroj-oranzhevyj'),
(540, 0, 1, 'product_id=25', 'kvadrokopter-hiper-hqc-0001-shadow-fpv-s-kameroj-chernyj'),
(541, 0, 1, 'product_id=26', 'kvadrokopter-syma-x5uw-d-s-kameroj-belyj'),
(542, 0, 1, 'product_id=27', 'kvadrokopter-flybotic-bamper-dron-bez-kamery-sinij'),
(543, 0, 1, 'product_id=28', 'kvadrokopter-hiper-hqc-0030-sky-patrol-fpv-s-kameroj-chernyj'),
(544, 0, 1, 'product_id=29', 'kvadrokopter-hiper-hqc-0003-falcon-x-fpv-s-kameroj-chernyj'),
(545, 0, 1, 'product_id=30', 'kvadrokopter-syma-x5uw-s-kameroj-krasnyj'),
(546, 0, 1, 'product_id=31', 'naushniki-sony-xba-z5-3-5-mm-chernyj'),
(547, 0, 1, 'product_id=32', 'naushniki-pioneer-hdj-x10-s-6-3-mm-serebristyj-chernyj'),
(548, 0, 1, 'product_id=33', 'naushniki-sennheiser-ie-80s-bt-bluetooth-chernyj'),
(549, 0, 1, 'product_id=34', 'naushniki-fiio-fh7-3-5-mm-chernyj'),
(550, 0, 1, 'product_id=35', 'garnitura-philips-l3-00-bluetooth-usb-type-c-chernyj'),
(1313, 0, 1, 'product_id=36', 'naushniki-audio-technica-ath-anc900bt-3-5-mm-bluetooth-chernyj'),
(552, 0, 1, 'product_id=37', 'naushniki-pioneer-hdj-s7-3-5-mm-6-3-mm-chernyj'),
(553, 0, 1, 'product_id=38', 'garnitura-sony-wh-h910n-3-5-mm-bluetooth-sinij'),
(1317, 0, 1, 'product_id=39', 'naushniki-fiio-fd5-2-5-mm-3-5-mm-4-4-mm-serebristyj'),
(555, 0, 1, 'product_id=40', 'garnitura-vnutrikanalnye-apple-airpods-pro-2-a2698-a2699-a2700-belyj-besprovodnye-bluetooth-mqd83z'),
(1383, 0, 1, 'product_id=41', 'besprovodnoe-zaryadnoe-ustrojstvo-apple-magsafe-duo-belyj'),
(1393, 0, 1, 'product_id=42', 'besprovodnoe-zaryadnoe-ustrojstvo-canyon-ws-404-chernyj'),
(558, 0, 1, 'product_id=43', 'setevoe-zaryadnoe-ustrojstvo-satechi-compact-charger-seryj'),
(559, 0, 1, 'product_id=44', 'besprovodnoe-zaryadnoe-ustrojstvo-prestigio-revolt-a7-3-v-1-chernyj'),
(1391, 0, 1, 'product_id=45', 'besprovodnoe-zar-ustr-xiaomi-50w-wireless-charging-stand-3-25a-pd-universalnoe-chernyj-zolotisty'),
(561, 0, 1, 'product_id=46', 'setevoe-zaryadnoe-ustrojstvo-canyon-h-100-belyj'),
(562, 0, 1, 'product_id=47', 'besprovodnoe-zaryadnoe-ustrojstvo-prestigio-revolt-a9-3-v-1-seryj'),
(563, 0, 1, 'product_id=48', 'besprovodnoe-zaryadnoe-ustrojstvo-apple-magsafe-mhxh3ze-a-belyj'),
(564, 0, 1, 'product_id=49', 'besprovodnoe-zaryadnoe-ustrojstvo-samsung-ep-p2400-belyj'),
(565, 0, 1, 'product_id=50', 'besprovodnoe-zaryadnoe-ustrojstvo-samsung-ep-p2400-chernyj'),
(566, 0, 1, 'product_id=51', 'noutbuk-msi-creatorpro-x17-a12ums-205ru-9s7-17q121-205-chernyj'),
(567, 0, 1, 'product_id=52', 'noutbuk-apple-macbook-pro-a2485-m1-max-10-core-32gb-ssd1tb-32-core-gpu-16-2-mac-os-grey-space'),
(568, 0, 1, 'product_id=53', 'noutbuk-msi-creatorpro-x17-a12uks-206ru-9s7-17q121-206-chernyj'),
(569, 0, 1, 'product_id=54', 'noutbuk-msi-creator-z16p-b12uhst-028ru-9s7-15g121-028-seryj'),
(570, 0, 1, 'product_id=55', 'noutbuk-apple-macbook-pro-z15k0007a-serebristyj'),
(571, 0, 1, 'product_id=56', 'noutbuk-apple-macbook-pro-a2485-mk1a3b-a-seryj-kosmos'),
(572, 0, 1, 'product_id=57', 'noutbuk-msi-raider-ge77hx-12uhs-232ru-9s7-17k514-232-temno-seryj'),
(573, 0, 1, 'product_id=58', 'noutbuk-msi-creatorpro-z16p-b12ukst-222ru-9s7-15g121-222-seryj'),
(574, 0, 1, 'product_id=59', 'noutbuk-apple-macbook-pro-a2485-m1-pro-10-core-16gb-ssd512gb-16-core-gpu-16-2-mac-os-silver'),
(575, 0, 1, 'product_id=60', 'noutbuk-apple-macbook-pro-a2485-m1-pro-10-core-16gb-ssd512gb-16-core-gpu-16-2-mac-os-grey-space'),
(576, 0, 1, 'product_id=61', 'monoblok-dell-optiplex-7490-23-8-intel-core-i5-11500-8gb-512gb-ssd-intel-uhd-graphics-750-windows-10-professional-chernyj'),
(577, 0, 1, 'product_id=62', 'monoblok-apple-imac-mhk03ru-a-21-5-intel-core-i5-7360u-8gb-256gb-ssd-intel-iris-plus-graphics-640-macos-serebristyj-i-chernyj'),
(1341, 0, 1, 'product_id=63', 'monoblok-lenovo-ideacentre-a540-icb-23-8-intel-core-i5-9400t-8gb-1000gb-ssd-intel-uhd-graphics-630-free-dos-chernyj'),
(579, 0, 1, 'product_id=64', 'monoblok-lenovo-v30a-24iil-23-8-intel-core-i5-1035g1-8gb-512gb-ssd-intel-uhd-graphics-dvd-rw-windows-10-professional-chernyj'),
(580, 0, 1, 'product_id=65', 'monoblok-lenovo-v30a-24iil-23-8-intel-core-i5-1035g1-8gb-512gb-ssd-intel-uhd-graphics-dvd-rw-noos-chernyj'),
(581, 0, 1, 'product_id=66', 'monoblok-acer-aspire-c24-1650-23-8-intel-core-i3-1115g4-8gb-512gb-ssd-intel-uhd-graphics-windows-11-home-serebristyj'),
(582, 0, 1, 'product_id=67', 'monoblok-acer-veriton-ez2740g-23-8-intel-core-i3-1115g4-8gb-256gb-ssd-intel-uhd-graphics-windows-10-professional-chernyj'),
(583, 0, 1, 'product_id=68', 'monoblok-acer-aspire-c24-1650-23-8-intel-core-i3-1115g4-8gb-256gb-ssd-intel-uhd-graphics-windows-11-home-serebristyj'),
(584, 0, 1, 'product_id=69', 'monoblok-lenovo-v30a-24iil-23-8-intel-core-i3-1005g1-8gb-256gb-ssd-intel-uhd-graphics-windows-10-professional-chernyj'),
(585, 0, 1, 'product_id=70', 'monoblok-acer-veriton-z4880g-23-8-intel-core-i3-10105-8gb-256gb-ssd-intel-uhd-graphics-630-noos-chernyj'),
(586, 0, 1, 'product_id=71', 'monitor-dell-ultrasharp-up3221q-31-5-chernyj'),
(587, 0, 1, 'product_id=72', 'monitor-igrovoj-asus-rog-strix-xg438qr-43-chernyj'),
(588, 0, 1, 'product_id=73', 'monitor-benq-sw271c-27-chernyj'),
(589, 0, 1, 'product_id=74', 'monitor-igrovoj-asus-rog-swift-pg259qnr-24-5-temno-seryj'),
(590, 0, 1, 'product_id=75', 'monitor-igrovoj-acer-cb382curbmiiphuzx-37-5-chernyj'),
(591, 0, 1, 'product_id=76', 'monitor-philips-498p9z-49-chernyj'),
(592, 0, 1, 'product_id=77', 'monitor-philips-499p9h-48-8-chernyj'),
(593, 0, 1, 'product_id=78', 'monitor-igrovoj-asus-rog-swift-pg279qm-27-chernyj'),
(594, 0, 1, 'product_id=79', 'monitor-igrovoj-gigabyte-m32uc-31-5-chernyj'),
(595, 0, 1, 'product_id=80', 'monitor-igrovoj-gigabyte-aorus-fi32q-x-32-chernyj'),
(596, 0, 1, 'product_id=81', 'printer-lazernyj-hp-laserjet-enterprise-800-m806dn-cherno-belyj-cvet-chernyj'),
(597, 0, 1, 'product_id=82', 'printer-lazernyj-kyocera-p3155dn-kartridzh-cherno-belyj-cvet-belyj'),
(598, 0, 1, 'product_id=83', 'printer-lazernyj-kyocera-p3155dn-cherno-belyj-cvet-belyj'),
(599, 0, 1, 'product_id=84', 'printer-lazernyj-kyocera-p3145dn-kartridzh-cherno-belyj-cvet-belyj'),
(600, 0, 1, 'product_id=85', 'printer-lazernyj-kyocera-p3145dn-cherno-belyj-cvet-belyj'),
(601, 0, 1, 'product_id=86', 'printer-lazernyj-katyusha-p247-cherno-belyj-cvet-chernyj'),
(602, 0, 1, 'product_id=87', 'printer-lazernyj-brother-hl-l9310cdw-cvetnoj-cvet-belyj'),
(603, 0, 1, 'product_id=88', 'printer-lazernyj-kyocera-color-p5021cdw-cvetnoj-cvet-belyj'),
(604, 0, 1, 'product_id=89', 'printer-strujnyj-epson-l1800-cvetnoj-cvet-chernyj'),
(605, 0, 1, 'product_id=90', 'printer-lazernyj-hp-color-laserjet-enterprise-m554dn-cvetnoj-cvet-belyj'),
(606, 0, 1, 'product_id=91', 'kolonki-bluetooth-sven-mc-30-2-0-chernyj'),
(1347, 0, 1, 'product_id=92', 'kolonki-bluetooth-creative-stage-360-2-1-chernyj'),
(608, 0, 1, 'product_id=93', 'kolonki-bluetooth-edifier-g7000-1-1-chernyj'),
(609, 0, 1, 'product_id=94', 'kolonki-bluetooth-edifier-r1700bts-2-0-korichnevyj'),
(610, 0, 1, 'product_id=95', 'kolonki-sven-ht-200-5-1-chernyj'),
(611, 0, 1, 'product_id=96', 'kolonki-bluetooth-oklick-ok-117-bt-2-0-chernyj'),
(612, 0, 1, 'product_id=97', 'kolonki-jbl-quantum-duo-2-0-chernyj'),
(613, 0, 1, 'product_id=98', 'kolonki-sven-ht-210-5-1-chernyj'),
(614, 0, 1, 'product_id=99', 'kolonki-creative-gigaworks-t40-series-ii-2-0-chernyj'),
(615, 0, 1, 'product_id=100', 'kolonki-bluetooth-sven-ms-2250-2-1-chernyj'),
(913, 0, 1, 'common/home', ''),
(914, 0, 2, 'common/home', 'en'),
(917, 0, 1, 'blog_category_id=73', 'documentatsiya'),
(918, 0, 2, 'blog_category_id=73', 'dosc'),
(1280, 0, 2, 'article_id=126', 'store-owner-on-exopencart-talks-about-his-pleasant-experience'),
(1279, 0, 1, 'article_id=126', 'Владелец магазина на exopencart рассказывает о своем приятном опыте'),
(1153, 0, 2, 'article_id=127', 'how-to-grab-luck-by-the-tail-and-not-lose-touch-with-reality'),
(1152, 0, 1, 'article_id=127', 'kak-skhvatit-udachu-za-hvost-i-ne-poteryat-svyaz-s-realnostyu'),
(1196, 0, 2, 'article_id=128', 'dry-fact-sheet'),
(1195, 0, 1, 'article_id=128', 'suhoe-izlozhenie-faktov'),
(1046, 0, 1, 'manufacturer_id=1', 'apple'),
(937, 0, 1, 'product/manufacturer', 'brendy'),
(938, 0, 2, 'product/manufacturer', 'brands'),
(940, 0, 1, 'manufacturer_id=2', 'samsung'),
(941, 0, 1, 'manufacturer_id=3', 'dji'),
(942, 0, 1, 'manufacturer_id=4', 'philips'),
(943, 0, 1, 'manufacturer_id=5', 'msi'),
(944, 0, 1, 'manufacturer_id=6', 'delonghi'),
(952, 0, 2, 'category_id=2', 'smartphones'),
(1263, 0, 1, 'category_id=1', 'smartfony-i-gadzhety'),
(991, 0, 1, 'category_id=13', 'bytovaya-tekhnika'),
(1041, 0, 1, 'asdf', 'asdfa'),
(1047, 0, 2, 'manufacturer_id=1', 'en-apple'),
(1120, 0, 1, 'product/special', 'rasprodazha'),
(1121, 0, 2, 'product/special', 'sale'),
(1154, 0, 1, 'information/contact', 'contacts'),
(1155, 0, 2, 'information/contact', 'contacts'),
(1156, 0, 1, 'blog/latest', 'blog'),
(1377, 0, 1, 'account/register', 'signup'),
(1378, 0, 2, 'account/register', 'signup'),
(1382, 0, 2, 'information_id=10', 'partnership-rules');

-- --------------------------------------------------------

--
-- Table structure for table `oc_session`
--

CREATE TABLE `oc_session` (
  `session_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_session`
--

INSERT INTO `oc_session` (`session_id`, `data`, `expire`) VALUES
('0078d8056850a18be7c53445e0', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-13 15:26:45'),
('03df9f87d9fab08bb5a3ee3111', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"ebs1bIwyOtxnIsyWcSiuRov41dIdDgJ6\",\"last_order_id\":136,\"account\":\"register\",\"compare\":[],\"wishlist\":[],\"payment_address\":{\"address_id\":0,\"country_id\":\"176\",\"zone_id\":\"2751\",\"firstname\":\"\",\"lastname\":\"\",\"company\":\"\",\"address_1\":\"\",\"address_2\":\"\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"postcode\":\"\",\"city\":\"\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"custom_field\":null},\"shipping_address\":false,\"customer_id\":\"95\",\"guest\":{\"customer_group_id\":\"1\"},\"payment_methods\":{\"cod\":{\"code\":\"cod\",\"title\":\"\\u041e\\u043f\\u043b\\u0430\\u0442\\u0430 \\u043f\\u0440\\u0438 \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0435\",\"terms\":\"\\u041d\\u0430\\u043b\\u0438\\u0447\\u043d\\u044b\\u043c\\u0438 \\u0438\\u043b\\u0438 \\u043a\\u0430\\u0440\\u0442\\u043e\\u0439\",\"sort_order\":\"1\"},\"bank_transfer\":{\"code\":\"bank_transfer\",\"icon\":null,\"title\":\"\\u041e\\u043f\\u043b\\u0430\\u0442\\u0430 \\u043e\\u043d\\u043b\\u0430\\u0439\\u043d\",\"terms\":\"\\u041a\\u0430\\u0440\\u0442\\u043e\\u0439 \\u0438\\u043b\\u0438 QR-\\u043a\\u043e\\u0434\\u043e\\u043c\",\"sort_order\":\"2\"}}}', '2026-01-17 15:27:03'),
('04170fc6e8fc07fb1f791b8dd1', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"account\":\"register\",\"billing_for_shipping\":false,\"last_order_id\":110,\"user_token\":\"0chekMUZPEZReSmWghna5VKpwgGj1Kck\",\"shipping_address\":{\"address_id\":\"129\",\"firstname\":\"\\u0410\\u043d\\u0434\\u0440\\u0435\\u0439\",\"lastname\":\"\\u041c\\u0435\\u0440\\u0437\\u043b\\u0438\\u043a\\u0438\\u043d\",\"company\":\"\",\"address_1\":\"\\u0427\\u043a\\u0430\\u043b\\u043e\\u0432\\u0430\",\"address_2\":\"32\",\"postcode\":\"123123\",\"city\":\"\\u041d\\u0438\\u0436\\u043d\\u0438\\u0439 \\u041d\\u043e\\u0432\\u043e\\u0433\\u043e\\u0440\\u043e\\u0434\",\"zone_id\":\"2766\",\"zone\":\"\\u041d\\u0438\\u0436\\u0435\\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"NIZ\",\"country_id\":\"176\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"iso_code_2\":\"RU\",\"iso_code_3\":\"RUS\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"custom_field\":[]},\"payment_address\":{\"address_id\":\"129\",\"firstname\":\"\\u0410\\u043d\\u0434\\u0440\\u0435\\u0439\",\"lastname\":\"\\u041c\\u0435\\u0440\\u0437\\u043b\\u0438\\u043a\\u0438\\u043d\",\"company\":\"\",\"address_1\":\"\\u0427\\u043a\\u0430\\u043b\\u043e\\u0432\\u0430\",\"address_2\":\"32\",\"postcode\":\"123123\",\"city\":\"\\u041d\\u0438\\u0436\\u043d\\u0438\\u0439 \\u041d\\u043e\\u0432\\u043e\\u0433\\u043e\\u0440\\u043e\\u0434\",\"zone_id\":\"2766\",\"zone\":\"\\u041d\\u0438\\u0436\\u0435\\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"NIZ\",\"country_id\":\"176\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"iso_code_2\":\"RU\",\"iso_code_3\":\"RUS\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"custom_field\":[]},\"customer_id\":\"90\",\"guest\":{\"customer_group_id\":\"1\"}}', '2026-01-13 11:31:10'),
('08cbf1ec1dd98b637494977c33', '{\"api_id\":\"7\"}', '2026-01-13 11:42:21'),
('09e779b2945c14d635dfe6229e', '{\"api_id\":\"7\"}', '2026-01-13 15:05:02'),
('0be064a3723106622aec50b800', '{\"api_id\":\"7\"}', '2026-01-13 16:44:22'),
('0e560ba859d0651b6be7d4274b', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-11 10:52:02'),
('0f6560579279cf0f133908ca7b', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\",\"customer\":{\"customer_id\":\"0\",\"customer_group_id\":\"1\",\"firstname\":\"\\u0412\\u0430\\u0441\\u0438\\u043b\\u0438\\u0439\",\"lastname\":\"\\u0417\\u0430\\u043b\\u0443\\u043f\\u0438\\u043d\",\"email\":\"tinkov@exopencart.ru\",\"telephone\":\"+7 987 654 32 10\",\"custom_field\":[]},\"payment_address\":{\"firstname\":\"\\u0410\\u043d\\u0434\\u0440\\u0435\\u0439\",\"lastname\":\"\\u041c\\u0435\\u0440\\u0437\\u043b\\u0438\\u043a\\u0438\\u043d\",\"company\":\"\\u041e\\u041e\\u041e &quot;\\u042d\\u041a\\u0421&quot;\",\"address_1\":\"\\u0427\\u043a\\u0430\\u043b\\u043e\\u0432\\u0430\",\"address_2\":\"32\",\"postcode\":\"603002\",\"city\":\"\\u041c\\u043e\\u0441\\u043a\\u0432\\u0430\",\"zone_id\":\"2751\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"MOS\",\"country_id\":\"176\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"iso_code_2\":\"RU\",\"iso_code_3\":\"RUS\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"custom_field\":[]},\"payment_methods\":{\"cod\":{\"code\":\"cod\",\"title\":\"\\u041e\\u043f\\u043b\\u0430\\u0442\\u0430 \\u043f\\u0440\\u0438 \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0435\",\"terms\":\"\",\"sort_order\":\"1\"},\"bank_transfer\":{\"code\":\"bank_transfer\",\"title\":\"\\u0411\\u0430\\u043d\\u043a\\u043e\\u0432\\u0441\\u043a\\u0438\\u0439 \\u043f\\u0435\\u0440\\u0435\\u0432\\u043e\\u0434\",\"terms\":\"\",\"sort_order\":\"2\"}},\"shipping_address\":{\"firstname\":\"\\u0410\\u043d\\u0434\\u0440\\u0435\\u0439\",\"lastname\":\"\\u041c\\u0435\\u0440\\u0437\\u043b\\u0438\\u043a\\u0438\\u043d\",\"company\":\"\\u041e\\u041e\\u041e &quot;\\u042d\\u041a\\u0421&quot;\",\"address_1\":\"\\u0427\\u043a\\u0430\\u043b\\u043e\\u0432\\u0430\",\"address_2\":\"32\",\"postcode\":\"603002\",\"city\":\"\\u041c\\u043e\\u0441\\u043a\\u0432\\u0430\",\"zone_id\":\"2751\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"MOS\",\"country_id\":\"176\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"iso_code_2\":\"RU\",\"iso_code_3\":\"RUS\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"custom_field\":[]},\"shipping_methods\":{\"pickup\":{\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437\",\"quote\":{\"pickup\":{\"code\":\"pickup.pickup\",\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437 \\u0438\\u0437 \\u041f\\u0412\\u0417\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}},\"sort_order\":\"1\",\"error\":false},\"free\":{\"title\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430\",\"quote\":{\"free\":{\"code\":\"free.free\",\"title\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}},\"sort_order\":\"2\",\"error\":false},\"flat\":{\"title\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0434\\u043e \\u0434\\u0432\\u0435\\u0440\\u0438\",\"quote\":{\"flat\":{\"code\":\"flat.flat\",\"title\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0434\\u043e \\u0430\\u0434\\u0440\\u0435\\u0441\\u0430\",\"cost\":\"300\",\"tax_class_id\":\"0\",\"text\":\"300 \\u20bd\"}},\"sort_order\":\"3\",\"error\":false}}}', '2026-01-11 10:51:46'),
('107290a98ac26d7f22d5502e99', '{\"api_id\":\"7\"}', '2026-01-09 20:00:39'),
('11f5a6cd582b415f8e012098cc', '{\"api_id\":\"7\"}', '2026-01-19 21:44:56'),
('123514e654ff045b39145ac272', '{\"api_id\":\"7\"}', '2026-01-13 12:18:20'),
('13317dbc492792581a034ac8c7', '{\"api_id\":\"7\"}', '2026-01-13 11:42:19'),
('176594bad4c09b24c0653f8842', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-19 21:49:42'),
('17c9e29026d83d1de00f9086b0', '{\"api_id\":\"7\"}', '2026-01-03 13:44:36'),
('190e098e21dc7f3acc521dc5c2', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"00jZBfPta0mXbddCAXTsragSjZl0coqz\",\"shipping_address\":{\"address_id\":0,\"country_id\":\"176\",\"zone_id\":\"2751\",\"firstname\":\"\",\"lastname\":\"\",\"company\":\"\",\"address_1\":\"\",\"address_2\":\"\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"postcode\":\"\",\"city\":\"\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"custom_field\":null},\"account\":\"guest\",\"billing_for_shipping\":true,\"last_order_id\":94,\"guest\":{\"customer_group_id\":\"1\",\"email\":\"tinkov@exopencart.ru\"},\"payment_methods\":{\"cod\":{\"code\":\"cod\",\"title\":\"\\u041e\\u043f\\u043b\\u0430\\u0442\\u0430 \\u043f\\u0440\\u0438 \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0435\",\"terms\":\"\",\"sort_order\":\"1\"},\"bank_transfer\":{\"code\":\"bank_transfer\",\"title\":\"\\u0411\\u0430\\u043d\\u043a\\u043e\\u0432\\u0441\\u043a\\u0438\\u0439 \\u043f\\u0435\\u0440\\u0435\\u0432\\u043e\\u0434\",\"terms\":\"\",\"sort_order\":\"2\"}},\"shipping_methods\":{\"pickup\":{\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437\",\"quote\":{\"pickup\":{\"code\":\"pickup.pickup\",\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437 \\u0438\\u0437 \\u041f\\u0412\\u0417\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}},\"sort_order\":\"1\",\"error\":false},\"free\":{\"title\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430\",\"quote\":{\"free\":{\"code\":\"free.free\",\"title\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}},\"sort_order\":\"2\",\"error\":false},\"flat\":{\"title\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0434\\u043e \\u0434\\u0432\\u0435\\u0440\\u0438\",\"quote\":{\"flat\":{\"code\":\"flat.flat\",\"title\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0434\\u043e \\u0430\\u0434\\u0440\\u0435\\u0441\\u0430\",\"cost\":\"300\",\"tax_class_id\":\"0\",\"text\":\"300 \\u20bd\"}},\"sort_order\":\"3\",\"error\":false}},\"shipping_method\":{\"code\":\"pickup.pickup\",\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437 \\u0438\\u0437 \\u041f\\u0412\\u0417\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}}', '2026-01-11 09:02:43'),
('19b54725174903b3a65332f5fb', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-19 21:13:59'),
('1c465e4c05eef1b01e7c1db616', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"last_order_id\":163,\"guest\":{\"customer_group_id\":\"1\"}}', '2026-01-19 21:05:30'),
('1f1e4c0b8d7194e9377ab348a2', '{\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-01 21:00:08'),
('1fc7b4b9ce6dff07670abe0113', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-13 12:17:20'),
('209497bbc5bb96f8727ac1fc31', '{\"api_id\":\"7\"}', '2026-01-11 08:43:05'),
('24919ef69bb6870e2eb276799e', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-10 20:48:50'),
('25c3d7238728fd39450d090095', '{\"api_id\":\"7\"}', '2026-01-11 08:43:55'),
('2670888699b7dac76a597d02b5', '{\"api_id\":\"7\"}', '2026-01-13 12:11:31'),
('290dc9779fa0b2bc227ce3e9ea', '{\"api_id\":\"7\"}', '2026-01-15 15:30:27'),
('3060b8606042eb530f55932119', '{\"api_id\":\"7\"}', '2026-01-09 20:00:36'),
('31701a3de88988835f76aff42a', '{\"api_id\":\"7\"}', '2026-01-03 11:21:55'),
('31bb52c767b3f0b5a5639538b8', '{\"api_id\":\"7\"}', '2026-01-13 11:28:49'),
('32adb57c2ea48656b4750fe6af', '{\"api_id\":\"7\"}', '2026-01-19 20:20:00'),
('3431e54fb38772a8422c86bbfa', '{\"api_id\":\"7\"}', '2026-01-12 13:20:51'),
('35527aa00976dbe196ce5ec35f', '{\"api_id\":\"7\"}', '2026-01-03 11:20:24'),
('35c9d623e7a24aa3325a84f5ee', '{\"api_id\":\"7\"}', '2026-01-10 14:16:51'),
('360e91821c7e3112a2ded633c4', '{\"api_id\":\"7\"}', '2026-01-11 17:47:41'),
('375cc80c2bcc859e3cf2feea33', '{\"api_id\":\"7\"}', '2026-01-14 15:12:07'),
('39e863487ccd94270116a836a9', '{\"api_id\":\"7\"}', '2026-01-12 14:08:01'),
('3ba62627ca66d34a2c0fc50e0e', '{\"api_id\":\"7\"}', '2026-01-10 14:42:29'),
('3bc9e897901aeafb0f96c2975f', '{\"api_id\":\"7\"}', '2026-01-11 10:45:16'),
('3ddcc371771967491c49712ddd', '{\"api_id\":\"7\"}', '2026-01-11 17:28:29'),
('3ef5572bef4c52d9eb5614bb7a', '{\"api_id\":\"7\"}', '2026-01-11 10:45:18'),
('3f0925dba3507bf49b613f8940', '{\"api_id\":\"7\"}', '2026-01-15 15:42:35'),
('41253e6e7b70edbccea367e3d5', '{\"api_id\":\"7\"}', '2026-01-03 10:58:29'),
('43baf154b3ef62068f3ea99b8f', '{\"api_id\":\"7\"}', '2026-01-15 20:53:25'),
('44998d7b6e7f29402a48292716', '{\"api_id\":\"7\"}', '2026-01-14 15:17:31'),
('45f7710f51a8267fac970f56b7', '{\"api_id\":\"7\"}', '2026-01-11 10:25:50'),
('47515d8c3b880c43a6a725f65f', '{\"api_id\":\"7\"}', '2026-01-11 10:50:55'),
('4886cc9933124a897e14c07844', '{\"api_id\":\"7\"}', '2026-01-11 10:31:57'),
('4a1c6dc428517254648bb3fe91', '{\"api_id\":\"7\"}', '2026-01-21 16:13:31'),
('4b8501e0d39028bcaa2bc180b0', '{\"api_id\":\"7\"}', '2026-01-19 21:46:44'),
('4bfaab106c6e708bbf12f55758', '{\"api_id\":\"7\"}', '2026-01-11 10:35:14'),
('4cbd71224e6b46752dea634e6f', '{\"api_id\":\"7\"}', '2026-01-13 16:45:07'),
('4da4b24ea4a52447f9eb91e998', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-11 10:31:57'),
('4dcce7a61e3857299fb1137e0f', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-13 16:44:21'),
('4f178a9421ecf636f96348a244', '{\"api_id\":\"7\"}', '2026-01-11 10:50:53'),
('51fdb86b99f9161f8b3d35c537', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"shipping_address\":{\"address_id\":0,\"country_id\":\"176\",\"zone_id\":\"2751\",\"firstname\":\"\\u0410\\u043d\\u0434\\u0440\\u0435\\u0439\",\"lastname\":\"\\u041c\\u0435\\u0440\\u0437\\u043b\\u0438\\u043a\\u0438\\u043d\",\"company\":\"\",\"address_1\":\"\",\"address_2\":\"\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"postcode\":\"\",\"city\":\"\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"custom_field\":null},\"guest\":{\"customer_group_id\":\"1\",\"email\":\"tinkov@exopencart.ru\",\"firstname\":\"\\u0410\\u043d\\u0434\\u0440\\u0435\\u0439\",\"lastname\":\"\\u041c\\u0435\\u0440\\u0437\\u043b\\u0438\\u043a\\u0438\\u043d\",\"telephone\":\"+7 987 654 32 10\"},\"payment_address\":{\"address_id\":0,\"country_id\":\"176\",\"zone_id\":\"2751\",\"firstname\":\"\\u0412\\u0430\\u0441\\u0438\\u043b\\u0438\\u0439\",\"lastname\":\"\\u0417\\u0430\\u043b\\u0443\\u043f\\u0438\\u043d\",\"company\":\"\\u041e\\u041e\\u041e &quot;\\u0417\\u0430\\u043b\\u0443\\u043f\\u0435\\u043d\\u044c&quot;\",\"address_1\":\"\\u041b\\u0435\\u043d\\u0438\\u043d\\u0430 56\",\"address_2\":\"12\\/16 \\u043a\\u0432 120, 10 \\u044d\\u0442\\u0430\\u0436\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"postcode\":\"123123\",\"city\":\"\\u0421\\u0430\\u0440\\u0430\\u0442\\u043e\\u0432\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"custom_field\":null},\"comment\":\"\",\"user_id\":\"1\",\"user_token\":\"Gotpy86UNqp2JW8ahtc2klOrviawueYX\",\"payment_methods\":{\"cod\":{\"code\":\"cod\",\"title\":\"\\u041e\\u043f\\u043b\\u0430\\u0442\\u0430 \\u043f\\u0440\\u0438 \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0435\",\"terms\":\"\",\"sort_order\":\"1\"},\"bank_transfer\":{\"code\":\"bank_transfer\",\"title\":\"\\u0411\\u0430\\u043d\\u043a\\u043e\\u0432\\u0441\\u043a\\u0438\\u0439 \\u043f\\u0435\\u0440\\u0435\\u0432\\u043e\\u0434\",\"terms\":\"\",\"sort_order\":\"2\"}},\"shipping_methods\":{\"pickup\":{\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437\",\"quote\":{\"pickup\":{\"code\":\"pickup.pickup\",\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437 \\u0438\\u0437 \\u041f\\u0412\\u0417\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}},\"sort_order\":\"1\",\"error\":false},\"free\":{\"title\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430\",\"quote\":{\"free\":{\"code\":\"free.free\",\"title\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}},\"sort_order\":\"2\",\"error\":false},\"flat\":{\"title\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0434\\u043e \\u0434\\u0432\\u0435\\u0440\\u0438\",\"quote\":{\"flat\":{\"code\":\"flat.flat\",\"title\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0434\\u043e \\u0430\\u0434\\u0440\\u0435\\u0441\\u0430\",\"cost\":\"300\",\"tax_class_id\":\"0\",\"text\":\"300 \\u20bd\"}},\"sort_order\":\"3\",\"error\":false}},\"shipping_method\":{\"code\":\"pickup.pickup\",\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437 \\u0438\\u0437 \\u041f\\u0412\\u0417\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}}', '2026-01-09 15:56:46'),
('5276465d16baf611ed89fcc07c', '{\"api_id\":\"7\"}', '2026-01-11 08:43:14'),
('53327ed784b7345f66e2d1f3cb', '{\"api_id\":\"7\"}', '2026-01-10 14:42:58'),
('5366b605730ccedf4366275c46', '{\"api_id\":\"7\"}', '2026-01-13 12:17:20'),
('59514d6708ec92dbe7b4070dcb', '{\"user_id\":\"1\",\"user_token\":\"YlO3nHr1V5LzoopY7UUwiamn7h5huFAo\",\"language\":\"ru-ru\",\"currency\":\"RUB\",\"wishlist\":[],\"payment_address\":{\"address_id\":0,\"country_id\":\"176\",\"zone_id\":\"2751\",\"firstname\":\"\\u0412\\u0430\\u0441\\u0438\\u043b\\u0438\\u0439\",\"lastname\":\"\\u0417\\u0430\\u043b\\u0443\\u043f\\u0438\\u043d\",\"company\":\"\",\"address_1\":\"\",\"address_2\":\"\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"postcode\":\"\",\"city\":\"\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"custom_field\":null},\"shipping_address\":{\"address_id\":0,\"country_id\":\"176\",\"zone_id\":\"2751\",\"firstname\":\"\\u0412\\u0430\\u0441\\u0438\\u043b\\u0438\\u0439\",\"lastname\":\"\\u0417\\u0430\\u043b\\u0443\\u043f\\u0438\\u043d\",\"company\":\"\",\"address_1\":\"\",\"address_2\":\"\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"postcode\":\"\",\"city\":\"\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"custom_field\":null},\"last_order_id\":77,\"file_manager_directory\":\"\\/shared\\/httpd\\/exopencart\\/htdocs\\/image\\/catalog\",\"compare\":[],\"account\":\"guest\",\"guest\":{\"customer_group_id\":\"1\",\"email\":\"tinkov@exopencart.ru\",\"agree\":1,\"firstname\":\"\\u0412\\u0430\\u0441\\u0438\\u043b\\u0438\\u0439\",\"lastname\":\"\\u0417\\u0430\\u043b\\u0443\\u043f\\u0438\\u043d\",\"telephone\":\"+7 987 654 32 10\"},\"comment\":\"\",\"payment_methods\":{\"cod\":{\"code\":\"cod\",\"title\":\"\\u041e\\u043f\\u043b\\u0430\\u0442\\u0430 \\u043f\\u0440\\u0438 \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0435\",\"terms\":\"\",\"sort_order\":\"1\"},\"bank_transfer\":{\"code\":\"bank_transfer\",\"title\":\"\\u0411\\u0430\\u043d\\u043a\\u043e\\u0432\\u0441\\u043a\\u0438\\u0439 \\u043f\\u0435\\u0440\\u0435\\u0432\\u043e\\u0434\",\"terms\":\"\",\"sort_order\":\"2\"}},\"shipping_methods\":{\"pickup\":{\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437\",\"quote\":{\"pickup\":{\"code\":\"pickup.pickup\",\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437 \\u0438\\u0437 \\u041f\\u0412\\u0417\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}},\"sort_order\":\"1\",\"error\":false},\"free\":{\"title\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430\",\"quote\":{\"free\":{\"code\":\"free.free\",\"title\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}},\"sort_order\":\"2\",\"error\":false},\"flat\":{\"title\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0434\\u043e \\u0434\\u0432\\u0435\\u0440\\u0438\",\"quote\":{\"flat\":{\"code\":\"flat.flat\",\"title\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0434\\u043e \\u0430\\u0434\\u0440\\u0435\\u0441\\u0430\",\"cost\":\"300\",\"tax_class_id\":\"0\",\"text\":\"300 \\u20bd\"}},\"sort_order\":\"3\",\"error\":false}}}', '2026-01-09 12:12:27'),
('5a13d79583b3e298caa88ec51b', '{\"api_id\":\"7\"}', '2026-01-09 16:36:34'),
('5ae335cf6c2064014679c49c54', '{\"api_id\":\"7\"}', '2026-01-15 15:22:23'),
('5b0b5a55ad7208a30381e9a904', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"gYUsfS7PkutjS2ec3SuMcs1UsS9jKxjm\"}', '2026-01-19 20:27:30'),
('5f17b8eef2fdcd839daaddedcc', '{\"api_id\":\"7\"}', '2026-01-12 15:36:55'),
('5f818a439ab5f951031ef39ae7', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-10 14:42:57'),
('6014f7343a831366822ab0d6fe', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-11 10:19:40'),
('6070a6d49ec36535eccd0a5246', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"payment_address\":{\"address_id\":0,\"country_id\":\"176\",\"zone_id\":\"2783\",\"firstname\":\"\\u0412\\u0430\\u0441\\u0438\\u043b\\u0438\\u0439\",\"lastname\":\"\\u0417\\u0430\\u043b\\u0443\\u043f\\u0438\\u043d\",\"company\":\"IP Sokovnin\",\"address_1\":\"\\u041b\\u0435\\u043d\\u0438\\u043d\\u0430 56\",\"address_2\":\"12\\/16 \\u043a\\u0432 120, 10 \\u044d\\u0442\\u0430\\u0436\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"postcode\":\"123123\",\"city\":\"\\u0421\\u0430\\u0440\\u0430\\u0442\\u043e\\u0432\",\"zone\":\"\\u0421\\u0430\\u0440\\u0430\\u0442\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"custom_field\":null},\"shipping_address\":{\"address_id\":0,\"country_id\":\"176\",\"zone_id\":\"2751\",\"firstname\":\"\\u0412\\u0430\\u0441\\u0438\\u043b\\u0438\\u0439\",\"lastname\":\"\\u0417\\u0430\\u043b\\u0443\\u043f\\u0438\\u043d\",\"company\":\"\",\"address_1\":\"\",\"address_2\":\"\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"postcode\":\"\",\"city\":\"\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"custom_field\":null},\"guest\":{\"customer_group_id\":\"1\",\"agree\":1,\"firstname\":\"\\u0412\\u0430\\u0441\\u0438\\u043b\\u0438\\u0439\",\"lastname\":\"\\u0417\\u0430\\u043b\\u0443\\u043f\\u0438\\u043d\",\"telephone\":\"+7 987 654 32 10\",\"email\":\"tinkov@exopencart.ru\"},\"user_id\":\"1\",\"user_token\":\"1zsevHhsdaIxxbpj6uIEDNhTYb1dSB0M\",\"payment_methods\":{\"cod\":{\"code\":\"cod\",\"title\":\"\\u041e\\u043f\\u043b\\u0430\\u0442\\u0430 \\u043f\\u0440\\u0438 \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0435\",\"terms\":\"\",\"sort_order\":\"1\"},\"bank_transfer\":{\"code\":\"bank_transfer\",\"title\":\"\\u0411\\u0430\\u043d\\u043a\\u043e\\u0432\\u0441\\u043a\\u0438\\u0439 \\u043f\\u0435\\u0440\\u0435\\u0432\\u043e\\u0434\",\"terms\":\"\",\"sort_order\":\"2\"}},\"shipping_methods\":{\"pickup\":{\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437\",\"quote\":{\"pickup\":{\"code\":\"pickup.pickup\",\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437 \\u0438\\u0437 \\u041f\\u0412\\u0417\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}},\"sort_order\":\"1\",\"error\":false},\"free\":{\"title\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430\",\"quote\":{\"free\":{\"code\":\"free.free\",\"title\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}},\"sort_order\":\"2\",\"error\":false},\"flat\":{\"title\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0434\\u043e \\u0434\\u0432\\u0435\\u0440\\u0438\",\"quote\":{\"flat\":{\"code\":\"flat.flat\",\"title\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0434\\u043e \\u0430\\u0434\\u0440\\u0435\\u0441\\u0430\",\"cost\":\"300\",\"tax_class_id\":\"0\",\"text\":\"300 \\u20bd\"}},\"sort_order\":\"3\",\"error\":false}}}', '2026-01-09 14:11:54'),
('61f7259ceb4a3f75a93ecc900e', '{\"api_id\":\"7\"}', '2026-01-11 14:36:12'),
('628356d2d767d8bfb0ef21d480', '{\"api_id\":\"7\"}', '2026-01-11 17:28:26'),
('62ef13d7a3681ec1d2a2d6a52d', '{\"api_id\":\"7\"}', '2026-01-15 15:22:21'),
('639030ddebe3f1129768899cda', '{\"api_id\":\"7\"}', '2026-01-11 10:51:27'),
('647cec1ac47b06d14f3382b6de', '{\"api_id\":\"7\"}', '2026-01-13 12:09:48'),
('677f2bf0bf29762c0e604c16ba', '{\"api_id\":\"7\"}', '2026-01-10 14:42:30'),
('67883580c124f5ff8e54c075e8', '{\"api_id\":\"7\"}', '2026-01-10 20:48:50'),
('6bdfd864f5e44b25df1684602b', '{\"api_id\":\"7\"}', '2026-01-14 15:16:29'),
('6de15974e9228a7ac02db588ef', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"zhWEuwZyzWBz63h0sSjN7kW8j9UFJMCl\",\"wishlist\":[],\"account\":\"register\",\"last_order_id\":168,\"shipping_address\":{\"address_id\":0,\"country_id\":\"176\",\"zone_id\":\"2751\",\"firstname\":\"\",\"lastname\":\"\",\"company\":\"\",\"address_1\":\"\",\"address_2\":\"\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"postcode\":\"\",\"city\":\"\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"custom_field\":null},\"guest\":{\"customer_group_id\":\"1\",\"email\":\"tinkov@exopencart.ru\"}}', '2026-01-21 16:16:05'),
('6f2f75b720b7f5ef67a4a036de', '{\"api_id\":\"7\"}', '2026-01-14 15:12:09'),
('70ac2a793ccbcf4a0719fb8f7f', '{\"api_id\":\"7\"}', '2026-01-19 21:51:43'),
('738a043ced2ef91721af56e30e', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-19 21:44:55'),
('765e97dea3e2e43d46e691932e', '{\"api_id\":\"7\"}', '2026-01-12 15:34:53'),
('77023a69a7a278647ede0f8ffa', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-10 14:16:51'),
('7920fefa13100d6d916c090d41', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\",\"customer_id\":\"84\",\"customer\":{\"customer_id\":\"84\",\"customer_group_id\":\"1\",\"firstname\":\"\\u0412\\u0430\\u0441\\u0438\\u043b\\u0438\\u0439\",\"lastname\":\"\\u0417\\u0430\\u043b\\u0443\\u043f\\u0438\\u043d\",\"email\":\"tinkov@exopencart.ru\",\"telephone\":\"+7 987 654 32 10\",\"custom_field\":[]},\"payment_address\":{\"firstname\":\"\\u0412\\u0430\\u0441\\u0438\\u043b\\u0438\\u0439\",\"lastname\":\"\\u041f\\u0435\\u0442\\u0440\\u043e\\u0432\\u0438\\u0447\",\"company\":\"\",\"address_1\":\"\\u041c\\u0430\\u0433\\u0430\\u0437\\u0438\\u043d \\u043d\\u0430 \\u0420\\u0430\\u0431\\u043e\\u0447\\u0435\\u0439\",\"address_2\":\"\\u0433. \\u0421\\u0430\\u0440\\u0430\\u0442\\u043e\\u0432 \\u0443\\u043b. \\u0420\\u0430\\u0431\\u043e\\u0447\\u0430\\u044f 55\",\"postcode\":\"123123\",\"city\":\"\\u0421\\u0430\\u0440\\u0430\\u0442\\u043e\\u0432\",\"zone_id\":\"2751\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"MOS\",\"country_id\":\"176\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"iso_code_2\":\"RU\",\"iso_code_3\":\"RUS\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"custom_field\":[]},\"payment_methods\":{\"cod\":{\"code\":\"cod\",\"title\":\"\\u041e\\u043f\\u043b\\u0430\\u0442\\u0430 \\u043f\\u0440\\u0438 \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0435\",\"terms\":\"\",\"sort_order\":\"1\"},\"bank_transfer\":{\"code\":\"bank_transfer\",\"title\":\"\\u0411\\u0430\\u043d\\u043a\\u043e\\u0432\\u0441\\u043a\\u0438\\u0439 \\u043f\\u0435\\u0440\\u0435\\u0432\\u043e\\u0434\",\"terms\":\"\",\"sort_order\":\"2\"}},\"shipping_address\":{\"firstname\":\"\\u0412\\u0430\\u0441\\u0438\\u043b\\u0438\\u0439\",\"lastname\":\"\\u0417\\u0430\\u043b\\u0443\\u043f\\u0438\\u043d\",\"company\":\"\",\"address_1\":\"\\u041c\\u0430\\u0433\\u0430\\u0437\\u0438\\u043d \\u043d\\u0430 \\u0420\\u0430\\u0431\\u043e\\u0447\\u0435\\u0439\",\"address_2\":\"\\u0433. \\u0421\\u0430\\u0440\\u0430\\u0442\\u043e\\u0432 \\u0443\\u043b. \\u0420\\u0430\\u0431\\u043e\\u0447\\u0430\\u044f 55\",\"postcode\":\"603002\",\"city\":\"Saratov\",\"zone_id\":\"2751\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"MOS\",\"country_id\":\"176\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"iso_code_2\":\"RU\",\"iso_code_3\":\"RUS\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"custom_field\":[]},\"shipping_methods\":{\"pickup\":{\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437\",\"quote\":{\"pickup\":{\"code\":\"pickup.pickup\",\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437 \\u0438\\u0437 \\u041f\\u0412\\u0417\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}},\"sort_order\":\"1\",\"error\":false},\"free\":{\"title\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430\",\"quote\":{\"free\":{\"code\":\"free.free\",\"title\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}},\"sort_order\":\"2\",\"error\":false},\"flat\":{\"title\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0434\\u043e \\u0434\\u0432\\u0435\\u0440\\u0438\",\"quote\":{\"flat\":{\"code\":\"flat.flat\",\"title\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0434\\u043e \\u0430\\u0434\\u0440\\u0435\\u0441\\u0430\",\"cost\":\"300\",\"tax_class_id\":\"0\",\"text\":\"300 \\u20bd\"}},\"sort_order\":\"3\",\"error\":false}},\"payment_method\":{\"code\":\"cod\",\"title\":\"\\u041e\\u043f\\u043b\\u0430\\u0442\\u0430 \\u043f\\u0440\\u0438 \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0435\",\"terms\":\"\",\"sort_order\":\"1\"},\"shipping_method\":{\"code\":\"pickup.pickup\",\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437 \\u0438\\u0437 \\u041f\\u0412\\u0417\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}}', '2026-01-03 13:43:22'),
('799514efbce552d769c71f6a39', '{\"api_id\":\"7\"}', '2026-01-10 21:40:50'),
('7b3066e63c2473003849f9f982', '{\"api_id\":\"7\"}', '2026-01-11 10:14:44'),
('7bbc7c4141cc99e1c81151b033', '{\"api_id\":\"7\"}', '2026-01-19 21:49:42'),
('7e8fbf66190348192360ffaa4e', '{\"api_id\":\"7\"}', '2026-01-11 10:25:51'),
('7f3a45d0c2fd78d738ea93ad70', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"QdzNoqg7UkaTL2V6GmUEcoBcEdsi0AWN\",\"shipping_address\":{\"address_id\":0,\"country_id\":\"176\",\"zone_id\":\"2751\",\"firstname\":\"\\u0412\\u0430\\u0441\\u0438\\u043b\\u0438\\u0439\",\"lastname\":\"\\u0417\\u0430\\u043b\\u0443\\u043f\\u0438\\u043d\",\"company\":\"\",\"address_1\":\"\",\"address_2\":\"\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"postcode\":\"\",\"city\":\"\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"custom_field\":null},\"guest\":{\"customer_group_id\":\"1\",\"firstname\":\"\\u0412\\u0430\\u0441\\u0438\\u043b\\u0438\\u0439\",\"lastname\":\"\\u0417\\u0430\\u043b\\u0443\\u043f\\u0438\\u043d\",\"telephone\":\"+7 987 654 32 10\",\"email\":\"tinkov@exopencart.ru\",\"agree\":1,\"custom_field\":[]},\"account\":\"guest\",\"payment_address\":{\"address_id\":0,\"country_id\":\"176\",\"zone_id\":\"2751\",\"firstname\":\"\\u0412\\u0430\\u0441\\u0438\\u043b\\u0438\\u0439\",\"lastname\":\"\\u0417\\u0430\\u043b\\u0443\\u043f\\u0438\\u043d\",\"company\":\"\",\"address_1\":\"\",\"address_2\":\"\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"postcode\":\"\",\"city\":\"\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"custom_field\":null},\"billing_for_shipping\":false,\"comment\":\"\",\"order_id\":86}', '2026-01-10 17:52:43'),
('7fc6a8e481df9905adb397d32d', '{\"api_id\":\"7\"}', '2026-01-10 21:41:38'),
('805861ab68394c881c28ed7396', '{\"api_id\":\"7\"}', '2026-01-03 10:19:08'),
('8162737f4948345b6ff783891a', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-12 14:08:01'),
('82354fba2365f1d0b594eecc64', '{\"api_id\":\"7\"}', '2026-01-13 11:28:47'),
('85b9d5755fc17f97c4d3362cbb', '{\"api_id\":\"7\"}', '2026-01-11 10:35:13'),
('860ac5f1a251699ebc06ed266f', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-12 18:25:43'),
('86a37dc6af9afa7f4e337f3f75', '{\"api_id\":\"7\"}', '2026-01-03 13:43:27'),
('874203daa51969c6b4bbbd948e', '{\"api_id\":\"7\"}', '2026-01-19 21:46:42'),
('88c6a9e21e9bab09c3079ac414', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-09 16:36:07'),
('88d36aa183fec478d18c6264a7', '{\"api_id\":\"7\"}', '2026-01-12 18:22:17'),
('890994d69bbffbc22230b2c4c0', '{\"api_id\":\"7\"}', '2026-01-03 13:41:55'),
('8b4cb5704cea632816bf675fad', '{\"api_id\":\"7\"}', '2026-01-14 15:17:32'),
('8daaa46a624949caea5a8db134', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-11 09:39:53'),
('8e1c648788c3e13b37e3b30c03', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"payment_address\":{\"address_id\":\"142\",\"firstname\":\"\\u0412\\u0430\\u0441\\u0438\\u043b\\u0438\\u0439\",\"lastname\":\"\\u0417\\u0430\\u043b\\u0443\\u043f\\u0438\\u043d\",\"company\":\"\",\"address_1\":\"\\u0427\\u043a\\u0430\\u043b\\u043e\\u0432\\u0430\",\"address_2\":\"32\",\"postcode\":\"603002\",\"city\":\"\\u041c\\u043e\\u0441\\u043a\\u0432\\u0430\",\"zone_id\":\"2761\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u0432\\u0430\",\"zone_code\":\"MOW\",\"country_id\":\"176\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"iso_code_2\":\"RU\",\"iso_code_3\":\"RUS\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"custom_field\":null},\"shipping_address\":{\"address_id\":\"142\",\"firstname\":\"\\u0412\\u0430\\u0441\\u0438\\u043b\\u0438\\u0439\",\"lastname\":\"\\u0417\\u0430\\u043b\\u0443\\u043f\\u0438\\u043d\",\"company\":\"\",\"address_1\":\"\\u041c\\u0430\\u0433\\u0430\\u0437\\u0438\\u043d \\u043d\\u0430 \\u0420\\u0430\\u0431\\u043e\\u0447\\u0435\\u0439\",\"address_2\":\"\\u0433. \\u0421\\u0430\\u0440\\u0430\\u0442\\u043e\\u0432 \\u0443\\u043b. \\u0420\\u0430\\u0431\\u043e\\u0447\\u0430\\u044f 55\",\"postcode\":\"\",\"city\":\"\",\"zone_id\":\"2761\",\"zone\":\"\",\"zone_code\":\"MOW\",\"country_id\":\"176\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"iso_code_2\":\"RU\",\"iso_code_3\":\"RUS\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"custom_field\":null},\"payment_methods\":{\"cod\":{\"code\":\"cod\",\"title\":\"\\u041e\\u043f\\u043b\\u0430\\u0442\\u0430 \\u043f\\u0440\\u0438 \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0435\",\"terms\":\"\\u041d\\u0430\\u043b\\u0438\\u0447\\u043d\\u044b\\u043c\\u0438 \\u0438\\u043b\\u0438 \\u043a\\u0430\\u0440\\u0442\\u043e\\u0439\",\"sort_order\":\"1\"},\"bank_transfer\":{\"code\":\"bank_transfer\",\"title\":\"\\u041e\\u043f\\u043b\\u0430\\u0442\\u0430 \\u043e\\u043d\\u043b\\u0430\\u0439\\u043d\",\"terms\":\"\\u041a\\u0430\\u0440\\u0442\\u043e\\u0439 \\u0438\\u043b\\u0438 QR-\\u043a\\u043e\\u0434\\u043e\\u043c\",\"sort_order\":\"2\"}},\"shipping_methods\":{\"pickup\":{\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437\",\"quote\":{\"pickup\":{\"code\":\"pickup.pickup\",\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437 \\u0438\\u0437 \\u041f\\u0412\\u0417\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}},\"sort_order\":\"1\",\"error\":false},\"flat\":{\"title\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0434\\u043e \\u0434\\u0432\\u0435\\u0440\\u0438\",\"quote\":{\"flat\":{\"code\":\"flat.flat\",\"title\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0434\\u043e \\u0430\\u0434\\u0440\\u0435\\u0441\\u0430\",\"cost\":\"300\",\"tax_class_id\":\"0\",\"text\":\"300 \\u20bd\"}},\"sort_order\":\"3\",\"error\":false}},\"customer_id\":\"95\",\"guest\":{\"customer_group_id\":\"1\"},\"shipping_method\":{\"code\":\"pickup.pickup\",\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437 \\u0438\\u0437 \\u041f\\u0412\\u0417\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"},\"payment_method\":{\"code\":\"cod\",\"title\":\"\\u041e\\u043f\\u043b\\u0430\\u0442\\u0430 \\u043f\\u0440\\u0438 \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0435\",\"terms\":\"\\u041d\\u0430\\u043b\\u0438\\u0447\\u043d\\u044b\\u043c\\u0438 \\u0438\\u043b\\u0438 \\u043a\\u0430\\u0440\\u0442\\u043e\\u0439\",\"sort_order\":\"1\"},\"comment\":\"\",\"order_id\":162}', '2026-01-19 20:59:51'),
('8e45aa39675c4fa3541df5dafb', '{\"api_id\":\"7\"}', '2026-01-11 08:28:27'),
('9093f5b7989729061baff556c6', '{\"api_id\":\"7\"}', '2026-01-14 15:04:46'),
('911349b55cb719a737bd99d9f9', '{\"api_id\":\"7\"}', '2026-01-13 12:22:34'),
('93cbdde933aeca9e9d6f403dfe', '{\"api_id\":\"7\"}', '2026-01-13 15:25:29'),
('980d0bb2173768910ef13993eb', '{\"api_id\":\"7\"}', '2026-01-16 20:20:45'),
('996e3c10a0bf9f02f9d321ff99', '{\"api_id\":\"7\"}', '2026-01-13 12:22:28'),
('9a4235e290fdb4cff726b5a0f4', '{\"api_id\":\"7\"}', '2026-01-13 12:18:19'),
('9b0783f1b858296f2193641e01', '{\"api_id\":\"7\"}', '2026-01-11 10:18:35'),
('9e58d3bf5235082f359702325b', '{\"api_id\":\"7\"}', '2026-01-10 21:40:52'),
('9e6bfc8221ee62976059afd719', '{\"api_id\":\"7\"}', '2026-01-16 20:20:41'),
('9f1f76db967a3b98caadacea2b', '{\"api_id\":\"7\"}', '2026-01-13 12:11:29'),
('a1206be6e00e1c84a606e11270', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-13 12:09:47'),
('a17bddd044c3f3f4537d5d83a9', '{\"api_id\":\"7\"}', '2026-01-13 16:43:27'),
('a310200bbbde896ca93a74227d', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"Ia04A7vkUOQK1m90GhtRVFHfZzkH71et\",\"shipping_address\":{\"address_id\":0,\"country_id\":\"176\",\"zone_id\":\"2751\",\"firstname\":\"\",\"lastname\":\"\",\"company\":\"\",\"address_1\":\"\",\"address_2\":\"\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"postcode\":\"\",\"city\":\"\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"custom_field\":null},\"account\":\"guest\",\"payment_address\":{\"address_id\":0,\"country_id\":\"176\",\"zone_id\":\"2751\",\"firstname\":\"\\u0410\\u043d\\u0434\\u0440\\u0435\\u0439\",\"lastname\":\"\\u041c\\u0435\\u0440\\u0437\\u043b\\u0438\\u043a\\u0438\\u043d\",\"company\":\"\",\"address_1\":\"\\u0411\\u0430\\u0445\\u043c\\u0435\\u0442\\u044c\\u0435\\u0432\\u0441\\u043a\\u0430\\u044f\",\"address_2\":\"43\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"postcode\":\"603002\",\"city\":\"\\u041d\\u0438\\u0436\\u043d\\u0438\\u0439 \\u041d\\u043e\\u0432\\u043e\\u0433\\u043e\\u0440\\u043e\\u0434\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"custom_field\":null},\"billing_for_shipping\":false,\"last_order_id\":84,\"guest\":{\"customer_group_id\":\"1\",\"email\":\"tinkov@exopencart.ru\"},\"payment_methods\":{\"cod\":{\"code\":\"cod\",\"title\":\"\\u041e\\u043f\\u043b\\u0430\\u0442\\u0430 \\u043f\\u0440\\u0438 \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0435\",\"terms\":\"\",\"sort_order\":\"1\"},\"bank_transfer\":{\"code\":\"bank_transfer\",\"title\":\"\\u0411\\u0430\\u043d\\u043a\\u043e\\u0432\\u0441\\u043a\\u0438\\u0439 \\u043f\\u0435\\u0440\\u0435\\u0432\\u043e\\u0434\",\"terms\":\"\",\"sort_order\":\"2\"}},\"shipping_methods\":{\"pickup\":{\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437\",\"quote\":{\"pickup\":{\"code\":\"pickup.pickup\",\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437 \\u0438\\u0437 \\u041f\\u0412\\u0417\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}},\"sort_order\":\"1\",\"error\":false},\"free\":{\"title\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430\",\"quote\":{\"free\":{\"code\":\"free.free\",\"title\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}},\"sort_order\":\"2\",\"error\":false},\"flat\":{\"title\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0434\\u043e \\u0434\\u0432\\u0435\\u0440\\u0438\",\"quote\":{\"flat\":{\"code\":\"flat.flat\",\"title\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0434\\u043e \\u0430\\u0434\\u0440\\u0435\\u0441\\u0430\",\"cost\":\"300\",\"tax_class_id\":\"0\",\"text\":\"300 \\u20bd\"}},\"sort_order\":\"3\",\"error\":false}},\"shipping_method\":{\"code\":\"pickup.pickup\",\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437 \\u0438\\u0437 \\u041f\\u0412\\u0417\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}}', '2026-01-10 16:22:07'),
('a4193be78c2864bffb1754999b', '{\"api_id\":\"7\"}', '2026-01-09 16:36:08'),
('a6c4238befd0f8b6d5a27d21ae', '{\"api_id\":\"7\"}', '2026-01-03 10:53:55'),
('a799e0bea0ae9ab59385eada2b', '{\"api_id\":\"7\"}', '2026-01-19 21:14:00'),
('a7da9bff88cdd038b49d2ebd26', '{\"api_id\":\"7\"}', '2026-01-11 08:43:03'),
('aa4d56e75ea9a1162da802ca2d', '{\"api_id\":\"7\"}', '2026-01-11 10:35:31'),
('ab1ac52e7a6d2081703e7f9a7e', '{\"api_id\":\"7\"}', '2026-01-13 15:05:04'),
('ad41aec2be4a864f0eabfd93c0', '{\"api_id\":\"7\"}', '2026-01-12 15:37:34'),
('addfd3455432dc5f1d4eb4852f', '{\"api_id\":\"7\"}', '2026-01-11 08:28:29'),
('b1cd90dce441f789894e8a9aed', '{\"api_id\":\"7\"}', '2026-01-11 10:18:37'),
('b33fd382fc308f5b757c534a05', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-03 13:44:36'),
('b79cd1dd0006582fb8696341f0', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-18 17:05:19'),
('b860f2d3a4c667c5f314e32549', '{\"api_id\":\"7\"}', '2026-01-03 11:22:26'),
('b9450b49efc197e2896a3577aa', '{\"api_id\":\"7\"}', '2026-01-13 12:22:33'),
('ba438cda6da59d5443c1ace765', '{\"api_id\":\"7\"}', '2026-01-11 08:43:54'),
('bd7b6e6bb34a744ce0b5f50906', '{\"api_id\":\"7\"}', '2026-01-10 20:48:30'),
('bdca7beca06f0726cdbbfd2205', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-09 16:36:33'),
('bfbdeaa472da3e23625863d9aa', '{\"api_id\":\"7\"}', '2026-01-11 17:47:39'),
('c5cb5c2f746cbd0ad9d5e34a49', '{\"api_id\":\"7\"}', '2026-01-12 13:20:53'),
('c8301101c2d6a3a9cefe3bc2a0', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"D0m8NFHEkISCiKkGHlgQ356he1lZUqJr\",\"billing_for_shipping\":true,\"account\":\"register\",\"last_order_id\":83,\"guest\":{\"customer_group_id\":\"1\"}}', '2026-01-10 14:17:03'),
('c8830dfecacf7c4d350136632e', '{\"api_id\":\"7\"}', '2026-01-10 14:17:39'),
('cbc5326339e7e8811599d72ca0', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-11 08:41:08'),
('cc3dcdc4f549b465379d7b30f2', '{\"api_id\":\"7\"}', '2026-01-10 20:48:32'),
('ccd473c8e2d5698da20199f49a', '{\"api_id\":\"7\"}', '2026-01-03 11:17:12'),
('cdff3d7a983ac9a6a1883aa277', '{\"api_id\":\"7\"}', '2026-01-18 15:15:54'),
('cebad31f93ba6db7dba92af390', '{\"api_id\":\"7\"}', '2026-01-11 10:32:06'),
('d0cedb32b54bafb04d634e5c98', '{\"api_id\":\"7\"}', '2026-01-12 15:36:57'),
('d1a31119db0292a75ad7d8a9eb', '{\"api_id\":\"7\"}', '2026-01-13 16:45:49'),
('d2d77b0b0a63c1866e29c573e4', '{\"api_id\":\"7\"}', '2026-01-03 13:43:30'),
('d2f7fef660ee3d64ced9e87c55', '{\"api_id\":\"7\"}', '2026-01-11 10:52:02'),
('d347d313f0f0ed9f8e3c9fe150', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-11 10:35:31'),
('d3fe4dc8052f0b17821f154649', '{\"api_id\":\"7\"}', '2026-01-14 15:04:47'),
('d40e4fff92ff1b433663a984be', '{\"api_id\":\"7\"}', '2026-01-13 16:43:25'),
('d53d82ab299113139a352b8db2', '{\"api_id\":\"7\"}', '2026-01-11 08:41:09'),
('d645b489244c49a8a15dfecdfc', '{\"api_id\":\"7\"}', '2026-01-13 16:44:16'),
('d8efe64ef25d73eee011405b56', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-12 12:37:14'),
('dccec2398af29e65e1fdee147d', '{\"api_id\":\"7\"}', '2026-01-11 09:39:53'),
('dd2b88acab9407b3cc137a9913', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-03 10:19:07'),
('de40aa3665cbadb2bca56411c5', '{\"api_id\":\"7\"}', '2026-01-15 15:30:23'),
('df8da9ad36d8844f6f1f118889', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-11 08:43:14'),
('e01829a93df6854b9354579e81', '{\"api_id\":\"7\"}', '2026-01-11 17:18:37'),
('e08bb6211b5016113e220131ee', '{\"api_id\":\"7\"}', '2026-01-03 10:53:54'),
('e1ef277aebf7a03a6a4354252a', '{\"api_id\":\"7\"}', '2026-01-15 15:42:33'),
('e33f5d933497816c4bd545177c', '{\"api_id\":\"7\"}', '2026-01-18 17:05:19'),
('eb42903b655126e0d115b37e4c', '{\"api_id\":\"7\"}', '2026-01-03 11:25:44'),
('ebd0fa755807a1eed68e90b806', '{\"api_id\":\"7\"}', '2026-01-09 16:36:07'),
('ed8eb1b737686a3d0eb5e30786', '{\"api_id\":\"7\"}', '2026-01-12 12:37:14'),
('eec2d76ba525315dff678f5031', '{\"api_id\":\"7\",\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2026-01-15 20:54:55');
INSERT INTO `oc_session` (`session_id`, `data`, `expire`) VALUES
('f0b129e8a17e9952de49539e9d', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"account\":\"guest\",\"last_order_id\":152,\"compare\":[],\"user_id\":\"1\",\"user_token\":\"Z44NBO0JafWVmHkTZdgKttYXHQMb3TCU\",\"wishlist\":[],\"customer_id\":\"95\",\"shipping_address\":{\"address_id\":\"142\",\"firstname\":\"\\u0412\\u0430\\u0441\\u0438\\u043b\\u0438\\u0439\",\"lastname\":\"\\u0417\\u0430\\u043b\\u0443\\u043f\\u0438\\u043d\",\"company\":\"\",\"address_1\":\"\\u041c\\u0430\\u0433\\u0430\\u0437\\u0438\\u043d \\u043d\\u0430 \\u0420\\u0430\\u0431\\u043e\\u0447\\u0435\\u0439\",\"address_2\":\"\\u0433. \\u0421\\u0430\\u0440\\u0430\\u0442\\u043e\\u0432 \\u0443\\u043b. \\u0420\\u0430\\u0431\\u043e\\u0447\\u0430\\u044f 55\",\"postcode\":\"\",\"city\":\"\",\"zone_id\":\"2761\",\"zone\":\"\",\"zone_code\":\"MOW\",\"country_id\":\"176\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"iso_code_2\":\"RU\",\"iso_code_3\":\"RUS\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"custom_field\":null},\"payment_address\":{\"address_id\":\"142\",\"firstname\":\"\\u0412\\u0430\\u0441\\u0438\\u043b\\u0438\\u0439\",\"lastname\":\"\\u0417\\u0430\\u043b\\u0443\\u043f\\u0438\\u043d\",\"company\":\"\",\"address_1\":\"\\u0427\\u043a\\u0430\\u043b\\u043e\\u0432\\u0430\",\"address_2\":\"32\",\"postcode\":\"603002\",\"city\":\"\\u041c\\u043e\\u0441\\u043a\\u0432\\u0430\",\"zone_id\":\"2761\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u0432\\u0430\",\"zone_code\":\"MOW\",\"country_id\":\"176\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"iso_code_2\":\"RU\",\"iso_code_3\":\"RUS\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"custom_field\":null}}', '2026-01-19 20:08:39'),
('f2b62d597ffdf96473631b4cea', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"payment_address\":{\"address_id\":0,\"country_id\":\"176\",\"zone_id\":\"2751\",\"firstname\":\"\",\"lastname\":\"\",\"company\":\"\",\"address_1\":\"\",\"address_2\":\"\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"postcode\":\"\",\"city\":\"\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"custom_field\":null},\"shipping_address\":{\"address_id\":0,\"country_id\":\"176\",\"zone_id\":\"2751\",\"firstname\":\"\",\"lastname\":\"\",\"company\":\"\",\"address_1\":\"\",\"address_2\":\"\",\"address_format\":\"{postcode} {zone} {city} {address_1} {address_2}\",\"postcode\":\"\",\"city\":\"\",\"zone\":\"\\u041c\\u043e\\u0441\\u043a\\u043e\\u0432\\u0441\\u043a\\u0430\\u044f \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u044c\",\"zone_code\":\"\",\"country\":\"\\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u0430\\u044f \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u044f\",\"custom_field\":null},\"guest\":{\"customer_group_id\":\"1\"},\"payment_methods\":{\"cod\":{\"code\":\"cod\",\"title\":\"\\u041e\\u043f\\u043b\\u0430\\u0442\\u0430 \\u043f\\u0440\\u0438 \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0435\",\"terms\":\"\\u041d\\u0430\\u043b\\u0438\\u0447\\u043d\\u044b\\u043c\\u0438 \\u0438\\u043b\\u0438 \\u043a\\u0430\\u0440\\u0442\\u043e\\u0439\",\"sort_order\":\"1\"},\"bank_transfer\":{\"code\":\"bank_transfer\",\"title\":\"\\u041e\\u043f\\u043b\\u0430\\u0442\\u0430 \\u043e\\u043d\\u043b\\u0430\\u0439\\u043d\",\"terms\":\"\\u041a\\u0430\\u0440\\u0442\\u043e\\u0439 \\u0438\\u043b\\u0438 QR-\\u043a\\u043e\\u0434\\u043e\\u043c\",\"sort_order\":\"2\"}},\"shipping_methods\":{\"pickup\":{\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437\",\"quote\":{\"pickup\":{\"code\":\"pickup.pickup\",\"title\":\"\\u0421\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437 \\u0438\\u0437 \\u041f\\u0412\\u0417\",\"cost\":0,\"tax_class_id\":0,\"text\":\"0 \\u20bd\"}},\"sort_order\":\"1\",\"error\":false},\"flat\":{\"title\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0434\\u043e \\u0434\\u0432\\u0435\\u0440\\u0438\",\"quote\":{\"flat\":{\"code\":\"flat.flat\",\"title\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0434\\u043e \\u0430\\u0434\\u0440\\u0435\\u0441\\u0430\",\"cost\":\"300\",\"tax_class_id\":\"0\",\"text\":\"300 \\u20bd\"}},\"sort_order\":\"3\",\"error\":false}}}', '2026-01-19 20:11:07'),
('f31bce53522179c12e323afaa4', '{\"api_id\":\"7\"}', '2026-01-02 09:13:06'),
('f792d3527ce2fc4c11e2f99afd', '{\"api_id\":\"7\"}', '2026-01-12 15:34:56'),
('f871f6741fd0ea4541c89abe8d', '{\"api_id\":\"7\"}', '2026-01-13 12:22:26'),
('fb681a2e84a9b559a6d9a5afea', '{\"api_id\":\"7\"}', '2026-01-11 10:19:40'),
('fdb73367942ce46da3ae08a0ef', '{\"api_id\":\"7\"}', '2026-01-09 16:37:05');

-- --------------------------------------------------------

--
-- Table structure for table `oc_setting`
--

CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(8130, 0, 'csvprice_pro', 'csvprice_pro_csv_import_mod', '2', 0),
(16996, 0, 'configblog', 'configblog_image_related_height', '300', 0),
(16995, 0, 'configblog', 'configblog_image_related_width', '450', 0),
(16994, 0, 'configblog', 'configblog_image_article_height', '300', 0),
(16993, 0, 'configblog', 'configblog_image_article_width', '450', 0),
(16992, 0, 'configblog', 'configblog_image_category_height', '50', 0),
(16990, 0, 'configblog', 'configblog_review_mail', '1', 0),
(10423, 0, 'currency_cbr', 'currency_cbr_status', '1', 0),
(16991, 0, 'configblog', 'configblog_image_category_width', '50', 0),
(16043, 0, 'module_privacy', 'module_privacy_status', '1', 0),
(16989, 0, 'configblog', 'configblog_review_guest', '1', 0),
(16988, 0, 'configblog', 'configblog_review_status', '1', 0),
(16987, 0, 'configblog', 'configblog_article_download', '1', 0),
(16986, 0, 'configblog', 'configblog_limit_admin', '20', 0),
(16985, 0, 'configblog', 'configblog_article_description_length', '200', 0),
(35513, 0, 'payment_bank_transfer', 'payment_bank_transfer_order_status_id', '2', 0),
(35514, 0, 'payment_bank_transfer', 'payment_bank_transfer_geo_zone_id', '0', 0),
(2178, 0, 'payment_cod', 'payment_cod_sort_order', '1', 0),
(2177, 0, 'payment_cod', 'payment_cod_status', '1', 0),
(2176, 0, 'payment_cod', 'payment_cod_geo_zone_id', '0', 0),
(2175, 0, 'payment_cod', 'payment_cod_order_status_id', '1', 0),
(2174, 0, 'payment_cod', 'payment_cod_total', '0.01', 0),
(4770, 0, 'shipping_flat', 'shipping_flat_sort_order', '3', 0),
(4769, 0, 'shipping_flat', 'shipping_flat_status', '1', 0),
(4768, 0, 'shipping_flat', 'shipping_flat_geo_zone_id', '0', 0),
(4767, 0, 'shipping_flat', 'shipping_flat_tax_class_id', '0', 0),
(4766, 0, 'shipping_flat', 'shipping_flat_cost', '300', 0),
(1396, 0, 'total_shipping', 'total_shipping_sort_order', '3', 0),
(110, 0, 'total_sub_total', 'total_sub_total_sort_order', '1', 0),
(111, 0, 'total_sub_total', 'total_sub_total_status', '1', 0),
(112, 0, 'total_tax', 'total_tax_status', '1', 0),
(113, 0, 'total_total', 'total_total_sort_order', '9', 0),
(114, 0, 'total_total', 'total_total_status', '1', 0),
(115, 0, 'total_tax', 'total_tax_sort_order', '5', 0),
(116, 0, 'total_credit', 'total_credit_sort_order', '7', 0),
(117, 0, 'total_credit', 'total_credit_status', '1', 0),
(1402, 0, 'total_reward', 'total_reward_sort_order', '4', 0),
(1401, 0, 'total_reward', 'total_reward_status', '1', 0),
(1395, 0, 'total_shipping', 'total_shipping_status', '1', 0),
(1394, 0, 'total_shipping', 'total_shipping_estimator', '0', 0),
(122, 0, 'total_coupon', 'total_coupon_sort_order', '4', 0),
(123, 0, 'total_coupon', 'total_coupon_status', '1', 0),
(124, 0, 'total_voucher', 'total_voucher_sort_order', '8', 0),
(125, 0, 'total_voucher', 'total_voucher_status', '1', 0),
(126, 0, 'module_category', 'module_category_status', '1', 0),
(13845, 0, 'module_account', 'module_account_status', '1', 0),
(35943, 0, 'config', 'config_noindex_disallow_params', 'page', 0),
(35942, 0, 'config', 'config_noindex_status', '1', 0),
(35941, 0, 'config', 'config_add_prevnext', '0', 0),
(35940, 0, 'config', 'config_canonical_self', '1', 0),
(35542, 0, 'theme_default', 'theme_default_image_location_height', '480', 0),
(35541, 0, 'theme_default', 'theme_default_image_location_width', '480', 0),
(35540, 0, 'theme_default', 'theme_default_image_cart_height', '120', 0),
(35539, 0, 'theme_default', 'theme_default_image_cart_width', '120', 0),
(35538, 0, 'theme_default', 'theme_default_image_wishlist_height', '360', 0),
(35532, 0, 'theme_default', 'theme_default_image_additional_height', '74', 0),
(35533, 0, 'theme_default', 'theme_default_image_related_width', '480', 0),
(35534, 0, 'theme_default', 'theme_default_image_related_height', '360', 0),
(35535, 0, 'theme_default', 'theme_default_image_compare_width', '200', 0),
(35536, 0, 'theme_default', 'theme_default_image_compare_height', '200', 0),
(35537, 0, 'theme_default', 'theme_default_image_wishlist_width', '480', 0),
(9657, 0, 'dashboard_activity', 'dashboard_activity_sort_order', '7', 0),
(9656, 0, 'dashboard_activity', 'dashboard_activity_status', '1', 0),
(156, 0, 'dashboard_sale', 'dashboard_sale_status', '1', 0),
(157, 0, 'dashboard_sale', 'dashboard_sale_width', '3', 0),
(21254, 0, 'dashboard_chart', 'dashboard_chart_status', '1', 0),
(160, 0, 'dashboard_customer', 'dashboard_customer_status', '1', 0),
(161, 0, 'dashboard_customer', 'dashboard_customer_width', '3', 0),
(9651, 0, 'dashboard_map', 'dashboard_map_sort_order', '5', 0),
(9650, 0, 'dashboard_map', 'dashboard_map_status', '0', 0),
(164, 0, 'dashboard_online', 'dashboard_online_status', '1', 0),
(165, 0, 'dashboard_online', 'dashboard_online_width', '3', 0),
(166, 0, 'dashboard_order', 'dashboard_order_sort_order', '1', 0),
(167, 0, 'dashboard_order', 'dashboard_order_status', '1', 0),
(168, 0, 'dashboard_order', 'dashboard_order_width', '3', 0),
(169, 0, 'dashboard_sale', 'dashboard_sale_sort_order', '2', 0),
(170, 0, 'dashboard_customer', 'dashboard_customer_sort_order', '3', 0),
(171, 0, 'dashboard_online', 'dashboard_online_sort_order', '4', 0),
(9649, 0, 'dashboard_map', 'dashboard_map_width', '6', 0),
(21253, 0, 'dashboard_chart', 'dashboard_chart_width', '6', 0),
(9654, 0, 'dashboard_recent', 'dashboard_recent_sort_order', '5', 0),
(9653, 0, 'dashboard_recent', 'dashboard_recent_status', '1', 0),
(9655, 0, 'dashboard_activity', 'dashboard_activity_width', '6', 0),
(9652, 0, 'dashboard_recent', 'dashboard_recent_width', '6', 0),
(178, 0, 'report_customer_activity', 'report_customer_activity_status', '1', 0),
(179, 0, 'report_customer_activity', 'report_customer_activity_sort_order', '1', 0),
(180, 0, 'report_customer_order', 'report_customer_order_status', '1', 0),
(181, 0, 'report_customer_order', 'report_customer_order_sort_order', '2', 0),
(182, 0, 'report_customer_reward', 'report_customer_reward_status', '1', 0),
(183, 0, 'report_customer_reward', 'report_customer_reward_sort_order', '3', 0),
(184, 0, 'report_customer_search', 'report_customer_search_sort_order', '3', 0),
(185, 0, 'report_customer_search', 'report_customer_search_status', '1', 0),
(186, 0, 'report_customer_transaction', 'report_customer_transaction_status', '1', 0),
(187, 0, 'report_customer_transaction', 'report_customer_transaction_status_sort_order', '4', 0),
(188, 0, 'report_sale_tax', 'report_sale_tax_status', '1', 0),
(189, 0, 'report_sale_tax', 'report_sale_tax_sort_order', '5', 0),
(190, 0, 'report_sale_shipping', 'report_sale_shipping_status', '1', 0),
(191, 0, 'report_sale_shipping', 'report_sale_shipping_sort_order', '6', 0),
(192, 0, 'report_sale_return', 'report_sale_return_status', '1', 0),
(193, 0, 'report_sale_return', 'report_sale_return_sort_order', '7', 0),
(194, 0, 'report_sale_order', 'report_sale_order_status', '1', 0),
(195, 0, 'report_sale_order', 'report_sale_order_sort_order', '8', 0),
(196, 0, 'report_sale_coupon', 'report_sale_coupon_status', '1', 0),
(197, 0, 'report_sale_coupon', 'report_sale_coupon_sort_order', '9', 0),
(198, 0, 'report_product_viewed', 'report_product_viewed_status', '1', 0),
(199, 0, 'report_product_viewed', 'report_product_viewed_sort_order', '10', 0),
(200, 0, 'report_product_purchased', 'report_product_purchased_status', '1', 0),
(201, 0, 'report_product_purchased', 'report_product_purchased_sort_order', '11', 0),
(202, 0, 'report_marketing', 'report_marketing_status', '1', 0),
(203, 0, 'report_marketing', 'report_marketing_sort_order', '12', 0),
(16980, 0, 'configblog', 'configblog_meta_title', '{\"1\":\"\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a \\u0434\\u043b\\u044f \\u043b\\u0443\\u0447\\u0448\\u0435\\u0433\\u043e \\u0431\\u043b\\u043e\\u0433\\u0430\",\"2\":\"The best blog title\"}', 1),
(16981, 0, 'configblog', 'configblog_meta_description', '{\"1\":\"\\u041c\\u0435\\u0442\\u0430 \\u043e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 \\u043b\\u0443\\u0447\\u0448\\u0435\\u0433\\u043e \\u0431\\u043b\\u043e\\u0433\\u0430\",\"2\":\"The best blog meta description\"}', 1),
(10426, 0, 'currency_nbu', 'currency_nbu_status', '1', 0),
(10428, 0, 'currency_ecb', 'currency_ecb_status', '1', 0),
(231, 0, 'module_blog_category', 'module_blog_category_status', '1', 0),
(232, 0, 'domovoy', 'domovoy_folders_logs', '{\"size\":368743,\"unit\":{\"size\":360.1000000000000227373675443232059478759765625,\"unit\":\"\\u041a\\u0431\\u0430\\u0439\\u0442\"},\"files\":5,\"date\":\"2022-12-16 13:06:53\"}', 1),
(35531, 0, 'theme_default', 'theme_default_image_additional_width', '74', 0),
(35530, 0, 'theme_default', 'theme_default_image_product_height', '360', 0),
(35529, 0, 'theme_default', 'theme_default_image_product_width', '480', 0),
(35528, 0, 'theme_default', 'theme_default_image_popup_height', '1000', 0),
(35527, 0, 'theme_default', 'theme_default_image_popup_width', '1000', 0),
(21255, 0, 'dashboard_chart', 'dashboard_chart_sort_order', '6', 0),
(35939, 0, 'config', 'config_canonical_method', '1', 0),
(35516, 0, 'payment_bank_transfer', 'payment_bank_transfer_sort_order', '2', 0),
(35937, 0, 'config', 'config_valide_param_flag', '0', 0),
(35938, 0, 'config', 'config_valide_params', 'block\r\nfrommarket\r\ngclid\r\nfbclid\r\nkeyword\r\nlist_type\r\nopenstat\r\nopenstat_service\r\nopenstat_campaign\r\nopenstat_ad\r\nopenstat_source\r\nposition\r\nsource\r\ntracking\r\ntype\r\nyclid\r\nymclid\r\nuri\r\nurltype\r\nutm_source\r\nutm_medium\r\nutm_campaign\r\nutm_term\r\nutm_content', 0),
(33317, 0, 'developer', 'developer_webp', '0', 0),
(35515, 0, 'payment_bank_transfer', 'payment_bank_transfer_status', '1', 0),
(35936, 0, 'config', 'config_page_postfix', '', 0),
(35935, 0, 'config', 'config_seopro_lowercase', '1', 0),
(35934, 0, 'config', 'config_seopro_addslash', '0', 0),
(33316, 0, 'developer', 'developer_js', '0', 0),
(35526, 0, 'theme_default', 'theme_default_image_thumb_height', '720', 0),
(35524, 0, 'theme_default', 'theme_default_image_manufacturer_height', '80', 0),
(35525, 0, 'theme_default', 'theme_default_image_thumb_width', '720', 0),
(1635, 0, 'shipping_pickup', 'shipping_pickup_geo_zone_id', '0', 0),
(1636, 0, 'shipping_pickup', 'shipping_pickup_status', '1', 0),
(1637, 0, 'shipping_pickup', 'shipping_pickup_sort_order', '1', 0),
(35933, 0, 'config', 'config_seo_url_cache', '0', 0),
(35521, 0, 'theme_default', 'theme_default_image_category_width', '80', 0),
(35512, 0, 'payment_bank_transfer', 'payment_bank_transfer_total', '0', 0),
(35511, 0, 'payment_bank_transfer', 'payment_bank_transfer_bank2', 'Invoice will be send you after our manager approve your order', 0),
(35510, 0, 'payment_bank_transfer', 'payment_bank_transfer_bank1', 'После подтверждения заказа менеджер выставит вам счет на оплату', 0),
(16984, 0, 'configblog', 'configblog_article_limit', '20', 0),
(16982, 0, 'configblog', 'configblog_meta_keyword', '{\"1\":\"\\u0440\\u0443\\u0441\\u0441\\u043a\\u0438\\u0439, \\u0431\\u043b\\u043e\\u0433\",\"2\":\"english, blog\"}', 1),
(16983, 0, 'configblog', 'configblog_article_count', '1', 0),
(8135, 0, 'csvprice_pro', 'csvprice_pro_product_log', '0', 0),
(8134, 0, 'csvprice_pro', 'csvprice_pro_work_directory', '/home/s/soevvl/ex.bidzz.ru/storage/csvprice_pro/', 0),
(8133, 0, 'csvprice_pro', 'csvprice_pro_save_image_table', '1', 0),
(8132, 0, 'csvprice_pro', 'csvprice_pro_image_download_mod', '1', 0),
(8131, 0, 'csvprice_pro', 'csvprice_pro_each_iteration_timeout', '180', 0),
(35932, 0, 'config', 'config_seo_url_include_path', '1', 0),
(35931, 0, 'config', 'config_seo_pro', '1', 0),
(35928, 0, 'config', 'config_error_display', '1', 0),
(35929, 0, 'config', 'config_error_log', '1', 0),
(35930, 0, 'config', 'config_error_filename', 'error.log', 0),
(35925, 0, 'config', 'config_file_max_size', '10000000', 0),
(35926, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(35927, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(9460, 0, 'module_filter', 'module_filter_status', '1', 0),
(16979, 0, 'configblog', 'configblog_html_h1', '{\"1\":\"\\u041b\\u0443\\u0447\\u0448\\u0438\\u0439 \\u0431\\u043b\\u043e\\u0433\",\"2\":\"The best blog\"}', 1),
(16978, 0, 'configblog', 'configblog_name', '{\"1\":\"\\u0411\\u043b\\u043e\\u0433\",\"2\":\"Blog\"}', 1),
(9740, 0, 'fraudlabspro', 'fraud_fraudlabspro_review_status_id', '18', 0),
(9741, 0, 'fraudlabspro', 'fraud_fraudlabspro_approve_status_id', '2', 0),
(9742, 0, 'fraudlabspro', 'fraud_fraudlabspro_reject_status_id', '8', 0),
(9795, 0, 'module_information', 'module_information_status', '1', 0),
(21259, 0, 'module_store', 'module_store_status', '0', 0),
(21258, 0, 'module_store', 'module_store_admin', '0', 0),
(9739, 0, 'fraudlabspro', 'fraud_fraudlabspro_order_status_id', '17', 0),
(9738, 0, 'fraudlabspro', 'fraud_fraudlabspro_score', '80', 0),
(9737, 0, 'feed_google_base', 'feed_google_base_status', '0', 0),
(29451, 0, 'menu_default', 'menu_default_status', '1', 0),
(29452, 0, 'menu_default', 'menu_default_settings', '{\"cache\":\"0\",\"show_catalog\":\"1\",\"button\":{\"1\":\"\",\"2\":\"\"},\"show_images\":\"0\",\"width\":\"60\",\"height\":\"60\",\"show_special\":\"1\",\"show_brands\":\"1\",\"show_blog\":\"1\",\"show_contacts\":\"1\"}', 1),
(35923, 0, 'config', 'config_shared', '0', 0),
(35924, 0, 'config', 'config_encryption', '2yXC9VurV2t0qgoXHOWZDM6AZErXCq94wjU1Df280pqRhZEmhpohqSDGvOtQHEJ3uTpupevta8cAbCQdVhSfDnwQ346kCLZcaH4dUX2pdrZeXAoAHgYoCXOQOrgu9Vmo8UqlP9uzZGjetnDIvFesua3nsMQroYmmCcqOH303F7ScG1LGnYdmPrAIvQUJHISvzOD5qURkbHTYC2wEScJuzcz8IqYowrzozC06XluggpxURnbTrUZD39OsBsfpbeEuXyp8N5sjt9vehDji6HOgNTW5m8JhBKV5KlOFQkIHWEvU6PoOpW9cA9TdNvxV5rNUECFdN3uRsbdAtq0Q1Y57vYk12sGYFxXOM99Uc6CAwtIfESKcAeWRND8dIblWhI0EGJ7epqxkmvnmc1Pc1cR6eQFsYqcEDh9bvhmi3Pp8gjHL7HYQFZgz8oia0g3EfwlJaxSHvtwsYbDsImUCRR3Jw5uD5VfWmkdE1FCNhtEB1lwfDG0Huz82Woyyj1DfYWupqCA1YuqRD42Oqrk23kQ3NdFkRs1choHGnpLfdF9WQqtLJ16wWtjV8vDVU9yk9F9emHcc8pSjPwInDti8GpM6sNxxn8tqQQx9Y1cptX1ycqEMXzVg5uEY8Wufb9WYW4SnPyi23ziTHbN0sfZqSCZydv01uzou8pOWF8cRTHPzHhuVb8Rykhjjmeru833AJJDgZQYdF0W6R186wA8tYGUChQSf07YtAIGNK16xE7taK8jQcL08pn98sYJED566xPRuaIT71eGAJesE1oTrzma9xbRu6nGfQKkYf0NPUcnxONXXhq9U8gEUT9UIKcttkJm8bq1PHUYIkadi4B8MJ6UCigQ7WZJ2jfQTjIEtLYrK9f9hcOFpZT6iOapB0X5Wv5PAL3hswjfHt3d5egWgxrFj7tY3HuWsOL1iTPrA7eiCxpVvG92M6t9gJG7SyRxtizmENdOi0Xo3A9YVKz9r2WZYYEwkOJFgWsZRCYgNVgPXHZXSCQoU9HgOuXgk9LjmvYzF', 0),
(35922, 0, 'config', 'config_password', '1', 0),
(35921, 0, 'config', 'config_secure', '1', 0),
(35523, 0, 'theme_default', 'theme_default_image_manufacturer_width', '80', 0),
(35522, 0, 'theme_default', 'theme_default_image_category_height', '80', 0),
(35520, 0, 'theme_default', 'theme_default_product_description_length', '160', 0),
(35519, 0, 'theme_default', 'theme_default_product_limit', '12', 0),
(35518, 0, 'theme_default', 'theme_default_status', '1', 0),
(16041, 0, 'module_privacy', 'module_privacy_content', '{\"1\":{\"button\":\"\\u0417\\u0430\\u043c\\u0435\\u0447\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\",\"text\":\"\\u041f\\u0440\\u043e\\u0434\\u043e\\u043b\\u0436\\u0430\\u044f \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u044d\\u0442\\u043e\\u0433\\u043e \\u0441\\u0430\\u0439\\u0442\\u0430 \\u0432\\u044b \\u043f\\u043e\\u0434\\u0442\\u0432\\u0435\\u0440\\u0436\\u0434\\u0430\\u0435\\u0442\\u0435, \\u0447\\u0442\\u043e \\u043e\\u0437\\u043d\\u0430\\u043a\\u043e\\u043c\\u0438\\u043b\\u0438\\u0441\\u044c \\u0438 \\u043f\\u0440\\u0438\\u043d\\u0438\\u043c\\u0430\\u0435\\u0442\\u0435 \\u0443\\u0441\\u043b\\u043e\\u0432\\u0438\\u044f \\u0441\\u0442\\u0430\\u0442\\u044c\\u0438\"},\"2\":{\"button\":\"I agree\",\"text\":\"By continuing to use this site you confirm that you have read and accept the terms of the article\"}}', 1),
(16042, 0, 'module_privacy', 'module_privacy_information', '9', 0),
(35517, 0, 'theme_default', 'theme_default_directory', 'default', 0),
(35544, 0, 'module_extheme', 'module_extheme_changed', '1', 0),
(35543, 0, 'module_extheme', 'module_extheme_directory', 'default', 0),
(35920, 0, 'config', 'config_cache_warmer_key', '', 0),
(35919, 0, 'config', 'config_cache_warmer', '0', 0),
(35916, 0, 'config', 'config_cache_product', '0', 0),
(35913, 0, 'config', 'config_seo_url', '1', 0),
(35914, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(35918, 0, 'config', 'config_cache_product_option', '0', 0),
(35917, 0, 'config', 'config_cache_product_attribute', '0', 0),
(35915, 0, 'config', 'config_compression', '9', 0),
(35912, 0, 'config', 'config_maintenance', '0', 0),
(35911, 0, 'config', 'config_mail_alert_email', '', 0),
(35910, 0, 'config', 'config_mail_alert', '[\"order\"]', 1),
(35909, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(35908, 0, 'config', 'config_mail_smtp_port', '25', 0),
(35907, 0, 'config', 'config_mail_smtp_password', '', 0),
(35906, 0, 'config', 'config_mail_smtp_username', '', 0),
(35905, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(35904, 0, 'config', 'config_mail_parameter', '', 0),
(35903, 0, 'config', 'config_mail_engine', 'mail', 0),
(35902, 0, 'config', 'config_product_popup_image_mode', 'scale', 0),
(35901, 0, 'config', 'config_product_thumb_image_mode', 'default', 0),
(35900, 0, 'config', 'config_product_list_image_mode', 'default', 0),
(35899, 0, 'config', 'config_category_image_mode', 'default', 0),
(35898, 0, 'config', 'config_icon', 'catalog/favicon.png', 0),
(35897, 0, 'config', 'config_logo_height', '35', 0),
(35896, 0, 'config', 'config_logo_width', '175', 0),
(35895, 0, 'config', 'config_logo', 'catalog/logo.png', 0),
(35894, 0, 'config', 'config_captcha_page', '[\"register\",\"guest\",\"review\",\"return\",\"contact\"]', 1),
(35893, 0, 'config', 'config_captcha', '', 0),
(35892, 0, 'config', 'config_return_status_id', '1', 0),
(35891, 0, 'config', 'config_return_id', '9', 0),
(35890, 0, 'config', 'config_affiliate_id', '10', 0),
(35889, 0, 'config', 'config_affiliate_commission', '5', 0),
(35888, 0, 'config', 'config_affiliate_auto', '0', 0),
(35887, 0, 'config', 'config_affiliate_approval', '0', 0),
(35886, 0, 'config', 'config_affiliate_group_id', '1', 0),
(35885, 0, 'config', 'config_stock_checkout', '0', 0),
(35884, 0, 'config', 'config_stock_warning', '1', 0),
(35883, 0, 'config', 'config_stock_display', '0', 0),
(35882, 0, 'config', 'config_api_id', '7', 0),
(35881, 0, 'config', 'config_fraud_status_id', '16', 0),
(35878, 0, 'config', 'config_order_status_id', '1', 0),
(35879, 0, 'config', 'config_processing_status', '[\"2\",\"3\",\"1\",\"12\",\"5\"]', 1),
(35880, 0, 'config', 'config_complete_status', '[\"3\",\"15\",\"5\"]', 1),
(35877, 0, 'config', 'config_checkout_id', '9', 0),
(33315, 0, 'developer', 'developer_css', '0', 0),
(33314, 0, 'developer', 'developer_sass', '0', 0),
(33313, 0, 'developer', 'developer_theme', '0', 0),
(35876, 0, 'config', 'config_checkout_guest', '0', 0),
(35875, 0, 'config', 'config_cart_weight', '1', 0),
(35874, 0, 'config', 'config_ask_payment_address', '1', 0),
(35873, 0, 'config', 'config_invoice_prefix', 'INV-2025-00flex-start', 0),
(35872, 0, 'config', 'config_account_id', '9', 0),
(35871, 0, 'config', 'config_login_attempts', '5', 0),
(35870, 0, 'config', 'config_customer_price', '0', 0),
(35869, 0, 'config', 'config_customer_group_display', '[\"1\"]', 1),
(35868, 0, 'config', 'config_customer_group_id', '1', 0),
(35867, 0, 'config', 'config_customer_search', '0', 0),
(35866, 0, 'config', 'config_customer_activity', '0', 0),
(35865, 0, 'config', 'config_customer_online', '0', 0),
(35864, 0, 'config', 'config_tax_customer', 'shipping', 0),
(35863, 0, 'config', 'config_tax_default', 'shipping', 0),
(35862, 0, 'config', 'config_tax', '0', 0),
(35861, 0, 'config', 'config_voucher_max', '1000', 0),
(35860, 0, 'config', 'config_voucher_min', '1', 0),
(35859, 0, 'config', 'config_review_images_limit', '5', 0),
(35858, 0, 'config', 'config_review_images', '0', 0),
(35857, 0, 'config', 'config_review_guest', '1', 0),
(35856, 0, 'config', 'config_review_status', '1', 0),
(35855, 0, 'config', 'config_show_options_price', '1', 0),
(35854, 0, 'config', 'config_out_of_stock_to_end', '0', 0),
(35853, 0, 'config', 'config_special_sort_order', 'ASC', 0),
(35852, 0, 'config', 'config_special_sort_param', 'p.sort_order', 0),
(35851, 0, 'config', 'config_search_sort_order', 'ASC', 0),
(35850, 0, 'config', 'config_search_sort_param', 'p.sort_order', 0),
(35849, 0, 'config', 'config_manufacturer_sort_order', 'ASC', 0),
(35848, 0, 'config', 'config_manufacturer_sort_param', 'p.sort_order', 0),
(35847, 0, 'config', 'config_category_sort_order', 'ASC', 0),
(35846, 0, 'config', 'config_category_sort_param', 'p.sort_order', 0),
(35845, 0, 'config', 'config_limit_autocomplete', '5', 0),
(35844, 0, 'config', 'config_limit_admin', '50', 0),
(35843, 0, 'config', 'config_product_count', '0', 0),
(35842, 0, 'config', 'config_weight_class_id', '1', 0),
(35841, 0, 'config', 'config_length_class_id', '1', 0),
(35840, 0, 'config', 'config_currency_engine', 'cbr', 0),
(35839, 0, 'config', 'config_currency_auto', '1', 0),
(35838, 0, 'config', 'config_currency', 'RUB', 0),
(35837, 0, 'config', 'config_admin_language', 'ru-ru', 0),
(35836, 0, 'config', 'config_language', 'ru-ru', 0),
(35835, 0, 'config', 'config_timezone', 'Europe/Moscow', 0),
(35834, 0, 'config', 'config_city', 'Москва', 0),
(35833, 0, 'config', 'config_zone_id', '2751', 0),
(35832, 0, 'config', 'config_country_id', '176', 0),
(35831, 0, 'config', 'config_location', '[\"1\",\"2\"]', 1),
(35830, 0, 'config', 'config_comment', '', 0),
(35829, 0, 'config', 'config_open', '10:00 - 18:00', 0),
(35828, 0, 'config', 'config_image', '', 0),
(35827, 0, 'config', 'config_social_media', '[{\"name\":\"whatsapp\",\"url\":\"https:\\/\\/wa.me\\/79994206969\",\"icon\":\"&lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; width=&quot;100&quot; height=&quot;100&quot; fill=&quot;currentColor&quot; viewBox=&quot;0 0 16 16&quot;&gt;   &lt;path d=&quot;M13.601 2.326A7.85 7.85 0 0 0 7.994 0C3.627 0 .068 3.558.064 7.926c0 1.399.366 2.76 1.057 3.965L0 16l4.204-1.102a7.9 7.9 0 0 0 3.79.965h.004c4.368 0 7.926-3.558 7.93-7.93A7.9 7.9 0 0 0 13.6 2.326zM7.994 14.521a6.6 6.6 0 0 1-3.356-.92l-.24-.144-2.494.654.666-2.433-.156-.251a6.56 6.56 0 0 1-1.007-3.505c0-3.626 2.957-6.584 6.591-6.584a6.56 6.56 0 0 1 4.66 1.931 6.56 6.56 0 0 1 1.928 4.66c-.004 3.639-2.961 6.592-6.592 6.592m3.615-4.934c-.197-.099-1.17-.578-1.353-.646-.182-.065-.315-.099-.445.099-.133.197-.513.646-.627.775-.114.133-.232.148-.43.05-.197-.1-.836-.308-1.592-.985-.59-.525-.985-1.175-1.103-1.372-.114-.198-.011-.304.088-.403.087-.088.197-.232.296-.346.1-.114.133-.198.198-.33.065-.134.034-.248-.015-.347-.05-.099-.445-1.076-.612-1.47-.16-.389-.323-.335-.445-.34-.114-.007-.247-.007-.38-.007a.73.73 0 0 0-.529.247c-.182.198-.691.677-.691 1.654s.71 1.916.81 2.049c.098.133 1.394 2.132 3.383 2.992.47.205.84.326 1.129.418.475.152.904.129 1.246.08.38-.058 1.171-.48 1.338-.943.164-.464.164-.86.114-.943-.049-.084-.182-.133-.38-.232&quot;&gt;&lt;\\/path&gt; &lt;\\/svg&gt;\",\"contact\":\"1\",\"header\":\"1\"},{\"name\":\"telegram\",\"url\":\"https:\\/\\/t.me\\/exopencart\",\"icon\":\"&lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; width=&quot;100&quot; height=&quot;100&quot; fill=&quot;currentColor&quot; viewBox=&quot;0 0 16 16&quot;&gt;   &lt;path d=&quot;M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.287 5.906c-.778.324-2.334.994-4.666 2.01-.378.15-.577.298-.595.442-.03.243.275.339.69.47l.175.055c.408.133.958.288 1.243.294.26.006.549-.1.868-.32 2.179-1.471 3.304-2.214 3.374-2.23.05-.012.12-.026.166.016.047.041.042.12.037.141-.03.129-1.227 1.241-1.846 1.817-.193.18-.33.307-.358.336a8.154 8.154 0 0 1-.188.186c-.38.366-.664.64.015 1.088.327.216.589.393.85.571.284.194.568.387.936.629.093.06.183.125.27.187.331.236.63.448.997.414.214-.02.435-.22.547-.82.265-1.417.786-4.486.906-5.751a1.426 1.426 0 0 0-.013-.315.337.337 0 0 0-.114-.217.526.526 0 0 0-.31-.093c-.3.005-.763.166-2.984 1.09z&quot;\\/&gt; &lt;\\/svg&gt;\",\"contact\":\"1\",\"header\":\"1\"},{\"name\":\"xcom\",\"url\":\"https:\\/\\/x.com\\/exopencart\",\"icon\":\"&lt;svg xmlns=&quot;http:\\/\\/www.w3.org\\/2000\\/svg&quot; width=&quot;100&quot; height=&quot;100&quot; fill=&quot;currentColor&quot; viewBox=&quot;0 0 16 16&quot;&gt;   &lt;path d=&quot;M12.6.75h2.454l-5.36 6.142L16 15.25h-4.937l-3.867-5.07-4.425 5.07H.316l5.733-6.57L0 .75h5.063l3.495 4.633L12.601.75Zm-.86 13.028h1.36L4.323 2.145H2.865z&quot;\\/&gt; &lt;\\/svg&gt;\",\"contact\":\"1\",\"header\":\"1\"}]', 1),
(35826, 0, 'config', 'config_fax', '+7 495 420 69 69', 0),
(35825, 0, 'config', 'config_telephone', '+7 999 420 69 69', 0),
(35820, 0, 'config', 'config_name', 'exopencart', 0),
(35821, 0, 'config', 'config_owner', 'Название организации', 0),
(35822, 0, 'config', 'config_address', 'Здесь адрес, ул. дом, что-то еще', 0),
(35823, 0, 'config', 'config_geocode', 'https://yandex.ru/map-widget/v1/?um=constructor%3Acf0da8fa05f10eb5764f1e0487b4b2a963a2a02ad1c06290acc58a05f78e5230&amp;amp;source=constructor', 0),
(35824, 0, 'config', 'config_email', 'info@exopencart.ru', 0),
(35819, 0, 'config', 'config_layout_id', '4', 0),
(35818, 0, 'config', 'config_toggle_mode', '1', 0),
(35817, 0, 'config', 'config_default_mode', 'light', 0),
(35816, 0, 'config', 'config_theme', 'default', 0),
(35814, 0, 'config', 'config_meta_description', 'Бесплатный интернет-магазин - exopencart.ru', 0),
(35815, 0, 'config', 'config_meta_keyword', '', 0),
(35813, 0, 'config', 'config_heading_seo_phrase', '{\"1\":\"\",\"2\":\"\"}', 1),
(35811, 0, 'config', 'config_meta_title', 'Бесплатный интернет-магазин', 0),
(35812, 0, 'config', 'config_title_seo_phrase', '{\"1\":\"\",\"2\":\"\"}', 1),
(23107, 0, 'module_exbot', 'module_exbot_status', '0', 0),
(23108, 0, 'module_exbot', 'module_exbot_settings', '{\"bot_token\":\"\",\"token\":\"\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_shipping_courier`
--

CREATE TABLE `oc_shipping_courier` (
  `shipping_courier_id` int(11) NOT NULL,
  `shipping_courier_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `shipping_courier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_shipping_courier`
--

INSERT INTO `oc_shipping_courier` (`shipping_courier_id`, `shipping_courier_code`, `shipping_courier_name`) VALUES
(1, 'dhl', 'DHL'),
(2, 'fedex', 'Fedex'),
(3, 'ups', 'UPS'),
(4, 'royal-mail', 'Royal Mail'),
(5, 'usps', 'United States Postal Service'),
(6, 'auspost', 'Australia Post');

-- --------------------------------------------------------

--
-- Table structure for table `oc_statistics`
--

CREATE TABLE `oc_statistics` (
  `statistics_id` int(11) NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_statistics`
--

INSERT INTO `oc_statistics` (`statistics_id`, `code`, `value`) VALUES
(1, 'order_sale', '11771441.0000'),
(2, 'order_processing', '0.0000'),
(3, 'order_complete', '0.0000'),
(4, 'order_other', '0.0000'),
(5, 'returns', '0.0000'),
(6, 'product', '0.0000'),
(7, 'review', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_stock_status`
--

CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'В наличии'),
(8, 1, 'Предзаказ'),
(5, 1, 'Нет в наличии'),
(6, 1, 'Ожидание 2-3 дня'),
(7, 2, 'In Stock'),
(8, 2, 'Pre-Order'),
(5, 2, 'Out Of Stock'),
(6, 2, '2-3 Days');

-- --------------------------------------------------------

--
-- Table structure for table `oc_store`
--

CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ssl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_class`
--

CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate`
--

CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate_to_customer_group`
--

CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rule`
--

CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_theme`
--

CREATE TABLE `oc_theme` (
  `theme_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_translation`
--

CREATE TABLE `oc_translation` (
  `translation_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_upload`
--

CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_user`
--

CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', '29581f81162b3801194eb19fd2d40aee21dc8c81', 'C2YPIx5dd', 'John', 'Doe', 'info@exopencart.ru', '', '', '172.16.238.1', 1, '2025-06-03 07:45:39');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user_group`
--

CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{\"access\":[\"blog\\/article\",\"blog\\/category\",\"blog\\/review\",\"blog\\/setting\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/advertise\\/google\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/currency\\/cbr\",\"extension\\/currency\\/ecb\",\"extension\\/currency\\/fixer\",\"extension\\/currency\\/nbu\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/currency\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/unisender\",\"extension\\/feed\\/yandex_market\",\"extension\\/feed\\/yandex_turbo\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/menu\\/default\",\"extension\\/module\\/account\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/anycategories\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/blog_category\",\"extension\\/module\\/blog_featured\",\"extension\\/module\\/blog_latest\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/exbot\",\"extension\\/module\\/extheme\",\"extension\\/module\\/featured\",\"extension\\/module\\/featured_article\",\"extension\\/module\\/featured_product\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/paypal_smart_button\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/module\\/privacy\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/payment\\/alipay\",\"extension\\/payment\\/alipay_cross\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/ocstore_w1\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypal\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_braintree\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/squareup\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/webmoney_wmb\",\"extension\\/payment\\/webmoney_wme\",\"extension\\/payment\\/webmoney_wmk\",\"extension\\/payment\\/webmoney_wmr\",\"extension\\/payment\\/webmoney_wmu\",\"extension\\/payment\\/webmoney_wmv\",\"extension\\/payment\\/webmoney_wmz\",\"extension\\/payment\\/wechat_pay\",\"extension\\/payment\\/worldpay\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/quantity_class\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/modification\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"search\\/search\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/free\"],\"modify\":[\"blog\\/article\",\"blog\\/category\",\"blog\\/review\",\"blog\\/setting\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/advertise\\/google\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/currency\\/cbr\",\"extension\\/currency\\/ecb\",\"extension\\/currency\\/fixer\",\"extension\\/currency\\/nbu\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/currency\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/unisender\",\"extension\\/feed\\/yandex_market\",\"extension\\/feed\\/yandex_turbo\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/menu\\/default\",\"extension\\/module\\/account\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/anycategories\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/blog_category\",\"extension\\/module\\/blog_featured\",\"extension\\/module\\/blog_latest\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/exbot\",\"extension\\/module\\/extheme\",\"extension\\/module\\/featured\",\"extension\\/module\\/featured_article\",\"extension\\/module\\/featured_product\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/paypal_smart_button\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/module\\/privacy\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/payment\\/alipay\",\"extension\\/payment\\/alipay_cross\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/ocstore_w1\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypal\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_braintree\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/squareup\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/webmoney_wmb\",\"extension\\/payment\\/webmoney_wme\",\"extension\\/payment\\/webmoney_wmk\",\"extension\\/payment\\/webmoney_wmr\",\"extension\\/payment\\/webmoney_wmu\",\"extension\\/payment\\/webmoney_wmv\",\"extension\\/payment\\/webmoney_wmz\",\"extension\\/payment\\/wechat_pay\",\"extension\\/payment\\/worldpay\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/quantity_class\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/modification\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"search\\/search\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/free\"],\"hiden\":[\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/featured_article\",\"extension\\/module\\/featured_product\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/paypal_smart_button\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/payment\\/alipay\",\"extension\\/payment\\/alipay_cross\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/ocstore_w1\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypal\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_braintree\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/squareup\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/webmoney_wmb\",\"extension\\/payment\\/webmoney_wme\",\"extension\\/payment\\/webmoney_wmk\",\"extension\\/payment\\/webmoney_wmr\",\"extension\\/payment\\/webmoney_wmu\",\"extension\\/payment\\/webmoney_wmv\",\"extension\\/payment\\/webmoney_wmz\",\"extension\\/payment\\/wechat_pay\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\"]}'),
(10, 'Demonstration', '{\"access\":[\"blog\\/article\",\"blog\\/category\",\"blog\\/review\",\"blog\\/setting\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/advertise\\/google\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/currency\\/cbr\",\"extension\\/currency\\/ecb\",\"extension\\/currency\\/fixer\",\"extension\\/currency\\/nbu\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/currency\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/unisender\",\"extension\\/feed\\/yandex_market\",\"extension\\/feed\\/yandex_turbo\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/menu\\/default\",\"extension\\/module\\/account\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/anycategories\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/blog_category\",\"extension\\/module\\/blog_featured\",\"extension\\/module\\/blog_latest\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/exbot\",\"extension\\/module\\/extheme\",\"extension\\/module\\/featured\",\"extension\\/module\\/featured_article\",\"extension\\/module\\/featured_product\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/paypal_smart_button\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/module\\/privacy\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/payment\\/alipay\",\"extension\\/payment\\/alipay_cross\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/ocstore_w1\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypal\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_braintree\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/squareup\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/webmoney_wmb\",\"extension\\/payment\\/webmoney_wme\",\"extension\\/payment\\/webmoney_wmk\",\"extension\\/payment\\/webmoney_wmr\",\"extension\\/payment\\/webmoney_wmu\",\"extension\\/payment\\/webmoney_wmv\",\"extension\\/payment\\/webmoney_wmz\",\"extension\\/payment\\/wechat_pay\",\"extension\\/payment\\/worldpay\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/modification\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"search\\/search\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"]}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher`
--

CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_email` varchar(96) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_history`
--

CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme`
--

CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(7, 'catalog/profile-pic.png');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme_description`
--

CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(7, 1, 'День рождения'),
(7, 2, 'Birthday');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class`
--

CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class_description`
--

CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(2, 1, 'Граммы', 'г'),
(5, 1, 'Фунты', 'lb'),
(6, 1, 'Унции', 'oz'),
(1, 1, 'Килограммы', ' кг'),
(1, 2, 'Kilogram', ' kg'),
(2, 2, 'Gram', 'g'),
(6, 2, 'Ounce', 'oz'),
(5, 2, 'Pound', 'lb');

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone`
--

CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M\'Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu\'a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Арагацотн', 'AGT', 1),
(181, 11, 'Арарат', 'ARR', 1),
(182, 11, 'Армавир', 'ARM', 1),
(183, 11, 'Гегаркуник', 'GEG', 1),
(184, 11, 'Котайк', 'KOT', 1),
(185, 11, 'Лори', 'LOR', 1),
(186, 11, 'Ширак', 'SHI', 1),
(187, 11, 'Сюник', 'SYU', 1),
(188, 11, 'Тавуш', 'TAV', 1),
(189, 11, 'Вайоц Дзор', 'VAY', 1),
(190, 11, 'Ереван', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Nieder&ouml;sterreich', 'NOS', 1),
(202, 14, 'Ober&ouml;sterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore\'s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Брест', 'BR', 1),
(338, 20, 'Гомель', 'HO', 1),
(339, 20, 'Минск', 'HM', 1),
(340, 20, 'Гродно', 'HR', 1),
(341, 20, 'Могилев', 'MA', 1),
(342, 20, 'Минская область', 'MI', 1),
(343, 20, 'Витебск', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George\'s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith\'s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M\'Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O\'Higgins', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 1),
(848, 53, 'Grad Zagreb', 'GZ', 1),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Karlovačka', 'KA', 1),
(852, 53, 'Koprivničko-križevačka', 'KK', 1),
(853, 53, 'Krapinsko-zagorska', 'KZ', 1),
(854, 53, 'Ličko-senjska', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Osječko-baranjska', 'OB', 1),
(857, 53, 'Požeško-slavonska', 'PS', 1),
(858, 53, 'Primorsko-goranska', 'PG', 1),
(859, 53, 'Šibensko-kninska', 'SK', 1),
(860, 53, 'Sisačko-moslavačka', 'SM', 1),
(861, 53, 'Brodsko-posavska', 'BP', 1),
(862, 53, 'Splitsko-dalmatinska', 'SD', 1),
(863, 53, 'Varaždinska', 'VA', 1),
(864, 53, 'Virovitičko-podravska', 'VP', 1),
(865, 53, 'Vukovarsko-srijemska', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '\'Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma\'iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa\'id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina\'', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina\'', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Itä-Suomen lääni', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Oulun lääni', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d\'Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-W&uuml;rttemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Th&uuml;ringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand\'Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Puducherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta\'mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be\'er Sheva', 'BS', 1),
(1613, 104, 'Bika\'at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '\'Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al \'Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa\'', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa\'', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma\'an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Алматинская область', 'AL', 1),
(1717, 109, 'Алматы - город республ-го значения', 'AC', 1),
(1718, 109, 'Акмолинская область', 'AM', 1),
(1719, 109, 'Актюбинская область', 'AQ', 1),
(1720, 109, 'Астана - город республ-го значения', 'AS', 1),
(1721, 109, 'Атырауская область', 'AT', 1),
(1722, 109, 'Западно-Казахстанская область', 'BA', 1),
(1723, 109, 'Байконур - город республ-го значения', 'BY', 1),
(1724, 109, 'Мангистауская область', 'MA', 1),
(1725, 109, 'Южно-Казахстанская область', 'ON', 1),
(1726, 109, 'Павлодарская область', 'PA', 1),
(1727, 109, 'Карагандинская область', 'QA', 1),
(1728, 109, 'Костанайская область', 'QO', 1),
(1729, 109, 'Кызылординская область', 'QY', 1),
(1730, 109, 'Восточно-Казахстанская область', 'SH', 1),
(1731, 109, 'Северо-Казахстанская область', 'SO', 1),
(1732, 109, 'Жамбылская область', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P\'yongan-bukto', 'PYB', 1),
(1769, 112, 'P\'yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P\'yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch\'ungch\'ong-bukto', 'CO', 1),
(1774, 113, 'Ch\'ungch\'ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch\'on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t\'ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al \'Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra\'', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale\'s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha\'s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al \'Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati\'', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke\'s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa\'id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Республика Хакасия', 'KK', 1),
(2722, 176, 'Забайкальский край', 'ZAB', 1),
(2723, 176, 'Чукотский АО', 'CHU', 1),
(2724, 176, 'Архангельская область', 'ARK', 1),
(2725, 176, 'Астраханская область', 'AST', 1),
(2726, 176, 'Алтайский край', 'ALT', 1),
(2727, 176, 'Белгородская область', 'BEL', 1),
(2728, 176, 'Еврейская АО', 'YEV', 1),
(2729, 176, 'Амурская область', 'AMU', 1),
(2730, 176, 'Брянская область', 'BRY', 1),
(2731, 176, 'Чувашская Республика', 'CU', 1),
(2732, 176, 'Челябинская область', 'CHE', 1),
(2733, 176, 'Карачаево-Черкесия', 'KC', 1),
(2735, 176, 'Таймырский АО', 'TDN', 1),
(2736, 176, 'Республика Калмыкия', 'KL', 1),
(2738, 176, 'Республика Алтай', 'AL', 1),
(2739, 176, 'Чеченская Республика', 'CE', 1),
(2740, 176, 'Иркутская область', 'IRK', 1),
(2741, 176, 'Ивановская область', 'IVA', 1),
(2742, 176, 'Удмуртская Республика', 'UD', 1),
(2743, 176, 'Калининградская область', 'KGD', 1),
(2744, 176, 'Калужская область', 'KLU', 1),
(2745, 176, 'Краснодарский край', 'KDA', 1),
(2746, 176, 'Республика Татарстан', 'TA', 1),
(2747, 176, 'Кемеровская область', 'KEM', 1),
(2748, 176, 'Хабаровский край', 'KHA', 1),
(2749, 176, 'Ханты-Мансийский АО - Югра', 'KHM', 1),
(2750, 176, 'Костромская область', 'KOS', 1),
(2751, 176, 'Московская область', 'MOS', 1),
(2752, 176, 'Красноярский край', 'KYA', 1),
(2753, 176, 'Коми-Пермяцкий АО', 'KOP', 1),
(2754, 176, 'Курганская область', 'KGN', 1),
(2755, 176, 'Курская область', 'KRS', 1),
(2756, 176, 'Республика Тыва', 'TY', 1),
(2757, 176, 'Липецкая область', 'LIP', 1),
(2758, 176, 'Магаданская область', 'MAG', 1),
(2759, 176, 'Республика Дагестан', 'DA', 1),
(2760, 176, 'Республика Адыгея', 'AD', 1),
(2761, 176, 'Москва', 'MOW', 1),
(2762, 176, 'Мурманская область', 'MUR', 1),
(2763, 176, 'Республика Кабардино-Балкария', 'KB', 1),
(2764, 176, 'Ненецкий АО', 'NEN', 1),
(2765, 176, 'Республика Ингушетия', 'IN', 1),
(2766, 176, 'Нижегородская область', 'NIZ', 1),
(2767, 176, 'Новгородская область', 'NGR', 1),
(2768, 176, 'Новосибирская область', 'NVS', 1),
(2769, 176, 'Омская область', 'OMS', 1),
(2770, 176, 'Орловская область', 'ORL', 1),
(2771, 176, 'Оренбургская область', 'ORE', 1),
(2772, 176, 'Корякский АО', 'KOR', 1),
(2773, 176, 'Пензенская область', 'PNZ', 1),
(2774, 176, 'Пермский край', 'PER', 1),
(2775, 176, 'Камчатский край', 'KAM', 1),
(2776, 176, 'Республика Карелия', 'KR', 1),
(2777, 176, 'Псковская область', 'PSK', 1),
(2778, 176, 'Ростовская область', 'ROS', 1),
(2779, 176, 'Рязанская область', 'RYA', 1),
(2780, 176, 'Ямало-Ненецкий АО', 'YAN', 1),
(2781, 176, 'Самарская область', 'SAM', 1),
(2782, 176, 'Республика Мордовия', 'MO', 1),
(2783, 176, 'Саратовская область', 'SAR', 1),
(2784, 176, 'Смоленская область', 'SMO', 1),
(2785, 176, 'Санкт-Петербург', 'SPE', 1),
(2786, 176, 'Ставропольский край', 'STA', 1),
(2787, 176, 'Республика Коми', 'KO', 1),
(2788, 176, 'Тамбовская область', 'TAM', 1),
(2789, 176, 'Томская область', 'TOM', 1),
(2790, 176, 'Тульская область', 'TUL', 1),
(2791, 176, 'Ленинградская область', 'LEN', 1),
(2792, 176, 'Тверская область', 'TVE', 1),
(2793, 176, 'Тюменская область', 'TYU', 1),
(2794, 176, 'Республика Башкортостан', 'BA', 1),
(2795, 176, 'Ульяновская область', 'ULY', 1),
(2796, 176, 'Республика Бурятия', 'BU', 1),
(2798, 176, 'Республика Северная Осетия', 'SE', 1),
(2799, 176, 'Владимирская область', 'VLA', 1),
(2800, 176, 'Приморский край', 'PRI', 1),
(2801, 176, 'Волгоградская область', 'VGG', 1),
(2802, 176, 'Вологодская область', 'VLG', 1),
(2803, 176, 'Воронежская область', 'VOR', 1),
(2804, 176, 'Кировская область', 'KIR', 1),
(2805, 176, 'Республика  Саха / Якутия', 'SA', 1),
(2806, 176, 'Ярославская область', 'YAR', 1),
(2807, 176, 'Свердловская область', 'SVE', 1),
(2808, 176, 'Республика Марий Эл', 'ME', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A\'ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa\'asaleleaga', 'FA', 1),
(2856, 181, 'Gaga\'emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa\'itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va\'a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '\'Asir', 'AS', 1),
(2882, 184, 'Ha\'il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand\' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand\' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A\'ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa\'iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa\'iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'Gävleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'Jämtland', 'Z', 1),
(3080, 203, 'Jönköping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, 'Örebro', 'T', 1),
(3085, 203, 'Östergötland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'Södermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'Värmland', 'S', 1),
(3091, 203, 'Västerbotten', 'AC', 1),
(3092, 203, 'Västernorrland', 'Y', 1),
(3093, 203, 'Västmanland', 'U', 1),
(3094, 203, 'Västra Götaland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graubünden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Zürich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t\'ou', 'NT', 1),
(3145, 206, 'P\'eng-hu', 'PH', 1),
(3146, 206, 'P\'ing-tung', 'PT', 1),
(3147, 206, 'T\'ai-chung', 'TG', 1),
(3148, 206, 'T\'ai-nan', 'TA', 1),
(3149, 206, 'T\'ai-pei county', 'TP', 1),
(3150, 206, 'T\'ai-tung', 'TT', 1),
(3151, 206, 'T\'ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T\'ai-chung', 'TH', 1),
(3157, 206, 'T\'ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T\'ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha\'apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava\'u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Черкасская область', '71', 1),
(3481, 220, 'Черниговская область', '74', 1),
(3482, 220, 'Черновицкая область', '77', 1),
(3483, 220, 'Крым', '43', 1),
(3484, 220, 'Днепропетровская область', '12', 1),
(3485, 220, 'Донецкая область', '14', 1),
(3486, 220, 'Ивано-Франковская область', '26', 1),
(3487, 220, 'Херсонская область', '65', 1),
(3488, 220, 'Хмельницкая область', '68', 1),
(3489, 220, 'Кировоградская область', '35', 1),
(3490, 220, 'Киев', '30', 1),
(3491, 220, 'Киевская область', '32', 1),
(3492, 220, 'Луганская область', '09', 1),
(3493, 220, 'Львовская область', '46', 1),
(3494, 220, 'Николаевская область', '48', 1),
(3495, 220, 'Одесская область', '51', 1),
(3496, 220, 'Полтавская область', '53', 1),
(3497, 220, 'Ровненская область', '56', 1),
(3498, 220, 'Севастополь', '40', 1),
(3499, 220, 'Сумская область', '59', 1),
(3500, 220, 'Тернопольская область', '61', 1),
(3501, 220, 'Винницкая область', '05', 1),
(3502, 220, 'Волынская область', '07', 1),
(3503, 220, 'Закарпатская область', '21', 1),
(3504, 220, 'Запорожская область', '23', 1),
(3505, 220, 'Житомирская область', '18', 1),
(3506, 221, 'Abu Zaby', 'AZ', 1),
(3507, 221, '\'Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubai', 'DU', 1),
(3511, 221, 'R\'as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg\'ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog\'iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma\'rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa\'dah', 'SD', 1),
(3805, 235, 'San\'a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta\'izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1),
(4222, 43, 'Arica y Parinacota', 'AP', 1),
(4223, 43, 'Los Rios', 'LR', 1),
(4224, 220, 'Харьковская область', '63', 1),
(4225, 118, 'Beirut', 'LB-BR', 1),
(4226, 118, 'Bekaa', 'LB-BE', 1),
(4227, 118, 'Mount Lebanon', 'LB-ML', 1),
(4228, 118, 'Nabatieh', 'LB-NB', 1),
(4229, 118, 'North', 'LB-NR', 1),
(4230, 118, 'South', 'LB-ST', 1),
(4231, 99, 'Telangana', 'TS', 1),
(4232, 44, 'Qinghai', 'QH', 1),
(4233, 100, 'Papua Barat', 'PB', 1),
(4234, 100, 'Sulawesi Barat', 'SR', 1),
(4235, 100, 'Kepulauan Riau', 'KR', 1),
(4236, 105, 'Barletta-Andria-Trani', 'BT', 1),
(4237, 105, 'Fermo', 'FM', 1),
(4238, 105, 'Monza Brianza', 'MB', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone_to_geo_zone`
--

CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oc_address`
--
ALTER TABLE `oc_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `oc_api`
--
ALTER TABLE `oc_api`
  ADD PRIMARY KEY (`api_id`);

--
-- Indexes for table `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  ADD PRIMARY KEY (`api_ip_id`);

--
-- Indexes for table `oc_api_session`
--
ALTER TABLE `oc_api_session`
  ADD PRIMARY KEY (`api_session_id`);

--
-- Indexes for table `oc_article`
--
ALTER TABLE `oc_article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `oc_article_description`
--
ALTER TABLE `oc_article_description`
  ADD PRIMARY KEY (`article_id`,`language_id`),
  ADD KEY `name` (`name`(250));

--
-- Indexes for table `oc_article_image`
--
ALTER TABLE `oc_article_image`
  ADD PRIMARY KEY (`article_image_id`);

--
-- Indexes for table `oc_article_related`
--
ALTER TABLE `oc_article_related`
  ADD PRIMARY KEY (`article_id`,`related_id`);

--
-- Indexes for table `oc_article_related_mn`
--
ALTER TABLE `oc_article_related_mn`
  ADD PRIMARY KEY (`article_id`,`manufacturer_id`);

--
-- Indexes for table `oc_article_related_product`
--
ALTER TABLE `oc_article_related_product`
  ADD PRIMARY KEY (`article_id`,`product_id`);

--
-- Indexes for table `oc_article_related_wb`
--
ALTER TABLE `oc_article_related_wb`
  ADD PRIMARY KEY (`article_id`,`category_id`);

--
-- Indexes for table `oc_article_to_blog_category`
--
ALTER TABLE `oc_article_to_blog_category`
  ADD PRIMARY KEY (`article_id`,`blog_category_id`);

--
-- Indexes for table `oc_article_to_download`
--
ALTER TABLE `oc_article_to_download`
  ADD PRIMARY KEY (`article_id`,`download_id`);

--
-- Indexes for table `oc_article_to_layout`
--
ALTER TABLE `oc_article_to_layout`
  ADD PRIMARY KEY (`article_id`,`store_id`);

--
-- Indexes for table `oc_article_to_store`
--
ALTER TABLE `oc_article_to_store`
  ADD PRIMARY KEY (`article_id`,`store_id`);

--
-- Indexes for table `oc_attribute`
--
ALTER TABLE `oc_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Indexes for table `oc_attribute_description`
--
ALTER TABLE `oc_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- Indexes for table `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Indexes for table `oc_attribute_group_description`
--
ALTER TABLE `oc_attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- Indexes for table `oc_banner`
--
ALTER TABLE `oc_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Indexes for table `oc_blog_category`
--
ALTER TABLE `oc_blog_category`
  ADD PRIMARY KEY (`blog_category_id`);

--
-- Indexes for table `oc_blog_category_description`
--
ALTER TABLE `oc_blog_category_description`
  ADD PRIMARY KEY (`blog_category_id`,`language_id`),
  ADD KEY `name` (`name`(250));

--
-- Indexes for table `oc_blog_category_path`
--
ALTER TABLE `oc_blog_category_path`
  ADD PRIMARY KEY (`blog_category_id`,`path_id`);

--
-- Indexes for table `oc_blog_category_to_layout`
--
ALTER TABLE `oc_blog_category_to_layout`
  ADD PRIMARY KEY (`blog_category_id`,`store_id`);

--
-- Indexes for table `oc_blog_category_to_store`
--
ALTER TABLE `oc_blog_category_to_store`
  ADD PRIMARY KEY (`blog_category_id`,`store_id`);

--
-- Indexes for table `oc_cart`
--
ALTER TABLE `oc_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`);

--
-- Indexes for table `oc_category`
--
ALTER TABLE `oc_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `oc_category_description`
--
ALTER TABLE `oc_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`(250));

--
-- Indexes for table `oc_category_filter`
--
ALTER TABLE `oc_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Indexes for table `oc_category_path`
--
ALTER TABLE `oc_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Indexes for table `oc_category_to_layout`
--
ALTER TABLE `oc_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `oc_category_to_store`
--
ALTER TABLE `oc_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `oc_country`
--
ALTER TABLE `oc_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `oc_coupon`
--
ALTER TABLE `oc_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `oc_coupon_category`
--
ALTER TABLE `oc_coupon_category`
  ADD PRIMARY KEY (`coupon_id`,`category_id`);

--
-- Indexes for table `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Indexes for table `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  ADD PRIMARY KEY (`coupon_product_id`);

--
-- Indexes for table `oc_csvprice_pro`
--
ALTER TABLE `oc_csvprice_pro`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `oc_csvprice_pro_crontab`
--
ALTER TABLE `oc_csvprice_pro_crontab`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `oc_csvprice_pro_images`
--
ALTER TABLE `oc_csvprice_pro_images`
  ADD PRIMARY KEY (`catalog_id`,`image_key`),
  ADD KEY `image_key` (`image_key`);

--
-- Indexes for table `oc_csvprice_pro_profiles`
--
ALTER TABLE `oc_csvprice_pro_profiles`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indexes for table `oc_currency`
--
ALTER TABLE `oc_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `oc_customer`
--
ALTER TABLE `oc_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  ADD PRIMARY KEY (`customer_activity_id`);

--
-- Indexes for table `oc_customer_affiliate`
--
ALTER TABLE `oc_customer_affiliate`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `oc_customer_approval`
--
ALTER TABLE `oc_customer_approval`
  ADD PRIMARY KEY (`customer_approval_id`);

--
-- Indexes for table `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Indexes for table `oc_customer_group_description`
--
ALTER TABLE `oc_customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- Indexes for table `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- Indexes for table `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `oc_customer_online`
--
ALTER TABLE `oc_customer_online`
  ADD PRIMARY KEY (`ip`);

--
-- Indexes for table `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- Indexes for table `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  ADD PRIMARY KEY (`customer_search_id`);

--
-- Indexes for table `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- Indexes for table `oc_customer_wishlist`
--
ALTER TABLE `oc_customer_wishlist`
  ADD PRIMARY KEY (`customer_id`,`product_id`);

--
-- Indexes for table `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Indexes for table `oc_custom_field_customer_group`
--
ALTER TABLE `oc_custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- Indexes for table `oc_custom_field_description`
--
ALTER TABLE `oc_custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- Indexes for table `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- Indexes for table `oc_custom_field_value_description`
--
ALTER TABLE `oc_custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- Indexes for table `oc_download`
--
ALTER TABLE `oc_download`
  ADD PRIMARY KEY (`download_id`);

--
-- Indexes for table `oc_download_description`
--
ALTER TABLE `oc_download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- Indexes for table `oc_event`
--
ALTER TABLE `oc_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `oc_extension`
--
ALTER TABLE `oc_extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- Indexes for table `oc_extension_install`
--
ALTER TABLE `oc_extension_install`
  ADD PRIMARY KEY (`extension_install_id`);

--
-- Indexes for table `oc_extension_path`
--
ALTER TABLE `oc_extension_path`
  ADD PRIMARY KEY (`extension_path_id`);

--
-- Indexes for table `oc_filter`
--
ALTER TABLE `oc_filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `oc_filter_description`
--
ALTER TABLE `oc_filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Indexes for table `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Indexes for table `oc_filter_group_description`
--
ALTER TABLE `oc_filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- Indexes for table `oc_fraudlabspro`
--
ALTER TABLE `oc_fraudlabspro`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Indexes for table `oc_googleshopping_category`
--
ALTER TABLE `oc_googleshopping_category`
  ADD PRIMARY KEY (`google_product_category`,`store_id`),
  ADD KEY `category_id_store_id` (`category_id`,`store_id`);

--
-- Indexes for table `oc_googleshopping_product`
--
ALTER TABLE `oc_googleshopping_product`
  ADD PRIMARY KEY (`product_advertise_google_id`),
  ADD UNIQUE KEY `product_id_store_id` (`product_id`,`store_id`);

--
-- Indexes for table `oc_googleshopping_product_status`
--
ALTER TABLE `oc_googleshopping_product_status`
  ADD PRIMARY KEY (`product_id`,`store_id`,`product_variation_id`);

--
-- Indexes for table `oc_googleshopping_product_target`
--
ALTER TABLE `oc_googleshopping_product_target`
  ADD PRIMARY KEY (`product_id`,`advertise_google_target_id`);

--
-- Indexes for table `oc_googleshopping_target`
--
ALTER TABLE `oc_googleshopping_target`
  ADD PRIMARY KEY (`advertise_google_target_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `oc_google_base_category`
--
ALTER TABLE `oc_google_base_category`
  ADD PRIMARY KEY (`google_base_category_id`);

--
-- Indexes for table `oc_google_base_category_to_category`
--
ALTER TABLE `oc_google_base_category_to_category`
  ADD PRIMARY KEY (`google_base_category_id`,`category_id`);

--
-- Indexes for table `oc_information`
--
ALTER TABLE `oc_information`
  ADD PRIMARY KEY (`information_id`);

--
-- Indexes for table `oc_information_description`
--
ALTER TABLE `oc_information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- Indexes for table `oc_information_to_layout`
--
ALTER TABLE `oc_information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `oc_information_to_store`
--
ALTER TABLE `oc_information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `oc_language`
--
ALTER TABLE `oc_language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_layout`
--
ALTER TABLE `oc_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Indexes for table `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Indexes for table `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Indexes for table `oc_length_class`
--
ALTER TABLE `oc_length_class`
  ADD PRIMARY KEY (`length_class_id`);

--
-- Indexes for table `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  ADD PRIMARY KEY (`length_class_id`,`language_id`);

--
-- Indexes for table `oc_location`
--
ALTER TABLE `oc_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `oc_manufacturer_to_layout`
--
ALTER TABLE `oc_manufacturer_to_layout`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Indexes for table `oc_manufacturer_to_store`
--
ALTER TABLE `oc_manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Indexes for table `oc_marketing`
--
ALTER TABLE `oc_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Indexes for table `oc_modification`
--
ALTER TABLE `oc_modification`
  ADD PRIMARY KEY (`modification_id`);

--
-- Indexes for table `oc_modification_backup`
--
ALTER TABLE `oc_modification_backup`
  ADD PRIMARY KEY (`backup_id`);

--
-- Indexes for table `oc_module`
--
ALTER TABLE `oc_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `oc_option`
--
ALTER TABLE `oc_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `oc_option_description`
--
ALTER TABLE `oc_option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- Indexes for table `oc_option_value`
--
ALTER TABLE `oc_option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Indexes for table `oc_option_value_description`
--
ALTER TABLE `oc_option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- Indexes for table `oc_order`
--
ALTER TABLE `oc_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `oc_order_history`
--
ALTER TABLE `oc_order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Indexes for table `oc_order_option`
--
ALTER TABLE `oc_order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Indexes for table `oc_order_product`
--
ALTER TABLE `oc_order_product`
  ADD PRIMARY KEY (`order_product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  ADD PRIMARY KEY (`order_recurring_id`);

--
-- Indexes for table `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  ADD PRIMARY KEY (`order_recurring_transaction_id`);

--
-- Indexes for table `oc_order_shipment`
--
ALTER TABLE `oc_order_shipment`
  ADD PRIMARY KEY (`order_shipment_id`);

--
-- Indexes for table `oc_order_status`
--
ALTER TABLE `oc_order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- Indexes for table `oc_order_total`
--
ALTER TABLE `oc_order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  ADD PRIMARY KEY (`order_voucher_id`);

--
-- Indexes for table `oc_product`
--
ALTER TABLE `oc_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `oc_product_attribute`
--
ALTER TABLE `oc_product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- Indexes for table `oc_product_description`
--
ALTER TABLE `oc_product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`(250));

--
-- Indexes for table `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_filter`
--
ALTER TABLE `oc_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Indexes for table `oc_product_image`
--
ALTER TABLE `oc_product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_option`
--
ALTER TABLE `oc_product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- Indexes for table `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`);

--
-- Indexes for table `oc_product_recurring`
--
ALTER TABLE `oc_product_recurring`
  ADD PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`);

--
-- Indexes for table `oc_product_related`
--
ALTER TABLE `oc_product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Indexes for table `oc_product_related_article`
--
ALTER TABLE `oc_product_related_article`
  ADD PRIMARY KEY (`article_id`,`product_id`);

--
-- Indexes for table `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- Indexes for table `oc_product_special`
--
ALTER TABLE `oc_product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_to_category`
--
ALTER TABLE `oc_product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `oc_product_to_download`
--
ALTER TABLE `oc_product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- Indexes for table `oc_product_to_layout`
--
ALTER TABLE `oc_product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `oc_product_to_store`
--
ALTER TABLE `oc_product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `oc_quantity_class`
--
ALTER TABLE `oc_quantity_class`
  ADD PRIMARY KEY (`quantity_class_id`);

--
-- Indexes for table `oc_quantity_class_description`
--
ALTER TABLE `oc_quantity_class_description`
  ADD PRIMARY KEY (`quantity_class_id`,`language_id`);

--
-- Indexes for table `oc_recurring`
--
ALTER TABLE `oc_recurring`
  ADD PRIMARY KEY (`recurring_id`);

--
-- Indexes for table `oc_recurring_description`
--
ALTER TABLE `oc_recurring_description`
  ADD PRIMARY KEY (`recurring_id`,`language_id`);

--
-- Indexes for table `oc_return`
--
ALTER TABLE `oc_return`
  ADD PRIMARY KEY (`return_id`);

--
-- Indexes for table `oc_return_action`
--
ALTER TABLE `oc_return_action`
  ADD PRIMARY KEY (`return_action_id`,`language_id`);

--
-- Indexes for table `oc_return_history`
--
ALTER TABLE `oc_return_history`
  ADD PRIMARY KEY (`return_history_id`);

--
-- Indexes for table `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  ADD PRIMARY KEY (`return_reason_id`,`language_id`);

--
-- Indexes for table `oc_return_status`
--
ALTER TABLE `oc_return_status`
  ADD PRIMARY KEY (`return_status_id`,`language_id`);

--
-- Indexes for table `oc_review`
--
ALTER TABLE `oc_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_review_article`
--
ALTER TABLE `oc_review_article`
  ADD PRIMARY KEY (`review_article_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indexes for table `oc_seo_url`
--
ALTER TABLE `oc_seo_url`
  ADD PRIMARY KEY (`seo_url_id`),
  ADD KEY `query` (`query`(250)),
  ADD KEY `keyword` (`keyword`(250));

--
-- Indexes for table `oc_session`
--
ALTER TABLE `oc_session`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `oc_setting`
--
ALTER TABLE `oc_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `oc_shipping_courier`
--
ALTER TABLE `oc_shipping_courier`
  ADD PRIMARY KEY (`shipping_courier_id`);

--
-- Indexes for table `oc_statistics`
--
ALTER TABLE `oc_statistics`
  ADD PRIMARY KEY (`statistics_id`);

--
-- Indexes for table `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- Indexes for table `oc_store`
--
ALTER TABLE `oc_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Indexes for table `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- Indexes for table `oc_tax_rate_to_customer_group`
--
ALTER TABLE `oc_tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- Indexes for table `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- Indexes for table `oc_theme`
--
ALTER TABLE `oc_theme`
  ADD PRIMARY KEY (`theme_id`);

--
-- Indexes for table `oc_translation`
--
ALTER TABLE `oc_translation`
  ADD PRIMARY KEY (`translation_id`);

--
-- Indexes for table `oc_upload`
--
ALTER TABLE `oc_upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- Indexes for table `oc_user`
--
ALTER TABLE `oc_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `oc_user_group`
--
ALTER TABLE `oc_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Indexes for table `oc_voucher`
--
ALTER TABLE `oc_voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Indexes for table `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  ADD PRIMARY KEY (`voucher_history_id`);

--
-- Indexes for table `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  ADD PRIMARY KEY (`voucher_theme_id`);

--
-- Indexes for table `oc_voucher_theme_description`
--
ALTER TABLE `oc_voucher_theme_description`
  ADD PRIMARY KEY (`voucher_theme_id`,`language_id`);

--
-- Indexes for table `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  ADD PRIMARY KEY (`weight_class_id`);

--
-- Indexes for table `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  ADD PRIMARY KEY (`weight_class_id`,`language_id`);

--
-- Indexes for table `oc_zone`
--
ALTER TABLE `oc_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oc_address`
--
ALTER TABLE `oc_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `oc_api`
--
ALTER TABLE `oc_api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  MODIFY `api_ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `oc_api_session`
--
ALTER TABLE `oc_api_session`
  MODIFY `api_session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=762;

--
-- AUTO_INCREMENT for table `oc_article`
--
ALTER TABLE `oc_article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `oc_article_image`
--
ALTER TABLE `oc_article_image`
  MODIFY `article_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4010;

--
-- AUTO_INCREMENT for table `oc_attribute`
--
ALTER TABLE `oc_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  MODIFY `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_banner`
--
ALTER TABLE `oc_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT for table `oc_blog_category`
--
ALTER TABLE `oc_blog_category`
  MODIFY `blog_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `oc_cart`
--
ALTER TABLE `oc_cart`
  MODIFY `cart_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT for table `oc_category`
--
ALTER TABLE `oc_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `oc_country`
--
ALTER TABLE `oc_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT for table `oc_coupon`
--
ALTER TABLE `oc_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  MODIFY `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  MODIFY `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_csvprice_pro`
--
ALTER TABLE `oc_csvprice_pro`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `oc_csvprice_pro_crontab`
--
ALTER TABLE `oc_csvprice_pro_crontab`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_csvprice_pro_profiles`
--
ALTER TABLE `oc_csvprice_pro_profiles`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oc_currency`
--
ALTER TABLE `oc_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oc_customer`
--
ALTER TABLE `oc_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  MODIFY `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_customer_approval`
--
ALTER TABLE `oc_customer_approval`
  MODIFY `customer_approval_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  MODIFY `customer_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  MODIFY `customer_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  MODIFY `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  MODIFY `customer_search_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  MODIFY `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oc_download`
--
ALTER TABLE `oc_download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oc_event`
--
ALTER TABLE `oc_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `oc_extension`
--
ALTER TABLE `oc_extension`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `oc_extension_install`
--
ALTER TABLE `oc_extension_install`
  MODIFY `extension_install_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oc_extension_path`
--
ALTER TABLE `oc_extension_path`
  MODIFY `extension_path_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oc_filter`
--
ALTER TABLE `oc_filter`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oc_googleshopping_product`
--
ALTER TABLE `oc_googleshopping_product`
  MODIFY `product_advertise_google_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oc_google_base_category`
--
ALTER TABLE `oc_google_base_category`
  MODIFY `google_base_category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_information`
--
ALTER TABLE `oc_information`
  MODIFY `information_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `oc_language`
--
ALTER TABLE `oc_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oc_layout`
--
ALTER TABLE `oc_layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=333;

--
-- AUTO_INCREMENT for table `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  MODIFY `layout_route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT for table `oc_length_class`
--
ALTER TABLE `oc_length_class`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oc_location`
--
ALTER TABLE `oc_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oc_marketing`
--
ALTER TABLE `oc_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_modification`
--
ALTER TABLE `oc_modification`
  MODIFY `modification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oc_modification_backup`
--
ALTER TABLE `oc_modification_backup`
  MODIFY `backup_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_module`
--
ALTER TABLE `oc_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `oc_option`
--
ALTER TABLE `oc_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `oc_option_value`
--
ALTER TABLE `oc_option_value`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `oc_order`
--
ALTER TABLE `oc_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `oc_order_history`
--
ALTER TABLE `oc_order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT for table `oc_order_option`
--
ALTER TABLE `oc_order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `oc_order_product`
--
ALTER TABLE `oc_order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  MODIFY `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  MODIFY `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_order_shipment`
--
ALTER TABLE `oc_order_shipment`
  MODIFY `order_shipment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_order_status`
--
ALTER TABLE `oc_order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `oc_order_total`
--
ALTER TABLE `oc_order_total`
  MODIFY `order_total_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=516;

--
-- AUTO_INCREMENT for table `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  MODIFY `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oc_product`
--
ALTER TABLE `oc_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;

--
-- AUTO_INCREMENT for table `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_product_image`
--
ALTER TABLE `oc_product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2003;

--
-- AUTO_INCREMENT for table `oc_product_option`
--
ALTER TABLE `oc_product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  MODIFY `product_reward_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_product_special`
--
ALTER TABLE `oc_product_special`
  MODIFY `product_special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `oc_quantity_class`
--
ALTER TABLE `oc_quantity_class`
  MODIFY `quantity_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `oc_recurring`
--
ALTER TABLE `oc_recurring`
  MODIFY `recurring_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oc_return`
--
ALTER TABLE `oc_return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_return_action`
--
ALTER TABLE `oc_return_action`
  MODIFY `return_action_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oc_return_history`
--
ALTER TABLE `oc_return_history`
  MODIFY `return_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  MODIFY `return_reason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `oc_return_status`
--
ALTER TABLE `oc_return_status`
  MODIFY `return_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oc_review`
--
ALTER TABLE `oc_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `oc_review_article`
--
ALTER TABLE `oc_review_article`
  MODIFY `review_article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `oc_seo_url`
--
ALTER TABLE `oc_seo_url`
  MODIFY `seo_url_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1395;

--
-- AUTO_INCREMENT for table `oc_setting`
--
ALTER TABLE `oc_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35944;

--
-- AUTO_INCREMENT for table `oc_statistics`
--
ALTER TABLE `oc_statistics`
  MODIFY `statistics_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oc_store`
--
ALTER TABLE `oc_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  MODIFY `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `oc_theme`
--
ALTER TABLE `oc_theme`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oc_translation`
--
ALTER TABLE `oc_translation`
  MODIFY `translation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oc_upload`
--
ALTER TABLE `oc_upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `oc_user`
--
ALTER TABLE `oc_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oc_user_group`
--
ALTER TABLE `oc_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `oc_voucher`
--
ALTER TABLE `oc_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  MODIFY `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  MODIFY `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oc_zone`
--
ALTER TABLE `oc_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4239;

--
-- AUTO_INCREMENT for table `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
