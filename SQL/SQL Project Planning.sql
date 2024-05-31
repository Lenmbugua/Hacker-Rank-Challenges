SELECT MIN(Start_Date), MAX(End_Date) 
FROM (
SELECT Start_Date, End_Date, DATE_SUB(Start_Date, INTERVAL ROW_NUMBER() OVER(ORDER BY Start_Date) DAY) AS ProjectDays 
FROM Projects
)AS A 
GROUP BY ProjectDays 
ORDER BY DATEDIFF(MAX(End_Date), MIN(Start_Date)), MIN(Start_Date);