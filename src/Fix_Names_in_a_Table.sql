-- 1667. Fix Names in a Table
-- SOURCE: https://leetcode.com/problems/fix-names-in-a-table/description/?envType=study-plan-v2&envId=top-sql-50


-- PROBLEM:
-- SQL Schema
-- Pandas Schema
-- Table: Users

-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | user_id        | int     |
-- | name           | varchar |
-- +----------------+---------+
-- user_id is the primary key (column with unique values) for this table.
-- This table contains the ID and the name of the user. The name consists of only lowercase and uppercase characters.

-- Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.
-- Return the result table ordered by user_id.

-- TABLE SCHEMA:
Create table If Not Exists Users (user_id int, name varchar(40))
Truncate table Users
insert into Users (user_id, name) values ('1', 'aLice')
insert into Users (user_id, name) values ('2', 'bOB')


-- SOLUTION:
SELECT
    user_id,
    concat (upper(substring(name,1,1)),lower(substring(name,2))) as name
FROM users
    ORDER BY user_id