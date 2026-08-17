use ipl;
select * from matches;
select * from deliveries;


--Phase 3 – Player Performance Analysis
--Requirement 1: Top 10 run scorers

select top 10 batter, sum(batsman_runs) as total_runs
from deliveries
group by batter
order by total_runs desc;

--Requirement 2: Top 10 wicket takers

select top 10 bowler, count(is_wicket) as total_wicket
from deliveries
where dismissal_kind not in ('run out','retired hurt','obstructing the field')
group by bowler
order by total_wicket desc;

--Requirement 3: Highest individual score in a match
select top 10 match_id,batter, sum(batsman_runs) as runs_scored
from deliveries
group by match_id, batter
order by runs_scored desc;

--Requirement 4: Most Player of the Match awards
select player_of_match as player, count(player_of_match) as awards
from matches
group by player_of_match
order by awards desc; 
