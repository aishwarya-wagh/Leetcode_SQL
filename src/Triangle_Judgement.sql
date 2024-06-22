-- 610. Triangle Judgement
-- SOURCE: https://leetcode.com/problems/triangle-judgement/description/?envType=study-plan-v2&envId=top-sql-50

-- PROBLEM:
-- Table: Triangle

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | x           | int  |
-- | y           | int  |
-- | z           | int  |
-- +-------------+------+
-- In SQL, (x, y, z) is the primary key column for this table.
-- Each row of this table contains the lengths of three line segments.

-- Report for every three line segments whether they can form a triangle.
-- Return the result table in any order.

-- TABLE SCHEMA:
Create table If Not Exists Triangle (x int, y int, z int)
Truncate table Triangle
insert into Triangle (x, y, z) values ('13', '15', '30')
insert into Triangle (x, y, z) values ('10', '20', '15')

-- SOLUTION:
SELECT
     *,
    case    when (x+y)>z and (z+y)>x and (x+z)>y then 'Yes'
            else 'No'
    end as triangle
FROM triangle
