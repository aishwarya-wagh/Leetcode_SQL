-- 1757. Recyclable and Low Fat Products
-- SOURCE: https://leetcode.com/problems/recyclable-and-low-fat-products/?envType=study-plan-v2&envId=top-sql-50

-- PROBLEM STATEMENT:
--   Table: Products

--     +-------------+---------+
--     | Column Name | Type    |
--     +-------------+---------+
--     | product_id  | int     |
--    | low_fats    | enum    |
--     | recyclable  | enum    |
--     +-------------+---------+
--     product_id is the primary key (column with unique values) for this table.
--     low_fats is an ENUM (category) of type ('Y', 'N') where 'Y' means this product is low fat and 'N' means it is not.
--     recyclable is an ENUM (category) of types ('Y', 'N') where 'Y' means this product is recyclable and 'N' means it is not.


-- TABLE SCHEMA:
Create table If Not Exists Products (product_id int, low_fats ENUM('Y', 'N'), recyclable ENUM('Y','N'))
Truncate table Products
insert into Products (product_id, low_fats, recyclable) values ('0', 'Y', 'N')
insert into Products (product_id, low_fats, recyclable) values ('1', 'Y', 'Y')
insert into Products (product_id, low_fats, recyclable) values ('2', 'N', 'Y')
insert into Products (product_id, low_fats, recyclable) values ('3', 'Y', 'Y')
insert into Products (product_id, low_fats, recyclable) values ('4', 'N', 'N')


-- SOLUTION:

SELECT
    product_id
FROM  products
WHERE low_fats='Y' and recyclable='Y'