CREATE DATABASE university;
USE university;

CREATE TABLE student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50)
);

INSERT INTO student (name, age, course)
VALUES
('keerthi', 20, 'AIML'),
('kusuma', 18, 'AIML');

SELECT * FROM student;

ALTER TABLE student
ADD email VARCHAR(100);

ALTER TABLE student
MODIFY age SMALLINT;

ALTER TABLE student
ADD dob DATE;

INSERT INTO student (name, age, course, email)
VALUES
('keerthi kusuma', 19, 'AIML', 'kirrukusu@gmail.com');

UPDATE student
SET email = 'kirrukusu@gmail.com'
WHERE id = 5;

INSERT INTO student (name, age, course)
VALUES
('kusuma', 18, 'AIML');

SELECT * FROM student;
