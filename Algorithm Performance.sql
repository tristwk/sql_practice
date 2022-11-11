-- find out duration of projects, which employee is on it 
WITH pep AS(
SELECT title, 
       budget, 
       (end_date - start_date)/365::float AS duration_days_year,
       ep.emp_id AS employee
FROM linkedin_projects p
JOIN linkedin_emp_projects ep
  ON p.id = ep.project_id
),
-- calcualte total expense for each project
budget AS (
SELECT pep.title AS project_name,
       pep.budget,
       SUM(emp.salary*pep.duration_days_year) AS total_expense
FROM pep 
JOIN linkedin_employees emp
  ON pep.employee = emp.id
GROUP BY 1,2
)
-- find out which projects are overbudget
SELECT project_name,
       budget,
       CEILING(total_expense) AS total
FROM budget
WHERE budget < total_expense
