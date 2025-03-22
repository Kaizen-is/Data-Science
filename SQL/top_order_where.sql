### Filtering with the `WHERE` operator:  

1. Retrieve all products with the color "Red" from the `Production.Product` table.  
2. Retrieve all orders placed after January 1, 2020, from the `Sales.SalesOrderHeader` table.  
3. Retrieve all persons with the last name "Smith" from the `Person.Person` table.  
4. Retrieve all products with a price greater than 100 from the `Production.Product` table.  
5. Retrieve all customers living in the city of "New York" from the `Sales.Customer` table.  
6. Retrieve all employees with the position "Manager" from the `HumanResources.Employee` table.  
7. Retrieve all products whose names start with "Bike" from the `Production.Product` table.  
8. Retrieve all order details with a quantity greater than 10 from the `Sales.SalesOrderDetail` table.  
9. Retrieve all persons whose first names start with the letter "A" from the `Person.Person` table.  
10. Retrieve all products with a weight less than 50 from the `Production.Product` table.  

### Sorting with the `ORDER BY` operator:  

1. Retrieve products from the `Production.Product` table sorted in ascending order by price.  
2. Retrieve orders from the `Sales.SalesOrderHeader` table sorted in descending order by order date.  
3. Retrieve persons from the `Person.Person` table sorted in alphabetical order by last name.  
4. Retrieve products from the `Production.Product` table sorted in ascending order by name.  
5. Retrieve customers from the `Sales.Customer` table sorted in alphabetical order by city.  
6. Retrieve employees from the `HumanResources.Employee` table sorted in ascending order by hire date.  
7. Retrieve products from the `Production.Product` table sorted in descending order by weight.  
8. Retrieve order details from the `Sales.SalesOrderDetail` table sorted in ascending order by quantity.  
9. Retrieve persons from the `Person.Person` table sorted in alphabetical order by first name.  
10. Retrieve products from the `Production.Product` table sorted in descending order by safety stock level.  

### Limiting results with the `TOP` operator:  

1. Retrieve the first 5 products from the `Production.Product` table.  
2. Retrieve the 10 most recent orders from the `Sales.SalesOrderHeader` table.  
3. Retrieve the first 20 persons from the `Person.Person` table.  
4. Retrieve the 5 most expensive products from the `Production.Product` table.  
5. Retrieve the first 15 customers from the `Sales.Customer` table.  
6. Retrieve the 10 longest-serving employees from the `HumanResources.Employee` table.  
7. Retrieve the 5 heaviest products from the `Production.Product` table.  
8. Retrieve the 10 order details with the highest quantity from the `Sales.SalesOrderDetail` table.  
9. Retrieve the first 5 persons whose first names start with the letter "A" from the `Person.Person` table.  
10. Retrieve the 10 products with the lowest safety stock level from the `Production.Product` table.  

### Limiting results with the `OFFSET FETCH` operators:  

1. Retrieve 10 products from the `Production.Product` table sorted in ascending order by price, skipping the first 5.  
2. Retrieve 20 orders from the `Sales.SalesOrderHeader` table sorted in descending order by order date, skipping the first 10.  
3. Retrieve 15 persons from the `Person.Person` table sorted in alphabetical order by last name, skipping the first 5.  
4. Retrieve 10 products from the `Production.Product` table sorted in ascending order by weight, skipping the first 3.  
5. Retrieve 25 customers from the `Sales.Customer` table sorted in alphabetical order by city, skipping the first 10.


-- Operator WHERE

select s.ProductID, s.Name, s.Color
from [AdventureWorks2019].[Production].[Product] s
where s.Color = 'Red'


select s.OrderDate from [AdventureWorks2019].[Sales].[SalesOrderHeader] s
where s.OrderDate > '2012-01-01';


select s.FirstName, s.LastName
from [AdventureWorks2019].[Person].[Person] s
where s.LastName = 'Smith';


select s.ProductID, s.Name, s.Color, s.ListPrice
from [AdventureWorks2019].[Production].[Product] s
where s.ListPrice > 100;


select * from [AdventureWorks2019].[HumanResources].[Employee] s
where s.JobTitle like '%Manager%'; 


select s.ProductID, s.Name, s.Color, s.ListPrice
from [AdventureWorks2019].[Production].[Product] s
where s.Name like'Bike%';


select * from [AdventureWorks2019].[Sales].[SalesOrderDetail] a 
where a.OrderQty > 10;


select s.FirstName, s.LastName
from [AdventureWorks2019].[Person].[Person] s
where s.FirstName like 'A%';


select s.ProductID, s.Name, s.Color, s.ListPrice, s.Weight
from [AdventureWorks2019].[Production].[Product] s
where s.Weight > 50;



-- Operator ORDER BY 

select s.ProductID, s.Name, s.Color, s.ListPrice, s.Weight
from [AdventureWorks2019].[Production].[Product] s
order by s.ListPrice 


select s.OrderDate from [AdventureWorks2019].[Sales].[SalesOrderHeader] s
order by s.OrderDate DESC;


select s.FirstName, s.LastName
from [AdventureWorks2019].[Person].[Person] s
order by s.LastName;


select s.ProductID, s.Name, s.Color, s.ListPrice, s.Weight
from [AdventureWorks2019].[Production].[Product] s
order by s.Name;


select a.BusinessEntityID, a.NationalIDNumber, a.JobTitle, a.HireDate 
from AdventureWorks2019.HumanResources.Employee a 
order by a.HireDate;


select  s.ProductID, s.Name, s.Color, s.ListPrice, s.Weight, s.SafetyStockLevel
from [AdventureWorks2019].[Production].[Product] s
order by s.SafetyStockLevel desc


select * from [AdventureWorks2019].[Sales].[SalesOrderDetail] a 
order by a.OrderQty;


select s.FirstName, s.LastName, s.BusinessEntityID
from [AdventureWorks2019].[Person].[Person] s
order by s.FirstName;


select s.ProductID, s.Name, s.Color, s.ListPrice, s.Weight, s.SafetyStockLevel
from [AdventureWorks2019].[Production].[Product] s
order by s.SafetyStockLevel desc;



-- Operator TOP

select  top 5 *
from [AdventureWorks2019].[Production].[Product] 


select top 10 * 
from [AdventureWorks2019].[Sales].[SalesOrderHeader] 


select top 20 s.FirstName, s.LastName, s.BusinessEntityID
from [AdventureWorks2019].[Person].[Person] s


select top 5 s.ProductID, s.Name, s.Color, s.ListPrice, s.Weight, s.SafetyStockLevel
from [AdventureWorks2019].[Production].[Product] s
order by s.ListPrice desc;


select top 15 * from [AdventureWorks2019].[Sales].[Customer] s


select top 10 a.BusinessEntityID, a.NationalIDNumber, a.JobTitle, a.HireDate 
from AdventureWorks2019.HumanResources.Employee a 
order by HireDate desc;


select top 5 s.ProductID, s.Name, s.Color, s.ListPrice, s.Weight, s.SafetyStockLevel
from [AdventureWorks2019].[Production].[Product] s
order by s.Weight desc;


select top 10 * from [AdventureWorks2019].[Sales].[SalesOrderDetail] a 
order by a.OrderQty desc;


select top 5 s.FirstName, s.LastName
from [AdventureWorks2019].[Person].[Person] s
order by s.FirstName;


select top 10 s.ProductID, s.Name, s.Color, s.ListPrice, s.Weight, s.SafetyStockLevel
from [AdventureWorks2019].[Production].[Product] s
order by s.SafetyStockLevel ASC;



-- Operator OFFSET FETCH

select s.ProductID, s.Name, s.Color, s.ListPrice, s.Weight, s.SafetyStockLevel
from [AdventureWorks2019].[Production].[Product] s
order by s.ListPrice ASC
offset 5 rows
fetch next 10 rows only;


select * from [AventureWorks2019].[Sales].[SalesOrderDetail] a 
order by a.ModifiedDate desc
offset 10 rows
fetch next 20 rows only;


select s.FirstName, s.LastName
from [AdventureWorks2019].[Person].[Person] s
order by s.LastName
offset 5 rows
fetch next 15 rows only;


select s.ProductID, s.Name, s.Color, s.ListPrice, s.Weight, s.SafetyStockLevel
from [AdventureWorks2019].[Production].[Product] s
order by s.SafetyStockLevel ASC
offset 3 rows
fetch next 10 rows only;




