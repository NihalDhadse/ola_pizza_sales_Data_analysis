-- 1.retriev all succesfull bookings
create view Successful_Booking as
SELECT * FROM ola.bookings
where Booking_Status="Success";

-- find the average ride distance for each vehicle type
create view avgride_of_vehicletype as
select Vehicle_Type,avg(Ride_Distance)
from ola.bookings
group by Vehicle_Type;

-- 3.get the total number of cancled ride by customer
create view Cancled_ride as
SELECT count(*) from ola.bookings
where Booking_Status="Canceled by Customer";

-- 4.list the top 5 customer who booked the higest number of time
create view top_customer_with_morebookings as
select Customer_ID,count(Booking_ID) as Total_ride
from ola.bookings
group by Customer_ID
order by Total_ride desc
limit 5 ;

-- 5 get the number of ride cancled by driver due to personal and car related isseu
create view ride_cancled_by_driver as
SELECT count(*) from ola.bookings
where Canceled_Rides_by_Driver="Personal & Car related issue";="Canceled by Customer";

-- 6 find the maximum and minimum driver rating for prime sedan booking
create view maxmin_rating_for_primeSedan as
select max(Customer_Rating) as max_rating,min(Customer_rating) as min_rating
from ola.bookings
where Vehicle_Type ="Prime Sedan";

-- 7 retrive all ride where payment was mode using UPI
create view payment_with_UPI as 
select * from ola.bookings
where Payment_Method="UPI";

-- 8 find the average customer rating per vehicle type
create view avg_rating_vehicletype as
select Vehicle_Type, avg(Customer_Rating) 
from ola.bookings
group by Vehicle_Type;

-- 9 Calculate the total booking value of rides completed successfully
create view total_booking_value as 
select sum(Booking_Value) from ola.bookings
where Booking_Status="Success";

-- 10 list all the incomplete ride along with reason
create view incomple_rides as
select Customer_ID,Incomplete_Rides_Reason from ola.bookings
where Incomplete_Rides="Yes";
