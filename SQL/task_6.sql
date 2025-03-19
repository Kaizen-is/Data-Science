CREATE DATABASE HotelBooking;
CREATE SCHEMA  Reservations;

CREATE TABLE Guests (
	guest_id int primary key,
    first_name varchar (100),
	last_name varchar (100),
    check_in date,  
    check_out date
);    

INSERT INTO Guests (guest_id, first_name, last_name, check_in, check_out)
VALUES
(1, 'John', 'Doe', '2023-05-01', '2023-05-05'),
(2, 'Jane', 'Smith', '2023-06-15', '2023-06-18'),
(3, 'Emily', 'Johnson', '2023-07-20', '2023-07-25'),
(4, 'Michael', 'Brown', '2023-08-01', '2023-08-07'),
(5, 'Sarah', 'Davis', '2023-09-10', '2023-09-14'),
(6, 'David', 'Miller', '2023-05-12', '2023-05-16'),
(7, 'Alice', 'Wilson', '2023-07-05', '2023-07-10'),
(8, 'Tom', 'Moore', '2023-06-03', '2023-06-06'),
(9, 'Sophia', 'Taylor', '2023-08-20', '2023-08-25'),
(10, 'Daniel', 'Anderson', '2023-10-01', '2023-10-05'),
(11, 'Olivia', 'Thomas', '2023-09-25', '2023-09-30'),
(12, 'James', 'Jackson', '2023-06-25', '2023-06-30'),
(13, 'Grace', 'White', '2023-08-10', '2023-08-15'),
(14, 'Liam', 'Harris', '2023-07-15', '2023-07-20'),
(15, 'Charlotte', 'Clark', '2023-05-18', '2023-05-22');