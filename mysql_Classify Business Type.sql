select distinct business_name,
CASE 
WHEN business_name LIKE '%restaurant%' THEN 'restaurant' 
WHEN business_name LIKE '%cafe%' THEN 'cafe'
WHEN business_name LIKE '%café%' THEN 'cafe'
WHEN business_name LIKE '%coffee%' THEN 'cafe'
WHEN business_name LIKE '%school%' THEN 'school'
ELSE 'other'
END AS 'Business Type'
from sf_restaurant_health_violations;

-- postgresql 
select business_name,
CASE 
WHEN lower(business_name) LIKE '%restaurant%' THEN 'restaurant' 
WHEN lower(business_name) ~~ ANY('{%cafe%,%café%,%coffee%}') THEN 'cafe'
WHEN lower(business_name) LIKE '%school%' THEN 'school'
ELSE 'other'
END 
from sf_restaurant_health_violations;
