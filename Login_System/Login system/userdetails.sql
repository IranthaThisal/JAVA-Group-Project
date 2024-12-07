-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2024 at 01:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `userdetails`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_ID` int(11) NOT NULL,
  `Admin_name` text NOT NULL,
  `Admin_username` text NOT NULL,
  `Admin_password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Admin_ID`, `Admin_name`, `Admin_username`, `Admin_password`) VALUES
(1, 'Admin_test', 'Admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Full_Name` text NOT NULL,
  `Email` text NOT NULL,
  `Contact_Number` text NOT NULL,
  `Gender` text NOT NULL,
  `Username` text NOT NULL,
  `Password` text NOT NULL,
  `Date_of_Birth` text NOT NULL,
  `Customer_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Full_Name`, `Email`, `Contact_Number`, `Gender`, `Username`, `Password`, `Date_of_Birth`, `Customer_ID`) VALUES
('tom', 'tom@gmail.com', '0872653412', 'Male', 'tommyy', '1', '22/05/2024', 1),
('jerry', 'j@gmail.com', '123', 'Male', 'jerryy', 'abcd', '22/05/2024', 4),
('harry', 'h@gmail.com', '12345678', 'Male', 'harry', 'hh', '23/9/2024', 5),
('sasinima', 'sasinimasiriwardana@gmail.com', '123456789', 'Female', 'test', '12', '02/10/2007', 6),
('thevindu', 'thevindudilmith2001.gmail.com', '12345', 'Male', 'test2', '123', '02/10/2007', 7),
('test2', 'test2@localhost', '122221', 'Male', 'test2', '1234', '02/10/2007', 8);

-- --------------------------------------------------------

--
-- Table structure for table `forgetpassword`
--

CREATE TABLE `forgetpassword` (
  `ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Token` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ExpeiryTime` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `forgetpassword`
--

INSERT INTO `forgetpassword` (`ID`, `Customer_ID`, `Token`, `ExpeiryTime`) VALUES
(34, 8, 'f43b5b91-076a-47ac-a4e5-bb094d5a04fe', '2147483647'),
(35, 8, '5b7ae507-d987-464a-a9d2-dbce5576f42e', '2147483647'),
(36, 8, '0e009ead-bdab-459d-8494-81f21616e67c', '2147483647'),
(37, 8, '7880a589-4726-401a-9c42-19c84cbab118', '2147483647'),
(38, 8, '5dff8456-672a-4753-a896-d2d6f5a519c6', '2147483647'),
(39, 8, '54090096-4db9-499e-bf8c-fba2f8e54190', '2147483647'),
(40, 8, '2ed303ab-b787-4e14-b0c0-edd110fa3f39', '2147483647'),
(41, 8, '06550b16-64e0-4f23-a2ab-d8080857900c', '2147483647'),
(42, 8, '68ede355-7c1d-4be9-8560-642e38f942f6', '2147483647'),
(43, 8, '4691df7e-150a-4851-9b78-39afbabfd362', '2147483647'),
(44, 8, '3e86ad13-00da-48b9-9d6f-096fc4356dd0', '2147483647'),
(45, 8, '7cd366dd-a771-49fc-9ea4-94887e1e0927', '2147483647'),
(46, 8, '657e6611-3262-4ed5-9834-89c1ee056bd8', '2147483647'),
(47, 8, 'f4ec60d0-4aab-4846-8da5-08d68e02be89', '2147483647'),
(48, 8, '0478532a-f4ea-46fe-b72f-e5ef287347f7', '2147483647'),
(49, 8, '8fa8e225-c157-47da-9005-540f301fe769', '2147483647'),
(50, 8, '001b5eaf-7353-4a3b-be42-2efbba9587c7', '2147483647'),
(51, 8, 'a88802de-7ccf-4da3-bb1a-a400558a5b40', '2147483647'),
(52, 8, '7356d352-8014-472e-9bb6-2246b6f3ee76', '2147483647'),
(53, 8, 'bba9b6f0-f6fe-4cc2-bf52-fa76776ec15b', '2147483647'),
(54, 8, '5f85639c-6d8c-46a7-b39c-742e65896e96', '2147483647'),
(55, 8, '71ee5eb7-d1b4-426c-aa96-29cfd113b263', '2147483647'),
(56, 8, 'd9221b9a-7bfa-40ef-af7c-f328d327d4d3', '2147483647'),
(57, 8, 'bf811a26-fdd1-4843-a18f-c5682ca79717', '2147483647'),
(58, 8, 'af1773e4-8a38-4c54-8cf0-da9024325fdf', '2147483647'),
(59, 8, 'c4780c53-6870-4c5b-acd9-26262bee77ad', '2147483647'),
(60, 8, '88a8d034-abae-403a-b1de-b4ef43b93b51', '2147483647'),
(61, 8, 'b1ab58e7-7982-4882-baa2-ead53ea4b7af', '2147483647'),
(62, 8, '467bdf2c-fde4-4917-acb5-793e5967047a', '2147483647'),
(63, 8, 'aec40420-fb1f-4dfe-9571-62af9ff1ef8f', '2147483647'),
(64, 8, 'ce07f89f-2c1f-4279-a288-80aa5fa9c247', '2147483647'),
(65, 8, '7fee672d-18be-40f7-814b-185c7dfa2ca2', '2147483647'),
(66, 8, 'f85eda0a-9cd2-4420-ad62-d4d2897fbba7', '2147483647'),
(67, 8, '6b959205-4673-4d8d-bb28-01b3670dd7bf', '2147483647'),
(68, 8, 'ecd67b67-3e16-4715-afc2-ed1ada6de1f7', '2147483647'),
(69, 8, 'ea8cab24-83f5-4aca-b991-e948447160a4', '2147483647'),
(70, 8, '47e248dd-3568-4bef-a49e-5b78b11e56e4', '2147483647'),
(71, 8, '825130bb-7d43-442a-8cdd-fcfd724c1a1c', '1733070679095'),
(72, 8, '93703054-e1c2-4e7c-855c-9583fd8f44e5', '1733070932912'),
(73, 8, '586ba014-f0b0-41c7-bd03-083372803fcd', '1733071135124'),
(74, 8, 'ddbe76da-77ff-45be-b3c3-c6114db5c695', '1733071726136'),
(75, 8, '19b23916-685f-425f-a9b8-c04336dfcbf4', '1733072368533'),
(76, 8, '6d2356a6-58c9-4212-853e-a0b610ea8fa0', '1733072463762'),
(77, 8, '106ec645-cd3e-4aa8-b3f7-65ce3d1e93ff', '1733072580193'),
(78, 8, 'c6f56ed0-348e-4d14-9e83-7a2a34e011ca', '1733072709720'),
(79, 8, '9349421b-1805-473e-aba3-3b6b53fa5136', '1733072869003'),
(80, 8, 'ec186690-7e5c-4f97-a8fb-c034a092e024', '1733078222011'),
(81, 8, 'f1665882-7f34-47c8-9821-dd05ed9ef138', '1733078715673'),
(82, 8, '26215a2b-fa36-40eb-94da-ccf8cc45f609', '1733078813862'),
(83, 8, '74e231ed-09a4-4089-b0f0-f2c84b98286b', '1733079005467'),
(84, 8, '8890d692-1b6b-47ac-a7f6-525e88708a69', '1733151837992'),
(85, 8, '45938c33-b23e-4400-a5f9-54ced125b241', '1733151953843'),
(86, 8, '022977a7-872d-4b13-a4f8-f0b18c74121d', '1733152076578'),
(87, 8, 'd326516d-736d-4d32-9ba4-3b40a9884618', '1733152375699'),
(88, 8, '0dab8380-c942-4c09-96ec-1cf1e6c09c86', '1733152440958'),
(89, 8, 'aea6cc12-9d2f-4666-abf0-d65b26ca8756', '1733152871892'),
(90, 8, '746ce5b9-79a7-4f77-a651-308556ef2940', '1733153220874'),
(91, 8, '0f0caff5-ff09-48a9-9eda-adff2df13b0a', '1733153352804'),
(92, 8, '1157cc52-81e0-4621-8ba5-69b7c5652796', '1733153511666'),
(93, 8, '9d288e50-66a6-41d1-8074-c4cc1b6690e2', '1733153584192'),
(94, 8, '71553900-4bbf-4057-bf6f-504e6565a638', '1733154092575'),
(95, 8, '0c7d2f5c-4a9d-4753-a041-2e72b7009acf', '1733154394026'),
(96, 8, '01d03751-bafd-455b-9250-658847c9de6e', '1733154929922'),
(97, 8, '2021de5c-ff7a-4467-9f83-9f7b72b110d7', '1733240584714'),
(98, 8, '1c8b0ee2-3254-4386-ba32-6cebb5be9986', '1733240660172'),
(99, 8, '8ebcfd39-5901-4fcd-8dd4-ef4649d3b6f4', '1733574639504');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `forgetpassword`
--
ALTER TABLE `forgetpassword`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_forgetpassword_customer` (`Customer_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Admin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `forgetpassword`
--
ALTER TABLE `forgetpassword`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `forgetpassword`
--
ALTER TABLE `forgetpassword`
  ADD CONSTRAINT `FK_forgetpassword_customer` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
