

1. Total Revenue
Calculate the total revenue from completed orders.


Q2. Top 5 Products
Find the top 5 products by total revenue from completed orders. Display product name and total revenue.

Q3. Category Performance
Calculate total revenue for each product category.

select sum(orders.sales_amount) as sums,products.category 
from orders
join products
on  orders.product_id = products.product_id 
where  orders.order_status ='Completed'
group by products.category
order by sums desc;






Q4. Monthly Sales
Find total revenue for each month and sort it chronologically.



select order_date,sum(sales_amount) as sales
from orders
where  orders.order_status ='Completed'
group by order_date
order by sales;




Q5. Customer Analysis
Find the top 5 customers by total spending on completed orders. Display customer name and total spending.
JOINs and CTEs

SELECT SUM(orders.sales_amount) AS sums,
       products.category
FROM orders
JOIN products
    ON orders.product_id = products.product_id
WHERE orders.order_status = 'Completed'
GROUP BY products.category
ORDER BY sums DESC;


Q6. Customer Orders
Display each customers name, number of orders, and total spending.

select customers.customer_name,count(distinct orders.order_id) as orders,
coalesce(sum(orders.sales_amount),0) as spending
from customers
left join orders
on customers.customer_id = orders.customer_id
and orders.order_status = 'Completed'
group by customers.customer_id,customers.customer_name
order by spending desc;






Q7. Average Order Value
Calculate the average order value for completed orders.
SELECT AVG(order_total) AS average_order
FROM (
    SELECT order_id,
           SUM(sales_amount) AS order_total
    FROM orders
    WHERE order_status = 'Completed'
    GROUP BY order_id
) AS order_summary;








Q8. CTE — City Revenue
Using a CTE, calculate completed revenue for each city and display cities with revenue greater than ₹50,000.

with sales as (
select customers.city,sum(orders.sales_amount) as revenue
from orders
join customers
on customers.customer_id = orders.customer_id
WHERE order_status = 'Completed'
GROUP BY customers.city
)
select * 
from sales
where revenue > 50000
order by revenue desc;




Q9. Products Without Sales
Find products that have never appeared in a completed order. Use a LEFT JOIN.
select products.product_id,products.product_name
from products
left join orders
on products.product_id=orders.product_id
and orders.order_status = 'Completed'
where orders.product_id is null;









Q10. Customer Segmentation
Use CASE WHEN to classify customers based on their total completed spending:
- High Value: ₹50,000 or more
- Medium Value: ₹20,000–₹49,999
- Low Value: below ₹20,000
Window Functions and Profitability


with spending as(
select customers.customer_id,customers.customer_name,
coalesce(sum(orders.sales_amount),0) as spend
from customers
left join orders
on customers.customer_id = orders.customer_id
and orders.order_status ='Completed'
group by customers.customer_id , customers.customer_name
)
select *,
case
when spend >= 50000 then 'high value'
when spend >= 20000 then 'medium value'
ELSE 'Low Value'
END AS customer_segment
FROM spending
ORDER BY spend DESC;

use excel;





Q11. Product Ranking
Use RANK() to rank products by total revenue within each category.
WITH sales AS (
    SELECT
        products.product_id,
        products.product_name,
        products.category,
        SUM(orders.sales_amount) AS revenue
    FROM products
    JOIN orders
        ON products.product_id = orders.product_id
    WHERE orders.order_status = 'Completed'
    GROUP BY
        products.product_id,
        products.product_name,
        products.category
)
SELECT *,
       RANK() OVER (
           PARTITION BY category
           ORDER BY revenue DESC
       ) AS ranks
FROM sales;

Q12. Customer Ranking
Use DENSE_RANK() to rank customers by total completed spending.
WITH sales AS (
    SELECT
        customers.customer_id,customers.customer_name,
        SUM(orders.sales_amount) AS revenue
    FROM customers
    JOIN orders
        ON customers.customer_id = orders.customer_id
    WHERE orders.order_status = 'Completed'
    GROUP BY
        customers.customer_id,customers.customer_name
)
SELECT *,
dense_RANK() OVER (
           ORDER BY revenue DESC
       ) AS ranks
FROM sales;





Q13. Running Total
Calculate cumulative monthly revenue using SUM() OVER().

WITH sales AS (
    SELECT
        order_date AS sales_date,
        SUM(sales_amount) AS revenue
    FROM orders
    WHERE order_status = 'Completed'
    GROUP BY order_date
)
SELECT
    sales_date,
    revenue,
    DENSE_RANK() OVER (
        ORDER BY revenue DESC
    ) AS ranks
FROM sales
ORDER BY ranks;





Q14. Profit Analysis
Calculate product-level profit using sales revenue minus product cost. Assume the tables contain sales_amount, quantity, and unit_cost.

Select products.product_name,
sum(orders.sales_amount) as revenue,
sum(orders.quantity * products.unit_cost) as cost,
sum(orders.sales_amount)
-sum(orders.quantity * products.unit_cost) as profit,
From orders
Join products
On orders.product_id = products.product_id
Where orders.order_status = ‘Completed’
Group by products.product_id,
Products.product_name
Order by profit desc;

Q15. Month-over-Month Growth
Calculate monthly revenue and percentage growth compared with the previous month using LAG().

WITH sales AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
        SUM(sales_amount) AS revenue
    FROM orders
    WHERE order_status = 'Completed'
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
),
sales_previous AS (
    SELECT
        sales_month,
        revenue,
        LAG(revenue) OVER (
            ORDER BY sales_month
        ) AS previous_month_revenue
    FROM sales
)
SELECT
    sales_month,
    revenue,
    previous_month_revenue,
    ROUND(
        (revenue - previous_month_revenue)
        / NULLIF(previous_month_revenue, 0) * 100,
        2
    ) AS growth_percentage
FROM sales_previous
ORDER BY sales_month;




