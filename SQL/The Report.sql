SELECT 
  CASE 
    WHEN g.Grade >= 8 THEN s.name 
    ELSE NULL 
  END AS Name,
  g.Grade,
  s.marks AS Mark
FROM students s
JOIN grades g ON s.marks BETWEEN g.min_mark AND g.max_mark
ORDER BY 
  g.Grade DESC,
  CASE 
    WHEN g.Grade >= 8 THEN s.name 
    ELSE NULL 
  END ASC,
  CASE 
    WHEN g.Grade < 8 THEN s.marks 
    ELSE NULL 
  END ASC;