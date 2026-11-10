
-- Q1. Total Employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- Q2. Department-wise Headcount
SELECT department, COUNT(employee_id) AS total_emp
FROM employees
GROUP BY department
ORDER BY total_emp DESC;

-- Q3. Job Role Analysis
SELECT job_role, COUNT(employee_id) AS emp_total
FROM employees
GROUP BY job_role
ORDER BY emp_total DESC;

-- Q4. Average Salary
SELECT ROUND(AVG(annual_salary), 2) AS sal
FROM salary;

-- Q5. Department Salary Analysis
SELECT employees.department,
       ROUND(AVG(salary.annual_salary), 2) AS sal
FROM salary
JOIN employees
ON employees.employee_id = salary.employee_id
GROUP BY employees.department
ORDER BY sal DESC;

-- Q6. Employee Salary Details
SELECT employees.employee_name,
       employees.job_role,
       employees.department,
       salary.annual_salary
FROM employees
JOIN salary
ON employees.employee_id = salary.employee_id;

-- Q7. Highest Paid Employees
SELECT employees.employee_name,
       salary.annual_salary
FROM employees
JOIN salary
ON employees.employee_id = salary.employee_id
ORDER BY salary.annual_salary DESC
LIMIT 5;

-- Q8. CTE – Department Salary
WITH avg_salary AS (
    SELECT employees.department,
           AVG(salary.annual_salary) AS sal
    FROM employees
    JOIN salary
    ON employees.employee_id = salary.employee_id
    GROUP BY employees.department
)
SELECT department, ROUND(sal, 2) AS total_salary
FROM avg_salary
WHERE sal > 700000;

-- Q9. Employees Without Performance Records
SELECT employees.employee_id,
       employees.employee_name
FROM employees
LEFT JOIN performance
ON employees.employee_id = performance.employee_id
WHERE performance.employee_id IS NULL;

-- Q10. Employee Experience Segmentation
SELECT employee_name,
       total_working_years,
       CASE
           WHEN total_working_years >= 10 THEN 'Senior'
           WHEN total_working_years >= 5 THEN 'Mid-level'
           ELSE 'Junior'
       END AS experience
FROM employees;

-- Q11. Employee Salary Ranking
SELECT employees.employee_name,
       salary.annual_salary,
       RANK() OVER (
           ORDER BY salary.annual_salary DESC
       ) AS ranks
FROM salary
JOIN employees
ON employees.employee_id = salary.employee_id;

-- Q12. Department-wise Salary Ranking
SELECT employees.employee_name,
       employees.department,
       salary.annual_salary,
       DENSE_RANK() OVER (
           PARTITION BY employees.department
           ORDER BY salary.annual_salary DESC
       ) AS dept_rank
FROM employees
JOIN salary
ON employees.employee_id = salary.employee_id;

-- Q13. Running Total of Salary
SELECT employee_id,
       annual_salary,
       SUM(annual_salary) OVER (
           ORDER BY employee_id
       ) AS running_total
FROM salary;

-- Q14. Employee Satisfaction Analysis
SELECT employees.employee_name,
       employees.department,
       performance.job_satisfaction,
       performance.work_life_balance
FROM employees
JOIN performance
ON employees.employee_id = performance.employee_id;

-- Q15. Department-wise Attrition Rate
SELECT department,
       COUNT(*) AS emp_total,
       SUM(CASE
           WHEN attrition = 'Yes' THEN 1
           ELSE 0
       END) AS att,
       ROUND(
           SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
           * 100.0 / COUNT(*), 2
       ) AS attrition_rate
FROM employees
GROUP BY department;

-- Q16. Employees Who Left
SELECT *
FROM employees
WHERE attrition = 'Yes';

-- Q17. Active Employees
SELECT *
FROM employees
WHERE attrition = 'No';

-- Q18. High Salary Employees
SELECT employees.employee_name,
       salary.annual_salary
FROM employees
JOIN salary
ON employees.employee_id = salary.employee_id
WHERE salary.annual_salary > (
    SELECT AVG(annual_salary)
    FROM salary
);

-- Q19. Overtime Analysis
SELECT employee_id,
       employee_name,
       department,
       overtime,
       attrition
FROM employees
WHERE overtime = 'Yes'
AND attrition = 'Yes';

-- Q20. Low Satisfaction Analysis
SELECT employees.employee_name,
       employees.department,
       performance.job_satisfaction
FROM employees
JOIN performance
ON employees.employee_id = performance.employee_id
WHERE performance.job_satisfaction <= 2;

-- Q21. Department with Highest Attrition
SELECT department,
       COUNT(*) AS atts
FROM employees
WHERE attrition = 'Yes'
GROUP BY department
ORDER BY atts DESC
LIMIT 1;

-- Q22. Average Experience by Department
SELECT department,
       ROUND(AVG(total_working_years), 2) AS avg_exp
FROM employees
GROUP BY department;

-- Q23. Salary by Job Role
SELECT employees.job_role,
       MAX(salary.annual_salary) AS highest_salary,
       MIN(salary.annual_salary) AS lowest_salary,
       ROUND(AVG(salary.annual_salary), 2) AS avg_salary
FROM employees
JOIN salary
ON employees.employee_id = salary.employee_id
GROUP BY employees.job_role;

-- Q24. Experience and Attrition
SELECT
    CASE
        WHEN total_working_years >= 10 THEN 'Senior'
        WHEN total_working_years >= 5 THEN 'Mid-level'
        ELSE 'Junior'
    END AS exp_level,
    COUNT(*) AS attrition_count
FROM employees
WHERE attrition = 'Yes'
GROUP BY exp_level;

-- Q25. Performance Analysis
SELECT employees.employee_name,
       employees.department,
       performance.performance_rating
FROM employees
JOIN performance
ON employees.employee_id = performance.employee_id
WHERE performance.performance_rating = 4;

-- Q26. Salary Hike Analysis
SELECT employees.department,
       ROUND(AVG(salary.salary_hike_percent), 2) AS avg_hike
FROM employees
JOIN salary
ON employees.employee_id = salary.employee_id
GROUP BY employees.department;

-- Q27. Training Analysis
SELECT employees.department,
       ROUND(AVG(performance.training_times_last_year), 2) AS avg_training
FROM employees
JOIN performance
ON employees.employee_id = performance.employee_id
GROUP BY employees.department;

-- Q28. Attrition and Overtime
SELECT overtime,
       COUNT(*) AS total_emp,
       SUM(CASE
           WHEN attrition = 'Yes' THEN 1
           ELSE 0
       END) AS att_count
FROM employees
GROUP BY overtime;

-- Q29. Department-wise Employee Count and Salary
SELECT employees.department,
       COUNT(employees.employee_id) AS emp_total,
       ROUND(AVG(salary.annual_salary), 2) AS sal,
       SUM(salary.annual_salary) AS total_sal
FROM employees
JOIN salary
ON employees.employee_id = salary.employee_id
GROUP BY employees.department;

-- Q30. Employee Details Using Three Tables
SELECT employees.employee_name,
       employees.department,
       employees.job_role,
       salary.annual_salary,
       performance.job_satisfaction,
       performance.performance_rating,
       employees.attrition
FROM employees
JOIN performance
ON employees.employee_id = performance.employee_id
JOIN salary
ON employees.employee_id = salary.employee_id;
