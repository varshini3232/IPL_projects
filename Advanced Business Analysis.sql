use ipl;
select * from matches;
select * from deliveries;

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
