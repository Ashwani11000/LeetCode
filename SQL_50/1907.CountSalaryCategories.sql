---------------------------------------
---------- Problem Statement ----------
---------------------------------------


-- 1907. Count Salary Categories
-- Table: Accounts

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | account_id  | int  |
-- | income      | int  |
-- +-------------+------+
-- account_id is the primary key (column with unique values) for this table.
-- Each row contains information about the monthly income for one bank account.
 

-- Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:

-- "Low Salary": All the salaries strictly less than $20000.
-- "Average Salary": All the salaries in the inclusive range [$20000, $50000].
-- "High Salary": All the salaries strictly greater than $50000.
-- The result table must contain all three categories. If there are no accounts in a category, return 0.

-- Return the result table in any order.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Accounts table:
-- +------------+--------+
-- | account_id | income |
-- +------------+--------+
-- | 3          | 108939 |
-- | 2          | 12747  |
-- | 8          | 87709  |
-- | 6          | 91796  |
-- +------------+--------+
-- Output: 
-- +----------------+----------------+
-- | category       | accounts_count |
-- +----------------+----------------+
-- | Low Salary     | 1              |
-- | Average Salary | 0              |
-- | High Salary    | 3              |
-- +----------------+----------------+
-- Explanation: 
-- Low Salary: Account 2.
-- Average Salary: No accounts.
-- High Salary: Accounts 3, 6, and 8.



------------------------------
---------- Solution ----------
------------------------------

WITH CAT2 AS
(SELECT 'Low Salary' AS CATEGORY
UNION ALL SELECT 'Average Salary' AS CATEGORY
UNION ALL SELECT 'High Salary' AS CATEGORY
)
SELECT CAT2.CATEGORY
, COUNT(CAT1.CATEGORY) AS ACCOUNTS_COUNT
FROM CAT2
LEFT JOIN
(SELECT CASE WHEN INCOME<20000
                THEN 'Low Salary'
             WHEN INCOME>=20000 AND INCOME<=50000
                THEN 'Average Salary'
            WHEN INCOME>50000
                THEN 'High Salary'
            END AS CATEGORY
FROM ACCOUNTS) CAT1
ON CAT1.CATEGORY = CAT2.CATEGORY
GROUP BY CAT2.CATEGORY

-- This can also be solved using a union of categories with count of records where the income satisfies the given condition. 

-- SELECT "Low Salary" AS CATEGORY,
--         SUM(CASE WHEN INCOME<20000 THEN 1 ELSE 0 END) AS ACCOUNTS_COUNT
--         FROM ACCOUNTS
-- UNION ALL
-- SELECT "Average Salary" AS CATEGORY,
--         SUM(CASE WHEN INCOME BETWEEN 20000 AND 50000 THEN 1 ELSE 0 END) AS ACCOUNTS_COUNT
--         FROM ACCOUNTS
-- UNION ALL
-- SELECT "High Salary" AS CATEGORY,
--         SUM(CASE WHEN INCOME>50000 THEN 1 ELSE 0 END) AS ACCOUNTS_COUNT
--         FROM ACCOUNTS
        
-- ALTERNATIVE SOLUTION WITH MAX OF CATEGORY UNION OF '0'
-- WITH ACCOUNTS_CATEGORY AS
-- (SELECT *, CASE WHEN INCOME<20000 THEN "Low Salary"
--                WHEN INCOME>=20000 AND INCOME <=50000 THEN "Average Salary"
--                WHEN INCOME >50000 THEN "High Salary" END AS CATEGORY
-- FROM ACCOUNTS
-- )
-- SELECT CATEGORY, MAX(ACCOUNTS_COUNT) AS ACCOUNTS_COUNT
-- FROM ( 
-- SELECT CATEGORY, COUNT(1) AS ACCOUNTS_COUNT
-- FROM ACCOUNTS_CATEGORY
-- GROUP BY CATEGORY
-- union
-- select 'High Salary', 0 as accounts_count
-- union
-- select 'Average Salary', 0 as accounts_count
-- union
-- select 'Low Salary', 0 as accounts_count
-- ) ACCOUNTS
-- GROUP BY CATEGORY

-- ALTERNATIVE SOLUTION WITH RIGHT JOIN
-- SELECT CATEGORY AS CATEGORY, COUNT(ACCOUNT_ID) AS ACCOUNTS_COUNT
-- FROM
-- (SELECT *
--     FROM ACCOUNTS
--     RIGHT JOIN
--     (SELECT "Low Salary" AS CATEGORY
--     UNION ALL 
--     SELECT "Average Salary"
--     UNION ALL
--     SELECT "High Salary"
--     ) CATEGORY
--     ON CASE WHEN (INCOME<20000) THEN "Low Salary"
--                 WHEN INCOME >=20000 AND INCOME <= 50000 THEN "Average Salary"
--                 WHEN INCOME > 50000 THEN "High Salary"
--         END = CATEGORY.CATEGORY
--     ) ACCOUNT_CATEGORY
--  GROUP BY CATEGORY
