SELECT p1.product_id, p1.product_name
FROM Product p1
WHERE p1.product_id NOT IN (
SELECT p.product_id
FROM Product p
LEFT JOIN Sales s 
ON p.product_id = s.product_id
WHERE s.sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31') AND p1.product_id IN (SELECT s1.product_id FROM Sales s1);


--link: https://leetcode.com/problems/sales-analysis-iii/
