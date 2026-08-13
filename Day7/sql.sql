-- Using Employee_1, write a query that returns:

-- name | salary | category

-- where:

-- salary >= 90000 → 'High'
-- salary >= 70000 → 'Medium'
-- otherwise → 'Low'

-- Try writing the CASE query yourself.
use psql ;

select name,
salary,
case
	when salary >= 90000 then 'High'
    when salary >= 70000 then 'Medium'
    else  'Low'
end as category 
from Employee_1 ;

-- Q2 — Let's make it slightly harder

-- Using the same table, calculate a 10% bonus for employees earning at least 80000, otherwise 5%.

select name,
salary,
case
	when salary >= 000 then salary*0.10
    else  salary*0.05
end as bonus 
from Employee_1 ;


-- Q3 — CASE + GROUP BY

-- Find the number of employees in each salary category:

-- High → salary >= 90000
-- Medium → salary >= 70000
-- Low → salary < 70000

-- Try writing the query yourself.
select count(*),
case
	when salary >= 90000 then 'High'
    when salary >= 70000 then 'Medium'
    else  'Low'
end as category 
from Employee_1 
group by category;

-- 🗄️ Q4 — CASE inside an aggregate

-- Using Employee_1, find how many employees earn at least 80000.

select * from Employee_1;
 
select count(
case 
	when salary >= 80000 then 1
end
)
from Employee_1;
