-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2024 at 02:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reg`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_agent`
--

CREATE TABLE `tb_agent` (
  `id` int(11) NOT NULL,
  `agent_code` varchar(255) NOT NULL,
  `agent_name` varchar(255) NOT NULL,
  `agent_token` text NOT NULL,
  `agent_password` varchar(255) NOT NULL,
  `agent_upline` varchar(255) NOT NULL,
  `agent_created` datetime NOT NULL,
  `agent_balance` double NOT NULL,
  `agent_level` enum('admin','agent','sub_agent') NOT NULL,
  `agent_status` enum('active','blocked') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_balance`
--

CREATE TABLE `tb_balance` (
  `id` int(11) NOT NULL,
  `trxid` text NOT NULL,
  `agent_code` varchar(255) NOT NULL,
  `balance` double NOT NULL,
  `amount` double NOT NULL,
  `created` datetime NOT NULL,
  `date_cr` varchar(255) NOT NULL,
  `metode` text NOT NULL,
  `status` enum('Pending','Success','Cancel') NOT NULL,
  `whatsapp` varchar(255) NOT NULL,
  `checkout` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_bank`
--

CREATE TABLE `tb_bank` (
  `id` int(11) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `account` varchar(255) NOT NULL,
  `new` varchar(255) NOT NULL,
  `date_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_biling`
--

CREATE TABLE `tb_biling` (
  `id` int(11) NOT NULL,
  `agent_code` varchar(255) NOT NULL,
  `amount` double NOT NULL,
  `status` enum('Pending','Success','Cancel') NOT NULL,
  `created` datetime NOT NULL,
  `before_agent_balance` double NOT NULL,
  `after_agent_balance` double NOT NULL,
  `accept_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_channel`
--

CREATE TABLE `tb_channel` (
  `id` int(11) NOT NULL,
  `service` double NOT NULL,
  `name` varchar(255) NOT NULL,
  `fee` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `min` double NOT NULL,
  `max` double NOT NULL,
  `status` enum('ON','OFF') NOT NULL,
  `sattlement` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_channel`
--

INSERT INTO `tb_channel` (`id`, `service`, `name`, `fee`, `type`, `image`, `min`, `max`, `status`, `sattlement`) VALUES
(1, 1, 'Virtual Account Bank BCA', '4900', 'VA', 'https://ppultron.com/payment/images/bca.png', 10000, 10000000, 'ON', '86400'),
(2, 2, 'Virtual Account Bank BRI', '2500', 'VA', 'https://ppultron.com/payment/images/briva.png', 10000, 50000000, 'ON', '86400'),
(3, 3, 'Virtual Account Bank CIMB', '2500', 'VA', 'https://ppultron.com/payment/images/cimbniaga.png', 10000, 50000000, 'ON', '86400'),
(4, 4, 'Virtual Account Bank BNI', '4000', 'VA', 'https://ppultron.com/payment/images/bni.png', 10000, 50000000, 'ON', '86400'),
(5, 5, 'Virtual Account Bank MANDIRI', '2500', 'VA', 'https://ppultron.com/payment/images/mandiri.svg', 10000, 50000000, 'ON', '86400'),
(6, 6, 'Virtual Account Bank Maybank', '4000', 'VA', 'https://ppultron.com/payment/images/maybank.svg', 10000, 50000000, 'ON', '86400'),
(7, 7, 'Virtual Account Bank Permata', '2500', 'VA', 'https://ppultron.com/payment/images/permata.svg', 10000, 50000000, 'ON', '86400'),
(8, 8, 'Virtual Account BANK DANAMON', '2500', 'VA', 'https://ppultron.com/payment/images/danamon.png', 10000, 50000000, 'ON', '86400'),
(9, 9, 'Virtual Account BANK BSI', '3500', 'VA', 'https://ppultron.com/payment/images/bsi.svg', 10000, 50000000, 'ON', '86400'),
(10, 10, 'Virtual Account BANK BNC (Neo Commerce)', '3500', 'VA', 'https://ppultron.com/payment/images/neo.png', 10000, 50000000, 'ON', '86400'),
(11, 11, 'QRIS Merchant', '0.7%', 'QRIS', 'https://ppultron.com/payment/images/qris.png', 100, 10000000, 'ON', '86400'),
(12, 12, 'OVO', '3%', 'OVO', 'https://ppultron.com/payment/images/ovo.svg', 1000, 2000000, 'ON', '86400'),
(13, 13, 'DANA', '3%', 'EWALLET', 'https://ppultron.com/payment/images/dana.svg', 1000, 2000000, 'ON', '86400'),
(14, 14, 'LINKAJA', '3%', 'EWALLET', 'https://ppultron.com/payment/images/linkaja.png', 1000, 2000000, 'ON', '86400'),
(15, 17, 'QRIS', '0.7%', 'QRIS', 'https://ppultron.com/payment/images/qris.png', 100, 10000000, 'OFF', '86400'),
(16, 18, 'ALFAMART', '2500', 'RETAIL', 'https://ppultron.com/payment/images/alfamart.png', 10000, 5000000, 'ON', '259200'),
(17, 19, 'INDOMARET', '2500', 'RETAIL', 'https://ppultron.com/payment/images/indomaret.png', 10000, 5000000, 'ON', '259200'),
(18, 20, 'QRIS Merchant by danamon', '0.9%', 'QRIS', 'https://ppultron.com/payment/images/qris.png', 1000, 10000000, 'ON', '86400'),
(19, 21, 'Virtual Account Bank OCBC', '1500', 'VA', 'https://ppultron.com/payment/images/ocbc.png', 10000, 50000000, 'ON', '86400');

-- --------------------------------------------------------

--
-- Table structure for table `tb_connect`
--

CREATE TABLE `tb_connect` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `balance` double NOT NULL,
  `last_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_game`
--

CREATE TABLE `tb_game` (
  `id` int(11) NOT NULL,
  `game_code` varchar(255) NOT NULL,
  `game_name` varchar(255) NOT NULL,
  `game_provider` varchar(255) NOT NULL,
  `game_type` varchar(255) NOT NULL,
  `game_image` text NOT NULL,
  `game_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_game`
--

INSERT INTO `tb_game` (`id`, `game_code`, `game_name`, `game_provider`, `game_type`, `game_image`, `game_status`) VALUES
(1, 'vs243mwarrior', 'Monkey Warrior', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs243mwarrior.png', '1'),
(2, 'vs20doghouse', 'The Dog House', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20doghouse.png', '1'),
(3, 'vs40pirate', 'Pirate Gold', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40pirate.png', '1'),
(4, 'vs20rhino', 'Great Rhino', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20rhino.png', '1'),
(5, 'vs25pandagold', 'Panda Fortune', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25pandagold.png', '1'),
(6, 'vs4096bufking', 'Buffalo King', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs4096bufking.png', '1'),
(7, 'vs25pyramid', 'Pyramid King', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25pyramid.png', '1'),
(8, 'vs5ultrab', 'Ultra Burn', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs5ultrab.png', '1'),
(9, 'vs5ultra', 'Ultra Hold and Spin', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs5ultra.png', '1'),
(10, 'vs25jokerking', 'Joker King', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25jokerking.png', '1'),
(11, 'vs10returndead', 'Return of the Dead', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10returndead.png', '1'),
(12, 'vs10madame', 'Madame Destiny', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10madame.png', '1'),
(13, 'vs15diamond', 'Diamond Strike', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs15diamond.png', '1'),
(14, 'vs25aztecking', 'Aztec King', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25aztecking.png', '1'),
(15, 'vs25wildspells', 'Wild Spells', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25wildspells.png', '1'),
(16, 'vs10bbbonanza', 'Big Bass Bonanza', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10bbbonanza.png', '1'),
(17, 'vs10cowgold', 'Cowboys Gold', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10cowgold.png', '1'),
(18, 'vs25tigerwar', 'The Tiger Warrior', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25tigerwar.png', '1'),
(19, 'vs25mustang', 'Mustang Gold', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25mustang.png', '1'),
(20, 'vs25hotfiesta', 'Hotfiesta', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25hotfiesta.png', '1'),
(21, 'vs243dancingpar', 'Dance Party', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs243dancingpar.png', '1'),
(22, 'vs576treasures', 'Wild Wild Riches', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs576treasures.png', '1'),
(23, 'vs20hburnhs', 'Hot to Burn Hold and Spin', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20hburnhs.png', '1'),
(24, 'vs20emptybank', 'Empty the Bank', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20emptybank.png', '1'),
(25, 'vs20midas', 'The Hand of Midas', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20midas.png', '1'),
(26, 'vs20olympgate', 'Gates of Olympus', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20olympgate.png', '1'),
(27, 'vswayslight', 'Lucky Lightning', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswayslight.png', '1'),
(28, 'vs20vegasmagic', 'Vegas Magic', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20vegasmagic.png', '1'),
(29, 'vs20fruitparty', 'Fruit Party', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20fruitparty.png', '1'),
(30, 'vs20fparty2', 'Fruit Party 2', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20fparty2.png', '1'),
(31, 'vswaysdogs', 'The Dog House Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysdogs.png', '1'),
(32, 'vs50juicyfr', 'Juicy Fruits', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs50juicyfr.png', '1'),
(33, 'vs25pandatemple', 'Panda Fortune 2', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25pandatemple.png', '1'),
(34, 'vswaysbufking', 'Buffalo King Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysbufking.png', '1'),
(35, 'vs40wildwest', 'Wild West Gold', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40wildwest.png', '1'),
(36, 'vs20chickdrop', 'Chicken Drop', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20chickdrop.png', '1'),
(37, 'vs40spartaking', 'Spartan King', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40spartaking.png', '1'),
(38, 'vswaysrhino', 'Great Rhino Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysrhino.png', '1'),
(39, 'vs20sbxmas', 'Sweet Bonanza Xmas', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20sbxmas.png', '1'),
(40, 'vs10fruity2', 'Extra Juicy', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10fruity2.png', '1'),
(41, 'vs10egypt', 'Ancient Egypt', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10egypt.png', '1'),
(42, 'vs5drhs', 'Dragon Hot Hold and Spin', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs5drhs.png', '1'),
(43, 'vs12bbb', 'Bigger Bass Bonanza', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs12bbb.png', '1'),
(44, 'vs20tweethouse', 'The Tweety House', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20tweethouse.png', '1'),
(45, 'vswayslions', '5 Lions Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswayslions.png', '1'),
(46, 'vswayssamurai', 'Rise of Samurai Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswayssamurai.png', '1'),
(47, 'vs50pixie', 'Pixie Wings', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs50pixie.png', '1'),
(48, 'vs10floatdrg', 'Floating Dragon', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10floatdrg.png', '1'),
(49, 'vs20fruitsw', 'Sweet Bonanza', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20fruitsw.png', '1'),
(50, 'vs20rhinoluxe', 'Great Rhino Deluxe', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20rhinoluxe.png', '1'),
(51, 'vswaysmadame', 'Madame Destiny Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysmadame.png', '1'),
(52, 'vs1024temuj', 'Temujin Treasures', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs1024temuj.png', '1'),
(53, 'vs40pirgold', 'Pirate Gold Deluxe', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40pirgold.png', '1'),
(54, 'vs25mmouse', 'Money Mouse', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25mmouse.png', '1'),
(55, 'vs10threestar', 'Three Star Fortune', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10threestar.png', '1'),
(56, 'vs1ball', 'Lucky Dragon Ball', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs1ball.png', '1'),
(57, 'vs243lionsgold', '5 Lions', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs243lionsgold.png', '1'),
(58, 'vs10egyptcls', 'Ancient Egypt Classic', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10egyptcls.png', '1'),
(59, 'vs25davinci', 'Da Vinci Treasure', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25davinci.png', '1'),
(60, 'vs7776secrets', 'Aztec Treasure', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs7776secrets.png', '1'),
(61, 'vs25wolfgold', 'Wolf Gold', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25wolfgold.png', '1'),
(62, 'vs50safariking', 'Safari King', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs50safariking.png', '1'),
(63, 'vs25peking', 'Peking Luck', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25peking.png', '1'),
(64, 'vs25asgard', 'Asgard', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25asgard.png', '1'),
(65, 'vs25vegas', 'Vegas Nights', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25vegas.png', '1'),
(66, 'vs25scarabqueen', 'John Hunter and the Tomb of the Scarab Queen', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25scarabqueen.png', '1'),
(67, 'vs20starlight', 'Starlight Princess', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20starlight.png', '1'),
(68, 'vs10bookoftut', 'John Hunter and the Book of Tut', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10bookoftut.png', '1'),
(69, 'vs9piggybank', 'Piggy Bank Bills', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs9piggybank.png', '1'),
(70, 'vs5drmystery', 'Dragon Kingdom Mystery', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs5drmystery.png', '1'),
(71, 'vs20eightdragons', 'Eight Dragons', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20eightdragons.png', '1'),
(72, 'vs1024lionsd', '5 Lions Dance', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs1024lionsd.png', '1'),
(73, 'vs25rio', 'Heart of Rio', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25rio.png', '1'),
(74, 'vs10nudgeit', 'Rise of Giza PowerNudge', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10nudgeit.png', '1'),
(75, 'vs10bxmasbnza', 'Christmas Big Bass Bonanza', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10bxmasbnza.png', '1'),
(76, 'vs20santawonder', 'Santas Wonderland', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20santawonder.png', '1'),
(77, 'vs10bblpop', 'Bubble Pop', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10bblpop.png', '1'),
(78, 'vs25btygold', 'Bounty Gold', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25btygold.png', '1'),
(79, 'vs88hockattack', 'Hockey Attack™', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs88hockattack.png', '1'),
(80, 'vswaysbbb', 'Big Bass Bonanza Megaways™', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysbbb.png', '1'),
(81, 'vs10bookfallen', 'Book of the Fallen', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10bookfallen.png', '1'),
(82, 'vs40bigjuan', 'Big Juan', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40bigjuan.png', '1'),
(83, 'vs20bermuda', 'John Hunter and the Quest for Bermuda Riches', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20bermuda.png', '1'),
(84, 'vs10starpirate', 'Star Pirates Code', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10starpirate.png', '1'),
(85, 'vswayswest', 'Mystic Chief', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswayswest.png', '1'),
(86, 'vs20daydead', 'Day of Dead', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20daydead.png', '1'),
(87, 'vs20candvil', 'Candy Village', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20candvil.png', '1'),
(88, 'vs20wildboost', 'Wild Booster', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20wildboost.png', '1'),
(89, 'vswayshammthor', 'Power of Thor Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswayshammthor.png', '1'),
(90, 'vs243lions', '5 Lions', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs243lions.png', '1'),
(91, 'vs5super7', 'Super 7s', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs5super7.png', '1'),
(92, 'vs1masterjoker', 'Master Joker', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs1masterjoker.png', '1'),
(93, 'vs20kraken', 'Release the Kraken', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20kraken.png', '1'),
(94, 'vs10firestrike', 'Fire Strike', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10firestrike.png', '1'),
(95, 'vs243fortune', 'Caishens Gold', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs243fortune.png', '1'),
(96, 'vs20aladdinsorc', 'Aladdin and the Sorcerrer', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20aladdinsorc.png', '1'),
(97, 'vs243fortseren', 'Greek Gods', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs243fortseren.png', '1'),
(98, 'vs25chilli', 'Chilli Heat', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25chilli.png', '1'),
(99, 'vs8magicjourn', 'Magic Journey', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs8magicjourn.png', '1'),
(100, 'vs20leprexmas', 'Leprechaun Carol', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20leprexmas.png', '1'),
(101, 'vs7pigs', '7 Piggies', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs7pigs.png', '1'),
(102, 'vs243caishien', 'Caishens Cash', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs243caishien.png', '1'),
(103, 'vs5joker', 'Jokers Jewels', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs5joker.png', '1'),
(104, 'vs25gladiator', 'Wild Gladiator', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25gladiator.png', '1'),
(105, 'vs25goldpig', 'Golden Pig', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25goldpig.png', '1'),
(106, 'vs25goldrush', 'Gold Rush', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25goldrush.png', '1'),
(107, 'vs25dragonkingdom', 'Dragon Kingdom', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25dragonkingdom.png', '1'),
(108, 'vs1dragon8', '888 Dragons', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs1dragon8.png', '1'),
(109, 'vs5aztecgems', 'Aztec Gems', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs5aztecgems.png', '1'),
(110, 'vs20hercpeg', 'Hercules and Pegasus', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20hercpeg.png', '1'),
(111, 'vs7fire88', 'Fire 88', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs7fire88.png', '1'),
(112, 'vs20honey', 'Honey Honey Honey', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20honey.png', '1'),
(113, 'vs25safari', 'Hot Safari', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25safari.png', '1'),
(114, 'vs25journey', 'Journey to the West', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25journey.png', '1'),
(115, 'vs20chicken', 'The Great Chicken Escape', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20chicken.png', '1'),
(116, 'vs1fortunetree', 'Tree of Riches', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs1fortunetree.png', '1'),
(117, 'vs20wildpix', 'Wild Pixies', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20wildpix.png', '1'),
(118, 'vs15fairytale', 'Fairytale Fortune', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs15fairytale.png', '1'),
(119, 'vs20santa', 'Santa', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20santa.png', '1'),
(120, 'vs10vampwolf', 'Vampires vs Wolves', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10vampwolf.png', '1'),
(121, 'vs50aladdin', '3 Genie Wishes', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs50aladdin.png', '1'),
(122, 'vs50hercules', 'Hercules Son of Zeus', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs50hercules.png', '1'),
(123, 'vs7776aztec', 'Aztec Bonanza', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs7776aztec.png', '1'),
(124, 'vs5trdragons', 'Triple Dragons', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs5trdragons.png', '1'),
(125, 'vs40madwheel', 'The Wild Machine', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40madwheel.png', '1'),
(126, 'vs25newyear', 'Lucky New Year', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25newyear.png', '1'),
(127, 'vs40frrainbow', 'Fruit Rainbow', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40frrainbow.png', '1'),
(128, 'vs50kingkong', 'Mighty Kong', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs50kingkong.png', '1'),
(129, 'vs20godiva', 'Lady Godiva', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20godiva.png', '1'),
(130, 'vs9madmonkey', 'Monkey Madness', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs9madmonkey.png', '1'),
(131, 'vs1tigers', 'Triple Tigers', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs1tigers.png', '1'),
(132, 'vs9chen', 'Master Chens Fortune', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs9chen.png', '1'),
(133, 'vs5hotburn', 'Hot to burn', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs5hotburn.png', '1'),
(134, 'vs25dwarves_new', 'Dwarven Gold Deluxe', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25dwarves_new.png', '1'),
(135, 'vs25sea', 'Great Reef', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25sea.png', '1'),
(136, 'vs20leprechaun', 'Leprechaun Song', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20leprechaun.png', '1'),
(137, 'vs7monkeys', '7 Monkeys', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs7monkeys.png', '1'),
(138, 'vs50chinesecharms', 'Lucky Dragons', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs50chinesecharms.png', '1'),
(139, 'vs18mashang', 'Treasure Horse', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs18mashang.png', '1'),
(140, 'vs5spjoker', 'Super Joker', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs5spjoker.png', '1'),
(141, 'vs20egypttrs', 'Egyptian Fortunes', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20egypttrs.png', '1'),
(142, 'vs25queenofgold', 'Queen of Gold', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25queenofgold.png', '1'),
(143, 'vs9hotroll', 'Hot Chilli', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs9hotroll.png', '1'),
(144, 'vs4096jurassic', 'Jurassic Giants', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs4096jurassic.png', '1'),
(145, 'vs3train', 'Gold Train', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs3train.png', '1'),
(146, 'vs40beowulf', 'Beowulf', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40beowulf.png', '1'),
(147, 'vs20bl', 'Busy Bees', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20bl.png', '1'),
(148, 'vs1money', 'Money Money Money', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs1money.png', '1'),
(149, 'vs1600drago', 'Drago - Jewels of Fortune', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs1600drago.png', '1'),
(150, 'vs1fufufu', 'Fu Fu Fu', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs1fufufu.png', '1'),
(151, 'vs40streetracer', 'Street Racer', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40streetracer.png', '1'),
(152, 'vs9aztecgemsdx', 'Aztec Gems Deluxe', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs9aztecgemsdx.png', '1'),
(153, 'vs20gorilla', 'Jungle Gorilla', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20gorilla.png', '1'),
(154, 'vswayswerewolf', 'Curse of the Werewolf Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswayswerewolf.png', '1'),
(155, 'vswayshive', 'Star Bounty', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswayshive.png', '1'),
(156, 'vs25samurai', 'Rise of Samurai', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25samurai.png', '1'),
(157, 'vs25walker', 'Wild Walker', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25walker.png', '1'),
(158, 'vs20goldfever', 'Gems Bonanza', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20goldfever.png', '1'),
(159, 'vs25bkofkngdm', 'Book of Kingdoms', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25bkofkngdm.png', '1'),
(160, 'vs10goldfish', 'Fishin Reels', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10goldfish.png', '1'),
(161, 'vs1024dtiger', 'The Dragon Tiger', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs1024dtiger.png', '1'),
(162, 'vs20xmascarol', 'Christmas Carol Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20xmascarol.png', '1'),
(163, 'vs10mayangods', 'John Hunter and the Mayan Gods', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10mayangods.png', '1'),
(164, 'vs20bonzgold', 'Bonanza Gold', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20bonzgold.png', '1'),
(165, 'vs40voodoo', 'Voodoo Magic', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40voodoo.png', '1'),
(166, 'vs25gldox', 'Golden Ox', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25gldox.png', '1'),
(167, 'vs10wildtut', 'Mysterious Egypt', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10wildtut.png', '1'),
(168, 'vs10eyestorm', 'Eye of the Storm', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10eyestorm.png', '1'),
(169, 'vs117649starz', 'Starz Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs117649starz.png', '1'),
(170, 'vs10amm', 'The Amazing Money Machine', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10amm.png', '1'),
(171, 'vs20magicpot', 'The Magic Cauldron - Enchanted Brew', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20magicpot.png', '1'),
(172, 'vswayselements', 'Elemental Gems Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswayselements.png', '1'),
(173, 'vswayschilheat', 'Chilli Heat Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswayschilheat.png', '1'),
(174, 'vs10luckcharm', 'Lucky Grace And Charm', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10luckcharm.png', '1'),
(175, 'vswaysaztecking', 'Aztec King Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysaztecking.png', '1'),
(176, 'vs20phoenixf', 'Phoenix Forge', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20phoenixf.png', '1'),
(177, 'vs576hokkwolf', 'Hokkaido Wolf', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs576hokkwolf.png', '1'),
(178, 'vs20trsbox', 'Treasure Wild', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20trsbox.png', '1'),
(179, 'vs243chargebull', 'Raging Bull', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs243chargebull.png', '1'),
(180, 'vswaysbankbonz', 'Cash Bonanza', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysbankbonz.png', '1'),
(181, 'vs20pbonanza', 'Pyramid Bonanza', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20pbonanza.png', '1'),
(182, 'vs243empcaishen', 'Emperor Caishen', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs243empcaishen.png', '1'),
(183, 'vs25tigeryear', 'New Year Tiger Treasures ™', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25tigeryear.png', '1'),
(184, 'vs20amuleteg', 'Fortune of Giza™', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20amuleteg.png', '1'),
(185, 'vs10runes', 'Gates of Valhalla™', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10runes.png', '1'),
(186, 'vs25goldparty', 'Gold Party®', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25goldparty.png', '1'),
(187, 'vswaysxjuicy', 'Extra Juicy Megaways™', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysxjuicy.png', '1'),
(188, 'vs40wanderw', 'Wild Depths™', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40wanderw.png', '1'),
(189, 'vs4096magician', 'Magicians Secrets™', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs4096magician.png', '1'),
(190, 'vs20smugcove', 'Smugglers Cove™', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20smugcove.png', '1'),
(191, 'vswayscryscav', 'Crystal Caverns Megaways™', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswayscryscav.png', '1'),
(192, 'vs20superx', 'Super X™', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20superx.png', '1'),
(193, 'vs20rockvegas', 'Rock Vegas Mega Hold & Spin', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20rockvegas.png', '1'),
(194, 'vs25copsrobbers', 'Cash Patrol', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25copsrobbers.png', '1'),
(195, 'vs20colcashzone', 'Colossal Cash Zone', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20colcashzone.png', '1'),
(196, 'vs20ultim5', 'The Ultimate 5', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20ultim5.png', '1'),
(197, 'vs20bchprty', 'Wild Beach Party', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20bchprty.png', '1'),
(198, 'vs10bookazteck', 'Book of Aztec King', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10bookazteck.png', '1'),
(199, 'vs50mightra', 'Might of Ra', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs50mightra.png', '1'),
(200, 'vs25bullfiesta', 'Bull Fiesta', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25bullfiesta.png', '1'),
(201, 'vs20rainbowg', 'Rainbow Gold', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20rainbowg.png', '1'),
(202, 'vs10tictac', 'Tic Tac Take', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10tictac.png', '1'),
(203, 'vs243discolady', 'Disco Lady', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs243discolady.png', '1'),
(204, 'vs243queenie', 'Queenie', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs243queenie.png', '1'),
(205, 'vs20farmfest', 'Barn Festival', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20farmfest.png', '1'),
(206, 'vs10chkchase', 'Chicken Chase', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10chkchase.png', '1'),
(207, 'vswayswildwest', 'Wild West Gold Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswayswildwest.png', '1'),
(208, 'vs20mustanggld2', 'Clover Gold', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20mustanggld2.png', '1'),
(209, 'vs20drtgold', 'Drill That Gold', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20drtgold.png', '1'),
(210, 'vs10spiritadv', 'Spirit of Adventure', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10spiritadv.png', '1'),
(211, 'vs10firestrike2', 'Fire Strike 2', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10firestrike2.png', '1'),
(212, 'vs40cleoeye', 'Eye of Cleopatra', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40cleoeye.png', '1'),
(213, 'vs20gobnudge', 'Goblin Heist Powernudge', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20gobnudge.png', '1'),
(214, 'vs20stickysymbol', 'The Great Stick-up', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20stickysymbol.png', '1'),
(215, 'vswayszombcarn', 'Zombie Carnival', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswayszombcarn.png', '1'),
(216, 'vs50northgard', 'North Guardians', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs50northgard.png', '1'),
(217, 'vs20sugarrush', 'Sugar Rush', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20sugarrush.png', '1'),
(218, 'vs20cleocatra', 'Cleocatra', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20cleocatra.png', '1'),
(219, 'vs5littlegem', 'Little Gem Hold and Spin', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs5littlegem.png', '1'),
(220, 'vs10egrich', 'Queen of Gods', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10egrich.png', '1'),
(221, 'vs243koipond', 'Koi Pond', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs243koipond.png', '1'),
(222, 'vs40samurai3', 'Rise of Samurai 3', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40samurai3.png', '1'),
(223, 'vs40cosmiccash', 'Cosmic Cash', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40cosmiccash.png', '1'),
(224, 'vs25bomb', 'Bomb Bonanza', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25bomb.png', '1'),
(225, 'vs1024mahjpanda', 'Mahjong Panda', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs1024mahjpanda.png', '1'),
(226, 'vs10coffee', 'Coffee Wild', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10coffee.png', '1'),
(227, 'vs100sh', 'Shining Hot 100', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs100sh.png', '1'),
(228, 'vs20sh', 'Shining Hot 20', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20sh.png', '1'),
(229, 'vs40sh', 'Shining Hot 40', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40sh.png', '1'),
(230, 'vs5sh', 'Shining Hot 5', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs5sh.png', '1'),
(231, 'vswaysjkrdrop', 'Tropical Tiki', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysjkrdrop.png', '1'),
(232, 'vs243ckemp', 'Cheeky Emperor', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs243ckemp.png', '1'),
(233, 'vs40hotburnx', 'Hot To Burn Extreme', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40hotburnx.png', '1'),
(234, 'vs1024gmayhem', 'Gorilla Mayhem', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs1024gmayhem.png', '1'),
(235, 'vs20octobeer', 'Octobeer Fortunes', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20octobeer.png', '1'),
(236, 'vs10txbigbass', 'Big Bass Splash', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10txbigbass.png', '1'),
(237, 'vs100firehot', 'Fire Hot 100', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs100firehot.png', '1'),
(238, 'vs20fh', 'Fire Hot 20', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20fh.png', '1'),
(239, 'vs40firehot', 'Fire Hot 40', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40firehot.png', '1'),
(240, 'vs5firehot', 'Fire Hot 5', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs5firehot.png', '1'),
(241, 'vs20wolfie', 'Greedy Wolf', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20wolfie.png', '1'),
(242, 'vs20underground', 'Down the Rails', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20underground.png', '1'),
(243, 'vs10mmm', 'Magic Money Maze', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10mmm.png', '1'),
(244, 'vswaysfltdrg', 'Floating Dragon Hold & Spin Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysfltdrg.png', '1'),
(245, 'vs20trswild2', 'Black Bull', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20trswild2.png', '1'),
(246, 'vswaysstrwild', 'Candy Stars', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysstrwild.png', '1'),
(247, 'vs10crownfire', 'Crown of Fire', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10crownfire.png', '1'),
(248, 'vs20muertos', 'Muertos Multiplier Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20muertos.png', '1'),
(249, 'vswayslofhero', 'Legend of Heroes', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswayslofhero.png', '1'),
(250, 'vs5strh', 'Striking Hot 5', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs5strh.png', '1'),
(251, 'vs10snakeeyes', 'Snakes & Ladders - Snake Eyes', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10snakeeyes.png', '1'),
(252, 'vswaysbook', 'Book of Golden Sands', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysbook.png', '1'),
(253, 'vs20mparty', 'Wild Hop and Drop', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20mparty.png', '1'),
(254, 'vs20swordofares', 'Sword of Ares', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20swordofares.png', '1'),
(255, 'vswaysfrywld', 'Spin & Score Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysfrywld.png', '1'),
(256, 'vswaysconcoll', 'Sweet PowerNudge™', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysconcoll.png', '1'),
(257, 'vs20lcount', 'Gems of Serengeti™', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20lcount.png', '1'),
(258, 'vs20sparta', 'Shield of Sparta', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20sparta.png', '1'),
(259, 'vs10bbkir', 'Big Bass Bonanza Keeping it Reel', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10bbkir.png', '1'),
(260, 'vswayspizza', 'Pizza Pizza Pizza', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswayspizza.png', '1'),
(261, 'vs20dugems', 'Hot Pepper™', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20dugems.png', '1'),
(262, 'vs20clspwrndg', 'Sweet PowerNudge', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20clspwrndg.png', '1'),
(263, 'vswaysfuryodin', 'Fury of Odin Megaways™', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysfuryodin.png', '1'),
(264, 'vs20sugarcoins', 'Viking Forge', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20sugarcoins.png', '1'),
(265, 'vs20olympgrace', 'Grace of Ebisu', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20olympgrace.png', '1'),
(266, 'vs20starlightx', 'Starlight Princess 1000', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20starlightx.png', '1'),
(267, 'vswaysmoneyman', 'The Money Men Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysmoneyman.png', '1'),
(268, 'vs40demonpots', 'Demon Pots', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40demonpots.png', '1'),
(269, 'vswaystut', 'John Hunter and the Book of Tut Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaystut.png', '1'),
(270, 'vs10gdchalleng', '8 Golden Dragon Challenge', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10gdchalleng.png', '1'),
(271, 'vs20yisunshin', 'Yi Sun Shin', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20yisunshin.png', '1'),
(272, 'vs20candyblitz', 'Candy Blitz', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20candyblitz.png', '1'),
(273, 'vswaysstrlght', 'Fortunes of Aztec', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysstrlght.png', '1'),
(274, 'vs40infwild', 'Infective Wild', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40infwild.png', '1'),
(275, 'vs20gravity', 'Gravity Bonanza', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20gravity.png', '1'),
(276, 'vs40rainbowr', 'Rainbow Reels', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs40rainbowr.png', '1'),
(277, 'vs20bnnzdice', 'Sweet Bonanza Dice', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20bnnzdice.png', '1'),
(278, 'vs10bhallbnza', 'Big Bass Halloween', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10bhallbnza.png', '1'),
(279, 'vswaysraghex', 'Tundras Fortune', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysraghex.png', '1'),
(280, 'vs20maskgame', 'Cash Chips', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20maskgame.png', '1'),
(281, 'vs5gemstone', 'Gemstone', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs5gemstone.png', '1'),
(282, 'vs1024mahjwins', 'Mahjong Wins', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs1024mahjwins.png', '1'),
(283, 'vs20procount', 'Wisdom of Athena', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20procount.png', '1'),
(284, 'vs20forge', 'Forge of Olympus', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20forge.png', '1'),
(285, 'vswaysbbhas', 'Big Bass Hold & Spinner Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysbbhas.png', '1'),
(286, 'vs20earthquake', 'Cyclops Smash', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20earthquake.png', '1'),
(287, 'vs20saiman', 'Saiyan Mania', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20saiman.png', '1'),
(288, 'vs20piggybank', 'Piggy Bankers', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20piggybank.png', '1'),
(289, 'vs20lvlup', 'Pub Kings', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20lvlup.png', '1'),
(290, 'vs10trail', 'Mustang Trail', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10trail.png', '1'),
(291, 'vs20supermania', 'Supermania', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20supermania.png', '1'),
(292, 'vs50dmdcascade', 'Diamond Cascade', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs50dmdcascade.png', '1'),
(293, 'vs20lobcrab', 'Lobster Bobs Crazy Crab Shack', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20lobcrab.png', '1'),
(294, 'vs20wildparty', '3 Buzzing Wilds', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20wildparty.png', '1'),
(295, 'vs20doghousemh', 'The Dog House Multihold', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20doghousemh.png', '1'),
(296, 'vs20splmystery', 'Spellbinding Mystery', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20splmystery.png', '1'),
(297, 'vs20cashmachine', 'Cash Box', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20cashmachine.png', '1'),
(298, 'vs50jucier', 'Sky Bounty', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs50jucier.png', '1'),
(299, 'vs243nudge4gold', 'Hellvis Wild', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs243nudge4gold.png', '1'),
(300, 'vs25jokrace', 'Joker Race', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25jokrace.png', '1'),
(301, 'vs20hstgldngt', 'Heist for the Golden Nuggets', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20hstgldngt.png', '1'),
(302, 'vs20beefed', 'Fat Panda', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20beefed.png', '1'),
(303, 'vs20jewelparty', 'Jewel Rush', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20jewelparty.png', '1'),
(304, 'vs9outlaw', 'Pirates Pub', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs9outlaw.png', '1'),
(305, 'vswaysfrbugs', 'Frogs & Bugs', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysfrbugs.png', '1'),
(306, 'vs20lampinf', 'Lamp Of Infinity', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20lampinf.png', '1'),
(307, 'vs4096robber', 'Robber Strike', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs4096robber.png', '1'),
(308, 'vs10fdrasbf', 'Floating Dragon - Dragon Boat Festival', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10fdrasbf.png', '1'),
(309, 'vs20clustwild', 'Sticky Bees', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20clustwild.png', '1'),
(310, 'vs25spotz', 'Knight Hot Spotz', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25spotz.png', '1'),
(311, 'vs20excalibur', 'Excalibur Unleashed', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20excalibur.png', '1'),
(312, 'vs20stickywild', 'Wild Bison Charge', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20stickywild.png', '1'),
(313, 'vs25holiday', 'Holiday Ride', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25holiday.png', '1'),
(314, 'vs20mvwild', 'Jasmine Dreams', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20mvwild.png', '1'),
(315, 'vs10kingofdth', 'Kingdom of the Dead', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10kingofdth.png', '1'),
(316, 'vswaysultrcoin', 'Cowboy Coins', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysultrcoin.png', '1'),
(317, 'vs10gizagods', 'Gods of Giza', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10gizagods.png', '1'),
(318, 'vswaysrsm', 'Wild Celebrity Bus Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysrsm.png', '1'),
(319, 'vswaysmonkey', '3 Dancing Monkeys', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysmonkey.png', '1'),
(320, 'vs20hotzone', 'African Elephant', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20hotzone.png', '1'),
(321, 'vs10bbhas', 'Big Bass - Hold & Spinner', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10bbhas.png', '1'),
(322, 'vs1024moonsh', 'Moonshot', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs1024moonsh.png', '1'),
(323, 'vswaysredqueen', 'The Red Queen', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysredqueen.png', '1'),
(324, 'vs20framazon', 'Fruits of the Amazon', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20framazon.png', '1'),
(325, 'vs20sknights', 'The Knight King', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20sknights.png', '1'),
(326, 'vs20goldclust', 'Rabbit Garden', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20goldclust.png', '1'),
(327, 'vswaysmorient', 'Mystery of the Orient', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysmorient.png', '1'),
(328, 'vs10powerlines', 'Peak Power', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10powerlines.png', '1'),
(329, 'vs12tropicana', 'Club Tropicana', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs12tropicana.png', '1'),
(330, 'vs25archer', 'Fire Archer', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25archer.png', '1'),
(331, 'vs20gatotfury', 'Gatot Kacas Fury', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20gatotfury.png', '1'),
(332, 'vs20mochimon', 'Mochimon', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20mochimon.png', '1'),
(333, 'vs10fisheye', 'Fish Eye', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs10fisheye.png', '1'),
(334, 'vs20superlanche', 'Monster Superlanche', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20superlanche.png', '1'),
(335, 'vswaysftropics', 'Frozen Tropics', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysftropics.png', '1'),
(336, 'vswaysincwnd', 'Gold Oasis', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysincwnd.png', '1'),
(337, 'vs25spgldways', 'Secret City Gold', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs25spgldways.png', '1'),
(338, 'SGReturnToTheFeature', 'Return to the Future', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGReturnToTheFeature_ko-KR.png', '1'),
(339, 'SGTabernaDeLosMuertosUltra', 'Tevena de los Muirtos Ultra', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGTabernaDeLosMuertosUltra_ko-KR.png', '1'),
(340, 'SGTotemTowers', 'Totem towers', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGTotemTowers_ko-KR.png', '1'),
(341, 'SGChristmasGiftRush', 'Christmas Kipoot Rush', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGChristmasGiftRush_ko-KR.png', '1'),
(342, 'SGOrbsOfAtlantis', 'Overs of Atlantis', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGOrbsOfAtlantis_ko-KR.png', '1'),
(343, 'SGBeforeTimeRunsOut', 'Before Time Runner Out', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGBeforeTimeRunsOut_ko-KR.png', '1'),
(344, 'SGTechnoTumble', 'Techno tumble', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGTechnoTumble_ko-KR.png', '1'),
(345, 'SGWealthInn', 'Wells Inn', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGWealthInn_ko-KR.png', '1'),
(346, 'SGHappyApe', 'Happy ape', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGHappyApe_ko-KR.png', '1'),
(347, 'SGTabernaDeLosMuertos', 'Tevena di los Muertos', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGTabernaDeLosMuertos_ko-KR.png', '1'),
(348, 'SGNaughtySanta', 'Notty Santa', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGNaughtySanta_ko-KR.png', '1'),
(349, 'SGFaCaiShenDeluxe', 'Pakai Sen Deluxe', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGFaCaiShenDeluxe_ko-KR.png', '1'),
(350, 'SGHeySushi', 'Hey sushi', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGHeySushi_ko-KR.png', '1'),
(351, 'SGKnockoutFootballRush', 'Knockout football rush', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGKnockoutFootballRush_ko-KR.png', '1'),
(352, 'SGColossalGems', 'Closal Gems', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGColossalGems_ko-KR.png', '1'),
(353, 'SGHotHotHalloween', 'hot hot halloween', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGHotHotHalloween_ko-KR.png', '1'),
(354, 'SGLuckyFortuneCat', 'Lucky fortune cat', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGLuckyFortuneCat_ko-KR.png', '1'),
(355, 'SGHotHotFruit', 'hot hot fruit', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGHotHotFruit_ko-KR.png', '1'),
(356, 'SGMountMazuma', 'Mount Majuma', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGMountMazuma_ko-KR.png', '1'),
(357, 'SGWildTrucks', 'Wild Trucks', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGWildTrucks_ko-KR.png', '1'),
(358, 'SGLuckyLucky', 'Lucky Lucky', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGLuckyLucky_ko-KR.png', '1'),
(359, 'SGKnockoutFootball', 'Knockout football', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGKnockoutFootball_ko-KR.png', '1'),
(360, 'SGJump', 'Jump!', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGJump_ko-KR.png', '1'),
(361, 'SGPumpkinPatch', 'Pumpkin patch', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGPumpkinPatch_ko-KR.png', '1'),
(362, 'SGWaysOfFortune', 'Way of Fortune', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGWaysOfFortune_ko-KR.png', '1'),
(363, 'SGFourDivineBeasts', 'For Devine Beasts', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGFourDivineBeasts_ko-KR.png', '1'),
(364, 'SGPandaPanda', 'Panda panda', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGPandaPanda_ko-KR.png', '1'),
(365, 'SGOceansCall', 'Oceans Call', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGOceansCall_ko-KR.png', '1'),
(366, 'SGScruffyScallywags', 'Scruffy Skellywex', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGScruffyScallywags_ko-KR.png', '1'),
(367, 'SGNuwa', 'Nuwa', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGNuwa_ko-KR.png', '1'),
(368, 'SGTheKoiGate', 'Koi gate', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGTheKoiGate_ko-KR.png', '1'),
(369, 'SGFaCaiShen', 'Pacaishen', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGFaCaiShen_ko-KR.png', '1'),
(370, 'SG12Zodiacs', '12 zodiacs', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SG12Zodiacs_ko-KR.png', '1'),
(371, 'SGFireRooster', 'Fire rooster', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGFireRooster_ko-KR.png', '1'),
(372, 'SGFenghuang', 'Phoenix', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGFenghuang_ko-KR.png', '1');
INSERT INTO `tb_game` (`id`, `game_code`, `game_name`, `game_provider`, `game_type`, `game_image`, `game_status`) VALUES
(373, 'SGBirdOfThunder', 'Bird of Thunder', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGBirdOfThunder_ko-KR.png', '1'),
(374, 'SGTheDeadEscape', 'The Dead Escape', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGTheDeadEscape_ko-KR.png', '1'),
(375, 'SGBombsAway', 'Bombs Away', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGBombsAway_ko-KR.png', '1'),
(376, 'SGGoldRush', 'Gold rush', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGGoldRush_ko-KR.png', '1'),
(377, 'SGRuffledUp', 'Ruffled up', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGRuffledUp_ko-KR.png', '1'),
(378, 'SGRomanEmpire', 'Roman empire', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGRomanEmpire_ko-KR.png', '1'),
(379, 'SGCoyoteCrash', 'Coyote crash', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGCoyoteCrash_ko-KR.png', '1'),
(380, 'SGWickedWitch', 'Wickt Location', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGWickedWitch_ko-KR.png', '1'),
(381, 'SGDragonsThrone', 'Dragons Throne', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGDragonsThrone_ko-KR.png', '1'),
(382, 'SGBuggyBonus', 'Buggy bonus', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGBuggyBonus_ko-KR.png', '1'),
(383, 'SGGlamRock', 'Glam rock', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGGlamRock_ko-KR.png', '1'),
(384, 'SGSuperTwister', 'Super twister', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGSuperTwister_ko-KR.png', '1'),
(385, 'SGKanesInferno', 'Keynes Inferno', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGKanesInferno_ko-KR.png', '1'),
(386, 'SGTreasureTomb', 'Treasure Tomb', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGTreasureTomb_ko-KR.png', '1'),
(387, 'SGJugglenaut', 'Jugglenut', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGJugglenaut_ko-KR.png', '1'),
(388, 'SGGalacticCash', 'Glactic Cash', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGGalacticCash_ko-KR.png', '1'),
(389, 'SGZeus2', 'Zeus 2', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGZeus2_ko-KR.png', '1'),
(390, 'SGTheDragonCastle', 'Dragon castle', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGTheDragonCastle_ko-KR.png', '1'),
(391, 'SGKingTutsTomb', 'King Teeth Tomb', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGKingTutsTomb_ko-KR.png', '1'),
(392, 'SGCarnivalCash', 'Carnival cash', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGCarnivalCash_ko-KR.png', '1'),
(393, 'SGTreasureDiver', 'Treasure diver', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGTreasureDiver_ko-KR.png', '1'),
(394, 'SGLittleGreenMoney', 'Little Green Money', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGLittleGreenMoney_ko-KR.png', '1'),
(395, 'SGMonsterMashCash', 'Monster Mash Cash', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGMonsterMashCash_ko-KR.png', '1'),
(396, 'SGShaolinFortunes100', 'Xiaolin Fortune 100', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGShaolinFortunes100_ko-KR.png', '1'),
(397, 'SGShaolinFortunes243', 'Xiaolin Fortune', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGShaolinFortunes243_ko-KR.png', '1'),
(398, 'SGWeirdScience', 'Weird Science', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGWeirdScience_ko-KR.png', '1'),
(399, 'SGBlackbeardsBounty', 'Blackbeards Bounty', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGBlackbeardsBounty_ko-KR.png', '1'),
(400, 'SGDrFeelgood', 'Dr. Feelgood', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGDrFeelgood_ko-KR.png', '1'),
(401, 'SGVikingsPlunder', 'Vikings plunder', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGVikingsPlunder_ko-KR.png', '1'),
(402, 'SGDoubleODollars', 'Double O Dollars', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGDoubleODollars_ko-KR.png', '1'),
(403, 'SGSpaceFortune', 'Space fortune', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGSpaceFortune_ko-KR.png', '1'),
(404, 'SGPamperMe', 'Pamper me', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGPamperMe_ko-KR.png', '1'),
(405, 'SGZeus', 'Zeus', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGZeus_ko-KR.png', '1'),
(406, 'SGSOS', 'S.O.S.!', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGSOS_ko-KR.png', '1'),
(407, 'SGPoolShark', 'Full shark', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGPoolShark_ko-KR.png', '1'),
(408, 'SGEgyptianDreams', 'Egyptian Dreams', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGEgyptianDreams_ko-KR.png', '1'),
(409, 'SGBarnstormerBucks', 'Barnstormer Bucks', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGBarnstormerBucks_ko-KR.png', '1'),
(410, 'SGSuperStrike', 'Super strike', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGSuperStrike_ko-KR.png', '1'),
(411, 'SGJungleRumble', 'Jungle rumble', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGJungleRumble_ko-KR.png', '1'),
(412, 'SGArcticWonders', 'Arctic Wonders', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGArcticWonders_ko-KR.png', '1'),
(413, 'SGTowerOfPizza', 'Tower of Pizza', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGTowerOfPizza_ko-KR.png', '1'),
(414, 'SGMummyMoney', 'Mummy money', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGMummyMoney_ko-KR.png', '1'),
(415, 'SGBikiniIsland', 'bikini island', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGBikiniIsland_ko-KR.png', '1'),
(416, 'SGQueenOfQueens1024', 'Queen of Queens II', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGQueenOfQueens1024_ko-KR.png', '1'),
(417, 'SGDragonsRealm', 'Dragons Realm', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGDragonsRealm_ko-KR.png', '1'),
(418, 'SGAllForOne', 'All for one', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGAllForOne_ko-KR.png', '1'),
(419, 'SGFlyingHigh', 'Flying high', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGFlyingHigh_ko-KR.png', '1'),
(420, 'SGMrBling', 'Mr. Bling', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGMrBling_ko-KR.png', '1'),
(421, 'SGMysticFortune', 'Mystic Fortune', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGMysticFortune_ko-KR.png', '1'),
(422, 'SGPuckerUpPrince', 'Funker up prince', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGPuckerUpPrince_ko-KR.png', '1'),
(423, 'SGSirBlingalot', 'Bring it all', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGSirBlingalot_ko-KR.png', '1'),
(424, 'SGCashReef', 'Cash leaf', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGCashReef_ko-KR.png', '1'),
(425, 'SGQueenOfQueens243', 'Queen of queens', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGQueenOfQueens243_ko-KR.png', '1'),
(426, 'SGRideEmCowboy', 'Lytham Cowboy (Pick Game)', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGRideEmCowboy_ko-KR.png', '1'),
(427, 'SGGrapeEscape', 'The Graph Escape', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGGrapeEscape_ko-KR.png', '1'),
(428, 'SGGoldenUnicorn', 'Golden unicorn', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGGoldenUnicorn_ko-KR.png', '1'),
(429, 'SGFrontierFortunes', 'Frontier Fortune', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGFrontierFortunes_ko-KR.png', '1'),
(430, 'SGIndianCashCatcher', 'Indian Cash Catcher', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGIndianCashCatcher_ko-KR.png', '1'),
(431, 'SGSkysTheLimit', 'Skys the Limit', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGSkysTheLimit_ko-KR.png', '1'),
(432, 'SGTheBigDeal', 'The Big Deal', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGTheBigDeal_ko-KR.png', '1'),
(433, 'SGCashosaurus', 'Cashosaurus', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGCashosaurus_ko-KR.png', '1'),
(434, 'SGDiscoFunk', 'Disco funk', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGDiscoFunk_ko-KR.png', '1'),
(435, 'SGCalaverasExplosivas', 'Calaveras Explociba', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGCalaverasExplosivas_ko-KR.png', '1'),
(436, 'SGNewYearsBash', 'New Year Bessie', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGNewYearsBash_ko-KR.png', '1'),
(437, 'SGNineTails', 'Nine Tales', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGNineTails_ko-KR.png', '1'),
(438, 'SGMysticFortuneDeluxe', 'Mystic Fortune Deluxe', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGMysticFortuneDeluxe_ko-KR.png', '1'),
(439, 'SGLuckyDurian', 'Lucky durian', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGLuckyDurian_ko-KR.png', '1'),
(440, 'SGDiscoBeats', 'Disco beat', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGDiscoBeats_ko-KR.png', '1'),
(441, 'SGLanternLuck', 'Lantern lucky', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGLanternLuck_ko-KR.png', '1'),
(442, 'sun_of_egypt', 'SUN OF EGYPT', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_173_en.jpe?ts=1573550830337', '1'),
(443, 'sun_of_egypt_2', 'SUN OF EGYPT 2', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_202_en.jpg?ts=1602582288012', '1'),
(444, 'happy_fish', 'HAPPY FISH', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_261_en.jpg?ts=1644912611364', '1'),
(445, 'queen_of_the_sun', 'QUEEN OF THE SUN', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_256_en.jpg?ts=1643099409287', '1'),
(446, 'tiger_jungle', 'TIGER JUNGLE', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_242_en.jpg?ts=1630999887216', '1'),
(447, 'black_wolf', 'BLACK WOLF', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_254_en.jpg?ts=1637589465054', '1'),
(448, 'hit_the_gold', 'HIT THE GOLD', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_228_en.jpg?ts=1621873173151', '1'),
(449, 'candy_boom', 'CANDY BOOM', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_250_en.jpg?ts=1635783617393', '1'),
(450, 'scarab_riches', 'SCARAB RICHES', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_168_en.jpe?ts=1568115171958', '1'),
(451, 'golden_dancing_lion', 'GOLDEN DANCING LION', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_252_en.jpg?ts=1637050697146', '1'),
(452, 'dragon_pearls', 'DRAGON PEARLS', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_151_en.jpeg?ts=1551785453936', '1'),
(453, '3_coins', '3 COINS', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_212_en.jpg?ts=1610363762913', '1'),
(454, 'super_rich_god', 'SUPER RICH GOD', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_217_en.jpg?ts=1614080397964', '1'),
(455, '15_dragon_pearls', '15 DRAGON PEARLS', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_197_en.jpeg?ts=1597062411022', '1'),
(456, 'aztec_sun', 'AZTEC SUN', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_187_en.jpe?ts=1591699656458', '1'),
(457, 'scarab_temple', 'SCARAB TEMPLE', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_201_en.jpeg?ts=1601369529833', '1'),
(458, 'gods_temple_deluxe', 'GODS TEMPLE DELUXE', 'BOOONGO', 'slot', 'https://static.bng.games/static/games/banner_86_en.png', '1'),
(459, 'book_of_sun', 'BOOK OF SUN', 'BOOONGO', 'slot', 'https://static.bng.games/static/games/banner_139_en.jpg', '1'),
(460, '777_gems', '777 GEMS', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_148_en.jpeg', '1'),
(461, 'book_of_sun_multichance', 'BOOK OF SUN MULTICHANCE', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_157_en.jpg?ts=1557834927593', '1'),
(462, 'olympian_gods', 'OLYMPIAN GODS', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_166_en.jpeg?ts=1565181937129', '1'),
(463, '777_gems_respin', '777 GEMS RESPIN', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_175_en.jpg?ts=1575289527907', '1'),
(464, 'tigers_gold', 'TIGERS GOLD', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_178_en.jpe?ts=1580204919370', '1'),
(465, 'moon_sisters', 'MOON SISTERS', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_183_en.jpg?ts=1589276977044', '1'),
(466, 'book_of_sun_choice', 'BOOK OF SUN CHOICE', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_184_en.jpg?ts=1586766763403', '1'),
(467, 'super_marble', 'SUPER MARBLE', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_189_en.jpg?ts=1592834985255', '1'),
(468, 'buddha_fortune', 'BUDDHA FORTUNE', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_190_en.jpg?ts=1594723112381', '1'),
(469, 'great_panda', 'GREAT PANDA', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_181_en.jpg?ts=1583843045334', '1'),
(470, '15_golden_eggs', '15 GOLDEN EGGS', 'BOOONGO', 'slot', 'https://static.bng.games/static/games/banner_14_en.png', '1'),
(471, 'thunder_of_olympus', 'THUNDER OF OLYMPUS', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_200_en.jpe?ts=1599463031466', '1'),
(472, 'eye_of_gold', 'EYE OF GOLD', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_204_en.jpg?ts=1607423095999', '1'),
(473, 'tiger_stone', 'TIGER STONE', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_209_en.jpg?ts=1604945706164', '1'),
(474, 'magic_apple', 'MAGIC APPLE', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_219_en.jpg?ts=1615278797585', '1'),
(475, 'wolf_saga', 'WOLF SAGA', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_216_en.png?ts=1612371564816', '1'),
(476, 'magic_ball', 'MAGIC BALL', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_223_en.jpg?ts=1618214765589', '1'),
(477, 'scarab_boost', 'SCARAB BOOST', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_231_en.jpg?ts=1623137017503', '1'),
(478, 'wukong', 'WUKONG', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_233_en.jpg?ts=1624348278790', '1'),
(479, 'pearl_diver', 'PEARL DIVER', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_232_en.jpg?ts=1624952929307', '1'),
(480, '3_coins_egypt', '3 COINS EGYPT', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_236_en.jpg?ts=1626173501198', '1'),
(481, 'ganesha_boost', 'GANESHA BOOST', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_240_en.jpg?ts=1629708978121', '1'),
(482, 'wolf_night', 'WOLF NIGHT', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_237_en.jpg?ts=1628583185745', '1'),
(483, 'book_of_wizard', 'BOOK OF WIZARD', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_244_en.jpg?ts=1632823480279', '1'),
(484, 'lord_fortune_2', 'LORD FORTUNE 2', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_245_en.jpg?ts=1633430937520', '1'),
(485, 'gold_express', 'GOLD EXPRESS', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_249_en.jpg?ts=1634629019700', '1'),
(486, 'book_of_wizard_crystal', 'BOOK OF WIZARD CRYSTAL', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_255_en.jpg?ts=1641895746148', '1'),
(487, 'pearl_diver_2', 'PEARL DIVER 2', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_259_en.jpg?ts=1645521353434', '1'),
(488, 'sun_of_egypt_3', 'SUN OF EGYPT 3', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_262_en.jpg?ts=1646655112312', '1'),
(489, 'caishen_wealth', 'CAISHEN WEALTH', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_265_en.jpg?ts=1649711719448', '1'),
(490, 'hand_of_gold', 'HAND OF GOLD', 'PLAYSON', 'slot', 'https://static.bng.games/games/banner_220_en.png?ts=1618995876889', '1'),
(491, 'legend_of_cleopatra', 'LEGEND OF CLEOPATRA', 'PLAYSON', 'slot', 'https://static.bng.games/static/games/banner_69_en.jpg', '1'),
(492, '40_joker_staxx', '40 JOKER STAXX', 'PLAYSON', 'slot', 'https://static.bng.games/games/banner_96_en.png?ts=1616657514396', '1'),
(493, 'burning_wins', 'BURNING WINS', 'PLAYSON', 'slot', 'https://static.bng.games/games/banner_102_en.png?ts=1575280724870', '1'),
(494, 'book_of_gold', 'BOOK OF GOLD', 'PLAYSON', 'slot', 'https://static.bng.games/games/banner_133_en.png?ts=1575280724870', '1'),
(495, '100_joker_staxx', '100 JOKER STAXX', 'PLAYSON', 'slot', 'https://static.bng.games/games/banner_144_en.png?ts=1575280724870', '1'),
(496, 'book_of_gold_classic', 'BOOK OF GOLD CLASSIC', 'PLAYSON', 'slot', 'https://static.bng.games/games/banner_159_en.png?ts=1575280724870', '1'),
(497, 'book_of_gold_multichance', 'BOOK OF GOLD MULTICHANCE', 'PLAYSON', 'slot', 'https://static.bng.games/games/banner_199_en.png?ts=1575280724870', '1'),
(498, '67', 'Golden eggs', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/67_EN.png', '1'),
(499, '161', 'Hercules', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/161_EN.png', '1'),
(500, '16', 'Super 5', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/16_EN.png', '1'),
(501, '72', 'Happy Rich Year', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/72_EN.png', '1'),
(502, '1', 'Fruit King', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/1_EN.png', '1'),
(503, '163', 'Neja Advent', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/163_EN.png', '1'),
(504, '26', '777', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/26_EN.png', '1'),
(505, '50', 'Good fortune', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/50_EN.png', '1'),
(506, '31', 'God of war', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/31_EN.png', '1'),
(507, '64', 'Zeus', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/64_EN.png', '1'),
(508, '69', 'Pasaycen', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/69_EN.png', '1'),
(509, '89', 'Thor', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/89_EN.png', '1'),
(510, '46', 'Wolf moon', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/46_EN.png', '1'),
(511, '139', 'Fire chibi', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/139_EN.png', '1'),
(512, '15', 'Gu Gu Gu', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/15_EN.png', '1'),
(513, '140', 'Fire Chibi 2', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/140_EN.png', '1'),
(514, '8', 'So Sweet', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/8_EN.png', '1'),
(515, '147', 'Flower fortune', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/147_EN.png', '1'),
(516, '113', 'Flying Kai Shen', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/113_EN.png', '1'),
(517, '58', 'Gu Gu Gu 2', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/58_EN.png', '1'),
(518, '128', 'Wheel money', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/128_EN.png', '1'),
(519, '5', 'Mr Rich', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/5_EN.png', '1'),
(520, '180', 'Gu Gu Gu 3', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/9835.png', '1'),
(521, '118', 'SkullSkull', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/118_EN.png', '1'),
(522, '148', 'Fortune totem', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/148_EN.png', '1'),
(523, '144', 'Diamond treasure', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/144_EN.png', '1'),
(524, '19', 'Hot spin', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/19_EN.png', '1'),
(525, '112', 'Pyramid radar', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/112_EN.png', '1'),
(526, '160', 'Pa Kai Shen2', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/160_EN.png', '1'),
(527, '132', 'Miou', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/132_EN.png', '1'),
(528, '47', 'Pharaoh gold', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/47_EN.png', '1'),
(529, '13', 'Sakura legend', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/13_EN.png', '1'),
(530, '34', 'Gophers War', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/34_EN.png', '1'),
(531, '59', 'Summer mood', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/59_EN.png', '1'),
(532, '76', 'Won won won', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/76_EN.png', '1'),
(533, '95', 'Football boots', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/95_EN.png', '1'),
(534, '57', 'The Beast War', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/57_EN.png', '1'),
(535, '17', 'Great lion', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/17_EN.png', '1'),
(536, '20', '888', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/20_EN.png', '1'),
(537, '182', 'Thor 2', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/10044.png', '1'),
(538, '66', 'Fire 777', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/66_EN.png', '1'),
(539, '2', 'God of Chess', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/2_EN.png', '1'),
(540, '21', 'Big wolf', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/21_EN.png', '1'),
(541, '197', 'Dragons Treasure', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/11502.png', '1'),
(542, '208', 'Money tree', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/11593.png', '1'),
(543, '212', 'Burning Si-Yow', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/11805.png', '1'),
(544, '214', 'Ninja raccoon', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/11806.png', '1'),
(545, 'greatwall', 'The Great Wall Treasure', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/The_Great_Wall_Treasures_Thumbnail_360x360.png', '1'),
(546, 'chinesenewyear', 'Chinese New Year', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Chinese_New_Year_Thumbnail_360x360.png', '1'),
(547, 'jewellerystore', 'Jewelry store', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Jewellery_Store_Thumbnail_360x360.png', '1'),
(548, 'redcliff', 'Red cliff', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Red_Cliff_360x340.png', '1'),
(549, 'ElvenPrincesses', 'Elven Princess', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Elven_Princesses_Thumbnail_360x360.png', '1'),
(550, 'robinzon', 'Robinson', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Robinson_Thumbnail_360x360.png', '1'),
(551, 'aeronauts', 'Aeronauts', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Aeronauts_Thumbnail_360x360.png', '1'),
(552, 'monsterlab', 'Monster rap', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Monste_-Lab_Thumbnail_360x360.png', '1'),
(553, 'TriptotheFuture', 'Trip to the Future', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Trip to the future 360x360 ENG.jpg', '1'),
(554, 'NukeWorld', 'Nook World', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/9102.jpg', '1'),
(555, 'legendofkaan', 'Legend of Khan', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/10033.png', '1'),
(556, 'LivingTales', 'Night of the Living Tales', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11292.jpg', '1'),
(557, 'IceMania', 'Ice mania', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11384.jpg', '1'),
(558, 'ValleyOfDreams', 'Valley of Dreams', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11427.png', '1'),
(559, 'FruitNova', 'Fruit Nova', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11428.jpg', '1'),
(560, 'TreeOfLight', 'Tree of light', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11503.png', '1'),
(561, 'TempleOfDead', 'Temple of the dead', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11604.png', '1'),
(562, 'RunesOfDestiny', 'Runes of Destiny', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11728.png', '1'),
(563, 'EllensFortune', 'Ellen Fortune', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11729.jpg', '1'),
(564, 'UnlimitedWishes', 'Unlimited Wishes', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11807.jpg', '1'),
(565, 'FoodFeast', 'Food fist', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11808.jpg', '1'),
(566, 'EpicLegends', 'Epic legends', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11810.jpg', '1'),
(567, 'SweetSugar', 'Sweet sugar', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11811.png', '1'),
(568, 'CycleofLuck', 'Cycle of Luck', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12054.jpg', '1'),
(569, 'GangsterNight', 'Gangster night', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12057.jpg', '1'),
(570, 'GoldOfSirens', 'Gold of sirens', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12058.jpg', '1'),
(571, 'BloodyBrilliant', 'Bloody brilliant', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12059.jpg', '1'),
(572, 'TempleOfDeadBonusBuy', 'Temple of the Dead BB', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12133.jpg', '1'),
(573, 'ShadowOfLuxor', 'Shadow of Luxor', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12134.jpg', '1'),
(574, 'CycleofLuckBonusBuy', 'Cycle of Luck BB', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12170.jpg', '1'),
(575, 'AnubisMoon', 'Anubis moon', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12171.jpg', '1'),
(576, 'FruitDisco', 'Fruit disco', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12172.jpg', '1'),
(577, 'FruitSuperNova30', 'Fruit Super Nova 30', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12173.jpg', '1'),
(578, 'CurseOfThePharaoh', 'Curse of the Pharaoh', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12174.jpg', '1'),
(579, 'GoldOfSirensBonusBuy', 'Gold of Sirens BB', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12226.jpg', '1'),
(580, 'FruitSuperNova60', 'Fruit Super Nova 60', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12227.jpg', '1'),
(581, 'CurseofthePharaohBonusBuy', 'Curse of the Pharaoh BB', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12228.jpg', '1'),
(582, 'FruitSuperNova100', 'Fruit Super Nova 100', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12256.jpg', '1'),
(583, 'ChristmasReach', 'Christmas lychee', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12269.jpg', '1'),
(584, 'FruitSuperNova80', 'Whoft Super Nova 80', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12326.jpg', '1'),
(585, 'DragonsTavern', 'Dragons Tavern', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12327.jpg', '1'),
(586, 'ChristmasReachBonusBuy', 'Christmas Riti BB', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12329.jpg', '1'),
(587, 'WildOverlords', 'Wild overlord', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12329.jpg', '1'),
(588, 'DragonsTavernBonusBuy', 'Dragons Tavern BB', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12358.jpg', '1'),
(589, 'BudaiReels', 'Budai reels', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12381.jpg', '1'),
(590, 'BudaiReelsBonusBuy', 'Budai Lils BB', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12573.jpeg', '1'),
(591, 'MoneyMinter', 'Money minter', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12575_.jpeg', '1'),
(592, 'JuicyGems', 'Watch gem', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12895.jpg', '1'),
(593, 'JuicyGemsBB', 'Watch Gem BB', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12896.jpg', '1'),
(594, 'TheGreatestCatch', 'The Greatest Catch', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12892.jpg', '1'),
(595, 'TheGreatestCatchBonusBuy', 'The Greatest Catch BB', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12893.jpg', '1'),
(596, 'TreeOfLightBB', 'Tree of Light BB', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12899.jpg', '1'),
(597, 'WolfHiding', 'Wolf Hiding', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12953.jpg', '1'),
(598, 'CaminoDeChili', 'Camino de Chili', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12902.jpg', '1'),
(599, 'CandyDreamsSweetPlanet', 'candy dreams', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12902.jpg', '1'),
(600, 'WildOverlordsBonusBuy', 'Wild Overlord BB', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12890.jpg', '1'),
(601, 'WildTriads', 'WildTriads', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/WildTriads.png', '1'),
(602, 'GoldenDragon', 'Golden Dragon', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/GoldenDragon.png', '1'),
(603, 'ReelsOfFortune', 'Reels Of Fortune', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/ReelsOfFortune.png', '1'),
(604, 'GoldenAmazon', 'Golden Amazon', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/GoldenAmazon.png', '1'),
(605, 'MonkeyLuck', 'MonkeyLuck', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/MonkeyLuck.png', '1'),
(606, 'LeagueOfChampions', 'League Of Champions', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/LeagueOfChampions.png', '1'),
(607, 'MadMonkeyH5', 'MadMonkey', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/MadMonkeyH5.png', '1'),
(608, 'DynastyEmpire', 'Dynasty Empire', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/DynastyEmpire.png', '1'),
(609, 'SuperKids', 'SuperKids', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/SuperKids.png', '1'),
(610, 'HotVolcanoH5', 'HotVolcano', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/HotVolcano.png', '1'),
(611, 'Huluwa', 'Huluwa', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/Huluwa.png', '1'),
(612, 'LegendOfLinkH5', 'LegendOfLink', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/LegendOfLinkH5.png', '1'),
(613, 'DetectiveBlackCat', 'DetectiveBlackCat', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/DetectiveBlackcat.png', '1'),
(614, 'ChilliGoldH5', 'Chilli Gold', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/ChiliGoldH5.png', '1'),
(615, 'SilverLionH5', 'Silver Lion', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/SilverLionH5.png', '1'),
(616, 'ThunderingZeus', 'ThunderingZeus', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/ThunderingZeus.png', '1'),
(617, 'DragonPalaceH5', 'Dragon Palace', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11658.png', '1'),
(618, 'MadMonkey2', 'MadMonkey', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11660.png', '1'),
(619, 'MedusaCurse', 'Medusa Curse', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11661.png', '1'),
(620, 'BattleHeroes', 'Battle Heroes', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11662.png', '1'),
(621, 'NeptunesGoldH5', 'Neptunes Gold', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11664.png', '1'),
(622, 'HeroesNeverDie', 'Heroes Never Die', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11665.png', '1'),
(623, 'WildWildWitch', 'Wild Wild Witch', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11666.png', '1'),
(624, 'WildKartRacers', 'Wild Kart Racers', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11667.png', '1'),
(625, 'KingDinosaur', 'KingDinosaur', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11668.png', '1'),
(626, 'GoldenGenie', 'GoldenGenie', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11669.png', '1'),
(627, 'UltimateFighter', 'UltimateFighter', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11672.png', '1'),
(628, 'EverlastingSpins', 'EverlastingSpins', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11673.png', '1'),
(629, 'Zoomania', 'Zoomania', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11676.png', '1'),
(630, 'LaserCats', 'Laser Cats', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11679.png', '1'),
(631, 'DiamondFortune', 'DiamondFortune', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11682.png', '1'),
(632, 'GoldenClaw', 'GoldenClaw', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11685.png', '1'),
(633, 'PandaWarrior', 'PandaWarrior', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11687.png', '1'),
(634, 'RoyalGoldenDragon', 'RoyalGoldenDragon', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11690.png', '1'),
(635, 'MegaMaya', 'MegaMaya', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11697.png', '1'),
(636, 'MegaPhoenix', 'MegaPhoenix', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11864.png', '1'),
(637, 'DolphinGoldH5', 'DolphinGold', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/DolphinGoldH5.png', '1'),
(638, 'DragonKingH5', 'DragonKing', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/DragonKingH5.png', '1'),
(639, 'btball5x20', 'Crazy Basketball', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/021.Crazy Basketball.png', '1'),
(640, 'dnp', 'DragonPhoenix Prosper', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/022.DragonPhoenix Prosper.png', '1'),
(641, 'crystal', 'Glory of Heroes', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/023.Glory of Heroes.png', '1'),
(642, 'fls', 'FULUSHOU', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/025.FULUSHOU.png', '1'),
(643, 'fourss', 'Four Holy Beasts', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/026.Four Holy Beasts.png', '1'),
(644, 'casino', '3D Slot', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/028.3D Slot.png', '1'),
(645, 'crazy5x243', 'Crazy GO GO GO', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/029.Crazy GO GO GO.png', '1'),
(646, 'rocknight', 'RocknRoll Night', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/031.RocknRoll Night.png', '1'),
(647, 'bluesea', 'Blue Sea', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/032.Blue Sea.png', '1'),
(648, 'circus', 'Crazy Circus', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/034.Crazy Circus.png', '1'),
(649, 'bikini', 'Bikini Party', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/037.Bikini Party.png', '1'),
(650, 'foryouth5x25', 'SO YOUNG', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/045.SO YOUNG.png', '1'),
(651, 'fourbeauty', 'Four Beauties', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/046.Four Beauties.png', '1'),
(652, 'sweethouse', 'Candy House', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/047.Candy House.png', '1'),
(653, 'legend5x25', 'Legend of the King', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/048.Legend of the King.png', '1'),
(654, 'opera', 'Beijing opera', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/051.Beijing opera.jpeg', '1'),
(655, 'bigred', 'Big Red', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/055.Big Red.jpeg', '1'),
(656, 'wrathofthor', 'Wrath of Thor', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/056.Wrath of Thor.png', '1'),
(657, 'boxingarena', 'Boxing Arena', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/059.Boxing Arena.jpeg', '1'),
(658, 'fantasyforest', 'Elf Kingdom', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/061.Elf Kingdom.png', '1'),
(659, 'egyptian', 'Egyptian Empire', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/063.Egyptian Empire.png', '1'),
(660, 'hotpotfeast', 'Hotpot Feast', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/064.Hotpot Feast.png', '1'),
(661, 'magician', 'Magician', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/065.Magician.png', '1'),
(662, 'galaxywars', 'Galaxy Wars', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/068.Galaxy Wars.png', '1'),
(663, 'easyrider', 'Easy Rider', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/069.Easy Rider.png', '1'),
(664, 'goldjade5x50', 'Jin Yu Man Tang', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/072.Jin Yu Man Tang.png', '1'),
(665, 'shokudo', 'shokudo', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/073.shokudo.jpeg', '1'),
(666, 'train', 'Treasure Hunt Trip', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/074.Treasure Hunt Trip.png', '1'),
(667, 'lovefighters', 'Love Fighters', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/077.Love Fighters.png', '1'),
(668, 'garden', 'Little Big Garden', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/079.Little Big Garden.png', '1'),
(669, 'alchemist', 'Crazy Alchemist', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/084.Crazy Alchemist.png', '1'),
(670, 'dinosaur5x25', 'Dinosaur World', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/089.Dinosaur World.png', '1'),
(671, 'tombshadow', 'Tomb Shadow', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/086.Tomb Shadow.png', '1'),
(672, 'clash', 'Clash of Three kingdoms', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/088.Clash of Three kingdoms.png', '1'),
(673, 'magicbean', 'Magic Bean Legend', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/097.Magic Bean Legend.png', '1'),
(674, 'secretdate', 'Secret Date', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/104.Secret Date.png', '1'),
(675, 'bacteria', 'Germ Lab', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/106.GermLab.png', '1'),
(676, 'baseball', 'Baseball Frenzy', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/108.BaseballFrenzy.png', '1'),
(677, 'museum', 'Wondrous Museum', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/110.WondrousMuseum.png', '1'),
(678, 'mysticalstones', 'Mystical Stones', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/111.MysticalStones.png', '1'),
(679, 'sincity', 'Sin City', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/113.SinCity.png', '1'),
(680, 'wheel', 'Secrets of The Pentagram', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/114.Secretsofthe pentagram.png', '1'),
(681, 'westwild', 'West Wild', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/116.WestWild.png', '1'),
(682, 'halloween', 'Witch Winnings', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/115.WitchWinnings.png', '1'),
(683, 'bloodmoon', 'Blood Wolf legend', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/118.BloodWolf.png', '1'),
(684, 'dragonball2', 'Heroes of the East', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/121.HeroesofTheEast.png', '1'),
(685, 'muaythai', 'Muaythai', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/_9659.png', '1'),
(686, 'sailor', 'Sailor Princess', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/_9660.png', '1'),
(687, 'nightclub', 'Infinity Club', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/_9661.png', '1'),
(688, 'nezha', 'Nezha Legend', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/_9662.png', '1'),
(689, 'bird', 'Bird Island', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/10900.png', '1'),
(690, 'honor', 'Field Of Honor', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/10902.png', '1'),
(691, 'train2', 'Treasure Hunt Trip 2', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/10904.png', '1'),
(692, 'shiningstars', 'ShiningStars', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/11268.png', '1'),
(693, 'tgow2plus', 'Cai Shen Dao Plus', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/11555.png', '1'),
(694, 'piggy-gold', 'Piggy Gold', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/piggy-gold.jpg', '1'),
(695, 'ganesha-gold', 'Ganesha Gold', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/ganesha-gold.jpg', '1'),
(696, 'jungle-delight', 'Jungle Delight', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/jungle-delight.jpg', '1'),
(697, 'double-fortune', 'Double Fortune', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/double-fortune.jpg', '1'),
(698, 'the-great-icescape', 'The Great Icescape', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/the-great-icescape.jpg', '1'),
(699, 'captains-bounty', 'Captains Bounty', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/captains-bounty.jpg', '1'),
(700, 'leprechaun-riches', 'Leprechaun Riches', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/leprechaun-riches.jpg', '1'),
(701, 'mahjong-ways', 'Mahjong Ways', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/mahjong-ways.jpg', '1'),
(702, 'fortune-mouse', 'Fortune Mouse', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/fortune-mouse.jpg', '1'),
(703, 'gem-saviour-conquest', 'Gem Saviour Conquest', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/gem-saviour-conquest.jpg', '1'),
(704, 'candy-burst', 'Candy Burst', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/candy-burst.jpg', '1'),
(705, 'bikini-paradise', 'Bikini Paradise', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/bikini-paradise.jpg', '1'),
(706, 'mahjong-ways2', 'Mahjong Ways 2', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/mahjong-ways2.jpg', '1'),
(707, 'ganesha-fortune', 'Ganesha Fortune', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/ganesha-fortune.jpg', '1'),
(708, 'phoenix-rises', 'Phoenix Rises', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/phoenix-rises.jpg', '1'),
(709, 'wild-fireworks', 'Wild Fireworks', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/wild-fireworks.jpg', '1'),
(710, 'treasures-aztec', 'Treasures of Aztec', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/treasures-aztec.jpg', '1'),
(711, 'queen-bounty', 'Queen of Bounty', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/queen-bounty.jpg', '1'),
(712, 'jewels-prosper', 'Jewels of Prosperity', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/jewels-prosper.jpg', '1'),
(713, 'galactic-gems', 'Galactic Gems', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/galactic-gems.jpg', '1'),
(714, 'gdn-ice-fire', 'Guardians of Ice and Fire', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/gdn-ice-fire.jpg', '1'),
(715, 'fortune-ox', 'Fortune Ox', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/fortune-ox.jpg', '1'),
(716, 'wild-bandito', 'Wild Bandito', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/wild-bandito.jpg', '1'),
(717, 'candy-bonanza', 'Candy Bonanza', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/candy-bonanza.jpg', '1'),
(718, 'majestic-ts', 'Majestic Treasures', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/majestic-ts.jpg', '1'),
(719, 'crypt-fortune', 'Raider Janes Crypt of Fortune', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/crypt-fortune.jpg', '1'),
(720, 'sprmkt-spree', 'Supermarket Spree', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/sprmkt-spree.jpg', '1'),
(721, 'lgd-monkey-kg', 'Legendary Monkey King', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/lgd-monkey-kg.jpg', '1'),
(722, 'spirit-wonder', 'Spirited Wonders', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/spirit-wonder.jpg', '1'),
(723, 'emoji-riches', 'Emoji Riches', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/emoji-riches.jpg', '1'),
(724, 'fortune-tiger', 'Fortune Tiger', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/fortune-tiger.jpg', '1'),
(725, 'garuda-gems', 'Garuda Gems', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/garuda-gems.jpg', '1'),
(726, 'dest-sun-moon', 'Destiny of Sun & Moon', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/destiny-of-sun-moon.webp', '1'),
(727, 'btrfly-blossom', 'Butterfly Blossom', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/butterfly-blossom.jpg', '1'),
(728, 'rooster-rbl', 'Rooster Rumble', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/rooster-rumble.jpg', '1'),
(729, 'battleground', 'Battleground Royale', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/battleground-royale.jpg', '1'),
(730, 'prosper-ftree', 'Prosperity Fortune Tree', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/prosperity-fortune-tree.jpg', '1'),
(731, '100', 'Baccarat', 'EZUGI', 'live', 'https://ezugi.fivervision.com/assets/banner/BaccaratLobby.webp', '1'),
(732, '102', 'Fortune Baccarat', 'EZUGI', 'live', 'https://ezugi.fivervision.com/assets/banner/SpeedFortuneBaccarat.webp', '1'),
(733, '105', 'Speed Fortune Baccarat', 'EZUGI', 'live', 'https://ezugi.fivervision.com/assets/banner/SpeedFortuneBaccarat.webp', '1'),
(734, '106', 'VIP Fortune Baccarat', 'EZUGI', 'live', 'https://ezugi.fivervision.com/assets/banner/VIPFortuneBaccarat.webp', '1'),
(735, '107', 'Italian Baccarat', 'EZUGI', 'live', 'https://ezugi.bet4wins.net/assets/banner/ItalianBaccarat.webp', '1'),
(736, '120', 'Knockout Baccarat', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/GoldenBaccaratKnockOut.webp', '1'),
(737, '130', 'Super 6 Baccarat', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/GoldenBaccaratSuperSix.webp', '1'),
(738, '150', 'Dragon Tiger', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/DragonTiger.webp', '1'),
(739, '170', 'No Commission Baccarat', 'EZUGI', 'live', 'https://ezugi.fivervision.com/assets/banner/NoCommissionBaccarat.webp', '1'),
(740, '171', 'VIP No Commission Speed Cricket Baccarat', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/VIPNoCommissionSpeedCricketBaccarat.webp', '1'),
(741, '1000', 'Italian Roulette', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/RouletteGold2.webp', '1'),
(742, '5001', 'Auto Roulette', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/AutomaticRoulette1.webp', '1'),
(743, '32100', 'Casino Marina Baccarat 1', 'EZUGI', 'live', 'https://ezugi.fivervision.com/assets/banner/CasinoMarinaBaccarat1.webp', '1'),
(744, '32101', 'Casino Marina Baccarat 2', 'EZUGI', 'live', 'https://ezugi.fivervision.com/assets/banner/CasinoMarinaBaccarat2.webp', '1'),
(745, '32102', 'Casino Marina Baccarat 3', 'EZUGI', 'live', 'https://ezugi.fivervision.com/assets/banner/CasinoMarinaBaccarat3.webp', '1'),
(746, '32103', 'Casino Marina Baccarat 4', 'EZUGI', 'live', 'https://ezugi.fivervision.com/assets/banner/CasinoMarinaBaccarat4.webp', '1'),
(747, '221000', 'Speed Roulette', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/SpeedRoulette.webp', '1'),
(748, '221002', 'Speed Auto Roulette', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/SpeedAutoRoulette.webp', '1'),
(749, '221003', 'Diamond Roulette', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/DiamondRoulette.webp', '1'),
(750, '221004', 'Prestige Auto Roulette', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/AutomaticRoulette1.webp', '1'),
(751, '221005', 'Namaste Roulette', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/NamasteRoulette.webp', '1'),
(752, '228000', 'Andar Bahar', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/AndarBahar.webp', '1'),
(753, '228001', 'Lucky 7', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/Lucky7.webp', '1'),
(754, '321000', 'Casino Marina Roulette 1', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/CasinoMarinaRoulette1.webp', '1'),
(755, '321001', 'Casino Marina Roulette 2', 'EZUGI', 'live', 'https://ezugi.fivervision.com/assets/banner/CasinoMarinaRoulette2.webp', '1'),
(756, '411000', 'Spanish Roulette', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/CumbiaRuleta1.webp', '1'),
(757, '431000', 'Ruleta del Sol', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/RuletadelSol.webp', '1'),
(758, '481002', 'EZ Dealer Roulette Japanese', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/EZDealerRouletteJapanese.webp', '1');
INSERT INTO `tb_game` (`id`, `game_code`, `game_name`, `game_provider`, `game_type`, `game_image`, `game_status`) VALUES
(759, '481003', 'EZ Dealer Roulette Mandarin', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/EZDealerRouletteMandarin.webp', '1'),
(760, '501000', 'Turkish Roulette', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/TurkishRoulette.webp', '1'),
(761, '601000', 'Russian Roulette', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/RouletteGold3.webp', '1'),
(762, '611000', 'Portomaso Roulette 2', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/PortomasoCasinoRoulette.webp', '1'),
(763, '611001', 'Oracle Real Roulette', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/OracleCasinoRoulette.webp', '1'),
(764, 'vswayswwhex', 'Wild Wild Bananas', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswayswwhex.png', '1'),
(765, 'SGBombRunner', 'Boom runner', 'HABANERO', 'slot', 'https://app-b.insvr.com/img/s/300/SGBombRunner_ko-KR.png', '1'),
(766, 'aztec_fire', 'AZTEC FIRE', 'BOOONGO', 'slot', 'https://static.bng.games/games/banner_272_en.jpg?ts=1658177726858', '1'),
(767, 'buffalo_xmas', 'BUFFALO XMAS', 'PLAYSON', 'slot', 'https://static.bng.games/games/banner_248_en.png?ts=1575280724870', '1'),
(768, '218', 'Dollar night', 'CQ9', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/12141.png', '1'),
(769, 'TempleOfThunder', 'Temple of Thunder', 'EVOPLAY', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12891.jpg', '1'),
(770, 'LuckyPandaH5', 'LuckyPanda', 'TOPTREND', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/LuckyPanda.png', '1'),
(771, 'peeping', 'Peeping', 'DREAMTECH', 'slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/11556.png', '1'),
(772, 'fortune-rabbit', 'Fortune Rabbit', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/fortune-rabbit.jpg', '1'),
(773, 'DoubleBallRou001', 'Double Ball Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/double-ball-roulette.jpg', '1'),
(774, 'AndarBahar000001', 'Super Andar Bahar', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/super-andar-bahar.jpg', '1'),
(775, 'HoldemTable00001', 'Casino Holdem', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/casino-holdem.jpg', '1'),
(776, 'BacBo00000000001', 'Bac Bo', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/bacbo.jpg', '1'),
(777, 'PTBaccarat000001', 'Prosperity Tree Baccarat', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/prosperity-tree-baccarat.jpg', '1'),
(778, 'Monopoly00000001', 'MONOPOLY Live', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/monopoly.jpg', '1'),
(779, 'ovu5cwp54ccmymck', 'Speed Baccarat L', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-l.jpg', '1'),
(780, 'ovu5h6b3ujb4y53w', 'No Commission Speed Baccarat C', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/no-commission-speed-baccarat-c.jpg', '1'),
(781, 'ndgv45bghfuaaebf', 'Speed Baccarat E', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-e.jpg', '1'),
(782, 'lv2kzclunt2qnxo5', 'Speed Baccarat B', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-b.jpg', '1'),
(783, 'qsf63ownyvbqnz33', 'Speed Baccarat Z', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-z.jpg', '1'),
(784, 'leqhceumaq6qfoug', 'Speed Baccarat A', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-a.jpg', '1'),
(785, 'nmwde3fd7hvqhq43', 'Speed Baccarat F', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-f.jpg', '1'),
(786, 'qgqrrnuqvltnvejx', 'Speed Baccarat V', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-v.jpg', '1'),
(787, 'nmwdzhbg7hvqh6a7', 'Speed Baccarat G', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-g.jpg', '1'),
(788, '48z5pjps3ntvqc1b', 'Auto-Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/auto-roulette.jpg', '1'),
(789, 'SpeedAutoRo00001', 'Speed Auto Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-auto-roulette.jpg', '1'),
(790, 'GoldVaultRo00001', 'Gold Vault Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/gold-vault-roulette.jpg', '1'),
(791, 'o4kyj7tgpwqqy4m4', 'Speed Baccarat Q', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-q.jpg', '1'),
(792, 'TRPTable00000001', 'Triple Card Poker', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/triple-card-poker.jpg', '1'),
(793, 'peekbaccarat0001', 'Peek Baccarat', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/peek-baccarat.jpg', '1'),
(794, 'qgonc7t4ucdiel4o', 'Speed Baccarat T', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-t.jpg', '1'),
(795, 'k2oswnib7jjaaznw', 'Baccarat Control Squeeze', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/baccarat-control-squeeze.jpg', '1'),
(796, 'ovu5fzje4ccmyqnr', 'Speed Baccarat P', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-p.jpg', '1'),
(797, 'BonsaiBacc000003', 'Bonsai Speed Baccarat C', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/bonsai-speed-baccarat-c.jpg', '1'),
(798, 'LightningTable01', 'Lightning Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/lightning-roulette.jpg', '1'),
(799, 'CrazyTime0000002', 'Crazy Time A', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/crazytime.jpg', '1'),
(800, 'NoCommBac0000001', 'No Commission Baccarat', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/no-commission-baccarat.jpg', '1'),
(801, 'XxxtremeLigh0001', 'XXXtreme Lightning Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/xxxtreme-lightning-roulette.jpg', '1'),
(802, 'teenpattitable01', 'Teen Patti', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/teen-patti.jpg', '1'),
(803, 'ndgvwvgthfuaad3q', 'Speed Baccarat C', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-c.jpg', '1'),
(804, 'nxpkul2hgclallno', 'Speed Baccarat I', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-i.jpg', '1'),
(805, 'SBCTable00000001', 'Side Bet City', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/side-bet-city.jpg', '1'),
(806, 'ndgvs3tqhfuaadyg', 'Baccarat C', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/baccarat-c.jpg', '1'),
(807, 'obj64qcnqfunjelj', 'Speed Baccarat J', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-j.jpg', '1'),
(808, 'rep5aor7nyjl7qli', 'Speed Baccarat 6', 'EVOLUTION', 'live', 'https://evolution.fivervision.com/assets/banner/SpeedBaccarat6.webp', '1'),
(809, 'ndgvz5mlhfuaad6e', 'Speed Baccarat D', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-d.jpg', '1'),
(810, 'ovu5dsly4ccmynil', 'Speed Baccarat M', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-m.jpg', '1'),
(811, 'rep5ca4ynyjl7wdw', 'Speed Baccarat 7', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-7.jpg', '1'),
(812, '7x0b1tgh7agmf6hv', 'Immersive Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/immersive-roulette.jpg', '1'),
(813, 'qgqrucipvltnvnvq', 'Speed Baccarat W', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-w.jpg', '1'),
(814, 'ovu5fbxm4ccmypmb', 'Speed Baccarat O', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-o.jpg', '1'),
(815, 'vctlz20yfnmp1ylr', 'Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/roulette.jpg', '1'),
(816, 'ocye5hmxbsoyrcii', 'No Commission Speed Baccarat B', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/no-commission-speed-baccarat-b.jpg', '1'),
(817, '60i0lcfx5wkkv3sy', 'Baccarat B', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/baccarat-b.jpg', '1'),
(818, 'BonsaiBacc000001', 'Bonsai Speed Baccarat A', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/bonsai-speed-baccarat-a.jpg', '1'),
(819, '01rb77cq1gtenhmo', 'Auto-Roulette VIP', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/auto-roulette-vip.jpg', '1'),
(820, 'CrazyTime0000001', 'Crazy Time', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/crazytime.jpg', '1'),
(821, 'lkcbrbdckjxajdol', 'Speed Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-roulette.jpg', '1'),
(822, 'AmericanTable001', 'American Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/american-roulette.jpg', '1'),
(823, 'qsf7bpfvyvbqolwp', 'Speed Baccarat 3', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-3.jpg', '1'),
(824, 'qsf7alptyvbqohva', 'Speed Baccarat 2', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-2.jpg', '1'),
(825, 'nxpj4wumgclak2lx', 'Speed Baccarat H', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-h.jpg', '1'),
(826, 'ndgv76kehfuaaeec', 'No Commission Speed Baccarat A', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/no-commission-speed-baccarat-a.jpg', '1'),
(827, 'BonsaiBacc000002', 'Bonsai Speed Baccarat B', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/bonsai-speed-baccarat-b.jpg', '1'),
(828, 'qsf65xtoyvbqoaop', 'Speed Baccarat 1', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-1.jpg', '1'),
(829, 'oytmvb9m1zysmc44', 'Baccarat A', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/baccarat-a.jpg', '1'),
(830, 'zixzea8nrf1675oh', 'Baccarat Squeeze', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/baccarat-squeeze.jpg', '1'),
(831, 'LightningBac0001', 'Lightning Baccarat', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/lightning-baccarat.jpg', '1'),
(832, 'ocye2ju2bsoyq6vv', 'Speed Baccarat K', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-k.jpg', '1'),
(833, 'FanTan0000000001', 'Fan Tan', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/fantan.jpg', '1'),
(834, 'CSPTable00000001', 'Caribbean Stud Poker', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/caribbean-stud-poker.jpg', '1'),
(835, 'SuperSicBo000001', 'Super Sic Bo', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/super-sicbo.jpg', '1'),
(836, 'o4kymodby2fa2c7g', 'Speed Baccarat S', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-s.jpg', '1'),
(837, 'MOWDream00000001', 'Dream Catcher', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/dream-catcher.jpg', '1'),
(838, 'qgqrhfvsvltnueqf', 'Speed Baccarat U', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-u.jpg', '1'),
(839, 'LightningDice001', 'Lightning Dice', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/lightning-dice.jpg', '1'),
(840, 'MonBigBaller0001', 'MONOPOLY Big Baller', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/monopoly-big-baller.jpg', '1'),
(841, 'o4kylkahpwqqy57w', 'Speed Baccarat R', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-r.jpg', '1'),
(842, 'f1f4rm9xgh4j3u2z', 'Auto-Roulette La Partage', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/auto-roulette-la-partage.jpg', '1'),
(843, 'ETHTable00000001', 'Extreme Texas Holdem', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/extreme-texas-holdem.jpg', '1'),
(844, 'qgqrv4asvltnvuty', 'Speed Baccarat X', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-x.jpg', '1'),
(845, 'ovu5eja74ccmyoiq', 'Speed Baccarat N', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-n.jpg', '1'),
(846, '611003', 'Oracle 360 Roulette', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/OracleCasinoRoulette360.webp', '1'),
(847, '481001', 'EZ Dealer Roulette Thai', 'EZUGI', 'live', 'https://assets.fivervision.com/ezugi/images/EZDealerRoulette.webp', '1'),
(848, 'TopDice000000001', 'Football Studio Dice', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/football-studio-dice.jpg', '1'),
(849, 'wzg6kdkad1oe7m5k', 'VIP Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/vip-roulette.jpg', '1'),
(850, '7nyiaws9tgqrzaz3', 'Football Studio Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/football-studio-roulette.jpg', '1'),
(851, 'TopCard000000001', 'Football Studio', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/football-studio.jpg', '1'),
(852, '541000', 'Ultimate Roulette', 'EZUGI', 'live', 'https://ezugi.fivervision.com/assets/banner/UltimateRoulette.webp', '1'),
(853, '224100', 'Ultimate Sic Bo', 'EZUGI', 'live', 'https://ezugi.fivervision.com/assets/banner/UltimateSicBo.webp', '1'),
(854, 'JapSpeedBac00001', 'Japanese Speed Baccarat A', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/japanese-speed-baccarat-a.jpg', '1'),
(855, 'p63cmvmwagteemoy', 'Korean Speed Baccarat A', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/korean-speed-baccarat-a.jpg', '1'),
(856, 'PorROULigh000001', 'Roleta Relâmpago', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/roleta-relampago.jpg', '1'),
(857, 'ovfzgqahvicqtiwu', 'Lightning Roulette Italia', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/lightning-roulette-italia.jpg', '1'),
(858, 'HSpeedBac0000002', 'Hindi Speed Baccarat B', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/hindi-speed-baccarat.jpg', '1'),
(859, '8clwnwrupuvf0osq', 'Ruleta en Vivo', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/ruleta-en-vivo.jpg', '1'),
(860, 'xie6wodezmfwmmcb', 'Punto Banco', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/punto-banco.jpg', '1'),
(861, 'mkvhbciosnfqhat7', 'Arabic Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/arabic-roulette.jpg', '1'),
(862, 'RedDoorRoulette1', 'Red Door Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/red-door-roulette.jpg', '1'),
(863, 'qgdk6rtpw6hax4fe', 'Korean Speed Baccarat C', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/korean-speed-baccarat-c.jpg', '1'),
(864, 'EmperorSB0000001', 'Emperor Sic Bo', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/emperor-sicbo.jpg', '1'),
(865, 'k37tle5hfceqacik', 'Bucharest Auto-Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/bucharest-auto-roulette.jpg', '1'),
(866, 'qtkjorzrlqeb6hrd', 'Deutsches Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/deutsches-roulette.jpg', '1'),
(867, 'Japgwbaccarat001', 'Japanese Golden Wealth Baccarat', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/japanese-golden-wealth-baccarat.jpg', '1'),
(868, '3aidqufu9szxha2n', 'Dansk Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/dansk-roulette.jpg', '1'),
(869, 'PorROU0000000001', 'Roleta ao Vivo', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/roleta-ao-vivo.jpg', '1'),
(870, 'pv5q45yjhasyt46y', 'Emperor Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/emperor-roulette.jpg', '1'),
(871, 'JapSpeedBac00002', 'Japanese Speed Baccarat B', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/japanese-speed-baccarat-b.jpg', '1'),
(872, 'GreekLRou0000001', 'Greek Lightning Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/greek-lightning-roulette.jpg', '1'),
(873, 'pezjou3ltf6hvzjk', 'Thai Speed Baccarat A', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/thai-speed-baccarat-a.jpg', '1'),
(874, 'n4jwxsz2x4tqitvx', 'Japanese Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/japanese-roulette.jpg', '1'),
(875, 'o4vjrhh5rtwimgi3', 'Greek Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/greek-roulette.jpg', '1'),
(876, 'puu47n7mic3rfd7y', 'Emperor Dragon Tiger', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/emperor-dragon-tiger.jpg', '1'),
(877, 'pwsaqk24fcz5qpcr', 'Emperor Speed Baccarat C', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/emperor-speed-baccarat-c.jpg', '1'),
(878, 'DHPTable00000001', '2 Hand Casino Holdem', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/2-hand-casino-holdem.jpg', '1'),
(879, 'pnkk4iuchw7blb2p', 'Dragonara Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/dragonara-roulette.jpg', '1'),
(880, 'TRLRou0000000001', 'Türkçe Lightning Rulet', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/turkish-lightning-rulet.jpg', '1'),
(881, 'rr0yhns3we03tqqu', 'Svensk Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/svensk-roulette.jpg', '1'),
(882, 'FunkyTime0000001', 'Funky Time', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/funky-time.jpg', '1'),
(883, 'mtnmxyvdxceqmllz', 'Suomalainen Ruletti', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/suomalainen-ruletti.jpg', '1'),
(884, 'r15uycx4vegmnhfl', 'Roulette Francophone', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/roulette-francophone.jpg', '1'),
(885, 'pv2y4kmsanvdvwgy', 'Lotus Speed Baccarat A', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/lotus-speed-baccarat-a.jpg', '1'),
(886, 'PorBacBo00000001', 'Bac Bo Ao Vivo', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/bacbo.jpg', '1'),
(887, 'THBTable00000001', 'Texas Holdem Bonus Poker', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/texas-holdem-bonus-poker.jpg', '1'),
(888, 'puu43e6c5uvrfikr', 'Emperor Speed Baccarat B', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/emperor-speed-baccarat-b.jpg', '1'),
(889, 'JapSpeedBac00003', 'Japanese Speed Baccarat C', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/japanese-speed-baccarat-c.jpg', '1'),
(890, 'pv2zgy42anvdwk3l', 'Lotus Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/lotus-roulette.jpg', '1'),
(891, 'p675pglzzxn6xzcn', 'Bacará Rápido', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/bacara-rapido.jpg', '1'),
(892, 'mfddu5dzz6nqker6', 'Norsk Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/norsk-roulette.jpg', '1'),
(893, 'rep5eiecnyjl75lq', 'Speed Baccarat 8', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-baccarat-8.jpg', '1'),
(894, 'StockMarket00001', 'Stock Market', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/stock-market.jpg', '1'),
(895, 'TopCard000000004', 'Futebol Studio Ao Vivo', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/football-studio-ao-vivo.jpg', '1'),
(896, 'onokyd4wn7uekbjx', 'Korean Speed Baccarat B', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/korean-speed-baccarat-b.jpg', '1'),
(897, 'p675txa7cdt6za26', 'Ruleta en Español', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/ruleta-en-espanol.jpg', '1'),
(898, 'mvrcophqscoqosd6', 'Casino Malta Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/casino-malta-roulette.jpg', '1'),
(899, 'gwbaccarat000001', 'Golden Wealth Baccarat', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/golden-wealth-baccarat.jpg', '1'),
(900, 'nifyytz35m2qcevw', 'Türkçe Futbol Stüdyosu', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/turkish-football-studio.jpg', '1'),
(901, 'ImperialQuest001', 'Imperial Quest', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/imperial-quest.jpg', '1'),
(902, 'r5aw9yumyaxgnd90', 'Türkçe Rulet', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/turkish-roulette.jpg', '1'),
(903, 'mrpuiwhx5slaurcy', 'Hippodrome Grand Casino', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/hippodrome-grand-casino.jpg', '1'),
(904, 'rfbo6mhpdgyqbpay', 'Emperor Bac Bo', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/emperor-bacbo.jpg', '1'),
(905, 'oqa3v7a2t25ydg5e', 'Ruleta Bola Rapida en Vivo', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/ruleta-bola-rapida-en-vivo.jpg', '1'),
(906, 'hiey8yx1hkkgqawl', 'Venezia Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/venezia-roulette.jpg', '1'),
(907, 'XXXtremeLB000001', 'XXXtreme Lightning Baccarat', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/xxxtreme-lightning-baccarat.jpg', '1'),
(908, 'otctxzr5fjyggijz', 'Hindi Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/hindi-roulette.jpg', '1'),
(909, 'qhhjdnovai4a3a6k', 'Hindi Speed Baccarat A', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/hindi-speed-baccarat.jpg', '1'),
(910, 'puu4yfymic3reudn', 'Emperor Speed Baccarat A', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/emperor-speed-baccarat-a.jpg', '1'),
(911, 'InstantSSB000001', 'Speed Super Sic Bo', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/speed-super-sicbo.jpg', '1'),
(912, 'zosmk25g2f768o52', 'Ruletka Live', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/ruletka-live.jpg', '1'),
(913, 'TopCard000000003', 'Fútbol Studio', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/futbol-studio.jpg', '1'),
(914, 'LightningHindi01', 'Hindi Lightning Roulette', 'EVOLUTION', 'live', 'https://assets.fiverscool.com/evolution/images/hindi-lightning-roulette.jpg', '1'),
(915, 'LightningSpain01', 'Ruleta Relámpago en Vivo', 'EVOLUTION', 'live', 'https://assets.fivervision.com/evolution/images/ruleta-relampago-en-vivo.jpg', '1'),
(916, '1hl323e1lxuqdrkr', 'AUTO_MEGA_ROULETTE', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-auto-mega-roulette.jpg', '1'),
(917, '1hl65ce1lxuqdrkr', 'MEGA_ROULETTE', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-mega-roulette.jpg', '1'),
(918, '5bzl2835s5ruvweg', 'AUTO_ROULETTE', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-auto-roulette-1.jpg', '1'),
(919, 'autorwra311autor', 'SPEED_AUTO_ROULETTE', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-speed-auto-roulette.jpg', '1'),
(920, 'chroma229rwltr22', 'ROULETTE_RUBY', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-roulette-10-ruby.jpg', '1'),
(921, 'fl9knouu0yjez2wi', 'SPEED_ROULETTE_1', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-speed-roulette.jpg', '1'),
(922, 'g03y1t9vvuhrfytl', 'ROULETTE_AZURE', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/RouletteAzure.jpg', '1'),
(923, 'p8l1j84prrmxzyic', 'TURKISH_ROULETTE', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-roulette-6-turkish.jpg', '1'),
(924, 'r20speedrtwo201s', 'SPEED_ROULETTE_2', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/SpeedRoulette2.jpg', '1'),
(925, 'rmycjoqq18k2r161', 'ROULETTE_INDIAN', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-roulette-8-indian.jpg', '1'),
(926, 'romania233rwl291', 'ROMANIAN_ROULETTE', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-roulette-12-romanian.jpg', '1'),
(927, 'roulerw234rwl292', 'SPANISH_ROULETTE', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-roulette-14-spanish.jpg', '1'),
(928, 's2x6b4jdeqza2ge2', 'GERMAN_ROULETTE', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-roulette-5-german.jpg', '1'),
(929, 't4jzencinod6iqwi', 'RUSSIAN_ROULETTE', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-roulette-4-russian.jpg', '1'),
(930, 'v1c52fgw7yy02upz', 'ROULETTE_ITALIA_TRICOLORE', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-roulette-7-italian.jpg', '1'),
(931, 'yqpz3ichst2xg439', 'ROULETTE_MACAO', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-roulette-3-macao.jpg', '1'),
(932, '2q57e43m4ivqwaq3', 'SPEED_BACCARAT_6', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-speed-baccarat-6.jpg', '1'),
(933, '886ewimul28yw14j', 'SPEED_BACCARAT_5', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-speed-baccarat-5.jpg', '1'),
(934, '9j3eagurfwmml7z2', 'BACCARAT_2', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/LiveBaccaratB.jpg', '1'),
(935, 'b0jf7rlboleibnap', 'SPEED_BACCARAT_14', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/SpeedBaccarat14.jpg', '1'),
(936, 'bcapuntobanco001', 'PUNTO_BANCO_ITALIA_TRICOLORE', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/PuntoBancoItaliaTricolore.jpg', '1'),
(937, 'bcpirpmfpeobc191', 'BACCARAT_7', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-baccarat-7.jpg', '1'),
(938, 'bcpirpmfpeobc192', 'BACCARAT_8', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-baccarat-8.jpg', '1'),
(939, 'bcpirpmfpeobc193', 'SPEED_BACCARAT_15', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/SpeedBaccarat15.jpg', '1'),
(940, 'bcpirpmfpeobc194', 'SPEED_BACCARAT_10', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-speed-baccarat-10.jpg', '1'),
(941, 'bcpirpmfpeobc196', 'SPEED_BACCARAT_9', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-speed-baccarat-9.jpg', '1'),
(942, 'bcpirpmfpeobc197', 'SPEED_BACCARAT_7', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-speed-baccarat-7.jpg', '1'),
(943, 'bcpirpmfpeobc198', 'SPEED_BACCARAT_8', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-speed-baccarat-8.jpg', '1'),
(944, 'bcpirpmfpeobc199', 'SUPER_8_BACCARAT', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-super-8-baccarat.jpg', '1'),
(945, 'bcpirpmfpobc1910', 'FORTUNE_6_BACCARAT', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-fortune-6-baccarat.jpg', '1'),
(946, 'bcpirpmfpobc1912', 'BACCARAT_9', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-baccarat-9.jpg', '1'),
(947, 'cbcf6qas8fscb221', 'SPEED_BACCARAT_12', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-speed-baccarat-12.jpg', '1'),
(948, 'cbcf6qas8fscb222', 'BACCARAT_3', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-baccarat-3.jpg', '1'),
(949, 'cbcf6qas8fscb224', 'SPEED_BACCARAT_11', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-speed-baccarat-11.jpg', '1'),
(950, 'h22z8qhp17sa0vkh', 'BACCARAT_1', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-baccarat-1.jpg', '1'),
(951, 'kkqnazmd8ttq7fgd', 'SPEED_BACCARAT_2', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-speed-baccarat-2.jpg', '1'),
(952, 'm88hicogrzeod202', 'SPEED_BACCARAT_13', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-speed-baccarat-13.jpg', '1'),
(953, 'mbc371rpmfmbc371', 'MEGA_BACCARAT', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-mega-baccarat.jpg', '1'),
(954, 'ne074fgn4bd1150i', 'BACCARAT_5', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-baccarat-5.jpg', '1'),
(955, 'oq808ojps709qqaf', 'BACCARAT_6', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-baccarat-6.jpg', '1'),
(956, 'pwnhicogrzeodk79', 'SPEED_BACCARAT_1', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-speed-baccarat-1.jpg', '1'),
(957, 's8s9f0quk3ygiyb1', 'SPEED_BACCARAT_3', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-speed-baccarat-3.jpg', '1'),
(958, 'lc419kkmr2sxfpbk', 'MEGA_SIC_BO', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-mega-sic-bo.jpg', '1'),
(959, 'sba71kkmr2ssba71', 'SICBO', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-sic-bo.jpg', '1'),
(960, 'md500q83g7cdefw1', 'MEGA_WHEEL', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-mega-wheel.jpg', '1'),
(961, 'ge49e4os88bp4bi5', 'DRAGON_TIGER', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-dragon-tiger.jpg', '1'),
(962, 'dragon-hatch', 'Dragon Hatch', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/dragon-hatch.jpg', '1'),
(963, 'vampires-charm', 'Vampires Charm', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/vampires-charm.jpg', '1'),
(964, 'bali-vacation', 'Bali Vacation', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/bali-vacation.jpg', '1'),
(965, 'jack-frosts', 'Jack Frosts Winter', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/jack-frosts.jpg', '1'),
(966, 'heist-stakes', 'Heist  Stakes', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/heist-stakes.jpg', '1'),
(967, 'buffalo-win', 'Buffalo Win', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/buffalo-win.jpg', '1'),
(968, 'asgardian-rs', 'Asgardian Rising', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/asgardian-rising.jpg', '1'),
(969, 'alchemy-gold', 'Alchemy Gold', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/alchemy-gold.jpg', '1'),
(970, 'diner-delights', 'Diner Delights', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/diner-delights.jpg', '1'),
(971, 'midas-fortune', 'Midas Fortune', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/midas-fortune.jpg', '1'),
(972, 'bakery-bonanza', 'Bakery Bonanza', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/bakery-bonanza.jpg', '1'),
(973, 'songkran-spl', 'Songkran Splash', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/songkran-splash.jpg', '1'),
(974, 'dragon-hatch2', 'Dragon Hatch2', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/dragon-hatch-2.jpg', '1'),
(975, 'cruise-royale', 'Cruise Royale', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/cruise-royale.jpg', '1'),
(976, 'wild-ape-3258', 'Wild Ape #3258 ', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/wild-ape-3258.jpg', '1'),
(977, 'spr-golf-drive', 'Super Golf Drive', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/super-golf-drive.jpg', '1'),
(978, 'anubis-wrath', 'Anubis Wrath', 'PGSOFT', 'slot', 'https://assets.fiverscool.com/img/pgsoft/anubis-wrath.jpg', '1'),
(979, 'jzbzy021lg8xy9i2', 'ANDAR_BAHAR', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/p1-andar-bahar.jpg', '1'),
(980, 'bigbassnewbb1320', 'BIG_BASS_CRASH', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/big-bass-crash.jpg', '1'),
(981, 'spacemanyxe123nh', 'SPACEMAN', 'PRAGMATICLIVE', 'live', 'https://assets.fiverscool.com/pplive/images/spaceman.jpg', '1'),
(982, 'vs20olympx', 'Gates of Olympus 1000', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20olympx.png', '1'),
(983, 'vs20sugarrushx', 'Sugar Rush 1000', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20sugarrushx.png', '1'),
(984, 'vs20sugrux', 'Sugar Rush Xmas', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20sugrux.png', '1'),
(985, 'vs20fruitswx', 'Sweet Bonanza 1000', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20fruitswx.png', '1'),
(986, 'vswaysbkingasc', 'Buffalo King Untamed Megaways', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysbkingasc.png', '1'),
(987, 'vs5hotbmult', 'Hot To Burn Multiplier', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs5hotbmult.png', '1'),
(988, 'vs20gatotgates', 'Gates of Gatotkaca™', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20gatotgates.png', '1'),
(989, 'vs20gatotx', 'Gates of Gatot Kaca 1000', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20gatotx.png', '1'),
(990, 'vswaysrabbits', '5 Rabbits Megaways™', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysrabbits.png', '1'),
(991, 'vswaysluckyfish', 'Lucky Fishing Megaways™', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysluckyfish.png', '1'),
(992, 'vs20aztecgates', 'Gates of Aztec™', 'PRAGMATIC', 'slot', 'https://api-2103.ppgames.net/game_pic/square/200/vs20aztecgates.png', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_history`
--

CREATE TABLE `tb_history` (
  `id` int(11) NOT NULL,
  `intUser` varchar(255) NOT NULL,
  `extUser` varchar(255) NOT NULL,
  `bet_money` double NOT NULL,
  `win_money` double NOT NULL,
  `provider_code` varchar(255) NOT NULL,
  `game_code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `txn_id` text NOT NULL,
  `txn_type` varchar(255) NOT NULL,
  `user_start_balance` double NOT NULL,
  `user_end_balance` double NOT NULL,
  `created_at` text NOT NULL,
  `agent_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mutasi`
--

CREATE TABLE `tb_mutasi` (
  `id` int(11) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `account` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_cr` date NOT NULL,
  `time_cr` time NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `balance` varchar(255) NOT NULL,
  `ids` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_play`
--

CREATE TABLE `tb_play` (
  `id` int(11) NOT NULL,
  `player` varchar(255) NOT NULL,
  `user` varchar(225) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `gamecode` varchar(255) NOT NULL,
  `tc` text NOT NULL,
  `gamestart` datetime NOT NULL,
  `url` text NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_provider`
--

CREATE TABLE `tb_provider` (
  `id` int(11) NOT NULL,
  `provider_code` varchar(255) NOT NULL,
  `provider_name` varchar(255) NOT NULL,
  `provider_type` varchar(255) NOT NULL,
  `provider_image` text NOT NULL,
  `provider_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_provider`
--

INSERT INTO `tb_provider` (`id`, `provider_code`, `provider_name`, `provider_type`, `provider_image`, `provider_status`) VALUES
(1, 'PRAGMATIC', 'Pragmatic Play', 'slot', '', '1'),
(2, 'HABANERO', 'Habanero', 'slot', '', '1'),
(3, 'BOOONGO', 'Booongo', 'slot', '', '1'),
(4, 'PLAYSON', 'Playson', 'slot', '', '1'),
(5, 'CQ9', 'CQ9', 'slot', '', '1'),
(6, 'EVOPLAY', 'Evoplay', 'slot', '', '1'),
(7, 'TOPTREND', 'TopTrend Gaming', 'slot', '', '1'),
(8, 'DREAMTECH', 'DreamTech', 'slot', '', '1'),
(9, 'PGSOFT', 'PG Soft', 'slot', '', '1'),
(10, 'REELKINGDOM', 'Reel Kingdom', 'slot', '', '1'),
(11, 'EZUGI', 'Ezugi', 'live', '', '1'),
(12, 'EVOLUTION', 'Evolution', 'live', '', '1'),
(13, 'PRAGMATICLIVE', 'Pragmatic Play Live', 'live', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rtp`
--

CREATE TABLE `tb_rtp` (
  `id` int(11) NOT NULL,
  `rtp` double NOT NULL,
  `call_type` varchar(255) NOT NULL,
  `balance` double NOT NULL,
  `user_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaction`
--

CREATE TABLE `tb_transaction` (
  `id` int(11) NOT NULL,
  `trxid` text NOT NULL,
  `intUser` varchar(255) NOT NULL,
  `extUser` varchar(255) NOT NULL,
  `type` enum('deposit','withdraw') NOT NULL,
  `amount` double NOT NULL,
  `before_agent_balance` double NOT NULL,
  `after_agent_balance` double NOT NULL,
  `agent_code` varchar(255) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_transfer`
--

CREATE TABLE `tb_transfer` (
  `id` int(11) NOT NULL,
  `trxid` text NOT NULL,
  `to_agent` varchar(255) NOT NULL,
  `from_agent` varchar(255) NOT NULL,
  `action` enum('deposit','withdraw') NOT NULL,
  `amount` double NOT NULL,
  `before_agent_balance` double NOT NULL,
  `after_agent_balance` double NOT NULL,
  `note` text NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `intUser` varchar(255) NOT NULL,
  `extUser` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `balance` double NOT NULL,
  `agent_code` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `rtp` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_useron`
--

CREATE TABLE `tb_useron` (
  `id` int(11) NOT NULL,
  `extUser` varchar(255) NOT NULL,
  `user_code` varchar(255) NOT NULL,
  `provider_code` varchar(255) NOT NULL,
  `game_code` varchar(255) NOT NULL,
  `bet` double NOT NULL,
  `balance` double NOT NULL,
  `total_debit` double NOT NULL,
  `total_credit` double NOT NULL,
  `target_rtp` double NOT NULL,
  `real_rtp` double NOT NULL,
  `status` enum('ON','OFF') NOT NULL,
  `agent_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_agent`
--
ALTER TABLE `tb_agent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_balance`
--
ALTER TABLE `tb_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_bank`
--
ALTER TABLE `tb_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_biling`
--
ALTER TABLE `tb_biling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_channel`
--
ALTER TABLE `tb_channel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_connect`
--
ALTER TABLE `tb_connect`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_game`
--
ALTER TABLE `tb_game`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_history`
--
ALTER TABLE `tb_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_mutasi`
--
ALTER TABLE `tb_mutasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_play`
--
ALTER TABLE `tb_play`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_provider`
--
ALTER TABLE `tb_provider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_rtp`
--
ALTER TABLE `tb_rtp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_transaction`
--
ALTER TABLE `tb_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_transfer`
--
ALTER TABLE `tb_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_useron`
--
ALTER TABLE `tb_useron`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_agent`
--
ALTER TABLE `tb_agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_balance`
--
ALTER TABLE `tb_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_bank`
--
ALTER TABLE `tb_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_biling`
--
ALTER TABLE `tb_biling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_channel`
--
ALTER TABLE `tb_channel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tb_connect`
--
ALTER TABLE `tb_connect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_game`
--
ALTER TABLE `tb_game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=993;

--
-- AUTO_INCREMENT for table `tb_history`
--
ALTER TABLE `tb_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14403;

--
-- AUTO_INCREMENT for table `tb_mutasi`
--
ALTER TABLE `tb_mutasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_play`
--
ALTER TABLE `tb_play`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_provider`
--
ALTER TABLE `tb_provider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_rtp`
--
ALTER TABLE `tb_rtp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_transaction`
--
ALTER TABLE `tb_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_transfer`
--
ALTER TABLE `tb_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_useron`
--
ALTER TABLE `tb_useron`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
