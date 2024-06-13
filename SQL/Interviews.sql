select t1.ID1, cont.hacker_id, cont.name, t1.s1, t1.s2, t2.s3, t2.s4 from 
(select coll.contest_id as ID1, sum(total_submissions) as s1, sum(total_accepted_submissions) as s2 
from Challenges chal 
left join Colleges coll
 on chal.college_id = coll.college_id 
left join Submission_Stats s 
on chal.challenge_id = s.challenge_id 
group by coll.contest_id) as t1 
left join (select coll.contest_id as ID2, sum(total_views) as s3, sum(total_unique_views) as s4 
from Challenges chal 
left join Colleges coll 
on chal.college_id = coll.college_id 
left join View_Stats v on chal.challenge_id = v.challenge_id 
group by coll.contest_id) as t2 
on t1.ID1=t2.ID2 
left join Contests cont 
on t1.ID1= cont.contest_id