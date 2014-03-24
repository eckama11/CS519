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