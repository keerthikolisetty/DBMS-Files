CREATE DATABASE VolleyballDB;

USE VolleyballDB;

CREATE TABLE Volleyball_Player (
    Player_ID INT PRIMARY KEY,
    Player_Name VARCHAR(30),
    Age INT,
    Country VARCHAR(20),
    Position VARCHAR(20),
    Matches INT,
    Points INT,
    Aces INT
);

INSERT INTO Volleyball_Player VALUES
(1, 'Arjun', 22, 'India', 'Spiker', 20, 120, 15),
(2, 'Rahul', 24, 'India', 'Setter', 18, 80, 10),
(3, 'Aman', 23, 'India', 'Libero', 22, 60, 5),
(4, 'Ali', 25, 'Iran', 'Spiker', 25, 150, 20),
(5, 'John', 26, 'USA', 'Blocker', 21, 100, 12),
(6, 'David', 24, 'Brazil', 'Spiker', 19, 130, 18);

SELECT * FROM Volleyball_Player;