-- operations for climbers:

-- get all data for climbers page
SELECT * FROM Climbers;

-- add a new climber to climbers
INSERT INTO Climbers (ClimberName, ClimberDateOfBirth, ClimberNationality)
VALUES (:ClimberNameInput, :ClimberDateOfBirthInput, :ClimberNationalityInput);

-- delete a climber from climbers
DELETE FROM Climbers WHERE ClimberID = :ClimberIDFromDelete;

-- update a climber
UPDATE Climbers
SET ClimberName = :ClimberNameInput, ClimberDateOfBirth = :ClimberDateOfBirthInput, ClimberNationality = :ClimberNationalityInput 
WHERE ClimberID = :ClimberIDFromUpdate;

-- operations for countries:

-- get all the data for countries page
SELECT * FROM Countries;

-- add a new country
INSERT INTO Countries (CountryName)
VALUES (:CountryNameInput);

-- operations for locations:

-- get all the data for locations page
SELECT Locations.LocationID, Locations.LocationDescription, ST_AsText(Locations.Coordinates) AS Coordinates, Countries.CountryName
FROM Locations
JOIN Countries ON Locations.CountryIDn = Countries.CountryID;

-- get country id and name to populate country dropdown for new location
SELECT CountryID, CountryName FROM Countries;

-- add a new location
INSERT INTO Locations (LocationDescription, Coordinates, CountryID)
VALUES (:LocationDescriptionInput, ST_GeomFromText('POINT(:LongitudeInput :LatitudeInput)'), :CountryIDFromDropDown);


-- operations for climbs:

-- get all the data for climbs page
SELECT Climbs.ClimbID, Locations.LocationID, Locations.LocationDescription, Climbs.ClimbName, Climbs.ClimbDescription, Climbs.ClimbStyle, Climbs.Grade
FROM Climbs
JOIN Locations ON Climbs.LocationID = Locations.LocationID;

-- get location id and description to populate location dropdown for new climb
SELECT LocationID, LocationDescription FROM Locations;

-- add a new climb
INSERT INTO Climbs (LocationID, ClimbName, ClimbDescription, ClimbStyle, Grade)
VALUES (:LocationIDFromDropDown, :ClimbNameInput, :ClimbDescriptionInput, :ClimbStyleInput, :ClimbGradeInput);

-- operations for ascents:

-- get all the data for ascents page
SELECT Ascents.ClimberID, Ascents.ClimbID, Ascents.AscentStyle, Ascents.AscentDate, Ascents.Flash, Climbers.ClimberName, Climbs.ClimbName
FROM Ascents
JOIN Climbers ON Ascents.ClimberID = Climbers.ClimberID
JOIN Climbs ON Ascents.ClimbID = Climbs.ClimbID;

-- get climber id and name for climber dropdown for new ascent
SELECT ClimberID, ClimberName FROM Climbers;

-- get climb id and name for climb dropdown for new ascent
SELECT ClimbID, ClimbName FROM Climbs;

-- add a new ascent
INSERT INTO Ascents (ClimberID, ClimbID, AscentStyle, AscentDate, Flash)
VALUES (:ClimberIDFromDropDown, :ClimberIDFromDropDown, :AscentStyleInput, :AscentDateInput, :FlashInput);