-- 1978. Employees Whose Manager Left the Company
-- SOURCE: https://leetcode.com/problems/employees-whose-manager-left-the-company/?envType=study-plan-v2&envId=top-sql-50

-- PROBLEM:
-- Table: Employees

-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | employee_id | int      |
-- | name        | varchar  |
-- | manager_id  | int      |
-- | salary      | int      |
-- +-------------+----------+
-- In SQL, employee_id is the primary key for this table.
-- This table contains information about the employees, their salary, and the ID of their manager. Some employees do not have a manager (manager_id is null).

-- Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. When a manager leaves the company, their information is deleted from the Employees table, but the reports still have their manager_id set to the manager that left.
-- Return the result table ordered by employee_id.

-- TABLE SCHEMA:
Create table If Not Exists Employees (employee_id int, name varchar(20), manager_id int, salary int)
Truncate table Employees
insert into Employees (employee_id, name, manager_id, salary) values ('3', 'Mila', '9', '60301')
insert into Employees (employee_id, name, manager_id, salary) values ('12', 'Antonella', 'None', '31000')
insert into Employees (employee_id, name, manager_id, salary) values ('13', 'Emery', 'None', '67084')
insert into Employees (employee_id, name, manager_id, salary) values ('1', 'Kalel', '11', '21241')
insert into Employees (employee_id, name, manager_id, salary) values ('9', 'Mikaela', 'None', '50937')
insert into Employees (employee_id, name, manager_id, salary) values ('11', 'Joziah', '6', '28485')

-- SOLUTION:
SELECT
    e.employee_id
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.employee_id
WHERE
    e.manager_id is not null
    and m.employee_id is null
    and e.salary < 30000
ORDER BY e.employee_id asc