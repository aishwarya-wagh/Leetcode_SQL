-- 1070. Product Sales Analysis III
-- SOURCE: https://leetcode.com/problems/product-sales-analysis-iii/?envType=study-plan-v2&envId=top-sql-50


-- PROBLEM:
--     Table: Sales

--     +-------------+-------+
--     | Column Name | Type  |
--     +-------------+-------+
--     | sale_id     | int   |
--     | product_id  | int   |
--     | year        | int   |
--     | quantity    | int   |
--     | price       | int   |
--     +-------------+-------+
--     (sale_id, year) is the primary key (combination of columns with unique values) of this table.
--     product_id is a foreign key (reference column) to Product table.
--     Each row of this table shows a sale on the product product_id in a certain year.
--     Note that the price is per unit.


--     Table: Product

--     +--------------+---------+
--     | Column Name  | Type    |
--     +--------------+---------+
--     | product_id   | int     |
--     | product_name | varchar |
--     +--------------+---------+
--     product_id is the primary key (column with unique values) of this table.
--     Each row of this table indicates the product name of each product.


--     Write a solution to select the product id, year, quantity, and price for the first year of every product sold.
--     Return the resulting table in any order.


-- TABLE SCHEMA:
Create table If Not Exists Sales (sale_id int, product_id int, year int, quantity int, price int)
Create table If Not Exists Product (product_id int, product_name varchar(10))
Truncate table Sales
insert into Sales (sale_id, product_id, year, quantity, price) values ('1', '100', '2008', '10', '5000')
insert into Sales (sale_id, product_id, year, quantity, price) values ('2', '100', '2009', '12', '5000')
insert into Sales (sale_id, product_id, year, quantity, price) values ('7', '200', '2011', '15', '9000')
Truncate table Product
insert into Product (product_id, product_name) values ('100', 'Nokia')
insert into Product (product_id, product_name) values ('200', 'Apple')
insert into Product (product_id, product_name) values ('300', 'Samsung')


-- SOLUTION:
SELECT
    product_id,
    year as first_year,
    quantity,
    price
FROM sales
WHERE (product_id, year) in (
    SELECT product_id,min(year)
    FROM sales
    group by product_id
)
