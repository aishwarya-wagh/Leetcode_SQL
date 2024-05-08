-- 197. Rising Temperature
-- SOURCE: https://leetcode.com/problems/rising-temperature/?envType=study-plan-v2&envId=top-sql-50

-- PROBLEM:
-- Table: Weather

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | recordDate    | date    |
-- | temperature   | int     |
-- +---------------+---------+
-- id is the column with unique values for this table.
-- There are no different rows with the same recordDate.
-- This table contains information about the temperature on a certain day.

-- Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
-- Return the result table in any order.


-- TABLE SCHEMA:
Create table If Not Exists Weather (id int, recordDate date, temperature int)
Truncate table Weather
insert into Weather (id, recordDate, temperature) values ('1', '2015-01-01', '10')
insert into Weather (id, recordDate, temperature) values ('2', '2015-01-02', '25')
insert into Weather (id, recordDate, temperature) values ('3', '2015-01-03', '20')
insert into Weather (id, recordDate, temperature) values ('4', '2015-01-04', '30')


-- SOLUTION:
SELECT
    w1.id
FROM Weather w1
INNER JOIN weather w2
    ON date(w1.recordDate- interval 1 day)=date(w2.recordDate)
WHERE w1.temperature>w2.temperature

