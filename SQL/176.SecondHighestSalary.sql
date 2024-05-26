---------------------------------------
---------- Problem Statement ----------
---------------------------------------
-- 176. Second Highest Salary
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

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Employee table:
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- Output: 
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | 200                 |
-- +---------------------+
-- Example 2:

-- Input: 
-- Employee table:
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- +----+--------+
-- Output: 
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | null                |
-- +---------------------+

------------------------------
---------- Solution ----------
------------------------------
SELECT MAX(SALARY) AS SecondHighestSalary
FROM (
SELECT SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RNK
FROM EMPLOYEE
) EMP
WHERE RNK =2

-- SELECT MAX(SALARY) AS SecondHighestSalary
-- FROM EMPLOYEE
-- WHERE SALARY <> (SELECT MAX(SALARY) FROM EMPLOYEE)

-- SELECT IF(COUNT(EMP.SALARY) <2 , null, MIN(EMP.SALARY)) as SecondHighestSalary 
-- FROM (
-- SELECT DISTINCT SALARY
-- FROM EMPLOYEE
-- ORDER BY SALARY DESC
-- LIMIT 2
-- ) EMP

