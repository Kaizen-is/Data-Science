-------------------------------------------------------------------------------
--1
select p.FirstName                     
from [Person].[Person] p
inner join [Sales].[Customer] c on p.BusinessEntityID = c.PersonID
union 
select p.FirstName
from [Person].[Person] p
inner join [Sales].[Customer] c on p.BusinessEntityID = c.PersonID
where c.PersonID is null

select p.FirstName                     
from [Person].[Person] p
inner join [Sales].[Customer] c on p.BusinessEntityID = c.PersonID
union all 
select p.FirstName
from [Person].[Person] p
inner join [Sales].[Customer] c on p.BusinessEntityID = c.PersonID
where c.PersonID is null
-------------------------------------------------------------------------------
--2
select distinct p.FirstName
from [Person].[Person] p
inner join [Sales].[Customer] c on p.BusinessEntityID = c.PersonID

intersect

select distinct p.FirstName
from [Person].[Person] p
inner join  [HumanResources].[Employee] he on p.BusinessEntityID = he.BusinessEntityID
------------------------------------------------------------------------------
--3
select distinct p.FirstName
from [Person].[Person] p
inner join  [HumanResources].[Employee] he on p.BusinessEntityID = he.BusinessEntityID

except

select distinct p.FirstName
from [Person].[Person] p
inner join [Sales].[Customer] c on p.BusinessEntityID = c.PersonID
-----------------------------------------------------------------------------
--4
select p.FirstName
from [Person].[Person] p
inner join  [HumanResources].[Employee] he on p.BusinessEntityID = he.BusinessEntityID

union 

select p.FirstName
from [Person].[Person] p
inner join  [HumanResources].[Employee] he on p.BusinessEntityID = he.BusinessEntityID
-----------------------------------------------------------------------------

select distinct p.FirstName
from [Person].[Person] p
inner join  [HumanResources].[Employee] he on p.BusinessEntityID = he.BusinessEntityID

intersect

select distinct p.FirstName
from [Person].[Person] p
inner join  [HumanResources].[Employee] he on p.BusinessEntityID = he.BusinessEntityID
-----------------------------------------------------------------------------

select p.FirstName
from [Person].[Person] p
inner join  [HumanResources].[Employee] he on p.BusinessEntityID = he.BusinessEntityID

union all

select p.FirstName
from [Person].[Person] p
inner join  [HumanResources].[Employee] he on p.BusinessEntityID = he.BusinessEntityID
--------------------------------------------------------------------------------------
--NEW WAY

--1 
select p.FirstName                     
from [Person].[Person] p
inner join [Sales].[Customer] c on p.BusinessEntityID = c.PersonID

union 

select p.FirstName
From [Person].[Person] p;
---------------------------------------------------------------------------------------
--2
select p.FirstName
from Person.Person p
inner join Sales.Customer c on p.BusinessEntityID = c.PersonID

union all

select p.FirstName
from Person.Person p
---------------------------------------------------------------------------------------
--3
select distinct p.FirstName
from Person.Person p 
inner join HumanResources.Employee h on p.BusinessEntityID = h.BusinessEntityID

intersect

select distinct p.FirstName 
from Person.Person p
inner join Sales.Customer s on p.BusinessEntityID = s.PersonID
---------------------------------------------------------------------------------------
--4
select distinct p.FirstName
from Person.Person p 
inner join HumanResources.Employee h on p.BusinessEntityID = h.BusinessEntityID

except

select distinct p.FirstName 
from Person.Person p
inner join Sales.Customer s on p.BusinessEntityID = s.PersonID
---------------------------------------------------------------------------------------
--5
select distinct p.FirstName 
from Person.Person p
inner join Sales.Customer s on p.BusinessEntityID = s.PersonID

except

select distinct p.FirstName
from Person.Person p 
inner join HumanResources.Employee h on p.BusinessEntityID = h.BusinessEntityID
---------------------------------------------------------------------------------------
--6
select p.FirstName                     
from [Person].[Person] p
inner join [Sales].[Customer] c on p.BusinessEntityID = c.PersonID

union 

select p.FirstName
From [Person].[Person] p

union

select p.FirstName
from Person.Person p
inner join [HumanResources].[Employee] h on p.[BusinessEntityID] = h.[BusinessEntityID]
order by p.FirstName;
---------------------------------------------------------------------------------------
--7
select p.FirstName                     
from [Person].[Person] p
inner join [Sales].[Customer] c on p.BusinessEntityID = c.PersonID
where len(p.FirstName) > 5

union 

select p.FirstName
from [Person].[Person] p
inner join [Sales].[Customer] c on p.BusinessEntityID = c.PersonID
where len(p.FirstName) > 5
order by p.FirstName
---------------------------------------------------------------------------------------
--8
select distinct p.LastName
from Person.Person p
inner join [HumanResources].[Employee] h on p.BusinessEntityID = h.BusinessEntityID

intersect

select distinct p.LastName
from Person.Person p
inner join [Sales].[SalesPerson] s on p.BusinessEntityID = s.BusinessEntityID
---------------------------------------------------------------------------------------
--9
select distinct p.LastName
from Person.Person p
inner join [HumanResources].[Employee] h on p.BusinessEntityID = h.BusinessEntityID

except

select distinct p.LastName
from Person.Person p
inner join [Sales].[SalesPerson] s on p.BusinessEntityID = s.BusinessEntityID
---------------------------------------------------------------------------------------
--10
select count(*) as NameJohn
from ( 
        select p.FirstName
		from Person.Person p
        inner join [HumanResources].[Employee] h on p.BusinessEntityID = h.BusinessEntityID

        union all 

        select  p.FirstName
        from Person.Person p
        inner join [Sales].[SalesPerson] s on p.BusinessEntityID = s.BusinessEntityID
		) as AllNames
where FirstName = 'John';
---------------------------------------------------------------------------------------
--11
select pp.Name
from Production.Product pp

union

select pm.Name
from Production.ProductModel pm
---------------------------------------------------------------------------------------
--12
select distinct pp.Name
from Production.Product pp

intersect

select distinct pm.Name
from Production.ProductModel pm
---------------------------------------------------------------------------------------
--13
select distinct pm.Name
from Production.ProductModel pm 

except  

select distinct pp.Name
from Production.Product pp
---------------------------------------------------------------------------------------
--14
select p.FirstName
from Person.Person p
inner join [HumanResources].[Employee] h on p.BusinessEntityID = h.BusinessEntityID
where p.FirstName like  'A%'

union 

select p.FirstName
from person.Person p
inner join Sales.Customer s on s.PersonID = p.BusinessEntityID
where p.FirstName like  'A%';
---------------------------------------------------------------------------------------
--15
select distinct p.FirstName
from Person.Person p
inner join [HumanResources].[Employee] h on p.BusinessEntityID = h.BusinessEntityID
where p.FirstName like  'A%'

union 

select distinct p.FirstName
from person.Person p
inner join Sales.Customer s on s.PersonID = p.BusinessEntityID
where p.FirstName like  'A%';
---------------------------------------------------------------------------------------
--16
select distinct p.LastName
from Person.Person p
inner join [HumanResources].[Employee] h on p.BusinessEntityID = h.BusinessEntityID
where len(p.LastName) > 6

union 

select distinct p.LastName
from person.Person p
inner join Sales.Customer s on s.PersonID = p.BusinessEntityID
where len(p.LastName) > 6;
---------------------------------------------------------------------------------------
--17
select concat(p.FirstName, ' ',  p.LastName) as Name
from person.person p
inner join [Sales].[Customer] s on p.BusinessEntityID = s.PersonID
where p.BusinessEntityID < 10000

except

select concat(p.FirstName, ' ', p.LastName) 
from person.person p
inner join [HumanResources].[Employee] h on p.BusinessEntityID = h.BusinessEntityID
---------------------------------------------------------------------------------------
--18
select p.FirstName, substring(p.FirstName, 1, 1) as FirstLetters
from Person.Person p
inner join [HumanResources].[Employee] h on p.BusinessEntityID = h.BusinessEntityID


union 

select p.FirstName,  substring(p.FirstName, 1, 1) as FirstLetters
from person.Person p
inner join Sales.Customer s on s.PersonID = p.BusinessEntityID
Order by p.FirstName;
---------------------------------------------------------------------------------------
--19
select p.FirstName, count(*) as Wieviel
from Person.Person p
inner join [HumanResources].[Employee] h on p.BusinessEntityID = h.BusinessEntityID
group by p.FirstName


union all

select p.FirstName, count(*) as Wieviel
from person.Person p
inner join Sales.Customer s on s.PersonID = p.BusinessEntityID
group by p.FirstName
Order by count(*) desc;
---------------------------------------------------------------------------------------
--20
select null
from Person.Person p
full join [HumanResources].[Employee] h on p.BusinessEntityID = h.BusinessEntityID

except select null

select null
from person.Person p
full join Sales.Customer s on s.PersonID = p.BusinessEntityID

select null as NullVaue
except
select null as NullVaue;
---------------------------------------------------------------------------------------

-- STRING FUNCTIONS
--1
select pp.[BusinessEntityID], max(len(pp.FirstName)) as NameLen
from Person.person pp
group by pp.BusinessEntityID
order by max(len(pp.FirstName)) desc;
-----------------------------------------------------------------
--2
select pp.BusinessEntityID, pp.FirstName, 
left(pp.FirstName, 3) as LeftLett,
right(pp.FirstName, 3) as RightLett
from Person.person pp

select pp.BusinessEntityID, pp.FirstName, 
left(pp.FirstName, 3) as LeftLett,
right(pp.FirstName, 3) as RightLett
from Person.person pp
where len(pp.FirstName) = 6;
-----------------------------------------------------------------
--3
select pp.BusinessEntityID, pp.FirstName, substring(pp.FirstName, 2, 4) as CombName
from Person.person pp

select pp.BusinessEntityID, pp.FirstName, substring(pp.FirstName, 2, 4) as CombName
from Person.person pp
where len(pp.FirstName) = 6;
-----------------------------------------------------------------
--4
select pp.BusinessEntityID, charindex('an', pp.FirstName) as AnbName
from Person.person pp
order by charindex('an', pp.FirstName) desc;
-----------------------------------------------------------------
--5
select pp.BusinessEntityID, patindex('%son%', pp.FirstName) as PatinName
from Person.person pp
order by patindex('%son%', pp.FirstName) desc;
-----------------------------------------------------------------
-- CHANGING STRINGS
--1
select pp.BusinessEntityID, pp.FirstName as OriginalName, 
replace(pp.FirstName, 'son', 'ov' ) as ChangedName
from Person.person pp
order by replace(pp.FirstName, 'son', 'ov' );

select pp.BusinessEntityID, pp.FirstName as OriginalName, --1
replace(pp.FirstName, 'son', 'ov' ) as ChangedName
from Person.person pp
where pp.FirstName like '%son%'
order by replace(pp.FirstName, 'son', 'ov' );
-----------------------------------------------------------------
--2
select pp.BusinessEntityID, pp.FirstName as OriginalName, 
rtrim(pp.FirstName) as RtrimName, 
ltrim(pp.FirstName) as LtrimName,
trim(pp.FirstName) as trimName
from Person.person pp
order by replace(pp.FirstName, 'son', 'ov' );

select ltrim(        'I love anime') as ltrima
select rtrim('I love anime'         ) as rtrima
select trim(         'I love anime'         ) as trima
-----------------------------------------------------------------
--3
select pp.[BusinessEntityID], 
upper(pp.FirstName) as UpperFirstName,
upper(pp.LastName) as UpperLastName,

lower(pp.FirstName) as lowerFirstName,
lower(pp.LastName) as lowerLastName

from Person.person pp;
-----------------------------------------------------------------
--4
select concat(p.FirstName, ' ', p.LastName) as FullName
from person.person p
order by p.FirstName;
-----------------------------------------------------------------
--5
select p.LastName, reverse(p.LastName) as ReversedLastName
from person.person p;
-----------------------------------------------------------------
--6
select p.FirstName, replicate(p.FirstName, 2) as FullName
from person.person p
order by p.FirstName;
-----------------------------------------------------------------
--7
select format(getdate(), 'dd.MM.yyy') as Today
select getdate()
