-- CTE: rank salary by department 

WITH rank_table AS (
SELECT e.name,
       salary,
       d.name AS department_name,
       dense_rank () OVER (PARTITION BY departmentId ORDER BY salary DESC) AS salary_rank
FROM Employee e
LEFT JOIN Department d 
  ON e.departmentId = d.id  
)
SELECT department_name AS Department, 
       name AS Employee, 
       salary AS Salary
FROM rank_table
WHERE salary_rank <= 3;


-- link: https://leetcode.com/problems/department-top-three-salaries/
