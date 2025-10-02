
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









select * from products 