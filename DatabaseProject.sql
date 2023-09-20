-- Hospital Database Management System

-- creating database
CREATE DATABASE If NOT EXISTS hospitaldb;

-- using the database
USE hospitaldb;

-- creating hospital table
CREATE TABLE Hospital (
  hospital_id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  contact_number VARCHAR(20) NOT NULL
);

-- populating Hospital table with 1 hospital, you can add multiple tables
INSERT INTO Hospital (hospital_id, name, address, contact_number)
VALUES (1001, 'St. Mary Medical Center', '123 Main St', '555-567-1234');

-- view inserted data
SELECT * FROM Hospital;

-- creating Departments table
CREATE TABLE Departments (
   dept_id INT PRIMARY KEY,
   dept_name VARCHAR(50),
   hospital_id INT, FOREIGN KEY(hospital_id) REFERENCES Hospital(hospital_id)
);

-- populating Departments table
INSERT INTO Departments (dept_id, dept_name, hospital_id)
VALUES (1, 'Cardiology', 1001),
				(2, 'Orthopedics', 1001),
				(3, 'Pediatrics', 1001),
                (4, 'Oncology', 1001),
				(5, 'Family Medicine', 1001);

-- view inserted data in Departments table
SELECT * FROM Departments;

-- creating Doctors table
CREATE TABLE Doctors (
  doctor_id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  specialization VARCHAR(255) NOT NULL,
  contact_number VARCHAR(20) NOT NULL,
  salary INT,
  dept_id INT NOT NULL,
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id) ON DELETE CASCADE
);

-- populating Doctors table
INSERT INTO Doctors (doctor_id, name, specialization, contact_number, salary, dept_id)
VALUES
(1, 'Dr. John Smith', 'Cardiology(IP)', '678-555-1234',50000, 5),
(2, 'Dr. Sarah Lee', 'Pediatrics', '432-155-5678', 100000,3),
(3, 'Dr. Robert Johnson', 'Oncology', '505-255-9876', 300000,4),
(4, 'Dr. Maria Garcia', 'Family Medicine', '346-999-4321', 200000,5),
(5, 'Dr. Ram Patel', 'Cardiology', '432-345-6789', 300000,1),
(6, 'Dr. Michael Brown', 'Orthopedics', '832-234-1111',350000, 2),
(7, 'Dr. Elizabeth Clark', 'Pediatrics(IP)', '346-505-2222', 50000,3),
(8, 'Dr. Santona','Family Medicine','456788','475588',5);

-- view data from Doctors table
SELECT * FROM Doctors;

-- make change to the Doctors name
update Doctors
set name ='Dr. Shreya Subedi' where doctor_id = 8;

-- creating Patients table
CREATE TABLE Patients(
	patient_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    m_name VARCHAR(50),
    DOB DATE NOT NULL,
    sex CHAR(1) NOT NULL,
	address VARCHAR(255) NOT NULL,
	phone_number VARCHAR(20)
);

-- populating Patients table
INSERT INTO Patients(patient_id, first_name, last_name, m_name, DOB, sex, address, phone_number)
VALUES (1, 'John', 'Doe', 'Smith', '1980-01-15', 'M', '123 Main St', '832-415-1234'),
				(2, 'Jane', 'Smith', NULL, '1990-05-23', 'F', '456 Oak St', '505-717-5678'),
				(3, 'Mark', 'Johnson', NULL, '1975-09-10', 'M', '789 Elm St', '555-777-9012'),
                (4, 'Emily', 'Brown', 'Lynn', '1995-03-21', 'F', '567 Maple St', '555-888-3456'),
				(5, 'David', 'Lee', NULL, '1982-12-05', 'M', '789 Pine St', '410-986-7890'),
				(6, 'Sarah', 'Davis', NULL, '1978-08-15', 'F', '890 Cedar St', '346-443-2345'),
                (7, 'Rachel', 'Kim', 'Ji', '1992-05-15', 'F', '123 Oak St', '512-555-1111'),
				(8, 'John', 'Smith', 'Michael', '2022-10-10', 'M', '456 Maple St', '346-585-2222'),
				(9, 'Samantha', 'Jones', 'Marie', '1975-02-22', 'F', '789 Elm St', '456-455-3333'),
                (10, 'Jessica', 'Miller', 'Lynn', '1990-08-05', 'F', '111 Main St', '342-655-4444'),
				(11, 'David', 'Lee', 'Young', '1985-04-12', 'M', '222 Second St', '910-456-5555'),
				(12, 'Emily', 'Davis', 'Grace', '1988-12-20', 'F', '333 Third St', '610-984-1230'),
				(13, 'Andrew', 'Nguyen', 'Minh', '2023-01-30', 'M', '444 Fourth St', '832-913-3366'),
				(14, 'Julia', 'Brown', 'Anne', '1995-01-17', 'F', '555 Fifth St', '564-443-3435'),
                (15, 'Megan', 'Sanchez',NULL, '2022-12-20','F','2103 Third St','632-110-8382'),
                (16, 'Emma', 'Garcia', 'L', '2021-02-14', 'F', '123 Elm St, Spring, TX', '768-566-7756'),
                (17, 'Sarah', 'Smith', 'J', '1990-08-27', 'F', '789 Pine St, Humble, TX', '414-555-9012'),
                (18, 'David', 'Johnson', NULL, '1985-12-03', 'M', '345 Maple Ave, Memphis, TN', '111-555-3456');

-- view data in Patients table
SELECT * FROM Patients;

-- creating Nurse table
CREATE TABLE Nurses (
  nurse_id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  contact_number VARCHAR(20) NOT NULL,
  salary INT,
  dept_id INT NOT NULL,
  reports_to INT,
  FOREIGN KEY (reports_to) REFERENCES Doctors(doctor_id)
);

-- populating Nurses table
INSERT INTO Nurses (nurse_id, name, contact_number, salary, dept_id, reports_to)
VALUES (1, 'Paris Hill', '436-555-1234', 60000, 5, 1),
				(2, 'John Smith', '321-677-5678', 65000, 4, 3),
                (3, 'Sita Johnson', '342-555-9012', 70000, 1, 5),
                (4, 'Hannah Lee', '610-555-3456', 55000, 5, 4),
                (5, 'Karen Chen', '342-506-7890', 75000, 2, 6),
                (6, 'Hernika Brown', '410-585-2345', 55000, 3, 7);

-- viewing data in Nurses table
SELECT * FROM Nurses;

-- creating Procedures table
CREATE TABLE Procedures (
   proc_id INT PRIMARY KEY,
   proc_name VARCHAR(50),
   doctor_id INT,
   FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- populating Procedures table
INSERT INTO Procedures (proc_id, proc_name, doctor_id)
VALUES (1, 'Angiogram', 1),
				(2, 'Colonoscopy', 3),
				(3, 'MRI', 5),
				(4, 'Endoscopy', 3),
				(5, 'Echocardiogram', 5),
                (6, 'CT Scan', 7),
				(7, 'X-Ray', 1),
				(8, 'Laparoscopy', 4),
				(9, 'Biopsy', 3),
				(10, 'Physical Therapy', 2);

-- viewing data in Procedures table
SELECT * FROM Procedures;

-- This table maps patients to the doctors they are assigned to, and allows for a many-to-many relationship between patients and doctors.
CREATE TABLE Patients_Doctors (
    patient_id INT,
    doctor_id INT,
    PRIMARY KEY (patient_id, doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- populating the table
INSERT INTO Patients_Doctors(patient_id, doctor_id)
VALUES (1, 1),
       (1, 2),
       (2, 3),
       (2,4),
       (3,1),
       (3,5),
       (4,7),
       (5,6),
       (5,1),
       (6,4),
       (7,1),
       (8,7),
       (9,3),
       (10,3),
       (10,4),
       (11,1),
       (12,7),
       (13,7),
       (14,5),
       (15,1),
       (16,3),
       (17,3);

select * from Patients_Doctors;

-- checking the engine, character sets and collation
SHOW VARIABLES LIKE 'default_storage_engine';

SHOW VARIABLES LIKE 'character_set_database';

SHOW VARIABLES LIKE 'collation_database';


-- A list of patients name, id and their treating doctor's name and ids separated by comma, where multiple doctors may treat multiple patients and vice versa.
SELECT p.patient_id, p.first_name, p.last_name, p.m_name, p.DOB,p.sex, GROUP_CONCAT(d.doctor_id SEPARATOR ',') AS doctors_ids,
GROUP_CONCAT(d.name) AS doctor_names
FROM
Patients p
JOIN Patients_Doctors pd ON p.patient_id = pd.patient_id
JOIN Doctors d ON pd.doctor_id = d.doctor_id
GROUP BY
p.patient_id;

-- creating trigger
DELIMITER //
CREATE TRIGGER prevent_salary_reduction
BEFORE UPDATE ON doctors
FOR EACH ROW
BEGIN
   IF NEW.salary < OLD.salary THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = "Salary cannot be reduced!";
   END IF;
END //
DELIMITER ;

-- demonstrating above trigger
UPDATE doctors
set salary = 4000 where doctor_id = 1;

-- creating event
CREATE EVENT nurse_salary_increase
ON SCHEDULE
EVERY 6 MONTH
DO
UPDATE Nurses
SET salary = salary * 1.05
WHERE salary < 80000;

-- All the doctors who have performed the procedures along with the ones who have not.
SELECT
d.doctor_id, d.name AS doctor_name, GROUP_CONCAT(p.proc_name) AS procedure_names
FROM Doctors d LEFT JOIN Procedures p ON d.doctor_id = p.doctor_id
GROUP BY d.doctor_id;

-- Nurses that make more than the doctors they report to
SELECT T1.nurse_id, T1.name
FROM Nurses T1, Doctors T2
WHERE
T1.reports_to = T2.doctor_id AND T1.salary > T2.salary;

-- To retrieve the department with the highest number of patients
SELECT d.dept_name, COUNT(pd.patient_id) AS num_patients
FROM Departments d
JOIN Doctors doc ON d.dept_id = doc.dept_id
JOIN Patients_Doctors pd ON doc.doctor_id = pd.doctor_id
GROUP BY d.dept_name
ORDER BY num_patients DESC
LIMIT 1;

-- Retrieve all female patients
SELECT *
FROM Patients
WHERE sex LIKE 'F%';

-- The number of patients associated with the specific department, and the date of birth of the oldest patient associated with that department.
SELECT d.dept_name, COUNT(DISTINCT pd.patient_id) AS num_patients, MIN(p.DOB) AS oldest_patient_DOB
FROM Departments d
LEFT JOIN Doctors doc ON d.dept_id = doc.dept_id
LEFT JOIN Patients_Doctors pd ON doc.doctor_id = pd.doctor_id
LEFT JOIN Patients p ON pd.patient_id = p.patient_id
GROUP BY d.dept_name;

-- Retrieve the list of all departments along with the hospital they belong to and the number of doctors in each department:
SELECT Departments.dept_id, Departments.dept_name, Hospital.name AS hospital_name, COUNT(Doctors.doctor_id) AS num_doctors
FROM Departments
INNER JOIN Hospital ON Departments.hospital_id = Hospital.hospital_id
LEFT JOIN Doctors ON Departments.dept_id = Doctors.dept_id
GROUP BY Departments.dept_id;

-- Retrieve the list of all doctors along with their specialization, the department they belong to, and the hospital they work in
SELECT Doctors.doctor_id, Doctors.name, Doctors.specialization, Departments.dept_name, Hospital.name AS hospital_name
FROM Doctors
INNER JOIN Departments ON Doctors.dept_id = Departments.dept_id
INNER JOIN Hospital ON Departments.hospital_id = Hospital.hospital_id;

-- view for family_medicine patients
CREATE VIEW Family_Medicine_Patients AS
SELECT p.patient_id, p.first_name, p.last_name, p.DOB, p.sex, p.address, p.phone_number
FROM Patients p
JOIN Patients_Doctors pd ON p.patient_id = pd.patient_id
JOIN Doctors d ON pd.doctor_id = d.doctor_id
JOIN Departments dept ON d.dept_id = dept.dept_id
WHERE dept.dept_name = 'Family Medicine'
ORDER BY p.patient_id;

SELECT * FROM  Family_Medicine_Patients;

-- view for orthopedics patients
CREATE VIEW Orthopedics_Patients AS
SELECT p.patient_id, p.first_name, p.last_name, p.DOB, p.sex, p.address, p.phone_number
FROM Patients p
JOIN Patients_Doctors pd ON p.patient_id = pd.patient_id
JOIN Doctors d ON pd.doctor_id = d.doctor_id
JOIN Departments dept ON d.dept_id = dept.dept_id
WHERE dept.dept_name = 'Orthopedics'
ORDER BY p.patient_id;

SELECT * FROM Orthopedics_Patients;
