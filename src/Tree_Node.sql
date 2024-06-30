-- 608. Tree Node
-- SOURCE: https://leetcode.com/problems/tree-node/description/

-- PROBLEM STATEMENT:
-- Table: Tree

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | p_id        | int  |
-- +-------------+------+
-- id is the column with unique values for this table.
-- Each row of this table contains information about the id of a node and the id of its parent node in a tree.
-- The given structure is always a valid tree.

-- Each node in the tree can be one of three types:
-- "Leaf": if the node is a leaf node.
-- "Root": if the node is the root of the tree.
-- "Inner": If the node is neither a leaf node nor a root node.
-- Write a solution to report the type of each node in the tree.

-- Return the result table in any order.

-- TABLE SCHEMA:
Create table If Not Exists Tree (id int, p_id int)
Truncate table Tree
insert into Tree (id, p_id) values ('1', 'None')
insert into Tree (id, p_id) values ('2', '1')
insert into Tree (id, p_id) values ('3', '1')
insert into Tree (id, p_id) values ('4', '2')
insert into Tree (id, p_id) values ('5', '2')

-- SOLUTION:

select
id,
case
    when p_id is null then 'Root'
    when id  in (select p_id from tree) then 'Inner'
    else 'Leaf'
end as type
from tree

