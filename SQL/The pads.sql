-- Query 1: Alphabetically Ordered List of Names with Professions in Parentheses
SELECT CONCAT(name, '(', LEFT(occupation, 1), ')') AS formatted_name
FROM OCCUPATIONS
ORDER BY name;

-- Query 2: Number of Occurrences of Each Occupation
SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(occupation), 's.') AS occupation_count
FROM OCCUPATIONS
GROUP BY occupation
ORDER BY COUNT(*), occupation;
