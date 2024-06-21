-- 626. Exchange Seats
-- SOURCE: https://leetcode.com/problems/exchange-seats/?envType=study-plan-v2&envId=top-sql-50

-- PROBLEM:
-- Table: Seat

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | student     | varchar |
-- +-------------+---------+
-- id is the primary key (unique value) column for this table.
-- Each row of this table indicates the name and the ID of a student.
-- id is a continuous increment.

-- Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.
-- Return the result table ordered by id in ascending order.


-- TABLE SCHEMA:
Create table If Not Exists Seat (id int, student varchar(255))
Truncate table Seat
insert into Seat (id, student) values ('1', 'Abbot')
insert into Seat (id, student) values ('2', 'Doris')
insert into Seat (id, student) values ('3', 'Emerson')
insert into Seat (id, student) values ('4', 'Green')
insert into Seat (id, student) values ('5', 'Jeames')

-- SOLUTION:
SELECT
    case    when id = count(id) over()and id%2=1  then id
            when id%2=1 then id+1
            when id%2=0 then id-1
    end as id,
    student
FROM seat
order by id