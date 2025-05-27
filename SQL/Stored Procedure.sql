create procedure Person_info
	@name varchar(50)
as
begin 
	select *
	from [Person].[Person]
	where [FirstName] = @name
end;

exec Person_info @name = 'Bob';



-- 1

create procedure Personsinfo
	@user_id int
as 
begin 
	select * from [Person].[Person] where [BusinessEntityID] = @user_id
end

exec Personsinfo @user_id = 10;



-- 2
-- The task is not defined, no EXACT conditions
create table users(
name varchar(50),
age int,
city varchar(50)
);

insert into users(name, age, city)
values
('Kaizen', 16, 'Tokyo'),
('Jinwoo', 18, 'Seul');


create procedure NewTable
	@name varchar(50),
	@city varchar(50)
as
begin 
	insert into users(name, city)
	values (@name, @city)
end;

exec NewTable @name = 'Jinho', @city = 'Kiyota';

select * from users



--3
create procedure Sales
	@Sales_id int
as
begin 
	select *
	from [Sales].[SalesOrderDetail]
	where [SalesOrderID] = @sales_id
end;

exec Sales @Sales_id = 43659


--4
create procedure Department_emp
	@department_name varchar(50)
as 
begin 
	select p.FirstName
	from [Person].[Person] p
	join [HumanResources].[EmployeeDepartmentHistory] hr 
		on p.BusinessEntityID = hr.BusinessEntityID
	join [HumanResources].[Department] hd 
		on hr.DepartmentID = hd.DepartmentID
	where hd.name = @department_name
end;

exec Department_emp @department_name = 'Engineering'



-- 5
create procedure Emp_salary
	@id int,
	@new_salary int
as 
begin 
	UPDATE [HumanResources].[EmployeePayHistory]
	SET [Rate] = @new_salary
	where [BusinessEntityID] = @id
end;

--Executing
exec Emp_salary @id = 1, @new_salary = 100


select p.BusinessEntityID, p.FirstName, h.Rate
from [Person].[Person] p
join [HumanResources].[EmployeePayHistory] h 
	on p.[BusinessEntityID] = h.BusinessEntityID
where p.BusinessEntityID = 1


select p.BusinessEntityID, p.FirstName, h.Rate
from [Person].[Person] p
join [HumanResources].[EmployeePayHistory] h 
	on p.[BusinessEntityID] = h.BusinessEntityID
order by p.BusinessEntityID 


--6
create procedure SalesDate
	@startdate date,
	@enddate date

as
begin 
	select p.Name AS ProductName,
        sh.OrderDate,
        ss.OrderQty,
        ss.UnitPrice
	from [Production].[Product] p
	join [Sales].[SalesOrderDetail] ss
		on p.ProductID = ss.ProductID
	join [Sales].[SalesOrderHeader] sh
		on ss.SalesOrderID = sh.SalesOrderID
	where sh.OrderDate between @startdate and @enddate
end;

exec SalesDate @startdate = '2011-06-01',  @enddate = '2011-06-06'


--7
--gpt 
CREATE TABLE students2 (
    student_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    scholarship_type VARCHAR(50),
    scholarship_year INT
);

INSERT INTO students2 (student_id, first_name, last_name, scholarship_type, scholarship_year)
VALUES
(1, 'Jinwoo', 'Kim', 'merit-based', 2022),
(1, 'Jinwoo', 'Kim', 'need-based', 2023),
(1, 'Jinwoo', 'Kim', 'athletic', 2024),
(2, 'Ava', 'Smith', 'merit-based', 2023),
(2, 'Ava', 'Smith', 'none', 2024),
(3, 'Noah', 'Lee', 'need-based', 2022),
(4, 'Olivia', 'Park', 'athletic', 2022),
(4, 'Olivia', 'Park', 'athletic', 2023),
(5, 'Ethan', 'Choi', 'none', 2023),
(6, 'Mia', 'Yun', 'merit-based', 2022),
(6, 'Mia', 'Yun', 'merit-based', 2023),
(7, 'Daniel', 'Song', 'need-based', 2024),
(8, 'Sophia', 'Kang', 'none', 2022),
(9, 'Liam', 'Jeong', 'athletic', 2022),
(9, 'Liam', 'Jeong', 'merit-based', 2023);


create procedure StudentsScholarship
	@id int
as
begin
	select scholarship_type as StudentsScholar
	from students2
	where student_id = @id
end;

exec StudentsScholarship @id = 1



--8
--gpt
CREATE TABLE it_projects (
    project_name VARCHAR(100),
    manager_id INT
);

INSERT INTO it_projects (project_name, manager_id)
VALUES
('Website Redesign', 101),
('Mobile App Development', 102),
('Cloud Migration', 103),
('Cybersecurity Audit', 101),
('CRM Integration', 104),
('API Development', 102),
('AI Chatbot', 103),
('Database Cleanup', 105),
('Email System Upgrade', 104),
('DevOps Implementation', 101),
('ERP Rollout', 106),
('Analytics Dashboard', 103),
('Helpdesk Tool', 102),
('Server Virtualization', 105),
('Employee Portal', 101);


create procedure projects
	@manager int,
	@project varchar(100)
as
begin
	insert into it_projects(project_name, manager_id)
	values
	(@project, @manager)
end;


exec projects @manager = 107, @project = 'Deep Learning'


select * 
from it_projects


--9
create procedure EmployeeCount
	@depID int
as
begin
	select d.DepartmentID, count(p.[BusinessEntityID]) as EmpCount, avg(hp.rate) as AverageSalary
	from [Person].[Person] p
	join [HumanResources].[EmployeePayHistory] hp
		on p.BusinessEntityID = hp.BusinessEntityID
	join [HumanResources].[EmployeeDepartmentHistory] hd
		on hp.BusinessEntityID = hd.BusinessEntityID
	join [HumanResources].[Department] d
		on hd.DepartmentID = d.DepartmentID
	where d.DepartmentID = @depID
	group by d.DepartmentID

end;

exec EmployeeCount @depID = 2



--10
CREATE TABLE Books (
    BookID INT,
    Name VARCHAR(100)
);

-- Insert 10 sample rows
INSERT INTO Books (BookID, Name)
VALUES
(1, '1984'),
(2, 'To Kill a Mockingbird'),
(3, 'Pride and Prejudice'),
(4, 'The Great Gatsby'),
(5, 'Moby Dick'),
(6, 'War and Peace'),
(7, 'The Catcher in the Rye'),
(8, 'Brave New World'),
(9, 'The Hobbit'),
(10, 'Crime and Punishment');


create procedure DeleteBook
	@BookID int
as
begin
	if exists (select 1 from Books where BookID = @BookID)
	begin 
		delete from Books where BookID = @BookID
	end
end;

exec DeleteBook @BookID = 9

select *
from Books