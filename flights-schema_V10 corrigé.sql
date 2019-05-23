SET AUTOCOMMIT = 0;
START TRANSACTION ;

-- Suppression de la DB si elle existe (en cas de rechargement).
DROP SCHEMA IF EXISTS nyc_flights ;

-- Création de la DB avec son encoding.
CREATE SCHEMA nyc_flights CHARACTER SET utf8mb4  -- Choix de 'utf8mb4' car 'utf8' est un alias pour 'utf8mb3' qui
             DEFAULT COLLATE utf8mb4_0900_ai_ci; -- le sera pour 'utf8mb4' dans les futures versions de MySQL.
                                                   
-- Connection à la DB.
USE nyc_flights ;


-- Création de la table flighs :
DROP TABLE IF EXISTS flights ;
CREATE TABLE flights 
(
     -- id_flight SMALLINT PRIMARY KEY AUTO_INCREMENT, -- Data type 'smallint' suffisant car le nombre de distinct 'flight' est de 3.844.
     year CHAR(4),
     month CHAR(2), -- BD va trouver mois 23 ou 24 qui n'existent pas avec VARCHAR, trouver solution
     day CHAR(2),
     dep_time SMALLINT UNSIGNED, --
     sched_dep_time SMALLINT UNSIGNED, --
     dep_delay SMALLINT, -- prend en compte les négatifs sans unsigned
     arr_time SMALLINT UNSIGNED, --
     sched_arr_time SMALLINT UNSIGNED,
     arr_delay SMALLINT,
     carrier CHAR(2),
     flight VARCHAR(4), --
     tailnum CHAR(6),
     origin CHAR(3),
     dest CHAR(3),
     air_time SMALLINT UNSIGNED,
     distance SMALLINT UNSIGNED, --
     hour CHAR(2),
     minute CHAR(2),
     time_hour DATETIME -- Combinaison des colonnes year, month, day, hour (sans les minutes)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ; 
SHOW WARNINGS ;-- Permet de capturer les erreurs et warnings générés par la rêquete précédente (en mode d'exécution manuel).


-- Création de la table airlines :
DROP TABLE IF EXISTS airlines ;
CREATE TABLE airlines 
(
     carrier VARCHAR(2) PRIMARY KEY,
     name VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ; 
SHOW WARNINGS ;-- Permet de capturer les erreurs et warnings générés par la rêquete précédente (en mode d'exécution manuel).


-- Création de la table planes :
DROP TABLE IF EXISTS planes ;
CREATE TABLE planes 
(
     tailnum VARCHAR (6) PRIMARY KEY,
     year YEAR,
     type VARCHAR (30),
     manufacturer VARCHAR(30),
     model VARCHAR(20),
     engines TINYINT,
     seats SMALLINT,
     speed SMALLINT,
     engine VARCHAR(15)    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ; 



-- Création de la table airports :
DROP TABLE IF EXISTS airports ;
CREATE TABLE airports 
(
     faa VARCHAR(3) PRIMARY KEY,
     name VARCHAR(55),
     lat SMALLINT UNSIGNED,
     lon SMALLINT,
     alt SMALLINT,
     tz TINYINT,
     dst VARCHAR(1),
     tzone VARCHAR(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ; 
SHOW WARNINGS ;-- Permet de capturer les erreurs et warnings générés par la rêquete précédente (en mode d'exécution manuel).


-- Création de la table weather :
DROP TABLE IF EXISTS weather ;
CREATE TABLE weather 
(
     origin VARCHAR(3),
     year YEAR,
     month TINYINT,
     day TINYINT,
     hour TINYINT,
     temp DECIMAL(5,2),
     dewp DECIMAL(4,2),
     humid DECIMAL(5,2),
     wind_dir SMALLINT,
     wind_speed SMALLINT,    -- ça passe sinon decimal ?
     wind_gust DECIMAL(15,10),
     precip TINYINT,         --
     pressure SMALLINT,
     visib TINYINT,
     time_hour DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ; 
SHOW WARNINGS ;-- Permet de capturer les erreurs et warnings générés par la rêquete précédente (en mode d'exécution manuel).


SET AUTOCOMMIT = 1;
 
-- FIN DE FICHIER SCHEMA