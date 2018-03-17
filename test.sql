-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.2.12-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for afri_artisan
CREATE DATABASE IF NOT EXISTS `afri_artisan` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;
USE `afri_artisan`;

-- Dumping structure for table afri_artisan.ta_pil_product_image_locationtm_odd_order_detailtm_odd_order_detail
CREATE TABLE IF NOT EXISTS `ta_pil_product_image_location` (
  `pil_code` int(11) NOT NULL AUTO_INCREMENT,
  `prd_code` int(11) NOT NULL,
  `pil_image_location` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `imt_code` int(11) NOT NULL,
  PRIMARY KEY (`pil_code`),
  KEY `FK_PRD_PIL` (`prd_code`),
  KEY `FK_IMT_PIL` (`imt_code`),
  CONSTRAINT `FK_IMT_PIL` FOREIGN KEY (`imt_code`) REFERENCES `tr_imt_image_type` (`imt_code`),
  CONSTRAINT `FK_PRD_PIL` FOREIGN KEY (`prd_code`) REFERENCES `tm_prd_product` (`prd_code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Stores reference to product image locations';

-- Dumping data for table afri_artisan.ta_pil_product_image_location: ~4 rows (approximately)
/*!40000 ALTER TABLE `ta_pil_product_image_location` DISABLE KEYS */;
INSERT INTO `ta_pil_product_image_location` (`pil_code`, `prd_code`, `pil_image_location`, `imt_code`) VALUES
	(1, 14, '02-01-00-01.jpg', 1),
	(2, 13, '02-01-00-02.jpg', 1),
	(3, 12, '02-01-00-03.jpg', 1),
	(4, 11, '02-01-00-04.jpg', 1),
	(5, 11, '02-01-00-04(2).JPG', 1);
/*!40000 ALTER TABLE `ta_pil_product_image_location` ENABLE KEYS */;

-- Dumping structure for table afri_artisan.tm_odd_order_detail
CREATE TABLE IF NOT EXISTS `tm_odd_order_detail` (
  `odd_code` int(11) NOT NULL AUTO_INCREMENT,
  `ord_code` int(11) NOT NULL DEFAULT 0,
  `prd_code` int(11) NOT NULL DEFAULT 0,
  `odd_quantity` int(11) NOT NULL DEFAULT 0,
  `odd_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`odd_code`),
  KEY `FK_ORD_ODD` (`ord_code`),
  KEY `FK_PRD_ODD` (`prd_code`),
  CONSTRAINT `FK_ORD_ODD` FOREIGN KEY (`ord_code`) REFERENCES `tm_ord_order` (`ord_code`),
  CONSTRAINT `FK_PRD_ODD` FOREIGN KEY (`prd_code`) REFERENCES `tm_prd_product` (`prd_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Order Details ';

-- Dumping data for table afri_artisan.tm_odd_order_detail: ~0 rows (approximately)
/*!40000 ALTER TABLE `tm_odd_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm_odd_order_detail` ENABLE KEYS */;

-- Dumping structure for table afri_artisan.tm_ord_order
CREATE TABLE IF NOT EXISTS `tm_ord_order` (
  `ord_code` int(11) NOT NULL AUTO_INCREMENT,
  `usr_code` int(11) NOT NULL DEFAULT 0,
  `ord_create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `ord_deliver_date` datetime DEFAULT NULL,
  `ord_total_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`ord_code`),
  KEY `FK_USR_ORD` (`usr_code`),
  CONSTRAINT `FK_USR_ORD` FOREIGN KEY (`usr_code`) REFERENCES `tm_usr_user` (`usr_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Order Table';

-- Dumping data for table afri_artisan.tm_ord_order: ~0 rows (approximately)
/*!40000 ALTER TABLE `tm_ord_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm_ord_order` ENABLE KEYS */;

-- Dumping structure for table afri_artisan.tm_prd_product
CREATE TABLE IF NOT EXISTS `tm_prd_product` (
  `prd_code` int(11) NOT NULL AUTO_INCREMENT,
  `pdt_code` int(11) NOT NULL,
  `prd_item_number` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `prd_item_description` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `prd_dimensions` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `prd_colour` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `prd_cost` decimal(10,2) NOT NULL,
  `prd_weight` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `prd_date_added` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`prd_code`),
  KEY `FK_PDT_PRD` (`pdt_code`),
  CONSTRAINT `FK_PDT_PRD` FOREIGN KEY (`pdt_code`) REFERENCES `tr_pdt_product_type` (`pdt_code`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Dumping data for table afri_artisan.tm_prd_product: ~59 rows (approximately)
/*!40000 ALTER TABLE `tm_prd_product` DISABLE KEYS */;
INSERT INTO `tm_prd_product` (`prd_code`, `pdt_code`, `prd_item_number`, `prd_item_description`, `prd_dimensions`, `prd_colour`, `prd_cost`, `prd_weight`, `prd_date_added`) VALUES
	(1, 4, '02-01-00-23', 'stuffed felt reindeer', 'height 12.5cm', 'red', 50.00, '7', '2018-02-17 20:05:34'),
	(2, 4, '02-01-00-22', 'stuffed felt giraffe', 'height 14.5cm', 'yellow', 50.00, '7', '2018-02-17 20:05:34'),
	(3, 4, '02-01-00-21', 'stuffed felt elephant', 'height 9cm', 'blue', 50.00, '7', '2018-02-17 20:05:34'),
	(4, 4, '02-01-00-20', 'beaded star', '11cm (excluding ribbon trim)', 'silver/white', 50.00, '17', '2018-02-17 20:05:34'),
	(5, 4, '02-01-00-19', 'beaded star', '11cm (excluding ribbon trim)', 'multi', 50.00, '17', '2018-02-17 20:05:34'),
	(6, 4, '02-01-00-18', 'beaded star', '11cm (excluding ribbon trim)', 'gold/white', 50.00, '17', '2018-02-17 20:05:34'),
	(7, 4, '02-01-00-08', 'beaded candy cane', '12cm (excluding ribbon trim)', 'red/white/silver', 45.00, '11', '2018-02-17 20:05:34'),
	(8, 4, '02-01-00-07', 'beaded candy cane', '12cm (excluding ribbon trim)', 'gold/white', 45.00, '11', '2018-02-17 20:05:34'),
	(9, 4, '02-01-00-06', 'beaded bauble', 'diameter 3.7cm', 'red/white  ', 60.00, '15', '2018-02-17 20:05:34'),
	(10, 4, '02-01-00-05', 'beaded bauble', 'diameter 3.7cm', 'multi', 60.00, '15', '2018-02-17 20:05:34'),
	(11, 4, '02-01-00-04', 'beaded bauble', 'diameter 3.7cm', 'gold/white', 60.00, '15', '2018-02-17 20:05:34'),
	(12, 4, '02-01-00-03', 'beaded angel', 'height 10cm', 'silver/white', 45.00, '13', '2018-02-17 20:05:34'),
	(13, 4, '02-01-00-02', 'beaded angel', 'height 10cm', 'red/white/silver', 45.00, '13', '2018-02-17 20:05:34'),
	(14, 4, '02-01-00-01', 'beaded angel', 'height 10cm', 'multi', 45.00, '13', '2018-02-17 20:05:34'),
	(15, 1, '01-03-08-58', 'imfashini flat bracelet ', '20cm', 'oxblood', 125.00, '8', '2018-02-17 20:05:34'),
	(16, 1, '01-03-08-56', 'amavovo multistring bracelet', '20cm', 'oxblood', 150.00, '23', '2018-02-17 20:05:34'),
	(17, 1, '01-03-07-53', 'amavovo multistring bracelet', '20cm', 'pewter', 150.00, '23', '2018-02-17 20:05:34'),
	(18, 1, '01-03-06-52', 'lula flat bracelet', '20cm', 'treasures', 99.00, '6', '2018-02-17 20:05:34'),
	(19, 1, '01-03-06-49', 'amavovo multistring bracelet', '20cm', 'treasures', 150.00, '23', '2018-02-17 20:05:34'),
	(20, 1, '01-03-05-46', 'lula flat bracelet', '20cm', 'coral', 99.00, '6', '2018-02-17 20:05:34'),
	(21, 1, '01-03-05-45', 'imfashini flat bracelet ', '20cm', 'coral', 125.00, '8', '2018-02-17 20:05:34'),
	(22, 1, '01-03-04-42', 'imfashini flat bracelet ', '20cm', 'sahara', 125.00, '8', '2018-02-17 20:05:34'),
	(23, 1, '01-03-03-39', 'lula flat bracelet', '20cm', 'ballet', 99.00, '6', '2018-02-17 20:05:34'),
	(24, 1, '01-03-02-34', 'lula flat bracelet', '20cm', 'monochrome', 99.00, '6', '2018-02-17 20:05:34'),
	(25, 1, '01-03-02-33', 'imfashini flat bracelet ', '20cm', 'monochrome', 125.00, '8', '2018-02-17 20:05:34'),
	(26, 1, '01-03-01-29', 'lula flat bracelet', '20cm', 'sapphire', 99.00, '6', '2018-02-17 20:05:34'),
	(27, 1, '01-03-01-27', 'imfashini flat bracelet ', '20cm', 'sapphire', 125.00, '8', '2018-02-17 20:05:34'),
	(28, 1, '01-03-01-24', 'amavovo multistring bracelet', '20cm', 'sapphire', 150.00, '23', '2018-02-17 20:05:34'),
	(29, 3, '01-02-08-59', 'zulu necklace', '80cm', 'oxblood', 299.00, '70', '2018-02-17 20:05:34'),
	(30, 3, '01-02-08-57', 'amavovo multistring necklace', '57cm', 'oxblood', 299.00, '80', '2018-02-17 20:05:34'),
	(31, 3, '01-02-07-55', 'zulu necklace', '80cm', 'pewter', 299.00, '70', '2018-02-17 20:05:34'),
	(32, 3, '01-02-07-54', 'amavovo multistring necklace', '57cm', 'pewter', 299.00, '80', '2018-02-17 20:05:34'),
	(33, 3, '01-02-06-51', 'multiball necklace', '110cm', 'treasures', 250.00, '58', '2018-02-17 20:05:34'),
	(34, 1, '01-02-06-50', 'amavovo multistring bracelet', '20cm', 'ballet', 150.00, '23', '2018-02-17 20:05:34'),
	(35, 3, '01-02-06-50', 'amavovo multistring necklace', '57cm', 'treasures', 299.00, '80', '2018-02-17 20:05:34'),
	(36, 3, '01-02-05-48', 'zulu necklace', '80cm', 'coral', 299.00, '70', '2018-02-17 20:05:34'),
	(37, 3, '01-02-04-44', 'zulu necklace', '80cm', 'sahara', 299.00, '70', '2018-02-17 20:05:34'),
	(38, 3, '01-02-03-37', 'amavovo multistring necklace', '57cm', 'ballet', 299.00, '80', '2018-02-17 20:05:34'),
	(39, 3, '01-02-02-35', 'zulu necklace', '80cm', 'monochrome', 299.00, '70', '2018-02-17 20:05:34'),
	(40, 3, '01-02-01-31', 'zulu necklace', '80cm', 'sapphire', 299.00, '70', '2018-02-17 20:05:34'),
	(41, 3, '01-02-01-25', 'amavovo multistring necklace', '57cm', 'sapphire', 299.00, '80', '2018-02-17 20:05:34'),
	(42, 3, '01-02-00-12', 'multiball necklace', '110cm', 'white', 250.00, '58', '2018-02-17 20:05:34'),
	(43, 3, '01-02-00-11', 'multiball necklace', '110cm', 'red', 250.00, '58', '2018-02-17 20:05:34'),
	(44, 3, '01-02-00-10', 'multiball necklace', '110cm', 'pink', 250.00, '58', '2018-02-17 20:05:34'),
	(45, 3, '01-02-00-09', 'multiball necklace', '110cm', 'blue', 250.00, '58', '2018-02-17 20:05:34'),
	(46, 2, '01-01-05-47', 'teardrop earring', 'height 4cm (excluding hook)', 'coral', 60.00, '5', '2018-02-17 20:05:34'),
	(47, 2, '01-01-04-43', 'teardrop earring', 'height 4cm (excluding hook)', 'sahara', 60.00, '5', '2018-02-17 20:05:34'),
	(48, 2, '01-01-04-41', 'circle earring', '3.5cm diameter', 'sahara', 60.00, '5', '2018-02-17 20:05:34'),
	(49, 2, '01-01-03-40', 'teardrop earring', 'height 4cm (excluding hook)', 'ballet', 60.00, '5', '2018-02-17 20:05:34'),
	(50, 2, '01-01-03-38', 'circle earring', '3.5cm diameter', 'ballet', 60.00, '5', '2018-02-17 20:05:34'),
	(51, 2, '01-01-02-32', 'circle earring', '3.5cm diameter', 'monochrome', 60.00, '5', '2018-02-17 20:05:34'),
	(52, 2, '01-01-01-30', 'teardrop earring', 'height 4cm (excluding hook)', 'sapphire', 60.00, '5', '2018-02-17 20:05:34'),
	(53, 2, '01-01-01-26', 'circle earring', '3.5cm diameter', 'sapphire', 60.00, '5', '2018-02-17 20:05:34'),
	(54, 2, '01-01-00-28', 'ball stud earring', '1cm diameter ', 'blue', 45.00, '1', '2018-02-17 20:05:34'),
	(55, 2, '01-01-00-17', 'ball stud earring', '1cm diameter ', 'white', 45.00, '1', '2018-02-17 20:05:34'),
	(56, 2, '01-01-00-16', 'ball stud earring', '1cm diameter ', 'silver', 45.00, '1', '2018-02-17 20:05:34'),
	(57, 2, '01-01-00-15', 'ball stud earring', '1cm diameter ', 'red', 45.00, '1', '2018-02-17 20:05:34'),
	(58, 2, '01-01-00-14', 'ball stud earring', '1cm diameter ', 'pink', 45.00, '1', '2018-02-17 20:05:34'),
	(59, 2, '01-01-00-13', 'ball stud earring', '1cm diameter ', 'copper', 45.00, '1', '2018-02-17 20:05:34');
/*!40000 ALTER TABLE `tm_prd_product` ENABLE KEYS */;

-- Dumping structure for table afri_artisan.tm_prd_product_copy
CREATE TABLE IF NOT EXISTS `tm_prd_product_copy` (
  `pdt_code` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `prd_item_number` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `prd_item_description` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `prd_dimensions` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `prd_colour` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `prd_cost` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `prd_weight` varchar(500) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table afri_artisan.tm_prd_product_copy: ~59 rows (approximately)
/*!40000 ALTER TABLE `tm_prd_product_copy` DISABLE KEYS */;
INSERT INTO `tm_prd_product_copy` (`pdt_code`, `prd_item_number`, `prd_item_description`, `prd_dimensions`, `prd_colour`, `prd_cost`, `prd_weight`) VALUES
	('decorations', '02-01-00-18', 'beaded star', '11cm (excluding ribbon trim)', 'gold/white', '50.00', '17'),
	('decorations', '02-01-00-19', 'beaded star', '11cm (excluding ribbon trim)', 'multi', '50.00', '17'),
	('decorations', '02-01-00-20', 'beaded star', '11cm (excluding ribbon trim)', 'silver/white', '50.00', '17'),
	('decorations', '02-01-00-07', 'beaded candy cane', '12cm (excluding ribbon trim)', 'gold/white', '45.00', '11'),
	('decorations', '02-01-00-08', 'beaded candy cane', '12cm (excluding ribbon trim)', 'red/white/silver', '45.00', '11'),
	('decorations', '02-01-00-04', 'beaded bauble', 'diameter 3.7cm', 'gold/white', '60.00', '15'),
	('decorations', '02-01-00-05', 'beaded bauble', 'diameter 3.7cm', 'multi', '60.00', '15'),
	('decorations', '02-01-00-06', 'beaded bauble', 'diameter 3.7cm', 'red/white  ', '60.00', '15'),
	('decorations', '02-01-00-21', 'stuffed felt elephant', 'height 9cm', 'blue', '50.00', '7'),
	('decorations', '02-01-00-22', 'stuffed felt giraffe', 'height 14.5cm', 'yellow', '50.00', '7'),
	('decorations', '02-01-00-23', 'stuffed felt reindeer', 'height 12.5cm', 'red', '50.00', '7'),
	('decorations', '02-01-00-01', 'beaded angel', 'height 10cm', 'multi', '45.00', '13'),
	('decorations', '02-01-00-02', 'beaded angel', 'height 10cm', 'red/white/silver', '45.00', '13'),
	('decorations', '02-01-00-03', 'beaded angel', 'height 10cm', 'silver/white', '45.00', '13'),
	('bracelets ', '01-03-01-24', 'amavovo multistring bracelet', '20cm', 'sapphire', '150.00', '23'),
	('bracelets ', '01-02-06-50', 'amavovo multistring bracelet', '20cm', 'ballet', '150.00', '23'),
	('bracelets ', '01-03-06-49', 'amavovo multistring bracelet', '20cm', 'treasures', '150.00', '23'),
	('bracelets ', '01-03-07-53', 'amavovo multistring bracelet', '20cm', 'pewter', '150.00', '23'),
	('bracelets ', '01-03-08-56', 'amavovo multistring bracelet', '20cm', 'oxblood', '150.00', '23'),
	('bracelets ', '01-03-01-29', 'lula flat bracelet', '20cm', 'sapphire', '99.00', '6'),
	('bracelets ', '01-03-02-34', 'lula flat bracelet', '20cm', 'monochrome', '99.00', '6'),
	('bracelets ', '01-03-03-39', 'lula flat bracelet', '20cm', 'ballet', '99.00', '6'),
	('bracelets ', '01-03-05-46', 'lula flat bracelet', '20cm', 'coral', '99.00', '6'),
	('bracelets ', '01-03-06-52', 'lula flat bracelet', '20cm', 'treasures', '99.00', '6'),
	('bracelets ', '01-03-01-27', 'imfashini flat bracelet ', '20cm', 'sapphire', '125.00', '8'),
	('bracelets ', '01-03-02-33', 'imfashini flat bracelet ', '20cm', 'monochrome', '125.00', '8'),
	('bracelets ', '01-03-04-42', 'imfashini flat bracelet ', '20cm', 'sahara', '125.00', '8'),
	('bracelets ', '01-03-05-45', 'imfashini flat bracelet ', '20cm', 'coral', '125.00', '8'),
	('bracelets ', '01-03-08-58', 'imfashini flat bracelet ', '20cm', 'oxblood', '125.00', '8'),
	('earrings ', '01-01-00-13', 'ball stud earring', '1cm diameter ', 'copper', '45.00', '1'),
	('earrings ', '01-01-00-14', 'ball stud earring', '1cm diameter ', 'pink', '45.00', '1'),
	('earrings ', '01-01-00-15', 'ball stud earring', '1cm diameter ', 'red', '45.00', '1'),
	('earrings ', '01-01-00-16', 'ball stud earring', '1cm diameter ', 'silver', '45.00', '1'),
	('earrings ', '01-01-00-17', 'ball stud earring', '1cm diameter ', 'white', '45.00', '1'),
	('earrings ', '01-01-00-28', 'ball stud earring', '1cm diameter ', 'blue', '45.00', '1'),
	('earrings ', '01-01-01-26', 'circle earring', '3.5cm diameter', 'sapphire', '60.00', '5'),
	('earrings ', '01-01-02-32', 'circle earring', '3.5cm diameter', 'monochrome', '60.00', '5'),
	('earrings ', '01-01-03-38', 'circle earring', '3.5cm diameter', 'ballet', '60.00', '5'),
	('earrings ', '01-01-04-41', 'circle earring', '3.5cm diameter', 'sahara', '60.00', '5'),
	('earrings ', '01-01-01-30', 'teardrop earring', 'height 4cm (excluding hook)', 'sapphire', '60.00', '5'),
	('earrings ', '01-01-03-40', 'teardrop earring', 'height 4cm (excluding hook)', 'ballet', '60.00', '5'),
	('earrings ', '01-01-04-43', 'teardrop earring', 'height 4cm (excluding hook)', 'sahara', '60.00', '5'),
	('earrings ', '01-01-05-47', 'teardrop earring', 'height 4cm (excluding hook)', 'coral', '60.00', '5'),
	('necklaces ', '01-02-00-09', 'multiball necklace', '110cm', 'blue', '250.00', '58'),
	('necklaces ', '01-02-00-10', 'multiball necklace', '110cm', 'pink', '250.00', '58'),
	('necklaces ', '01-02-00-11', 'multiball necklace', '110cm', 'red', '250.00', '58'),
	('necklaces ', '01-02-00-12', 'multiball necklace', '110cm', 'white', '250.00', '58'),
	('necklaces ', '01-02-06-51', 'multiball necklace', '110cm', 'treasures', '250.00', '58'),
	('necklaces ', '01-02-01-25', 'amavovo multistring necklace', '57cm', 'sapphire', '299.00', '80'),
	('necklaces ', '01-02-03-37', 'amavovo multistring necklace', '57cm', 'ballet', '299.00', '80'),
	('necklaces ', '01-02-06-50', 'amavovo multistring necklace', '57cm', 'treasures', '299.00', '80'),
	('necklaces ', '01-02-07-54', 'amavovo multistring necklace', '57cm', 'pewter', '299.00', '80'),
	('necklaces ', '01-02-08-57', 'amavovo multistring necklace', '57cm', 'oxblood', '299.00', '80'),
	('necklaces ', '01-02-01-31', 'zulu necklace', '80cm', 'sapphire', '299.00', '70'),
	('necklaces ', '01-02-02-35', 'zulu necklace', '80cm', 'monochrome', '299.00', '70'),
	('necklaces ', '01-02-04-44', 'zulu necklace', '80cm', 'sahara', '299.00', '70'),
	('necklaces ', '01-02-05-48', 'zulu necklace', '80cm', 'coral', '299.00', '70'),
	('necklaces ', '01-02-07-55', 'zulu necklace', '80cm', 'pewter', '299.00', '70'),
	('necklaces ', '01-02-08-59', 'zulu necklace', '80cm', 'oxblood', '299.00', '70');
/*!40000 ALTER TABLE `tm_prd_product_copy` ENABLE KEYS */;

-- Dumping structure for table afri_artisan.tm_usr_user
CREATE TABLE IF NOT EXISTS `tm_usr_user` (
  `usr_code` int(11) NOT NULL AUTO_INCREMENT,
  `usr_email_address` varchar(100) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `usr_password` varchar(1000) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `usr_first_name` varchar(50) COLLATE latin1_general_ci DEFAULT '0',
  `usr_surname` varchar(50) COLLATE latin1_general_ci DEFAULT '0',
  `usr_date_modified` datetime NOT NULL DEFAULT current_timestamp(),
  `usr_last_login_Date` datetime DEFAULT NULL,
  `usr_enabled` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`usr_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Stores all store users that register on web interface';

-- Dumping data for table afri_artisan.tm_usr_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `tm_usr_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm_usr_user` ENABLE KEYS */;

-- Dumping structure for table afri_artisan.tr_csd_country_shipping_details
CREATE TABLE IF NOT EXISTS `tr_csd_country_shipping_details` (
  `csd_code` int(11) NOT NULL AUTO_INCREMENT,
  `cty_code` int(11) NOT NULL DEFAULT 0,
  `csd_shipping_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `csd_min_purchase_free_Shipping` decimal(10,2) NOT NULL DEFAULT 0.00,
  KEY `csd_code` (`csd_code`),
  KEY `FKCTY_CSD` (`cty_code`),
  CONSTRAINT `FKCTY_CSD` FOREIGN KEY (`cty_code`) REFERENCES `tr_cty_country` (`cty_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Country shipping information';

-- Dumping data for table afri_artisan.tr_csd_country_shipping_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `tr_csd_country_shipping_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tr_csd_country_shipping_details` ENABLE KEYS */;

-- Dumping structure for table afri_artisan.tr_cty_country
CREATE TABLE IF NOT EXISTS `tr_cty_country` (
  `cty_code` int(11) NOT NULL AUTO_INCREMENT,
  `cty_country_name` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`cty_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Table to hold all country';

-- Dumping data for table afri_artisan.tr_cty_country: ~0 rows (approximately)
/*!40000 ALTER TABLE `tr_cty_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `tr_cty_country` ENABLE KEYS */;

-- Dumping structure for table afri_artisan.tr_imt_image_type
CREATE TABLE IF NOT EXISTS `tr_imt_image_type` (
  `imt_code` int(11) NOT NULL,
  `imt_type` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`imt_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Stores the image type';

-- Dumping data for table afri_artisan.tr_imt_image_type: ~2 rows (approximately)
/*!40000 ALTER TABLE `tr_imt_image_type` DISABLE KEYS */;
INSERT INTO `tr_imt_image_type` (`imt_code`, `imt_type`) VALUES
	(1, 'Full'),
	(2, 'Thumbnail');
/*!40000 ALTER TABLE `tr_imt_image_type` ENABLE KEYS */;

-- Dumping structure for table afri_artisan.tr_pdt_product_type
CREATE TABLE IF NOT EXISTS `tr_pdt_product_type` (
  `pdt_code` int(11) NOT NULL,
  `pdt_description` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `pdt_enabled` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`pdt_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Product Type Table';

-- Dumping data for table afri_artisan.tr_pdt_product_type: ~4 rows (approximately)
/*!40000 ALTER TABLE `tr_pdt_product_type` DISABLE KEYS */;
INSERT INTO `tr_pdt_product_type` (`pdt_code`, `pdt_description`, `pdt_enabled`) VALUES
	(1, 'Bracelets', b'1'),
	(2, 'Earrings', b'1'),
	(3, 'Necklaces', b'1'),
	(4, 'Decorations', b'1');
/*!40000 ALTER TABLE `tr_pdt_product_type` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
