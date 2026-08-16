-- Using Employee_2:
-- Q1
-- Find employees whose salary is greater than the company average salary.
-- Q2
-- Find employees whose salary is greater than their department average salary.
-- Q3
-- Find the highest-paid employee from each department.
-- Q4
-- Find the second-highest distinct salary.
-- Q5
-- Find departments having:
-- average salary > 75000
-- and return the department and average salary.

use psql ;

select name
from Employee_2
where salary > (
select avg(salary)
from Employee_2
);

select name
from Employee_2 e
where e.salary > (
select avg(salary)
from Employee_2 e2
where e2.departmentId = e.departmentId
);

select name
from Employee_2 e
where e.salary = (
select max(salary)
from Employee_2 e2
where e2.departmentId = e.departmentId
);

select 
max(salary)
from Employee_2 
where salary < (
select max(salary)
from Employee_2 
);


SELECT departmentId,
       AVG(salary) AS average_salary
FROM Employee_2
GROUP BY departmentId
HAVING AVG(salary) > 75000;

