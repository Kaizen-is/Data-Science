-- EASY 

select s.Color, count(*) as ColorQNT --1
from [Production].[Product] s
group by s.Color;

select s.Color, AVG(s.ListPrice) as AveragePr --2
from [Production].[Product] s
group by s.Color;


select s.Color, max(s.ListPrice) as  MaxPr --3
from [Production].[Product] s
group by s.Color;



select s.Size, COUNT(*) as SizeQNT      --4
from [Production].[Product] s
group by s.Size;



select s.MakeFlag, sum(s.ListPrice) as FlagPr  --5
from [Production].[Product] s
group by s.MakeFlag;


SELECT kaizen.SafetyStockLevel, count(*) as SafetyQNT   --6
from [Production].[Product] kaizen
group by kaizen.SafetyStockLevel;



select kaizen.ProductLine, MIN(kaizen.ListPrice) as ProsductPr    --7
from [Production].[Product] kaizen
group by kaizen.ProductLine;

 
select nezuko.Color, COUNT(*) as ProductCount               --8
from [Production].[Product] nezuko
group by nezuko.Color
order by ProductCount DESC;


SELECT jinwoo.ProductSubcategoryID, COUNT(*) as SubcateogryCount    --9
from [Production].[Product] jinwoo
group by jinwoo.ProductSubcategoryID
order by SubcateogryCount DESC;



select s.ListPrice, COUNT(*) as PriceCount              --10
from [Production].[Product] s
group by s.ListPrice
ORDER BY PriceCount;




-- MIDDELE 

SELECT a.CustomerID, COUNT(*) as OrderCount                --1
FROM [Sales].[SalesOrderHeader] a
group by a.[CustomerID];

SELECT a.CustomerID, sum(a.TotalDue) as OrderSum             --2
FROM [Sales].[SalesOrderHeader] a
group by a.CustomerID;

SELECT a.SalesPersonID, avg(a.TotalDue) as SalesSum                --3
FROM [Sales].[SalesOrderHeader] a
group by a.SalesPersonID;

select YEAR(OrderDate) as OrderYear, count(*) as TotalSales                 --4
FROM [Sales].[SalesOrderHeader] a
group by YEAR(OrderDate);

select a.CustomerID, MAX(a.TotalDue) as TotalSales                 --5
FROM [Sales].[SalesOrderHeader] a
group by a.CustomerID;

select hayato.Status, count(*) as SatusCount                        --6
From [Sales].[SalesOrderHeader] hayato
GROUP BY Status;

select ayase.OnlineOrderFlag, sum(ayase.TotalDue) as FlagSum       --7
From [Sales].[SalesOrderHeader] ayase
group by ayase.OnlineOrderFlag

SELECT TOP 10 ayra.CustomerID, count(*) as OrderCount               --8
from [Sales].[SalesOrderHeader] ayra
group by ayra.CustomerID 
order by OrderCount DESC;




select lili.SalesPersonID, sum(lili.TotalDue) as TotalSum,         --9
avg(lili.TotalDue) as AverageSum
from [Sales].[SalesOrderHeader] lili
group by lili.SalesPersonID;


select zet.SalesOrderID, sum(zet.SubTotal) as SubSum,              --10
sum(zet.TaxAmt) as AmtSum, sum(zet.Freight) as FreiSum,
sum(zet.SubTotal) + sum(zet.TaxAmt) + sum(zet.Freight) as TotalSum
from [Sales].[SalesOrderHeader] zet
group by zet.SalesOrderID;




-- Hard

select a.ProductID, count(OrderQty) as Quantity                   --1
from [Sales].[SalesOrderDetail] a
group by a.ProductID;


select a.Color, avg(a.ListPrice) as AveragePR                     --2
from [Production].[Product] a
where a.Color is not null
group by a.Color;


select a.ShipMethodID,  count(*) as OrderQnt, avg(a.Freight) as Average    --3
from [Sales].[SalesOrderHeader] a
group by a.ShipMethodID;


select a.CustomerID, MAX(a.TotalDue) as MaxSum, Min(a.TotalDue) as MinSum         --4
from [Sales].[SalesOrderHeader] a
group by CustomerID;


select YEAR(a.DueDate) as Years, count(*) as OrderQnt, max(a.DueDate) as OrderYear     --5
from [Sales].[SalesOrderHeader] a
group by YEAR(a.DueDate);


select a.TerritoryID, count(*) as OrderQnt, sum(a.TotalDue) as OrderSum           --6
from [Sales].[SalesOrderHeader] a
group by a.TerritoryID
ORDER BY a.TerritoryID;


select a.OrderDate, count(*) as OrderQnt                        --7
from [Sales].[SalesOrderHeader] a
group by a.OrderDate
order by a.OrderDate desc;

select a.OrderDate, count(*) as OrderQnt                        --7
from [Sales].[SalesOrderHeader] a
group by a.OrderDate
order by OrderQnt desc;


Select ProductLine, avg(ListPrice) as ProductPR                     --8
from  [Production].[Product] 
where ProductLine is not null
group by ProductLine
Having avg(ListPrice) > 100;


select a.Color, count(*) as Product                     --9
from   [Production].[Product] a
where a.Color is not null
group by a.Color
Having count(*) <= 10
order by a.COlor desc;


select ProductID, max(ListPrice) as MaxPr, Min(ListPrice) as MinPr, avg(ListPrice) as AveragePr            --10
from [Production].[Product]
where ProductID is not null
group by ProductID



select ProductID, max(ListPrice) as MaxPr, Min(ListPrice) as MinPr, avg(ListPrice) as AveragePr                --10
from [Production].[Product]
where ProductID is not null
group by ProductID
having max(ListPrice) > 0.00  and  Min(ListPrice) > 0.00  and  avg(ListPrice) > 0.00