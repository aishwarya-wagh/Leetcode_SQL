-- 176. Second Highest Salary
-- SOURCE: https://leetcode.com/problems/second-highest-salary/description/?envType=study-plan-v2&envId=top-sql-50

-- PROBLEM:
-- Table: Employee

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains information about the salary of an employee.

-- Write a solution to find the second highest salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).

-- TABLE SCHEMA:
Create table If Not Exists Employee (id int, salary int)
Truncate table Employee
insert into Employee (id, salary) values ('1', '100')
insert into Employee (id, salary) values ('2', '200')
insert into Employee (id, salary) values ('3', '300')

-- SOLUTION:
SELECT (
    SELECT distinct salary
    FROM employee
    order by salary desc
    limit 1 offset 1)
as SecondHighestSalary