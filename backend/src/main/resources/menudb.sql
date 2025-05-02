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
    'pates',
    'https://img.freepik.com/psd-premium/hamburger-cheeseburger-dessus-laitue-verte-dessus_1224819-5728.jpg?w=1380',
    'Un cheeseburger classique (pain, steak, fromage, salade, sauce)',
    10.00
);

INSERT INTO menu (nom, image, description, prix) 
VALUES (
    'Frites maison',
    'https://img.freepik.com/photos-gratuite/vue-cote-frites-assaisonnement_141793-4899.jpg?t=st=1743520841~exp=1743524441~hmac=ba17d9bf01055b86309e3bd28a929759cb45207c4f5cb69b122ee16d02cfc636&w=2000',
    'Des frites maison avec une sauce mystère (choisie aléatoirement par le backend !)',
    2.00
);
INSERT INTO menu (nom, image, description, prix) 
VALUES (
    'Nuggets',
    'https://img.freepik.com/psd-gratuit/nuggets-poulet-croustillants-frites-repas-delicieux_84443-36785.jpg?t=st=1743520560~exp=1743524160~hmac=b2af7be12dc626c440bcb9ef22adc9373af7062d356d09be3463dcbf1095b018&w=1380',
    'Nuggets de poulet avec 3 sauces au choix (ketchup, mayo, barbecue)',
    7.00
);