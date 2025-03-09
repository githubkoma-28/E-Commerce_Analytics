Create database project;

Use project;

Create table Olist_Dataset (order_id varchar(255), order_status varchar (255), 
order_purchaser_timestamp date, Days varchar(255), 
Weekday_or_Weekend varchar(255),
order_delivered_customer_date Date, Shipping_days int, 
order_estimated_delivery_date date,
review_score int, payment_type varchar(255), 
payment_value decimal (10,2), price decimal (10,2), freight_value decimal (10,2), customer_id varchar(255),
customer_city varchar(255), customer_state varchar(255), 
product_id varchar(255), product_category_name varchar(255), 
seller_id varchar(255), seller_city varchar(255), seller_state varchar(255));

Load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_dataset.csv'
into table olist_dataset
Fields terminated by ','
Enclosed by '"'
Lines terminated by '\n'
Ignore 1 rows;

select*from olist_dataset;

-- KPI's 1

Select Weekday_or_Weekend, sum(payment_value) as Total_payment from olist_dataset group by Weekday_or_Weekend;

-- KPI's 2

Select count(order_id) as Total_Orders,review_score as Review_Score ,payment_type as Payment_Type from olist_dataset 
where review_score = 5 and payment_type = "credit_card";

-- KPI's 3

Select product_category_name as Product_Category_Name,round(avg(Shipping_Days)) as Average_Shipping_Days
from olist_dataset where product_category_name = "pet_shop";

-- KPI's 4

select customer_city, round(avg(price),2) as Average_Price, round(avg(payment_value),2) as Average_Payment_Value from olist_dataset
where customer_city = "sao paulo";

-- KPI's 5

select review_score as Review_Score, round((avg(shipping_days))) as Average_Shipping_Days from olist_dataset 
group by review_score order by review_score desc;

