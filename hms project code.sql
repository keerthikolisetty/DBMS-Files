/* =========================================================
   HOSPITAL MANAGEMENT SYSTEM - DBMS PROJECT
   ========================================================= */
/* 1. CREATE DATABASE */
CREATE DATABASE Hospital_Management;
USE Hospital_Management;
/* =========================================================
   2. DDL - CREATE TABLES
   ========================================================= */
/* DEPARTMENT */
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50)
);

/* DOCTOR */
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(50),
    phone VARCHAR(15) UNIQUE,
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Department(department_id)
);

/* PATIENT */
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    age INT CHECK (age >= 0),
    phone VARCHAR(15) UNIQUE,
    address VARCHAR(150)
);

/* ROOM */
CREATE TABLE Room (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(30) NOT NULL,
    room_charge DECIMAL(10,2) CHECK (room_charge >= 0),
    room_status VARCHAR(20) DEFAULT 'Available'
);

/* MEDICINE */
CREATE TABLE Medicine (
    medicine_id INT PRIMARY KEY,
    medicine_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) CHECK (price >= 0),
    stock INT CHECK (stock >= 0)
);

/* APPOINTMENT */
CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME,
    status VARCHAR(20) DEFAULT 'Scheduled',

    FOREIGN KEY (patient_id)
        REFERENCES Patient(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES Doctor(doctor_id)
);

/* ADMISSION */
CREATE TABLE Admission (
    admission_id INT PRIMARY KEY,
    patient_id INT NOT NULL,
    room_id INT NOT NULL,
    admission_date DATE NOT NULL,
    discharge_date DATE,

    FOREIGN KEY (patient_id)
        REFERENCES Patient(patient_id),

    FOREIGN KEY (room_id)
        REFERENCES Room(room_id)
);

/* MEDICAL RECORD */
CREATE TABLE Medical_Record (
    record_id INT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    diagnosis VARCHAR(150),
    treatment VARCHAR(200),
    record_date DATE,

    FOREIGN KEY (patient_id)
        REFERENCES Patient(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES Doctor(doctor_id)
);

/* BILL */
CREATE TABLE Bill (
    bill_id INT PRIMARY KEY,
    patient_id INT NOT NULL,
    bill_date DATE,
    amount DECIMAL(10,2) CHECK (amount >= 0),
    payment_status VARCHAR(20) DEFAULT 'Pending',

    FOREIGN KEY (patient_id)
        REFERENCES Patient(patient_id)
);


/* =========================================================
   3. DML - INSERT DATA
   ========================================================= */

INSERT INTO Department VALUES
(1, 'Cardiology', 'Block A'),
(2, 'Neurology', 'Block B'),
(3, 'Orthopedics', 'Block C'),
(4, 'Pediatrics', 'Block D');

INSERT INTO Doctor VALUES
(101, 'Dr. Ravi', 'Cardiologist', '9876543210', 1),
(102, 'Dr. Priya', 'Neurologist', '9876543211', 2),
(103, 'Dr. Kumar', 'Orthopedic', '9876543212', 3),
(104, 'Dr. Anitha', 'Pediatrician', '9876543213', 4);

INSERT INTO Patient VALUES
(201, 'Keerthi', 'Female', 20, '9000000001', 'Rajahmundry'),
(202, 'Rahul', 'Male', 35, '9000000002', 'Kakinada'),
(203, 'Sneha', 'Female', 28, '9000000003', 'Vijayawada'),
(204, 'Arjun', 'Male', 45, '9000000004', 'Guntur');

INSERT INTO Room VALUES
(301, 'General', 1000, 'Available'),
(302, 'Private', 3000, 'Occupied'),
(303, 'ICU', 5000, 'Occupied'),
(304, 'General', 1000, 'Available');

INSERT INTO Medicine VALUES
(401, 'Paracetamol', 20, 100),
(402, 'Amoxicillin', 50, 80),
(403, 'Ibuprofen', 30, 60),
(404, 'Azithromycin', 70, 40);

INSERT INTO Appointment VALUES
(501, 201, 101, '2026-09-28', '10:00:00', 'Scheduled'),
(502, 202, 102, '2026-09-28', '11:00:00', 'Completed'),
(503, 203, 103, '2026-09-29', '12:00:00', 'Scheduled'),
(504, 204, 101, '2026-09-30', '10:30:00', 'Scheduled');

INSERT INTO Admission VALUES
(601, 201, 302, '2026-09-20', NULL),
(602, 202, 303, '2026-09-21', NULL),
(603, 203, 301, '2026-09-22', '2026-09-25');

INSERT INTO Medical_Record VALUES
(701, 201, 101, 'Heart Problem', 'ECG and Medication', '2026-09-20'),
(702, 202, 102, 'Migraine', 'Medication', '2026-09-21'),
(703, 203, 103, 'Fracture', 'Physiotherapy', '2026-09-22');

INSERT INTO Bill VALUES
(801, 201, '2026-09-25', 15000, 'Paid'),
(802, 202, '2026-09-26', 25000, 'Pending'),
(803, 203, '2026-09-26', 8000, 'Paid');


/* =========================================================
   4. DQL - SELECT QUERIES
   ========================================================= */

SELECT * FROM Patient;

SELECT * FROM Doctor;

SELECT * FROM Department;

SELECT patient_name, age
FROM Patient
WHERE age > 25;

SELECT *
FROM Patient
ORDER BY age DESC;

SELECT COUNT(*) AS Total_Patients
FROM Patient;

SELECT AVG(amount) AS Average_Bill
FROM Bill;

SELECT MAX(amount) AS Maximum_Bill
FROM Bill;

SELECT MIN(amount) AS Minimum_Bill
FROM Bill;

SELECT SUM(amount) AS Total_Billing
FROM Bill;
/* =========================================================
   5. UPDATE - DML
   ========================================================= */

UPDATE Patient
SET address = 'Hyderabad'
WHERE patient_id = 201;

UPDATE Bill
SET payment_status = 'Paid'
WHERE bill_id = 802;

/* =========================================================
   6. DELETE - DML
   ========================================================= */

DELETE FROM Patient
WHERE patient_id = 204;
/* =========================================================
   7. JOINS
   ========================================================= */

/* INNER JOIN - Patient and Appointment */
SELECT
    p.patient_name,
    a.appointment_date,
    a.status
FROM Patient p
INNER JOIN Appointment a
ON p.patient_id = a.patient_id;


/* INNER JOIN - Doctor and Department */
SELECT
    d.doctor_name,
    d.specialization,
    dep.department_name
FROM Doctor d
INNER JOIN Department dep
ON d.department_id = dep.department_id;


/* THREE TABLE JOIN */
SELECT
    p.patient_name,
    d.doctor_name,
    dep.department_name
FROM Patient p
JOIN Appointment a
ON p.patient_id = a.patient_id
JOIN Doctor d
ON a.doctor_id = d.doctor_id
JOIN Department dep
ON d.department_id = dep.department_id;


/* LEFT JOIN */
SELECT
    p.patient_name,
    b.amount
FROM Patient p
LEFT JOIN Bill b
ON p.patient_id = b.patient_id;


/* RIGHT JOIN */
SELECT
    d.doctor_name,
    dep.department_name
FROM Doctor d
RIGHT JOIN Department dep
ON d.department_id = dep.department_id;

/* =========================================================
   8. SUBQUERIES
   ========================================================= */

/* Patients whose age is greater than average age */
SELECT patient_name, age
FROM Patient
WHERE age > (
    SELECT AVG(age)
    FROM Patient
);

/* Patient having maximum bill */
SELECT patient_name
FROM Patient
WHERE patient_id = (
    SELECT patient_id
    FROM Bill
    WHERE amount = (
        SELECT MAX(amount)
        FROM Bill
    )
);

/* Doctors working in Cardiology */
SELECT doctor_name
FROM Doctor
WHERE department_id = (
    SELECT department_id
    FROM Department
    WHERE department_name = 'Cardiology'
);

/* Patients having a bill greater than 10000 */
SELECT patient_name
FROM Patient
WHERE patient_id IN (
    SELECT patient_id
    FROM Bill
    WHERE amount > 10000
);


/* =========================================================
   9. AGGREGATE + GROUP BY
   ========================================================= */

SELECT payment_status, COUNT(*) AS Total_Bills
FROM Bill
GROUP BY payment_status;

SELECT doctor_id, COUNT(*) AS Total_Appointments
FROM Appointment
GROUP BY doctor_id;

SELECT room_type, AVG(room_charge) AS Average_Charge
FROM Room
GROUP BY room_type;

/* =========================================================
   10. CONSTRAINTS
   ========================================================= */
/*
PRIMARY KEY  -> Uniquely identifies each record
FOREIGN KEY  -> Maintains relationship between tables
NOT NULL     -> Prevents empty values
UNIQUE       -> Prevents duplicate values
CHECK        -> Validates values
DEFAULT      -> Provides default value
*/
CREATE DATABASE Hospital_Constraints;
USE Hospital_Constraints;


CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50)
);

CREATE TABLE Patient (
    patient_id INT,
    patient_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15),
    address VARCHAR(100)
);
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    department_id INT,

    FOREIGN KEY (department_id)
        REFERENCES Department(department_id)
);

CREATE TABLE Room (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(30) NOT NULL,
    room_charge DECIMAL(10,2) CHECK (room_charge >= 0),
    room_status VARCHAR(20) DEFAULT 'Available'
);
CREATE TABLE Appointment (
    appointment_id INT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(20)
);
CREATE TABLE Bill (
    bill_id INT,
    patient_id INT,
    bill_date DATE,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20)
);

/* ============================================
   INSERT DATA
   ============================================ */
INSERT INTO Department
VALUES
(1, 'Cardiology', 'Block A'),
(2, 'Neurology', 'Block B'),
(3, 'Orthopedics', 'Block C');
INSERT INTO Patient VALUES
(201, 'Keerthi', 20, 'Female', '9000000001', 'Rajahmundry'),
(202, 'Rahul', 35, 'Male', '9000000002', 'Kakinada'),
(203, 'Sneha', 28, 'Female', '9000000003', 'Vijayawada'),
(204, 'Arjun', 45, 'Male', '9000000004', 'Guntur');
INSERT INTO Doctor
VALUES
(101, 'Dr. Ravi', 'Cardiologist', '9876543210', 1),
(102, 'Dr. Priya', 'Neurologist', '9876543211', 2),
(103, 'Dr. Kumar', 'Orthopedic', '9876543212', 3);
INSERT INTO Room
VALUES
(301, 'General', 1000, 'Available'),
(302, 'Private', 3000, 'Occupied'),
(303, 'ICU', 5000, 'Occupied');
INSERT INTO Appointment VALUES
(501, 201, 101, '2026-09-28', '10:00:00', 'Scheduled'),
(502, 202, 102, '2026-09-28', '11:00:00', 'Completed'),
(503, 203, 103, '2026-09-29', '12:00:00', 'Scheduled'),
(504, 204, 101, '2026-09-30', '10:30:00', 'Scheduled');
INSERT INTO Bill VALUES
(801, 201, '2026-09-25', 15000, 'Paid'),
(802, 202, '2026-09-26', 25000, 'Pending'),
(803, 203, '2026-09-26', 8000, 'Paid');

/* ============================================
   DISPLAY TABLES
   ============================================ */

SELECT * FROM Department;
SELECT * FROM Patient;
SELECT * FROM Doctor;
SELECT * FROM Room;
SELECT * FROM Appointment;
SELECT * FROM Bill;
/* =========================================================
   11. DATA INTEGRITY
   ========================================================= */
CREATE DATABASE Hospital_Integrity;
USE Hospital_Integrity;
/* Entity Integrity
   Primary keys cannot be NULL or duplicated.
*/
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    age INT
);
/* Referential Integrity
   Foreign keys must refer to existing records.
*/
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100)
);
CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,

    FOREIGN KEY (patient_id)
        REFERENCES Patient(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES Doctor(doctor_id)
);
/* Domain Integrity
   CHECK constraints control valid values.
*/
CREATE TABLE Bill (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    amount DECIMAL(10,2) CHECK (amount >= 0),
    payment_status VARCHAR(20)
);


INSERT INTO Patient
VALUES
(201, 'Keerthi', 20),
(202, 'Rahul', 35),
(203, 'Sneha', 28);
INSERT INTO Doctor
VALUES
(101, 'Dr. Ravi'),
(102, 'Dr. Priya');
INSERT INTO Appointment
VALUES
(501, 201, 101, '2026-09-28'),
(502, 202, 102, '2026-09-29');
INSERT INTO Bill
VALUES
(801, 201, 15000, 'Paid'),
(802, 202, 25000, 'Pending');
/* =========================================
   DISPLAY DATA
   ========================================= */

SELECT * FROM Patient;
SELECT * FROM Doctor;
SELECT * FROM Appointment;
SELECT * FROM Bill;
/* =========================================================
   12. RELATIONSHIPS
   ========================================================= */

/*
Department 1 ---- N Doctor
Patient    1 ---- N Appointment
Doctor     1 ---- N Appointment
Patient    1 ---- N Admission
Room       1 ---- N Admission
Patient    1 ---- N Medical_Record
Doctor     1 ---- N Medical_Record
Patient    1 ---- N Bill
*/


/* =========================================================
   13. VIEW
   ========================================================= */

CREATE VIEW Patient_Bill_View AS
SELECT
    p.patient_id,
    p.patient_name,
    b.amount,
    b.payment_status
FROM Patient p
JOIN Bill b
ON p.patient_id = b.patient_id;

SELECT * FROM Patient_Bill_View;


/* =========================================================
   14. NORMALIZATION
   ========================================================= */
USE Hospital_Management;

/* =====================================================
   NORMALIZATION - HOSPITAL MANAGEMENT SYSTEM
   ===================================================== */

/* UNNORMALIZED TABLE (UNF)
   Multiple patient, doctor and medicine details
   can exist in one table.
*/

CREATE TABLE Hospital_UNF (
    patient_id INT,
    patient_name VARCHAR(100),
    doctor_name VARCHAR(100),
    department_name VARCHAR(50),
    medicines VARCHAR(200),
    diagnosis VARCHAR(100),
    bill_amount DECIMAL(10,2)
);

/* =====================================================
   1NF - FIRST NORMAL FORM
   =====================================================
   Rule:
   - Each column contains atomic values.
   - No multiple values in a single column.
*/

CREATE TABLE Hospital_1NF (
    patient_id INT,
    patient_name VARCHAR(100),
    doctor_name VARCHAR(100),
    department_name VARCHAR(50),
    medicine_name VARCHAR(100),
    diagnosis VARCHAR(100),
    bill_amount DECIMAL(10,2)
);

/* =====================================================
   2NF - SECOND NORMAL FORM
   =====================================================
   Rule:
   - Must be in 1NF.
   - Remove partial dependencies.
   
   We separate Patient, Doctor and Medicine information.
*/

CREATE TABLE Patient_2NF (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    phone VARCHAR(15)
);

CREATE TABLE Doctor_2NF (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(50),
    department_id INT
);

CREATE TABLE Medicine_2NF (
    medicine_id INT PRIMARY KEY,
    medicine_name VARCHAR(100),
    price DECIMAL(10,2)
);

/* =====================================================
   3NF - THIRD NORMAL FORM
   =====================================================
   Rule:
   - Must be in 2NF.
   - Remove transitive dependencies.
   
   Department information is separated from Doctor.
*/
CREATE TABLE Department_3NF (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    location VARCHAR(50)
);
CREATE TABLE Doctor_3NF (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(50),
    department_id INT,

    FOREIGN KEY (department_id)
    REFERENCES Department_3NF(department_id)
);
/* Patient table */
CREATE TABLE Patient_3NF (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    age INT,
    phone VARCHAR(15) UNIQUE
);
/* Appointment table */
CREATE TABLE Appointment_3NF (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(20),

    FOREIGN KEY (patient_id)
    REFERENCES Patient_3NF(patient_id),

    FOREIGN KEY (doctor_id)
    REFERENCES Doctor_3NF(doctor_id)
);
/* Bill table */
CREATE TABLE Bill_3NF (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),

    FOREIGN KEY (patient_id)
    REFERENCES Patient_3NF(patient_id)
);
/* =====================================================
   INSERT SAMPLE DATA
   ===================================================== */

INSERT INTO Department_3NF
VALUES
(1, 'Cardiology', 'Block A'),
(2, 'Neurology', 'Block B'),
(3, 'Orthopedics', 'Block C');
INSERT INTO Doctor_3NF
VALUES
(101, 'Dr. Ravi', 'Cardiologist', 1),
(102, 'Dr. Priya', 'Neurologist', 2),
(103, 'Dr. Kumar', 'Orthopedic', 3);
INSERT INTO Patient_3NF
VALUES
(201, 'Keerthi', 'Female', 20, '9000000001'),
(202, 'Rahul', 'Male', 35, '9000000002'),
(203, 'Sneha', 'Female', 28, '9000000003');
INSERT INTO Appointment_3NF
VALUES
(501, 201, 101, '2026-09-28', 'Scheduled'),
(502, 202, 102, '2026-09-28', 'Completed'),
(503, 203, 103, '2026-09-29', 'Scheduled');
INSERT INTO Bill_3NF
VALUES
(801, 201, 15000, 'Paid'),
(802, 202, 25000, 'Pending'),
(803, 203, 8000, 'Paid');

/* =====================================================
   DISPLAY NORMALIZED TABLES
   ===================================================== */
SELECT * FROM Department_3NF;
SELECT * FROM Doctor_3NF;
SELECT * FROM Patient_3NF;
SELECT * FROM Appointment_3NF;
SELECT * FROM Bill_3NF;
/* =====================================================
   JOIN AFTER NORMALIZATION
   ===================================================== */
SELECT
    p.patient_name,
    d.doctor_name,
    dep.department_name,
    a.appointment_date,
    a.status
FROM Patient_3NF p
JOIN Appointment_3NF a
    ON p.patient_id = a.patient_id
JOIN Doctor_3NF d
    ON a.doctor_id = d.doctor_id
JOIN Department_3NF dep
    ON d.department_id = dep.department_id;
    
/* =========================================================
   15. TRANSACTION - ACID PROPERTIES
   ========================================================= */
/* ATOMICITY */
START TRANSACTION;
UPDATE Room
SET room_status = 'Occupied'
WHERE room_id = 301;
UPDATE Patient
SET address = 'Hyderabad'
WHERE patient_id = 203;
COMMIT;
/* ROLLBACK EXAMPLE */
START TRANSACTION;
UPDATE Bill
SET amount = 50000
WHERE bill_id = 801;
ROLLBACK;
/* CONSISTENCY
   Constraints maintain valid database states.
*/
/* ISOLATION */
SET TRANSACTION ISOLATION LEVEL
READ COMMITTED;
/* DURABILITY
   COMMIT permanently saves the transaction.
*/
START TRANSACTION;
UPDATE Bill
SET payment_status = 'Paid'
WHERE bill_id = 803;
COMMIT;
/* =========================================================
   16. ALTER TABLE - DDL
   ========================================================= */
ALTER TABLE Patient
ADD email VARCHAR(100);
/* =========================================================
   17. DROP / TRUNCATE EXAMPLES
   ========================================================= */
TRUNCATE TABLE Patient;
DROP TABLE Patient;
DROP DATABASE Hospital_Management;
/* =========================================================
   18. FINAL DISPLAY
   ========================================================= */
SELECT * FROM Department;
SELECT * FROM Doctor;
SELECT * FROM Patient;
SELECT * FROM Room;
SELECT * FROM Medicine;
SELECT * FROM Appointment;
SELECT * FROM Admission;
SELECT * FROM Medical_Record;
SELECT * FROM Bill;
/* =========================================================
   END OF HOSPITAL MANAGEMENT SYSTEM
   ========================================================= */ 