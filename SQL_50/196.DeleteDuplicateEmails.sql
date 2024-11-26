---------------------------------------
---------- Problem Statement ----------
---------------------------------------

-- 196. Delete Duplicate Emails

-- Table: Person

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | email       | varchar |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains an email. The emails will not contain uppercase letters.
 

-- Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

-- For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.

-- For Pandas users, please note that you are supposed to modify Person in place.

-- After running your script, the answer shown is the Person table. The driver will first compile and run your piece of code and then show the Person table. The final order of the Person table does not matter.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Person table:
-- +----+------------------+
-- | id | email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- | 3  | john@example.com |
-- +----+------------------+
-- Output: 
-- +----+------------------+
-- | id | email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- +----+------------------+
-- Explanation: john@example.com is repeated two times. We keep the row with the smallest Id = 1.

------------------------------
---------- Solution ----------
------------------------------
SELECT *
FROM USERS
WHERE MAIL REGEXP '^[A-Za-z][A-Za-z0-9_\.\-]*@leetcode(\\?com)?\\.com$'



-- https://leetcode.com/problems/find-users-with-valid-e-mails/solutions/3853585/regex-explained-pandas-mysql-an-effortless-and-simple-approach-with-comments
-- Regex Pattern: ^[A-Za-z][A-Za-z0-9_\.\-]*@leetcode(\?com)?\.com$

-- Let's break down the regex pattern step by step to clearly explain each part:

-- ^: Anchor the regex pattern to match from the start of the string.
-- [A-Za-z]: Match any single uppercase or lowercase letter. The email prefix name must start with a letter.
-- [A-Za-z0-9_.-]*: Match any number of characters following the first letter in the email prefix name. It includes letters (upper or lower case), digits, underscore '_', period '.', and/or dash '-'.
-- @: Match the literal '@' character, which separates the prefix name and the domain.
-- leetcode: Match the literal 'leetcode', which is part of the email domain.
-- (?com)?: Make the sequence ?com optional in the email domain. Allows the pattern to match both '@leetcode.com' and '@leetcode?com'.
-- . : Match the literal '.' character, which separates the 'leetcode' part from the 'com' part of the domain.
-- com: Match the literal 'com' at the end of the email domain.
-- $: Anchor the regex pattern to match until the end of the string.
-- Explanation:
-- The regex pattern ensures that a valid email must have the following format:

-- The prefix name starts with a letter.
-- The prefix name can contain letters (upper or lower case), digits, underscore '_', period '.', and/or dash '-'.
-- The domain must be '@leetcode.com' with an optional '?com' part.
-- Using this regex pattern, both the pandas and MySQL queries can identify and select rows with valid email addresses from the 'Users' table based on the specified conditions.