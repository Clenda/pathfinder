/**********************************************************
* Script Name : [DELETE]_STARGATE_Pochven_old_gate
* Description : deleted all the standart gate on the Pochven Eve region from the Stargate table
* Author      : Clenda (Nicolas R.)
* Controle    : 66 lignes deleted
*********************************************************/

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


DELETE FROM `stargate` WHERE `name` = 'Stargate (Archee)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Vale)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Ala)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Wirashoda)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Kuharah)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Tunudan)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Harva)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Niarja)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Raravoss)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Skarkon)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Nani)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Urhinichi)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Otanuomi)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Krirald)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Konola)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Nalvula)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Kino)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Otela)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Ignebaener)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Komo)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Sakenta)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Arvasaras)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Kaunokka)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Ichoriya)';
DELETE FROM `stargate` WHERE `name` = 'Stargate (Angymonne)';

SET FOREIGN_KEY_CHECKS=1;
COMMIT;