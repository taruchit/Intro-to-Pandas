# Write your MySQL query statement below
SELECT 
ROUND(SUM(consecutive_login)/(COUNT(DISTINCT player_id)),2) AS fraction
FROM
(SELECT player_id,
(DATEDIFF(event_date, min(event_date) OVER(PARTITION BY player_id))=1) AS consecutive_login
FROM Activity) AS derived_table