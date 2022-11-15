SELECT w2.id
FROM Weather w
JOIN Weather w2 
  ON DATEDIFF(w2.recordDate,w.recordDate) = 1
  AND w2.temperature > w.temperature 
  
--link: https://leetcode.com/problems/rising-temperature/
