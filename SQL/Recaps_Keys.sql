--1
create database Universitydb;
go
use  Universitydb;
go
create schema Universitycs;
go
create table Universitycs.Students(
    id int primary key,
    name varchar(50),
    age int
);
go
create table Universitycs.Cource(
    id int primary key,
	course_name varchar(50)
);
go
create table Universitycs.Enrollments(
    student_id int,
	course_id int
);
go
insert into Universitycs.Students(id, name, age)
values
(1, 'Alice Johnson', 19),
(2, 'Bob Smith', 20),
(3, 'Charlie Davis', 18),
(4, 'David Wilson', 21),
(5, 'Emma Brown', 22);
go
insert into Universitycs.Cource(id, course_name)
values
(1, 'Mathematics'),
(2, 'Computer Science'),
(3, 'Physics'),
(4, 'English Literature'),
(5, 'Cybersecurity');
go

insert into Universitycs.Enrollments(student_id, course_id)
values 
(1, 2),
(2, 1),
(3, 3),
(4, 4),
(5, 5);
go
select s.name as Student, course_name as Course
from Universitycs.Enrollments e
join Universitycs.Students s on e.student_id = s.id
join Universitycs.Cource c on e.course_id = c.id
order by s.name;
go

------------------------------------------------------------------
--2
create table Universitycs.Departments(
    id int primary key,
	name varchar(50)
);
insert into Universitycs.Departments(id, name)
values
(1, 'Mathematics'),
(2, 'Computer Science'),
(3, 'Physics'),
(4, 'English Literature'),
(5, 'Cybersecurity');
create table Universitycs.Employees(
     id int primary key,
	 name varchar(50),
	 department_id int,
	 salary float 
);
insert into Universitycs.Employees(id, name, department_id, salary)
values 
(1, 'Alice Johnson', 101, 60000),
(2, 'Bob Smith', 102, 55000),
(3, 'Charlie Davis', 103, 70000),
(4, 'David Wilson', 101, 65000),
(5, 'Emma Brown', 102, 72000);

select e.name as Names, d.name, e.Salary
from Universitycs.Employees e
inner join Universitycs.Departments d on e.id = d.id
------------------------------------------------------------------
--3
create table Universitycs.Categories(
     id int primary key,
	 name varchar(50)
);

create table Universitycs.Suppliers(
     id int primary key,
	 name varchar(50)
);

create table Universitycs.Products(
     id int primary key,
	 name varchar(50),
	 category_id int,
	 supplier_id int,
	 price float
);

insert into Universitycs.Categories(id, name)
values
(1, 'Electronics'),
(2, 'Furniture'),
(3, 'Clothing'),
(4, 'Groceries'),
(5, 'Sports Equipment');

insert into Universitycs.Suppliers(id, name)
values
(1, 'Tech World'),
(2, 'Home Comforts'),
(3, 'Fashion Hub'),
(4, 'Fresh Mart'),
(5, 'Sports Gear Inc.');

insert into Universitycs.Products(id, name, category_id, supplier_id, price)
values
(1, 'Smartphone', 1, 1, 799.99),
(2, 'Sofa', 2, 2, 1200.00),
(3, 'T-Shirt', 3, 3, 19.99),
(4, 'Apple', 4, 4, 2.99),
(5, 'Tennis Racket', 5, 5, 89.99);

select p.name as ProductName, c.name as CategoryName, s.name as SuppliersName
from Universitycs.Products p
inner join  Universitycs.Categories c on p.category_id = c.id
inner join  Universitycs.Suppliers s on p.supplier_id = s.id
------------------------------------------------------------------
--4
create table Universitycs.Customers(
     id int primary key,
	 name varchar(50)
);

create table Universitycs.Orders(
     id int primary key,
	 customer_id int,
	 order_date date
);

create table Universitycs.OrderItems(
     order_id int primary key,
	 product_id int,
	 quantity int
);

insert into Universitycs.Customers(id, name)
values
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Charlie Davis'),
(4, 'David Wilson'),
(5, 'Emma Brown');

insert into Universitycs.Orders(id, customer_id, order_date)
values
(1, 1, '2024-03-01'),
(2, 2, '2024-03-02'),
(3, 3, '2024-03-03'),
(4, 4, '2024-03-04'),
(5, 5, '2024-03-05');

insert into Universitycs.OrderItems(order_id, product_id, quantity)
values
(1, 2, 3),
(2, 5, 1),
(3, 1, 2),
(4, 3, 4),
(5, 4, 5);

select c.name as CustomerName, sum(i.quantity) as Amount, o.order_date
from Universitycs.Customers c
inner join Universitycs.Orders o on c.id = o.customer_id
inner join Universitycs.OrderItems i on o.customer_id = i.order_id
group by c.name, o.order_date
------------------------------------------------------------------
--5
create table Universitycs.Teachers(
 id int primary key,
 name varchar(50)
 );

create table Universitycs.Subjects(
 id int primary key,
 title varchar(50)
 );

 create table Universitycs.Classes(
  id int primary key,
  teacher_id int, 
  subject_id int
  );

insert into Universitycs.Teachers(id, name)
values
(1, 'Alice Johnson'),
(2, 'Bob Smith'),  
(3, 'Charlie Davis'),  
(4, 'David Wilson'), 
(5, 'Emma Brown');

insert into Universitycs.Subjects(id, title)
values
(1, 'Mathematics'),  
(2, 'Physics'),
(3, 'Computer Science'),  
(4, 'History'),
(5, 'Biology'); 

insert into Universitycs.Classes(id, teacher_id, subject_id)
values
(1, 1, 3),
(2, 2, 1), 
(3, 3, 2), 
(4, 4, 5),  
(5, 5, 4);

select c.id, t.name, s.title
from Universitycs.Classes c
inner join Universitycs.Teachers t on c.teacher_id = t.id
inner join Universitycs.Subjects s on c.subject_id = s.id
------------------------------------------------------------------
--6
create table Universitycs.Grades(
 id int primary key,
 student_id int,
 subject_id int,
 grade int
 );

insert into Universitycs.Grades(id, student_id, subject_id, grade)
values
(1, 1, 2, 85), 
(2, 2, 1, 90),  
(3, 3, 3, 78),  
(4, 4, 5, 88),  
(5, 5, 4, 92);

select s.id as StudentID, s.name as StudentName, sj.title as Subjects, avg(g.grade) AvgGrades
from Universitycs.Grades g
inner join [Universitycs].[Students] s on g.student_id = s.id
inner join [Universitycs].[Subjects] sj on g.subject_id = sj.id
group by s.id, s.name, sj.title
order by s.id
------------------------------------------------------------------
--7
create table Universitycs.Citites(
 id int primary key,
 name varchar(50)
 );

create table Universitycs.Customers_2(
 id int primary key,
 name varchar(50),
 city_id int
 );

insert into Universitycs.Citites(id, name)
values
(1, 'New York'),  
(2, 'Los Angeles'),  
(3, 'Chicago'),  
(4, 'Houston'),  
(5, 'Miami');

insert into Universitycs.Customers_2(id, name, city_id)
values
(1, 'Alice Johnson', 5),  
(2, 'Bob Smith', 2),  
(3, 'Charlie Davis', 4),  
(4, 'David Wilson', 3),  
(5, 'Emma Brown', 1);

select c.name as CustomerName, s.name as CityName, count(*) as People
from Universitycs.Customers_2 c
inner join Universitycs.Citites s on c.city_id = s.id
group by c.name, s.name

select  cu.name as CustomerName, c.name as CityName, count(*) as People
from Universitycs.Citites c
inner join Universitycs.Customers_2 cu on c.id = cu.city_id
group by c.name, cu.name
------------------------------------------------------------------
--8
create table Universitycs.Payments(
 id int primary key,
 order_id int,
 amount int,
 payment_date date
 );
 
 insert into Universitycs.Payments(id, order_id, amount, payment_date)
values
 (1, 101, 250.50, '2024-03-01'),  
(2, 102, 150.75, '2024-03-02'),  
(3, 103, 200.00, '2024-03-03'),  
(4, 104, 350.40, '2024-03-04'),  
(5, 105, 450.00, '2024-03-05');

select p.id, p.amount, o.order_date, sum(p.amount) as SumAmount
from [Universitycs].[Orders] o
inner join Universitycs.Payments p on o.id = p.id
group by p.id, p.amount, o.order_date
------------------------------------------------------------------
--9
create table Universitycs.Face(
 id int primary key,
 name varchar(50)
 );

create table Universitycs.Instag(
 id int primary key,
 name varchar(50)
 );

insert into Universitycs.Face(id, name)
values
(1, 'Alice Johnson'),  
(2, 'Bob Smith'),  
(3, 'Charlie Davis'),  
(4, 'David Wilson'),  
(5, 'Emma Brown');

insert into Universitycs.Instag(id, name)
values
(1, 'Emma Brown'),  
(2, 'Charlie Davis'),  
(3,  'Bob Smith'),  
(4, 'David Wilson'),  
(5, 'Alice Johnson');

select f.name
from Universitycs.Face f
union all
select i.name
from Universitycs.Instag i
------------------------------------------------------------------
--10
create table Universitycs.authors (
 id int primary key,
 name varchar(100)
);

create table Universitycs.books (
 id int primary key,
 title varchar(100),
 author_id int,
 published_year int,
);

insert into Universitycs.authors(id, name)
values
(1, 'george orwell'),
(2, 'j.k. rowling'),
(3, 'harper lee'),
(4, 'f. scott fitzgerald'),
(5, 'j.r.r. tolkien');

insert into Universitycs.books(id, title, author_id,published_year)
values
(6, 'brave new world', 1, 1932),
(7, 'harry potter and the chamber of secrets', 2, 1998),
(8, 'go set a watchman', 3, 2015),
(9, 'tender is the night', 4, 1934),
(10, 'the hobbit', 5, 1937);

select a.name, b.title, b.published_year
from  Universitycs.authors a
inner join Universitycs.books b on a.id = b.author_id
------------------------------------------------------------------
--11
create table Universitycs.Members(
 id int primary key,
 name varchar(50)
 );

create table Universitycs.Borrows(
 member_id int primary key,
 book_id int,
 borrow_date date,
 return_date date
 );

insert into  Universitycs.Members (id, name)
values 
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Charlie Davis'),
(4, 'David Wilson'),
(5, 'Emma Brown');

insert into Universitycs.Borrows(member_id, book_id, borrow_date, return_date)
values
(1, 1, '2024-03-01', null),
(2, 2, '2024-03-02', '2024-03-16'),
(3, 3, '2024-03-03', null),
(4, 4, '2024-03-04', '2024-03-18'),
(5, 5, '2024-03-05', '2024-03-19');

select m.name, b.book_id, b.borrow_date 
from Universitycs.Members m
inner join Universitycs.Borrows b on m.id = b.member_id
where b.return_date is null

------------------------------------------------------------------
--12
create table Universitycs.Proms(
 id int primary key,
 employee_id int,
 new_title varchar(50), promotion_date date );insert into Universitycs.Proms(id, employee_id, new_title, promotion_date)values(1, 101, 'Senior Developer', '2024-01-15'),
(2, 102, 'Project Manager', '2024-02-20'),
(3, 103, 'Lead Designer', '2024-03-10'),
(4, 104, 'Team Leader', '2024-04-05'),
(5, 105, 'Software Engineer', '2024-05-01');

select p.employee_id, e.name, count(p.id) as PromotionCount
from Universitycs.Proms p
inner join [Universitycs].[Employees] e on p.employee_id = e.id
group by  p.employee_id, e.name
------------------------------------------------------------------
--13
create table Universitycs.Sellers(
 id int primary key,
 name varchar(50)
 );
create table Universitycs.Sales(
  id int primary key,
  seller_id int,
  amount int,
  sale_d date
  );
insert into Universitycs.Sellers(id, name)
values
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Charlie Davis'),
(4, 'David Wilson'),
(5, 'Emma Brown');
 insert into Universitycs.Sales(id, seller_id, amount, sale_d)
 values
(1, 1, 500.00, '2024-03-01'),
(2, 2, 750.50, '2024-03-02'),
(3, 3, 300.75, '2024-03-03'),
(4, 4, 900.25, '2024-03-04'),
(5, 5, 650.00, '2024-03-05');

select se.name, sa.sale_d, sum(sa.amount) as SumSales
from  Universitycs.Sellers se
inner join Universitycs.Sales sa on se.id = sa.seller_id
group by se.name, sa.sale_d
------------------------------------------------------------------
--14
create table Universitycs.Branch(
 id int primary key,
 location varchar(100)
 );
create table Universitycs.Employees_2(
 id int primary key,
 name varchar(50),
 branch_id int
 );
insert into Universitycs.Branch(id, location)
values
(1, 'New York'),  
(2, 'Los Angeles'),  
(3, 'Chicago'),  
(4, 'Houston'),  
(5, 'Miami'); 
insert into Universitycs.Employees_2(id, name, branch_id)
values
(1, 'Alice Johnson', 1),  
(2, 'Bob Smith', 2),  
(3, 'Charlie Davis', 3),  
(4, 'David Wilson', 4),  
(5, 'Emma Brown', 5);

select e.name ,b.location, count(e.id) as EmplCount
from Universitycs.Branch b
inner join Universitycs.Employees_2 e on b.id = e.branch_id
group by  e.name, b.location
------------------------------------------------------------------
--15
create table Universitycs.OnCustomers(
 id int primary key,
 name varchar(50)
 );
create table Universitycs.OfCustomers(
 id int primary key,
 name varchar(50)
 );
insert into Universitycs.OnCustomers(id, name)
values
(1, 'Alice Johnson'),  
(2, 'Bob Smith'),  
(3, 'Charlie Davis'),  
(4, 'David Wilson'),  
(5, 'Emma Brown'); 
insert into Universitycs.OfCustomers(id, name)
values
(1, 'Frank Miller'),  
(2, 'Grace Taylor'),  
(3, 'Henry White'),  
(4, 'Isabella Clark'),  
(5, 'Jack Lewis');  

select *
from Universitycs.OnCustomers
intersect 
select *
from Universitycs.OfCustomers

select *
from Universitycs.OnCustomers
except 
select *
from Universitycs.OfCustomers

select *
from Universitycs.OfCustomers
except
select *
from Universitycs.OnCustomers
------------------------------------------------------------------
--16
create table Universitycs.Movies(
 id int primary key,
 title varchar(50)
 );
create table Universitycs.Actors(
 id int primary key,
 name varchar(50)
 );
create table Universitycs.MovieAct(
 movie_id int primary key,
 actor_id int
 );
insert into Universitycs.Movies(id, title)
values
(1, 'Inception'),  
(2, 'The Matrix'),  
(3, 'Interstellar'),  
(4, 'The Dark Knight'),  
(5, 'Fight Club'); 

insert into Universitycs.Actors(id, name)
values
(1, 'Leonardo DiCaprio'),  
(2, 'Keanu Reeves'),  
(3, 'Matthew McConaughey'),  
(4, 'Christian Bale'),  
(5, 'Brad Pitt');

insert into  Universitycs.MovieAct(movie_id, actor_id)
values
(1, 5),  
(2, 4),  
(3, 3),  
(4, 2),  
(5, 1);

select a.name as ActorName, m.title as FilmName, ma.actor_id, ma.movie_id
from Universitycs.MovieAct ma
inner join Universitycs.Actors a on ma.actor_id = a.id
inner join  Universitycs.Movies m on ma.movie_id = m.id
order by a.name, m.title
------------------------------------------------------------------
--17
create table  Universitycs.Air(
 id int primary key,
 name varchar(50)
 );
 create table  Universitycs.Flights(
 id int primary key,
 airl_id int,
 origin varchar(50),
 destination varchar(50),
 dep_time time
 );

insert into Universitycs.Air(id, name)
values
(1, 'Emirates'),  
(2, 'Qatar Airways'),  
(3, 'Turkish Airlines'),  
(4, 'Lufthansa'),  
(5, 'Singapore Airlines');

insert into Universitycs.Flights(id, airl_id, origin,destination, dep_time)
values
(1, 1, 'Dubai', 'New York', '2024-08-01 08:00:00'),  
(2, 2, 'Doha', 'London', '2024-08-02 10:30:00'),  
(3, 3, 'Istanbul', 'Berlin', '2024-08-03 12:15:00'),  
(4, 4, 'Frankfurt', 'Tokyo', '2024-08-04 14:45:00'),  
(5, 5, 'Singapore', 'Sydney', '2024-08-05 16:20:00');

select a.name, f.origin, f.destination, f.dep_time
from Universitycs.Air a
inner join Universitycs.Flights f on a.id = f.airl_id
------------------------------------------------------------------
--18
create table Universitycs.hotels (
 id int primary key,  
 name varchar(100)  
);
create table Universitycs.rooms (
 id int primary key,  
 hotel_id int,  
 number varchar(10)  
);
create table Universitycs.bookings (
 id int primary key,  
 room_id int,  
 customer_id int,  
 start_date date,  
 end_date date  
);
insert into Universitycs.hotels(id, name)
values
(1, 'grand palace'),  
(2, 'ocean view resort'),  
(3, 'mountain lodge'),  
(4, 'city center inn'),  
(5, 'luxury suites');
insert into Universitycs.rooms(id, hotel_id, number)
values
(1, 1, '101'),  
(2, 1, '102'),  
(3, 2, '201'),  
(4, 3, '301'),  
(5, 4, '401');
insert into  Universitycs.bookings(id, room_id, customer_id, start_date, end_date) 
values
(1, 1, 1001, '2024-08-01', '2024-08-05'),  
(2, 2, 1002, '2024-08-02', '2024-08-06'),  
(3, 3, 1003, '2024-08-03', '2024-08-07'),  
(4, 4, 1004, '2024-08-04', '2024-08-08'),  
(5, 5, 1005, '2024-08-05', '2024-08-09');

select h.name as hotel, count(b.id) as booked_roms
from Universitycs.hotels h
inner join Universitycs.rooms r on r.hotel_id = h.id
inner join Universitycs.bookings b on r.id = b.room_id
group by h.name
------------------------------------------------------------------
--19
create table Universitycs.Acc(
 id int primary key,
 cust_id int,
 balance float
 );
create table Universitycs.TranAc(
 id int primary key,
 acc_id int,
 type varchar(50),
 amount int,
 date date
 );
insert into Universitycs.Acc(id, cust_id, balance)
values
(1, 1001, 1500.00),
(2, 1002, 2300.50),
(3, 1003, 3200.75),
(4, 1004, 500.00),
(5, 1005, 1200.30);

insert into Universitycs.TranAc(id, acc_id, type, amount, date)
values
(1, 1, 'deposit', 500.00, '2024-03-01'),
(2, 1, 'withdrawal', 200.00, '2024-03-05'),
(3, 2, 'deposit', 1500.00, '2024-03-02'),
(4, 3, 'withdrawal', 500.00, '2024-03-03'),
(5, 4, 'deposit', 1000.00, '2024-03-04');

select a.id, ta.acc_id, ta.amount, ta.date, ta.type, a.balance
from  Universitycs.TranAc ta
inner join Universitycs.Acc a on ta.acc_id = a.id
order by ta.date desc;
------------------------------------------------------------------
--20
create table Universitycs.employees_3 (
 id int primary key,  
 name varchar(100),  
 manager_id int, 
);
insert into Universitycs.employees_3 (id, name, manager_id)
values
(1, 'alice johnson', null), 
(2, 'bob smith', 1),        
(3, 'charlie davis', 1),     
(4, 'david wilson', 2),    
(5, 'emma brown', 3); 

select e.name as employee, m.name as manager
from Universitycs.employees_3 e
left join Universitycs.employees_3 m on e.manager_id = m.id
order by e.name;