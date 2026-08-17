create database ipl

use ipl;
select * from dbo.[deliveries.csv];
select * from dbo.[matches.csv];

/* Phase 1 – Data Quality Validation
Requirement 1: Record count validation

Return the total number of records in each table.
*/

select 'deliveries' as table_name, count(*) as total_records
from dbo.[deliveries.csv];

select 'matches' as table_name, count(*) as total_records
from dbo.[matches.csv];

/*  Requirement 2: Duplicate match detection

Identify duplicate match_id values in the matches table.
*/

exec sp_help dbo.[matches.csv]

select id, count(*) as duplicate_count
from dbo.[matches.csv]
group by id
having count(*)>1

select match_id, count(*) as duplicate_count
from dbo.[deliveries.csv]
group by match_id
having count(*)>1;

/* Requirement 3: Missing values report

Check for missing values in:

city
winner
player_of_match
venue
*/
select city,winner,player_of_match,venue, count(*) as missing_count
from dbo.[matches.csv]
where city is null or winner is null or player_of_match is null or venue is null
group by city,winner,player_of_match,venue;

SELECT 'city' AS column_name,COUNT(*) AS missing_count
FROM dbo.[matches.csv]
WHERE city is null

UNION ALL

SELECT 'winner',COUNT(*) 
FROM dbo.[matches.csv]
WHERE winner is null

UNION ALL

SELECT 'player_of_match', COUNT(*) 
FROM dbo.[matches.csv]
WHERE player_of_match is null

UNION ALL

SELECT 'venue', COUNT(*) 
FROM dbo.[matches.csv]
WHERE venue is null

/* Requirement 4: Team name standardization

Create a list of distinct team names from:

team1
team2
winner
batting_team
bowling_team
*/

select team1 as team_name
from dbo.[matches.csv]
union

select team2
from dbo.[matches.csv]
union

select distinct toss_winner 
from dbo.[matches.csv]
union

select winner
from dbo.[matches.csv];

select batting_team 
from dbo.[deliveries.csv]
union

select bowling_team
from dbo.[deliveries.csv]

--Standardize old franchise names
update dbo.[matches.csv]
set team1 = 'Delhi Capitals'
where team1 = 'Delhi Daredevils'

update dbo.[matches.csv]
set team2 = 'Delhi Capitals'
where team2 = 'Delhi Daredevils'

update dbo.[matches.csv]
set toss_winner = 'Delhi Capitals'
where toss_winner = 'Delhi Daredevils'

update dbo.[matches.csv]
set winner = 'Delhi Capitals'
where winner = 'Delhi Daredevils'

update dbo.[deliveries.csv]
set bowling_team = 'Royal Challengers Bangaluru'
where bowling_team = 'Royal Challengers Bangalore'

update dbo.[deliveries.csv]
set batting_team = 'Royal Challengers Bangaluru'
where batting_team = 'Royal Challengers Bangalore'



