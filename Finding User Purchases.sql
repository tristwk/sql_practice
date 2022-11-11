-- different id, the first purchase date should be smaller than the last purchase date
-- the last purchase date should not be bigger than the first date + 7
-- SELF JOIN 

SELECT DISTINCT a.user_id
FROM amazon_transactions a 
JOIN amazon_transactions b
  ON a.user_id = b.user_id
WHERE a.id <> b.id
AND a.created_at <= b.created_at
AND b.created_at <= a.created_at + 7 
ORDER BY a.user_id
