-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2018 at 08:01 PM
-- Server version: 10.1.36-MariaDB
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
-- Database: `shopping`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro` (IN `o_id` VARCHAR(50))  NO SQL
BEGIN 
SELECT SUM(price) FROM orders WHERE id=o_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `prosum` (IN `o_id` VARCHAR(50), OUT `o_pid` VARCHAR(50), OUT `o_pname` VARCHAR(50), OUT `o_price` INT(50))  NO SQL
BEGIN
 

  DECLARE id,pid,pname text;
  DECLARE price INT;
  DECLARE exit_loop BOOLEAN DEFAULT FALSE;
  DECLARE p_cursor CURSOR FOR SELECT * FROM orders;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;
  OPEN p_cursor;
  
  p_loop: LOOP
  FETCH FROM p_cursor INTO id,pid,pname,price;
  IF exit_loop THEN
   LEAVE   p_loop;
   END IF;
  
  IF id=o_id THEN
   SELECT pid , pname , price INTO   o_pid , o_pname  , o_price  ;
 
  END IF;
  END LOOP p_loop;

  CLOSE p_cursor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `prosum1` (IN `o_id` VARCHAR(50))  NO SQL
BEGIN
  DECLARE id,pid,pname,price text;
  DECLARE exit_loop BOOLEAN DEFAULT FALSE;
  DECLARE p_cursor CURSOR FOR SELECT * FROM orders;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;
  OPEN p_cursor;
  p_loop: LOOP
  FETCH FROM p_cursor INTO id,pid,pname,price;
  IF exit_loop THEN
   LEAVE   p_loop;
   END IF;
  IF id=o_id THEN
  SELECT pid,pname,price ;
   
  END IF;
  END LOOP p_loop;
 
  CLOSE p_cursor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `prosum2` (IN `o_id` VARCHAR(50))  NO SQL
BEGIN
  DECLARE id,pid,pname text;
  DECLARE price,total INT;
  DECLARE exit_loop BOOLEAN DEFAULT FALSE;
  DECLARE p_cursor CURSOR FOR SELECT * FROM orders ;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;
  OPEN p_cursor;
  p_loop: LOOP
  FETCH FROM p_cursor INTO id,pid,pname,price,total;
  IF exit_loop THEN
   LEAVE   p_loop;
   END IF;
 IF id=o_id THEN
  SELECT pid,pname,price;
   END IF;

  END LOOP p_loop;
 
  CLOSE p_cursor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `prosum3` (IN `o_id` VARCHAR(50), OUT `o_total` INT(50))  NO SQL
BEGIN 
SELECT  SUM(price) INTO o_total  FROM orders WHERE id=o_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` varchar(50) NOT NULL,
  `pid` varchar(50) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `price` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `pid`, `pname`, `price`) VALUES
('ramesh', '1', 'Apple Iphone 6s', 29499),
('ramesh', '3', 'Mi LED Smart TV', 25999),
('smith', '6', 'JBL T450 Wired Headset ', 1499),
('james', '3', 'Mi LED Smart TV', 25999),
('smith', '1', 'Apple Iphone 6s', 29499),
('smith', '2', 'One Plus 6T', 37999),
('smith', '2', 'One Plus 6T', 37999),
('smith', '2', 'One Plus 6T', 37999),
('smith', '8', 'Fastrack 3169NM01 Loopholes Watch ', 5160),
('smith', '2', 'One Plus 6T', 37999),
('smith', '8', 'Fastrack 3169NM01 Loopholes Watch ', 5160),
('ramesh', '8', 'Fastrack 3169NM01 Loopholes Watch ', 5160),
('smith', '7', 'Boat Rockerz 4 Bluetooth Headset ', 2010),
('smith', '7', 'Boat Rockerz 4 Bluetooth Headset ', 2010),
('smith', '7', 'Boat Rockerz 4 Bluetooth Headset ', 2010),
('smith', '5', 'Haier Fully Automatic  Washing Machine ', 10499),
('James', '8', 'Fastrack 3169NM01 Loopholes Watch ', 5160),
('ramesh', '2', 'One Plus 6T', 37999),
('ramesh', '1', 'Apple Iphone 6s', 29499),
('ramesh', '2', 'One Plus 6T', 37999),
('ramesh', '2', 'One Plus 6T', 37999),
('ramesh', '2', 'One Plus 6T', 37999),
('ramesh', '3', 'Mi LED Smart TV', 25999),
('James', '2', 'One Plus 6T', 37999),
('James', '2', 'One Plus 6T', 37999),
('James', '2', 'One Plus 6T', 37999),
('smith', '8', 'Fastrack 3169NM01 Loopholes Watch ', 5160),
('ramesh', '2', 'One Plus 6T', 37999),
('ramesh', '2', 'One Plus 6T', 37999),
('James', '7', 'Boat Rockerz 4 Bluetooth Headset ', 2010),
('James', '7', 'Boat Rockerz 4 Bluetooth Headset ', 2010),
('James', '2', 'One Plus 6T', 37999),
('smith', '5', 'Haier Fully Automatic  Washing Machine ', 10499),
('smith', '5', 'Haier Fully Automatic  Washing Machine ', 10499),
('smith', '5', 'Haier Fully Automatic  Washing Machine ', 10499),
('smith', '5', 'Haier Fully Automatic  Washing Machine ', 10499),
('James', '2', 'One Plus 6T', 37999),
('smith', '6', 'JBL T450 Wired Headset ', 1499),
('James', '5', 'Haier Fully Automatic  Washing Machine ', 10499),
('ramesh', '2', 'One Plus 6T', 37999),
('ramesh', '2', 'One Plus 6T', 37999),
('ramesh', '2', 'One Plus 6T', 37999),
('Bond', '5', 'Haier Fully Automatic  Washing Machine ', 10499),
('Bond', '4', 'Ray-Ban Aviator Sunglasses', 5399),
('Bond', '4', 'Ray-Ban Aviator Sunglasses', 5399),
('suresh', '3', 'Mi LED Smart TV', 25999),
('suresh', '3', 'Mi LED Smart TV', 25999),
('suresh', '1', 'Apple Iphone 6s', 29499);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pid` varchar(50) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `price` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pid`, `pname`, `price`) VALUES
('1', 'Apple Iphone 6s', 29499),
('2', 'One Plus 6T', 37999),
('3', 'Mi LED Smart TV', 25999),
('4', 'Ray-Ban Aviator Sunglasses', 5399),
('5', 'Haier Fully Automatic  Washing Machine ', 10499),
('6', 'JBL T450 Wired Headset ', 1499),
('7', 'Boat Rockerz 4 Bluetooth Headset ', 2010),
('8', 'Fastrack 3169NM01 Loopholes Watch ', 5160);

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `delete_logs` AFTER DELETE ON `products` FOR EACH ROW insert into product_logs VALUES(OLD.pid,OLD.pname,'DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_logs` AFTER INSERT ON `products` FOR EACH ROW insert into product_logs VALUES(new.pid,new.pname,'INSERTED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_logs` AFTER UPDATE ON `products` FOR EACH ROW insert into product_logs VALUES(new.pid,new.pname,'UPDATED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product_logs`
--

CREATE TABLE `product_logs` (
  `pid` varchar(50) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_logs`
--

INSERT INTO `product_logs` (`pid`, `pname`, `action`, `date`) VALUES
('9', 'ijo', 'INSERTED', '2018-11-13 18:30:56'),
('4', 'Ray-Ban Aviator Sunglasses', 'UPDATED', '2018-11-13 18:35:35'),
('', '', 'DELETED', '2018-11-13 18:42:15'),
('9', 'DSS', 'INSERTED', '2018-11-13 18:43:32'),
('9', 'DSS', 'UPDATED', '2018-11-13 18:43:57'),
('9', 'DSS', 'DELETED', '2018-11-13 18:44:01');

-- --------------------------------------------------------

--
-- Table structure for table `register1`
--

CREATE TABLE `register1` (
  `name` varchar(50) NOT NULL,
  `id` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register1`
--

INSERT INTO `register1` (`name`, `id`, `password`, `phone`, `address`) VALUES
('', '', '', '', ''),
('James Bond', 'Bond', 'bond', 'Bangalore', '007007007'),
('james', 'james', 'james', 'mysore', '54782631'),
('jhon', 'jhon', 'jhon', '4854854545', 'mysore'),
('jhony', 'jhony', 'jhony', 'delhi\r\n', '4555747788'),
('ramesh', 'ramesh', 'ramesh', '805055224', 'mysore'),
('smith', 'smith', 'smith', 'bangalore', '98748567'),
('suresh', 'suresh', 'suresh', 'mysore', '9857468');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD KEY `id` (`id`,`pid`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `product_logs`
--
ALTER TABLE `product_logs`
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `register1`
--
ALTER TABLE `register1`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id`) REFERENCES `register1` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
