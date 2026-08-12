-- Today's Q1
-- Find employees whose salary is greater than the average salary of their own department.

use psql ;

select e.name 
from Employee_1 e
where e.salary > (
select avg(e2.salary)
from Employee_1 e2
where e2.departmentId = e.departmentId
);

-- Find the employee(s) who have the highest salary in each department.
select e.name 
from Employee_1 e
where e.salary =(
select max(e2.salary)
from Employee_1 e2
where e2.departmentId = e.departmentId
) ;
