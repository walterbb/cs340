-- disable foreign key checks and commits
SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT = 0;

-- create database tables:

-- Countries table structure
CREATE OR REPLACE TABLE Countries (
    CountryID int(11) AUTO_INCREMENT UNIQUE NOT NULL,
    CountryName VARCHAR(100) NOT NULL,
    PRIMARY KEY (CountryID)
);

-- Locations table structure
CREATE OR REPLACE TABLE Locations (
    LocationID int(11) AUTO_INCREMENT UNIQUE NOT NULL,
    CountryID int(11) NOT NULL,
    LocationDescription VARCHAR(145) NOT NULL,
    Coordinates point NOT NULL,
    SPATIAL INDEX (Coordinates),
    PRIMARY KEY (LocationID),
    FOREIGN KEY (CountryID) REFERENCES Countries (CountryID)
);

-- Climbers table structure
CREATE OR REPLACE TABLE Climbers (
    ClimberID int(11) AUTO_INCREMENT UNIQUE NOT NULL,
    ClimberName varchar(145) NOT NULL,
    ClimberDateOfBirth date NOT NULL,
    ClimberNationality varchar(145) NOT NULL,
    PRIMARY KEY (ClimberID)
);

-- Climbs table structure
CREATE OR REPLACE TABLE Climbs (
    ClimbID int(11) AUTO_INCREMENT UNIQUE NOT NULL,
    LocationID int(11) NOT NULL,
    ClimbName varchar(45) NOT NULL,
    ClimbDescription varchar(145) NOT NULL,
    ClimbStyle varchar(145) NOT NULL,
    Grade varchar(10) NOT NULL,
    PRIMARY KEY (ClimbID),
    FOREIGN KEY (LocationID) REFERENCES Locations (LocationID)
);

-- Ascents table structure
CREATE OR REPLACE TABLE Ascents (
    ClimberID int(11) NOT NULL,
    ClimbID int(11) NOT NULL,
    AscentStyle varchar(45) NOT NULL,
    AscentDate date NOT NULL,
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
VALUES (55556, 9998, 'Red Rock mountain in Nevada', Point(41.3104, 76.3252)),
(66669, 9997, 'El Potrero Chico near Monterrey', POINT(25.9512, 100.4766)),
(88887, 9996, 'Cliff near Sethan village', POINT(32.2361, 77.2227));

-- insert data into climbers
INSERT INTO Climbers (ClimberID, ClimberName, ClimberDateOfBirth, ClimberNationality)
VALUES (123, 'Rachel Green', '1990-04-15', 'Dutch'),
(456, 'David Kim', '1985-11-23', 'Korean'),
(789, 'Sarah Petel', '1998-08-05', 'Swedish'),
(482, 'Micheal Smith', '1979-02-10', 'Lebanese'),
(589, 'Ashley Vick', '2002-06-29', 'Mexican');

-- insert data into climbs
INSERT INTO Climbs (ClimbID, LocationID, ClimbName, ClimbDescription, ClimbStyle, Grade)
VALUES (1, 55556, 'The Nose', 'Short 100ft climb', 'Sport', '5.9b'),
(2, 55556, 'Biographie', '457ft climb up', 'Trad', '5.15c'),
(3, 66669, 'Dreamtime', '664ft climb', 'Sport', '5.14d');

-- insert data into ascents
INSERT INTO Ascents (ClimberID, ClimbID, AscentStyle, AscentDate, Flash)
VALUES (123, 1, 'Sport', '2020-05-23', 0),
(123, 2, 'Trad', '2021-06-14', 0),
(456, 3, 'Free-Solo', '2020-06-21', 1),
(589, 1, 'Sport', '2022-10-14', 0);

-- enable foreign key checks and commits
SET FOREIGN_KEY_CHECKS=1;
COMMIT;