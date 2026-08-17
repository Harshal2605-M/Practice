-- Use your Employee_2 table and write a query that displays:

-- name
-- departmentId
-- salary
-- department average salary

-- using:

-- AVG() OVER(PARTITION BY ...)
use psql ;

select * from Employee_2 ;
select name,
	departmentId,
    salary,
    avg(salary) over (
		partition by departmentId 
    ) as department_avg
from Employee_2 ;

-- Write a query using ROW_NUMBER() that gives each employee a salary rank within their department, highest salary first.

-- Expected idea:

-- name       department    salary    rank
-- Alice      IT            100000      1
-- Charlie    IT             90000      2
-- Bob        IT             80000      3
-- ...

-- Use:

-- ROW_NUMBER() OVER (
--     PARTITION BY ...
--     ORDER BY ... DESC
-- )

select name, 
	departmentId, 
    salary,
    row_number() over (
		partition by departmentId
        order by salary desc 
    ) as row_num 
from Employee_2 ;

-- Using Employee_2, write a query that ranks employees within each department based on salary, using RANK() instead of ROW_NUMBER().
select name, 
	departmentId ,
    salary ,
    rank() over (
		partition by departmentId
        order by salary desc
    ) as rank_by_salary 
from Employee_2 ;

-- Using the same Employee_2 table, write the query to rank employees by salary within each department using DENSE_RANK().

select name, 
	departmentId ,
    salary ,
    dense_rank() over (
		partition by departmentId
        order by salary desc
    ) as rank_by_salary 
from Employee_2 ;



-- Find the top 2 highest-paid employees from each department.

SELECT name,
       departmentId,
       salary,
       row_num
FROM (
    SELECT name,
           departmentId,
           salary,
           ROW_NUMBER() OVER (
               PARTITION BY departmentId
               ORDER BY salary DESC
           ) AS row_num
    FROM Employee_2
) AS ranked
WHERE row_num <= 2;