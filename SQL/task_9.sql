CREATE DATABASE HRManagement;
CREATE SCHEMA Employees;

CREATE TABLE Staff (
	employee_id int primary key,
    first_name varchar(100),
    last_name varchar(100),
    position varchar(100),
    salary int
);    

INSERT INTO Staff(employee_id, first_name, last_name, position, salary)
VALUES 
(1, 'John', 'Doe', 'Manager', 75000),
(2, 'Jane', 'Smith', 'Assistant Manager', 60000),
(3, 'Michael', 'Brown', 'Developer', 55000),
(4, 'Emily', 'Johnson', 'Designer', 50000),
(5, 'David', 'Williams', 'HR Specialist', 45000),
(6, 'Olivia', 'Davis', 'Accountant', 48000),
(7, 'James', 'Miller', 'Marketing Specialist', 52000),
(8, 'Sophia', 'Wilson', 'Sales Executive', 40000),
(9, 'Daniel', 'Moore', 'Customer Support', 38000),
(10, 'Emma', 'Taylor', 'Project Manager', 65000),
(11, 'Lucas', 'Martinez', 'Team Lead', 70000),
(12, 'Liam', 'Harris', 'Software Engineer', 80000),
(13, 'Ava', 'Clark', 'Content Writer', 42000),
(14, 'Mason', 'Rodriguez', 'IT Specialist', 56000),
(15, 'Charlotte', 'Lewis', 'Operations Manager', 69000);