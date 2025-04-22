# Data_analysis of Ola and Pizza sales 
## Overview
The OLA and Pizza Sales datasets were analyzed using SQL to identify trends, customer behavior, and key performance metrics. Insights were visualized through Power BI dashboards, enabling data-driven decisions and strategic improvements.

## Objectives
To extract and analyze key performance indicators (KPIs) using SQL for informed decision-making.

To identify customer behavior patterns and sales trends for better marketing and operational strategies.

To create interactive dashboards in Power BI for clear and dynamic data visualization.

To provide actionable insights that help improve efficiency, customer satisfaction, and overall business performance.

# Ola Data Analysis
1.retriev all succesfull bookings
```sql

SELECT * FROM ola.bookings
where Booking_Status="Success";
```

-- find the average ride distance for each vehicle type
```sql
select Vehicle_Type,avg(Ride_Distance)
from ola.bookings
group by Vehicle_Type;
```

-- 3.get the total number of cancled ride by customer
```sql
SELECT count(*) from ola.bookings
where Booking_Status="Canceled by Customer";
```

-- 4.list the top 5 customer who booked the higest number of time
```sql
select Customer_ID,count(Booking_ID) as Total_ride
from ola.bookings
group by Customer_ID
order by Total_ride desc
limit 5 ;
```

-- 5 get the number of ride cancled by driver due to personal and car related isseu
```sql
SELECT count(*) from ola.bookings
where Canceled_Rides_by_Driver="Personal & Car related issue";="Canceled by Customer";
```

-- 6 find the maximum and minimum driver rating for prime sedan booking
```sql
select max(Customer_Rating) as max_rating,min(Customer_rating) as min_rating
from ola.bookings
where Vehicle_Type ="Prime Sedan";
```

-- 7 retrive all ride where payment was mode using UPI
```sql
select * from ola.bookings
where Payment_Method="UPI";
```

-- 8 find the average customer rating per vehicle type
```sql
select Vehicle_Type, avg(Customer_Rating) 
from ola.bookings
group by Vehicle_Type;
```

-- 9 Calculate the total booking value of rides completed successfully
```sql
select sum(Booking_Value) from ola.bookings
where Booking_Status="Success";
```

-- 10 list all the incomplete ride along with reason
```sql
select Customer_ID,Incomplete_Rides_Reason from ola.bookings
where Incomplete_Rides="Yes";
```

# Pizza Sales Analysis

```sql
create database pizza;
use pizza;
select sum(total_price) as Total_Revenue from pizza.pizza_sales;
```
```sql
select sum(total_price) / count(distinct order_id) as total_revenue from pizza.pizza_sales;
```
```sql
select sum(quantity) as total_sold from pizza.pizza_sales;
```
```sql
select count(distinct order_id) as Total_order from pizza.pizza_sales;
```
```sql
select cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) as decimal
(10,2)) as Avg_pizza_persale from pizza.pizza_sales;
```
```sql
select dayname(order_date) ,count(distinct order_id) from pizza.pizza_sales
group by dayname(order_date);
```
```sql
select pizza_category,sum(total_price) as total_sales ,sum(total_price)*100 / (select sum(total_price)  from pizza.pizza_sales) as Total_sales_in_percentage 
from pizza.pizza_sales
```
```sql
group by pizza_category
;
```
```sql
select pizza_size,sum(total_price) as total_sales ,sum(total_price)*100 / (select sum(total_price)from pizza.pizza_sales ) as Total_sales_in_percentage 
from pizza.pizza_sales
```
```sql
group by pizza_size
;
```
```sql
select pizza_name,sum(total_price) as total_revenue from pizza.pizza_sales
group by pizza_name
order by total_revenue desc
limit 5;
```
```sql
select pizza_name,sum(total_price) as total_revenue from pizza.pizza_sales
group by pizza_name
order by total_revenue asc
limit 5;
```
```sql
select pizza_name,sum(quantity) as total_quantity from pizza.pizza_sales
group by pizza_name
order by total_quantity desc
limit 5;
```
```sql
select pizza_name,sum(quantity) as total_quantity from pizza.pizza_sales
group by pizza_name
order by total_quantity asc
limit 5;
```
```sql
select pizza_name,count(distinct order_id) as total_order from pizza.pizza_sales
group by pizza_name
order by total_order desc
limit 5;
```
```sql
select pizza_name,count(distinct order_id) as total_order from pizza.pizza_sales
group by pizza_name
order by total_order asc
limit 5;
```
## conclusion
In conclusion, the analysis of the OLA and Pizza Sales datasets using SQL and Power BI provided valuable insights into customer behavior, sales trends, and business performance. The interactive dashboards enabled clear visualization of key metrics, supporting data-driven strategies that can enhance operational efficiency, boost customer satisfaction, and drive overall business growth.












