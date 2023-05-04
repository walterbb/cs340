-- disable foreign key checks and commits
SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT = 0;

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
    Coordinates point NOT NULL,
    PRIMARY KEY (LocationID),
    FOREIGN KEY (CountryID) REFERENCES Countries (CountryID)
)

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

-- enable foreign key checks and commits
SET FOREIGN_KEY_CHECKS=1;
COMMIT;