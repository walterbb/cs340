-- Create Customers table
CREATE TABLE Customers (
    CustomerID int NOT NULL AUTO_INCREMENT,
    CustomerName VARCHAR(50),
    AddressLine1 VARCHAR(50),
    AddressLine2 VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    PostalCode VARCHAR(50),
    YTDPurchases decimal(19,2),
    PRIMARY KEY (CustomerID)
);

-- Verify Customers table
SHOW TABLES;
DESCRIBE Customers;

-- Insert customers into table
INSERT INTO Customers (CustomerName, AddressLine1, City, State, PostalCode)
VALUES ('Bike World', '60025 Bollinger Canyon Road', 'San Ramon', 'California', '94583'),
('Metro Sports', '482505 Warm Springs Blvd.', 'Fremont', 'California', '94536'),
('Tursi Soccer', '8805 SW Canyon Ln', 'Portland', 'Oregon', '97225');

-- Select records
SELECT * FROM Customers;
SELECT CustomerID, CustomerName FROM Customers WHERE PostalCode = '94536';