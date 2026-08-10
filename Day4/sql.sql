-- Write a query to find the highest-paid employee in each department.

-- Return:

-- department
-- employee_name
-- salary

-- Expected result:

-- department	employee_name	salary
-- Finance	Grace	80000
-- HR	Frank	60000
-- IT	Charlie

use psql ;
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO Employees (employee_id, name, department, salary)
VALUES
(1, 'Alice', 'IT', 75000),
(2, 'Bob', 'HR', 55000),
(3, 'Charlie', 'IT', 90000),
(4, 'David', 'Finance', 65000),
(5, 'Eva', 'IT', 85000),
(6, 'Frank', 'HR', 60000),
(7, 'Grace', 'Finance', 80000),
(8, 'Henry', 'IT', 70000);

select e.department,
e.name as employee_name ,
e.salary 
from Employees e
where e.salary = (
select max(e2.salary)
from Employees e2 
where e2.department = e.department
);  
