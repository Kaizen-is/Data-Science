SELECT a.Name AS ProductName, b.SalesOrderID                                             --1
FROM Production.Product a
INNER JOIN Sales.SalesOrderDetail b ON a.ProductID = b.ProductID;


SELECT d.BusinessEntityID AS EmployeeID, sum(s.TotalDue) AS TotalSales                    ---2
FROM HumanResources.Employee d
INNER JOIN Person.Person e on d.BusinessEntityID = e.BusinessEntityID
INNER JOIN Sales.SalesOrderHeader s ON d.BusinessEntityID = s.SalesPersonID
GROUP BY d.BusinessEntityID;


SELECT pc.Name AS CategoryName, sum(s.LineTotal) AS TotalSales                                --3
FROM Production.ProductCategory pc
INNER JOIN Production.ProductSubcategory psc ON pc.ProductCategoryID = psc.ProductCategoryID
INNER JOIN Production.Product p ON psc.ProductSubcategoryID = p.ProductSubcategoryID
INNER JOIN Sales.SalesOrderDetail s ON p.ProductID = s.ProductID
GROUP BY pc.Name;


SELECT c.CustomerID, p.FirstName, p.LastName, s.SalesOrderID, s.OrderDate                       --4
FROM Sales.Customer c
INNER JOIN Sales.SalesOrderHeader s ON c.CustomerID = s.CustomerID
INNER JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
WHERE s.OrderDate = (SELECT max(OrderDate) FROM Sales.SalesOrderHeader 
                     WHERE CustomerID = c.CustomerID);


SELECT p.Name AS ProductName, ph.ListPrice AS ListPrice, pch.StandardCost AS CostPrice,            --5
       ph.ModifiedDate AS PriceDate, pch.ModifiedDate AS CostDate
FROM Production.Product p
INNER JOIN Production.ProductListPriceHistory ph ON p.ProductID = ph.ProductID
INNER JOIN Production.ProductCostHistory pch ON p.ProductID = pch.ProductID;






