With valid AS(
SELECT * 
FROM trips
WHERE Client_id NOT IN (SELECT users_id FROM users WHERE banned = 'Yes')
AND Driver_id NOT IN (SELECT users_id FROM users WHERE banned = 'Yes')
)
SELECT request_at AS Day,
       ROUND(SUM(CASE 
                 WHEN status LIKE '%cancelled%' THEN 1
                 ELSE 0
                 END)/COUNT(*), 2) AS 'Cancellation Rate'
FROM valid
WHERE request_at BETWEEN  '2013-10-01' and '2013-10-03'
GROUP BY request_at
