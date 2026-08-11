-- Employee
-- id	name	salary	departmentId
-- 1	Alice	100000	1
-- 2	Bob	80000	1
-- 3	Charlie	70000	2
-- 4	David	90000	2
-- 5	Eva	60000	3
-- 6	Frank	75000	3
-- Task

-- Find the second-highest salary from the entire Employee table.
use psql ;
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    departmentId INT
);
INSERT INTO Employee (id, name, salary, departmentId)
VALUES
(1, 'Alice', 100000, 1),
(2, 'Bob', 80000, 1),
(3, 'Charlie', 70000, 2),
(4, 'David', 90000, 2),
(5, 'Eva', 60000, 3),
(6, 'Frank', 75000, 3);

SELECT MAX(salary)
FROM Employee
WHERE salary < (
    select MAX(salary)
    from Employee
);

SELECT MAX(salary)
FROM Employee
WHERE salary < (
    select MAX(salary)
    from Employee
    WHERE salary < (
    select MAX(salary)
    from Employee)
);

-- SQL Q3 — Second-highest salary per department

-- Use this table:

-- id	name	salary	departmentId
-- 1	Alice	100000	1
-- 2	Bob	80000	1
-- 3	Charlie	70000	2
-- 4	David	90000	2
-- 5	Eva	60000	3
-- 6	Frank	75000	3
-- 7	Grace	70000	1

-- We want:

-- departmentId	second-highest salary
-- 1	80000
-- 2	70000
-- 3	60000

CREATE TABLE Employee_1 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    departmentId INT
);
INSERT INTO Employee_1 (id, name, salary, departmentId)
VALUES
(1, 'Alice', 100000, 1),
(2, 'Bob', 80000, 1),
(3, 'Charlie', 70000, 2),
(4, 'David', 90000, 2),
(5, 'Eva', 60000, 3),
(6, 'Frank', 75000, 3),
(7, 'Grace', 70000, 1);

select max(salary)
from Employee_1
where salary < (
select
max(salary)
from Employee_1)
group by departmentId ;

SELECT MAX(salary)
FROM Employee_1
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee_1
    WHERE departmentId = 1
)
AND departmentId = 1;

SELECT e.departmentId,
       MAX(e.salary)
FROM Employee_1 e
WHERE e.salary < (
    SELECT MAX(e2.salary)
    FROM Employee_1 e2
    WHERE e2.departmentId = e.departmentId
)
GROUP BY e.departmentId;


select e.name ,
e.salary,
e.departmentId
from Employee_1 e 
where e.salary >(
select avg(e2.salary)
from Employee_1 e2 
where e2.departmentId = e.departmentId ) ;

 