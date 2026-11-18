CREATE DATABASE IF NOT EXISTS hr_analytics; USE hr_analytics;
CREATE TABLE employees(employee_id VARCHAR(10) PRIMARY KEY, age INT, gender VARCHAR(10), department VARCHAR(30), job_role VARCHAR(30), monthly_salary DECIMAL(12,2), years_at_company INT, performance_rating INT, overtime VARCHAR(5), attrition VARCHAR(5));
-- Import data/hr_employee_data.csv using MySQL Workbench, then run:
SELECT department,COUNT(*) headcount FROM employees GROUP BY department;
SELECT department,ROUND(AVG(monthly_salary),2) avg_salary FROM employees GROUP BY department;
SELECT department,SUM(attrition='Yes') exits,COUNT(*) headcount,ROUND(100*SUM(attrition='Yes')/COUNT(*),2) attrition_pct FROM employees GROUP BY department;
SELECT * FROM employees WHERE performance_rating>=4 AND attrition='No';
