CREATE DATABASE Hospitals;
USE Hospitals;
CREATE TABLE Department (
    id INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE
);
CREATE TABLE Staff (
    id INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    salary INT NOT NULL CHECK (salary >= 0),
    job VARCHAR(30) NOT NULL DEFAULT 'Helper',
    dept_id INT,
    email VARCHAR(50) UNIQUE,
    FOREIGN KEY (dept_id) REFERENCES Department(id)
);
INSERT INTO Department VALUES
(1, 'Heart'),
(2, 'Brain'),
(3, 'Dental'),
(4, 'Emergency');
INSERT INTO Staff
(id, name, salary, job, dept_id, email)
VALUES
(1, 'Kalia', 10000, 'Doctor', 1, 'kalia@gmail.com'),
(2, 'Reahan', 45000, 'Nurse', 2, 'reahan@gmail.com'),
(3, 'Ram', 30000, 'Doctor', 1, 'ram@gmail.com'),
(4, 'Sham', 65000, 'Nurse', 2, 'sham@gmail.com'),
(5, 'Ruchika', 20000, 'Helper', 3, 'ruchika@gmail.com'),
(6, 'Ritika', 50000, 'Doctor', 4, 'Ritika@gmail.com');
SELECT * FROM Staff
WHERE salary BETWEEN 25000 AND 50000;
SELECT * FROM Staff
WHERE name LIKE 'A%';
SELECT * FROM Staff
WHERE dept_id IN (1, 2);
SELECT DISTINCT job FROM Staff;
SELECT dept_id, COUNT(*) AS Total_Staff
FROM Staff
GROUP BY dept_id;
SELECT MAX(salary) AS Maximum_Salary,
       MIN(salary) AS Minimum_Salary
FROM Staff;
UPDATE Staff
SET salary = 32000
WHERE id = 1;
SELECT id AS Staff_ID,
       name AS Staff_Name,
       salary AS Staff_Salary,
       job AS Designation,
       dept_id AS Department_ID
FROM Staff;
