DROP DATABASE IF EXISTS air_quality;

CREATE DATABASE air_quality;
USE air_quality;

CREATE TABLE temperature(
    id INT NOT NULL AUTO_INCREMENT,
    temperature DECIMAL(3,2) NOT NULL,
    timeInfo DATETIME NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE humidity(
    id INT NOT NULL AUTO_INCREMENT,
    humidity DECIMAL(3,2) NOT NULL,
    timeInfo DATETIME NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE pressure(
    id INT NOT NULL AUTO_INCREMENT,
    pressure DECIMAL(3,2) NOT NULL,
    timeInfo DATETIME NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE altitude(
    id INT NOT NULL AUTO_INCREMENT,
    altitude DECIMAL(3,2) NOT NULL,
    timeInfo DATETIME NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE sensorGPS(
    id INT NOT NULL AUTO_INCREMENT,
    latitude DECIMAL(7,7) NOT NULL,
    longitude DECIMAL(7,7) NOT NULL,
    timeInfo DATETIME NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE sensorParticle(
    id INT NOT NULL AUTO_INCREMENT,
    timeInfo DATETIME NOT NULL,
    PRIMARY KEY (id)
);

-- Create the user which the app will use to connect to the DB
DROP PROCEDURE IF EXISTS air_quality.drop_user_if_exists ;
DELIMITER $$
CREATE PROCEDURE air_quality.drop_user_if_exists()
BEGIN
  DECLARE foo BIGINT DEFAULT 0 ;
  SELECT COUNT(*)
  INTO foo
    FROM mysql.user
      WHERE User = 'air_quality' and  Host = 'localhost';
   IF foo > 0 THEN
         DROP USER 'air_quality'@'localhost' ;
  END IF;
END ;$$
DELIMITER ;
CALL air_quality.drop_user_if_exists() ;
DROP PROCEDURE IF EXISTS air_quality.drop_users_if_exists ;

CREATE USER 'air_quality'@'localhost' IDENTIFIED BY 'air_quality';
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE, LOCK TABLES, CREATE TEMPORARY TABLES ON air_quality.* TO 'air_quality'@'localhost';