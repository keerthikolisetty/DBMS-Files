-- Create Database
CREATE DATABASE PharmacyDB;
USE PharmacyDB;

-- Create Medicine Table
CREATE TABLE Medicine (
    Med_ID INT PRIMARY KEY,
    Med_Name VARCHAR(50),
    Company VARCHAR(50),
    Price DECIMAL(6,2),
    Stock INT
);

-- Insert Records
INSERT INTO Medicine VALUES
(101, 'Paracetamol', 'Cipla', 25.50, 100),
(102, 'Amoxicillin', 'Sun Pharma', 85.00, 50),
(103, 'Vitamin C', 'Dr. Reddy', 120.00, 80);

-- Display All Medicines
SELECT * FROM Medicine;

-- Display Medicines with Price > 50
SELECT * FROM Medicine
WHERE Price > 50;

-- Update Stock
UPDATE Medicine
SET Stock = 90
WHERE Med_ID = 101;

-- Delete a Record
DELETE FROM Medicine
WHERE Med_ID = 103;

-- Count Total Medicines
SELECT COUNT(*) AS Total_Medicines
FROM Medicine;

-- Sort Medicines by Price
SELECT * FROM Medicine
ORDER BY Price DESC;