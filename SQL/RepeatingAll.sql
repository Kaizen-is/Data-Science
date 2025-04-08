-----------------------------------------------------------------
--08-04-25 14:59
--Advanced Joins           Advanced Joins              Advanced Joins 
--1
Select p.FirstName, h.SalesOrderID
from   [Person].[Person] p
join  [Sales].[Customer] sc on p.BusinessEntityID = sc.PersonID
join[Sales].[SalesOrderHeader] h on sc.CustomerID = h.CustomerID;

-----------------------------------------------------------------
--2

Select h.SalesOrderID, p.FirstName, e.JobTitle
from Sales.SalesPerson sp
join  [HumanResources].[Employee] e on sp.BusinessEntityID = e.BusinessEntityID
join [Person].[Person] p on e.BusinessEntityID = p.BusinessEntityID
join  [Sales].[Customer] sc on p.BusinessEntityID = sc.PersonID
join[Sales].[SalesOrderHeader] h on sc.CustomerID = h.CustomerID

select h.SalesOrderID, p.FirstName, e.JobTitle
from [Sales].[SalesOrderHeader] h
join [Sales].[SalesPerson] s on h.SalesPersonID = s.BusinessEntityID
join [Person].[Person] p on s.BusinessEntityID = p.BusinessEntityID
join [HumanResources].[Employee] e on p.BusinessEntityID = e.BusinessEntityID;

-----------------------------------------------------------------
--3

select pp.Name as PName, pc.Name as CName
from [Production].[Product] pp 
join [Production].[ProductSubcategory] ps 
     on pp.ProductSubcategoryID = ps.ProductSubcategoryID
join [Production].[ProductCategory] pc 
     on ps.ProductCategoryID = pc.ProductCategoryID;

-----------------------------------------------------------------
--4

select pp.Name as ProductName, pm.Name as ModelName
from [Production].[Product] pp
join [Production].[ProductModel] pm 
     on pp.ProductModelID = pm.ProductModelID;

-----------------------------------------------------------------
--5

select p.FirstName as Name, h.OrderDate, sum(h.TotalDue) as TotalSum
from [Sales].[SalesOrderHeader] h 
join [Sales].[SalesPerson] sp 
     on h.SalesPersonID = sp.BusinessEntityID
join [Person].[Person] p 
     on sp.BusinessEntityID = p.BusinessEntityID
join [Sales].[Customer] sc
     on sc.PersonID = p.BusinessEntityID
group by p.FirstName, h.OrderDate;


select p.FirstName as Name, h.OrderDate, sum(h.TotalDue) as TotalSum
from [Sales].[Customer] sc
join [Person].[Person] p 
     on sc.PersonID = p.BusinessEntityID
join [Sales].[SalesPerson] sp 
     on p.BusinessEntityID = sp.BusinessEntityID
join [Sales].[SalesOrderHeader] h 
     on sp.BusinessEntityID = h.SalesPersonID
group by p.FirstName, h.OrderDate;


select p.FirstName as Name, h.OrderDate, sum(h.TotalDue) as TotalSum
from [Sales].[SalesOrderHeader] h 
join [Sales].[SalesPerson] sp 
     on h.SalesPersonID = sp.BusinessEntityID
join [Person].[Person] p 
     on sp.BusinessEntityID = p.BusinessEntityID
join [Sales].[Customer] sc
     on sc.CustomerID = p.BusinessEntityID
group by p.FirstName, h.OrderDate;

-----------------------------------------------------------------
--6

select pp.Name, sd.OrderQty
from [Production].[Product] pp
join [Sales].[SalesOrderDetail] sd 
     on pp.ProductID = sd.ProductID;

-----------------------------------------------------------------
--7

select p.FirstName, e.JobTitle, d.Name as DepartamentName
from [Person].[Person] p
join [HumanResources].[Employee] e
     on p.BusinessEntityID = e.BusinessEntityID
join [HumanResources].[EmployeeDepartmentHistory] dh
     on e.BusinessEntityID = dh.BusinessEntityID
join [HumanResources].[Department] d
     on dh.DepartmentID = d.DepartmentID ;

-----------------------------------------------------------------
--9

select p.FirstName, sd.OrderQty
from [Sales].[SalesOrderDetail] sd
join [Sales].[SalesOrderHeader] h
     on sd.[SalesOrderID] = h.SalesOrderID
join [Sales].[SalesPerson] sp
     on h.SalesPersonID = sp.BusinessEntityID
join [Person].[Person] p
     on sp.BusinessEntityID = p.BusinessEntityID
join [Sales].[Customer] sc
     on p.BusinessEntityID = sc.CustomerID
where sd.OrderQty in (
      select max(OrderQty) from [Sales].[SalesOrderDetail]
					 );

-----------------------------------------------------------------
--10

select p.FirstName, count(h.CustomerID) as CustomerAm
from [HumanResources].[Employee] e
join Person.Person p
     on e.BusinessEntityID = p.BusinessEntityID
join Sales.SalesPerson sp 
     on p.BusinessEntityID = sp.BusinessEntityID
join Sales.SalesOrderHeader h
     on sp.BusinessEntityID = h.SalesPersonID
group by p.FirstName;

-----------------------------------------------------------------
--11

select pp.Name as ProductName, count(sd.OrderQty) as OrderQty,
       sum(h.TotalDue) as TotalProffit          
from [Production].[Product] pp
join Sales.SalesOrderDetail sd
     on pp.ProductID = sd.ProductID
join Sales.SalesOrderHeader h
     on sd.SalesOrderID = h.SalesOrderID
group by pp.Name;
 
-----------------------------------------------------------------
--12

select pp.Name as ProductName, pc.Name as CategoryName, sum(he.TotalDue) as TotalProffit
from [Production].[ProductCategory] pc
join [Production].[ProductSubcategory] ps
     on pc.ProductCategoryID = ps.ProductCategoryID
join [Production].[Product] pp
     on ps.ProductSubcategoryID = pp.ProductSubcategoryID
join [Sales].[SalesOrderDetail] sd
     on pp.ProductID  = sd.ProductID
join [Sales].[SalesOrderHeader] he
     on sd.SalesOrderID = he.SalesOrderID
group by pp.Name, pc.Name;


select pp.Name as ProductName, pc.Name as CategoryName, 
count(sd.OrderQty) as OrderQty, sd.UnitPrice, sum(he.TotalDue) as TotalProffit
from [Production].[ProductCategory] pc
join [Production].[ProductSubcategory] ps
     on pc.ProductCategoryID = ps.ProductCategoryID
join [Production].[Product] pp
     on ps.ProductSubcategoryID = pp.ProductSubcategoryID
join [Sales].[SalesOrderDetail] sd
     on pp.ProductID  = sd.ProductID
join [Sales].[SalesOrderHeader] he
     on sd.SalesOrderID = he.SalesOrderID
group by pp.Name, pc.Name, sd.UnitPrice 
order by count(sd.OrderQty) desc;

-----------------------------------------------------------------
--13

select m.ProductModelID, p.Name, m.Name as ModelName
from [Production].[Product] p
join [Production].[ProductModel] m
     on p.ProductModelID = m.ProductModelID
where m.ProductModelID = (select Name, ProductModelID, count(ProductModelID) as CountModel
      from [Production].[ProductModel]);

select m.ProductModelID, p.Name, m.Name as ModelName, Max(m.CountModel) as MaxMo
from [Production].[Product] p
join (select Name, ProductModelID, sum(ProductModelID) as CountModel
      from [Production].[ProductModel]
	  group by Name, ProductModelID
     ) m on p.ProductModelID = m.ProductModelID
where p.ProductModelID = (
      select max(sum(pm.ProductModelID))
	  from [Production].[ProductModel] pm
group by m.ProductModelID, p.Name, m.Name;


select m.ProductModelID, p.Name, m.Name as ModelName
from [Production].[Product] p
join [Production].[ProductModel] m
	 on p.ProductModelID = m.ProductModelID
where p.ProductModelID = (
      select max(pm.CountModel)
	  from [Production].Product pp
	  join (select s.ProductModelID, sum(s.ProductModelID) as CountModel
      from [Production].[ProductModel] s
	  group by ProductModelID
     ) pm on pp.ProductModelID = pm.ProductModelID
	  )
group by m.ProductModelID, p.Name, m.Name;

-----------------------------------------------------------------
--14

select he.SalesOrderID, pp.FirstName, he.OrderDate
from Person.Person pp
join [Sales].[SalesPerson] sp on pp.BusinessEntityID = sp.BusinessEntityID
join [Sales].[SalesOrderHeader] he on sp.BusinessEntityID = he.SalesPersonID
where he.OrderDate like '%2014%';

-----------------------------------------------------------------
--15

select p.FirstName, d.Name as Departament, ph.Rate
from [HumanResources].[Employee] e
join [HumanResources].[EmployeePayHistory] ph
     on e.BusinessEntityID = ph.BusinessEntityID
join [Person].[Person] p 
     on ph.BusinessEntityID = p.BusinessEntityID
join [HumanResources].[EmployeeDepartmentHistory] edp
     on p.BusinessEntityID = edp.BusinessEntityID
join [HumanResources].[Department] d
     on edp.DepartmentID = d.DepartmentID;

-----------------------------------------------------------------
--16

select pa.City, sp.Name as NameProvince, count(sc.CustomerID) as CustomerAm
from [Person].[Address] pa
join [Person].[StateProvince] sp
     on pa.StateProvinceID = sp.StateProvinceID
join [Sales].[Customer] sc 
     on sp.TerritoryID = sc.TerritoryID
group by pa.City, sp.Name;

-----------------------------------------------------------------
--17

select sd.SalesOrderID, count(sd.ProductID) as TypesProduct
from [Sales].[SalesOrderDetail] sd
group by sd.SalesOrderID
order by sd.SalesOrderID;

-----------------------------------------------------------------
--18

select pp.Name, pc.Name as CategoryName, avg(sd.UnitPrice) as AVGP
from [Production].[ProductCategory] pc
join [Production].[ProductSubcategory] ps
     on pc.ProductCategoryID = ps.ProductCategoryID
join [Production].[Product] pp
     on ps.ProductSubcategoryID = pp.ProductSubcategoryID
join [Sales].[SalesOrderDetail] sd
     on pp.ProductID = sd.ProductID
group by pp.Name, pc.Name;


select pp.Name as ProductName, c.Name as CategoryName, avg(pp.ListPrice) as AvgPrice
from [Production].[Product] pp
join [Production].[ProductSubcategory] sc
     on pp.ProductSubcategoryID = sc.ProductSubcategoryID
join [Production].[ProductCategory] c 
     on sc.ProductCategoryID = c.ProductCategoryID
group by pp.Name, c.Name;

-----------------------------------------------------------------
--19

select top 5 p.Name, max(sd.OrderQty) as OrderQty, sum(he.TotalDue) as TotalProffit
from [Production].[Product] p
join [Sales].[SalesOrderDetail] sd 
     on p.ProductID = sd.ProductID
join [Sales].[SalesOrderHeader] he
     on sd.SalesOrderID = he.SalesOrderID
group by p.Name;

-----------------------------------------------------------------
--20

select pp.FirstName, e.JobTitle, pd.City , count(sc.CustomerID) as Customers
from [Person].[Address] pd
join [Person].[BusinessEntityAddress] ba on pd.AddressID = ba.AddressID
join [HumanResources].[Employee] e on ba.BusinessEntityID = e.BusinessEntityID
join [Person].[Person] pp on e.BusinessEntityID = pp.BusinessEntityID
join [Sales].[SalesPerson] sp on pp.BusinessEntityID = sp.BusinessEntityID
join [Sales].[Customer] sc on sp.TerritoryID = sc.TerritoryID
join [Sales].[SalesOrderHeader] h on sc.CustomerID = h.CustomerID
group by pp.FirstName, e.JobTitle, pd.City;

-----------------------------------------------------------------
--Subquery                    Subquery                           Subquery
--17:47

--1
select pp.Name, pp.ListPrice
from [Production].[Product] pp
where pp.ListPrice = (
      select max(p.ListPrice) 
	  from Production.Product p);

-----------------------------------------------------------------
--2

select pp.Name, pp.ListPrice
from [Production].[Product] pp
where pp.ListPrice > (
      select avg(p.ListPrice) 
	  from Production.Product p);

-----------------------------------------------------------------
--3

select pp.ProductID, pp.Name
from Production.Product pp
join [Sales].[SalesOrderDetail] sd
     on pp.ProductID = sd.ProductID
where sd.OrderQty in (
      select s.OrderQty
      from [Sales].[SalesOrderDetail] s
	  where s.OrderQty = 0);

select pp.ProductID, pp.Name
from Production.Product pp
where  pp.ProductID not in (
      select s.ProductID
      from [Sales].[SalesOrderDetail] s);

-----------------------------------------------------------------
--4

select pp.Name, pp.Weight, avg(pp.Weight) as AVGW
from [Production].[Product] pp
where pp.Weight > (select avg(Weight) from [Production].[Product])
group by  pp.Name, pp.Weight;

-----------------------------------------------------------------
--5

select pp.Name, (select max(ListPrice) from Production.Product)
from Production.Product pp;

-----------------------------------------------------------------
--6

select pp.Name, max(sd.UnitPrice) as MaxPrice
from Production.Product pp
join [Sales].[SalesOrderDetail] sd
     on pp.ProductID = sd.ProductID
group by pp.Name;

-----------------------------------------------------------------
--8

select pp.ProductID, pp.Name, sd.OrderQty
from [Production].[Product] pp
join [Sales].[SalesOrderDetail] sd
     on pp.ProductID = sd.ProductID
where sd.OrderQty = (select min(OrderQty) from Sales.SalesOrderDetail);


--7

select pp.Name, pi.Quantity
from [Production].[Product] pp
join [Production].[ProductInventory] pi
     on pp.ProductID = pi.ProductID

select pp.ProductID, pp.Name
from [Production].[Product] pp
where pp.ProductID not in (select ProductID from [Production].[ProductInventory])

-----------------------------------------------------------------
--9

select ps.ProductSubcategoryID, ps.Name as SubName, pp.ListPrice
from [Production].[Product] pp
join [Production].[ProductSubcategory] ps
     on pp.ProductSubcategoryID = ps.ProductSubcategoryID
join [Production].[ProductCategory] pc
     on ps.ProductCategoryID = pc.ProductCategoryID;


select ps.ProductSubcategoryID, ps.Name as SubName
from (select ProductID, ProductSubcategoryID, avg(ListPrice) as AvgPr
     from [Production].[Product]
	 group by ProductID, ProductSubcategoryID) pp
join [Production].[ProductSubcategory] ps
     on pp.ProductSubcategoryID = ps.ProductSubcategoryID
join [Production].[ProductCategory] pc
     on ps.ProductCategoryID = pc.ProductCategoryID
where min(pp.AvgPr) = (Select avg(ListPrice) from [Production].[Product]);
   


select ps.ProductSubcategoryID, ps.Name as SubName
from (select ProductID, ProductSubcategoryID, avg(ListPrice) as AvgPr
     from [Production].[Product]
	 group by ProductID, ProductSubcategoryID) pp
join [Production].[ProductSubcategory] ps
     on pp.ProductSubcategoryID = ps.ProductSubcategoryID
join [Production].[ProductCategory] pc
     on ps.ProductCategoryID = pc.ProductCategoryID
where pp.AvgPr = (select min(pp.AvgPr) from [Production].[Product]);



select ps.ProductSubcategoryID, ps.Name as SubName, avg(pp.ListPrice) as AvgPr
from [Production].[Product] pp
join [Production].[ProductSubcategory] ps
     on pp.ProductSubcategoryID = ps.ProductSubcategoryID
join [Production].[ProductCategory] pc
     on ps.ProductCategoryID = pc.ProductCategoryID
group by  ps.ProductSubcategoryID, ps.Name
having avg(pp.ListPrice) = (select min(avg(ListPrice)) from [Production].[Product] pp)


select ps.ProductSubcategoryID, ps.Name as SubName, avg(pp.ListPrice) as AvgPr
from (select ProductID, ProductSubcategoryID, ListPrice, avg(ListPrice) as AvgPr
     from [Production].[Product]
	 group by ProductID, ProductSubcategoryID, ListPrice) pp
join [Production].[ProductSubcategory] ps
     on pp.ProductSubcategoryID = ps.ProductSubcategoryID
join [Production].[ProductCategory] pc
     on ps.ProductCategoryID = pc.ProductCategoryID
group by  ps.ProductSubcategoryID, ps.Name
Having avg(pp.ListPrice) = (select min(pp.AvgPr) from [Production].[Product]);



select ps.ProductSubcategoryID, ps.Name as SubName, avg(pp.ListPrice) as AvgPri
from (select ProductID, ProductSubcategoryID, ListPrice, avg(ListPrice) as AvgPr
     from [Production].[Product]
	 group by ProductID, ProductSubcategoryID, ListPrice) pp
join [Production].[ProductSubcategory] ps
     on pp.ProductSubcategoryID = ps.ProductSubcategoryID
join [Production].[ProductCategory] pc
     on ps.ProductCategoryID = pc.ProductCategoryID
group by  ps.ProductSubcategoryID, ps.Name
Having pp.AvgPr = (select min(pp.AvgPr) from [Production].[Product]);

-----------------------------------------------------------------
--10
select pp.Name, sd.OrderQty
from Production.Product pp
join sales.SalesOrderDetail sd
     on pp.ProductID = sd.ProductID
where sd.OrderQty >= (select sum(OrderQty) 
                      from Production.Product p
					  join  sales.SalesOrderDetail d on p.ProductID = d.ProductID
					  where p.ProductID = d.ProductID)

select pp.Name, sd.OrderQty
from Production.Product pp
join sales.SalesOrderDetail sd
     on pp.ProductID = sd.ProductID
where sd.OrderQty >= (select d.ProductID, sum(OrderQty) 
                      from sales.SalesOrderDetail d 
					  group by d.ProductID
					  having sum(d.OrderQty) >= 5); 

select pp.Name, sd.OrderQty
from Production.Product pp
join sales.SalesOrderDetail sd
     on pp.ProductID = sd.ProductID
where sd.ProductID in (select d.ProductID 
					  from sales.SalesOrderDetail d 
					  group by d.ProductID
					  having sum(d.OrderQty) >= 5);
-
----------------------------------------------------------------
--11
select  pp.ProductID, pp.AvgPrice
from (select [ProductID], avg([ListPrice]) as AvgPrice from Production.Product
      group by [ProductID]) pp
join [Sales].[SalesOrderDetail] sd
     on pp.ProductID = sd.ProductID;

select  pp.ProductID, pp.Name, sd.AvgPrice
from (select ProductID, avg(UnitPrice) as AvgPrice from [Sales].[SalesOrderDetail]
      group by ProductID) sd
join Production.Product pp
     on sd.ProductID = pp.ProductID
----------------------------------------------------------------
--12

select p.FirstName, sum(sd.UnitPrice) as SumPrice
from Person.Person p
join [Sales].[Customer] sc
     on p.BusinessEntityID = sc.PersonID
join [Sales].[SalesOrderHeader] he
     on sc.CustomerID = he.CustomerID
join [Sales].[SalesOrderDetail] sd
     on he.SalesOrderID = he.SalesOrderID
group by p.FirstName;

----------------------------------------------------------------
--13
select pp.ProductID, pp.Name
from Production.Product pp
where pp.ProductID not in (select ProductID from [Production].[ProductInventory]);

----------------------------------------------------------------
--14
select p.FirstName, d.Name as DepName
from Person.Person p
join [HumanResources].[Employee] e
 on p.BusinessEntityID = e.BusinessEntityID
join [HumanResources].[EmployeePayHistory] ph
 on e.BusinessEntityID = ph.BusinessEntityID
join [HumanResources].[EmployeeDepartmentHistory] h
 on e.BusinessEntityID = h.BusinessEntityID
join [HumanResources].[Department] d
 on h.DepartmentID = d.DepartmentID
where ph.Rate = (select max(h2.Rate) 
                 from [HumanResources].[EmployeePayHistory] h2
				 join [HumanResources].[EmployeeDepartmentHistory] d
				  on h.BusinessEntityID = d.BusinessEntityID
				 where d.DepartmentID = h.DepartmentID );
----------------------------------------------------------------
--15
select h.SalesOrderID, h.TotalDue, sum(h.TotalDue) as TotalDueSum
from (select  SalesOrderID, sum(TotalDue) as TotalDue 
      from [Sales].[SalesOrderHeader]
	  group by SalesOrderID) h
group by h.SalesOrderID, h.TotalDue
having h.TotalDue = (select max(h.TotalDue) from [Sales].[SalesOrderHeader])

select ss.TotalDue
from [Sales].[SalesOrderHeader] ss
where ss.TotalDue = (
      select max(sh.TotalDue) from [Sales].[SalesOrderHeader] sh
	  );

----------------------------------------------------------------
--16
select h.CustomerID, h.DueDate
from [Sales].[SalesOrderHeader] h
order by h.DueDate desc;

select h.CustomerID, max(h.DueDate) as LastOrder
from [Sales].[SalesOrderHeader] h
group by h.CustomerID;

----------------------------------------------------------------
--17
select pp.ProductID, pp.Name, sd.ModifiedDate
from [Production].[Product] pp
join [Sales].[SalesOrderDetail] sd on pp.ProductID = sd.ProductID
where sd.ProductID not in (select Quantity
      from [Production].[ProductInventory]  
	  where Quantity > 0);
----------------------------------------------------------------
--18
select pp.ProductID, pc.Name as CategoryName
from Production.Product pp
join Production.ProductSubcategory ps
 on pp.ProductSubcategoryID = ps.ProductSubcategoryID
join Production.ProductCategory pc
 on ps.ProductCategoryID = pc.ProductCategoryID
where pp.ProductID not in (select ProductID from [Sales].[SalesOrderDetail]
                           where OrderQty > 0);

----------------------------------------------------------------
--19
select top 3 pc.ProductCategoryID, pc.Name as Cname, count(ps.ProductSubcategoryID) as Scount 
from [Production].[ProductSubcategory] ps
join [Production].[ProductCategory] pc
     on ps.ProductCategoryID = pc.ProductCategoryID
group by  pc.ProductCategoryID, pc.Name
order by count(ps.ProductSubcategoryID) desc;

----------------------------------------------------------------
--20
select pp.Name, min(sd.ModifiedDate) as FirstSale
from Production.Product pp
join [Sales].[SalesOrderDetail] sd
 on pp.ProductID = sd.ProductID
group by pp.Name;
----------------------------------------------------------------
--21

select h.CustomerID, h.TotalDue
from [Sales].[SalesOrderHeader] h
where h.TotalDue = (select max(TotalDue) 
                    from [Sales].[SalesOrderHeader] 
                       where h.CustomerID = CustomerID);
----------------------------------------------------------------
--22
select e.JobTitle, ph.Rate, avg(ph.Rate) as AVGS
from [HumanResources].[Employee] e
join [HumanResources].[EmployeePayHistory] ph
 on e.BusinessEntityID = ph.BusinessEntityID
group by e.JobTitle, ph.Rate
Having ph.Rate > (select avg(Rate) from [HumanResources].[EmployeePayHistory]);

----------------------------------------------------------------
--23

select c.Name as CategoryName, s.Name as SubCategoryName
from Production.ProductCategory c
join [Production].[ProductSubcategory] s on c.[ProductCategoryID] = s.[ProductCategoryID]
join (select p.[ProductSubcategoryID], avg(p.ListPrice) as AveragePrice
      from [Production].[Product] p
	  group by p.[ProductSubcategoryID]) p on c.ProductCategoryID = p.[ProductSubcategoryID]
where p.AveragePrice < (
      select pp.ListPrice
	  from [Production].[Product] pp
	  join [Production].[ProductCategory] c 
	  on pp.[ProductSubcategoryID] = c.[ProductCategoryID]
	  );

select pp.Name as CategoryName, s.Name as SubCategory, pp.ListPrice
from [Production].[Product] pp
join [Production].[ProductCategory] c 
on pp.[ProductSubcategoryID] = c.[ProductCategoryID]
where pp.ListPrice > (
      select c.Name, s.Name 
      from Production.ProductCategory c
      join [Production].[ProductSubcategory] s on c.[ProductCategoryID] = s.[ProductCategoryID]
      join (select p.[ProductSubcategoryID], avg(p.ListPrice) as AveragePric
	        from [Production].[Product] p
	        group by p.[ProductSubcategoryID]) p on c.[ProductSubcategoryID] = p.[ProductSubcategoryID]
	  );

select pc.Name as CategoryName, ps.Name as SubCategoryName, avg(pp.ListPrice) as AVGP
from (select ProductSubcategoryID, ProductID, ListPrice, avg(ListPrice) as AVGP 
      from Production.Product
	  group by ProductSubcategoryID, ProductID, ListPrice)pp
join [Production].[ProductSubcategory] ps
 on pp.ProductSubcategoryID = ps.ProductSubcategoryID
join [Production].[ProductCategory] pc
 on ps.ProductCategoryID = ps.ProductCategoryID
group by pc.Name,  ps.Name
Having avg(pp.ListPrice) = (select max(pp.AVGP) from Production.Product)

select pc.name as CategoryName, ps.name as SubCategoryName, avg(p.listprice) as AVGP
from Production.product p
join Production.ProductSubcategory ps 
    on p.ProductSubcategoryID = ps.ProductSubcategoryID
join Production.ProductCategory pc 
    on ps.ProductCategoryID = pc.ProductCategoryID
group by pc.name, ps.name
having avg(p.listprice) = (
    select max(avgprice) 
    from (select avg(p2.listprice) as avgprice
          from production.product p2
          join production.productsubcategory ps2 
            on p2.productsubcategoryid = ps2.productsubcategoryid
          join production.productcategory pc2 
            on ps2.productcategoryid = pc2.productcategoryid
          group by pc2.name, ps2.name) as sub);
----------------------------------------------------------------
--24
select h.CustomerID, avg(h.TotalDue) as TotalSales
from [Sales].[SalesOrderHeader] h
group by h.CustomerID
having avg(h.TotalDue) > 1000;
----------------------------------------------------------------
--25
select pp.[ProductSubcategoryID], pp.Name as ProductName,
       ps.Name as SubCategoryName, sum(sd.OrderQty)
from Sales.SalesOrderDetail  sd 
join [Production].[Product] pp on sd.ProductID = pp.ProductID
join [Production].[ProductSubcategory] ps on pp.ProductSubcategoryID = ps.ProductSubcategoryID
group by pp.[ProductSubcategoryID], pp.Name, ps.Name 
having pp.[ProductSubcategoryID] in (
       select max(d.OrderQty), s.ProductSubcategoryID 
	   from [Sales].[SalesOrderDetail] d
	   join [Production].[Product] p on d.ProductID = pp.ProductID
       join [Production].[ProductSubcategory] s on p.ProductSubcategoryID = s.ProductSubcategoryID
       group by s.ProductSubcategoryID);


select pp.[ProductSubcategoryID], pp.Name as ProductName,
       ps.Name as SubCategoryName, sum(sd.OrderQty) as SumOrder
from Sales.SalesOrderDetail  sd 
join [Production].[Product] pp on sd.ProductID = pp.ProductID
join [Production].[ProductSubcategory] ps on pp.ProductSubcategoryID = ps.ProductSubcategoryID
where ps.[ProductSubcategoryID] in (
      select max(s.OrderQty),  p.ProductID
	  from [Sales].[SalesOrderDetail] s
	  join [Production].[Product] p on s.ProductID = p.ProductID
	  group by p.ProductID);

----------------------------------------------------------------
--26
select pp.ProductID, pp.Name, ( select max(OrderQty * UnitPrice) 
                                from [Sales].[SalesOrderDetail])
from [Production].[Product] pp
join [Sales].[SalesOrderDetail] d on pp.ProductID =  d.ProductID
     
select pp.ProductID, pp.Name, max(d.SumProffit) as MostProffitable
from [Production].[Product] pp
join  (select sum(s.OrderQty * s.UnitPrice) as SumProffit, p.ProductID
	  from Sales.SalesOrderDetail s
	  join [Production].[Product] p on p.ProductID =  s.ProductID
	  group by p.ProductID ) d on pp.ProductID =  d.ProductID
group by pp.ProductID, pp.Name
----------------------------------------------------------------
--Unions and Set Operations             Unions and Set Operations             Unions and Set Operations
--1
select p.FirstName
from [Person].[Person] p
union
select p.FirstName
from [Person].[Person] p
join [Sales].[Customer] sc
 on p.BusinessEntityID =sc.PersonID

select p.FirstName
from [Person].[Person] p
union all
select p.FirstName
from [Person].[Person] p
join [Sales].[Customer] sc
 on p.BusinessEntityID =sc.PersonID
----------------------------------------------------------------
--2
select p.FirstName
from [Person].[Person] p
join [HumanResources].[Employee] e
 on p.BusinessEntityID = e.BusinessEntityID
intersect
select p.FirstName
from [Person].[Person] p
join [Sales].[Customer] sc
 on p.BusinessEntityID =sc.PersonID
 ----------------------------------------------------------------
 --3
 select p.FirstName
from [Person].[Person] p
join [HumanResources].[Employee] e
 on p.BusinessEntityID = e.BusinessEntityID
except
select p.FirstName
from [Person].[Person] p
join [Sales].[Customer] sc
 on p.BusinessEntityID =sc.PersonID
 ----------------------------------------------------------------
 --4
select p.FirstName
from [Person].[Person] p
union
select p.FirstName
from [Person].[Person] p
join [HumanResources].[Employee] e
 on p.BusinessEntityID = e.BusinessEntityID

select p.FirstName
from [Person].[Person] p
union all
select p.FirstName
from [Person].[Person] p
join [HumanResources].[Employee] e
 on p.BusinessEntityID = e.BusinessEntityID

select p.FirstName
from [Person].[Person] p
intersect
select p.FirstName
from [Person].[Person] p
join [HumanResources].[Employee] e
 on p.BusinessEntityID = e.BusinessEntityID

select p.FirstName
from [Person].[Person] p
except
select p.FirstName
from [Person].[Person] p
join [HumanResources].[Employee] e
 on p.BusinessEntityID = e.BusinessEntityID
----------------------------------------------------------------
--NEW WAY             NEW WAY             NEW WAY              NEW WAY
--1
select p.FirstName
from [Person].[Person] p
union
select p.FirstName
from [Person].[Person] p
join [Sales].[Customer] sc
 on p.BusinessEntityID =sc.PersonID
----------------------------------------------------------------
--2
select p.FirstName
from [Person].[Person] p
union all
select p.FirstName
from [Person].[Person] p
join [Sales].[Customer] sc
 on p.BusinessEntityID =sc.PersonID
 ----------------------------------------------------------------
 --3
select p.FirstName
from [Person].[Person] p
join [HumanResources].[Employee] e
 on p.BusinessEntityID = e.BusinessEntityID
intersect
select p.FirstName
from [Person].[Person] p
join [Sales].[Customer] sc
 on p.BusinessEntityID =sc.PersonID
----------------------------------------------------------------
--4
select p.FirstName
from [Person].[Person] p
join [HumanResources].[Employee] e
 on p.BusinessEntityID = e.BusinessEntityID
except
select p.FirstName
from [Person].[Person] p
join [Sales].[Customer] sc
 on p.BusinessEntityID =sc.PersonID
----------------------------------------------------------------
--5
select p.FirstName
from [Person].[Person] p
join [Sales].[Customer] sc
 on p.BusinessEntityID =sc.PersonID
except
select p.FirstName
from [Person].[Person] p
join [HumanResources].[Employee] e
 on p.BusinessEntityID = e.BusinessEntityID
----------------------------------------------------------------
--6
select p.FirstName
from [Person].[Person] p
join [HumanResources].[Employee] e
 on p.BusinessEntityID = e.BusinessEntityID
union
select p.FirstName
from [Person].[Person] p
join [Sales].[Customer] sc
 on p.BusinessEntityID =sc.PersonID
order by p.FirstName
----------------------------------------------------------------
--7
select p.FirstName
from [Person].[Person] p
join [HumanResources].[Employee] e
 on p.BusinessEntityID = e.BusinessEntityID
where len(p.FirstName) > 5
union
select p.FirstName
from [Person].[Person] p
join [Sales].[Customer] sc
 on p.BusinessEntityID =sc.PersonID
where len(p.FirstName) > 5
----------------------------------------------------------------
--8
select pp.LastName
from [Person].[Person] pp
join [HumanResources].[Employee] e
on pp.BusinessEntityID = e.BusinessEntityID
intersect
select pp.LastName
from [Person].[Person] pp
join [Sales].[SalesPerson] s
on pp.BusinessEntityID = s.BusinessEntityID
----------------------------------------------------------------
--9
select e.BusinessEntityID
from [Person].[Person] pp
join [HumanResources].[Employee] e
on pp.BusinessEntityID = e.BusinessEntityID
except
select s.BusinessEntityID
from [Person].[Person] pp
join [Sales].[SalesPerson] s
on pp.BusinessEntityID = s.BusinessEntityID

select pp.LastName
from [Person].[Person] pp
join [Sales].[SalesPerson] s
on pp.BusinessEntityID = s.BusinessEntityID
except
select pp.LastName
from [Person].[Person] pp
join [HumanResources].[Employee] e
on pp.BusinessEntityID = e.BusinessEntityID
----------------------------------------------------------------
--10
select pp.BusinessEntityID, count('John') as Jc
from [Person].[Person] pp
join [Sales].[SalesPerson] s
on pp.BusinessEntityID = s.BusinessEntityID
group by pp.BusinessEntityID
union all
select pp.BusinessEntityID, count('John') as Jc
from [Person].[Person] pp
join [HumanResources].[Employee] e
on pp.BusinessEntityID = e.BusinessEntityID
group by pp.BusinessEntityID
----------------------------------------------------------------
--11
select pp.Name
from [Production].[Product] pp
union 
select m.Name
from [Production].[ProductModel] m
----------------------------------------------------------------
--12
select pp.Name
from [Production].[Product] pp
intersect
select m.Name
from [Production].[ProductModel] m
----------------------------------------------------------------
--13
select m.Name
from [Production].[ProductModel] m
except
select pp.Name
from [Production].[Product] pp
----------------------------------------------------------------
--14
select p.FirstName
from [Person].[Person] p
join [HumanResources].[Employee] e
 on p.BusinessEntityID = e.BusinessEntityID
where p.FirstName like '%A'
union
select p.FirstName
from [Person].[Person] p
join [Sales].[Customer] sc
 on p.BusinessEntityID =sc.PersonID
 where p.FirstName like '%A'
----------------------------------------------------------------
--15
select distinct p.FirstName
from [Person].[Person] p
join [HumanResources].[Employee] e
 on p.BusinessEntityID = e.BusinessEntityID
where p.FirstName like '%A'
union
select distinct p.FirstName
from [Person].[Person] p
join [Sales].[Customer] sc
 on p.BusinessEntityID =sc.PersonID
 where p.FirstName like '%A'
----------------------------------------------------------------
--16
select pp.LastName
from [Person].[Person] pp
join [Sales].[SalesPerson] s
on pp.BusinessEntityID = s.BusinessEntityID
where len(pp.LastName) > 6
intersect
select pp.LastName
from [Person].[Person] pp
join [HumanResources].[Employee] e
on pp.BusinessEntityID = e.BusinessEntityID
where len(pp.LastName) > 6
----------------------------------------------------------------
--17
select  p.FirstName
from [Person].[Person] p
join [Sales].[Customer] sc
on p.BusinessEntityID =sc.PersonID
where p.BusinessEntityID < 10000
except
select p.FirstName
from [Person].[Person] p
join [HumanResources].[Employee] e
on p.BusinessEntityID = e.BusinessEntityID
----------------------------------------------------------------
--18
select p.FirstName ,substring(p.FirstName, 1, 1) as ABS
from [Person].[Person] p
join [Sales].[Customer] sc
on p.BusinessEntityID =sc.PersonID
group by p.FirstName
union
select p.FirstName, substring(p.FirstName, 1, 1) as ABS
from [Person].[Person] p
join [HumanResources].[Employee] e
on p.BusinessEntityID = e.BusinessEntityID
group by p.FirstName
order by p.FirstName
----------------------------------------------------------------
--19
select  p.FirstName, count(p.FirstName) as Times
from [Person].[Person] p
join [Sales].[Customer] sc
on p.BusinessEntityID =sc.PersonID
group by p.FirstName
union all
select p.FirstName, count(p.FirstName) as Times
from [Person].[Person] p
join [HumanResources].[Employee] e
on p.BusinessEntityID = e.BusinessEntityID
group by p.FirstName
----------------------------------------------------------------
--String Functions                   String Functions               String Functions
--1
select p.BusinessEntityID, max(len(p.FirstName)) as Len
from [Person].[Person] p
join [HumanResources].[Employee] e
on p.BusinessEntityID = e.BusinessEntityID
group by p.BusinessEntityID
order by max(len(p.FirstName)) desc;
----------------------------------------------------------------
--2
select p.BusinessEntityID, right(p.FirstName, 3) as RLetters, left(p.FirstName, 3) as LLetters
from [Person].[Person] p
join [HumanResources].[Employee] e
on p.BusinessEntityID = e.BusinessEntityID
----------------------------------------------------------------
--3
select p.BusinessEntityID, substring(p.FirstName, 2, 4) as Name
from [Person].[Person] p
join [HumanResources].[Employee] e
on p.BusinessEntityID = e.BusinessEntityID
----------------------------------------------------------------
--4
select p.BusinessEntityID, charindex( 'A', p.FirstName) as Name
from [Person].[Person] p
join [HumanResources].[Employee] e
on p.BusinessEntityID = e.BusinessEntityID
----------------------------------------------------------------
--5
select p.FirstName, patindex( '%son%', p.FirstName) as Name
from [Person].[Person] p
join [HumanResources].[Employee] e
on p.BusinessEntityID = e.BusinessEntityID
order by patindex('%son%', p.FirstName) desc;  
----------------------------------------------------------------
--Advanced join                   Advanced join                 Advanced join 
--21:56
select p.FirstName, max(h.TotalDue) as MaxSales, sum(h.TotalDue) as SumSales
from [Person].[Person] p
inner join [Sales].[Customer] sc
on p.BusinessEntityID = sc.CustomerID
inner join [Sales].[SalesOrderHeader] h
on sc.CustomerID = h.CustomerID
group by p.FirstName
----------------------------------------------------------------
--2
select p.Name, year(sd.ModifiedDate) as year , sum(sd.OrderQty) as SumSales
from [Production].[Product] p
inner join [Sales].[SalesOrderDetail] sd
on p.ProductID = sd.ProductID
where year(sd.ModifiedDate) = 2014
group by p.Name, sd.ModifiedDate
----------------------------------------------------------------
--3
select p.FirstName, count(sd.OrderQty) as SalesCount
from [HumanResources].[Employee] e
inner join [Person].[Person] p
on e.BusinessEntityID = p.BusinessEntityID
inner join [Sales].[SalesPerson] sp
on p.BusinessEntityID = sp.BusinessEntityID
inner join [Sales].[SalesOrderHeader] he
on sp.BusinessEntityID = he.SalesPersonID
inner join [Sales].[SalesOrderDetail] sd
on he.SalesOrderID = sd.SalesOrderID
group by p.FirstName
having isnull(count(sd.OrderQty), 0)

select p.FirstName, isnull(count(sd.OrderQty), 0) as SalesCount
from [HumanResources].[Employee] e
inner join [Person].[Person] p
on e.BusinessEntityID = p.BusinessEntityID
inner join [Sales].[SalesPerson] sp
on p.BusinessEntityID = sp.BusinessEntityID
inner join [Sales].[SalesOrderHeader] he
on sp.BusinessEntityID = he.SalesPersonID
inner join [Sales].[SalesOrderDetail] sd
on he.SalesOrderID = sd.SalesOrderID
group by p.FirstName
----------------------------------------------------------------
--4
select pp.ProductID, pp.Name, pc.Name as CatrgoryName
from Production.Product pp
inner join Production.ProductSubcategory ps
on pp.ProductSubcategoryID = ps.ProductSubcategoryID
inner join Production.ProductCategory pc
on ps.ProductCategoryID = pc.ProductCategoryID
where pp.ProductID not in 

select pp.ProductID, pp.Name, pc.Name as CatrgoryName
from Production.Product pp
left join Production.ProductSubcategory ps
on pp.ProductSubcategoryID = ps.ProductSubcategoryID
left join Production.ProductCategory pc
on ps.ProductCategoryID = pc.ProductCategoryID
where pc.ProductCategoryID is null
----------------------------------------------------------------
--1
     
select pp.ProductID, pp.Name, pc.Name as CatrgoryName
from Production.Product pp
right join Production.ProductSubcategory ps
on pp.ProductSubcategoryID = ps.ProductSubcategoryID
right join Production.ProductCategory pc
on ps.ProductCategoryID = pc.ProductCategoryID
where pc.ProductCategoryID is null
----------------------------------------------------------------
--2
select p.Name, isnull(p.ProductID, 0) as Products
from [Sales].[SalesOrderDetail] sd
right join [Production].[Product] p
on sd.ProductID = p.ProductID
----------------------------------------------------------------
--3
select p.FirstName
from Person.Person p
right join Sales.Customer sc
on p.BusinessEntityID = sc.PersonID
right join [Sales].[SalesOrderHeader] he
on sc.CustomerID = he.CustomerID
where sc.CustomerID not in (select CustomerID from [Sales].[SalesOrderHeader])

select p.FirstName
from Person.Person p
right join Sales.Customer sc
on p.BusinessEntityID = sc.PersonID
right join [Sales].[SalesOrderHeader] he
on sc.CustomerID = he.CustomerID
where he.SalesOrderID is null

select p.FirstName, p.LastName, sc.CustomerID
from Sales.Customer sc
left join Sales.SalesOrderHeader he on sc.CustomerID = he.CustomerID
left join Person.Person p on sc.PersonID = p.BusinessEntityID
where he.SalesOrderID is null;
----------------------------------------------------------------
--4
select p.FirstName, e.JobTitle
from [Sales].[SalesOrderHeader] he
right join [Sales].[SalesPerson] sp
on he.SalesPersonID = sp.BusinessEntityID
right join [Person].[Person] p
on sp.BusinessEntityID = p.BusinessEntityID
right join [HumanResources].[Employee] e
on p.BusinessEntityID = e.BusinessEntityID
where he.SalesOrderID is null
----------------------------------------------------------------
--1
select p.FirstName, c.CustomerID, count(*) as Potensials
from [Person].[Person] p
cross join [Sales].[Customer] c
group by p.FirstName, c.CustomerID
----------------------------------------------------------------
--2
select count(*) as Combinations
from [Production].[Product] p
cross join [Production].[ProductCategory] pc
----------------------------------------------------------------
--3
select count(*) as Comb
from [HumanResources].[Employee]
cross join [Sales].[SalesTerritory]
----------------------------------------------------------------
--4
select count(*) as Comb
from [Sales].[Customer]
cross join [Sales].[SalesPerson]
----------------------------------------------------------------
--2
select p.Name as Product, p1.Name as SameP, p.Color 
from Production.Product p
join Production.Product p1 on p.Color = p1.Color
----------------------------------------------------------------
--3
select sc.CustomerID, he.OrderDate, he.ModifiedDate
from [Sales].[Customer] sc
join [Sales].[SalesOrderHeader] he
on sc.CustomerID = he.CustomerID
----------------------------------------------------------------
--4
select p1.Name, p2.Name as Samples, p1.ListPrice
from Production.Product p1
join Production.Product p2 
on p1.ListPrice = p2.ListPrice
order by p1.ListPrice desc;
----------------------------------------------------------------
--Inner Join                   Inner Join                    Inner Join
--23:14
--1
select *
from Production.Product p
inner join Sales.SalesOrderDetail sd
on p.ProductID = sd.ProductID
----------------------------------------------------------------
--2
select pp.FirstName, em.JobTitle, sum(he.TotalDue) as TotalSales
from [Sales].[SalesOrderHeader] he
inner join [Sales].[SalesPerson] sp
on he.SalesPersonID = sp.BusinessEntityID 
inner join [Person].[Person] pp
on sp.BusinessEntityID = pp.BusinessEntityID
inner join [HumanResources].[Employee] em
on pp.BusinessEntityID = em.BusinessEntityID
group by  pp.FirstName, em.JobTitle
----------------------------------------------------------------
--3
select pp.Name, pc.Name as CategoryName, sum(sd.UnitPrice) as TotalSales
from [Sales].[SalesOrderDetail] sd
inner join Production.Product PP
on sd.ProductID = pp.ProductID
inner join Production.ProductSubcategory ps
on pp.ProductSubcategoryID = ps.ProductSubcategoryID
inner join Production.ProductCategory pc
on ps.ProductCategoryID = pc.ProductCategoryID
group by pp.Name, pc.Name;
----------------------------------------------------------------
--4
select p.FirstName, max(he.OrderDate) as RecentOrd
from Person.Person p
inner join Sales.Customer sc
on p.BusinessEntityID = sc.CustomerID
inner join [Sales].[SalesOrderHeader] he
on sc.CustomerID = he.CustomerID
group by p.FirstName
----------------------------------------------------------------
--5
select *
from [Production].[Product] pp
inner join [Production].[ProductCostHistory] ch
on pp.ProductID = ch.ProductID
inner join [Production].[ProductListPriceHistory] lh
on ch.ProductID = lh.ProductID
----------------------------------------------------------------
--Aggregate Functions             Aggregate Functions            Aggregate Functions
--23:31
--1
select Color, count(Color) as CountC
from [Production].[Product]
group by Color
----------------------------------------------------------------
--2
select Color, avg(ListPrice) as AVGP
from [Production].[Product]
group by Color 
----------------------------------------------------------------
--3
select Color, max(ListPrice) as MAXP
from [Production].[Product]
group by Color 
----------------------------------------------------------------
--4
select Size, count(Color) as SizeC
from [Production].[Product]
group by Size
----------------------------------------------------------------
--5
select MakeFlag, sum(ListPrice) as SUMP
from [Production].[Product]
group by MakeFlag
----------------------------------------------------------------
--6
select [SafetyStockLevel], count(Color) as SAFYC
from [Production].[Product]
group by [SafetyStockLevel]
----------------------------------------------------------------
--7
select [ProductLine], min(ListPrice) as MINP
from [Production].[Product]
group by [ProductLine]
----------------------------------------------------------------
--8
select Color, count(Color) as ProductCount
from [Production].[Product]
group by Color
order by ProductCount
----------------------------------------------------------------
--9
select [ProductSubcategoryID], count(*) as SUBC
from [Production].[ProductSubcategory]
group by [ProductSubcategoryID]
order by SUBC desc
----------------------------------------------------------------
--10
select ListPrice, count(*) as PCount
from [Production].[Product]
group by ListPrice
----------------------------------------------------------------
--11
select he.CustomerID, count(he.SalesOrderID) as COUNTS
from [Sales].[SalesOrderHeader] he
group by he.CustomerID
----------------------------------------------------------------
--12
select he.CustomerID, sum(he.TotalDue) as COUNTS
from [Sales].[SalesOrderHeader] he
group by he.CustomerID
----------------------------------------------------------------
--13
select he.SalesPersonID, avg(SumM) as AVGSUM
from (select h.SalesPersonID, sum(h.TotalDue) as SumM 
      from [Sales].[SalesOrderHeader] h
	  group by h.SalesPersonID) he
group by he.SalesPersonID
----------------------------------------------------------------
--14
select year(h.OrderDate) as ORDD, count(*) as TotalSales
from [Sales].[SalesOrderHeader] h
group by year(h.OrderDate)
----------------------------------------------------------------
--15
select h.CustomerID, max(h.TotalDue) as TotalSum
from [Sales].[SalesOrderHeader] h
group by h.CustomerID
----------------------------------------------------------------
--16
select Status, count(*) as CountS
from [Sales].[SalesOrderHeader]
group by Status
----------------------------------------------------------------
--17
select he.OnlineOrderFlag, sum(he.TotalDue) as COUNTS
from [Sales].[SalesOrderHeader] he
group by he.OnlineOrderFlag
----------------------------------------------------------------
--18
select top 10 h.CustomerID, count(*) as OrderC
from [Sales].[SalesOrderHeader] h
group by h.CustomerID
order by count(*) desc
----------------------------------------------------------------
--19
select [SalesPersonID], sum(h.TotalDue) as SUMT, avg(h.TotalDue) as AVGS
from [Sales].[SalesOrderHeader] h
group by [SalesPersonID]
----------------------------------------------------------------
--20
select t.SalesOrderID, sum(t.SubTotal) as SubSum,              --10
sum(t.TaxAmt) as AmtSum, sum(t.Freight) as FreiSum,
sum(t.SubTotal) + sum(t.TaxAmt) + sum(t.Freight) as TotalSum
from [Sales].[SalesOrderHeader] t
group by t.SalesOrderID;
----------------------------------------------------------------
--21
select sd.ProductID, count(sd.OrderQty) as ORDQTY
from [Sales].[SalesOrderDetail] sd
group by sd.ProductID
----------------------------------------------------------------
--22
select pp.Color, avg(pp.ListPrice) as AVGP
from [Production].[Product] pp
where pp.Color is not null
group by pp.Color
----------------------------------------------------------------
--23
select h.ShipMethodID,  count(*) as OrderQnt, avg(h.Freight) as Average    
from [Sales].[SalesOrderHeader] h
group by h.ShipMethodID;
----------------------------------------------------------------
--24
select h.CustomerID, max(h.TotalDue) as MaxSum, min(h.TotalDue) as MinSum         
from [Sales].[SalesOrderHeader] h
group by CustomerID;
----------------------------------------------------------------
--25
select year(h.DueDate) as Years, count(*) as OrderQnt, max(h.DueDate) as OrderYear     
from [Sales].[SalesOrderHeader] h
group by year(h.DueDate);
----------------------------------------------------------------
--26
select h.TerritoryID, count(*) as OrderQnt, sum(h.TotalDue) as OrderSum          
from [Sales].[SalesOrderHeader] h
group by h.TerritoryID
----------------------------------------------------------------
--27
select h.OrderDate, count(*) as OrderQnt                        
from [Sales].[SalesOrderHeader] h
group by h.OrderDate
order by OrderQnt desc;
----------------------------------------------------------------
--28
select ProductLine, avg(ListPrice) as ProductPR                     
from  [Production].[Product] 
group by ProductLine
having avg(ListPrice) > 100
----------------------------------------------------------------
--29
select pp.Color, count(*) as PCOUNT
from [Production].[Product] pp
where pp.Color is not null
group by pp.Color
having count(*) > 10
order by  PCOUNT desc
----------------------------------------------------------------
--30
select pp.ProductModelID, max(pp.ListPrice) as MaxPrice, min(pp.ListPrice) as MinPrice,
       avg(pp.ListPrice) as AvgPrice
from Production.Product pp
where pp.ProductModelID is not null
group by pp.ProductModelID