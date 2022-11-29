Drop database if Exists `e_commerce_website`;
create database e_commerce_website;
use e_commerce_website;

-- 1. Create databases

create table if not Exists `supplier`(
supp_id int not null,
supp_name varchar(50) not null,
supp_city varchar(50) not null,
supp_phone varchar(50) not null,
primary key(supp_id));

create table if not Exists `customer`(
cus_id int not null,
cus_name varchar(20) not null,
cus_phone varchar(10) not null,
cus_city varchar(30) not null,
cus_gender char,
primary key(cus_id));

create table if not Exists `category`(
cat_id int not null,
cat_name varchar(20) not null,
primary key(cat_id));

create table if not Exists `product`(
pro_id int not null,
pro_name varchar(20) not null default 'Dummy',
pro_desc varchar(60),
cat_id int not null,
primary key(pro_id),
foreign key (cat_id) references category(cat_id));

create table if not Exists `supplier_pricing`(
pricing_id int not null,
pro_id int not null,
supp_id int not null,
supp_price int not null default 0,
primary key(pricing_id),
foreign key (pro_id) references product(pro_id),
foreign key (supp_id) references supplier(supp_id));

create table if not Exists `order`(
ord_id int not null,
ord_amount int not null,
ord_date date not null,
cus_id int not null,
pricing_id int not null,
primary key(ord_id),
foreign key (cus_id) references customer(cus_id),
foreign key (pricing_id) references supplier_pricing(pricing_id));

create table if not Exists `rating`(
rat_id int not null,
ord_id int not null,
rat_ratstars int not null,
primary key(rat_id),
foreign key (ord_id) references `order`(ord_id));

-- 2. Insert data 

INSERT INTO 
		supplier (supp_id, supp_name, supp_city, supp_phone)
VALUES
		(1, "Rajesh Retails", "Delhi", "1234567890"),
        (2, "Appario Ltd.",	"Mumbai", "2589631470"),
        (3, "Knome products", "Banglore", "9785462315"),
        (4, "Bansal Retails", "Kochi", "8975463285"),
        (5, "Mittal Ltd.", "Lucknow", "7898456532");
        
INSERT INTO 
		customer (cus_id, cus_name, cus_phone, cus_city, cus_gender)
VALUES
		(1, "AAKASH", "9999999999", "DELHI", 'M'),
        (2, "AMAN", "9785463215", "NOIDA", 'M'),
        (3, "NEHA", "9999999999", "MUMBAI", 'F'),
        (4, "MEGHA", "9994562399",	"KOLKATA", 'F'),
        (5, "PULKIT", "7895999999",	"LUCKNOW", 'M');
        
INSERT INTO 
		category (cat_id, cat_name)
VALUES
		(1, "BOOKS"),
        (2, "GAMES"),
        (3, "GROCERIES"),
        (4, "ELECTRONICS"),
        (5, "CLOTHES");
        
INSERT INTO 
		product (pro_id, pro_name, pro_desc, cat_id)
VALUES
		(1, "GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2),
        (2, "TSHIRT", "SIZE-L with Black, Blue and White variations", 5),
        (3, "ROG LAPTOP", "Windows 10 with 15inch screen, i7 processor, 1TB SSD", 4),
        (4, "OATS", "Highly Nutritious from Nestle", 3),
        (5, "HARRY POTTER", "Best Collection of all time by J.K Rowling", 1),
        (6,	"MILK", "1L Toned Milk", 3),
        (7, "Boat Earphones", "1.5Meter long Dolby Atmos", 4),
        (8, "Jeans", "Stretchable Denim Jeans with various sizes and color", 5),
		(9, "Project IGI", "compatible with windows 7 and above", 2),
        (10, "Hoodie", "Black GUCCI for 13 yrs and above", 5),
        (11, "Rich Dad Poor Dad", "Written by Robert Kiyosaki", 1),
        (12, "Train Your Brain", "By Shireen Stephen", 1);
        
INSERT INTO 
		supplier_pricing (pricing_id, pro_id, supp_id, supp_price)
VALUES
		(1, 1, 2, 1500),
        (2, 3, 5, 30000),
        (3, 5, 1, 3000),
        (4, 2, 3, 2500),
        (5, 4, 1, 1000),
        (6, 12, 2, 780),
        (7, 12, 4, 789),
        (8, 3, 1, 31000),
        (9, 1, 5, 1450),
        (10, 4, 2, 999),
        (11, 7, 3, 549),
        (12, 7, 4, 529),
        (13, 6, 2, 105),
        (14, 6, 1, 99),
        (15, 2, 5, 2999),
        (16, 5, 2, 2999);
        
INSERT INTO 
		`order` (ord_id, ord_amount, ord_date, cus_id, pricing_id)
VALUES
		(101, 1500, '2021-10-06', 2, 1),
        (102, 1000, '2021-10-12', 3, 5),
        (103, 30000, '2021-09-16', 5, 2),
        (104, 1500, '2021-10-05', 1, 1),
        (105, 3000, '2021-08-16', 4, 3),
        (106, 1450, '2021-08-18', 1, 9),
        (107, 789, '2021-09-01', 3, 7),
        (108, 780, '2021-09-07', 5, 6),
        (109, 3000, '2021-09-10', 5, 3),
        (110, 2500, '2021-09-10', 2, 4),
        (111, 1000, '2021-09-15', 4, 5),
		(112, 789, '2021-09-16', 4, 7),
		(113, 31000, '2021-09-16', 1, 8),
		(114, 1000, '2021-09-16', 3, 5),
		(115, 3000, '2021-09-16', 5, 3),
		(116, 99, '2021-09-17', 2, 14);
        
INSERT INTO 
		rating (rat_id, ord_id, rat_ratstars)
VALUES
		(1, 101, 4),
        (2, 102, 3),
        (3, 103, 1),
        (4, 104, 2),
        (5, 105, 4),
		(6, 106, 3),
		(7, 107, 4),
		(8, 108, 4),
		(9, 109, 3),
		(10, 110, 5),
		(11, 111, 3),
		(12, 112, 4),
		(13, 113, 2),
		(14, 114, 1),
		(15, 115, 1),
		(16, 116, 0);

-- Queries 
-- 3. Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
Select count(customer.cus_id) as Total_number_of_customers, customer.cus_gender as Gender from customer inner join 
`order` on customer.cus_id = `order`.cus_id where `order`.ord_amount >= 3000 group by customer.cus_gender;

-- 4. Display all the orders along with product name ordered by a customer having Customer_Id=2 
Select T.ord_id as Order_ID, T.pro_id as Product_ID, P.pro_name as Product_Name, P.pro_desc as Product_Description
from product as P inner join
(Select S.pro_id, D.pricing_id, D.ord_id from supplier_pricing as S inner join
(Select ord_id, pricing_id  from `order` where cus_id = 2) as D where D.pricing_id = S.pricing_id) as T 
where T.pro_id = P.pro_id;

/* Alternate solution for 4
Select O.*, P.pro_name as Product_Name from `order` as O, supplier_pricing as S, product as P 
where cus_id = 2
and O.pricing_id = S.pricing_id
and S.pro_id = P.pro_id; */

-- 5. Display the Supplier details who can supply more than one product.
Select S.* from supplier as S where 1<(select count(SP.pro_id) from supplier_pricing as SP where S.supp_id = SP.supp_id) 
order by S.supp_id;

-- 6. Find the least expensive product from each category and print the table with category id, name, 
-- product name and price of the product
Select C.cat_id as Category_ID, C.cat_name as Category_Name, P.pro_name as Product_Name, SP.supp_price as Price_of_the_product
from category C
inner join product P on P.cat_id = C.cat_id
inner join supplier_pricing SP on SP.pro_id = P.pro_id
where supp_price in (Select min(supp_price) from category as C, product as P, supplier_pricing as SP where
C.cat_id = P.cat_id and SP.pro_id = P.pro_id 
group by C.cat_id);

-- 7. Display the Id and Name of the Product ordered after “2021-10-05”. 
Select P.pro_id as Id, P.pro_name as Name_of_product, U.ord_date as Ordered_date from product as P inner join
(Select S.pricing_id, S.pro_id, T.ord_date from supplier_pricing as S inner join 
(Select O.ord_date, O.pricing_id from `order` as O where ord_date>"2021-10-05" order by ord_date) as T 
where S.pricing_id = T.pricing_id) as U where P.pro_id = U.pro_id;

-- 8. Display customer name and gender whose names start or end with character 'A'.
select cus_name as Customer_Name, cus_gender as Gender from Customer 
where cus_name LIKE '%A%' order by Customer_Name;

-- 9. Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
-- For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, 
-- If rating >2 print “Average Service” else print “Poor Service”. 
call SupplierDetails();


















	






