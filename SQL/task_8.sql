CREATE DATABASE TravelAgency;
CREATE SCHEMA   Tours;

CREATE TABLE Destinations(
	destination_id int primary key,
    country varchar (100),
    city varchar (100),
    price FLOAT,
    duration_days int
);   

INSERT INTO Destinations(destination_id, country, city, price, duration_days)
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
