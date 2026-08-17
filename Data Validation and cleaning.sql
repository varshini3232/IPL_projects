use ipl;
select * from matches;
select * from deliveries;

--Phase 1 – Data Quality Validation 
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

