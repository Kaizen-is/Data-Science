-----------------------------------------------------------------
--1
with emp as (
select p.BusinessEntityID,
       p.FirstName,
	   p.LastName,
	   e.JobTitle
from [Person].[Person] p
join  [HumanResources].[Employee] e 
on p.BusinessEntityID = e.BusinessEntityID)

select m.FirstName, m.LastName, m.JobTitle
from emp m;
-----------------------------------------------------------------
--2
with NewP as(
select Name, StandardCost * ListPrice as FullPrice
from [Production].[Product])

select n.Name, avg(FullPrice) as AVGP
from NewP n
group by n.Name
order by avg(FullPrice) desc;
-----------------------------------------------------------------
--3
with Customers as(
select p.BusinessEntityID, p.FirstName, h.SalesOrderID
from  [Person].[Person] p
join [Sales].[Customer] sc on p.BusinessEntityID = sc.CustomerID
join [Sales].[SalesOrderHeader] h on sc.CustomerID = h.CustomerID
)
select c.FirstName, count(c.SalesOrderID) as SalesCount
from Customers c
group by c.FirstName;
-----------------------------------------------------------------
--4
with emp2 as (
select p.BusinessEntityID, p.FirstName, e.[BirthDate],
year(getdate()) - year(e.[BirthDate]) as Age, e.HireDate
from [Person].[Person] p
join  [HumanResources].[Employee] e 
on p.BusinessEntityID = e.BusinessEntityID)

select m.FirstName, m.Age, m.HireDate
from emp2 m
order by m.Age;
-----------------------------------------------------------------
--5
with ProdQty as (
select p.Name, i.Quantity
from Production.Product P
join Production.ProductInventory i
on p.ProductID = i.ProductID)

select q.Name, sum(q.Quantity) as TotalProdQty
from ProdQty q
group by q.Name;
-----------------------------------------------------------------
--6
with TotalDue as(
select pp.FirstName as Sellers, h.TotalDue
from  [Sales].[SalesOrderHeader] h
join [Sales].[SalesPerson] sp
on h.SalesPersonID = sp.BusinessEntityID
join [Person].[Person] pp
on sp.BusinessEntityID = pp.BusinessEntityID
)
select d.Sellers, sum(d.TotalDue) as TotalPoffit
from TotalDue d
group by d.Sellers
order by sum(d.TotalDue) desc;

--correct answ
with TotalDue as(
select pp.FirstName as Sellers, sum(h.TotalDue) as TotalDue
from  [Sales].[SalesOrderHeader] h
join [Sales].[SalesPerson] sp
on h.SalesPersonID = sp.BusinessEntityID
join [Person].[Person] pp
on sp.BusinessEntityID = pp.BusinessEntityID
group by pp.FirstName, h.TotalDue
)
select d.Sellers, d.TotalDue as TotalPoffit
from TotalDue d;



with TotalDue as(
select pp.FirstName as Sellers, sum(h.TotalDue) as TotalDuee
from  [Sales].[SalesOrderHeader] h
join [Sales].[SalesPerson] sp
on h.SalesPersonID = sp.BusinessEntityID
join [Person].[Person] pp
on sp.BusinessEntityID = pp.BusinessEntityID
group by pp.FirstName, h.TotalDue
)
select d.Sellers, max(d.TotalDuee) as TotalPoffit
from TotalDue d
group by d.Sellers
having d.TotalDuee = max(d.TotalDuee);

with TotalDue as(
select pp.FirstName as Sellers, sum(h.TotalDue) as TotalDuee
from  [Sales].[SalesOrderHeader] h
join [Sales].[SalesPerson] sp
on h.SalesPersonID = sp.BusinessEntityID
join [Person].[Person] pp
on sp.BusinessEntityID = pp.BusinessEntityID
group by pp.FirstName, h.TotalDue
)
select *
from TotalDue d
where d.TotalDuee  = (select max(TotalDuee) from TotalDue);



with TotalDue as(
select pp.FirstName as Sellers, sum(h.TotalDue) as TotalDuee
from  [Sales].[SalesOrderHeader] h
join [Sales].[SalesPerson] sp
on h.SalesPersonID = sp.BusinessEntityID
join [Person].[Person] pp
on sp.BusinessEntityID = pp.BusinessEntityID
group by pp.FirstName, h.TotalDue
)
select d.Sellers, max(d.TotalDuee) as TotalPoffit
from TotalDue d
group by d.Sellers;

-----------------------------------------------------------------
--7
with typP as (
select p.ProductID, p.Name, max(p.ListPrice) as MAXP,
                            min(p.ListPrice) as MINP,
							avg(p.ListPrice) as AVGP
from [Production].[Product] p
group by p.ProductID, p.Name)
select *
from typP t
order by MAXP desc;


with typP as (
select p.ProductID, p.Name, max(p.ListPrice) as MAXP,
                            min(p.ListPrice) as MINP,
							avg(p.ListPrice) as AVGP
from [Production].[Product] p
group by p.ProductID, p.Name)
select t.Name, max(t.AVGP) as MAXavg
from typP t
group by t.Name
order by MAXavg desc;
-----------------------------------------------------------------
--8

with Customers as(
select p.BusinessEntityID, p.FirstName, h.SalesOrderID, h.OrderDate
from  [Person].[Person] p
join [Sales].[Customer] sc on p.BusinessEntityID = sc.CustomerID
join [Sales].[SalesOrderHeader] h on sc.CustomerID = h.CustomerID
)
select c.FirstName, max(c.OrderDate) as RecentOrd 
from Customers c
group by c.FirstName;
-----------------------------------------------------------------
--9

with WorkH as (
select p.BusinessEntityID, p.FirstName, e.HireDate
from [Person].[Person] p
join  [HumanResources].[Employee] e 
on p.BusinessEntityID = e.BusinessEntityID
)
select h.FirstName, count(h.BusinessEntityID) as WQTY, h.HireDate
from WorkH h
group by h.HireDate, h.FirstName;


with WorkH as (
select p.BusinessEntityID, p.FirstName, e.HireDate
from [Person].[Person] p
join  [HumanResources].[Employee] e 
on p.BusinessEntityID = e.BusinessEntityID
)
select count(h.BusinessEntityID) as WQTY, h.HireDate
from WorkH h
group by h.HireDate
order by count(h.BusinessEntityID) desc;


with WorkH as (
select p.BusinessEntityID, p.FirstName, e.HireDate
from [Person].[Person] p
join  [HumanResources].[Employee] e 
on p.BusinessEntityID = e.BusinessEntityID
)
select count(h.BusinessEntityID) as WQTY, year(h.HireDate) as Year
from WorkH h
group by year(h.HireDate)
order by year(h.HireDate);

-----------------------------------------------------------------
--10

with TotalDue as(
select pp.FirstName as Sellers, avg(h.TotalDue) as TotalDuee
from  [Sales].[SalesOrderHeader] h
join [Sales].[SalesPerson] sp
on h.SalesPersonID = sp.BusinessEntityID
join [Person].[Person] pp
on sp.BusinessEntityID = pp.BusinessEntityID
group by pp.FirstName
)
select d.Sellers, d.TotalDuee as AVGP
from TotalDue d;
