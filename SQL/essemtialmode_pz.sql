-- --------------------------------------------------------
-- Host:                         
-- Versión del servidor:         10.1.29-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla essentialmode_pz.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.addon_account: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('caution', 'Caution', 0),
	('property_black_money', 'Argent Sale Propriété', 0),
	('society_ambulance', 'Ambulance', 1),
	('society_cardealer', 'Concessionnaire', 1),
	('society_mechanic', 'Mécano', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.addon_account_data: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_ambulance', 300, NULL),
	(2, 'society_cardealer', 0, NULL),
	(3, 'society_mechanic', 8335510, NULL),
	(4, 'society_police', 5002000, NULL),
	(5, 'society_taxi', 103066, NULL);
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.addon_inventory: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('housing', 'Housing', 0),
	('property', 'Propriété', 0),
	('society_ambulance', 'Ambulance', 1),
	('society_cardealer', 'Concesionnaire', 1),
	('society_mechanic', 'Mécano', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.addon_inventory_items: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.aircrafts
CREATE TABLE IF NOT EXISTS `aircrafts` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.aircrafts: ~27 rows (aproximadamente)
/*!40000 ALTER TABLE `aircrafts` DISABLE KEYS */;
INSERT INTO `aircrafts` (`name`, `model`, `price`, `category`) VALUES
	('Alpha Z1', 'alphaz1', 1121000, 'plane'),
	('Besra', 'besra', 1000000, 'plane'),
	('Buzzard', 'buzzard2', 500000, 'heli'),
	('Cuban 800', 'cuban800', 240000, 'plane'),
	('Dodo', 'dodo', 500000, 'plane'),
	('Duster', 'duster', 175000, 'plane'),
	('Frogger', 'frogger', 800000, 'heli'),
	('Havok', 'havok', 250000, 'heli'),
	('Howard NX25', 'howard', 975000, 'plane'),
	('Luxor', 'luxor', 1500000, 'plane'),
	('Luxor Deluxe ', 'luxor2', 1750000, 'plane'),
	('Mammatus', 'mammatus', 300000, 'plane'),
	('Maverick', 'maverick', 750000, 'heli'),
	('Ultra Light', 'microlight', 50000, 'plane'),
	('Nimbus', 'nimbus', 900000, 'plane'),
	('Rogue', 'rogue', 1000000, 'plane'),
	('Sea Breeze', 'seabreeze', 850000, 'plane'),
	('Sea Sparrow', 'seasparrow', 815000, 'heli'),
	('Shamal', 'shamal', 1150000, 'plane'),
	('Mallard', 'stunt', 250000, 'plane'),
	('SuperVolito', 'supervolito', 1000000, 'heli'),
	('SuperVolito Carbon', 'supervolito2', 1250000, 'heli'),
	('Swift', 'swift', 1000000, 'heli'),
	('Swift Deluxe', 'swift2', 1250000, 'heli'),
	('Velum', 'velum2', 450000, 'plane'),
	('Vestra', 'vestra', 950000, 'plane'),
	('Volatus', 'volatus', 1250000, 'heli');
/*!40000 ALTER TABLE `aircrafts` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.aircraft_categories
CREATE TABLE IF NOT EXISTS `aircraft_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.aircraft_categories: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `aircraft_categories` DISABLE KEYS */;
INSERT INTO `aircraft_categories` (`name`, `label`) VALUES
	('heli', 'Helicopters'),
	('plane', 'Planes');
/*!40000 ALTER TABLE `aircraft_categories` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(40) NOT NULL,
  `sender` varchar(40) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.billing: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.bought_houses
CREATE TABLE IF NOT EXISTS `bought_houses` (
  `houseid` int(50) NOT NULL,
  PRIMARY KEY (`houseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla essentialmode_pz.bought_houses: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `bought_houses` DISABLE KEYS */;
/*!40000 ALTER TABLE `bought_houses` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.cardealer_vehicles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.car_parking
CREATE TABLE IF NOT EXISTS `car_parking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `time` bigint(20) NOT NULL,
  `parking` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla essentialmode_pz.car_parking: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `car_parking` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_parking` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.car_street
CREATE TABLE IF NOT EXISTS `car_street` (
  `owner` varchar(50) NOT NULL DEFAULT '',
  `plate` varchar(50) DEFAULT NULL,
  `vehicle` longtext NOT NULL,
  `pos` longtext NOT NULL,
  `heading` varchar(50) NOT NULL,
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.car_street: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `car_street` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_street` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.datastore: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('housing', 'Housing', 0),
	('property', 'Propriété', 0),
	('society_ambulance', 'Ambulance', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=522 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.datastore_data: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_ambulance', NULL, '{}'),
	(2, 'society_police', NULL, '{}'),
	(3, 'society_taxi', NULL, '{}');
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.dopeplants
CREATE TABLE IF NOT EXISTS `dopeplants` (
  `owner` varchar(50) NOT NULL,
  `plant` longtext NOT NULL,
  `plantid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.dopeplants: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `dopeplants` DISABLE KEYS */;
/*!40000 ALTER TABLE `dopeplants` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.dpkeybinds
CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla essentialmode_pz.dpkeybinds: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `dpkeybinds` DISABLE KEYS */;
/*!40000 ALTER TABLE `dpkeybinds` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.fine_types: ~52 rows (aproximadamente)
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Mal uso del claxon', 1000, 0),
	(2, 'Cruzando ilegalmente una línea continua', 1500, 0),
	(3, 'Conducir en el lado equivocado de la carretera', 2000, 0),
	(4, 'Giro ilegal en U', 1000, 0),
	(5, 'Conducir ilegalmente fuera de la carretera', 2000, 0),
	(6, 'Rechazar una orden legal', 3000, 0),
	(7, 'Detener ilegalmente un vehículo', 1000, 0),
	(8, 'Estacionamiento ilegal', 2000, 0),
	(9, 'A falta de ceder a la derecha', 2000, 0),
	(10, 'Incumplimiento de la información del vehículo', 2000, 0),
	(11, 'No parar en una señal de Stop', 1500, 0),
	(12, 'No parar en un semaforo rojo', 1000, 0),
	(13, 'Paso ilegal', 1000, 0),
	(14, 'Conducir un vehículo ilegal', 5000, 0),
	(15, 'Conducir sin licencia', 3000, 0),
	(16, 'Accidente con fuga', 10000, 0),
	(17, 'Exceso de velocidad por < 20 kmh', 1000, 0),
	(18, 'Exceso de velocidad por 20-50 kmh', 1500, 0),
	(19, 'Exceso de velocidad por 50-100 kmh', 2000, 0),
	(20, 'Exceso de velocidad por > 100 kmh', 3000, 0),
	(21, 'Impedir el flujo de tráfico', 1000, 1),
	(22, 'Intoxicación pública', 2000, 1),
	(23, 'Conducta desordenada', 3000, 1),
	(24, 'Obstrucción de la justicia', 6000, 1),
	(25, 'Insultos hacia los civiles', 2000, 1),
	(26, 'Falta de respeto a un oficial', 5000, 1),
	(27, 'Amenaza verbal hacia un civil', 3000, 1),
	(28, 'Amenaza verbal hacia un oficial', 6000, 1),
	(29, 'Proporcionar información falsa', 15000, 1),
	(30, 'Intento de corrupción', 15000, 1),
	(31, 'Blandiendo un arma en los límites de la ciudad', 2000, 2),
	(32, 'Blandiendo un arma letal en los límites de la ciudad', 6000, 2),
	(33, 'Sin licencia de armas de fuego', 10000, 2),
	(34, 'Posesión de un arma ilegal', 20000, 2),
	(35, 'Posesión de herramientas de robo', 2000, 2),
	(36, 'Acoso y/o violacion', 10000, 2),
	(37, 'Intención de vender, comprar droga', 2000, 2),
	(38, 'Fabricación de una sustancia ilegal', 5000, 2),
	(39, 'Posesión de una sustancia ilegal', 2000, 2),
	(40, 'Secuestro de un Civilan', 20000, 2),
	(41, 'Secuestro de un Oficial', 100000, 2),
	(42, 'Robo', 30000, 2),
	(43, 'Robo de joyeria mano armada', 80000, 2),
	(44, 'Robo de banco mano armada', 500000, 2),
	(45, 'Robo a un civil', 20000, 3),
	(46, 'Robo a un oficial', 50000, 3),
	(47, 'Intento de asesinato de un civil', 300000, 3),
	(48, 'Intento de asesinato de un oficial', 500000, 3),
	(49, 'Asesinato de un civil', 1000000, 3),
	(50, 'Asesinato de un oficial', 5000000, 3),
	(51, 'Homicidio involuntario', 200000, 3),
	(52, 'Fraude', 80000, 2);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.gangs
CREATE TABLE IF NOT EXISTS `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.gangs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `gangs` DISABLE KEYS */;
/*!40000 ALTER TABLE `gangs` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.glovebox_inventory
CREATE TABLE IF NOT EXISTS `glovebox_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.glovebox_inventory: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `glovebox_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `glovebox_inventory` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.habilidades
CREATE TABLE IF NOT EXISTS `habilidades` (
  `identifier` varchar(255) NOT NULL,
  `resistencia` int(3) NOT NULL DEFAULT '50',
  `fuerza` int(3) NOT NULL DEFAULT '50',
  `informatica` int(3) DEFAULT NULL,
  `agricultura` int(3) DEFAULT NULL,
  `mineria` int(3) DEFAULT NULL,
  `quimica` int(3) DEFAULT NULL,
  `medicina` int(3) DEFAULT NULL,
  `vuelo` int(3) DEFAULT NULL,
  `disparo` int(3) DEFAULT NULL,
  `submarinismo` int(3) DEFAULT NULL,
  `caza` int(3) DEFAULT NULL,
  `pesca` int(3) DEFAULT NULL,
  `prospeccion` int(3) DEFAULT NULL,
  `agriilegal` int(3) DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla essentialmode_pz.habilidades: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `habilidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `habilidades` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT '1',
  `rare` tinyint(1) NOT NULL DEFAULT '0',
  `can_remove` tinyint(1) NOT NULL DEFAULT '1',
  `price` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.items: ~177 rows (aproximadamente)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `price`) VALUES
	('100gbag', 'Ziploc Bag[100g]', 20, 0, 1, 0),
	('1gbag', 'Ziploc Bag[1g]', 20, 0, 1, 0),
	('50gbag', 'Ziploc Bag[50g]', 20, 0, 1, 0),
	('5gbag', 'Ziploc Bag[5g]', 20, 0, 1, 0),
	('absinthe', 'Absenta', 20, 0, 1, 0),
	('aceite', 'Aceite', 1, 0, 1, 0),
	('acido_nitrico', 'Acido nitrico', 1, 0, 1, 0),
	('acido_sulfurico', 'Acido Sulfurico', 1, 0, 1, 0),
	('agua_quimica', 'Agua destilada', 1, 0, 1, 0),
	('alive_chicken', 'Pollo vivo', 1, 0, 1, 0),
	('aloe', 'Aloe Vera', 10, 0, 1, 0),
	('ammoanalyzer', 'Analizador balistico', 0, 0, 1, 0),
	('amoniaco', 'Amoniaco', 1, 0, 1, 0),
	('azufre', 'Azufre', 1, 0, 1, 0),
	('bag', 'Mochila', 1, 0, 1, 0),
	('bagofdope', 'Bag of Dope', 0, 0, 1, 0),
	('bandage', 'Venda', 2, 0, 1, 0),
	('beer', 'Cerveza', 20, 0, 1, 0),
	('binocular', 'Prismaticos', 20, 0, 1, 0),
	('bloodsample', 'Muestra de sangre', 0, 0, 1, 0),
	('blowpipe', 'Cachimba', 2, 0, 1, 0),
	('blowtorch', 'Bengala', 20, 0, 1, 0),
	('bocajamon', 'Bocadillo Jamon', 20, 0, 1, 0),
	('bodybandage', 'Body Bandage', 5, 0, 1, 1),
	('bread', 'Pan', 1, 0, 1, 0),
	('bulletsample', 'Casquillo de bala', 0, 0, 1, 0),
	('cannabis', 'Cannabis', 3, 0, 1, 0),
	('carbon_piece', 'Mena de Carbon', 1, 50, 0, 1),
	('carokit', 'Kit Carroceria', 3, 0, 1, 0),
	('carotool', 'Herramienta Carroceria', 2, 0, 1, 0),
	('cashew', 'Anacardos', 20, 0, 1, 0),
	('chips', 'Patatas fritas', 20, 0, 1, 0),
	('chocolate', 'Chocolate', 20, 0, 1, 0),
	('cigarette', 'Cigarrillo', 20, 0, 1, 0),
	('clothe', 'Ropa', 1, 0, 1, 0),
	('cocacola', 'Coca-Cola', 20, 0, 1, 0),
	('cocaine_cut', 'Cocaina cortada', 1, 0, 1, 0),
	('cocaine_packaged', 'Fardo de Cocaina', 1, 0, 1, 0),
	('cocaine_uncut', 'Cocaina sin cortar', 1, 0, 1, 0),
	('coca_leaf', 'Planta de coca', 10, 0, 1, 0),
	('coffe', 'Cafe solo', 20, 0, 1, 0),
	('coffemilk', 'Cafe con leche', 20, 0, 1, 0),
	('coffeshort', 'Cafe cortado', 20, 0, 1, 0),
	('copper', 'Cobre', 1, 0, 1, 0),
	('cotton_a', 'Algodon', 1, 0, 1, 0),
	('croquettes', 'Comida para mascota', 1, 0, 1, 0),
	('cupcake', 'Pastelito', 20, 0, 1, 0),
	('cutted_wood', 'Madera Cortada', 1, 0, 1, 0),
	('cut_money', 'Dinero falso - Cut', 1, 0, 1, 0),
	('diamond', 'Diamante', 1, 0, 1, 0),
	('dnaanalyzer', 'Analizador de ADN', 0, 0, 1, 0),
	('dopebag', 'Ziplock Bag', 0, 0, 1, 0),
	('doritos', 'Doritos', 20, 0, 1, 0),
	('drill', 'Taladro', 20, 0, 1, 0),
	('drpepper', 'Dr Pepper', 20, 0, 1, 0),
	('drugscales', 'Scales', 20, 0, 1, 0),
	('energy', 'Monster', 20, 0, 1, 0),
	('essence', 'Essence', 1, 0, 1, 0),
	('extbandage', 'Tratamiento de extremidades', 5, 0, 1, 1),
	('fabric', 'Tela', 1, 0, 1, 0),
	('fabric_b', 'Tela', 1, 0, 1, 0),
	('fertilizer', 'Fertilizante', 10, 0, 1, 0),
	('fish', 'Pescado', 1, 0, 1, 0),
	('fixkit', 'Kit Reparacion', 3, 0, 1, 0),
	('fixtool', 'Herramientas Reparacion', 2, 0, 1, 0),
	('gasolina', 'Gasolina', 1, 0, 1, 0),
	('gazbottle', 'Botella de Gaz', 2, 0, 1, 0),
	('gin', 'Ginebra', 20, 0, 1, 0),
	('gold', 'Oro', 1, 0, 1, 0),
	('gold_piece', 'Mena de Oro', 1, 50, 0, 1),
	('gps', 'GPS', 20, 0, 1, 0),
	('grand_cru', 'Champagne', 20, 0, 1, 0),
	('gym_membership', 'Gym Membership', 1, 0, 1, 0),
	('hamburger', 'Hamburguesa', 20, 0, 1, 0),
	('headbandage', 'Pastilla Antiinflamatoria', 5, 0, 1, 1),
	('hidrogeno', 'Hidrogeno', 1, 0, 1, 0),
	('hidroxido_sodio', 'Hidroxido de sodio', 1, 0, 1, 0),
	('hierba_medicinal', 'Hierba medicinal', 10, 0, 1, 0),
	('highgradefert', 'Fertilizante [Alto]', 20, 0, 1, 0),
	('highgrademaleseed', 'Male Dope Seed+', 0, 0, 1, 0),
	('hottea', 'Te calentito', 20, 0, 1, 0),
	('icetea', 'Ice-Tea', 20, 0, 1, 0),
	('iron', 'Hierro', 1, 0, 1, 0),
	('iron_piece', 'Mena de Hierro', 1, 50, 0, 1),
	('jabon', 'Jabon', 1, 0, 1, 0),
	('keycard', 'Tarjeta pirateada', 5, 0, 1, 0),
	('lavanda', 'Lavanda', 10, 0, 1, 0),
	('lemonade', 'Limonada', 20, 0, 1, 0),
	('lighter', 'Encendedor', 20, 0, 1, 0),
	('lingot_carbon', 'Carbon Puro', 1, 50, 0, 1),
	('lingot_gold', 'Lingote de Oro', 1, 50, 0, 1),
	('lingot_iron', 'Lingote de Hierro', 1, 50, 0, 1),
	('lingot_silver', 'Lingote de Plata', 1, 50, 0, 1),
	('lirio', 'Lirio', 10, 0, 1, 0),
	('lockpick', 'Ganzua', 20, 0, 1, 0),
	('lowgradefert', 'Fertilizante[Bajo]', 20, 0, 1, 0),
	('lowgrademaleseed', 'Male Dope Seed', 0, 0, 1, 0),
	('manzana', 'Manzana', 10, 0, 1, 0),
	('margaritas', 'Margaritas', 10, 0, 1, 0),
	('marijuana', 'Maria', 2, 0, 1, 0),
	('medikit', 'Kit Medico', 2, 0, 1, 0),
	('meth_packaged', 'Paquete Meta', 1, 0, 1, 0),
	('meth_raw', 'Meta pura', 1, 0, 1, 0),
	('milk', 'Leche', 20, 0, 1, 0),
	('naranja', 'Naranja', 10, 0, 1, 0),
	('neckbrace', 'Neck Brace', 5, 0, 1, 1),
	('net_cracker', 'Dispositivo de hackeo', 3, 0, 1, 0),
	('nightvision_goggles', 'Night Vision Goggles', 2, 0, 1, 0),
	('nitrogeno', 'Nitrogeno', 1, 0, 1, 0),
	('oreo', 'Oreo', 20, 0, 1, 0),
	('oxigeno', 'Tanque de oxigeno', 1, 0, 1, 0),
	('packaged_chicken', 'Pollo empaquetado', 1, 0, 1, 0),
	('packaged_plank', 'Madera empaquetada', 1, 0, 1, 0),
	('panterarosa', 'Pantera Rosa', 20, 0, 1, 0),
	('parkingcard', 'Ticket Parking', 1, 0, 1, 0),
	('petrol', 'Petroleo', 1, 0, 1, 0),
	('petroleocrudo', 'Petroleo Crudo', 1, 0, 1, 0),
	('petroleorefinado', 'Petroleo Refinado', 1, 0, 1, 0),
	('petrol_raffin', 'Petroleo Refinado', 1, 0, 1, 0),
	('phone', 'Telefono', 20, 0, 1, 0),
	('phoskitos', 'Phoskitos', 20, 0, 1, 0),
	('pine_planks', 'Tablas de Madera', 1, 0, 1, 0),
	('pine_processed', 'Tablas de Pino', 1, 10, 0, 1),
	('pine_wood', 'Madera de Pino', 1, 0, 1, 0),
	('pistachio', 'Pistacho', 20, 0, 1, 0),
	('plantpot', 'Tiesto', 20, 0, 1, 0),
	('pollodegollado', 'Pollo degollado', 1, 0, 1, 0),
	('polloenbandeja', 'Pollo en bandeja', 1, 0, 1, 0),
	('pollovivo', 'Pollo fesco', 1, 0, 1, 0),
	('powerade', 'Powerade', 1, 0, 1, 0),
	('protein_shake', 'Protein Shake', 1, 0, 1, 0),
	('purifiedwater', 'Agua Purificada', 10, 0, 1, 0),
	('radio', 'Walkie', 1, 0, 1, 0),
	('regadera', 'Regadera', 10, 0, 1, 0),
	('rollingpaper', 'Papel de liar', 20, 0, 1, 0),
	('romero', 'Romero', 10, 0, 1, 0),
	('ropa', 'Ropa Fabricada', 1, 0, 1, 0),
	('sal_quimica', 'Sal', 1, 0, 1, 0),
	('sandwich', 'Sandwich', 20, 0, 1, 0),
	('scubagear', 'Traje de buzo', 20, 0, 1, 0),
	('seed_aloe', 'Semilla de Aloe', 10, 0, 1, 0),
	('seed_amapola', 'Semilla de amapola', 10, 0, 1, 0),
	('seed_coca', 'Semilla de coca', 10, 0, 1, 0),
	('seed_lavanda', 'Semilla de lavanda', 10, 0, 1, 0),
	('seed_lirio', 'Semilla de lirio', 10, 0, 1, 0),
	('seed_margaritas', 'Semilla de margarita', 10, 0, 1, 0),
	('seed_practicas', 'Semilla medicinal', 10, 0, 1, 0),
	('seed_romero', 'Semilla de romero', 10, 0, 1, 0),
	('seed_weed', 'Semilla de Marihuana', 10, 0, 1, 0),
	('slaughtered_chicken', 'Pollo muerto', 1, 0, 1, 0),
	('sorted_money', 'Dinero falso - Sorted', 1, 0, 1, 0),
	('sportlunch', 'Sportlunch', 1, 0, 1, 0),
	('stone', 'Piedra', 1, 0, 1, 0),
	('tanque_quimico', 'Tanque Quimico', 1, 0, 1, 0),
	('tequila', 'Tequila', 20, 0, 1, 0),
	('thermal_goggles', 'Thermal Vision Goggles', 2, 0, 1, 0),
	('thermite', 'Explosivo termita', 5, 0, 1, 0),
	('torsobandage', 'Vendaje de torax', 5, 0, 1, 0),
	('trimmedweed', 'Trimmed Weed', 0, 0, 1, 0),
	('twix', 'Twix', 20, 0, 1, 0),
	('vodka', 'Vodka', 20, 0, 1, 0),
	('washed_stone', 'Piedra lavada', 1, 0, 1, 0),
	('water', 'Agua', 1, 0, 1, 0),
	('wateringcan', 'Watering Can', 0, 0, 1, 0),
	('WEAPON_BAT', 'Bate de Baseball', 1, 0, 1, 0),
	('WEAPON_FLASHLIGHT', 'Linterna', 1, 0, 1, 0),
	('WEAPON_KNIFE', 'Cuchillo', 100, 1, 1, 0),
	('WEAPON_PISTOL', 'Pistola', 100, 1, 1, 0),
	('WEAPON_PUMPSHOTGUN', 'Escopeta', 1, 0, 1, 0),
	('WEAPON_STUNGUN', 'Taser', 100, 1, 1, 0),
	('weed_packaged', 'Bolsa de Maria', 1, 0, 1, 0),
	('weed_untrimmed', 'Marihuana', 1, 0, 1, 0),
	('whisky', 'Whisky', 20, 0, 1, 0),
	('wine', 'Vino', 20, 0, 1, 0),
	('wood', 'Madera', 1, 0, 1, 0),
	('wool', 'Lana', 1, 0, 1, 0),
	('zetony', 'Ficha', 0, 0, 1, 0);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.jobs: ~19 rows (aproximadamente)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'EMS', 0),
	('cardealer', 'Concesionario', 0),
	('delivery', 'Delivery', 0),
	('fisherman', 'Pescador', 0),
	('fueler', 'Refinador', 0),
	('lumberjack', 'Leñador', 0),
	('mechanic', 'LS Customs', 0),
	('miner', 'Minero', 0),
	('offambulance', 'EMS', 0),
	('offmechanic', 'LS Customs', 0),
	('offpolice', 'LSPD', 0),
	('offtaxi', 'Donwtown Co.', 0),
	('police', 'LSPD', 0),
	('reporter', 'Reportero', 0),
	('slaughterer', 'Carnicero', 0),
	('tailor', 'Sastre', 0),
	('taxi', 'Donwtown Co.', 0),
	('thelostmc', 'The Lost MC', 0),
	('unemployed', 'Desempleado', 0);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.job_grades: ~87 rows (aproximadamente)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}'),
	(6, 'lumberjack', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
	(7, 'fisherman', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
	(8, 'fueler', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
	(9, 'reporter', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
	(10, 'tailor', 0, 'employee', 'Intérimaire', 0, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(11, 'miner', 0, 'employee', 'Intérimaire', 0, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(12, 'slaughterer', 0, 'employee', 'Intérimaire', 0, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(13, 'mechanic', 0, 'recrue', 'Aprendiz', 12, '{}', '{}'),
	(14, 'mechanic', 1, 'novice', 'Mecanico', 24, '{}', '{}'),
	(15, 'mechanic', 2, 'experimente', 'Veterano', 36, '{}', '{}'),
	(16, 'mechanic', 3, 'chief', 'Encargado', 48, '{}', '{}'),
	(17, 'mechanic', 4, 'boss', 'Jefe', 100, '{}', '{}'),
	(23, 'taxi', 0, 'recrue', 'Temporal', 12, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(24, 'taxi', 1, 'novice', 'Taxista', 24, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(25, 'taxi', 2, 'experimente', 'Chofer', 36, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(26, 'taxi', 3, 'uber', 'Encargado', 48, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(27, 'taxi', 4, 'boss', 'Jefe', 0, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(28, 'cardealer', 0, 'recruit', 'Recrue', 10, '{}', '{}'),
	(29, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
	(30, 'cardealer', 2, 'experienced', 'Experimente', 40, '{}', '{}'),
	(31, 'cardealer', 3, 'boss', 'Patron', 0, '{}', '{}'),
	(32, 'thelostmc', 0, 'recluta', 'Recluta', 20, '{}', '{}'),
	(33, 'thelostmc', 1, 'empleado', 'Motorista', 20, '{}', '{}'),
	(34, 'police', 0, 'recluta', 'Agente en prácticas', 100, '{}', '{}'),
	(35, 'police', 1, 'cadete', 'Cadete', 100, '{}', '{}'),
	(36, 'police', 2, 'oficialuno', 'Oficial I', 100, '{}', '{}'),
	(37, 'police', 3, 'oficialdos', 'Oficial II', 100, '{}', '{}'),
	(38, 'police', 4, 'oficialtres', 'Oficial III', 100, '{}', '{}'),
	(39, 'police', 5, 'sargento', 'Sargento', 100, '{}', '{}'),
	(40, 'police', 6, 'teniente', 'Teniente', 100, '{}', '{}'),
	(41, 'police', 7, 'capitan', 'Capitán', 100, '{}', '{}'),
	(42, 'police', 8, 'comandante', 'Comandante', 100, '{}', '{}'),
	(43, 'police', 9, 'jefesuper', 'Jefe supervisor', 100, '{}', '{}'),
	(44, 'police', 10, 'jefeadjun', 'Jefe adjunto', 100, '{}', '{}'),
	(45, 'police', 11, 'boss', 'Jefe', 100, '{}', '{}'),
	(46, 'offpolice', 0, 'recluta', 'Fuera de servicio', 20, '{}', '{}'),
	(47, 'offpolice', 1, 'cadete', 'Fuera de servicio', 20, '{}', '{}'),
	(48, 'offpolice', 2, 'oficialuno', 'Fuera de servicio', 20, '{}', '{}'),
	(49, 'offpolice', 3, 'oficialdos', 'Fuera de servicio', 20, '{}', '{}'),
	(50, 'offpolice', 4, 'oficialtres', 'Fuera de servicio', 20, '{}', '{}'),
	(51, 'offpolice', 5, 'sargento', 'Fuera de servicio', 20, '{}', '{}'),
	(52, 'offpolice', 6, 'teniente', 'Fuera de servicio', 20, '{}', '{}'),
	(53, 'offpolice', 7, 'capitan', 'Fuera de servicio', 20, '{}', '{}'),
	(54, 'offpolice', 8, 'comandante', 'Fuera de servicio', 20, '{}', '{}'),
	(55, 'offpolice', 9, 'jefesuper', 'Fuera de servicio', 20, '{}', '{}'),
	(56, 'offpolice', 10, 'jefeadjun', 'Fuera de servicio', 20, '{}', '{}'),
	(57, 'offpolice', 11, 'boss', 'Fuera de servicio', 20, '{}', '{}'),
	(58, 'offtaxi', 0, 'recrue', 'Sin servicio', 100, '{}', '{}'),
	(59, 'offtaxi', 1, 'novice', 'Sin servicio', 100, '{}', '{}'),
	(60, 'offtaxi', 2, 'experimente', 'Sin servicio', 100, '{}', '{}'),
	(61, 'offtaxi', 3, 'uber', 'Sin servicio', 100, '{}', '{}'),
	(62, 'offtaxi', 4, 'boss', 'Sin servicio', 100, '{}', '{}'),
	(63, 'offmechanic', 0, 'recrue', 'Sin servicio', 100, '{}', '{}'),
	(64, 'offmechanic', 1, 'novice', 'Sin servicio', 100, '{}', '{}'),
	(65, 'offmechanic', 2, 'experimente', 'Sin servicio', 100, '{}', '{}'),
	(66, 'offmechanic', 3, 'chief', 'Sin servicio', 100, '{}', '{}'),
	(67, 'offmechanic', 4, 'boss', 'Sin servicio', 100, '{}', '{}'),
	(84, 'ambulance', 0, 'ats', 'ATS', 20, '{}', '{}'),
	(85, 'ambulance', 1, 'bombero', 'Bombero', 20, '{}', '{}'),
	(86, 'ambulance', 2, 'paramedico', 'Paramédico', 20, '{}', '{}'),
	(87, 'ambulance', 3, 'tecbombero', 'Bombero - Técnico', 20, '{}', '{}'),
	(88, 'ambulance', 4, 'auxiliar', 'Auxiliar', 20, '{}', '{}'),
	(89, 'ambulance', 5, 'oficialbom', 'Bombero - Oficial', 20, '{}', '{}'),
	(90, 'ambulance', 6, 'medico', 'Médico', 40, '{}', '{}'),
	(91, 'ambulance', 7, 'sargentobom', 'Bombero - Sargento', 40, '{}', '{}'),
	(92, 'ambulance', 8, 'cirujano', 'Cirujano Especialista', 40, '{}', '{}'),
	(93, 'ambulance', 9, 'bomcapit', 'Bombero - Capitán', 40, '{}', '{}'),
	(94, 'ambulance', 10, 'chief_doctor', 'Jefe de Cirugía', 60, '{}', '{}'),
	(95, 'ambulance', 11, 'bomcom', 'Bombero - Comandante', 60, '{}', '{}'),
	(96, 'ambulance', 12, 'adjboss', 'Jefe Adjunto', 80, '{}', '{}'),
	(97, 'ambulance', 13, 'boss', 'Director de Hospital', 80, '{}', '{}'),
	(98, 'offambulance', 0, 'ats', 'Sin servicio', 20, '{}', '{}'),
	(99, 'offambulance', 1, 'bombero', 'Sin servicio', 20, '{}', '{}'),
	(100, 'offambulance', 2, 'paramedico', 'Sin servicio', 20, '{}', '{}'),
	(101, 'offambulance', 3, 'tecbombero', 'Sin servicio', 20, '{}', '{}'),
	(102, 'offambulance', 4, 'auxiliar', 'Sin servicio', 20, '{}', '{}'),
	(103, 'offambulance', 5, 'oficialbom', 'Sin servicio', 20, '{}', '{}'),
	(104, 'offambulance', 6, 'medico', 'Sin servicio', 40, '{}', '{}'),
	(105, 'offambulance', 7, 'sargentobom', 'Sin servicio', 40, '{}', '{}'),
	(106, 'offambulance', 8, 'cirujano', 'Sin servicio', 40, '{}', '{}'),
	(107, 'offambulance', 9, 'bomcapit', 'Sin servicio', 40, '{}', '{}'),
	(108, 'offambulance', 10, 'chief_doctor', 'Sin servicio', 60, '{}', '{}'),
	(109, 'offambulance', 11, 'bomcom', 'Sin servicio', 60, '{}', '{}'),
	(110, 'offambulance', 12, 'adjboss', 'Sin servicio', 80, '{}', '{}'),
	(111, 'offambulance', 13, 'boss', 'Sin servicio', 80, '{}', '{}'),
	(112, 'delivery', 0, 'delivery', 'Delivery', 500, '{}', '{}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.licenses: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` (`type`, `label`) VALUES
	('aircraft', 'Licencia de vuelo'),
	('boat', 'Licencia de barco'),
	('dmv', 'Permiso de Conducir'),
	('drive', 'Permiso de Coche'),
	('drive_bike', 'Permiso de moto'),
	('drive_truck', 'Permiso de Camion'),
	('weapon', 'Licencia de armas'),
	('weed_processing', 'Licencia de Drogas');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `incident` longtext,
  `charges` longtext,
  `author` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.mdt_reports: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdt_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_reports` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.mdt_warrants
CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `char_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `report_title` varchar(255) DEFAULT NULL,
  `charges` longtext,
  `date` varchar(255) DEFAULT NULL,
  `expire` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.mdt_warrants: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mdt_warrants` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_warrants` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.owned_properties
CREATE TABLE IF NOT EXISTS `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.owned_properties: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `owned_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_properties` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(40) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `vehicle` longtext,
  `fuel` int(4) DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `lasthouse` int(11) DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'State of the car',
  `stored` tinyint(1) NOT NULL DEFAULT '0',
  `aparcado` tinyint(1) NOT NULL DEFAULT '0',
  `garage` varchar(200) DEFAULT 'A',
  `health` varchar(3) DEFAULT '0',
  `livery` longtext,
  `coords` varchar(255) DEFAULT NULL,
  `heading` varchar(50) DEFAULT NULL,
  `ownertype` varchar(50) DEFAULT NULL,
  `damages` varchar(255) NOT NULL DEFAULT '{}',
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.owned_vehicles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.phone_app_chat
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla essentialmode_pz.phone_app_chat: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `phone_app_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_app_chat` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.phone_calls
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla essentialmode_pz.phone_calls: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `phone_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_calls` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isRead` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=425 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla essentialmode_pz.phone_messages: 0 rows
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.phone_users_contacts
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla essentialmode_pz.phone_users_contacts: 0 rows
/*!40000 ALTER TABLE `phone_users_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_users_contacts` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.playerhousing
CREATE TABLE IF NOT EXISTS `playerhousing` (
  `id` int(32) NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `rented` tinyint(1) DEFAULT NULL,
  `price` int(32) DEFAULT NULL,
  `wardrobe` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.playerhousing: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `playerhousing` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerhousing` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.playermotels
CREATE TABLE IF NOT EXISTS `playermotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL,
  `zone` varchar(50) NOT NULL,
  `door` longtext NOT NULL,
  `inventory` longtext NOT NULL,
  `weapons` longtext NOT NULL,
  `dirtymoney` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla essentialmode_pz.playermotels: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `playermotels` DISABLE KEYS */;
/*!40000 ALTER TABLE `playermotels` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.playermotels_homeinventory
CREATE TABLE IF NOT EXISTS `playermotels_homeinventory` (
  `owner` varchar(50) NOT NULL,
  `inventory` longtext NOT NULL,
  `weapons` longtext NOT NULL,
  `dirtymoney` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla essentialmode_pz.playermotels_homeinventory: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `playermotels_homeinventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `playermotels_homeinventory` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.policearmory
CREATE TABLE IF NOT EXISTS `policearmory` (
  `steamID` tinytext NOT NULL,
  `weapons` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla essentialmode_pz.policearmory: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `policearmory` DISABLE KEYS */;
/*!40000 ALTER TABLE `policearmory` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.properties: ~42 rows (aproximadamente)
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{"y":564.89,"z":182.959,"x":119.384}', '{"x":117.347,"y":559.506,"z":183.304}', '{"y":557.032,"z":183.301,"x":118.037}', '{"y":567.798,"z":182.131,"x":119.249}', '[]', NULL, 1, 1, 0, '{"x":118.748,"y":566.573,"z":175.697}', 1500000),
	(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{"x":372.796,"y":428.327,"z":144.685}', '{"x":373.548,"y":422.982,"z":144.907},', '{"y":420.075,"z":145.904,"x":372.161}', '{"x":372.454,"y":432.886,"z":143.443}', '[]', NULL, 1, 1, 0, '{"x":377.349,"y":429.422,"z":137.3}', 1500000),
	(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{"y":-379.165,"z":37.961,"x":-936.363}', '{"y":-365.476,"z":113.274,"x":-913.097}', '{"y":-367.637,"z":113.274,"x":-918.022}', '{"y":-382.023,"z":37.961,"x":-943.626}', '[]', NULL, 1, 1, 0, '{"x":-927.554,"y":-377.744,"z":112.674}', 1700000),
	(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{"y":440.8,"z":146.702,"x":346.964}', '{"y":437.456,"z":148.394,"x":341.683}', '{"y":435.626,"z":148.394,"x":339.595}', '{"x":350.535,"y":443.329,"z":145.764}', '[]', NULL, 1, 1, 0, '{"x":337.726,"y":436.985,"z":140.77}', 1500000),
	(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{"y":502.696,"z":136.421,"x":-176.003}', '{"y":497.817,"z":136.653,"x":-174.349}', '{"y":495.069,"z":136.666,"x":-173.331}', '{"y":506.412,"z":135.0664,"x":-177.927}', '[]', NULL, 1, 1, 0, '{"x":-174.725,"y":493.095,"z":129.043}', 1500000),
	(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{"y":596.58,"z":142.641,"x":-686.554}', '{"y":591.988,"z":144.392,"x":-681.728}', '{"y":590.608,"z":144.392,"x":-680.124}', '{"y":599.019,"z":142.059,"x":-689.492}', '[]', NULL, 1, 1, 0, '{"x":-680.46,"y":588.6,"z":136.769}', 1500000),
	(7, 'LowEndApartment', 'Appartement de base', '{"y":-1078.735,"z":28.4031,"x":292.528}', '{"y":-1007.152,"z":-102.002,"x":265.845}', '{"y":-1002.802,"z":-100.008,"x":265.307}', '{"y":-1078.669,"z":28.401,"x":296.738}', '[]', NULL, 1, 1, 0, '{"x":265.916,"y":-999.38,"z":-100.008}', 562500),
	(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{"y":454.955,"z":96.462,"x":-1294.433}', '{"x":-1289.917,"y":449.541,"z":96.902}', '{"y":446.322,"z":96.899,"x":-1289.642}', '{"y":455.453,"z":96.517,"x":-1298.851}', '[]', NULL, 1, 1, 0, '{"x":-1287.306,"y":455.901,"z":89.294}', 1500000),
	(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{"x":-853.346,"y":696.678,"z":147.782}', '{"y":690.875,"z":151.86,"x":-859.961}', '{"y":688.361,"z":151.857,"x":-859.395}', '{"y":701.628,"z":147.773,"x":-855.007}', '[]', NULL, 1, 1, 0, '{"x":-858.543,"y":697.514,"z":144.253}', 1500000),
	(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{"y":620.494,"z":141.588,"x":-752.82}', '{"y":618.62,"z":143.153,"x":-759.317}', '{"y":617.629,"z":143.153,"x":-760.789}', '{"y":621.281,"z":141.254,"x":-750.919}', '[]', NULL, 1, 1, 0, '{"x":-762.504,"y":618.992,"z":135.53}', 1500000),
	(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{"y":37.025,"z":42.58,"x":-618.299}', '{"y":58.898,"z":97.2,"x":-603.301}', '{"y":58.941,"z":97.2,"x":-608.741}', '{"y":30.603,"z":42.524,"x":-620.017}', '[]', NULL, 1, 1, 0, '{"x":-622.173,"y":54.585,"z":96.599}', 1700000),
	(12, 'MiltonDrive', 'Milton Drive', '{"x":-775.17,"y":312.01,"z":84.658}', NULL, NULL, '{"x":-775.346,"y":306.776,"z":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
	(13, 'Modern1Apartment', 'Appartement Moderne 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_01_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.661,"y":327.672,"z":210.396}', 1300000),
	(14, 'Modern2Apartment', 'Appartement Moderne 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_01_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.735,"y":326.757,"z":186.313}', 1300000),
	(15, 'Modern3Apartment', 'Appartement Moderne 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_01_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.386,"y":330.782,"z":195.08}', 1300000),
	(16, 'Mody1Apartment', 'Appartement Mode 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_02_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.615,"y":327.878,"z":210.396}', 1300000),
	(17, 'Mody2Apartment', 'Appartement Mode 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_02_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.297,"y":327.092,"z":186.313}', 1300000),
	(18, 'Mody3Apartment', 'Appartement Mode 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_02_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.303,"y":330.932,"z":195.085}', 1300000),
	(19, 'Vibrant1Apartment', 'Appartement Vibrant 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_03_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.885,"y":327.641,"z":210.396}', 1300000),
	(20, 'Vibrant2Apartment', 'Appartement Vibrant 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_03_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.607,"y":327.344,"z":186.313}', 1300000),
	(21, 'Vibrant3Apartment', 'Appartement Vibrant 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_03_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.525,"y":330.851,"z":195.085}', 1300000),
	(22, 'Sharp1Apartment', 'Appartement Persan 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_04_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.527,"y":327.89,"z":210.396}', 1300000),
	(23, 'Sharp2Apartment', 'Appartement Persan 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_04_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.642,"y":326.497,"z":186.313}', 1300000),
	(24, 'Sharp3Apartment', 'Appartement Persan 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_04_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.503,"y":331.318,"z":195.085}', 1300000),
	(25, 'Monochrome1Apartment', 'Appartement Monochrome 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_05_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.289,"y":328.086,"z":210.396}', 1300000),
	(26, 'Monochrome2Apartment', 'Appartement Monochrome 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_05_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.692,"y":326.762,"z":186.313}', 1300000),
	(27, 'Monochrome3Apartment', 'Appartement Monochrome 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_05_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.094,"y":330.976,"z":195.085}', 1300000),
	(28, 'Seductive1Apartment', 'Appartement Séduisant 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_06_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.263,"y":328.104,"z":210.396}', 1300000),
	(29, 'Seductive2Apartment', 'Appartement Séduisant 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_06_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.655,"y":326.611,"z":186.313}', 1300000),
	(30, 'Seductive3Apartment', 'Appartement Séduisant 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_06_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.3,"y":331.414,"z":195.085}', 1300000),
	(31, 'Regal1Apartment', 'Appartement Régal 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_07_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.956,"y":328.257,"z":210.396}', 1300000),
	(32, 'Regal2Apartment', 'Appartement Régal 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_07_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.545,"y":326.659,"z":186.313}', 1300000),
	(33, 'Regal3Apartment', 'Appartement Régal 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_07_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.087,"y":331.429,"z":195.123}', 1300000),
	(34, 'Aqua1Apartment', 'Appartement Aqua 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_08_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.187,"y":328.47,"z":210.396}', 1300000),
	(35, 'Aqua2Apartment', 'Appartement Aqua 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_08_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.658,"y":326.563,"z":186.313}', 1300000),
	(36, 'Aqua3Apartment', 'Appartement Aqua 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_08_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.287,"y":331.084,"z":195.086}', 1300000),
	(37, 'IntegrityWay', '4 Integrity Way', '{"x":-47.804,"y":-585.867,"z":36.956}', NULL, NULL, '{"x":-54.178,"y":-583.762,"z":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
	(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{"x":-31.409,"y":-594.927,"z":79.03}', '{"x":-26.098,"y":-596.909,"z":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-11.923,"y":-597.083,"z":78.43}', 1700000),
	(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{"x":-17.702,"y":-588.524,"z":89.114}', '{"x":-16.21,"y":-582.569,"z":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-26.327,"y":-588.384,"z":89.123}', 1700000),
	(40, 'DellPerroHeights', 'Dell Perro Heights', '{"x":-1447.06,"y":-538.28,"z":33.74}', NULL, NULL, '{"x":-1440.022,"y":-548.696,"z":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
	(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{"x":-1452.125,"y":-540.591,"z":73.044}', '{"x":-1455.435,"y":-535.79,"z":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1467.058,"y":-527.571,"z":72.443}', 1700000),
	(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{"x":-1451.562,"y":-523.535,"z":55.928}', '{"x":-1456.02,"y":-519.209,"z":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1457.026,"y":-530.219,"z":55.937}', 1700000);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.rented_vehicles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.shops
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.shops: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` (`id`, `store`, `item`, `price`) VALUES
	(1, 'TwentyFourSeven', 'bread', 30),
	(2, 'TwentyFourSeven', 'water', 15),
	(3, 'RobsLiquor', 'bread', 30),
	(4, 'RobsLiquor', 'water', 15),
	(5, 'LTDgasoline', 'bread', 30),
	(6, 'LTDgasoline', 'water', 15),
	(8, 'TwentyFourSeven', 'coffe', 15),
	(9, 'TwentyFourSeven', 'coffeshort', 15),
	(10, 'TwentyFourSeven', 'coffemilk', 15),
	(11, 'TwentyFourSeven', 'hottea', 15),
	(12, 'TwentyFourSeven', 'milk', 15),
	(13, 'TwentyFourSeven', 'twix', 15),
	(14, 'TwentyFourSeven', 'panterarosa', 15),
	(15, 'TwentyFourSeven', 'phoskitos', 15),
	(16, 'TwentyFourSeven', 'bocajamon', 15),
	(17, 'RobsLiquor', 'gin', 15),
	(18, 'RobsLiquor', 'absinthe', 15),
	(19, 'LTDgasoline', 'oreo', 15),
	(20, 'LTDgasoline', 'doritos', 15),
	(21, 'LTDgasoline', 'coffe', 15),
	(22, 'LTDgasoline', 'coffeshort', 15),
	(23, 'LTDgasoline', 'coffemilk', 15),
	(24, 'LTDgasoline', 'hottea', 15),
	(25, 'LTDgasoline', 'milk', 15);
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.society_moneywash: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.territories
CREATE TABLE IF NOT EXISTS `territories` (
  `zone` varchar(50) NOT NULL DEFAULT '',
  `control` varchar(50) NOT NULL DEFAULT '',
  `influence` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.territories: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `territories` DISABLE KEYS */;
INSERT INTO `territories` (`zone`, `control`, `influence`) VALUES
	('East_V', 'thelostmc', 100),
	('DAVIS', 'grove', 100);
/*!40000 ALTER TABLE `territories` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.tm1_enclosures
CREATE TABLE IF NOT EXISTS `tm1_enclosures` (
  `enclosure_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `groupid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla essentialmode_pz.tm1_enclosures: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tm1_enclosures` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm1_enclosures` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.tm1_groups
CREATE TABLE IF NOT EXISTS `tm1_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `aprove` int(1) DEFAULT '0',
  `money` int(11) DEFAULT '0',
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=7709 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla essentialmode_pz.tm1_groups: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tm1_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm1_groups` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.tm1_membersgroups
CREATE TABLE IF NOT EXISTS `tm1_membersgroups` (
  `groupid` int(11) DEFAULT '0',
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `rank` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla essentialmode_pz.tm1_membersgroups: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tm1_membersgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm1_membersgroups` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.tm1_plants
CREATE TABLE IF NOT EXISTS `tm1_plants` (
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `object` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `finalobject` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla essentialmode_pz.tm1_plants: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tm1_plants` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm1_plants` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.trunk_inventory
CREATE TABLE IF NOT EXISTS `trunk_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.trunk_inventory: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `trunk_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `trunk_inventory` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.twitter_accounts
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Volcando datos para la tabla essentialmode_pz.twitter_accounts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `twitter_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_accounts` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.twitter_likes
CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Volcando datos para la tabla essentialmode_pz.twitter_likes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `twitter_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_likes` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `likes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla essentialmode_pz.twitter_tweets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `twitter_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_tweets` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(40) NOT NULL,
  `accounts` longtext,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT '0',
  `loadout` longtext,
  `position` varchar(53) DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `is_dead` tinyint(1) DEFAULT '0',
  `phone_number` int(11) DEFAULT NULL,
  `last_property` varchar(255) DEFAULT NULL,
  `skin` longtext,
  `status` longtext,
  `firstname` varchar(50) DEFAULT '',
  `lastname` varchar(50) DEFAULT '',
  `dateofbirth` varchar(25) DEFAULT '',
  `sex` varchar(10) DEFAULT '',
  `height` varchar(5) DEFAULT '',
  `license` varchar(255) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `zetony` int(11) NOT NULL DEFAULT '0',
  `jail` int(11) NOT NULL DEFAULT '0',
  `jailtype` varchar(50) NOT NULL DEFAULT '0',
  `tattoos` longtext,
  `pet` longtext,
  `house` varchar(100) NOT NULL DEFAULT '{"owns":false,"furniture":[],"houseId":0}',
  `bought_furniture` varchar(100) DEFAULT '{}',
  `last_house` int(11) DEFAULT '0',
  `skellydata` longtext NOT NULL,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `index_users_phone_number` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.user_accounts
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(40) NOT NULL,
  `name` varchar(50) NOT NULL,
  `money` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.user_accounts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_accounts` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.user_contacts
CREATE TABLE IF NOT EXISTS `user_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_contacts_identifier_name_number` (`identifier`,`name`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.user_contacts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `user_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_contacts` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.user_convictions
CREATE TABLE IF NOT EXISTS `user_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.user_convictions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `user_convictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_convictions` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.user_licenses: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.user_mdt
CREATE TABLE IF NOT EXISTS `user_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `mugshot_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.user_mdt: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `user_mdt` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_mdt` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.user_parkings
CREATE TABLE IF NOT EXISTS `user_parkings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) DEFAULT NULL,
  `garage` varchar(60) DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `vehicle` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.user_parkings: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `user_parkings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_parkings` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.vehicles: ~119 rows (aproximadamente)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Alpha', 'alpha', 60000, 'sports'),
	('Asea', 'asea', 5500, 'sedans'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blista', 'blista', 8000, 'compacts'),
	('Blista coupe', 'blista2', 8000, 'compacts'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet Carrera', 'comet3', 65000, 'sports'),
	('Comet OffRoad', 'comet4', 65000, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Deviant', 'deviant', 320000, 'muscle'),
	('Dominator R', 'dominator', 35000, 'muscle'),
	('Dominator', 'dominator2', 35000, 'muscle'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
	('Elegy', 'elegy', 38500, 'sports'),
	('Elegy Sport', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Flash GT', 'flashgt', 2600, 'sports'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Free-Walker', 'freecrawler', 320000, 'offroad'),
	('Fugitive', 'fugitive', 12000, 'sedans'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gauntlet', 'gauntlet', 30000, 'muscle'),
	('Burrito Fck', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Impaler', 'impaler', 320000, 'muscle'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Issi Mini', 'issi3', 10000, 'compacts'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Jester Supra', 'jester3', 135000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Michelli', 'michelli', 2600, 'sedans'),
	('Minivan', 'minivan', 13000, 'sedans'),
	('Minivan Style', 'minivan2', 13000, 'sedans'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nightshade', 'nightshade', 65000, 'muscle'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oracle', 'oracle', 35000, 'coupes'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Panto', 'panto', 10000, 'compacts'),
	('Patriot', 'patriot', 55000, 'suvs'),
	('Penetrador', 'penetrator', 1610000, 'sports'),
	('Penumbra', 'penumbra', 28000, 'sports'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo', 'primo', 14000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('Radius', 'radi', 29000, 'suvs'),
	('Raiden Electrico', 'raiden', 1375000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruiner', 'ruiner', 5745600, 'muscle'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Speedo W', 'speedo4', 320000, 'vans'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Tulip', 'tulip', 320000, 'muscle'),
	('Vamos', 'vamos', 320000, 'muscle'),
	('Vigero', 'vigero', 12500, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Voltic Electrico', 'voltic', 3830400, 'sports'),
	('Voodoo', 'voodoo', 7200, 'muscle'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.vehicles_bike
CREATE TABLE IF NOT EXISTS `vehicles_bike` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.vehicles_bike: ~48 rows (aproximadamente)
/*!40000 ALTER TABLE `vehicles_bike` DISABLE KEYS */;
INSERT INTO `vehicles_bike` (`name`, `model`, `price`, `category`) VALUES
	('Akuma', 'AKUMA', 7500, 'naked'),
	('Avarus', 'avarus', 18000, 'custom'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('BF400', 'bf400', 6500, 'enduro'),
	('Quad Truck', 'blazer3', 1755600, 'quad'),
	('Quad R', 'blazer4', 1755600, 'quad'),
	('BMX (velo)', 'bmx', 160, 'bike'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Chimera', 'chimera', 38000, 'custom'),
	('Cliffhanger', 'cliffhanger', 9500, 'custom'),
	('Cruiser (velo)', 'cruiser', 510, 'bike'),
	('Daemon', 'daemon', 11500, 'custom'),
	('Daemon High', 'daemon2', 13500, 'custom'),
	('Death Bike', 'deathbike', 2600, 'custom'),
	('Defiler', 'defiler', 9800, 'naked'),
	('Diablous', 'diablous', 9800, 'naked'),
	('Diablous R', 'diablous2', 9800, 'naked'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Enduro', 'enduro', 5500, 'enduro'),
	('Esskey', 'esskey', 4200, 'naked'),
	('Faggio', 'faggio', 1900, 'scooter'),
	('Vespa Hypster', 'faggio2', 2800, 'scooter'),
	('Vespa', 'faggio3', 2800, 'scooter'),
	('FCR', 'fcr', 9800, 'naked'),
	('FCRR', 'fcr2', 9800, 'naked'),
	('Fixter (velo)', 'fixter', 225, 'bike'),
	('Gargoyle', 'gargoyle', 16500, 'custom'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hexer', 'hexer', 12000, 'custom'),
	('Innovation', 'innovation', 23500, 'custom'),
	('Manchez', 'manchez', 5300, 'enduro'),
	('Nemesis', 'nemesis', 5800, 'naked'),
	('Nightblade', 'nightblade', 35000, 'custom'),
	('PCJ-600', 'pcj', 6200, 'naked'),
	('Ruffian', 'ruffian', 6800, 'naked'),
	('Sanchez', 'sanchez', 5300, 'enduro'),
	('Sanchez Sport', 'sanchez2', 5300, 'enduro'),
	('Scorcher (velo)', 'scorcher', 280, 'bike'),
	('Sovereign', 'sovereign', 22000, 'custom'),
	('Thrust', 'thrust', 24000, 'motorcycles'),
	('Tri bike (velo)', 'tribike3', 520, 'bike'),
	('Vader', 'vader', 7200, 'naked'),
	('Vortex', 'vortex', 9800, 'naked'),
	('Woflsbane', 'wolfsbane', 9000, 'custom'),
	('Zombie', 'zombiea', 9500, 'custom'),
	('Zombie Luxuary', 'zombieb', 12000, 'custom');
/*!40000 ALTER TABLE `vehicles_bike` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.vehicles_luxury
CREATE TABLE IF NOT EXISTS `vehicles_luxury` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.vehicles_luxury: ~102 rows (aproximadamente)
/*!40000 ALTER TABLE `vehicles_luxury` DISABLE KEYS */;
INSERT INTO `vehicles_luxury` (`name`, `model`, `price`, `category`) VALUES
	('Adder', 'adder', 2147483647, 'super'),
	('Autarch', 'autarch', 2147483647, 'super'),
	('Baller Luxury', 'baller5', 2147483647, 'suvs'),
	('Banshee 900R', 'banshee2', 2147483647, 'super'),
	('Btype', 'btype', 2147483647, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 2147483647, 'sportsclassics'),
	('Btype Luxe', 'btype3', 2147483647, 'sportsclassics'),
	('Bullet', 'bullet', 2147483647, 'super'),
	('Casco', 'casco', 2147483647, 'sportsclassics'),
	('Cheetah', 'cheetah', 2147483647, 'super'),
	('Cheetah R', 'cheetah2', 2147483647, 'super'),
	('Cognoscenti', 'cognoscenti', 2147483647, 'luxury'),
	('Cognoscenti Luxe', 'cognoscenti2', 2147483647, 'luxury'),
	('Comet GT', 'comet5', 2147483647, 'sports'),
	('Chevrolet coquette', 'coquette', 2147483647, 'sports'),
	('Coquette Classic', 'coquette2', 2147483647, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 2147483647, 'sportsclassics'),
	('Cyclone Electrico', 'cyclone', 2147483647, 'super'),
	('Death Proto Bike', 'deathbike2', 2147483647, 'motolux'),
	('Deveste', 'deveste', 2147483647, 'super'),
	('Dominator Sport', 'dominator3', 2147483647, 'sports'),
	('Dukes Movie', 'dukes2', 2147483647, 'muscle'),
	('Ellie', 'ellie', 2147483647, 'sports'),
	('Entity Sport', 'entity2', 2147483647, 'super'),
	('Entity XF', 'entityxf', 2147483647, 'super'),
	('F620', 'f620', 2147483647, 'coupes'),
	('Stirling GT', 'feltzer3', 2147483647, 'sportsclassics'),
	('FMJ', 'fmj', 2147483647, 'super'),
	('GB 200', 'gb200', 2147483647, 'racing'),
	('McLoren Gp1', 'gp1', 2147483647, 'sports'),
	('GT 500', 'gt500', 2147483647, 'sportsclassics'),
	('Hotknife', 'hotknife', 2147483647, 'sportsclassics'),
	('Hustler', 'hustler', 2147483647, 'muscle'),
	('Impaler Luxe', 'impaler3', 2147483647, 'sportsclassics'),
	('Infernus', 'infernus', 2147483647, 'super'),
	('Countuch', 'infernus2', 2147483647, 'super'),
	('Itali GT', 'italigtb', 2147483647, 'super'),
	('Itali GTR', 'italigtb2', 2147483647, 'super'),
	('Italia GTO', 'italigto', 2147483647, 'super'),
	('Jester', 'jester', 2147483647, 'sports'),
	('Khamelion Electrico', 'khamelion', 2147483647, 'sports'),
	('RE-7B', 'le7b', 2147483647, 'super'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('Neon', 'neon', 1500000, 'sports'),
	('Nero', 'nero', 1955000, 'super'),
	('Nero GT', 'nero2', 1955000, 'super'),
	('Osiris', 'osiris', 160000, 'super'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Patriot Long', 'patriot2', 55000, 'suvs'),
	('Pfister', 'pfister811', 85000, 'super'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('X80 Proto', 'prototipo', 2500000, 'super'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('Reaper', 'reaper', 150000, 'super'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('Mustang GT', 'rmodmustang', 999999999, 'muscle'),
	('Ruston', 'ruston', 1610000, 'sports'),
	('Sanctus', 'sanctus', 25000, 'motolux'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('SC 1', 'sc1', 1603000, 'super'),
	('Schafter Luxe', 'schafter4', 25000, 'luxury'),
	('Schafter Luxe R', 'schafter5', 25000, 'luxury'),
	('Schafter R', 'schafter6', 25000, 'sedans'),
	('Schalgen', 'schlagen', 320000, 'super'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'super'),
	('Shotaro Concept', 'shotaro', 320000, 'motolux'),
	('Specter', 'specter', 1610000, 'sports'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('Super Diamond', 'superd', 130000, 'suvs'),
	('Swinger', 'swinger', 320000, 'sportsclassics'),
	('T20', 't20', 300000, 'super'),
	('Taipan', 'taipan', 320000, 'super'),
	('Drift Tampa', 'tampa2', 80000, 'racing'),
	('Tempesta', 'tempesta', 1955000, 'super'),
	('Tezeract', 'tezeract', 320000, 'super'),
	('Torero', 'torero', 1955000, 'super'),
	('Lambor Toros', 'toros', 320000, 'super'),
	('Tropos', 'tropos', 40000, 'sports'),
	('F40', 'turismo2', 1955000, 'super'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrant', 'tyrant', 320000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Vagner', 'vagner', 1955000, 'super'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Visione', 'visione', 2250000, 'super'),
	('Voltic', 'voltic', 90000, 'super'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Atun Mortin', 'xa21', 1610000, 'sports'),
	('XLS Sport', 'xls2', 32000, 'suvs'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Zentorno', 'zentorno', 1500000, 'super'),
	('Z-Type', 'ztype', 220000, 'sportsclassics');
/*!40000 ALTER TABLE `vehicles_luxury` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.vehicles_scrap
CREATE TABLE IF NOT EXISTS `vehicles_scrap` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.vehicles_scrap: ~38 rows (aproximadamente)
/*!40000 ALTER TABLE `vehicles_scrap` DISABLE KEYS */;
INSERT INTO `vehicles_scrap` (`name`, `model`, `price`, `category`) VALUES
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bison', 'bison', 45000, 'offroad'),
	('Blazer Offroad', 'blazer', 1755600, 'quad'),
	('Bobcat XL', 'bobcatxl', 32000, 'offroad'),
	('Buccaneer', 'buccaneer', 18000, 'muscle'),
	('Camper', 'camper', 42000, 'vans'),
	('Cavalca', 'cavalcade', 55000, 'suvs'),
	('Siat 124', 'chburek', 3200, 'cheap'),
	('Chino', 'chino', 15000, 'muscle'),
	('Cloque', 'clique', 32000, 'cheap'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('Crazy Dune', 'dune2', 8000, 'offroad'),
	('Old Emperor', 'emperor2', 8500, 'cheap'),
	('Faction', 'faction', 20000, 'muscle'),
	('Fagaloa', 'fagaloa', 2600, 'cheap'),
	('Impaler Custom', 'impaler2', 32000, 'muscle'),
	('Imperator', 'imperator', 32000, 'muscle'),
	('Issi 4x4', 'issi4', 10000, 'cheap'),
	('Journey', 'journey', 6500, 'vans'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('Mesa', 'mesa', 16000, 'offroad'),
	('Mesa Trail', 'mesa3', 40000, 'offroad'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Phoenix', 'phoenix', 12500, 'muscle'),
	('Picador', 'picador', 18000, 'muscle'),
	('Rebel 4x4', 'rebel', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Riata', 'riata', 380000, 'offroad'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Slam Van', 'slamvan', 11500, 'muscle'),
	('Ruin van', 'surfer2', 12000, 'cheap'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Virgo Classic', 'virgo2', 14000, 'muscle'),
	('Virgo Luxe', 'virgo3', 14000, 'muscle'),
	('Old Voodoo', 'voodoo2', 7200, 'cheap');
/*!40000 ALTER TABLE `vehicles_scrap` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.vehicle_categories: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'NO'),
	('coupes', 'NO'),
	('muscle', 'NO'),
	('offroad', 'NO'),
	('sedans', 'NO'),
	('sports', 'NO'),
	('suvs', 'NO'),
	('vans', 'NO');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.vehicle_categories_bike
CREATE TABLE IF NOT EXISTS `vehicle_categories_bike` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.vehicle_categories_bike: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `vehicle_categories_bike` DISABLE KEYS */;
INSERT INTO `vehicle_categories_bike` (`name`, `label`) VALUES
	('bike', 'NO'),
	('custom', 'NO'),
	('enduro', 'NO'),
	('motorcycles', 'NO'),
	('naked', 'NO'),
	('quad', 'NO'),
	('scooter', 'NO');
/*!40000 ALTER TABLE `vehicle_categories_bike` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.vehicle_categories_luxury
CREATE TABLE IF NOT EXISTS `vehicle_categories_luxury` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.vehicle_categories_luxury: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `vehicle_categories_luxury` DISABLE KEYS */;
INSERT INTO `vehicle_categories_luxury` (`name`, `label`) VALUES
	('coupes', 'NO'),
	('luxury', 'NO'),
	('motolux', 'NO'),
	('muscle', 'NO'),
	('racing', 'NO'),
	('sedans', 'NO'),
	('sports', 'NO'),
	('sportsclassics', 'NO'),
	('super', 'NO'),
	('suvs', 'NO');
/*!40000 ALTER TABLE `vehicle_categories_luxury` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.vehicle_categories_scrap
CREATE TABLE IF NOT EXISTS `vehicle_categories_scrap` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.vehicle_categories_scrap: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `vehicle_categories_scrap` DISABLE KEYS */;
INSERT INTO `vehicle_categories_scrap` (`name`, `label`) VALUES
	('cheap', 'NO'),
	('muscle', 'NO'),
	('offroad', 'NO'),
	('quad', 'NO'),
	('sedans', 'NO'),
	('suvs', 'NO'),
	('vans', 'NO');
/*!40000 ALTER TABLE `vehicle_categories_scrap` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.vehicle_sold: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;

-- Volcando estructura para tabla essentialmode_pz.weashops
CREATE TABLE IF NOT EXISTS `weashops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla essentialmode_pz.weashops: ~40 rows (aproximadamente)
/*!40000 ALTER TABLE `weashops` DISABLE KEYS */;
INSERT INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
	(1, 'GunShop', 'WEAPON_PISTOL', 300),
	(2, 'BlackWeashop', 'WEAPON_PISTOL', 500),
	(3, 'GunShop', 'WEAPON_FLASHLIGHT', 60),
	(4, 'BlackWeashop', 'WEAPON_FLASHLIGHT', 70),
	(5, 'GunShop', 'WEAPON_MACHETE', 90),
	(6, 'BlackWeashop', 'WEAPON_MACHETE', 110),
	(7, 'GunShop', 'WEAPON_NIGHTSTICK', 150),
	(8, 'BlackWeashop', 'WEAPON_NIGHTSTICK', 150),
	(9, 'GunShop', 'WEAPON_BAT', 100),
	(10, 'BlackWeashop', 'WEAPON_BAT', 100),
	(11, 'GunShop', 'WEAPON_STUNGUN', 50),
	(12, 'BlackWeashop', 'WEAPON_STUNGUN', 50),
	(13, 'GunShop', 'WEAPON_MICROSMG', 1400),
	(14, 'BlackWeashop', 'WEAPON_MICROSMG', 1700),
	(15, 'GunShop', 'WEAPON_PUMPSHOTGUN', 3400),
	(16, 'BlackWeashop', 'WEAPON_PUMPSHOTGUN', 3500),
	(17, 'GunShop', 'WEAPON_ASSAULTRIFLE', 10000),
	(18, 'BlackWeashop', 'WEAPON_ASSAULTRIFLE', 11000),
	(19, 'GunShop', 'WEAPON_SPECIALCARBINE', 15000),
	(20, 'BlackWeashop', 'WEAPON_SPECIALCARBINE', 16500),
	(21, 'GunShop', 'WEAPON_SNIPERRIFLE', 22000),
	(22, 'BlackWeashop', 'WEAPON_SNIPERRIFLE', 24000),
	(23, 'GunShop', 'WEAPON_FIREWORK', 18000),
	(24, 'BlackWeashop', 'WEAPON_FIREWORK', 20000),
	(25, 'GunShop', 'WEAPON_GRENADE', 500),
	(26, 'BlackWeashop', 'WEAPON_GRENADE', 650),
	(27, 'GunShop', 'WEAPON_BZGAS', 200),
	(28, 'BlackWeashop', 'WEAPON_BZGAS', 350),
	(29, 'GunShop', 'WEAPON_FIREEXTINGUISHER', 100),
	(30, 'BlackWeashop', 'WEAPON_FIREEXTINGUISHER', 100),
	(31, 'GunShop', 'WEAPON_BALL', 50),
	(32, 'BlackWeashop', 'WEAPON_BALL', 50),
	(33, 'GunShop', 'WEAPON_SMOKEGRENADE', 100),
	(34, 'BlackWeashop', 'WEAPON_SMOKEGRENADE', 100),
	(35, 'BlackWeashop', 'WEAPON_APPISTOL', 1100),
	(36, 'BlackWeashop', 'WEAPON_CARBINERIFLE', 12000),
	(37, 'BlackWeashop', 'WEAPON_HEAVYSNIPER', 30000),
	(38, 'BlackWeashop', 'WEAPON_MINIGUN', 45000),
	(39, 'BlackWeashop', 'WEAPON_RAILGUN', 50000),
	(40, 'BlackWeashop', 'WEAPON_STICKYBOMB', 500);
/*!40000 ALTER TABLE `weashops` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
