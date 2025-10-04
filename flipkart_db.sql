
-- creating a table 


create table products (
product_id serial primary key,
name varchar(100) not null  ,
sku_code char(8) unique not null check (char_length(sku_code) = 8 ),
price numeric(10,2) check (price >= 0),
stock_quantity int default 0 check (stock_quantity >= 0) ,
is_available boolean default TRUE ,
category text not null ,
added_on date default current_date ,
last_update timestamp default now()

);


--inserting values init 

insert into products(name , sku_code , price , stock_quantity , is_available , category )
values 
('Wireless Mouse', 'WM123456', 699.99, 50, TRUE, 'Electronics'),
('Bluetooth Speaker', 'BS234567', 1499.00, 30, TRUE, 'Electronics'),
('Laptop Stand', 'LS345678', 799.50, 20, TRUE, 'Accessories'),
('USB-C Hub', 'UC456789', 1299.99, 15, TRUE, 'Accessories'),
('Notebook', 'NB567890', 99.99, 100, TRUE, 'Stationery'),
('Pen Set', 'PS678901', 199.00, 200, TRUE, 'Stationery'),
('Coffee Mug', 'CM789012', 299.00, 75, TRUE, 'Home & Kitchen'),
('LED Desk Lamp', 'DL890123', 899.00, 40, TRUE, 'Home & Kitchen'),
('Yoga Mat', 'YM901234', 499.00, 25, TRUE, 'Fitness'),
('Water Bottle', 'WB012345', 349.00, 60, TRUE, 'Fitness');


-- Show the name and price of all the products 
select name , price 
from products;

-- show all products where the category is "electronics "
select * from products 
where category = 'Electronics' ;


-- group products by category , show each category once 
select category from products 
group by category ;

-- show categories that have more than 1 product (use after group by)
select category ,count(*) from products 
group by category 
having count(*)>1;

-- show all products sorted by price in ascending order 
select * from products 
order by price ;   -- default in ascending order

-- show only the frist 3 products from the table 
select * from products 
limit 3;

-- show product name as "item_name " and price as "item_price"
select name as item_name , price as item_price from products ;


-- show all the unique categories from the products 
select distinct category from products ;






-- COMPARISON OPERATORS 

select * from products 
where category != 'Electronics'


select * from products 
where price > 1000;


select * from products 
where price > 1000
and category = 'Electronics';





select * from products 
where price < 1000
and price > 400;

-- works the same 

select * from products 
where price 
between 400 and 1000;





select * from products 
where category = 'Electronics'
or category = 'Fitness'
or category = 'Home & Kitchen';

--works the same 

select * from products 
where category in ('Electronics', 'Fitness','Home & Kitchen');



select * from products 
where sku_code 
like 'W%';  -- starts with W


select * from products 
where sku_code 
like '%123%';  -- have 123 in btw

select * from products 
where sku_code 
like '_B%';  -- have 2nd letter B


select * from products 
where not category  = 'Electronics';   -- no electronics will print





-- Aggregation Functions 

select count (product_id) from products ;

select sum(price) from products ;


select sum(price) from products 
where category = 'Electronics' 
or category = 'Fitness';


select avg(price) from products  ;

select round(avg(price),2) from products  ; -- round off

select min(price) from products  ;

select max(price) from products  ;


-- Test

-- display the name and price of the cheapest product in the entire table 
select name , price from products 
where price = (select min(price) from products);


-- find the average price of products that belong to the 'home & kitchen ' or 'fitness' category 
select round(avg(price),2) from products 
where category = 'Home & Kitchen' or category = 'Fitness';


-- show product names and stock quantity where the product is available ,stock is more than 50 and price is not equal to 299
select name , stock_quantity from products 
where is_available = true and stock_quantity > 50 and price != 299 ;

-- find the most expensive product in each category (name and price)
select  category ,max(price) as max_price from products 
group by category;

-- show all unique categories in uppercase , sorted in descending order ?
select distinct upper(category) as category from products 
order by Category desc;






--String functions

select upper(name) from products ;

select lower(sku_code) from products ;

select length (name ) from products ;


-- substring 

select name , lower(substring(sku_code , 1,2) ) as sku_code_lower from products ;   --multiple string functionality 
 
--left and right

select name ,left(sku_code,2 ) from products ;

select name ,right(sku_code,2 ) from products ;




--concat
select concat(name ,' ',category ) as product_with_category from products ;

--with space 
select concat_ws(' ',name,category ) as product_with_category from products ;   --btw both works the same  :)





--trim and replace

select trim('   lavender   ');

select name , replace (sku_code ,left(sku_code,2),'GG')from products ;







--CASE --

--like if else 

select name , price ,
CASE 
	WHEN (price > 1000) then 'Expensive'
	WHEN price between 500 and 1000 then 'Moderate'
	ELSE 'Cheap'
END AS price_tage
from products ;   --its just a snapshot


--to actually create a new column as price_tage


ALTER TABLE products
add column price_tage text ;



--updating that column using the case senerio


update products 
set price_tage = 
CASE
	WHEN (price > 1000) then 'Expensive'
	WHEN price between 500 and 1000 then 'Moderate'
	ELSE 'Cheap'
END ;                   --AS price_tage--   no need for this now 
where product_id = 1 


--question 1 
select name ,
CASE 
	WHEN is_available then 'in stock'
	else 'out of stock'
end as availability_status
from products ;


--question 2



select * from products ;















