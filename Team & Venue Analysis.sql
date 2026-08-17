use ipl;
select * from matches;
select * from deliveries;

--Phase 4 – Team & Venue Analysis
--Requirement 1: Highest team totals
 select match_id,batting_team,inning,sum(total_runs) as total_inning
 from deliveries
 group by match_id,batting_team,inning
 order by total_inning desc;

 --Requirement 2: each team highest score in an innings
select batting_team, max(innings_total) as team_highest_total
from(select match_id, batting_team, inning, sum (total_runs) as innings_total
from deliveries
group by match_id, batting_team, inning
) as teams_total
group by batting_team
order by team_highest_total desc;

 --Requirement 3: Average first innings score by venue
select venue,avg(total_runs) as avg_total
from (select m.venue,m.id,sum(d.total_runs) as total_runs
from matches m  
inner join deliveries d
on m.id = d.match_id
where d.inning = 1
group by m.venue, m.id) as venue_scores
group by venue
order by avg_total desc;

--Requirement 4 : Most frequently used venues
select venue,count(*) as matches_hosted
from matches
group by venue
order by matches_hosted desc;