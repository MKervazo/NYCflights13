SET AUTOCOMMIT = 0;
START TRANSACTION ;

-- Conncetion à la DB.
USE nyc_flights ;

-- Chargement de la table flights depuis un fichier csv.
TRUNCATE TABLE flights ;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/NYCflights/flights.csv'
INTO TABLE flights
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- pas besoin d'écrire toutes les colonnes car le fichier csv les prend par défaut

SHOW WARNINGS ; -- Permet de capturer les erreurs et warnings générés par la rêquete précédente (en mode d'exécution manuel).


-- Chargement de la table airlines depuis un fichier csv.
TRUNCATE TABLE airlines ;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/NYCflights/airlines.csv'
INTO TABLE airlines
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SHOW WARNINGS ; 

-- Chargement de la table planes depuis un fichier csv.
TRUNCATE TABLE planes ;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/NYCflights/planes.csv'
INTO TABLE planes
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SHOW WARNINGS ; 


-- Chargement de la table airports depuis un fichier csv.
TRUNCATE TABLE airports ;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/NYCflights/airports.csv'
INTO TABLE airports
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SHOW WARNINGS ; 


-- Chargement de la table weather depuis un fichier csv.
TRUNCATE TABLE weather ;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/NYCflights/weather.csv'
INTO TABLE weather
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SHOW WARNINGS ; 

-- Modification sur la table flights :

-- Ajout d'une clé primaire :
ALTER TABLE flights ADD id_flight FIRST SMALLINT UNSIGNED AUTO_INCREMENT ;

-- Modification des data type des variables de la 
-- table airlines et déclaration de sa clé primaire
ALTER TABLE airlines MODIFY carrier VARCHAR(2) PRIMARY KEY ;



-- Modification des data type des variables de la 
-- table planes et déclaration de sa clé primaire
UPDATE planes 
   SET speed = NULL WHERE speed = 0 ;



SET AUTOCOMMIT = 1;

-- FIN DE FICHER DATA

