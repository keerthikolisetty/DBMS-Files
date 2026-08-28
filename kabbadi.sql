CREATE DATABASE KabaddiDB;

USE KabaddiDB;

CREATE TABLE Kabaddi_Player (
    Player_ID INT PRIMARY KEY,
    Player_Name VARCHAR(30),
    Age INT,
    Country VARCHAR(20),
    Role VARCHAR(20),
    Matches INT,
    Points INT,
    Tackles INT
);

INSERT INTO Kabaddi_Player VALUES
(1, 'Pardeep', 28, 'India', 'Raider', 40, 250, 10),
(2, 'Naveen', 25, 'India', 'Raider', 35, 220, 8),
(3, 'Fazel', 32, 'Iran', 'Defender', 45, 80, 70),
(4, 'Manjeet', 27, 'India', 'Raider', 30, 180, 12),
(5, 'Sombir', 29, 'India', 'Defender', 38, 60, 65),
(6, 'Mohammad', 30, 'Iran', 'All-rounder', 42, 150, 40);

SELECT * FROM Kabaddi_Player;