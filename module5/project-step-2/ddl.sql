-- disable foreign key checks and commits
SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT = 0;

-- create database tables:

-- Countries table structure
CREATE OR REPLACE TABLE Countries (
    CountryID int(11) AUTO_INCREMENT UNIQUE NOT NULL,
    CountryName VARCHAR(255) NOT NULL,
    PRIMARY KEY (CountryID)
);

-- Locations table structure
CREATE OR REPLACE TABLE Locations (
    LocationID int(11) AUTO_INCREMENT UNIQUE NOT NULL,
    CountryID int(11) NOT NULL,
    LocationDescription VARCHAR(255) NOT NULL,
    Coordinates point NOT NULL SRID 4326,
    SPATIAL INDEX (Coordinates),
    PRIMARY KEY (LocationID),
    FOREIGN KEY (CountryID) REFERENCES Countries (CountryID)
);

-- Climbers table structure
CREATE OR REPLACE TABLE Climbers (
    ClimberID int(11) AUTO_INCREMENT UNIQUE NOT NULL,
    ClimberName varchar(255) NOT NULL,
    ClimberDateOfBirth date NOT NULL,
    ClimberNationality varchar(255) NOT NULL,
    PRIMARY KEY (ClimberID)
);

-- Climbs table structure
CREATE OR REPLACE TABLE Climbs (
    ClimbID int(11) AUTO_INCREMENT UNIQUE NOT NULL,
    LocationID int(11) NOT NULL,
    ClimbDescription varchar(255) NOT NULL,
    ClimbStyle varchar(255) NOT NULL,
    Grade varchar(255) NOT NULL,
    PRIMARY KEY (ClimbID),
    FOREIGN KEY (LocationID) REFERENCES Locations (LocationID)
);

-- Ascents table structure
CREATE OR REPLACE TABLE Ascents (
    ClimberID int(11) NOT NULL,
    ClimbID int(11) NOT NULL,
    AscentStyle varchar(255) NOT NULL,
    AscentDate varchar(255) NOT NULL,
    Flash tinyint(1),
    FOREIGN KEY (ClimberID) REFERENCES Climbers (ClimberID),
    FOREIGN KEY (ClimbID) REFERENCES Climbs (ClimbID)
);

-- insert sample data:

-- insert data into countries
INSERT INTO Countries (CountryID, CountryName)
VALUES (9998, 'United States'),
(9997, 'Mexico'),
(9996, 'India');

-- insert data into locations
INSERT INTO Locations (LocationID, CountryID, LocationDescription, Coordinates)
VALUES (55556, 9998, 'Red Rock mountain in Nevada', ST_GeomFromText('POINT(41.3104, 76.3252)')),
(66669, 9997, 'El Potrero Chico near Monterrey', ST_GeomFromText('POINT(41.3104, 76.3252)')),
(88887, 9996, 'Cliff near Sethan village', ST_GeomFromText('POINT(32.2361, 76.3252)'));

-- enable foreign key checks and commits
SET FOREIGN_KEY_CHECKS=1;
COMMIT;