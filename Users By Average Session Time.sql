-- load time and exit time for each user each day: where = 'page_load'

WITH load_table AS(
select user_id,
       DATE(timestamp) AS date,
       max(timestamp) AS load_time
FROM facebook_web_log
WHERE action = 'page_load'
GROUP BY user_id, date
),
exit_table AS(
SELECT user_id,
       DATE(timestamp) AS date,
       min(timestamp) AS exit_time
FROM facebook_web_log
WHERE action = 'page_exit'
GROUP BY user_id, date
)
SELECT l.user_id, 
       AVG(exit_time - load_time) AS avg
From load_table l
JOIN exit_table e
  ON l.user_id = e.user_id
  AND l.date = e.date
GROUP BY 1
