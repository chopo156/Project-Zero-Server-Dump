CREATE TABLE `vehicle_categories_bike` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vehicle_categories_bike` (name, label) VALUES
	('bike','Bicicleta'),
	('scooter','Scooter'),
	('enduro','Enduro'),	
	('naked','Naked'),
	('custom','Custom'),
	('motorcycles','Carenado/R'),	
	('quad','Quad')
;

CREATE TABLE `vehicles_bike` (
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `vehicles_bike` (name, model, price, category) VALUES
	
	('BMX (velo)','bmx',160,'bike'),
	('Cruiser (velo)','cruiser',510,'bike'),
	('Fixter (velo)','fixter',225,'bike'),
	('Scorcher (velo)','scorcher',280,'bike'),
	('Tri bike (velo)','tribike3',520,'bike'),

	('Akuma','AKUMA',7500,'naked'),
	('Defiler','defiler',9800,'naked'),
	('Esskey','esskey',4200,'naked'),
	('Nemesis','nemesis',5800,'naked'),
	('PCJ-600','pcj',6200,'naked'),
	('Ruffian','ruffian',6800,'naked'),
	('Vader','vader',7200,'naked'),
	('Vortex','vortex',9800,'naked'),
	('Diablous','diablous',9800,'naked'),
	('Diablous R','diablous2',9800,'naked'),
	('FCR','fcr',9800,'naked'),
	('FCRR','fcr2',9800,'naked'),
	

	('Avarus','avarus',18000,'custom'),
	('Chimera','chimera',38000,'custom'),
	('Cliffhanger','cliffhanger',9500,'custom'),
	('Daemon','daemon',11500,'custom'),
	('Daemon High','daemon2',13500,'custom'),
	('Gargoyle','gargoyle',16500,'custom'),
	('Hexer','hexer',12000,'custom'),
	('Innovation','innovation',23500,'custom'),
	('Nightblade','nightblade',35000,'custom'),
	('Sovereign','sovereign',22000,'custom'),
	('Woflsbane','wolfsbane',9000,'custom'),
	('Zombie','zombiea',9500,'custom'),
	('Zombie Luxuary','zombieb',12000,'custom'),

	('Bagger','bagger',13500,'motorcycles'),
	('Bati 801','bati',12000,'motorcycles'),
	('Carbon RS','carbonrs',18000,'motorcycles'),
	('Double T','double',28000,'motorcycles'),
	('Hakuchou','hakuchou',31000,'motorcycles'),
	('Hakuchou Sport','hakuchou2',55000,'motorcycles'),
	('Thrust','thrust',24000,'motorcycles'),

	('BF400','bf400',6500,'enduro'),
	('Enduro','enduro',5500,'enduro'),
	('Manchez','manchez',5300,'enduro'),
	('Sanchez','sanchez',5300,'enduro'),
	('Sanchez Sport','sanchez2',5300,'enduro'),
	
	('Faggio','faggio',1900,'scooter'),
	('Vespa Hypster','faggio2',2800,'scooter'),
	('Vespa','faggio3',2800,'scooter'),
		
	('Quad Truck', 'blazer3', 1755600, 'quad'),
	('Blazer', 'blazer5', 1755600, 'quad');


CREATE TABLE `vehicle_categories` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vehicle_categories` (name, label) VALUES
	('muscle','Muscle'),
	('compacts','Compacto'),
	('vans','Furgoneta'),
	('sedan','Sedan'),
	('suvs','SUV'),
	('offroad','4x4'),
	('coupes','Coupes'),
	('sports','Deportivos')
;

CREATE TABLE `vehicles` (
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `vehicles` (name, model, price, category) VALUES

	('Blade','blade',15000,'muscle'),
	('Buccaneer Rider','buccaneer2',24000,'muscle'),
	('Chino Luxe','chino2',19000,'muscle'),
	('Dominator','dominator2',35000,'muscle'),
	('Dominator R','dominator',35000,'muscle'),
	('Gauntlet','gauntlet',30000,'muscle'),
	('Faction Rider','faction2',30000,'muscle'),
	('Nightshade','nightshade',65000,'muscle'),
	('Sabre GT','sabregt2',25000,'muscle'),
	('Tampa','tampa',16000,'muscle'),
	('Virgo','virgo',14000,'muscle'),
	('Vigero','vigero',12500,'muscle'),
	('Voodoo','voodoo',7200,'muscle'),
	('Ruiner', 'ruiner', 5745600, 'muscle'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Hermes', 'hermes', 535000, 'muscle'),

	('Blista','blista',8000,'compacts'),
	('Blista coupe','blista2',8000,'compacts'),
	('Brioso R/A','brioso',18000,'compacts'),
	('Issi','issi2',10000,'compacts'),
	('Issi Mini','issi3',10000,'compacts'),
	('Panto','panto',10000,'compacts'),	
	('Prairie','prairie',12000,'compacts'),

	('Burrito','burrito3',19000,'vans'),
	('Burrito Fck','gburrito2',29000,'vans'),
	('Moonbeam','moonbeam',18000,'vans'),
	('Moonbeam Rider','moonbeam2',35000,'vans'),
	('Rumpo','rumpo',15000,'vans'),
	('Rumpo Trail','rumpo3',19500,'vans'),
	('Surfer','surfer',12000,'vans'),
	('Youga','youga',10800,'vans'),
	('Youga Luxuary','youga2',14500,'vans'),

	('Minivan','minivan',13000,'sedans'),
	('Minivan Style','minivan2',13000,'sedans'),
	('Asea','asea',5500,'sedans'),	
	('Emperor','emperor',8500,'sedans'),
	('Fugitive','fugitive',12000,'sedans'),
	('Glendale','glendale',6500,'sedans'),
	('Intruder','intruder',7500,'sedans'),
	('Premier','premier',8000,'sedans'),
	('Primo','primo',14000,'sedans'),
	('Primo Custom','primo2',14000,'sedans'),
	('Regina','regina',5000,'sedans'),
	('Schafter','schafter2',25000,'sedans'),
	('Tailgater','tailgater',30000,'sedans'),	
	('Warrener','warrener',4000,'sedans'),	
	('Washington','washington',9000,'sedans'),

	('Baller','baller2',40000,'suvs'),
	('Baller Sport','baller3',60000,'suvs'),
	('Cavalcade','cavalcade2',55000,'suvs'),
	('Contender','contender',70000,'suvs'),
	('Dubsta','dubsta',45000,'suvs'),
	('Dubsta Luxuary','dubsta2',60000,'suvs'),
	('Fhantom','fq2',17000,'suvs'),	
	('Grabger','granger',50000,'suvs'),	
	('Gresley','gresley',47500,'suvs'),
	('Huntley S','huntley',40000,'suvs'),
	('Landstalker','landstalker',35000,'suvs'),	
	('Patriot','patriot',55000,'suvs'),
	('Radius','radi',29000,'suvs'),
	('Rocoto','rocoto',45000,'suvs'),
	('Seminole','seminole',25000,'suvs'),
	('XLS','xls',32000,'suvs'),

	('Brawler','brawler',45000,'offroad'),
	('Bubsta 6x6','dubsta3',120000,'offroad'),
	('Guardian','guardian',45000,'offroad'),
	('Rebel','rebel2',35000,'offroad'),
	('Sandking','sandking',55000,'offroad'),

	('Cognoscenti Cabrio','cogcabrio',55000,'coupes'),
	('Exemplar','exemplar',32000,'coupes'),
	('Felon','felon',42000,'coupes'),
	('Felon GT','felon2',55000,'coupes'),
	('Jackal','jackal',38000,'coupes'),
	('Oracle','oracle',35000,'coupes'),
	('Oracle XS','oracle2',35000,'coupes'),
	('Sentinel','sentinel',32000,'coupes'),
	('Sentinel XS','sentinel2',40000,'coupes'),
	('Zion','zion',36000,'coupes'),
	('Zion Cabrio','zion2',45000,'coupes'),

	('Buffalo','buffalo',12000,'sports'),
	('Buffalo S','buffalo2',20000,'sports'),
	('9F','ninef',65000,'sports'),
	('9F Cabrio','ninef2',80000,'sports'),
	('Alpha','alpha',60000,'sports'),
	('Banshee','banshee',70000,'sports'),
	('Bestia GTS','bestiagts',55000,'sports'),	
	('Carbonizzare','carbonizzare',75000,'sports'),
	('Comet','comet2',65000,'sports'),
	('Comet Carrera','comet3',65000,'sports'),
	('Comet OffRoad','comet4',65000,'sports'),
	('Elegy','elegy',38500,'sports'),
	('Elegy Sport','elegy2',38500,'sports'),
	('Feltzer','feltzer2',55000,'sports'),
	('Furore GT','furoregt',45000,'sports'),
	('Fusilade','fusilade',40000,'sports'),	
	('Jester Supra','jester3',135000,'sports'),
	('Kuruma','kuruma',30000,'sports'),
	('Lynx','lynx',40000,'sports'),
	('Massacro','massacro',65000,'sports'),
	('Omnis','omnis',35000,'sports'),
	('Penumbra','penumbra',28000,'sports'),
	('Rapid GT','rapidgt',35000,'sports'),
	('Rapid GT Convertible','rapidgt2',45000,'sports'),
	('Schafter V12','schafter3',50000,'sports'),
	('Sultan','sultan',15000,'sports'),	
	('Surano','surano',50000,'sports'),
	('Voltic Electrico', 'voltic', 3830400, 'sport'),
	('Raiden Electrico', 'raiden', 1375000, 'sports'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Penetrador', 'penetrator', 1610000, 'sports'),
	('Sentinel3', 'sentinel3', 650000, 'sports');







CREATE TABLE `vehicle_categories_luxury` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vehicle_categories_luxury` (name, label) VALUES
	('sportclassic','Deportivo Clasico'),
	('muscle','Muscle'),
	('sports','Deportivo'),
	('super','Super-Deportivo'),
	('luxury','Gama Luxury'),
	('sedans','Sedan'),
	('suvs','SUV'),
	('coupes','Coupes'),
	('super','Super-Deportivos'),
	('motolux','Motos Luxury')
;

CREATE TABLE `vehicles_luxury` (
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `vehicles_luxury` (name, model, price, category) VALUES

	('Coquette BlackFin','coquette3',55000,'sportclassic'),
	('Coquette Classic','coquette2',40000,'sportsclassics'),
	('Stirling GT','feltzer3',65000,'sportsclassics'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Btype','btype',62000,'sportsclassics'),
	('Btype Luxe','btype3',85000,'sportsclassics'),
	('Btype Hotroad','btype2',155000,'sportsclassics'),
	('Casco','casco',30000,'sportsclassics'),
	('Manana','manana',12800,'sportsclassics'),
	('Monroe','monroe',55000,'sportsclassics'),
	('Pigalle','pigalle',20000,'sportsclassics'),
	('Stinger','stinger',80000,'sportsclassics'),
	('Stinger GT','stingergt',75000,'sportsclassics'),
	('Z-Type','ztype',220000,'sportsclassics'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('Hotknife','hotknife',125000,'sportsclassics'),

	('Dukes Movie','dukes2',28000,'muscle'),
	('Hustler', 'hustler', 625000, 'muscle'),

	('Chevrolet coquette','coquette',55000,'sport'),
	('Comet GT', 'comet5', 1145000, 'sports'),
	('Jester','jester',65000,'sports'),
	('Khamelion Electrico','khamelion',38000,'sports'),
	('Mamba','mamba',70000,'sports'),
	('Seven 70','seven70',39500,'sports'),
	('Tropos','tropos',40000,'sports'),
	('Verlierer','verlierer2',70000,'sports'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Neon', 'neon', 1500000, 'sports'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('Elegy', 'elegy', 1610000, 'sports'),
	('Specter', 'specter', 1610000, 'sports'),
	('McLoren Gp1', 'gp1', 1610000, 'sports'),
	('Ruston', 'ruston', 1610000, 'sports'),
	('Atun Mortin', 'xa21', 1610000, 'sports'),
			
	('Drift Tampa','tampa2',80000,'racing'),

	('Cognoscenti','cognoscenti',55000,'luxury'),
	('Cognoscenti Luxe','cognoscenti2',55000,'luxury'),
	('Schafter Luxe','schafter4',25000,'luxury'),
	('Schafter Luxe R','schafter5',25000,'luxury'),

	('Schafter R','schafter6',25000,'sedans'),
	('Stretch','stretch',90000,'sedans'),

	('Super Diamond','superd',130000,'suvs'),
	('Baller Luxury','baller5',60000,'suvs'),
	('Patriot Long','patriot2',55000,'suvs'),
	('XLS Sport','xls2',32000,'suvs'),

	('F620','f620',40000,'coupes'),
	('Windsor','windsor',95000,'coupes'),
	('Windsor Drop','windsor2',125000,'coupes'),

	('Adder','adder',900000,'super'),
	('Banshee 900R','banshee2',255000,'super'),
	('Bullet','bullet',90000,'super'),
	('Cheetah','cheetah',375000,'super'),
	('Entity XF','entityxf',425000,'super'),
	('ETR1','sheava',220000,'super'),
	('FMJ','fmj',185000,'super'),
	('Infernus','infernus',180000,'super'),
	('Osiris','osiris',160000,'super'),
	('Pfister','pfister811',85000,'super'),
	('RE-7B','le7b',325000,'super'),
	('Reaper','reaper',150000,'super'),
	('Sultan RS','sultanrs',65000,'super'),
	('T20','t20',300000,'super'),
	('Turismo R','turismor',350000,'super'),
	('Tyrus','tyrus',600000,'super'),
	('Vacca','vacca',120000,'super'),
	('Voltic','voltic',90000,'super'),
	('X80 Proto','prototipo',2500000,'super'),
	('Zentorno','zentorno',1500000,'super'),
	('Visione', 'visione', 2250000, 'super'),
	('Cyclone Electrico', 'cyclone', 1890000, 'super'), 
	('SC 1', 'sc1', 1603000, 'super'),
	('Autarch', 'autarch', 1955000, 'super'),
	('Tempesta', 'tempesta', 1955000, 'super'),
	('Itali GT', 'italigtb', 1955000, 'super'),
	('Itali GTR', 'italigtb2', 1955000, 'super'),
	('Nero', 'nero', 1955000, 'super'),
	('Nero GT', 'nero2', 1955000, 'super'),
	('F40', 'turismo2', 1955000, 'super'),
	('Countuch', 'infernus2', 1955000, 'super'),
	('Vagner', 'vagner', 1955000, 'super'),
	('Cheetah', 'cheetah2', 1955000, 'super'),
	('Torero', 'torero', 1955000, 'super'),

	('Sanctus','sanctus',25000,'motolux'),	
	('Shotaro Concept','shotaro',320000,'motolux');


CREATE TABLE `vehicle_categories_scrap` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vehicle_categories_scrap` (name, label) VALUES
	('cheap','Chatarras'),
	('muscle','Muscle'),
	('vans','Furgoneta'),
	('sedans','Sedan'),
	('muscle','Muscle'),
	('suvs','SUV'),
	('offroad','4x4'),
	('quad','Quad')
;

CREATE TABLE `vehicles_scrap` (
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `vehicles_scrap` (name, model, price, category) VALUES

	('Buccaneer','buccaneer',18000,'muscle'),
	('Chino','chino',15000,'muscle'),
	('Dukes','dukes',28000,'muscle'),
	('Faction','faction',20000,'muscle'),
	('Phoenix','phoenix',12500,'muscle'),
	('Picador','picador',18000,'muscle'),
	('Sabre Turbo','sabregt',20000,'muscle'),
	('Slam Van','slamvan',11500,'muscle'),
	('Virgo Classic','virgo2',14000,'muscle'),
	('Virgo Luxe','virgo3',14000,'muscle'),

	('Old Voodoo','voodoo2',7200,'cheap'),
	('Issi 4x4','issi4',10000,'cheap'),
	('Ruin van','surfer2',12000,'cheap'),
	('Old Emperor','emperor2',8500,'cheap'),

	('Bison','bison',45000,'offroad'),
	('Bobcat XL','bobcatxl',32000,'offroad'),

	('Camper','camper',42000,'vans'),
	('Journey','journey',6500,'vans'),
	('Paradise','paradise',19000,'vans'),

	('Regina','regina',5000,'sedans'),

	('Cavalca','cavalcade',55000,'suvs'),
	('Mesa','mesa',16000,'suvs'),
	('Mesa Trail','mesa3',40000,'suvs'),

	('Dune Buggy','dune',8000,'offroad'),
	('Crazy Dune','dune2',8000,'offroad'),
	('Rebel 4x4','rebel',35000,'offroad'),
	('Trophy Truck','trophytruck',60000,'offroad'),
	('Trophy Truck Limited','trophytruck2',80000,'offroad'),
	('Riata', 'riata', 380000, 'offroad'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('Bifta','bifta',12000,'offroad'),
	('Bf Injection','bfinjection',16000,'offroad'),

	('Blazer Offroad', 'blazer', 1755600, 'quad');





	
INSERT INTO `vehicles_bike` (name, model, price, category) VALUES
	
    ('Death Bike','deathbike',2600,'custom');



INSERT INTO `vehicles` (name, model, price, category) VALUES

	('Flash GT','flashgt',2600,'sport'),
    ('Michelli','michelli',2600,'sedan'),
    ('Free-Walker','freecrawler',320000,'offroad'),
    ('Speedo W','speedo4',320000,'vans'),
    ('Deviant','deviant',320000,'muscle'),
    ('Impaler','impaler',320000,'muscle'),
    ('Tulip','tulip',320000,'muscle'),
    ('Vamos','vamos',320000,'muscle');



INSERT INTO `vehicles_luxury` (name, model, price, category) VALUES

	('Dominator Sport','dominator3',320000,'sport'),
    ('Ellie','ellie',320000,'sport'),
    ('Entity Sport','entity2',320000,'super'),
    ('GB 200','gb200',2600,'racing'),
    ('Tezeract','tezeract',320000,'super'),
    ('Taipan','taipan',320000,'super'), 
    ('Tyrant','tyrant',320000,'super'),
    ('Swinger','swinger',320000,'sportsclassics'),
    ('Death Proto Bike','deathbike2',2600,'motolux'),
    ('Deveste','deveste',320000,'super'),
    ('Italia GTO','italigto',320000,'super'),
    ('Impaler Luxe','impaler3',320000,'sportsclassics'),
    ('Schalgen','schlagen',320000,'super'),
    ('Lambor Toros','toros',320000,'super');


INSERT INTO `vehicles_scrap` (name, model, price, category) VALUES

    ('Siat 124','chburek',3200,'cheap'),
    ('Fagaloa','fagaloa',2600,'cheap'),
    ('Cloque','clique',32000,'cheap'), 
    ('Impaler Custom','impaler2',32000,'muscle'),
    ('Imperator','imperator',32000,'muscle');