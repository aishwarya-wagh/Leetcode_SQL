-- 1164. Product Price at a Given Date
-- SOURCE: https://leetcode.com/problems/product-price-at-a-given-date/?envType=study-plan-v2&envId=top-sql-50

-- PROBLEM:
-- Table: Products

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | new_price     | int     |
-- | change_date   | date    |
-- +---------------+---------+
-- (product_id, change_date) is the primary key (combination of columns with unique values) of this table.
-- Each row of this table indicates that the price of some product was changed to a new price at some date.

-- Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.
-- Return the result table in any order.


-- TABLE SCHEMA:
Create OR replace TABLE Products(product_id int, new_price int, change_date date);
Truncate table Products;
insert into Products (product_id, new_price, change_date) values ('1', '20', '2019-08-14')
insert into Products (product_id, new_price, change_date) values ('2', '50', '2019-08-14')
insert into Products (product_id, new_price, change_date) values ('1', '30', '2019-08-15')
insert into Products (product_id, new_price, change_date) values ('1', '35', '2019-08-16')
insert into Products (product_id, new_price, change_date) values ('2', '65', '2019-08-17')
insert into Products (product_id, new_price, change_date) values ('3', '20', '2019-08-18')


-- SOLUTION:

SELECT
    distinct product_id,
    10 as price
FROM Products
    where product_id not in( select distinct product_id from Products where change_date <='2019-08-16' )

UNION

SELECT
    product_id,
    new_price as price
FROM Products
    where (product_id,change_date) in ( select product_id , max(change_date) as date from Products where change_date <='2019-08-16' group by product_id)