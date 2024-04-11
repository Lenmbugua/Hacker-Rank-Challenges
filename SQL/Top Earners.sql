SELECT MAX(salary * months) AS max_earnings, COUNT(*) AS num_employees
FROM Employee
WHERE salary * months = (SELECT MAX(salary * months) FROM Employee);