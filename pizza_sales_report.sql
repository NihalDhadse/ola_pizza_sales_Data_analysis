create database pizza;
use pizza;
select sum(total_price) as Total_Revenue from pizza.pizza_sales;

select sum(total_price) / count(distinct order_id) as total_revenue from pizza.pizza_sales;

select sum(quantity) as total_sold from pizza.pizza_sales;

select count(distinct order_id) as Total_order from pizza.pizza_sales;

select cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) as decimal
(10,2)) as Avg_pizza_persale from pizza.pizza_sales;

select dayname(order_date) ,count(distinct order_id) from pizza.pizza_sales
group by dayname(order_date);

select pizza_category,sum(total_price) as total_sales ,sum(total_price)*100 / (select sum(total_price)  from pizza.pizza_sales) as Total_sales_in_percentage 
from pizza.pizza_sales

group by pizza_category
;

select pizza_size,sum(total_price) as total_sales ,sum(total_price)*100 / (select sum(total_price)from pizza.pizza_sales ) as Total_sales_in_percentage 
from pizza.pizza_sales

group by pizza_size
;

select pizza_name,sum(total_price) as total_revenue from pizza.pizza_sales
group by pizza_name
order by total_revenue desc
limit 5;

select pizza_name,sum(total_price) as total_revenue from pizza.pizza_sales
group by pizza_name
order by total_revenue asc
limit 5;

select pizza_name,sum(quantity) as total_quantity from pizza.pizza_sales
group by pizza_name
order by total_quantity desc
limit 5;

select pizza_name,sum(quantity) as total_quantity from pizza.pizza_sales
group by pizza_name
order by total_quantity asc
limit 5;

select pizza_name,count(distinct order_id) as total_order from pizza.pizza_sales
group by pizza_name
order by total_order desc
limit 5;

select pizza_name,count(distinct order_id) as total_order from pizza.pizza_sales
group by pizza_name
order by total_order asc
limit 5;











