-- Create Customers table
CREATE OR REPLACE TABLE Customers (
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