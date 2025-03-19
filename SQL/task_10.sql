CREATE DATABASE SportsClub;
USE SportsClub;
CREATE SCHEMA  Membership;

CREATE TABLE Membership.Members (
	member_id int primary key,
    name varchar(100),
    age int,
    membership_type varchar(100),
    expiry_date date
);    

INSERT INTO Members (member_id, name, age, membership_type, expiry_date)
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