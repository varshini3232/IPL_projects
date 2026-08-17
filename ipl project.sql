create database ipl

use ipl;
select * from matches;
select * from deliveries;

/* Phase 1 – Data Quality Validation */
--  Requirement 1: Record count validation

select 'deliveries' as table_name, count(*) as total_records
from deliveries;

select 'matches' as table_name, count(*) as total_records
from matches;

-- Requirement 2: Duplicate match detection

select id, count(*) as duplicate_count
from matches
group by id
having count(*)>1

select match_id, count(*) as duplicate_count
from deliveries
group by match_id
having count(*)>1;

-- Requirement 3: Missing values report
select city,winner,player_of_match,venue, count(*) as missing_count
from matches
where city is null or winner is null or player_of_match is null or venue is null
group by city,winner,player_of_match,venue;

SELECT 'city' AS column_name,COUNT(*) AS missing_count
FROM matches
WHERE city is null

UNION ALL

SELECT 'winner',COUNT(*) 
FROM matches
WHERE winner is null

UNION ALL

SELECT 'player_of_match', COUNT(*) 
FROM matches
WHERE player_of_match is null

UNION ALL

SELECT 'venue', COUNT(*) 
FROM matches
WHERE venue is null

-- Requirement 4: Team name standardization
select team1 as team_name
from matches
union

select team2
from matches
union

select distinct toss_winner 
from matches
union

select winner
from matches;

select batting_team 
from deliveries
union

select bowling_team
from deliveries

--Standardize old franchise names
update matches
set team1 = 'Pune Warriors'
where team1 = 'Rising Pune Supergiants'

update matches
set team2 = 'Pune Warriors'
where team2 = 'Rising Pune Supergiants'

update matches
set toss_winner = 'Pune Warriors'
where toss_winner = 'Rising Pune Supergiants'

update matches
set winner = 'Pune Warriors'
where winner = 'Rising Pune Supergiants'

update deliveries
set bowling_team = 'Royal Challengers Bengaluru'
where bowling_team = 'Royal Challengers Bangaluru'

update deliveries
set batting_team = 'Royal Challengers Bengaluru'
where batting_team = 'Royal Challengers Bangaluru'

SELECT DISTINCT season
FROM matches
ORDER BY season;

SELECT *
FROM matches
WHERE season = '2020/21';

update matches 
set season = '2020'
where season = '2020/21'

SELECT DISTINCT venue from matches
update matches 
set venue = 'Maharashtra Cricket Association Stadium, Pune'
where venue = 'Maharashtra Cricket Association Stadium'

update matches 
set venue = 'Punjab Cricket Association IS Bindra Stadium, Mohali, Chandigarh'
where venue = 'Punjab Cricket Association IS Bindra Stadium' or venue = 'Punjab Cricket Association IS Bindra Stadium, Mohali' or venue = 'Punjab Cricket Association Stadium, Mohali'

/*Phase 2 – Match-Level Analysis */
--Requirement 1: Matches played per season
select season, count(id) as matches_per_season
from matches
group by season
order by season;

--Requirement 2: Most successful teams
select winner as team, count(winner) as wins
from matches
group by winner
order by wins desc;

--Requirement 3: Toss decision preference
select toss_decision, count(*) as decision_count
from matches
group by toss_decision
order by decision_count;

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

--Phase 5 – Advanced Business Analysis
--Requirement 16: Season-wise top scorer

with season_runs as 
(select m.season, d.batter, sum(d.batsman_runs) as total_runs
from matches m
join deliveries d on m.id=d.match_id
group by season, batter),

top_batter as 
(
select season, batter, total_runs,
rank()over(partition by season
order by total_runs desc) as top_runs
from season_runs)

select season, batter,total_runs
from top_batter
where top_runs = 1
order by season;

--Requirement 17: Season-wise top wicket taker

with bowler_wickets as(select m.season,d.bowler,count(d.dismissal_kind) as total_wickets
from matches m
join deliveries d
on m.id=d.match_id
where d.dismissal_kind in ('caught and bowled', 'bowled', 'stumped', 'hit wicket', 'caught', 'lbw')
group by m.season, d.bowler),

top_bowlers as (select season, bowler, total_wickets,
rank()over(partition by season
order by total_wickets desc) as bowler_rank
from bowler_wickets)

select season, bowler, total_wickets
from top_bowlers
where bowler_rank = 1
order by season;

--Requirement 18: Winning percentage by team

with total_matches as (select team, count(*) as matches_played from
(select team1 as team
from matches
union all
select team2 as team
from matches)as teams
group by team)

select t.team, t.matches_played,count(m.winner)as wins,
concat(cast(count(m.winner)*100.0/t.matches_played as decimal (10,2)), '%') as win_percentage
from total_matches t
left join matches m
on t.team=m.winner
group by t.team,t.matches_played
order by wins desc;




