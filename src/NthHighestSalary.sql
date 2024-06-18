-- 177. Nth Highest Salary
-- SOURCE: https://leetcode.com/problems/nth-highest-salary/description/

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

-- Write a solution to find the nth highest salary from the Employee table. If there is no nth highest salary, return null.


-- TABLE SCHEMA:
Create table If Not Exists Employee (Id int, Salary int)
Truncate table Employee
insert into Employee (id, salary) values ('1', '100')
insert into Employee (id, salary) values ('2', '200')
insert into Employee (id, salary) values ('3', '300')

-- SOLUTION:
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N=N-1;
  RETURN (
    SELECT
        distinct(salary)
    FROM employee
        ORDER BY salary desc
        limit 1 offset N
  );
END