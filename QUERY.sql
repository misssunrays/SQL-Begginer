CREATE DATABASE BIKE_SALES;
use bike_sales;
SELECT * 
FROM BRANDS;
select *
from customers;

-- List the first_name and last_name of all customers who live in New York.
select first_name,last_name,STATE
from customers
where state ='NY';

-- Display all products with a list_price greater than 2000.
select *
from products
where list_price >2000;

-- Show the order_id and order_date from the orders table, sorted by date (newest first).
select order_id,order_date
from orders
order by order_date DESC ;

-- Find all stores located in California.
select *
from stores
where state='california';

-- Get the details of customers whose last_name starts with "S".
select last_name,first_name
from customers
where last_name like 'S%';

select *
from customers;

-- Show all products in the category "Mountain Bikes".

select *
from categories
where category_name='mountain bikes';

-- List the top 5 most expensive products.
select product_name,list_price
from products
order by list_price DESC limit 5;

-- Find all customers with an email ending in "gmail.com".
select email
from customers
where email like '%gmail.com';

-- Display orders placed in the year 2018.
select *
from orders
where order_date like '2018%';

SELECT *
FROM orders
WHERE YEAR(order_date) = 2018;

-- Show the first_name, last_name, and phone of all customers who don’t have a NULL email.
select first_name,last_name,email,phone
from customers
where phone IS NOT NULL;

-- List all products that cost between 500 and 1500.
select *
from products
where list_price >500 and list_price < 1500
order by list_price desc limit 10; 

-- Display all customers whose city is not New York or Chicago.
select *
from customers
where city not in ('Chicago','New york');

-- Show all products whose product_name contains the word “Helmet”.
select *
from products
where product_name like '%Helmet%';

-- Find all customers whose first name has exactly 5 letters.
select first_name
from customers
where length(first_name)=5;

-- Display all orders where the order_status is not ‘Shipped’.
select *
from orders
where shipped_date is null;

-- List all products with a list_price higher than the average list price of all products.
select product_name
from products
where list_price>
(select avg(list_price) -- use of sub query
from products);

-- Show all products ordered by category_id first (ascending) and list_price (descending).
select *
from products
order by category_id asc, list_price desc;

-- Get all customers whose phone number ends with "9".
select *
from customers
where phone like '%9';

-- Show all customers whose city starts and ends with the same letter.
select *
from customers
where left(city,1) = right(city,1);

-- Find all orders that were not shipped.
select *
from orders
where shipped_date is null;

-- Display all products that belong to a category with “Road” in its name.

select *
from products
where product_name;

-- Count the total number of customers.
select count(*) -- select all rows
from customers;

-- Count how many products are in the store.
select count(*) as total_products
from products;

-- Find the average list_price of all products.
select round(avg(list_price), 2)as average
from products;

-- Get the minimum and maximum list_price of products
select min(list_price) as minimum ,max(list_price)  as maximum
from products;

-- Find the total revenue generated (use quantity * list_price from order_items).
select round (sum(quantity*list_price),2 )as reveneu
from order_items;

-- Count how many orders were placed by each customer.
select *
from orders;
select * 
from customers;

-- Show each order ID with the customer’s full name.
select first_name,last_name,orders.order_id
from customers
inner join orders
on customers.customer_id=orders.customer_id 
order by orders.order_id is null;

-- Display all products along with their category name.
select *
from categories;
select product_name,categories.category_id
from products
inner join categories
on products.category_id=categories.category_id;

-- Show all orders with the store name.
select store_name,o.store_id
from stores as s
inner join orders as o
on s.store_id= o.store_id;

-- List all sales staff and the store they work at.
select s.first_name,s.last_name,st.store_id,st.store_name
from staffs as s
inner join stores as st
on s.store_id=st.store_id ;

-- Display order ID, product name, and quantity ordered.
select o.order_id,p.product_name,o.quantity
from products as p
inner join order_items as o
on p.product_id=o.product_id ;

-- Show each customer’s name and the total number of orders they placed.
select first_name,last_name,count(o.order_id)
from  customers as c
inner join orders as o
on c.customer_id = o.customer_id
group by c.first_name,c.last_name;


SELECT *
FROM customers AS c
JOIN orders AS o 
ON c.customer_id = o.customer_id
WHERE c.first_name = 'Nova';

-- Show each category name and the number of products in that category.
select *
from categories;

select count(p.product_name),c.category_id, c.category_name
from products as p
join categories as c
on p.category_id=c.category_id
group by c.category_id,c.category_name;

-- Display each brand name and the average list price of its products.
select *
from brands;

select round(avg(p.list_price),2) as avg_price,b.brand_name
from products as p
join brands as b
on p.brand_id=b.brand_id 
group by b.brand_name;

-- Find each store name and the number of orders received.
select count(o.order_id) as total_orders ,store_name,s.store_id
from stores as s
inner join orders as o
on s.store_id=o.store_id
group by s.store_name,s.store_id
order by  total_orders desc ;

