-- INNER JOIN
--Identify each customer's (Customer) most expensive order (SalesOrderHeader) and display the customer's name (Person) along with the total price of the order.

--Find the names of all products (Product) sold in 2014 and their total sales quantity (SalesOrderDetail).

--Display the total sales made by each employee (Employee) in descending order based on total sales amount.

--Determine the best-selling product (SalesOrderDetail) for each product category (ProductCategory).

select s.CustomerID, pp.FirstName as Name, pp.LastName as Surname, s.AccountNumber as AccountN, ss.[OrderDate] as OrderDate,ss.[DueDate] as DueDate ,      -- 1
ss.[RevisionNumber] as RevisNum,
MAX(ss.TotalDue) as MaxSum, sum(ss.TotalDue) as TotalSum
from [Sales].[Customer] s
inner join [Sales].[SalesOrderHeader] ss on s.CustomerID = ss.CustomerID
inner join Person.Person pp on s.PersonID = pp.BusinessEntityID
group by s.CustomerID, pp.FirstName, pp.LastName, s.AccountNumber, ss.[OrderDate],ss.[DueDate], 
ss.[RevisionNumber]


select ss.ModifiedDate, pp.Name, pp.Color, Count(*) as TotalSales            -- 2
from [Production].[Product] pp
inner join [Sales].[SalesOrderDetail] ss on pp.ProductID = ss.ProductID
where YEAR(ss.ModifiedDate) = 2014
Group by ss.ModifiedDate, pp.Name, pp.Color
--select pp.Color, Count(*)
--from [Production].[Product] pp
--group by pp.Color


select pp.FirstName, pp.LastName, sum(ss.TotalDue) as TotaSum                 -- 3
from HumanResources.Employee h
inner join Person.Person pp on h.BusinessEntityID = pp.BusinessEntityID
inner join [Sales].[SalesOrderHeader] ss on pp.BusinessEntityID = ss.SalesPersonID
group by  pp.FirstName, pp.LastName
Order by sum(ss.TotalDue) desc



select pc.Name, sd.OrderQty, max(sd.OrderQty) as MaxSum                        -- 4
from [Production].[ProductCategory] pc
inner join [Sales].[SalesOrderDetail] sd on pc.ProductCategoryID = sd.SalesOrderDetailID
group by pc.Name, sd.OrderQty
order by max(sd.OrderQty) desc;


-- LEFT JOIN 
--Find customers (Customer) who have not placed any orders and display their names (Person) along with their email addresses.

--Display the quantity sold (SalesOrderDetail) for each product (Product). For unsold products, show the quantity as 0.

--List all employees (Employee), showing the number of sales they have made (SalesOrderHeader). If no sales were made, display 0.

--Display all products (Product) that do not belong to any product category (ProductCategory).

SELECT sc.CustomerID, pp.FirstName, pp.LastName, pe.EmailAddress, COUNT(sd.OrderQty) AS OrderQuantity  --1
FROM Sales.Customer sc
LEFT JOIN Sales.SalesOrderHeader ssh ON sc.CustomerID = ssh.CustomerID
LEFT JOIN Sales.SalesOrderDetail sd ON ssh.SalesOrderID = sd.SalesOrderID
LEFT JOIN Person.Person pp ON sc.CustomerID = pp.BusinessEntityID
LEFT JOIN Person.EmailAddress pe ON pp.BusinessEntityID = pe.BusinessEntityID
where ssh.SalesOrderID is null
GROUP BY sc.CustomerID, pp.FirstName, pp.LastName, pe.EmailAddress


select pp.Name, pp. ProductNumber, pp.Color, count(sd.OrderQty) as SumOrder    --2
from Production.Product pp
left join Sales.SalesOrderDetail sd on pp.ProductID = sd.ProductID
group by pp.Name, pp.ProductNumber, pp.Color
Having count(sd.OrderQty) = 0


select he.[JobTitle], he.BirthDate, he.Gender, Count(sd.OrderQty) as OrderQty    --3
from [HumanResources].[Employee] he
left join [Sales].[SalesOrderHeader] ss on he.[BusinessEntityID] = ss.CustomerID
left join [Sales].[SalesOrderDetail] sd on ss.CustomerID = sd.SalesOrderDetailID
group by he.[JobTitle], he.BirthDate, he.Gender


select pp.[Name], pp.Color, pc.[Name] as Category                              --4
from [Production].[Product] pp
left join [Production].[ProductCategory] pc on pp.[ProductID] = pc.[ProductCategoryID]
where pc.ProductCategoryID is null

-- RIGHT JOIN
--Identify products (Product) that do not belong to any product category (ProductCategory) and display them with a NULL category name.

--List all sales (SalesOrderDetail) and, if a sold product (Product) does not exist, display the product name as NULL.

--Find customers (Customer) who have no sales (SalesOrderHeader) and display their personal details (Person).

--Display all employees (Employee) and their sales (SalesOrderHeader). If no sales exist, show NULL values for employees.

select pp.[Name], pp.Color, pc.[Name] as CategoryName                              --1
from [Production].[ProductCategory] pc
right join [Production].[Product] pp on pc.[ProductCategoryID] = pp.[ProductSubcategoryID]
where pc.ProductCategoryID is null


select pp.[Name], pp.[ProductNumber], pp.[Color], ss.[OrderQty], ss.LineTotal          --2
from Sales.SalesOrderDetail ss 
right join Production.Product pp on ss.SalesOrderDetailID = pp.ProductID


select pp.FirstName, pp.LastName as Name, sc.AccountNumber, ss.[OrderDate]             --3
from [Sales].[SalesOrderHeader] ss
right join [Sales].[Customer] sc on ss.[CustomerID] = sc.[CustomerID]
right join [Person].[Person] pp on sc.[PersonID] = pp.[BusinessEntityID]
where [SalesOrderID] is null


select pp.FirstName, pp.LastName, he.JobTitle, ss.[OrderDate]                         --4
from [Sales].[SalesOrderHeader] ss
right join [HumanResources].[Employee] he on  ss.[SalesOrderID] = he.[BusinessEntityID]
right join Person.Person pp on he.BusinessEntityID = pp.BusinessEntityID
where ss.SalesOrderID is null 

select he.JobTitle, ss.[OrderDate], he.BusinessEntityID, he.JobTitle, he.BirthDate,      --4
ss.SalesOrderID, ss.TotalDue
from [Sales].[SalesOrderHeader] ss
right join [HumanResources].[Employee] he on  ss.[SalesOrderID] = he.[BusinessEntityID]




--FULL JOIN
--Display all sales (SalesOrderDetail) for each product (Product), including unsold products and sales linked to nonexistent products, using NULL values.

--Show all customers (Customer) and all sales (SalesOrderHeader). If a customer has not made a sale or a sale is not linked to a customer, show NULL values.

--List employees (Employee) along with their sales (SalesOrderHeader), including employees who have not made any sales and sales that are not linked to employees.

--Display all product categories (ProductCategory) and products (Product), including products that do not belong to a category and categories without any products.

select pp.Name, pp.Class, pp.Color, pp.ListPrice, sd.OrderQty, count(*) as AllSales     --1
from [Production].[Product] pp
full join [Sales].[SalesOrderDetail] sd on pp.[ProductID] = sd.[SalesOrderDetailID]
group by  pp.Name, pp.Class, pp.Color, pp.ListPrice, sd.OrderQty


select *
from [Sales].[Customer] sc            --2
full join [Sales].[SalesOrderDetail] ss on sc.[CustomerID] = ss.[SalesOrderDetailID]


select *
from [HumanResources].[Employee] he        --3
full join [Sales].[SalesOrderHeader] ss on he.[BusinessEntityID] = ss.[SalesPersonID]


select * 
from [Production].[ProductCategory] pc       --4
full join [Production].[Product] pp on pc.ProductCategoryID = pp.[ProductID]


--CROSS JOIN
--Create all possible "potential" sales pairs by combining each product (Product) with each customer (Customer) and count the total combinations.

--Create all possible product (Product) and product category (ProductCategory) combinations and count them.

--Generate all possible employee (Employee) and sales territory (SalesTerritory) combinations and count them.

--Create all possible customer (Customer) and salesperson (SalesPerson) combinations and count them.

select count(*) as TotalPotentials      --1
from [Production].[Product] p
CROSS JOIN [Sales].[Customer] c

select p.ProductID, p.Name as ProductName, c.CustomerID, c.AccountNumber --1
from [Production].[Product] p
CROSS JOIN [Sales].[Customer] c;


select count(*) as AllCombinations                  --2
from [Production].[ProductCategory] pc
cross join [Production].[Product] pp
select pp.ProductID, pp.Name, pc.[Name] as ProductCategory, pp.Class, pp.Color     
from [Production].[ProductCategory] pc
cross join [Production].[Product] pp

select st.[Name] as TerritoryName, he.[NationalIDNumber], he.BirthDate, he.Gender, he.HireDate, st.CostLastYear  --3    --3
from [HumanResources].[Employee] he
cross join [Sales].[SalesTerritory] st 


select count(*) Combinations    --4
from [Sales].[Customer] sc
cross join [Sales].[SalesPerson] sp
select sc.CustomerID, sc.AccountNumber, sp.ModifiedDate, sp.SalesLastYear
from [Sales].[Customer] sc
cross join [Sales].[SalesPerson] sp




--SELF JOIN
--For each employee (Employee), find their manager and display both the employee’s and the manager’s names.

--For each product (Product), find other products with the same color and display their names.

--Identify orders (SalesOrderHeader) placed by the same customer (Customer) and display the previous and next order dates.

--Pair products (Product) with the same price and display their prices.

select e.BusinessEntityID as EmployeeID,  e.JobTitle as EmployeeJob,            --1
       m.BusinessEntityID as ManagerID,  m.JobTitle as ManagerJob 
FROM [HumanResources].[Employee] e  
JOIN [HumanResources].[Employee] m  ON e.OrganizationNode.GetAncestor(1) = m.OrganizationNode
order by e.BusinessEntityID

select p1.Name as ProductName, p2.Name as SameProduct, p1.Color     --2
from Production.Product p1
join [Production].[Product] p2 on p1.Color = p2.Color
order by p1.Name



select p1.Name as ProductName, p2.Name as SameProduct, p1.[ListPrice]    --4
from Production.Product p1
join [Production].[Product] p2 on p1.[ListPrice] = p2.[ListPrice]
order by p1.Name







