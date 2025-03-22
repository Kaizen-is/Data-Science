DROP DATABASE IF EXISTS Univesity; 
GO

Create Database University;
GO

USE University;
GO

Create Schema Academics;
GO

Create Table Students(
    student_id int primary key,
	s_name nvarchar(100) not null,
	surname nvarchar(100) not null,
	birthdate date not null,
	faculty nvarchar(100) not null
	);

INSERT INTO Students(student_id, s_name, surname, birthdate, faculty)
VALUES
(1, 'Ali', 'Karimov', '2002-03-12', 'Computer Science'),
(2, 'Madina', 'Ismailova', '2003-07-25', 'Mathematics'),
(3, 'John', 'Doe', '2001-11-05', 'Engineering'),
(4, 'Sara', 'Smith', '2000-02-18', 'Business Administration'),
(5, 'David', 'Brown', '1999-09-30', 'Law'),
(6, 'Emma', 'Johnson', '2002-12-10', 'Medicine'),
(7, 'Liam', 'Williams', '2001-05-22', 'Physics'),
(8, 'Olivia', 'Martinez', '2003-06-15', 'Chemistry'),
(9, 'Noah', 'Taylor', '2000-08-27', 'History'),
(10, 'Ava', 'Anderson', '2002-04-03', 'Architecture'),
(11, 'Sophia', 'Thomas', '2001-01-14', 'Psychology'),
(12, 'James', 'Harris', '1999-10-07', 'Economics'),
(13, 'Isabella', 'White', '2003-09-09', 'Philosophy'),
(14, 'Lucas', 'Moore', '2000-07-11', 'Political Science'),
(15, 'Mia', 'Clark', '2002-02-25', 'Linguistics')





create database Bookstore;
go
use Bookstore;
go
create schema Sales;
go
create table Sales.Books(
    book_id int primary key,
	title nvarchar(50) not null,
	author nvarchar(100) not null,
	price float not null,
	quantity int null
);

INSERT INTO Sales.Books ( book_id, title, author, price, quantity )
VALUES 
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 10.99, 30),
(2, '1984', 'George Orwell', 8.99, 50),
(3, 'To Kill a Mockingbird', 'Harper Lee', 12.49, 40),
(4, 'Pride and Prejudice', 'Jane Austen', 6.99, 20),
(5, 'The Catcher in the Rye', 'J.D. Salinger', 9.99, 35),
(6, 'Moby Dick', 'Herman Melville', 14.99, 25),
(7, 'War and Peace', 'Leo Tolstoy', 18.99, 15),
(8, 'The Odyssey', 'Homer', 7.49, 40),
(9, 'Crime and Punishment', 'Fyodor Dostoevsky', 11.49, 20),
(10, 'The Hobbit', 'J.R.R. Tolkien', 13.99, 50),
(11, 'Brave New World', 'Aldous Huxley', 10.49, 30),
(12, 'The Brothers Karamazov', 'Fyodor Dostoevsky', 16.99, 10),
(13, 'Frankenstein', 'Mary Shelley', 5.99, 45),
(14, 'Don Quixote', 'Miguel de Cervantes', 19.99, 18),
(15, 'Dracula', 'Bram Stoker', 9.49, 60);




create database OnlineShop;
go
use OnlineShop;
go
create schema Products;
go
create table Products.Items(
    item_id int primary key,
	item_name nvarchar(50) not null,
	category nvarchar(50) not null, 
	price float not null,
	stock int not null
);

INSERT INTO Products.Items(item_id, item_name, category, price, stock)
VALUES
(1, 'Dishwasher', 'Kitchen', 499.99, 15),
(2, 'Blender', 'Kitchen', 89.99, 30),
(3, 'Microwave Oven', 'Kitchen', 149.99, 25),
(4, 'Air Purifier', 'Home', 120.50, 20),
(5, 'Vacuum Cleaner', 'Home', 199.99, 35),
(6, 'Refrigerator', 'Kitchen', 799.99, 10),
(7, 'Garden Hose', 'Garden', 29.99, 40),
(8, 'Lawn Mower', 'Garden', 199.99, 12),
(9, 'Outdoor Furniture Set', 'Garden', 350.00, 8),
(10, 'Coffee Maker', 'Kitchen', 59.99, 45),
(11, 'Garden Shovel', 'Garden', 15.49, 50),
(12, 'Cookware Set', 'Kitchen', 159.99, 20),
(13, 'Sofa', 'Home', 599.99, 18),
(14, 'Patio Umbrella', 'Garden', 99.99, 25),
(15, 'Wall Clock', 'Home', 29.99, 40);




create database BankSystem;
go
use BankSystem;
go
create schema Transactions;
go 
create table Transactions.Accounts(
    account_id int primary key,
	holder_name varchar(100) not null,
	balance float not null,
	currency nvarchar(50) not null,
	created_date date not null
);

INSERT INTO Transactions.Accounts(account_id, holder_name, balance, currency, created_date)
VALUES 
(1, 'John Doe', 1500.50, 'USD', '2023-01-15'),
(2, 'Jane Smith', 2000.75, 'EUR', '2022-11-20'),
(3, 'Alice Brown', 12000.00, 'GBP', '2021-07-30'),
(4, 'Bob Johnson', 500.25, 'USD', '2023-03-10'),
(5, 'Charlie Williams', 3200.80, 'AUD', '2022-12-05'),
(6, 'David Lee', 1800.00, 'CAD', '2021-06-22'),
(7, 'Emily Wilson', 3500.40, 'USD', '2022-09-17'),
(8, 'Frank Moore', 5000.90, 'EUR', '2020-02-18'),
(9, 'Grace Taylor', 800.50, 'USD', '2023-01-05'),
(10, 'Hank Davis', 9500.00, 'GBP', '2021-08-09'),
(11, 'Ivy Martinez', 2200.30, 'CAD', '2022-04-25'),
(12, 'Jack Clark', 7000.00, 'USD', '2023-02-14'),
(13, 'Kimberly Rodriguez', 1200.60, 'AUD', '2022-10-30'),
(14, 'Liam Gonzalez', 4500.75, 'EUR', '2021-11-12'),
(15, 'Mona Anderson', 11000.00, 'GBP', '2022-08-05');



create database HospitalManagement;
go
use HospitalManagement;
go
create schema  PatientRecords;
go
create table  PatientRecords.Patients(
    patient_id int primary key,
	full_name nvarchar(50) not null,
	gender varchar(50) null,
	dob date null,
	phone varchar(15)
);
INSERT INTO PatientRecords.Patients (patient_id, full_name, gender, dob, phone)
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



create database HotelBooking;
go
use HotelBooking;
go
create schema Reservations
go 
create table Reservations.Guests(
    guest_id int primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	check_in date not null,
	check_out date not null
);
INSERT INTO Reservations.Guests (guest_id, first_name, last_name, check_in, check_out)
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



create database CinemaBooking;
go
use CinemaBooking;
go
create schema Schedules;
go
create table Schedules.Movies(
    movie_id int primary key,
	movie_name varchar(50),
	genre varchar(50),
	duration time,
	rating float
);
INSERT INTO Schedules.Movies(movie_id, movie_name, genre, duration, rating)
VALUES  
(1, 'The Shawshank Redemption', 'Drama', 142, 9.3),
(2, 'The Dark Knight', 'Action', 152, 9.0),
(3, 'Inception', 'Sci-Fi', 148, 8.8),
(4, 'Forrest Gump', 'Drama', 142, 8.8),
(5, 'The Matrix', 'Sci-Fi', 136, 8.7),
(6, 'The Godfather', 'Crime', 175, 9.2),
(7, 'Pulp Fiction', 'Crime', 154, 8.9),
(8, 'Fight Club', 'Drama', 139, 8.8),
(9, 'Interstellar', 'Sci-Fi', 169, 8.6),
(10, 'The Lion King', 'Animation', 88, 8.5),
(11, 'The Avengers', 'Action', 143, 8.0),
(12, 'The Social Network', 'Biography', 120, 7.7),
(13, 'The Godfather Part II', 'Crime', 202, 9.0),
(14, 'Gladiator', 'Action', 155, 8.5),
(15, 'Avatar', 'Sci-Fi', 162, 7.8);   



create database TravelAgency;
go
use TravelAgency;
go
create schema Tours;
go 
create table Tours.Destinations(
    destination_id int primary key,
	country varchar(100) not null,
	city varchar(50)not null,
	price float not null,
	duration_days int
);
INSERT INTO Tours.Destinations(destination_id, country, city, price, duration_days)
VALUES
(1, 'France', 'Paris', 1200.00, 7),
(2, 'Italy', 'Rome', 1100.00, 6),
(3, 'Japan', 'Tokyo', 1500.00, 10),
(4, 'USA', 'New York', 1300.00, 5),
(5, 'Australia', 'Sydney', 1600.00, 12),
(6, 'Brazil', 'Rio de Janeiro', 1000.00, 8),
(7, 'Spain', 'Barcelona', 950.00, 6),
(8, 'Thailand', 'Bangkok', 800.00, 9),
(9, 'Canada', 'Vancouver', 1400.00, 7),
(10, 'Mexico', 'Cancun', 850.00, 5),
(11, 'Egypt', 'Cairo', 900.00, 6),
(12, 'Greece', 'Athens', 1100.00, 7),
(13, 'South Africa', 'Cape Town', 1300.00, 10),
(14, 'Switzerland', 'Zurich', 1800.00, 8),
(15, 'New Zealand', 'Auckland', 1700.00, 12);




create database HRManagement;
go
use HRManagement;
go
create schema  Employees;
go
create table  Employees.Staff (
    employee_id int primary key,
	first_name varchar(50),
	last_name varchar(50),
	position varchar(50),
	salary int
);
INSERT INTO  Employees.Staff(employee_id, first_name, last_name, position, salary)
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



create database SportsClub;
go 
use SportsClub;
go
create schema Membership;
go
create table   Membership.Members(
    member_id int primary key,
	name varchar(100),
	age int,
	membership_type varchar(100),
	expiry_date date
);
INSERT INTO Membership.Members(member_id, name, age, membership_type, expiry_date)
VALUES 
(1, 'John Doe', 28, 'Gold', '2025-12-31'),
(2, 'Jane Smith', 34, 'Silver', '2025-06-15'),
(3, 'Michael Johnson', 22, 'Bronze', '2025-09-10'),
(4, 'Emily Davis', 40, 'Platinum', '2025-11-01'),
(5, 'Chris Lee', 29, 'Gold', '2025-10-20'),
(6, 'Sarah Wilson', 25, 'Silver', '2025-08-05'),
(7, 'David Brown', 31, 'Platinum', '2025-12-01'),
(8, 'Megan Clark', 27, 'Bronze', '2025-07-15'),
(9, 'James Turner', 33, 'Gold', '2025-11-30'),
(10, 'Olivia Harris', 39, 'Silver', '2025-04-20'),
(11, 'William Martin', 24, 'Bronze', '2025-02-28'),
(12, 'Sophia Lee', 32, 'Gold', '2025-05-10'),
(13, 'Liam King', 29, 'Platinum', '2025-09-25'),
(14, 'Isabella Adams', 36, 'Silver', '2025-03-10'),
(15, 'Lucas Scott', 38, 'Bronze', '2025-01-15');