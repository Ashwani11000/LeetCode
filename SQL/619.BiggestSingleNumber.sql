---------------------------------------
---------- Problem Statement ----------
---------------------------------------

-- 619. Biggest Single Number

-- Table: MyNumbers

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | num         | int  |
-- +-------------+------+
-- This table may contain duplicates (In other words, there is no primary key for this table in SQL).
-- Each row of this table contains an integer.
 

-- A single number is a number that appeared only once in the MyNumbers table.

-- Find the largest single number. If there is no single number, report null.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- MyNumbers table:
-- +-----+
-- | num |
-- +-----+
-- | 8   |
-- | 8   |
-- | 3   |
-- | 3   |
-- | 1   |
-- | 4   |
-- | 5   |
-- | 6   |
-- +-----+
-- Output: 
-- +-----+
-- | num |
-- +-----+
-- | 6   |
-- +-----+
-- Explanation: The single numbers are 1, 4, 5, and 6.
-- Since 6 is the largest single number, we return it.
-- Example 2:

-- Input: 
-- MyNumbers table:
-- +-----+
-- | num |
-- +-----+
-- | 8   |
-- | 8   |
-- | 7   |
-- | 7   |
-- | 3   |
-- | 3   |
-- | 3   |
-- +-----+
-- Output: 
-- +------+
-- | num  |
-- +------+
-- | null |
-- +------+
-- Explanation: There are no single numbers in the input table so we return null.

------------------------------
---------- Solution ----------
------------------------------

SELECT IFNULL(
    (SELECT NUM
        FROM MYNUMBERS
        GROUP BY NUM
            HAVING COUNT(1)=1
        ORDER BY NUM DESC
    LIMIT 1), NULL
    ) AS NUM

-- ANOTHER APPROACH USING MAX FUNCTION TO HANDLE EMPTY RESULT FROM SUBQUERY, MAX() RETURNS NULL IF NOTHING TO PASSED TO IT
-- SELECT MAX(NUM) AS NUM
-- FROM
-- (SELECT NUM
--     FROM MYNUMBERS
--     GROUP BY NUM
--         HAVING COUNT(1)=1
-- ) MNUM

-- ANOTHER APPROACH USING CASE WHEN STATEMENT
-- SELECT CASE WHEN CNT =1 THEN NUM ELSE null END AS NUM
-- FROM
-- (SELECT NUM, COUNT(1) CNT
-- FROM MYNUMBERS
-- GROUP BY NUM
-- ORDER BY CNT ASC,NUM DESC
-- LIMIT 1) MYNUM