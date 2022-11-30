select business_name,
CASE 
WHEN business_name LIKE '%restaurant%' THEN 'Restaurant' 
WHEN business_name LIKE '%café%' OR '%cafe%' OR 'coffee' THEN 'Cafe'
WHEN business_name LIKE '%school%' THEN 'School'
ELSE 'Other'
END AS 'Business Type'
from sf_restaurant_health_violations;
