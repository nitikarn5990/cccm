-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 15, 2015 at 03:43 PM
-- Server version: 5.5.28
-- PHP Version: 5.3.24

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tanonghome_agen`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE IF NOT EXISTS `about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `about_title` text COLLATE utf8_unicode_ci NOT NULL,
  `about_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id`, `about_title`, `about_detail`, `created_at`, `updated_at`) VALUES
(1, 'เกี่ยวกับเรา', '<p><span>วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา</span></p>', '0000-00-00 00:00:00', '2015-06-12 10:39:43');

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE IF NOT EXISTS `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_categories_id` int(11) NOT NULL,
  `activity_title` varchar(150) NOT NULL,
  `activity_ref` varchar(150) NOT NULL,
  `activity` text NOT NULL,
  `short_activity` text NOT NULL,
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_descriptions` text,
  `meta_keywords` text,
  `external_link` text,
  `external_link_ref` varchar(255) NOT NULL,
  `sort` int(5) NOT NULL DEFAULT '0',
  `status` enum('ใช้งาน','ปิดใช้งาน') NOT NULL,
  `activity_date` date NOT NULL,
  `cover_img` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=68 ;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`id`, `activity_categories_id`, `activity_title`, `activity_ref`, `activity`, `short_activity`, `meta_title`, `meta_descriptions`, `meta_keywords`, `external_link`, `external_link_ref`, `sort`, `status`, `activity_date`, `cover_img`, `created_at`, `updated_at`) VALUES
(58, 8, 'พิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้', 'กิจกรรม-อบต', '<p><img style="display: block; margin-left: auto; margin-right: auto;" src="../files/1898223_549109675186228_1837053800_n-tn.jpg" alt="" width="410" height="280" /></p>\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา</strong></p>\n<p>วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา</p>', '  วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา... ', '', '', '', '', '', 0, 'ใช้งาน', '2015-06-26', '20150612163213_1898223_549109675186228_1837053800_n-tn.jpg', '2015-06-12 14:25:45', '2015-06-13 10:45:34'),
(59, 7, 'พิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้', 'กิจกรรม-อบต2', '<p><img style="display: block; margin-left: auto; margin-right: auto;" src="../files/1898223_549109675186228_1837053800_n-tn.jpg" alt="" width="410" height="280" /></p>\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา</strong></p>\n<p>วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา</p>', 'วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา... ', '', '', '', '', '', 0, 'ใช้งาน', '2015-06-26', '20150612165058_1898223_549109675186228_1837053800_n-tn.jpg', '2015-06-12 14:28:33', '2015-06-13 10:36:31'),
(60, 9, 'พิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้', 'asdasd', '<p><img style="display: block; margin-left: auto; margin-right: auto;" src="../files/1898223_549109675186228_1837053800_n-tn.jpg" alt="" width="410" height="280" /></p>\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา</strong></p>\n<p>วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา</p>', 'วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา... วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายก', '', '', '', '', '', 0, 'ใช้งาน', '2015-06-12', '20150612164859_1898223_549109675186228_1837053800_n-tn.jpg', '2015-06-12 15:09:20', '2015-06-12 21:01:13'),
(65, 8, 'พิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้', 'asdasd', '<p><img style="display: block; margin-left: auto; margin-right: auto;" src="../files/1898223_549109675186228_1837053800_n-tn.jpg" alt="" width="410" height="280" /></p>\r\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา</strong></p>\r\n<p>วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา</p>', 'วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา... วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกs', '', '', '', '', '', 0, 'ใช้งาน', '2015-06-12', '20150613105110_1898223_549109675186228_1837053800_n-tn.jpg', '2015-06-12 18:41:09', '2015-06-13 10:51:10'),
(66, 9, 'พิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้', 'adasd', '<p><img style="display: block; margin-left: auto; margin-right: auto;" src="../files/1898223_549109675186228_1837053800_n-tn.jpg" alt="" width="410" height="280" /></p>\r\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา</strong></p>\r\n<p>วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา</p>', 'วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา... วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพร', '', '', '', '', '', 0, 'ใช้งาน', '2015-06-12', '20150613105121_1898223_549109675186228_1837053800_n-tn.jpg', '2015-06-12 18:42:47', '2015-06-13 10:51:21'),
(67, 8, 'พิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ', 'asdasd', '<p><img style="display: block; margin-left: auto; margin-right: auto;" src="../files/1898223_549109675186228_1837053800_n-tn.jpg" alt="" width="410" height="280" /></p>\r\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา</strong></p>\r\n<p>วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา</p>', 'วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา... ', '', '', '', '', '', 0, 'ใช้งาน', '2015-06-27', '20150612191539_1898223_549109675186228_1837053800_n-tn.jpg', '2015-06-12 18:43:12', '2015-06-15 14:00:09');

-- --------------------------------------------------------

--
-- Table structure for table `activity_categories`
--

CREATE TABLE IF NOT EXISTS `activity_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_categories` varchar(100) NOT NULL,
  `activity_categories_ref` varchar(100) NOT NULL,
  `status` enum('ใช้งาน','ปิดใช้งาน') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `activity_categories`
--

INSERT INTO `activity_categories` (`id`, `activity_categories`, `activity_categories_ref`, `status`, `created_at`, `updated_at`) VALUES
(7, 'กิจกรรม 1', 'กิจกรรม-1', 'ใช้งาน', '2015-06-12 13:35:11', '2015-06-13 11:41:43'),
(8, 'กิจกรรม 2', 'กิจกรรม-2', 'ใช้งาน', '2015-06-12 13:36:34', '2015-06-13 11:41:52'),
(9, 'กิจกรรม 3', 'กิจกรรม-3', 'ใช้งาน', '2015-06-12 14:07:24', '2015-06-13 11:42:00');

-- --------------------------------------------------------

--
-- Table structure for table `activity_files`
--

CREATE TABLE IF NOT EXISTS `activity_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `file_name_ref` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` enum('image','file') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'image',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `announce`
--

CREATE TABLE IF NOT EXISTS `announce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `announce_categories_id` int(11) NOT NULL,
  `announce_title` varchar(150) NOT NULL,
  `announce_ref` varchar(150) NOT NULL,
  `announce` text NOT NULL,
  `short_announce` text NOT NULL,
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_descriptions` text,
  `meta_keywords` text,
  `external_link` text,
  `external_link_ref` varchar(255) NOT NULL,
  `sort` int(5) NOT NULL DEFAULT '0',
  `status` enum('ใช้งาน','ปิดใช้งาน') NOT NULL,
  `activity_date` date NOT NULL,
  `cover_img` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

--
-- Dumping data for table `announce`
--

INSERT INTO `announce` (`id`, `announce_categories_id`, `announce_title`, `announce_ref`, `announce`, `short_announce`, `meta_title`, `meta_descriptions`, `meta_keywords`, `external_link`, `external_link_ref`, `sort`, `status`, `activity_date`, `cover_img`, `created_at`, `updated_at`) VALUES
(68, 11, 'พิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ', 'พิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน-และ-พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้-', '<p><img style="display: block; margin-left: auto; margin-right: auto;" src="../files/1898223_549109675186228_1837053800_n-tn.jpg" alt="" width="416" height="284" /></p>\r\n<p>วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา...</p>', '  วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา... ', '', '', '', '', '', 0, 'ใช้งาน', '2015-06-13', '20150613114416_1898223_549109675186228_1837053800_n-tn.jpg', '2015-06-13 11:43:09', '2015-06-15 14:14:01'),
(69, 11, 'พิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ', 'ประกาศ-2', '<p><img src="../files/1898223_549109675186228_1837053800_n-tn.jpg" alt="" width="416" height="284" /></p>\r\n<p>วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา...</p>', '  วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา... ', '', '', '', '', '', 0, 'ใช้งาน', '2015-06-13', '20150613115214_1898223_549109675186228_1837053800_n-tn.jpg', '2015-06-13 11:52:14', '2015-06-15 14:14:29'),
(70, 11, 'พิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ', 'asdas', '<p><img src="../files/1898223_549109675186228_1837053800_n-tn.jpg" alt="" width="416" height="284" /></p>\r\n<p>วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา...</p>', 'asdasdad', '', '', '', '', '', 0, 'ใช้งาน', '2015-06-15', '20150615102414_1898223_549109675186228_1837053800_n-tn.jpg', '2015-06-15 10:24:14', '2015-06-15 14:14:38'),
(71, 11, 'พิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ', 'asdasd', '<p><img src="../files/1898223_549109675186228_1837053800_n-tn.jpg" alt="" width="416" height="284" /></p>\r\n<p>วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา...</p>', 'asasd', '', '', '', '', '', 0, 'ใช้งาน', '2015-06-15', '20150615102518_1898223_549109675186228_1837053800_n-tn.jpg', '2015-06-15 10:25:18', '2015-06-15 14:14:41'),
(72, 11, 'พิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ', 'dasd', '<p><img src="../files/1898223_549109675186228_1837053800_n-tn.jpg" alt="" width="416" height="284" /></p>\r\n<p>วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา...</p>', 'asdasd', '', '', '', '', '', 0, 'ใช้งาน', '2015-06-15', '20150615102546_1898223_549109675186228_1837053800_n-tn.jpg', '2015-06-15 10:25:46', '2015-06-15 14:14:44');

-- --------------------------------------------------------

--
-- Table structure for table `announce_categories`
--

CREATE TABLE IF NOT EXISTS `announce_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `announce_categories` varchar(100) NOT NULL,
  `announce_categories_ref` varchar(100) NOT NULL,
  `status` enum('ใช้งาน','ปิดใช้งาน') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `announce_categories`
--

INSERT INTO `announce_categories` (`id`, `announce_categories`, `announce_categories_ref`, `status`, `created_at`, `updated_at`) VALUES
(10, 'ประกาศ 188', 'ประกาศ-1', 'ใช้งาน', '2015-06-13 11:41:01', '2015-06-13 11:52:59'),
(11, 'ประกาศ 2', 'ประกาศ-2', 'ใช้งาน', '2015-06-13 11:41:20', '2015-06-13 11:41:20'),
(12, 'ประกาศ 3', 'ประกาศ-3', 'ใช้งาน', '2015-06-13 11:41:25', '2015-06-13 11:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `announce_files`
--

CREATE TABLE IF NOT EXISTS `announce_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `announce_id` int(11) NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `file_name_ref` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` enum('image','file') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'image',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=tis620 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `announce_files`
--

INSERT INTO `announce_files` (`id`, `announce_id`, `file_name`, `file_name_ref`, `type`) VALUES
(4, 68, '20150613210218_ubuntu-mono.zip', '20150613210218_ubuntu-mono.zip', 'file');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_title` text COLLATE utf8_unicode_ci NOT NULL,
  `contact_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `line` text COLLATE utf8_unicode_ci NOT NULL,
  `facebook` text COLLATE utf8_unicode_ci NOT NULL,
  `tel` text COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `website` text COLLATE utf8_unicode_ci NOT NULL,
  `fax` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `contact_title`, `contact_detail`, `created_at`, `updated_at`, `line`, `facebook`, `tel`, `address`, `email`, `website`, `fax`) VALUES
(1, 'ติดต่อเรา', '<p><span>องค์การบริหารส่วนตำบลเมืองแปง ต.เมืองแปง อ.ปาย จ.แม่ฮ่องสอน 58130</span></p>\r\n<p><span>โทร : 0-7448-5319 โทรสาร : 0-7448-5319 Email : info@bordang.go.th</span></p>', '2015-04-28 00:00:00', '2015-06-15 12:14:19', 'test_line', 'test_facebook', '0-7448-5319', 'องค์การบริหารส่วนตำบลเมืองแปง ต.เมืองแปง อ.ปาย จ.แม่ฮ่องสอน 58130', 'info@bordang.go.th', 'www.muangpang.go.th', ' 0-7448-5319');

-- --------------------------------------------------------

--
-- Table structure for table `contact_map`
--

CREATE TABLE IF NOT EXISTS `contact_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `google_map` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `contact_map`
--

INSERT INTO `contact_map` (`id`, `google_map`, `created_at`, `updated_at`) VALUES
(1, '<iframe src="https://www.google.com/maps/embed?pb=!1m25!1m12!1m3!1d944.3173164951969!2d98.98181060915746!3d18.7861497393763!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m10!1i0!3e6!4m5!1s0x30da3a9c86fc6d4d%3A0xb9ddede2c31422da!2z4LiX4Li14LmI4LiX4Liz4LiB4Liy4Lij4LmE4Lib4Lij4Lip4LiT4Li14Lii4LmM4Lie4Lij4Liw4Liq4Li04LiH4Lir4LmMIOC4reC4s-C5gOC4oOC4reC5gOC4oeC4t-C4reC4h-C5gOC4iuC4teC4ouC4h-C5g-C4q-C4oeC5iCDguYDguIrguLXguKLguIfguYPguKvguKHguYg!3m2!1d18.786467!2d98.982334!4m1!2z4Lij4Lip4LiT4Li14Lii4LmM4Lie4Lij4Liw4Liq4Li04LiH4Lir4LmMIOC4reC4s-C5gOC4oOC4reC5gOC4oeC4t-C4reC4h-C5gOC4iuC4teC4ouC4h-C5g-C4q-C4oeC5iCDguYDguIrguLXguKLguIfguYPguKvguKHguYg!5e0!3m2!1sth!2sth!4v1428497160559" width="1500" height="244" frameborder="0" style="border:0"></iframe>', '2015-04-02 00:00:00', '2015-06-13 11:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `contact_message`
--

CREATE TABLE IF NOT EXISTS `contact_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txt_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `txt_email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `txt_tel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `txt_subject` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `txt_message` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('อ่านแล้ว','ยังไม่ได้อ่าน') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=26 ;

--
-- Dumping data for table `contact_message`
--

INSERT INTO `contact_message` (`id`, `txt_name`, `txt_email`, `txt_tel`, `txt_subject`, `txt_message`, `status`, `created_at`, `updated_at`) VALUES
(25, 'นิติกาล แสงสุข', 'nitikarnboom2030@gmail.com', '08845456465', 'subject', 'detail', 'อ่านแล้ว', '2015-06-15 09:45:42', '2015-06-15 13:59:09'),
(24, 'นิติกาล แสงสุข', 'nitikarnboom2030@gmail.com', '08845456465', 'subject', 'detail', 'อ่านแล้ว', '2015-06-15 09:38:43', '2015-06-15 09:41:07');

-- --------------------------------------------------------

--
-- Table structure for table `contact_social`
--

CREATE TABLE IF NOT EXISTS `contact_social` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_title` text COLLATE utf8_unicode_ci NOT NULL,
  `contact_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `line` text COLLATE utf8_unicode_ci NOT NULL,
  `facebook` text COLLATE utf8_unicode_ci NOT NULL,
  `tel` text COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE IF NOT EXISTS `contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_categories_id` int(11) NOT NULL,
  `contents_title` varchar(150) NOT NULL,
  `contents_ref` varchar(150) NOT NULL,
  `contents` text NOT NULL,
  `short_contents` text NOT NULL,
  `meta_title` varchar(150) NOT NULL,
  `meta_descriptions` text NOT NULL,
  `meta_keywords` text NOT NULL,
  `external_link` text NOT NULL,
  `external_link_ref` varchar(255) NOT NULL,
  `sort` int(5) NOT NULL DEFAULT '0',
  `status` enum('ใช้งาน','ปิดใช้งาน') NOT NULL,
  `activity_date` date NOT NULL,
  `cover_img` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `content_categories_id`, `contents_title`, `contents_ref`, `contents`, `short_contents`, `meta_title`, `meta_descriptions`, `meta_keywords`, `external_link`, `external_link_ref`, `sort`, `status`, `activity_date`, `cover_img`, `created_at`, `updated_at`) VALUES
(56, 4, 'วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย', 'วันที่-6-มิถุนายน-2558-เวลา-14-00-น-นายปิยะศักดิ์-ยโสธนชัย', '<p><img style="display: block; margin-left: auto; margin-right: auto;" src="../files/1898223_549109675186228_1837053800_n-tn.jpg" alt="" width="428" height="292" /></p>\r\n<p><strong>วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา</strong></p>\r\n<p>วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา</p>', 'วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา\r\n\r\nวันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา', '', '', '', '', '', 1, 'ใช้งาน', '2015-06-01', '', '2015-06-12 12:08:15', '2015-06-12 15:54:50'),
(57, 4, 'วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย', 'วันที่-6-มิถุนายน-2558-เวลา-14-00-น-นายปิยะศักดิ์-ยโสธนชัย', '<p><img style="display: block; margin-left: auto; margin-right: auto;" src="../files/1898223_549109675186228_1837053800_n-tn.jpg" alt="" width="428" height="292" /></p>\r\n<p><strong>วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา</strong></p>\r\n<p>วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา</p>', 'วันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา\r\n\r\nวันที่ 6 มิถุนายน 2558 เวลา 14:00 น. นายปิยะศักดิ์ ยโสธนชัย นายกเทศมนตรีเมืองแม่โจ้ เข้าร่วมพิธีอัญเชิญพระบรมสารีริกธาตุประประดิษฐาน และ พิธีพุทธาภิเษกพระประธานประจำมหาวิทยาลัยแม่โจ้ ณ มหา', '', '', '', '', '', 1, 'ใช้งาน', '2015-06-01', '', '2015-06-12 12:08:15', '2015-06-12 12:08:15');

-- --------------------------------------------------------

--
-- Table structure for table `contents_files`
--

CREATE TABLE IF NOT EXISTS `contents_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contents_id` int(11) NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `file_name_ref` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` enum('image','file') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'image',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `content_categories`
--

CREATE TABLE IF NOT EXISTS `content_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_categories` varchar(100) NOT NULL,
  `content_categories_ref` varchar(100) NOT NULL,
  `status` enum('ใช้งาน','ปิดใช้งาน') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `content_categories`
--

INSERT INTO `content_categories` (`id`, `content_categories`, `content_categories_ref`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ข่าวทั่วไป', 'ข่าวทั่วไป', 'ใช้งาน', '2014-02-09 16:40:58', '2015-06-12 12:19:12'),
(2, 'ข่าวอบต', 'ข่าวอบต', 'ใช้งาน', '2014-02-09 16:41:03', '2015-06-12 12:19:33'),
(4, 'ข่าวทั่วไป 2', 'ข่าวทั่วไป-2', 'ใช้งาน', '2014-02-09 18:32:31', '2015-06-12 12:21:35');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE IF NOT EXISTS `gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_categories_id` int(11) NOT NULL,
  `gallery_title` varchar(150) NOT NULL,
  `gallery_ref` varchar(150) NOT NULL,
  `gallery` text NOT NULL,
  `short_gallery` text NOT NULL,
  `gallery_file_name_cover` varchar(255) NOT NULL,
  `meta_title` varchar(150) NOT NULL,
  `meta_descriptions` text NOT NULL,
  `meta_keywords` text NOT NULL,
  `external_link` varchar(255) NOT NULL,
  `external_link_ref` varchar(255) NOT NULL,
  `sort` int(5) NOT NULL DEFAULT '0',
  `activity_date` date NOT NULL,
  `status` enum('ใช้งาน','ปิดใช้งาน') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `gallery_categories_id`, `gallery_title`, `gallery_ref`, `gallery`, `short_gallery`, `gallery_file_name_cover`, `meta_title`, `meta_descriptions`, `meta_keywords`, `external_link`, `external_link_ref`, `sort`, `activity_date`, `status`, `created_at`, `updated_at`) VALUES
(66, 2, 'ประชุมเตรียมความพร้อมการจัดงานศิลปหัตถกรรมนักเรียน ครั้งที่ 64', 'ประชุมเตรียมความพร้อมการจัดงานศิลปหัตถกรรมนักเรียน-ครั้งที่-64', '<p style="text-align: center;">&nbsp; &nbsp; &nbsp; &nbsp;ภาพบรรยากาศ การประชุมเตรียมความพร้อมการจัดงานศิลปหัตถกรรมนักเรียน ครั้งที่ 64 ปีการศึกษา 2557</p>\r\n<p style="text-align: center;">ของผู้บริหารโรงเรียนเฉพาะความพิการ สังกัดสำนักบริหารงานการศึกษาพิเศษ&nbsp;</p>\r\n<p style="text-align: center;">ในวันที่ 4 พฤศจิกายน 2557 ณ โรงแรมริเวอร์ไซด์ กรุงเทพ</p>\r\n<p style="text-align: center;">&nbsp;</p>', 'ณ โรงแรมริเวอร์ไซด์ กรุงเทพ', '20141119002214_10556445_729050803844913_723916613631724463_n.jpg', '', '', '', 'https://www.facebook.com/media/set/?set=a.729050697178257.1073741825.729049763845017&type=3', 'คลิ้กเพื่อดูรูปทั้งหมด', 1, '2014-11-04', 'ใช้งาน', '2014-11-18 23:30:53', '2015-02-25 15:17:03'),
(67, 2, 'ประชุมเตรียมความพร้อมการจัดงานศิลปหัตถกรรมนักเรียน ครั้งที่ 64 ', 'ประชุมเตรียมความพร้อมการจัดงานศิลปหัตถกรรมนักเรียน-ครั้งที่-64-', '<p style="text-align: center;"><span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ภาพบรรยากาศ การประชุมเตรียมความพร้อมกา</span><span>รจัดงานศิลปหัตถกรรมนักเรีย</span><span>น ครั้งที่ 64 ปีการศึกษา 2557 </span></p>\r\n<p style="text-align: center;"><span>ของ</span><span>กลุ่มสถานศึกษาสังกัดสำนักบ</span><span>ริหารงานการศึกษาพิเศษ กลุ่ม 1 และ กลุ่ม 2 ณ โรงเรียนโสตศึกษาจังหวัดนนท</span><span>บุรี</span></p>', 'ณ โรงเรียนโสตศึกษาจังหวัดนนทบุรี', '20141119003551_10009795_729054097177917_5217485568552119320_n.jpg', '', '', '', 'https://www.facebook.com/media/set/?set=a.729054077177919.1073741826.729049763845017&type=3', 'คลิ้กเพื่อดูรูปทั้งหมด', 2, '2014-11-11', 'ใช้งาน', '2014-11-19 00:33:34', '2014-11-19 02:50:28'),
(68, 2, 'พิธีเปิดโครงการพัฒนาบุคลากร ศูนย์การศึกษาพิเศษสัญจร', 'พิธีเปิดโครงการพัฒนาบุคลากร-ศูนย์การศึกษาพิเศษสัญจร', '<pre class="fbPhotoAlbumTitle"><span style="font-size: large;">      พิธีเปิดโครงการพัฒนาบุคลากร ศูนย์การศึกษาพิเศษสัญจร<br />กิจกรรมสานสัมพันธ์เครื่อข่ายส่งเสริมประสิทธิภาพการจัดการศึกษา<br />ศูนย์การศึกษาพิเศษเครือข่ายที่12 ณ ต้นซุง รีสอร์ท จังหวัดนครนายก <br />โดยเชิญวิทยากร ท่านอดุม อินทรเวศน์วิไลและคณะ มาพูดเรื่องวินัย คุณธรรม จริยธรรม<br />สำหรับข้าราชการครู พนักงานราชการ และพี่เลี้ยงเด็กพิการ <br />โดยศูนย์การศึกษาพิเศษมหาจักรีสิรินธร ประจำจังหวัดนครนายก เป็นเจ้าภาพ</span></pre>', 'กิจกรรมสานสัมพันธ์เครื่อข่ายส่งเสริมประสิทธิภาพการจัดการศึกษา\r\nศูนย์การศึกษาพิเศษเครือข่ายที่12 ', '20141120210029_1416487105526.jpg', '', '', '', 'https://www.facebook.com/media/set/?set=a.730819103668083.1073741831.729049763845017&type=3', 'คลิ้กเพื่อดูรูปทั้งหมด', 3, '2014-11-20', 'ใช้งาน', '2014-11-20 20:50:41', '2014-11-20 21:01:46'),
(69, 2, 'ประชุมเตรียมการจัดประชุมวิชาการนานาชาติด้านการศึกษาพิเศษ', 'ประชุมเตรียมการจัดประชุมวิชาการนานาชาติด้านการศึกษาพิเศษ', '<p style="text-align: center;"><span>ประชุมเตรียมการจัดประชุมวิ</span><span>ชาการนานาชาติด้านการศึกษาพ</span><span>ิเศษ</span></p>\r\n<p style="text-align: center;"><span> ในวันที่ 20 พ.ย 2557 ณ ร.ร.เศรษฐเสถียร จังหวัดกรุงเทพมหานคร</span></p>\r\n<p style="text-align: center;"><span> โดยจะจัดงานวันที่ 28 - 30 ก.ค. 2558 </span></p>\r\n<p style="text-align: center;"><span>ณ โรงแรมเซ็ลทราศูนย์ราชการแล</span><span>ะคอนเวนชันเซ็นเตอร์ แจ้งวัฒน กรุงเทพฯ</span></p>\r\n<p style="text-align: center;">&nbsp;</p>', 'ในวันที่ 20 พ.ย 2557 ณ ร.ร.เศรษฐเสถียร จังหวัดกรุงเทพมหานคร', '20141120210600_1416487192881.jpg', '', '', '', 'https://www.facebook.com/media/set/?set=a.730828150333845.1073741832.729049763845017&type=3', 'คลิ้กเพื่อดูรูปทั้งหมด', 4, '2014-11-20', 'ใช้งาน', '2014-11-20 21:06:00', '2015-06-11 12:04:11'),
(72, 1, 'asasd', 'asdsad', '<p>asdad</p>', 'asdsad', '20150611153604_nano_contact.png', '', '', '', 'asdasd', 'asd', 1, '2015-06-04', 'ใช้งาน', '2015-06-11 12:36:21', '2015-06-11 15:38:08');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_categories`
--

CREATE TABLE IF NOT EXISTS `gallery_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_categories` varchar(200) CHARACTER SET utf8 NOT NULL,
  `gallery_categories_ref` varchar(200) CHARACTER SET utf8 NOT NULL,
  `status` enum('ใช้งาน','ปิดใช้งาน') CHARACTER SET utf8 NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=tis620 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `gallery_categories`
--

INSERT INTO `gallery_categories` (`id`, `gallery_categories`, `gallery_categories_ref`, `status`, `created_at`, `updated_at`) VALUES
(1, 'สัมนา ปราจีนบุรี', 'สัมนา-ปราจีนบุรี', 'ใช้งาน', '2014-11-12 16:00:39', '2014-11-18 00:45:15'),
(2, 'ประชุมครู', 'ประชุมครู', 'ใช้งาน', '2014-11-12 16:01:08', '2014-11-18 00:42:22'),
(3, 'กิรกรรมนักเรียน', 'กิรกรรมนักเรียน', 'ใช้งาน', '2014-11-12 16:01:30', '2014-11-12 16:01:30');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_files`
--

CREATE TABLE IF NOT EXISTS `gallery_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `file_name_ref` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=tis620 AUTO_INCREMENT=117 ;

--
-- Dumping data for table `gallery_files`
--

INSERT INTO `gallery_files` (`id`, `gallery_id`, `file_name`, `file_name_ref`) VALUES
(38, 51, '20141112172453_demo_image_03.jpg', '20141112172453_demo_image_03.jpg'),
(39, 51, '20141112172502_demo_image_04.jpg', '20141112172502_demo_image_04.jpg'),
(40, 51, '20141112172658_xx.php', '20141112172658_xx.php'),
(41, 51, '20141112172658_atomymaxsite_thai_utf-8.sql', '20141112172658_atomymaxsite_thai_utf-8.sql'),
(42, 51, '20141112172658_bookout02P.pdf', '20141112172658_bookout02P.pdf'),
(43, 52, '20141112173258_photodune-554618-hotel-bed-with-bathrobe-m1.jpg', '20141112173258_photodune-554618-hotel-bed-with-bathrobe-m1.jpg'),
(44, 52, '20141112173258_photodune-199978-bedroom-with-comfortable-bed-m2.jpg', '20141112173258_photodune-199978-bedroom-with-comfortable-bed-m2.jpg'),
(45, 52, '20141112173258_xx.php', '20141112173258_xx.php'),
(46, 52, '20141112173258_index.html', '20141112173258_index.html'),
(47, 53, '20141113091845_demo_image_03.jpg', 'test'),
(48, 54, '20141113092758_photodune-554618-hotel-bed-with-bathrobe-m1.jpg', 't2'),
(49, 54, '20141113092758_demo_image_03.jpg', 't1'),
(50, 55, '20141113094728_photodune-199978-bedroom-with-comfortable-bed-m2.jpg', '20141113094728_photodune-199978-bedroom-with-comfortable-bed-m2.jpg'),
(51, 56, '20141113094935_demo_image_03.jpg', '20141113094935_demo_image_03.jpg'),
(52, 57, '20141113095604_photodune-199978-bedroom-with-comfortable-bed-m2.jpg', 'x2'),
(53, 57, '20141113095604_demo_image_03.jpg', 'x1'),
(54, 58, '20141113095653_demo_image_03.jpg', 'x2'),
(55, 58, '20141113095653_demo_image_04.jpg', 'x1'),
(56, 59, '20141113095916_demo_image_03.jpg', 'x2'),
(57, 59, '20141113095916_demo_image_04.jpg', 'x1'),
(58, 60, '20141113100058_demo_image_03.jpg', 'v2'),
(59, 60, '20141113100058_demo_image_04.jpg', 'v1'),
(60, 61, '20141113100346_photodune-554618-hotel-bed-with-bathrobe-m1.jpg', '20141113100346_photodune-554618-hotel-bed-with-bathrobe-m1.jpg'),
(61, 61, '20141113100346_demo_image_04.jpg', '20141113100346_demo_image_04.jpg'),
(62, 62, '20141113100538_photodune-554618-hotel-bed-with-bathrobe-m1.jpg', '20141113100538_photodune-554618-hotel-bed-with-bathrobe-m1.jpg'),
(63, 62, '20141113100538_demo_image_04.jpg', '20141113100538_demo_image_04.jpg'),
(64, 63, '20141113100605_demo_image_04.jpg', '20141113100605_demo_image_04.jpg'),
(65, 63, '20141113100605_photodune-554618-hotel-bed-with-bathrobe-m1.jpg', '20141113100605_photodune-554618-hotel-bed-with-bathrobe-m1.jpg'),
(66, 64, '20141113100657_demo_image_03.jpg', 'dasdad'),
(67, 60, '20141114121605_ffa_logo.jpg', '20141114121605_ffa_logo.jpg'),
(68, 64, '20141114121649_ffa_logo.jpg', '20141114121649_ffa_logo.jpg'),
(69, 61, '20141114121715_ffa_logo.jpg', '20141114121715_ffa_logo.jpg'),
(70, 65, '20141114122443_ffa_logo.jpg', '20141114122443_ffa_logo.jpg'),
(71, 65, '20141114122443_footer.png', '20141114122443_footer.png'),
(72, 51, '20141112172658_bookout02P.pdf', '20141112172658_bookout02P.pdf'),
(73, 51, '20141112172658_xx.php', '20141112172658_xx.php'),
(79, 70, '', ''),
(80, 71, '', ''),
(83, 66, '20141119002214_10556445_729050803844913_723916613631724463_n.jpg', 'https-www-facebook-com-media-set-set-a-729050697178257-1073741825-729049763845017-type-1'),
(84, 66, '20141119002353_10556445_729050803844913_723916613631724463_n.jpg', '20141119002353_10556445_729050803844913_723916613631724463_n.jpg'),
(86, 66, '20141119002523_10516799_729050720511588_3574246993592413642_n.jpg', '20141119002523_10516799_729050720511588_3574246993592413642_n.jpg'),
(87, 66, '20141119002523_1723402_729050900511570_4309673069365659522_n.jpg', '20141119002523_1723402_729050900511570_4309673069365659522_n.jpg'),
(89, 67, '20141119003551_10009795_729054097177917_5217485568552119320_n.jpg', '20141119003551_10009795_729054097177917_5217485568552119320_n.jpg'),
(90, 67, '20141119003551_1779130_729054090511251_1735945753309829300_n.jpg', '20141119003551_1779130_729054090511251_1735945753309829300_n.jpg'),
(91, 67, '20141119003551_10511264_729054093844584_713940351438248012_n.jpg', '20141119003551_10511264_729054093844584_713940351438248012_n.jpg'),
(100, 68, '20141120210029_1416487105526.jpg', '20141120210029_1416487105526.jpg'),
(101, 68, '20141120210029_1416487111249.jpg', '20141120210029_1416487111249.jpg'),
(102, 68, '20141120210029_1416487117867.jpg', '20141120210029_1416487117867.jpg'),
(103, 68, '20141120210029_1416487122144.jpg', '20141120210029_1416487122144.jpg'),
(104, 69, '20141120210600_1416487178278.jpg', '20141120210600_1416487178278.jpg'),
(105, 69, '20141120210600_1416487192881.jpg', '20141120210600_1416487192881.jpg'),
(107, 70, '20150226205224_', '20150226205224_'),
(108, 71, '20150226205317_3', '20150226205317_3'),
(109, 72, '20150611123621_Z20150503103539_image.jpg', '20150611123621_Z20150503103539_image.jpg'),
(110, 72, '20150611123621_ww.png', '20150611123621_ww.png'),
(112, 72, '20150611153604_Z20150503103539_image.jpg', '20150611153604_Z20150503103539_image.jpg'),
(113, 72, '20150611153604_ww.png', '20150611153604_ww.png'),
(114, 72, '20150611153604_thailand_flag_16.png', '20150611153604_thailand_flag_16.png'),
(115, 72, '20150611153604_sb-watermark.png', '20150611153604_sb-watermark.png'),
(116, 72, '20150611153604_nano_contact.png', '20150611153604_nano_contact.png');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE IF NOT EXISTS `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_categories_id` int(11) NOT NULL,
  `manager_title` varchar(150) NOT NULL,
  `manager_ref` varchar(150) NOT NULL,
  `manager` text NOT NULL,
  `short_manager` text NOT NULL,
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_descriptions` text,
  `meta_keywords` text,
  `external_link` text,
  `external_link_ref` varchar(255) NOT NULL,
  `sort` int(5) NOT NULL DEFAULT '0',
  `status` enum('ใช้งาน','ปิดใช้งาน') NOT NULL,
  `activity_date` date NOT NULL,
  `cover_img` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`id`, `manager_categories_id`, `manager_title`, `manager_ref`, `manager`, `short_manager`, `meta_title`, `meta_descriptions`, `meta_keywords`, `external_link`, `external_link_ref`, `sort`, `status`, `activity_date`, `cover_img`, `created_at`, `updated_at`) VALUES
(68, 10, 'ฟหกฟหก', 'ฟหกฟหก', '<p><img src="../files/manager.jpg" alt="" width="670" height="679" /></p>', 'ฟหกฟกฟหก', '', '', '', '', '', 0, 'ใช้งาน', '2015-06-13', '', '2015-06-13 15:14:44', '2015-06-13 18:06:29'),
(69, 11, 'ฟกฟหก', 'ฟกฟหก', '<p><img src="../files/manager.jpg" alt="" width="670" height="679" /></p>', '', '', '', '', '', '', 0, 'ใช้งาน', '2015-06-13', '', '2015-06-13 18:08:14', '2015-06-13 18:08:14'),
(70, 12, 'เลขา', 'เลขา', '<p><img src="../files/manager.jpg" alt="" width="670" height="679" /></p>', '', '', '', '', '', '', 0, 'ใช้งาน', '2015-06-13', '', '2015-06-13 18:16:12', '2015-06-13 18:17:11');

-- --------------------------------------------------------

--
-- Table structure for table `manager_categories`
--

CREATE TABLE IF NOT EXISTS `manager_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_categories` varchar(100) NOT NULL,
  `manager_categories_ref` varchar(100) NOT NULL,
  `status` enum('ใช้งาน','ปิดใช้งาน') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `manager_categories`
--

INSERT INTO `manager_categories` (`id`, `manager_categories`, `manager_categories_ref`, `status`, `created_at`, `updated_at`) VALUES
(10, 'ผู้บริหาร ', 'คณะผู้บริหาร-', 'ใช้งาน', '2015-06-13 14:58:20', '2015-06-13 14:58:20'),
(11, 'กรรมการ', 'คณะกรรมการ', 'ใช้งาน', '2015-06-13 14:58:36', '2015-06-13 14:58:50'),
(12, 'เลขา', 'เลขา', 'ใช้งาน', '2015-06-13 18:16:55', '2015-06-13 18:16:55');

-- --------------------------------------------------------

--
-- Table structure for table `manager_files`
--

CREATE TABLE IF NOT EXISTS `manager_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_id` int(11) NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `file_name_ref` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` enum('image','file') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'image',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=tis620 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE IF NOT EXISTS `slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slides_name` varchar(200) NOT NULL,
  `status` enum('ใช้งาน','ปิดใช้งาน') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sort` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `slides_name`, `status`, `created_at`, `updated_at`, `sort`) VALUES
(67, 'image_1', 'ใช้งาน', '2014-11-14 17:24:08', '2015-06-15 11:39:55', 1),
(68, 'image_2', 'ใช้งาน', '2014-11-14 17:29:14', '2015-06-15 11:40:00', 2),
(71, 'image_3', 'ใช้งาน', '2014-11-14 17:45:23', '2015-06-15 11:40:06', 3),
(72, 'image_4', 'ใช้งาน', '2014-11-14 17:46:16', '2015-06-15 11:40:12', 4);

-- --------------------------------------------------------

--
-- Table structure for table `slides_files`
--

CREATE TABLE IF NOT EXISTS `slides_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slides_id` int(11) NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `file_name_ref` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=tis620 AUTO_INCREMENT=100 ;

--
-- Dumping data for table `slides_files`
--

INSERT INTO `slides_files` (`id`, `slides_id`, `file_name`, `file_name_ref`) VALUES
(76, 74, '20141114232310_img.gif', '20141114232310_img.gif'),
(79, 73, '20141115084947_img.gif', 'dddd'),
(81, 75, '20141115090424_img.gif', '20141115090424_img.gif'),
(83, 70, '20141115092816_idcard.jpg', '20141115092816_idcard.jpg'),
(84, 70, '20141115092839_etheme_slide111.jpg', '20141115092839_etheme_slide111.jpg'),
(85, 70, '20141115092933_good-coffee.jpg', '20141115092933_good-coffee.jpg'),
(86, 70, '20141115092945_img.gif', '20141115092945_img.gif'),
(87, 75, '20141115093308_img.gif', '20141115093308_img.gif'),
(93, 74, '20141119004938_1920334_729050827178244_1287022478288981897_n.jpg', '20141119004938_1920334_729050827178244_1287022478288981897_n.jpg'),
(94, 74, '20141119005020_1920334_729050827178244_1287022478288981897_n.jpg', '20141119005020_1920334_729050827178244_1287022478288981897_n.jpg'),
(96, 67, '20150615111534_1898223_549109675186228_1837053800_n-tn.jpg', '20150615111534_1898223_549109675186228_1837053800_n-tn.jpg'),
(97, 68, '20150615111543_1898223_549109675186228_1837053800_n-tn.jpg', '20150615111543_1898223_549109675186228_1837053800_n-tn.jpg'),
(98, 71, '20150615111555_1898223_549109675186228_1837053800_n-tn.jpg', '20150615111555_1898223_549109675186228_1837053800_n-tn.jpg'),
(99, 72, '20150615111610_1898223_549109675186228_1837053800_n-tn.jpg', '20150615111610_1898223_549109675186228_1837053800_n-tn.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_groups_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `hash_key` varchar(100) NOT NULL,
  `name` varchar(200) NOT NULL,
  `idcard` varchar(13) NOT NULL,
  `email` varchar(200) NOT NULL,
  `tel` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `province_id` int(11) NOT NULL,
  `postcode` int(5) NOT NULL,
  `status` enum('ใช้งาน','ปิดใช้งาน') NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_groups_id`, `username`, `password`, `hash_key`, `name`, `idcard`, `email`, `tel`, `address`, `province_id`, `postcode`, `status`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'n9hUi3ONPDEmQ5yh3iCq6aW1UbpMPZn4DJ+dWBDpPTE=', 'CDEGILMNSVYZ0479abdefhklmnopuy', 'Admin Administrator', '0000000000000', 'teerapatchanpho@gmail.com', '0820387900', '000', 45, 57110, 'ใช้งาน', '0000-00-00 00:00:00', '2014-02-09 15:39:33', '2015-06-13 22:15:05');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
