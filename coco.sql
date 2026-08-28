CREATE DATABASE COCO_DB;

USE COCO_DB;

CREATE TABLE COCO_Objects (
    Object_ID INT PRIMARY KEY,
    Object_Name VARCHAR(30),
    Category VARCHAR(20),
    Image_Count INT,
    Area INT
);

INSERT INTO COCO_Objects VALUES
(1, 'Person', 'Human', 100, 500),
(2, 'Car', 'Vehicle', 80, 400),
(3, 'Dog', 'Animal', 60, 300),
(4, 'Cat', 'Animal', 50, 250),
(5, 'Chair', 'Furniture', 70, 200),
(6, 'Bicycle', 'Vehicle', 40, 350);

SELECT * FROM COCO_Objects;