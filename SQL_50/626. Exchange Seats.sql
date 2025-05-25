Table: Seat

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key (unique value) column for this table.
Each row of this table indicates the name and the ID of a student.
The ID sequence always starts from 1 and increments continuously.
 

Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
Output: 
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+




-- with cte as (
-- select 
-- case
--     when a.income < 20000 then 'Low Salary' else 
--     (case when a.income >= 20000 and a.income <= 50000 then 'Average Salary' else (
--         case when a.income > 50000 then 'High Salary' else '0'
--     end) end) end as category,
--     a.account_id
-- from Accounts a

-- )

-- select category     , count(account_id) as accounts_count 
-- from cte
-- group by Category


-- with cte as (    
--     select id, 
--     lag(student) over(order by id) as laged,
--     lead(dtudent) over(order by id) as leadd
-- from Seat
-- )

-- with cte as (
-- select id, lag(student) over(order by id) as student
-- from Seat

-- union 

-- select id, lead(student) over(order by id) as student
-- from Seat

-- ),
-- ranking as (
-- select id, student 
-- from cte 
-- where student is not null
-- )

-- select distinct id, student
-- from ranking



-- with cte as (
--     select id, 
--     lag(student) over(order by id) as lagged,
--     lead(student) over(order by id) as leaded
-- from Seat
-- )

-- select id, case 
-- when id % 2 = 0 then student = lagged else (
    -- case when id % 2 != 0 then student = leaded else (
    --     case when (select top 1 id from Seat order by id desc)) % 2 <> 0 then student else 0)end as student
-- from cte



with cte as (
    select id, 
    student,
    lag(student) over(order by id) as lagged,
    lead(student) over(order by id) as leaded
from Seat
)

select id,
    case 
        when id % 2 = 0 then lagged
        when leaded is not null then leaded
        else student 
    end as student 
from cte     
order by id;
