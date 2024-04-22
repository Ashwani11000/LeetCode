---------------------------------------
---------- Problem Statement ----------
---------------------------------------
-- 180.ConsecutiveNumbers
-- Table: Logs

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | num         | varchar |
-- +-------------+---------+
-- In SQL, id is the primary key for this table.
-- id is an autoincrement column.
 

-- Find all numbers that appear at least three times consecutively.
-- Return the result table in any order.
-- The result format is in the following example.
 

-- Example 1:

-- Input: 
-- Logs table:
-- +----+-----+
-- | id | num |
-- +----+-----+
-- | 1  | 1   |
-- | 2  | 1   |
-- | 3  | 1   |
-- | 4  | 2   |
-- | 5  | 1   |
-- | 6  | 2   |
-- | 7  | 2   |
-- +----+-----+
-- Output: 
-- +-----------------+
-- | ConsecutiveNums |
-- +-----------------+
-- | 1               |
-- +-----------------+
-- Explanation: 1 is the only number that appears consecutively for at least three times.



------------------------------
---------- Solution ----------
------------------------------
SELECT DISTINCT L1.NUM AS ConsecutiveNums
FROM LOGS L1
INNER JOIN LOGS L2
ON L1.ID= L2.ID-1
    AND L1.NUM=L2.NUM
INNER JOIN LOGS L3
ON L2.ID= L3.ID-1
    AND L2.NUM=L3.NUM


-- Can also try something like this.
-- SELECT DISTINCT L1.NUM AS ConsecutiveNums
-- FROM LOGS L1, LOGS L2, LOGS L3
-- WHERE L1.ID= L2.ID-1
--     AND L1.NUM=L2.NUM
--     AND L2.ID= L3.ID-1
--     AND L2.NUM=L3.NUM

-- It’s equivalent to a CROSS JOIN between tables, but since we are filtering the records later on, this should work. 