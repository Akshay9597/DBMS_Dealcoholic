-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 23, 2017 at 07:52 PM
-- Server version: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dealcoholic`
--

-- --------------------------------------------------------

--
-- Table structure for table `creditcardsdetails`
--

CREATE TABLE IF NOT EXISTS `creditcardsdetails` (
  `creditusername` varchar(16) NOT NULL,
  `creditcardno` varchar(16) NOT NULL,
  `cardtype` varchar(16) NOT NULL,
  `cvvnumber` int(11) NOT NULL,
  `expirydate` date DEFAULT NULL,
  `userid` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `userid` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `firstname` varchar(16) NOT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `address` varchar(16) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `email` varchar(16) NOT NULL,
  `phonenumber` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `inventoryid` int(16) NOT NULL,
  `itemname` varchar(16) NOT NULL,
  `company` varchar(16) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE IF NOT EXISTS `orderdetails` (
  `orderid` int(11) NOT NULL,
  `userid` varchar(16) NOT NULL,
  `recievername` varchar(16) NOT NULL,
  `typeofshipping` varchar(16) NOT NULL,
  `zip` int(11) NOT NULL,
  `dateofpurchase` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchasehistory`
--

CREATE TABLE IF NOT EXISTS `purchasehistory` (
  `userid` varchar(16) NOT NULL,
  `inventoryid` varchar(16) NOT NULL,
  `dateofpurchase` date NOT NULL,
  `orderid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shippingtype`
--

CREATE TABLE IF NOT EXISTS `shippingtype` (
  `typeofshipping` varchar(16) NOT NULL,
  `price` double NOT NULL,
  `approximatedaysfordelivery` int(11) DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcartitems`
--

CREATE TABLE IF NOT EXISTS `shoppingcartitems` (
  `shoppingcartid` int(16) NOT NULL,
  `inventoryid` varchar(16) NOT NULL,
  `date` date NOT NULL,
  `price` double NOT NULL,
  `userid` varchar(16) NOT NULL,
  `quantity` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `zipname`
--

CREATE TABLE IF NOT EXISTS `zipname` (
  `zip` int(11) NOT NULL,
  `city` varchar(16) NOT NULL,
  `state` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zipname`
--

INSERT INTO `zipname` (`zip`, `city`, `state`) VALUES
(100, 'Pune', 'Maharashtra'),
(101, 'Mumbai', 'Maharashtra'),
(102, 'Jaipur', 'Rajasthan'),
(103, 'Bhopal', 'Madhya Pradesh'),
(104, 'Chennai', 'Tamil Nadu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `creditcardsdetails`
--
ALTER TABLE `creditcardsdetails`
  ADD PRIMARY KEY (`creditusername`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `zip` (`zip`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`inventoryid`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `zip` (`zip`);

--
-- Indexes for table `purchasehistory`
--
ALTER TABLE `purchasehistory`
  ADD KEY `userid` (`userid`),
  ADD KEY `orderid` (`orderid`);

--
-- Indexes for table `shippingtype`
--
ALTER TABLE `shippingtype`
  ADD PRIMARY KEY (`typeofshipping`);

--
-- Indexes for table `shoppingcartitems`
--
ALTER TABLE `shoppingcartitems`
  ADD PRIMARY KEY (`shoppingcartid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `zipname`
--
ALTER TABLE `zipname`
  ADD PRIMARY KEY (`zip`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `creditcardsdetails`
--
ALTER TABLE `creditcardsdetails`
  ADD CONSTRAINT `creditcardsdetails_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `customer` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`zip`) REFERENCES `zipname` (`zip`) ON DELETE SET NULL;

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `customer` (`userid`) ON DELETE CASCADE,
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`zip`) REFERENCES `zipname` (`zip`) ON DELETE CASCADE;

--
-- Constraints for table `purchasehistory`
--
ALTER TABLE `purchasehistory`
  ADD CONSTRAINT `purchasehistory_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `customer` (`userid`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchasehistory_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `orderdetails` (`orderid`) ON DELETE CASCADE;

--
-- Constraints for table `shoppingcartitems`
--
ALTER TABLE `shoppingcartitems`
  ADD CONSTRAINT `shoppingcartitems_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `customer` (`userid`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
