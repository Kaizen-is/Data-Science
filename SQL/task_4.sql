CREATE DATABASE BankSystem;
CREATE SCHEMA Transactions;

CREATE TABLE Accounts (
	account_id int primary key,
    holder_name varchar(100),
    balance int, 
    currency varchar(100),
    created_date date
);    
   
INSERT INTO Accounts (account_id, holder_name, balance, currency, created_date)
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
   
   
   