SELECT 
    w1.id, 
    wp.age, 
    w1.coins_needed, 
    w1.power
FROM 
    Wands AS w1
JOIN 
    Wands_Property AS wp ON w1.code = wp.code
WHERE 
    wp.is_evil = 0 AND
    w1.coins_needed = (
        SELECT 
            MIN(w2.coins_needed)
        FROM 
            Wands AS w2
        WHERE 
            w2.code = w1.code AND
            w2.power = w1.power
    )
ORDER BY 
    w1.power DESC, 
    wp.age DESC;