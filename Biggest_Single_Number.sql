-- 619. Biggest Single Number
-- SOURCE: https://leetcode.com/problems/biggest-single-number/description/?envType=study-plan-v2&envId=top-sql-50


-- PROBLEM:
-- Table: MyNumbers

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | num         | int  |
-- +-------------+------+
-- This table may contain duplicates (In other words, there is no primary key for this table in SQL).
-- Each row of this table contains an integer.

-- A single number is a number that appeared only once in the MyNumbers table.
-- Find the largest single number. If there is no single number, report null.



-- TABLE SCHEMA:
Create table If Not Exists MyNumbers (num int)
Truncate table MyNumbers
insert into MyNumbers (num) values ('8')
insert into MyNumbers (num) values ('8')
insert into MyNumbers (num) values ('3')
insert into MyNumbers (num) values ('3')
insert into MyNumbers (num) values ('1')
insert into MyNumbers (num) values ('4')
insert into MyNumbers (num) values ('5')
insert into MyNumbers (num) values ('6')

-- SOLUTION:
SELECT
    max(num) as num
FROM (  SELECT count(*), num
        FROM mynumbers
        GROUP BY num
        having count(*)=1   ) as uNum