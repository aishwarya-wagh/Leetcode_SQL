-- 601. Human Traffic of Stadium
-- SOURCE: https://leetcode.com/problems/human-traffic-of-stadium/description/


-- PROBLEM STATEMENT:
-- Table: Stadium

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | visit_date    | date    |
-- | people        | int     |
-- +---------------+---------+
-- visit_date is the column with unique values for this table.
-- Each row of this table contains the visit date and visit id to the stadium with the number of people during the visit.
-- As the id increases, the date increases as well.

-- Write a solution to display the records with three or more rows with consecutive id's, and the number of people is greater than or equal to 100 for each.
-- Return the result table ordered by visit_date in ascending order.


-- TABLE SCHEMA:
Create table If Not Exists Stadium (id int, visit_date DATE NULL, people int)
Truncate table Stadium
insert into Stadium (id, visit_date, people) values ('1', '2017-01-01', '10')
insert into Stadium (id, visit_date, people) values ('2', '2017-01-02', '109')
insert into Stadium (id, visit_date, people) values ('3', '2017-01-03', '150')
insert into Stadium (id, visit_date, people) values ('4', '2017-01-04', '99')
insert into Stadium (id, visit_date, people) values ('5', '2017-01-05', '145')
insert into Stadium (id, visit_date, people) values ('6', '2017-01-06', '1455')
insert into Stadium (id, visit_date, people) values ('7', '2017-01-07', '199')
insert into Stadium (id, visit_date, people) values ('8', '2017-01-09', '188')


-- SOLUTION:
with q1 as (
    select *,
    id - row_number() over() as id_diff
    from stadium
    where people > 99
)
select
    id,
    visit_date,
    people
from q1
    where id_diff in (select id_diff from q1 group by id_diff having count(*) > 2)
    order by visit_date