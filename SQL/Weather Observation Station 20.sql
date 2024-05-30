SET @row_index := -1;

SELECT ROUND(AVG(subq.LAT_N), 4) AS Median_Lat_N
FROM (
    SELECT @row_index := @row_index + 1 AS row_index, LAT_N
    FROM STATION
    ORDER BY LAT_N
) AS subq
WHERE subq.row_index IN (FLOOR(@row_index / 2), CEIL(@row_index / 2));