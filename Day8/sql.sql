use psql;
CREATE TABLE Employee_2 (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    departmentId INT,
    bonus DECIMAL(10,2),
    experience INT,
    city VARCHAR(50),
    managerId INT
);
INSERT INTO Employee_2
(employee_id, name, salary, departmentId, bonus, experience, city, managerId)
VALUES
(1, 'Alice',   100000, 1, 10000, 5, 'Pune',     NULL),
(2, 'Bob',      80000, 1, NULL,  3, 'Mumbai',   1),
(3, 'Charlie',  70000, 2, 5000,  2, 'Pune',     4),
(4, 'David',    90000, 2, NULL,   6, 'Delhi',    NULL),
(5, 'Eva',      60000, 3, 3000,   1, 'Mumbai',   6),
(6, 'Frank',    75000, 3, NULL,   4, 'Pune',     NULL),
(7, 'Grace',    70000, 1, 7000,   2, 'Delhi',    1),
(8, 'Henry',    NULL, 2, 4000,    3, 'Mumbai',   4),
(9, 'Isha',     85000, 3, NULL,   5, 'Pune',     6),
(10,'Jack',      NULL, 1, 2000,   1, 'Delhi',    1);


-- Display employee name and salary, but replace NULL salary with 0 using COALESCE()

select name,
	coalesce(salary, 0) 
from Employee_2 ;

select name,
	coalesce(salary, 0) ,
    coalesce(bonus, 0)
from Employee_2 ;

select name,
	coalesce(salary, 0)+coalesce(bonus, 0) as total_compensation
from Employee_2 ;

select name,
	coalesce(bonus, 0) 
from Employee_2
where bonus is NULL ;

select name,
	coalesce(salary, 0),
	coalesce(bonus, 0) 
from Employee_2
where bonus is NULL or salary is NULL;


-- Using Employee_2:

-- Find the average salary of each department, but ignore employees whose salary is NULL.
SELECT departmentId,
       AVG(salary) AS average_salary
FROM Employee_2
GROUP BY departmentId;

SELECT departmentId,
       AVG(salary) AS average_salary
FROM Employee_2
GROUP BY departmentId
having average_salary > 75000;

SELECT departmentId,
       AVG(salary) AS average_salary
FROM Employee_2
GROUP BY departmentId
ORDER BY average_salary DESC
limit 1;

SELECT e.name,
       e.salary,
       e.departmentId
FROM Employee_2 e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM Employee_2 e2
);

-- Find employees whose salary is greater than the average salary of their own department.

-- Return:

-- name | salary | departmentId

SELECT name
FROM Employee_2 e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM Employee_2 e2
    WHERE e2.departmentId = e.departmentId
);

-- Find the highest-paid employee in each department.

SELECT MAX(salary) AS second_highest_salary
FROM Employee_2
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee_2
);
