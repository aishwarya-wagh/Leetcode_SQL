-- 1045. Customers Who Bought All Products
-- SOURCE:  https://leetcode.com/problems/customers-who-bought-all-products/?envType=study-plan-v2&envId=top-sql-50


-- PROBLEM:
-- Table: Customer

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | customer_id | int     |
-- | product_key | int     |
-- +-------------+---------+
-- This table may contain duplicates rows.
-- customer_id is not NULL.
-- product_key is a foreign key (reference column) to Product table.

-- Table: Product

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | product_key | int     |
-- +-------------+---------+
-- product_key is the primary key (column with unique values) for this table.


-- Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.
-- Return the result table in any order.


-- TABLE SCHEMA:
Create table If Not Exists Customer (customer_id int, product_key int)
Create table Product (product_key int)
Truncate table Customer
insert into Customer (customer_id, product_key) values ('1', '5')
insert into Customer (customer_id, product_key) values ('2', '6')
insert into Customer (customer_id, product_key) values ('3', '5')
insert into Customer (customer_id, product_key) values ('3', '6')
insert into Customer (customer_id, product_key) values ('1', '6')
Truncate table Product
insert into Product (product_key) values ('5')
insert into Product (product_key) values ('6')



-- SOLUTION:
SELECT
    customer_id
FROM customer
    GROUP BY customer_id
    HAVING  count(distinct product_key)= (select count(*) from product)