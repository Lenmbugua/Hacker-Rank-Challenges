SELECT
    C.company_code,
    C.founder,
    COUNT(DISTINCT L.lead_manager_code) AS total_lead_managers,
    COUNT(DISTINCT S.senior_manager_code) AS total_senior_managers,
    COUNT(DISTINCT M.manager_code) AS total_managers,
    COUNT(DISTINCT E.employee_code) AS total_employees
FROM Company AS C
LEFT JOIN Lead_Manager AS L ON C.company_code = L.company_code
LEFT JOIN Senior_Manager AS S ON C.company_code = S.company_code
LEFT JOIN Manager AS M ON C.company_code = M.company_code
LEFT JOIN Employee AS E ON C.company_code = E.company_code
GROUP BY C.company_code, C.founder
ORDER BY C.company_code;