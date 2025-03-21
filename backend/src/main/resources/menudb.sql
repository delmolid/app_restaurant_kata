START TRANSACTION;

SET
    time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

/*!40101 SET NAMES utf8mb4 */;

DROP TABLE IF EXISTS `menu`;


CREATE TABLE IF NOT EXISTS `menu`(
    `menu_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nom`VARCHAR(255) NOT NULL,
    `image` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `prix` DOUBLE NOT NULL
);

-- Ajout des données
INSERT INTO menu (nom, image, description, prix) 
VALUES (
    'Hello World Burger',
    'https://lagrandeourse.design/wp-content/uploads/2021/03/Burger-menu-ou-menu-latéral-_-pour-ou-contre-_.jpg',
    'Un cheeseburger classique (pain, steak, fromage, salade, sauce)',
    10.00
);

INSERT INTO menu (nom, image, description, prix) 
VALUES (
    'Frites maison',
    'https://lagrandeourse.design/wp-content/uploads/2021/03/Burger-menu-ou-menu-latéral-_-pour-ou-contre-_.jpg',
    'Des frites maison avec une sauce mystère (choisie aléatoirement par le backend !)',
    20.00
);
INSERT INTO menu (nom, image, description, prix) 
VALUES (
    'JSON Nuggets',
    'https://lagrandeourse.design/wp-content/uploads/2021/03/Burger-menu-ou-menu-latéral-_-pour-ou-contre-_.jpg',
    'Nuggets de poulet avec 3 sauces au choix (ketchup, mayo, barbecue)',
    7.00
);