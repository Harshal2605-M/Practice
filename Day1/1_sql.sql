-- SQL Practice - Question 1 (Medium)
-- Table: Orders
-- order_id	customer_id	order_date	amount
-- 1	101	2026-01-01	500
-- 2	101	2026-02-10	800
-- 3	102	2026-01-15	700
-- 4	103	2026-03-01	900
-- 5	102	2026-03-10	400
-- 6	101	2026-03-20	600
-- Task

-- Write a query to return:

-- customer_id
-- Total number of orders
-- Total amount spent
-- Average order amount
-- Conditions
-- Return only customers who placed at least 2 orders.
-- Sort by total amount spent in descending order.

create database  psql;
use psql ;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO Orders (order_id, customer_id, order_date, amount)
VALUES
(1, 101, '2026-01-01', 500),
(2, 101, '2026-02-10', 800),
(3, 102, '2026-01-15', 700),
(4, 103, '2026-03-01', 900),
(5, 102, '2026-03-10', 400),
(6, 101, '2026-03-20', 600);

select distinct(customer_id) from Orders ;
select count(order_id) as number_of_orders from Orders ;
select sum(amount) amount_spend from Orders ;
select avg(amount) from Orders ;

select customer_id from Orders
group by  customer_id
having count(*) >= 2 ;

select customer_id,
count(order_id) as total_orders,
sum(amount) as total_amount, 
avg(amount) as avg_amount
from Orders
group by customer_id 
having count(*) >= 2
order by total_amount desc;

