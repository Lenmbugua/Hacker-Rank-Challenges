SELECT DISTINCT CITY
FROM STATION
WHERE SUBSTRING(CITY,1,1) NOT IN ('A','E','I','O','U')
AND RIGHT(CITY,1) NOT IN ('A','E','I','O','U');