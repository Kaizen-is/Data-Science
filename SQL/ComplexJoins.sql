---------------------------------------------------------
--1
select pp.FirstName, he.SalesOrderID
from [Person].[Person] pp
inner join [Sales].[Customer] sc 
           on pp.BusinessEntityID = sc.PersonID
inner join [Sales].[SalesOrderHeader] he 
           on sc.CustomerID = he.CustomerID;
---------------------------------------------------------
--2
select pp.FirstName, e.JobTitle, he.SalesOrderID
from [HumanResources].[Employee] e
inner join [Person].[Person] pp on e.BusinessEntityID = pp.BusinessEntityID
inner join [Sales].[Customer] sc 
           on pp.BusinessEntityID = sc.PersonID
inner join [Sales].[SalesOrderHeader] he 
           on sc.CustomerID = he.CustomerID;

select pp.FirstName, e.JobTitle, he.SalesOrderID
from  [Sales].[Customer] sc
inner join [Person].[Person] pp 
           on sc.PersonID = pp.BusinessEntityID
inner join  HumanResources.Employee e
           on pp.BusinessEntityID = e.BusinessEntityID
inner join [Sales].[SalesOrderHeader] he 
           on sc.CustomerID = he.CustomerID;

select p.FirstName, e.JobTitle, h.SalesOrderID
from [Sales].[SalesOrderHeader] h 
inner join [Sales].[SalesPerson] sp 
           on h.SalesPersonID = sp.BusinessEntityID
inner join [HumanResources].[Employee] e 
           on sp.BusinessEntityID = e.BusinessEntityID
inner join [Person].[Person] p 
           on e.BusinessEntityID = p.BusinessEntityID;

---------------------------------------------------------
--3

select p.Name as ProductName, c.Name as CategoryName
from [Production].[Product] p
inner join [Production].[ProductSubcategory] s 
           on p.ProductSubcategoryID = s.ProductSubcategoryID
inner join [Production].[ProductCategory] c 
           on s.ProductCategoryID = c.ProductCategoryID;

---------------------------------------------------------
--4

select p.Name as ProductName, m.Name as ProductModerlName
from [Production].[Product] p
join [Production].[ProductModel] m 
     on p.ProductModelID = m.ProductModelID;

---------------------------------------------------------
--5

select p.FirstName, h.OrderDate, sum(h.TotalDue) as TotalSum
from Person.Person p 
join [Sales].[SalesPerson] sp on p.BusinessEntityID = sp.BusinessEntityID
join [Sales].[Customer] c on sp.BusinessEntityID = c.CustomerID
join [Sales].[SalesOrderHeader] h on c.CustomerID = h.CustomerID
group by p.FirstName, h.OrderDate;

select p.FirstName, h.OrderDate, sum(h.TotalDue) as TotalSum
from [Sales].[SalesOrderHeader] h
join [Sales].[SalesPerson] sp on h.SalesPersonID = sp.BusinessEntityID
join Person.Person p on sp.BusinessEntityID = p.BusinessEntityID 
join [Sales].[Customer] c on p.BusinessEntityID = c.CustomerID

group by p.FirstName, h.OrderDate;

---------------------------------------------------------
--6

select p.Name as ProductName, sd.OrderQty as OrderQuantity
from [Production].[Product] p
join [Sales].[SalesOrderDetail] sd 
     on p.ProductID = sd.ProductID;

---------------------------------------------------------
--7

select p.FirstName as EmployeeName, d.Name as DepartamentName
from Person.Person p
join [HumanResources].[Employee] e on p.BusinessEntityID = e.BusinessEntityID
join [HumanResources].[EmployeeDepartmentHistory] edh 
     on e.BusinessEntityID = edh.BusinessEntityID
join [HumanResources].[Department] d 
     on edh.DepartmentID = d.DepartmentID;

---------------------------------------------------------
--8

select e.BusinessEntityID as EmployeeID, p2.FirstName as EmpName, p1.FirstName as ManaegName
from [HumanResources].[Employee] e
join [HumanResources].[Employee] m
     on e.BusinessEntityID = m.BusinessEntityID
join Person.Person p1
     on m.BusinessEntityID = p1.BusinessEntityID
join Person.Person p2
     on e.BusinessEntityID = p2.BusinessEntityID
	 
---------------------------------------------------------
--9

select p.FirstName 
from HumanResources.Employee he
join [Person].[Person] p on he.BusinessEntityID = p.BusinessEntityID
join [Sales].[SalesPerson] sp on p.BusinessEntityID = sp.BusinessEntityID
join (select oh.SalesPersonID, max(count(oh.SalesOrderID)) 
     from [Sales].[SalesOrderHeader] oh
	 group by oh.SalesPersonID
      ) e on sp.BusinessEntityID = e.SalesPersonID

select p.FirstName, Max(sd.OrderQty) as MaxOrder
from HumanResources.Employee he
join [Person].[Person] p on he.BusinessEntityID = p.BusinessEntityID
join [Sales].[SalesPerson] sp on p.BusinessEntityID = sp.BusinessEntityID
join [Sales].[SalesOrderHeader] e on sp.BusinessEntityID = e.SalesPersonID
join [Sales].[SalesOrderDetail] sd on e.SalesOrderID = sd.SalesOrderID
group by p.FirstName


select p.FirstName, sd.OrderQty as MaxOrder
from HumanResources.Employee he
join [Person].[Person] p on he.BusinessEntityID = p.BusinessEntityID
join [Sales].[SalesPerson] sp on p.BusinessEntityID = sp.BusinessEntityID
join [Sales].[SalesOrderHeader] e on sp.BusinessEntityID = e.SalesPersonID
join [Sales].[SalesOrderDetail] sd on e.SalesOrderID = sd.SalesOrderID
where sd.OrderQty = (
      select Max(OrderQty) from [Sales].[SalesOrderDetail]
	  );

---------------------------------------------------------
--10
--My code
select pp.FirstName, count(h.CustomerID) as CustomersQty
from HumanResources.Employee he
join [Person].[Person] pp on he.BusinessEntityID = pp.BusinessEntityID
join [Sales].[SalesPerson] sp on pp.BusinessEntityID = sp.BusinessEntityID
join [Sales].[SalesOrderHeader] h on sp.BusinessEntityID = h.SalesPersonID
group by pp.FirstName;

--Tables are the same but what is the difference(he. - pp.)

--gpts code
select pp.FirstName, count(h.CustomerID) as CustomersQty
from HumanResources.Employee he
join [Person].[Person] pp on he.BusinessEntityID = pp.BusinessEntityID
join [Sales].[SalesPerson] sp on he.BusinessEntityID = sp.BusinessEntityID
join [Sales].[SalesOrderHeader] h on sp.BusinessEntityID = h.SalesPersonID
group by pp.FirstName;

---------------------------------------------------------
--11

select p.Name as ProductName, sd.OrderQty, sd.UnitPrice,
       sum(h.TotalDue) as TotalProffit
from [Production].[Product] p
join [Sales].[SalesOrderDetail] sd 
     on p.ProductID = sd.ProductID
join [Sales].[SalesOrderHeader] h on sd.SalesOrderID = h.SalesOrderID
group by  p.Name, sd.OrderQty, sd.UnitPrice;

---------------------------------------------------------
--12

select pc.Name as CategoryName, p.Name as ProductName, sd.OrderQty, 
       sd.UnitPrice, sum(h.TotalDue) as TotalProffit
from [Sales].[SalesOrderHeader] h 
join [Sales].[SalesOrderDetail] sd 
     on sd.SalesOrderID = h.SalesOrderID
join [Production].[Product] p 
     on sd.ProductID = p.ProductID
join [Production].[ProductSubcategory] psc 
     on p.ProductSubcategoryID = psc.ProductSubcategoryID
join [Production].[ProductCategory] pc 
     on psc.ProductCategoryID = pc.ProductCategoryID

group by  p.Name, sd.OrderQty, sd.UnitPrice, pc.Name;

---------------------------------------------------------
--13
select pp.ProductModelID, pp.Name as ProductName,  m.Name as ModelName, max(m.CountM) as MaxCountM
from [Production].[Product] pp
join ( select pm.Name, pm.ProductModelID, sum(pm.ProductModelID) as CountM 
       from [Production].[ProductModel] pm
	   group by pm.ProductModelID, pm.Name) m 
	   on pp.ProductModelID = m.ProductModelID
where pp.ProductModelID = max(m.CountM)
group by pp.Name, m.Name, pp.ProductModelID;


select top 1 pp.Name as ProductName, m.Name as ModelName, count(pp.ProductID) as Mcount
from [Production].[Product] pp
join Production.ProductModel m on pp.ProductModelID = m.ProductModelID
group by pp.Name, m.Name
order by Mcount desc;

---------------------------------------------------------
--14
select he.SalesOrderID, pp.FirstName, he.OrderDate
from Person.Person pp
join [Sales].[SalesPerson] sp on pp.BusinessEntityID = sp.BusinessEntityID
join [Sales].[SalesOrderHeader] he on sp.BusinessEntityID = he.SalesPersonID
where he.OrderDate like '%2024%';

select he.SalesOrderID, pp.FirstName, he.OrderDate as Date
from Person.Person pp
join [Sales].[SalesPerson] sp on pp.BusinessEntityID = sp.BusinessEntityID
join [Sales].[SalesOrderHeader] he on sp.BusinessEntityID = he.SalesPersonID
where he.OrderDate >= '2024-01-01' and  he.OrderDate <= '2025-01-01';

select he.SalesOrderID, pp.FirstName, (he.OrderDate) as Date
from Person.Person pp
join [Sales].[SalesPerson] sp on pp.BusinessEntityID = sp.BusinessEntityID
join [Sales].[SalesOrderHeader] he on sp.BusinessEntityID = he.SalesPersonID
where year(he.OrderDate) = 2024;

select he.SalesOrderID, pp.FirstName, year(he.OrderDate) as Date
from Person.Person pp
join [Sales].[SalesPerson] sp on pp.BusinessEntityID = sp.BusinessEntityID
join [Sales].[SalesOrderHeader] he on sp.BusinessEntityID = he.SalesPersonID
where year(he.OrderDate) >= '2024-01-01' and  
      year(he.OrderDate) <= '2025-01-01';

---------------------------------------------------------
--15
select pp.FirstName, hd.Name as Department, eh.Rate as Salary
from [Person].[Person] pp
join [HumanResources].[Employee] he 
     on pp.BusinessEntityID = he.BusinessEntityID
join [HumanResources].[EmployeePayHistory] eh 
     on he.BusinessEntityID = eh.BusinessEntityID
join [HumanResources].[EmployeeDepartmentHistory] hh
     on eh.BusinessEntityID = hh.BusinessEntityID
join [HumanResources].[Department] hd 
     on hh.DepartmentID = hd.DepartmentID;
---------------------------------------------------------
--16

select sp.Name, ad.City,  count(sc.CustomerID) as CustomersQty
from [Person].[Address] ad
join [Person].[StateProvince] sp on ad.StateProvinceID = sp.StateProvinceID
join [Sales].[Customer] sc on sp.TerritoryID = sc.TerritoryID
group by sp.Name, ad.City;

---------------------------------------------------------
--18

select pp.Name as ProductName, c.Name as CategoryName, avg(pp.ListPrice) as AvgPrice
from [Production].[Product] pp
join [Production].[ProductSubcategory] sc
     on pp.ProductSubcategoryID = sc.ProductSubcategoryID
join [Production].[ProductCategory] c 
     on sc.ProductCategoryID = c.ProductCategoryID
group by pp.Name, c.Name;

---------------------------------------------------------
--19

select top 5 pp.Name, max(sd.OrderQty) as OrderQty, sum(he.TotalDue) as TotalProffit
from [Production].[Product] pp
join [Sales].[SalesOrderDetail] sd 
     on pp.ProductID = sd.ProductID
join [Sales].[SalesOrderHeader] he
     on sd.SalesOrderID = he.SalesOrderID
group by pp.Name
order by max(sd.OrderQty) desc;

---------------------------------------------------------
--20
select pp.FirstName, e.JobTitle, pd.City , count(sc.CustomerID) as Customers
from [Person].[Address] pd
join [Person].[BusinessEntityAddress] ba on pd.AddressID = ba.AddressID
join [HumanResources].[Employee] e on ba.BusinessEntityID = e.BusinessEntityID
join [Person].[Person] pp on e.BusinessEntityID = pp.BusinessEntityID
join [Sales].[SalesPerson] sp on pp.BusinessEntityID = sp.BusinessEntityID
join [Sales].[Customer] sc on sp.TerritoryID = sc.TerritoryID
join [Sales].[SalesOrderHeader] h on sc.TerritoryID = h.TerritoryID
group by pp.FirstName, e.JobTitle, pd.City


select pp.FirstName, e.JobTitle, pd.City , count(sc.CustomerID) as Customers
from [Person].[Address] pd
join [Person].[BusinessEntityAddress] ba on pd.AddressID = ba.AddressID
join [HumanResources].[Employee] e on ba.BusinessEntityID = e.BusinessEntityID
join [Person].[Person] pp on e.BusinessEntityID = pp.BusinessEntityID
join [Sales].[SalesPerson] sp on pp.BusinessEntityID = sp.BusinessEntityID
join [Sales].[Customer] sc on sp.TerritoryID = sc.TerritoryID
join [Sales].[SalesOrderHeader] h on sc.CustomerID = h.CustomerID
group by pp.FirstName, e.JobTitle, pd.City