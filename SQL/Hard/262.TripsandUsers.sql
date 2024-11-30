---------------------------------------
---------- Problem Statement ----------
---------------------------------------

-- 262. Trips and Users

-- Table: Trips

-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | id          | int      |
-- | client_id   | int      |
-- | driver_id   | int      |
-- | city_id     | int      |
-- | status      | enum     |
-- | request_at  | varchar  |     
-- +-------------+----------+
-- id is the primary key (column with unique values) for this table.
-- The table holds all taxi trips. Each trip has a unique id, while client_id and driver_id are foreign keys to the users_id at the Users table.
-- Status is an ENUM (category) type of ('completed', 'cancelled_by_driver', 'cancelled_by_client').
 

-- Table: Users

-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | users_id    | int      |
-- | banned      | enum     |
-- | role        | enum     |
-- +-------------+----------+
-- users_id is the primary key (column with unique values) for this table.
-- The table holds all users. Each user has a unique users_id, and role is an ENUM type of ('client', 'driver', 'partner').
-- banned is an ENUM (category) type of ('Yes', 'No').
 

-- The cancellation rate is computed by dividing the number of canceled (by client or driver) requests with unbanned users by the total number of requests with unbanned users on that day.

-- Write a solution to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03". Round Cancellation Rate to two decimal points.

-- Return the result table in any order.

------------------------------
---------- Solution ----------
------------------------------
SELECT REQUEST_AT AS Day
       ,ROUND(SUM(CASE WHEN STATUS <> 'COMPLETED' THEN 1 ELSE 0 END) /COUNT(ID),2) AS 'Cancellation Rate'
FROM TRIPS
WHERE REQUEST_AT BETWEEN "2013-10-01" and "2013-10-03"
AND CLIENT_ID NOT IN (SELECT USERS_ID FROM USERS WHERE BANNED = 'YES')
AND DRIVER_ID NOT IN (SELECT USERS_ID FROM USERS WHERE BANNED = 'YES')
GROUP BY REQUEST_AT

-- SELECT REQUEST_AT AS DAY, ROUND(SUM(CASE WHEN STATUS <> 'COMPLETED' THEN 1 ELSE 0 END)/COUNT(ID),2) AS 'CANCELLATION RATE'
-- FROM TRIPS
-- INNER JOIN USERS U1
-- ON U1.USERS_ID = CLIENT_ID
-- AND U1.BANNED = 'NO'
-- INNER JOIN USERS U2
-- ON U2.USERS_ID = DRIVER_ID
-- AND U2.BANNED = 'NO'
-- WHERE REQUEST_AT BETWEEN "2013-10-01" and "2013-10-03"
-- GROUP BY REQUEST_AT
