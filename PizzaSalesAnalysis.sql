create database pizzasales;
use pizzasales;
select * 
from `pizza_sales (1)`;
select floor(sum(total_price))
from `pizza_sales (1)`;
select distinct (pizza_name),count(pizza_name) ,sum(unit_price)
from `pizza_sales (1)`
group by pizza_name	
 ;
alter table `pizza_sales (1)`
rename to PizzaSales;
#totalrevenue
select floor(sum(total_price)) TotalRevenue
from PizzaSales;
#AVG OEDER VALUE
SELECT FLOOR(SUM(total_price)) / COUNT(DISTINCT order_id) AS AvgValue
FROM PizzaSales;
#Total Pizzas Sold
select sum(quantity)
from PizzaSales;
select *
from PizzaSales;
#total orders
SELECT COUNT(DISTINCT order_id) total_orders
FROM PizzaSales;
#AVERAGE ORDER QUANTITY
select avg(quantity) as average_quantity
from PizzaSales;
SELECT AVG(order_quantity) AS avg_quantity_per_order
FROM (
    SELECT order_id, SUM(quantity) AS order_quantity
    FROM PizzaSales
    GROUP BY order_id
) AS order_totals;
#HOURLY TRND FOR PIZZA SOLD

SELECT HOUR(order_time) AS hourlyorder,count(order_id)
FROM PizzaSales
GROUP BY hourlyorder;
#WEEKLY TREND FOR PIZZA ORDER
SELECT WEEK(order_time) AS week_number, COUNT(order_id) AS order_count
FROM PizzaSales
GROUP BY week_number
ORDER BY week_number;
# % of sales of pizza category
SELECT 
    pizza_category,
    SUM(total_price) AS category_sales,
    (SUM(total_price) / (SELECT SUM(total_price) FROM PizzaSales) * 100) AS percentage_of_total_sales
FROM 
    PizzaSales
GROUP BY 
    pizza_category
ORDER BY 
    percentage_of_total_sales DESC;
    # % of pizza sales by pizza size
    SELECT 
    pizza_size,
    SUM(total_price) AS size_sales,
    (SUM(total_price) / (SELECT SUM(total_price) FROM PizzaSales) * 100) AS percentage_of_total_sales
FROM 
    PizzaSales
GROUP BY 
    pizza_size
ORDER BY 
    percentage_of_total_sales DESC;
    # TOTAL PIZZAS SOLD BY PIZZA CATEGORY
    SELECT pizza_category,
       SUM(quantity) AS total_quantity
FROM PizzaSales
GROUP BY pizza_category;

    select *
    from PizzaSales;
    #top 5 pizzas by revenue
    select pizza_name,sum(total_price)as pizza_revenue
    from pizzasales
    group by pizza_name
    order by pizza_revenue desc
    limit 5;
    #BOTTOM 5 PIZZAS BY REVENUE
        select pizza_name,sum(total_price)as pizza_revenue
    from pizzasales
    group by pizza_name
    order by pizza_revenue asc
    limit 5;
    #TOP  5 PIZZAS BY QUANTITY
    select pizza_name,sum(quantity) as pizzaquantity
    from PizzaSales
    Group by pizza_name
    order by pizzaquantity desc;
    #TOP 5 PIZZAS BY 
    select pizza_name,sum(total_price) as pizza_revenue
    from PizzaSales
    group by pizza_name
    order by pizza_revenue desc
    limit 5;
    select *
    from PizzaSales;
    -- Find the date with the highest total sales
SELECT order_date,SUM(total_price)
FROM PizzaSales
GROUP BY order_date
ORDER BY SUM(total_price) DESC
LIMIT 3;
-- Find the top-selling pizza on the date with the highest total sales
SELECT pizza_name,
       SUM(quantity) AS total_quantity
FROM PizzaSales
WHERE order_date = '01-02-2015'
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 3;
-- Calculate the total revenue for the top-selling pizza on the date with the highest total sales
SELECT pizza_name,
       SUM(total_price) AS pizza_revenue
FROM PizzaSales
WHERE order_date = '01-02-2015'
  AND pizza_name = 'The Classic Deluxe Pizza'
GROUP BY pizza_name;
-- Find the top-selling pizza and its revenue on the date with the highest total sales
SELECT pizza_name,
       SUM(total_price) AS pizza_revenue
FROM PizzaSales
WHERE order_date = (
    SELECT order_date
    FROM PizzaSales
    GROUP BY order_date
    ORDER BY SUM(total_price) DESC
    LIMIT 1
)
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC
LIMIT 1;





    




