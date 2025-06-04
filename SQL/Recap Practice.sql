-- 1
-- Categories
create table Categories (
		CategoryID int primary key,
		CategoryName varchar(50)
		);


INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1,N'Electronics'),
(2,N'Clothing'),
(3,N'Home & Kitchen'),
(4,N'Accessories'),
(5,N'Sports'),
(6,N' Books  ');  

--Products
create table Products(
		ProductID int primary key,
		ProductName varchar(50),
		CategoryID int,
		UnitPrice float
		);       

INSERT INTO Products (ProductID, ProductName, CategoryID, UnitPrice) VALUES
(1 ,N'Laptop X1',              1,1200.00),
(2 ,N'Smart-Phone Z',          1, 699.00),
(3 ,N'Bluetooth Headphones',   1, 149.50),
(4 ,N'Cotton T-Shirt',         2,  19.99),
(5 ,N'Slim Jeans',             2,  45.00),
(6 ,N'Sports Watch',           4, 210.00),
(7 ,N'High-Speed Blender',     3,  89.00),
(8 ,N'Robot Vacuum',           3, 350.00),
(9 ,N'Trekking Backpack',      5, 130.00),
(10,N'Yoga Mat',               5,  35.00);






-- Customers
create table Customers(
	CustomerID int primary key,
	CustomerName varchar(50),
	Email varchar(50),
	RegistrationDate date
);

INSERT INTO Customers (CustomerID, CustomerName, Email, RegistrationDate) VALUES
(1 ,N'Ali Karimov',   N'ali@alpha.uz',       '2022-11-07'),
(2 ,N'Laylo Abdullayeva',N'laylo@mail.com', '2023-01-12'),
(3 ,N'Rauf Nasriddin', N'rauf@delta.uz',     '2023-05-30'),
(4 ,N'Saida Murodova', N'saida@beta.uz',     '2023-09-02'),
(5 ,N'Umar Qodirov',  N'umar@corp.com',      '2024-02-14'),
(6 ,N'Nigora Akhmedova',N'nigora@alpha.uz', '2024-03-03'),
(7 ,N'Murod Ismoil',  N'murod@gmail.com',    '2022-12-24'),
(8 ,N'Kamola Rakhim', N'kamola@xcompany.com','2023-06-16'),
(9 ,N'Dilshod Aziz',  N'dilshod@personal.org','2022-08-01'),
(10,N'Zarina Yusupova',N'zarina@yandex.ru',  '2022-04-25');

-- Orders
create table orders(
	OrderID int primary key,
	CustomerID int,
	OrderDate date
	);

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(1001,1 ,'2023-02-15'),
(1002,2 ,'2023-03-27'),
(1003,1 ,'2023-11-21'),
(1004,3 ,'2024-01-10'),
(1005,4 ,'2024-02-18'),
(1006,1 ,'2024-05-06'),
(1007,5 ,'2024-03-01'),
(1008,6 ,'2024-03-15'),
(1009,7 ,'2023-05-04'),
(1010,8 ,'2023-12-09'),
(1011,9 ,'2023-07-30'),
(1012,2 ,'2024-04-20'),
(1013,3 ,'2023-09-14');




create table OrderItems (
	OrderItemID int primary key,
	OrderID int,
	ProductID int, 
	Quantity int,
	UnitPrice float
);


-- ORDER ITEMS
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) VALUES
(1 ,1001,1 ,1 ,1200.00),
(2 ,1001,4 ,3 ,  19.99),
(3 ,1002,2 ,2 , 699.00),
(4 ,1003,3 ,1 , 149.50),
(5 ,1003,5 ,2 ,  45.00),
(6 ,1003,7 ,1 ,  89.00),
(7 ,1004,3 ,2 , 149.50),
(8 ,1004,6 ,1 , 210.00),
(9 ,1005,4 ,4 ,  19.99),
(10,1005,5 ,1 ,  45.00),
(11,1006,1 ,2 ,1200.00),
(12,1006,2 ,1 , 699.00),
(13,1007,9 ,1 , 130.00),
(14,1008,10,3 ,  35.00),
(15,1009,8 ,1 , 350.00),
(16,1010,4 ,5 ,  19.99),
(17,1011,3 ,1 , 149.50),
(18,1011,2 ,1 , 699.00),
(19,1012,6 ,2 , 210.00),
(20,1013,7 ,1 ,  89.00);


create table Departments(
	DepartmentID int,
	DepartmentName varchar(50)
);

-- DEPARTMENTS
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(10,N'IT'),
(20,N'Finance'),
(30,N'HR'),
(40,N'Sales');








-- EMPLOYEES
create table Employees(
	EmployeeID int,
	FullName varchar(50),
	Email varchar(50),
	HireDate date,
	DepartmentID int,
	Salary int
);

INSERT INTO Employees
(EmployeeID, FullName, Email, HireDate, DepartmentID,Salary)
VALUES
(101,N'Azizbek Nizomov',              N'aziz@alpha.uz',          '2021-05-01',10,  9000),
(102,N'Sabina Tursun',                N'sabina@finance.org',     '2020-03-15',20, 12500),
(103,N'Rashid Said',                  N'rashid@alpha.uz',        '2022-07-21',10,  7200),
(104,N'Nasiba Alimova',               N'nasiba.hr@corp.com',     '2019-11-30',30,  5800),
(105,N'Kamron Bek',                   N'kamron.sales@corp.com',  '2023-01-10',40,  6400),
(106,N'Alisher Abdu',                 N'alisher@finance.org',    '2022-02-14',20, 11800),
(107,N'Nilufar Hamid',                N'nilufar.hr@corp.com',    '2024-02-01',30,  5000),
(108,N'Sardor Rixsiboy',              N'sardor@alpha.uz',        '2024-04-20',10,  6700),
(109,N'Gulnoza Ibrohimovna Asqarova', N'gulnoza.asqarova@corp.com','2021-09-09',40,7100),
(110,N'Javlon Toâ€˜lqin Ugli Oâ€˜ktamov', N'javlon@alpha.uz',        '2018-06-18',10, 15000);



-- PROJECTS
create table Projects (
	ProjectID int,
	Projectname varchar(50),
	StartDate date,
	EndDate date
);

INSERT INTO Projects (ProjectID, ProjectName, startDate ,EndDate)
VALUES
(500,N'Core Banking Upgrade','2023-11-01',NULL),
(501,N'New Mobile App',      '2022-06-03','2024-02-28'),
(502,N'Payroll Revamp',      '2024-01-08',NULL),
(503,N'Salesforce Migration','2023-03-14','2023-10-01');





-- EMPLOYEE-PROJECT MAPPING
create table EmployeeProjects(
	EmployeeID int,
	ProjectID int,
	HoursPerWeek int
);

INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursPerWeek) VALUES
(101,500,25),
(103,500,20),
(110,500,10),
(102,501,15),
(106,501,20),
(104,502,25),
(107,502,15),
(105,503,30),
(109,503,20),
(101,501,10),  
(106,502,10);





---------------------------------------------------------------
-- 1
with cte as(
select c.CustomerName, o.OrderDate, sum(oi.UnitPrice * oi.Quantity) as totalSum
from Customers c
join orders o 
			on c.CustomerID = o.CustomerID
join OrderItems oi 
			on o.OrderID = oi.OrderID
where year(o.OrderDate) = '2024'
group by c.CustomerName, o.OrderDate, oi.Quantity
)

select CustomerName, 
	case 
		when totalSum <5000 then 'Low'
		when totalSum >= 5000 and totalSum <= 10000 then 'Medium'
		else 'High'
	end  as SumSales,
	totalSum as TotalAmount
from cte;



-- 2
select c.CustomerName, p.ProductName
from Products p 
join [dbo].[OrderItems] oi
			on p.ProductID = oi.ProductID
join [dbo].[orders] o
			on oi.OrderID = o.OrderID
join Customers c
			on o.CustomerID = c.CustomerID
join Categories ca 
			on p.CategoryID = ca.CategoryID
where ca.CategoryName in ('Electronics', 'Clothing');


-- 3
select c.CustomerName
from [dbo].[Customers] c
join [dbo].[orders] o
				on c.CustomerID = o.CustomerID
where year(o.OrderDate) = '2023' and 
c.CustomerID not in (select distinct CustomerID from orders where year(OrderDate) = '2024' )


-- 4
with maximale as (
	select top 1 p.ProductName, p.UnitPrice, c.CategoryName, ProductID
	from [dbo].[Categories] c
	join [dbo].[Products] p on c.CategoryID = p.CategoryID
	order by p.UnitPrice desc
),
minimale as (
	select top 1 p.ProductName, p.UnitPrice, c.CategoryName, ProductID
	from [dbo].[Categories] c
	join [dbo].[Products] p on c.CategoryID = p.CategoryID
	order by p.UnitPrice 
)
select  UnitPrice as MaxandMinPrice, ProductName, CategoryName
from maximale ma

union all

select  UnitPrice as MaxandMinPrice, ProductName, CategoryName
from minimale



-- 5
select c.CustomerName, 
	case when sum(oi.UnitPrice * oi.Quantity) >= 200 then 'HighValue'
	else 'no' end as TotalSum
from [dbo].[Customers] c
join [dbo].[orders] o on c.CustomerID = o.CustomerID
join [dbo].[OrderItems] oi on o.OrderID = oi.OrderID
group by  c.CustomerName
having sum(oi.UnitPrice * oi.Quantity) >= 200

union 

select c.CustomerName, 
	case when sum(oi.Quantity) >= 10 then 'Frequent'
	else 'no' end as TotalSum
from [dbo].[Customers] c
join [dbo].[orders] o on c.CustomerID = o.CustomerID
join [dbo].[OrderItems] oi on o.OrderID = oi.OrderID
group by  c.CustomerName
having sum(oi.Quantity) >= 10


-- 7
with cte as (
	select d.DepartmentID, d.DepartmentName, avg(e.Salary) as AvgSalary
	from [dbo].[Employees] e
	join [dbo].[Departments] d on e.DepartmentID = d.DepartmentID
	group by d.DepartmentID, d.DepartmentName
)

select c.DepartmentID, c.DepartmentName, e.[FullName],
		case when e.Salary > c.AvgSalary then 'Above avg' else 'Below avg' end as SalaryLabe, e.Salary
from cte c
join [dbo].[Employees] e on c.[DepartmentID] = e.[DepartmentID]



-- 8
select *, datename(weekday, [StartDate])  as weekday 
from Projects
where [EndDate] is null and datename(weekday, [StartDate]) = 'Friday'


select *, datename(weekday, [StartDate])  as weekday 
from Projects
where datename(weekday, [StartDate]) = 'Friday'


-- 10
select right(Email, len(Email) - CHARINDEX('@', Email)) as domen, 
	count(*) as EmpAmount, 
	avg(Salary) as AvgSalary
from [dbo].[Employees]
group by right(Email, len(Email) - CHARINDEX('@', Email)) 
having count(*) >= 3


-- 11
select d.DepartmentName, e.FullName
from [dbo].[Departments] d
left join [dbo].[Employees] e on e.DepartmentID = d.DepartmentID
where d.DepartmentName is null



-- 13
select trim([CategoryName]) as CategoryName
from Categories


-- 14 
select e.FullName, d.DepartmentName,
	case when e.EmployeeID in 
			 (select top 5 [EmployeeID]
			from [dbo].[EmployeeProjects] group by [EmployeeID] 
			order by sum([HoursPerWeek]) desc) then 'Overloaded' else 'Normal'
	end as Status
from [dbo].[EmployeeProjects] ep
join [dbo].[Employees] e on ep.EmployeeID = e.EmployeeID
join [dbo].[Departments] d on e.[DepartmentID] = d.DepartmentID
group by e.FullName, d.DepartmentName, e.EmployeeID;




WITH Top5 AS (
    SELECT TOP 5 EmployeeID
    FROM EmployeeProjects
    GROUP BY EmployeeID
    ORDER BY SUM(HoursPerWeek) DESC
)


SELECT 
    e.FullName, 
    d.DepartmentName,
    CASE 
        WHEN ep.EmployeeID IN (SELECT EmployeeID FROM Top5) THEN 'Overloaded'
        ELSE 'Normal'
    END AS Status
FROM EmployeeProjects ep
JOIN Employees e ON ep.EmployeeID = e.EmployeeID
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY e.FullName, d.DepartmentName, ep.EmployeeID



-- 15
select c.CustomerName, sum(oi.Quantity) OrderAm
from [dbo].[Customers] c
join [dbo].[orders] o on c.CustomerID = o.CustomerID
join [dbo].[OrderItems] oi on o.OrderID = oi.OrderID
join [dbo].[Products] p on oi.ProductID = p.ProductID
join [dbo].[Categories] ct on p.CategoryID = ct.CategoryID
where c.CustomerName not in (
	select c.CustomerName
	from [dbo].[Customers] c
	join [dbo].[orders] o on c.CustomerID = o.CustomerID
	join [dbo].[OrderItems] oi on o.OrderID = oi.OrderID
	join [dbo].[Products] p on oi.ProductID = p.ProductID
	join [dbo].[Categories] ct on p.CategoryID = ct.CategoryID
	where ct.CategoryName = 'Electronics')
group by c.CustomerName
having sum(oi.Quantity) >= 3



-- 18
select o.OrderDate, sum(oi.Quantity * oi.UnitPrice) as TotalIncome
from [dbo].[orders] o
join [dbo].[OrderItems] oi on o.OrderID = oi.OrderID
where year(o.OrderDate) = '2024'
group by o.OrderDate


-- 19
select e.FullName, d.DepartmentName
from [dbo].[Departments] d
join [dbo].[Employees] e on d.DepartmentID = e.DepartmentID
where d.DepartmentName = 'IT'

union all

select e.FullName, d.DepartmentName, e.Salary
from [dbo].[Departments] d
join [dbo].[Employees] e on d.DepartmentID = e.DepartmentID
where d.DepartmentName = 'Finance'















