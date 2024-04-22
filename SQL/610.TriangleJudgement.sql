---------------------------------------
---------- Problem Statement ----------
---------------------------------------
-- 610. Triangle Judgement
-- Table: Triangle

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | x           | int  |
-- | y           | int  |
-- | z           | int  |
-- +-------------+------+
-- In SQL, (x, y, z) is the primary key column for this table.
-- Each row of this table contains the lengths of three line segments.
 
-- Report for every three line segments whether they can form a triangle.
-- Return the result table in any order.
-- The result format is in the following example.

-- Example 1:

-- Input: 
-- Triangle table:
-- +----+----+----+
-- | x  | y  | z  |
-- +----+----+----+
-- | 13 | 15 | 30 |
-- | 10 | 20 | 15 |
-- +----+----+----+
-- Output: 
-- +----+----+----+----------+
-- | x  | y  | z  | triangle |
-- +----+----+----+----------+
-- | 13 | 15 | 30 | No       |
-- | 10 | 20 | 15 | Yes      |
-- +----+----+----+----------+ 


------------------------------
---------- Solution ----------
------------------------------
SELECT  X,
        Y,
        Z,
        IF(X+Y>Z AND Y+Z>X AND X+Z>Y, 'Yes', 'No') AS TRIANGLE 
FROM TRIANGLE

-- Basic maths : In a triangle, Sum of two sides is always going to be greater than the third side.
-- Same condition can be achieved through CASE statement as the IF statement is MySQL specific.