DROP DATABASE IF EXISTS air_quality;

CREATE DATABASE air_quality;
USE air_quality;

Create TABLE sensors(
    id INT NOT NULL AUTO_INCREMENT,
    impId INT NOT NULL,
    timeInfo DATETIME NOT NULL,
    temperature DECIMAL(3,2) NOT NULL,
    humidity DECIMAL(3,2) NOT NULL,
    pressure DECIMAL(3,2) NOT NULL,
    altitude DECIMAL(3,2) NOT NULL,
    latitude DECIMAL(7,7) NOT NULL,
    longitude DECIMAL(7,7) NOT NULL,
    particles DECIMAL(3,3) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE user(
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (username)
);

CREATE TABLE imp(
    id INT NOT NULL AUTO_INCREMENT,
    userId INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(userId) REFERENCES user(id)
);

CREATE TABLE loginSession(
    sessionId VARCHAR(255) NOT NULL,
    authenticatedUser INT NOT NULL,
    PRIMARY KEY(sessionID),
    FOREIGN KEY(authenticatedUser) REFERENCES user(id)
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
