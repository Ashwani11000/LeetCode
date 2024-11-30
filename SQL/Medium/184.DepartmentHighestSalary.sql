---------------------------------------
---------- Problem Statement ----------
---------------------------------------

-- 184. Department Highest Salary

-- Table: Employee

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | id           | int     |
-- | name         | varchar |
-- | salary       | int     |
-- | departmentId | int     |
-- +--------------+---------+
-- id is the primary key (column with unique values) for this table.
-- departmentId is a foreign key (reference columns) of the ID from the Department table.
-- Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
 

-- Table: Department

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table. It is guaranteed that department name is not NULL.
-- Each row of this table indicates the ID of a department and its name.
 

-- Write a solution to find employees who have the highest salary in each of the departments.

-- Return the result table in any order.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Employee table:
-- +----+-------+--------+--------------+
-- | id | name  | salary | departmentId |
-- +----+-------+--------+--------------+
-- | 1  | Joe   | 70000  | 1            |
-- | 2  | Jim   | 90000  | 1            |
-- | 3  | Henry | 80000  | 2            |
-- | 4  | Sam   | 60000  | 2            |
-- | 5  | Max   | 90000  | 1            |
-- +----+-------+--------+--------------+
-- Department table:
-- +----+-------+
-- | id | name  |
-- +----+-------+
-- | 1  | IT    |
-- | 2  | Sales |
-- +----+-------+
-- Output: 
-- +------------+----------+--------+
-- | Department | Employee | Salary |
-- +------------+----------+--------+
-- | IT         | Jim      | 90000  |
-- | Sales      | Henry    | 80000  |
-- | IT         | Max      | 90000  |
-- +------------+----------+--------+
-- Explanation: Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department.


------------------------------
---------- Solution ----------
------------------------------

SELECT DEPARTMENT, EMPLOYEE, SALARY
FROM (
SELECT DEPT.NAME AS DEPARTMENT
       ,EMP.NAME AS EMPLOYEE
       ,EMP.SALARY AS SALARY
       ,RANK() OVER(PARTITION BY DEPT.NAME ORDER BY SALARY DESC) AS RNK
FROM EMPLOYEE EMP
INNER JOIN DEPARTMENT DEPT
ON EMP.DEPARTMENTID = DEPT.ID
) EMP_DEPT
WHERE RNK=1

-- ALTERNATIVE APPROACH WITH AGG FUNCTIONS
-- SELECT DEPT.NAME AS DEPARTMENT, EMP.NAME AS EMPLOYEE, EMP.SALARY
-- FROM EMPLOYEE EMP
-- INNER JOIN (SELECT DEPARTMENTID, MAX(SALARY) MAXSAL
-- FROM EMPLOYEE
-- GROUP BY DEPARTMENTID) MAX_SAL
-- ON EMP.DEPARTMENTID = MAX_SAL.DEPARTMENTID
-- AND EMP.SALARY = MAX_SAL.MAXSAL
-- INNER JOIN DEPARTMENT DEPT
-- ON DEPT.ID = MAX_SAL.DEPARTMENTID




-- P.S.
-- For Readability and Handling Ties: The first query using RANK() is preferable.
-- For Performance: The second query using MAX() is likely to be more efficient.
-- Ultimately, the choice depends on your specific needs and the size of your dataset. 
-- If performance is critical and your dataset is large, go with the second query. 
-- If readability and handling ties are more important for a smaller dataset, the first query is a better choice.
-- For large datasets, the overhead of window functions like RANK() can lead to slower performance due to the need for sorting and partitioning. Aggregate functions and joins, on the other hand, are generally more efficient and can better utilize indexes, leading to improved performance.