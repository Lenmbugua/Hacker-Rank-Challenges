select h.hacker_id,h.name 
from Hackers h 
join Submissions s on h.hacker_id=s.hacker_id 
join Challenges c on s.challenge_id=c.challenge_id 
join Difficulty d on d.difficulty_level=c.difficulty_level 
where s.score=d.score and c.difficulty_level=d.difficulty_level 
group by h.hacker_id,h.name 
having count(s.submission_id)>1 
order by count(s.submission_id) desc,hacker_id;