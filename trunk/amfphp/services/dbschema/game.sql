-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 31, 2009 at 12:40 PM
-- Server version: 5.0.45
-- PHP Version: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `game`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `from` varchar(45) NOT NULL default '',
  `to` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `chat`
--


-- --------------------------------------------------------

--
-- Table structure for table `chatmapping`
--

CREATE TABLE IF NOT EXISTS `chatmapping` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `chatid` int(10) unsigned NOT NULL default '0',
  `text` varchar(2000) NOT NULL default '',
  `timestamp` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `chatmapping`
--


-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE IF NOT EXISTS `game` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `lobbyname` varchar(30) character set armscii8 collate armscii8_bin NOT NULL,
  `player1` int(10) unsigned NOT NULL default '0',
  `player2` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`id`, `lobbyname`, `player1`, `player2`) VALUES
(1, 'lobby1', 0, 0),
(2, 'lobby2', 0, 0),
(3, 'lobby3', 0, 0),
(4, 'lobby4', 0, 0),
(5, 'lobby5', 0, 0),
(6, 'lobby6', 0, 0),
(7, 'lobby7', 0, 0),
(8, 'lobby8', 0, 0),
(9, 'lobby9', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `gamedata`
--

CREATE TABLE IF NOT EXISTS `gamedata` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `data` varchar(5000) NOT NULL default '',
  `gameid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gamedata`
--


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nickname` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `user`
--

