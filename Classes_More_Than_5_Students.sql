-- 596. Classes More Than 5 Students
-- SOURCE: https://leetcode.com/problems/classes-more-than-5-students/description/?envType=study-plan-v2&envId=top-sql-50


-- PROBLEM:
-- Table: Courses

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | student     | varchar |
-- | class       | varchar |
-- +-------------+---------+
-- (student, class) is the primary key (combination of columns with unique values) for this table.
-- Each row of this table indicates the name of a student and the class in which they are enrolled.

-- Write a solution to find all the classes that have at least five students.
-- Return the result table in any order.


-- TABLE SCHEMA:
Create table If Not Exists Courses (student varchar(255), class varchar(255))
Truncate table Courses
insert into Courses (student, class) values ('A', 'Math')
insert into Courses (student, class) values ('B', 'English')
insert into Courses (student, class) values ('C', 'Math')
insert into Courses (student, class) values ('D', 'Biology')
insert into Courses (student, class) values ('E', 'Math')
insert into Courses (student, class) values ('F', 'Computer')
insert into Courses (student, class) values ('G', 'Math')
insert into Courses (student, class) values ('H', 'Math')
insert into Courses (student, class) values ('I', 'Math')


-- SOLUTION:
SELECT
    class
FROM courses
group by class
having count(distinct student)>=5