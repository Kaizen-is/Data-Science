----------------------------------------------------------
--1

select p.ListPrice, p.name
from [Production].[Product] p
where p.ListPrice = (
 select max(ListPrice) 
 from [Production].[Product]
 );
 ----------------------------------------------------------
 --2
select p.name, p.ListPrice
from [Production].[Product] p
where p.ListPrice > (
 select avg(ListPrice)
 from [Production].[Product]
 );
 ----------------------------------------------------------
 --3
select p.name, p.ListPrice
from [Production].[Product] p
where p.ProductID not in (
  select s.ProductID
  from [Sales].[SalesOrderDetail] s
  );
 ----------------------------------------------------------
 --4 
 select p.Name, p.ListPrice, p.[Weight]
 from [Production].[Product] p 
 where p.Weight > (
   select avg(Weight) 
   from [Production].[Product]
   );
----------------------------------------------------------
--5
select p.Name, p.Weight, (
    select max(ListPrice) from  [Production].[Product]
	) as MaxPrice
from [Production].[Product] p
----------------------------------------------------------
--6
select s.ProductID, s.UnitPrice
from [Sales].[SalesOrderDetail] s
where max(s.UnitPrice) in (
  select from [Production].[Product]

select p.Name, (select max(ListPrice) from Production.Product) as MaxPrice
from Production.Product p 
where p.Name in (
  select [UnitPrice]

select s.SalesOrderID, p.Name, p.ListPrice
from [Sales].[SalesOrderDetail] s
join [Production].[Product] p on s.ProductID = p.ProductID
where p.ListPrice = (
    select max(p2.ListPrice)
	from [Sales].[SalesOrderDetail] s2
	join [Production].[Product] p2 on s2.ProductID = p2.ProductID
	where s2.SalesOrderID = s.SalesOrderID
)
----------------------------------------------------------
--7
select p.Name 
from Production.Product p
where p.ProductID not in (
    select i.ProductID 
	from Production.ProductInventory i
);

----------------------------------------------------------
--8
select p.Name, s.OrderQty
from Production.Product p 
join [Sales].[SalesOrderDetail] s on p.ProductID = s.ProductID
where s.OrderQty = (
      select min(s2.OrderQty)
	  from [Sales].[SalesOrderDetail] s2
	  );
----------------------------------------------------------
--9
select p.Name, ps.Name as Category, avg(p.[ListPrice]) as AvgPrice
from Production.Product p
join Production.ProductSubcategory ps on p.ProductSubcategoryID = ps.ProductSubcategoryID
group by p.Name, ps.Name
Having avg(p.[ListPrice]) = (
     select min(avg(pp.ListPrice)) from Production.Product pp
	 group by pp.ProductSubcategoryID
	 );

select p.Name, ps.Name as Category, avg(p.[ListPrice]) as AvgPrice
from Production.Product p
join Production.ProductSubcategory ps on p.ProductSubcategoryID = ps.ProductSubcategoryID
group by p.Name, ps.Name
Having avg(p.[ListPrice]) = (
     select min(avg(ListPrice)) from Production.Product 
	 );
----------------------------------------------------------
--10

select p.Name, s.OrderQty
from Production.Product p
join [Sales].[SalesOrderDetail] s on p.ProductID = s.ProductID
where (select count(ss.OrderQty) from [Sales].[SalesOrderDetail] ss) > 5

select p.Name, s.OrderQty
from Production.Product p
join [Sales].[SalesOrderDetail] s on p.ProductID = s.ProductID
group by p.Name, s.OrderQty
having (select count(ss.OrderQty) from [Sales].[SalesOrderDetail] ss) > 5

select p.Name, s.OrderQty
from Production.Product p
join [Sales].[SalesOrderDetail] s on p.ProductID = s.ProductID
group by p.Name, s.OrderQty
having s.OrderQty in (
        select ss.ProductID
        from [Sales].[SalesOrderDetail] ss
		group by ss.ProductID
		having sum(ss.OrderQty) > 5
		);

select p.Name, s.OrderQty
from Production.Product p
join [Sales].[SalesOrderDetail] s on p.ProductID = s.ProductID
where s.OrderQty in (
        select ss.ProductID
        from [Sales].[SalesOrderDetail] ss
		group by ss.ProductID
		having sum(ss.OrderQty) > 5
		);

select p.Name, sum(ss.OrderQty) as TotalSales
from [Production].[Product] p
join [Sales].[SalesOrderDetail] ss on p.ProductID = ss.ProductID
group by p.Name

having sum(ss.OrderQty) in (
      select OrderQty 
	  from [Sales].[SalesOrderDetail]
	  where OrderQty > 5
	  );


select p.Name, s.OrderQty
from Production.Product p
join Sales.SalesOrderDetail s on p.ProductID = s.ProductID
where p.ProductID in (
      select s.ProductID
	  from  Sales.SalesOrderDetail s
	  group by s.ProductID
	  having sum(s.OrderQty) >= 5
	  );

----------------------------------------------------------
--11
select p.Name, p.Price, p.ProductID
from (select avg(ListPrice) as Price 
      from Production.Product
	  ) as p
join [Sales].[SalesOrderDetail] s on p.ProductID = s.ProductID


select p.ProductID, p.Name, a.AverageP
from [Production].[Product] p
join (select s.ProductID, avg(s.UnitPrice) as AverageP 
      from [Sales].[SalesOrderDetail] s
	  group by s.ProductID
	  ) as a on p.ProductID = a.ProductID
----------------------------------------------------------
--12
select c.CustomerID, h.TotalSum
from [Sales].[Customer] c 
join (select h.CustomerID, sum(h.SubTotal) as TotalSum 
      from [Sales].[SalesOrderHeader] h
	  group by h.CustomerID
) as h on c.CustomerID = h.CustomerID
----------------------------------------------------------
--13

select p.ProductID, p.Name
from Production.Product p
where p.ProductID not in (
      select i.ProductID 
	  from [Production].[ProductInventory] i
);

select p.ProductID, p.Name
from Production.Product p
where not exists (
      select 1
	  from [Production].[ProductInventory] i
	  where i.ProductID = p.ProductID
);
----------------------------------------------------------
--14
select em.BusinessEntityID, em.JobTitle, mp.MaxSalary, 
d.Name as DepartamentName
from [HumanResources].[Employee] em 
join (select p.BusinessEntityID, max(p.Rate) as MaxSalary
      from [HumanResources].[EmployeePayHistory] p
	  group by p.BusinessEntityID
	  ) as mp on em.BusinessEntityID = mp.BusinessEntityID
join [HumanResources].[Department] d on mp.BusinessEntityID = d.DepartmentID

select em.BusinessEntityID, em.JobTitle, mp.MaxSalary, 
d.Name as DepartamentName
from [HumanResources].[Employee] em 
join (select p.BusinessEntityID, dp.[DepartmentID], max(p.Rate) as MaxSalary
      from [HumanResources].[EmployeePayHistory] p
	  join [HumanResources].[EmployeeDepartmentHistory] dp 
	  on p.BusinessEntityID = dp.BusinessEntityID
	  group by p.BusinessEntityID, dp.[DepartmentID]
      ) mp on em.BusinessEntityID = mp.BusinessEntityID
join [HumanResources].[Department] d on mp.[DepartmentID] = d.DepartmentID
----------------------------------------------------------
--15
select ss.TotalDue
from [Sales].[SalesOrderHeader] ss
where ss.TotalDue = (
      select max(sh.TotalDue) from [Sales].[SalesOrderHeader] sh
	  );
----------------------------------------------------------
--17

select pp.ProductID, pp.Name, ss.ModifiedDate
from [Production].[Product] pp
join [Sales].[SalesOrderDetail] ss on pp.ProductID = ss.ProductID
where (ss.OrderQty > 0 ) in (
      select ProductID from Production.ProductInventory
	  );

select pp.ProductID, pp.Name, sd.ModifiedDate
from [Production].[Product] pp
join [Sales].[SalesOrderDetail] sd on pp.ProductID = sd.ProductID
where sd.ProductID not in (select Quantity
      from [Production].[ProductInventory]  
	  where Quantity > 0)
----------------------------------------------------------
--16
select h.CustomerID, h.OrderDate
from [Sales].[SalesOrderHeader] h
join [Sales].[Customer] c on h.CustomerID = c.CustomerID
where h.CustomerID in (
      select max([OrderDate]) from [Sales].[SalesOrderHeader]
	  )


select c.AccountNumber, h.CustomerID, h.LeastOrder
from [Sales].[Customer] c 
join (select CustomerID, max([OrderDate]) LeastOrder 
	  from [Sales].[SalesOrderHeader]
	  group by CustomerID
	  )  h on c.CustomerID = h.CustomerID
----------------------------------------------------------
--18
select pp.ProductID, pp.Name, pc.Name CategoryName
from [Production].[Product] pp
join [Production].[ProductCategory] pc 
on pp.ProductSubcategoryID = pc.ProductCategoryID
where pp.ProductID not in (
      select ProductID  from [Sales].[SalesOrderDetail]
	  where OrderQty > 0);

select pp.ProductID, pp.Name, pc.Name CategoryName
from [Production].[Product] pp
join [Production].[ProductCategory] pc 
on pp.ProductSubcategoryID = pc.ProductCategoryID
where pp.ProductID not in (
      select OrderQty  from [Sales].[SalesOrderDetail]
	  where OrderQty > 0)
----------------------------------------------------------
--19
select top 3 pc.ProductCategoryID, pc.Name as Category 
from [Production].[ProductCategory] pc
join [Production].[ProductSubcategory] ps 
on pc.ProductCategoryID = ps.ProductCategoryID


select top 3 pc.Name as Category, 
count(ps.[ProductSubcategoryID]) as SubCategory
from [Production].[ProductCategory] pc
join [Production].[ProductSubcategory] ps 
on pc.ProductCategoryID = ps.ProductCategoryID
group by pc.Name

select pc.Name as Category, 
count(ps.[ProductSubcategoryID]) as SubCategory
from [Production].[ProductCategory] pc
join [Production].[ProductSubcategory] ps 
on pc.ProductCategoryID = ps.ProductCategoryID
group by pc.Name
----------------------------------------------------------
--20
select sd.SalesOrderID, pp.Name, he.FirstSales
from [Production].[Product] pp
join [Sales].[SalesOrderDetail] sd on pp.ProductID = sd.ProductID
join (select h.SalesOrderID, min(h.OrderDate) as FirstSales 
      from Sales.SalesOrderHeader h
	   group by h.SalesOrderID) he on sd.SalesOrderID = he.SalesOrderID

select sd.SalesOrderID, pp.Name, he.FirstSales
from [Production].[Product] pp
join [Sales].[SalesOrderDetail] sd on pp.ProductID = sd.ProductID
join (select s.ProductID, min(h.OrderDate) as FirstSales 
      from [Sales].[SalesOrderHeader] h
	  join [Sales].[SalesOrderDetail] s on h.SalesOrderID = s.SalesOrderID
	  group by s.ProductID) he on pp.ProductID = he.ProductID 
----------------------------------------------------------
--21
select sc.CustomerID, he.TotalSum
from [Sales].[Customer] sc
join (select h.CustomerID, max(h.TotalDue) TotalSum
      from [Sales].[SalesOrderHeader] h
	  group by h.CustomerID) he on sc.CustomerID = he.CustomerID

select h.CustomerID, h.TotalDue
from Sales.SalesOrderHeader h
where h.TotalDue = (
      select max(he.TotalDue) as TotalSum
	  from Sales.SalesOrderHeader he
	  where h.CustomerID = he.CustomerID
	  )
----------------------------------------------------------
--22
select e.JobTitle, he.AverageSa
from [HumanResources].[Employee] e
join (select avg(h.Rate) as AverageSa, h.BusinessEntityID
      from [HumanResources].[EmployeePayHistory] h
	  group by h.BusinessEntityID) he 
	  on e.BusinessEntityID = he.BusinessEntityID
where h.Rate he.AverageSa 

select e.JobTitle, h.Rate
from [HumanResources].[Employee] e
join [HumanResources].[EmployeePayHistory] h on e.BusinessEntityID = h.BusinessEntityID
where h.Rate > (
      select avg(h.Rate)
      from [HumanResources].[EmployeePayHistory] h)


select e.JobTitle, he.Rate, he.AverageSa
from [HumanResources].[Employee] e
join (select avg(h.Rate) as AverageSa, h.BusinessEntityID, h.Rate
      from [HumanResources].[EmployeePayHistory] h
	  group by h.BusinessEntityID, h.Rate) he 
	  on e.BusinessEntityID = he.BusinessEntityID
where he.Rate > he.AverageSa 
----------------------------------------------------------
--23
select c.Name as Category, s.Name as SubCategory
from Production.ProductCategory c
join [Production].[ProductSubcategory] s on c.[ProductCategoryID] = s.[ProductCategoryID]
join (select p.[ProductSubcategoryID], avg(p.ListPrice) as AveragePrice
      from [Production].[Product] p
	  group by c.Name, s.Name) p on c.[ProductSubcategoryID] = p.[ProductSubcategoryID]
where p.AveragePrice < (
      select pp.ListPrice
	  from [Production].[Product] pp
	  join [Production].[ProductCategory] c 
	  on pp.[ProductSubcategoryID] = c.[ProductCategoryID]
	  );


select p.Name as CategoryName, s.Name as SubCategory, pp.ListPrice
from [Production].[Product] pp
join [Production].[ProductCategory] c 
on pp.[ProductSubcategoryID] = c.[ProductCategoryID]
where pp.ListPrice > (
      select c.Name, s.Name 
      from Production.ProductCategory c
      join [Production].[ProductSubcategory] s on c.[ProductCategoryID] = s.[ProductCategoryID]
      join (select p.[ProductSubcategoryID], avg(p.ListPrice) as AveragePric
	        from [Production].[Product] p
	        group by c.Name, s.Name) p on c.[ProductSubcategoryID] = p.[ProductSubcategoryID]
	  );
----------------------------------------------------------
--24
select c.[CustomerID], avg(he.[TotalDue]) as AvgPrice
from [Sales].[Customer] c
join [Sales].[SalesOrderHeader] he on c.[CustomerID] = he.[CustomerID]
group by c.[CustomerID]
having avg(he.TotalDue) > 1000;
----------------------------------------------------------
--25
select pp.[ProductSubcategoryID], pp.Name as ProductName,
       ps.Name as SubCategoryName
from [Production].[Product] pp
join [Production].[ProductSubcategory] ps on pp.ProductSubcategoryID = ps.ProductSubcategoryID
where ps.[ProductSubcategoryID] in (
      select max(OrderQty) from [Sales].[SalesOrderDetail])

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
       group by s.ProductSubcategoryID 
	   );


select pp.[ProductSubcategoryID], pp.Name as ProductName,
       ps.Name as SubCategoryName, sum(sd.OrderQty) as SumOrder
from Sales.SalesOrderDetail  sd 
join [Production].[Product] pp on sd.ProductID = pp.ProductID
join [Production].[ProductSubcategory] ps on pp.ProductSubcategoryID = ps.ProductSubcategoryID
where ps.[ProductSubcategoryID] in (
      select max(s.OrderQty),  p.ProductID
	  from [Sales].[SalesOrderDetail] s
	  join [Production].[Product] p on s.ProductID = p.ProductID
	  group by p.ProductID
	  );
----------------------------------------------------------
--26
select pp.ProductID, pp.Name
from [Production].[Product] pp
join [Sales].[SalesOrderDetail] sd on pp.ProductID =  sd.ProductID
where pp.ProductID = (
      select max(sum(s.OrderQty * s.UnitPrice)) 
	  from Sales.SalesOrderDetail s
	  join [Production].[Product] p on p.ProductID =  s.ProductID
);

select pp.ProductID, pp.Name, sd.MostProffitable
from [Production].[Product] pp
join (
      select max(s.OrderQty * s.UnitPrice) as MostProffitable, s.ProductID 
	  from [Sales].[SalesOrderDetail] s
	  group by s.ProductID
	  )sd on pp.ProductID =  sd.ProductID
	  

select pp.ProductID, pp.Name, ( select max(s.OrderQty * s.UnitPrice) from [Sales].[SalesOrderDetail] s)
from [Production].[Product] pp
join [Sales].[SalesOrderDetail] sd on pp.ProductID =  sd.ProductID
     




select pp.ProductID, pp.Name, max(sd.SumProffit) as MostProffitable
from [Production].[Product] pp
join  (
      select sum(s.OrderQty * s.UnitPrice) as SumProffit, p.ProductID
	  from Sales.SalesOrderDetail s
	  join [Production].[Product] p on p.ProductID =  s.ProductID
	  group by p.ProductID ) sd on pp.ProductID =  sd.ProductID
group by pp.ProductID, pp.Name
     

