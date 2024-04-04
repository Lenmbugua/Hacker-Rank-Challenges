SELECT 
    h.hacker_id, 
    h.name, 
    COUNT(c.challenge_id) AS num_challenges
FROM 
    Hackers h
JOIN 
    Challenges c ON h.hacker_id = c.hacker_id
GROUP BY 
    h.hacker_id, 
    h.name
HAVING 
    num_challenges = (SELECT MAX(num_challenges) FROM (
        SELECT 
            COUNT(challenge_id) AS num_challenges
        FROM 
            Challenges
        GROUP BY 
            hacker_id
    ) AS subquery)
    OR 
    num_challenges NOT IN (
        SELECT 
            num_challenges
        FROM (
            SELECT 
                COUNT(challenge_id) AS num_challenges
            FROM 
                Challenges
            GROUP BY 
                hacker_id
            HAVING 
                COUNT(challenge_id) < (SELECT MAX(num_challenges) FROM (
                    SELECT 
                        COUNT(challenge_id) AS num_challenges
                    FROM 
                        Challenges
                    GROUP BY 
                        hacker_id
                ) AS subquery)
        ) AS subquery
        GROUP BY 
            num_challenges
        HAVING 
            COUNT(*) > 1
    )
ORDER BY 
    num_challenges DESC, 
    h.hacker_id;