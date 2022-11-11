-- output search ID and its rating 
-- when clicked = 0 then 1
-- when clicked >= 1 AND search_results_position > 3 then 2
-- when clicked >= 1 AND search_results_position <= 3 then 3

SELECT search_id,
       CASE 
            WHEN clicked = 0 THEN 1 
            WHEN clicked >= 1 AND search_results_position > 3 THEN 2
            WHEN clicked >= 1 AND search_results_position <= 3 THEN 3
            END AS rating
FROM fb_search_events
