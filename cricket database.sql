CREATE DATABASE CricketDB;

USE CricketDB;

CREATE TABLE Cricket_Player (
    Player_ID INT PRIMARY KEY,
    Player_Name VARCHAR(50),
    Age INT,
    Country VARCHAR(30),
    Role VARCHAR(20),
    Matches INT,
    Runs INT,
    Wickets INT
);

INSERT INTO Cricket_Player
(Player_ID, Player_Name, Age, Country, Role, Matches, Runs, Wickets)
VALUES
(101, 'Virat Kohli', 37, 'India', 'Batsman', 292, 13848, 4),
(102, 'Rohit Sharma', 39, 'India', 'Batsman', 276, 11168, 9),
(103, 'Jasprit Bumrah', 32, 'India', 'Bowler', 120, 405, 203),
(104, 'Ravindra Jadeja', 37, 'India', 'All-rounder', 197, 2756, 220),
(105, 'Babar Azam', 31, 'Pakistan', 'Batsman', 260, 14000, 0),
(106, 'Ben Stokes', 35, 'England', 'All-rounder', 190, 6500, 300),
(107, 'Pat Cummins', 33, 'Australia', 'Bowler', 180, 1800, 270),
(108, 'Kane Williamson', 36, 'New Zealand', 'Batsman', 250, 12000, 30),
(109, 'Mitchell Starc', 36, 'Australia', 'Bowler', 190, 2200, 350),
(110, 'Shubman Gill', 27, 'India', 'Batsman', 150, 7000, 5);

SELECT * FROM Cricket_Player;