CREATE DATABASE HospitalManagement;
CREATE SCHEMA  PatientRecords;

CREATE TABLE Patients (
	patient_id int primary key,
    full_name varchar (100),
    gender varchar(100),
    dob date,
    phone varchar(15)
);    

INSERT INTO Patients (patient_id, full_name, gender, dob, phone)
VALUES 
(1, 'John Doe', 'Male', '1985-05-14', '123-456-7890'),
(2, 'Jane Smith', 'Female', '1992-08-23', '987-654-3210'),
(3, 'Alice Johnson', 'Female', '1978-02-10', '456-789-1234'),
(4, 'Bob Brown', 'Male', '1965-07-11', '321-654-9870'),
(5, 'Charlie Davis', 'Male', '1995-11-20', '789-123-4567'),
(6, 'Emily Wilson', 'Female', '1980-03-29', '654-987-3210'),
(7, 'Frank Moore', 'Male', '1990-06-05', '123-789-4560'),
(8, 'Grace Lee', 'Female', '2001-09-30', '555-123-7890'),
(9, 'Hank Clark', 'Male', '1972-01-15', '111-222-3333'),
(10, 'Ivy Martinez', 'Female', '1988-12-25', '444-555-6666'),
(11, 'Jack Rodriguez', 'Male', '1993-04-10', '999-888-7777'),
(12, 'Kimberly Perez', 'Female', '2000-02-14', '555-444-3333'),
(13, 'Liam White', 'Male', '1987-10-20', '333-222-1111'),
(14, 'Mona Harris', 'Female', '1999-01-18', '222-111-0000'),
(15, 'Nathan Green', 'Male', '1994-07-08', '777-666-5555');
