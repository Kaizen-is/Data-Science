CREATE DATABASE University;
CREATE SCHEMA Academics;

CREATE TABLE Students (
	Students_id int primary key,
    Student_name varchar(100),
    Surname varchar(100),
    Birthdate date 
);

INSERT INTO Students ( Students_id, Student_name, Surname,  Birthdate)
VALUES 
(1, 'Alice', 'Johnson', '1998-02-14'),
(2, 'Bob', 'Smith', '1999-08-23'),
(3, 'Charlie', 'Brown', '2001-11-30'),
(4, 'David', 'Davis', '2000-06-17'),
(5, 'Eve', 'Miller', '1997-12-09'),
(6, 'Frank', 'Wilson', '1996-03-03'),
(7, 'Grace', 'Taylor', '2000-04-12'),
(8, 'Hank', 'Anderson', '1998-07-21'),
(9, 'Ivy', 'Thomas', '2001-10-11'),
(10, 'Jack', 'Jackson', '1999-05-17'),
(11, 'Kim', 'White', '2002-01-02'),
(12, 'Liam', 'Martin', '1997-09-26'),
(13, 'Mona', 'Lee', '1998-10-04'),
(14, 'Nathan', 'Walker', '1996-12-14'),
(15, 'Olivia', 'Harris', '2001-03-19');


