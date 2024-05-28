-- 1484. Group Sold Products By The Date
-- SOURCE: https://leetcode.com/problems/group-sold-products-by-the-date/?envType=study-plan-v2&envId=top-sql-50

-- PROBLEM:
-- Table Activities:

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | sell_date   | date    |
-- | product     | varchar |
-- +-------------+---------+
-- There is no primary key (column with unique values) for this table. It may contain duplicates.
-- Each row of this table contains the product name and the date it was sold in a market.


-- Write a solution to find for each date the number of different products sold and their names.

-- The sold products names for each date should be sorted lexicographically.
-- Return the result table ordered by sell_date.


-- TABLE SCHEMA:
Create table If Not Exists Activities (sell_date date, product varchar(20))
Truncate table Activities
insert into Activities (sell_date, product) values ('2020-05-30', 'Headphone')
insert into Activities (sell_date, product) values ('2020-06-01', 'Pencil')
insert into Activities (sell_date, product) values ('2020-06-02', 'Mask')
insert into Activities (sell_date, product) values ('2020-05-30', 'Basketball')
insert into Activities (sell_date, product) values ('2020-06-01', 'Bible')
insert into Activities (sell_date, product) values ('2020-06-02', 'Mask')
insert into Activities (sell_date, product) values ('2020-05-30', 'T-Shirt')

-- SOLUTION:
SELECT
    sell_date,
    count( distinct product) as num_sold,
    group_concat( distinct product order by product asc separator ',') as products
FROM activities a
    group by sell_date
    order by sell_date asc
