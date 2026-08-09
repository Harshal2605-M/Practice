Question 2 — SQL

You have this table:

Orders
order_id	customer_id	amount	order_date
1	101	500	2026-01-10
2	102	800	2026-01-12
3	101	300	2026-01-15
4	103	1200	2026-01-18
5	102	400	2026-01-20
6	101	700	2026-01-22
7	103	600	2026-01-25
Task

/*Write a SQL query that returns each customer's:

customer_id
total number of orders → total_orders
total amount spent → total_amount
average order amount → avg_amount

But only include customers who:

have placed at least 2 orders AND have spent more than 1000 in total.

Sort the result by total_amount from highest to lowest.

Expected result
customer_id	total_orders	total_amount	avg_amount
101	3	1500	500
102	2	1200	600

You already solved a very similar problem before, so try it without looking back.*/
USE psql ;
CREATE TABLE Orders_1 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10, 2),
    order_date DATE
);

INSERT INTO Orders_1 (order_id, customer_id, amount, order_date)
VALUES
(1, 101, 500, '2026-01-10'),
(2, 102, 800, '2026-01-12'),
(3, 101, 300, '2026-01-15'),
(4, 103, 1200, '2026-01-18'),
(5, 102, 400, '2026-01-20'),
(6, 101, 700, '2026-01-22'),
(7, 103, 600, '2026-01-25');

SELECT customer_id,
count(order_id) as total_orders,
sum(amount) as total_amount,
avg(amount) as avg_amount
from Orders_1
group by customer_id 
having count(order_id) >= 2 and sum(amount) > 1000
order by total_amount desc;