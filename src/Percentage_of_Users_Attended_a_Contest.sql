-- 1633. Percentage of Users Attended a Contest
-- SOURCE: https://leetcode.com/problems/percentage-of-users-attended-a-contest/description/?envType=study-plan-v2&envId=top-sql-50


-- PROBLEM:
-- Table: Users

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | user_id     | int     |
-- | user_name   | varchar |
-- +-------------+---------+
-- user_id is the primary key (column with unique values) for this table.
-- Each row of this table contains the name and the id of a user.

-- Table: Register

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | contest_id  | int     |
-- | user_id     | int     |
-- +-------------+---------+
-- (contest_id, user_id) is the primary key (combination of columns with unique values) for this table.
-- Each row of this table contains the id of a user and the contest they registered into.

-- Write a solution to find the percentage of the users registered in each contest rounded to two decimals.
-- Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.



-- TABLE SCHEMA:
Create table If Not Exists Users (user_id int, user_name varchar(20))
Create table If Not Exists Register (contest_id int, user_id int)
Truncate table Users
insert into Users (user_id, user_name) values ('6', 'Alice')
insert into Users (user_id, user_name) values ('2', 'Bob')
insert into Users (user_id, user_name) values ('7', 'Alex')
Truncate table Register
insert into Register (contest_id, user_id) values ('215', '6')
insert into Register (contest_id, user_id) values ('209', '2')
insert into Register (contest_id, user_id) values ('208', '2')
insert into Register (contest_id, user_id) values ('210', '6')
insert into Register (contest_id, user_id) values ('208', '6')
insert into Register (contest_id, user_id) values ('209', '7')
insert into Register (contest_id, user_id) values ('209', '6')
insert into Register (contest_id, user_id) values ('215', '7')
insert into Register (contest_id, user_id) values ('208', '7')
insert into Register (contest_id, user_id) values ('210', '2')
insert into Register (contest_id, user_id) values ('207', '2')
insert into Register (contest_id, user_id) values ('210', '7')



-- SOLUTION:
SELECT
    distinct contest_id,
    round(count(r.user_id) over(partition by r.contest_id)/(select count(*) from users)*100,2)  as percentage
FROM users u
INNER JOIN register r
ON u.user_id=r.user_id
ORDER BY percentage desc, contest_id asc