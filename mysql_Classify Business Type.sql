select business_name,
CASE 
WHEN business_name LIKE '%restaurant%' THEN 'Restaurant' 
WHEN business_name LIKE '%café%' OR '%cafe%' OR 'coffee' THEN 'Cafe'
WHEN business_name LIKE '%school%' THEN 'School'
ELSE 'Other'
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
