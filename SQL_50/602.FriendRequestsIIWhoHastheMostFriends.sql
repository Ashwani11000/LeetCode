---------------------------------------
---------- Problem Statement ----------
---------------------------------------

-- 602. Friend Requests II: Who Has the Most Friends
-- Solved
-- Medium
-- Topics
-- Companies
-- Hint
-- SQL Schema
-- Pandas Schema
-- Table: RequestAccepted

-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | requester_id   | int     |
-- | accepter_id    | int     |
-- | accept_date    | date    |
-- +----------------+---------+
-- (requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
-- This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
 

-- Write a solution to find the people who have the most friends and the most friends number.
-- The test cases are generated so that only one person has the most friends.
-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- RequestAccepted table:
-- +--------------+-------------+-------------+
-- | requester_id | accepter_id | accept_date |
-- +--------------+-------------+-------------+
-- | 1            | 2           | 2016/06/03  |
-- | 1            | 3           | 2016/06/08  |
-- | 2            | 3           | 2016/06/08  |
-- | 3            | 4           | 2016/06/09  |
-- +--------------+-------------+-------------+
-- Output: 
-- +----+-----+
-- | id | num |
-- +----+-----+
-- | 3  | 3   |
-- +----+-----+
-- Explanation: 
-- The person with id 3 is a friend of people 1, 2, and 4, so he has three friends in total, which is the most number than any others.


------------------------------
---------- Solution ----------
------------------------------
SELECT ID 
       ,SUM(FRIENDCOUNT) AS NUM
FROM
(
    SELECT REQUESTER_ID AS ID, COUNT(1) AS FRIENDCOUNT 
    FROM REQUESTACCEPTED 
    GROUP BY REQUESTER_ID
UNION ALL
    SELECT ACCEPTER_ID, COUNT(1) 
    FROM REQUESTACCEPTED 
    GROUP BY ACCEPTER_ID
) FRIENDALL
GROUP BY ID
ORDER BY NUM DESC
LIMIT 1


-- ALTERNATE APPROACH WITH CTEs AND COUNT ON ALL PEOPLE

-- WITH ALL_PEOPLE AS 
-- (
--     SELECT REQUESTER_ID AS ID 
--     FROM REQUESTACCEPTED
--     UNION ALL
--     SELECT ACCEPTER_ID
--     FROM REQUESTACCEPTED
-- )

-- SELECT ID, COUNT(ID) AS NUM
-- FROM ALL_PEOPLE
-- GROUP BY ID
-- ORDER BY NUM DESC
-- LIMIT 1
