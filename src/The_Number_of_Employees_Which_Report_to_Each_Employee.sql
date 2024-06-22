-- 1731. The Number of Employees Which Report to Each Employee
-- SOURCE: https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/?envType=study-plan-v2&envId=top-sql-50

-- PROBLEM:
-- Table: Employees

-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | employee_id | int      |
-- | name        | varchar  |
-- | reports_to  | int      |
-- | age         | int      |
-- +-------------+----------+
-- employee_id is the column with unique values for this table.
-- This table contains information about the employees and the id of the manager they report to. Some employees do not report to anyone (reports_to is null).

-- For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.
-- Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.

-- Return the result table ordered by employee_id.

-- TABLE SCHEMA:
Create table If Not Exists Employees(employee_id int, name varchar(20), reports_to int, age int)
Truncate table Employees
insert into Employees (employee_id, name, reports_to, age) values ('9', 'Hercy', 'None', '43')
insert into Employees (employee_id, name, reports_to, age) values ('6', 'Alice', '9', '41')
insert into Employees (employee_id, name, reports_to, age) values ('4', 'Bob', '9', '36')
insert into Employees (employee_id, name, reports_to, age) values ('2', 'Winston', 'None', '37')

-- SOLUTION:
SELECT
    e.employee_id,
    e.name,
    count(e2.employee_id) as reports_count,
    round(avg(e2.age)) as average_age
FROM employees e
LEFT JOIN employees e2
    ON e.employee_id=e2.reports_to
    group by e.employee_id, e.name
    having count(e2.employee_id)>0
    order by e.employee_id