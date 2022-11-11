-- net difference btw products in 2020 and in previous year and then output name and net difference 
-- find out how many products in 2020 
WITH product_count_2020 AS(
SELECT company_name,
       COUNT(product_name) AS count_2020
FROM car_launches
WHERE year= 2020
GROUP BY company_name
),
-- find out how many products in previous years
product_count_p AS(
SELECT company_name,
       COUNT(product_name) AS previous_count
FROM car_launches
WHERE year < 2020
GROUP BY company_name
)
SELECT pc.company_name,
       pc.count_2020 - pcp.previous_count AS net_difference
FROM product_count_2020 pc
JOIN product_count_p pcp
  ON pc.company_name = pcp.company_name
