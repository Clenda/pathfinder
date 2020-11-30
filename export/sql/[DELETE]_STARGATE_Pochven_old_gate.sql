---------------------------------------------------------------
-- Script Name : [DELETE]_STARGATE_Pochven_old_gate
-- Description : deleted all the standart gate on the Pochven Eve region from the Stargate table
-- Author      : Clenda (Nicolas R.)
-- Controle    : 66 lignes deleted
---------------------------------------------------------------

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Archee)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Vale)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Ala)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Wirashoda)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Kuharah)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Tunudan)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Harva)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Niarja)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Raravoss)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Skarkon)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Nani)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Urhinichi)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Otanuomi)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Krirald)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Konola)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Nalvula)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Kino)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Otela)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Ignebaener)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Komo)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Sakenta)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Arvasaras)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Kaunokka)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Ichoriya)';
DELETE FROM eve_universe.stargate WHERE `name` = 'Stargate (Angymonne)';

SET FOREIGN_KEY_CHECKS=1;
COMMIT;