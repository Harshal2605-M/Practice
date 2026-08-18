-- Using Employee_2, write a query that displays:

-- name
-- salary
-- previous_salary

-- where previous_salary is the salary of the previous employee when employees are ordered by salary descending.

-- Use:

-- LAG(salary) OVER (
--     ORDER BY salary DESC
-- )
use psql ;
select name, 
	salary,
    LAG(salary) over (
		order by salary desc
    ) as previous_salary
    from Employee_2 ;
    
-- Q2 — LEAD()

-- Now do the opposite.

-- Using Employee_2, display each employee's name, salary, and the salary of the next employee when ordered by salary descending.

-- Use:

-- LEAD(salary) OVER (
--     ORDER BY salary DESC
-- )

-- Expected concept:

-- salary    next_salary
-- 100000    90000
-- 90000     80000
-- 80000     70000
-- 70000     NULL

select name, 
	salary,
    LEAD(salary) over (
		order by salary desc
    ) as forward_salary
    from Employee_2 ;
    
-- For each employee, find the previous employee's salary within the same department, ordered by salary descending.

-- Use:

-- LAG(salary) OVER (
--     PARTITION BY departmentId
--     ORDER BY salary DESC
-- )

select name, 
	salary, 
    departmentId,
    LAG(salary) over(
		partition by departmentId
        order by salary desc
    ) as previous_salary_by_dept
from Employee_2 ;

-- Now let's learn another very common window-function pattern.

-- Using Employee_2, calculate a running total of salaries ordered by salary from lowest to highest.

-- Expected:

-- salary    running_total
-- 70000     70000
-- 80000     150000
-- 90000     240000
-- 100000    340000

-- Hint:

-- SUM(salary) OVER (
--     ORDER BY salary
-- )

select name, 
	salary,
    SUM(salary) over (
		order by salary asc
    ) as running_salary
    from Employee_2 ;
    
-- Q5 — Salary difference from previous employee

-- Using Employee_2, show:

-- name
-- salary
-- previous_salary
-- salary_difference

-- Where:

-- salary_difference = salary - previous_salary

-- The previous salary should be based on salary descending.

SELECT name,
       salary,
       previous_salary,
       salary - previous_salary AS salary_difference
FROM (
    SELECT name,
           salary,
           LAG(salary) OVER (
               ORDER BY salary DESC
           ) AS previous_salary
    FROM Employee_2
) AS t;