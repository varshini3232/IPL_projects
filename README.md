# IPL Data Analysis using SQL

## 📌 Project Overview

This project analyzes IPL (Indian Premier League) match and ball-by-ball
data using SQL Server.

The main goal is to validate and clean the data, analyze player and team
performance, study venues, and calculate advanced business insights such
as winning percentage and season-wise top performers.

## 🛠️ Tools & Technologies

-   SQL Server
-   SQL Server Management Studio (SSMS)
-   SQL
-   IPL Matches Dataset
-   IPL Deliveries Dataset

## 📂 Dataset

The project uses two main tables:

### `matches`

Contains match-level information such as: - Match ID - Season - Teams -
Winner - Toss winner - Toss decision - Venue - City - Player of the
Match

### `deliveries`

Contains ball-by-ball information such as: - Match ID - Batting team -
Bowling team - Batter - Bowler - Runs scored - Total runs - Dismissal
type

## 🔎 Project Analysis

### Phase 1 -- Data Quality Validation

The project checks and prepares the data using:

-   Record count validation
-   Duplicate match detection
-   Missing value identification
-   Team name standardization
-   Old franchise name standardization
-   Season value standardization
-   Venue name standardization

### Phase 2 -- Match-Level Analysis

The project includes match-level analysis such as:

-   Matches played per season
-   Most successful teams
-   Toss impact analysis
-   Toss decision preference

### Phase 3 -- Player Performance Analysis

The project analyzes:

-   Top 10 run scorers
-   Top 10 wicket takers
-   Highest individual scores in a match
-   Most Player of the Match awards

### Phase 4 -- Team & Venue Analysis

The project analyzes:

-   Highest team totals
-   Highest score by each team in an innings
-   Average first innings score by venue
-   Most frequently used venues

### Phase 5 -- Advanced Business Analysis

The project calculates:

-   Season-wise top scorer
-   Season-wise top wicket taker
-   Winning percentage by team

## 💡 SQL Concepts Used

This project demonstrates practical use of:

-   `SELECT`
-   `WHERE`
-   `GROUP BY`
-   `HAVING`
-   `ORDER BY`
-   `COUNT()`
-   `SUM()`
-   `AVG()`
-   `MAX()`
-   `JOIN`
-   `UNION`
-   `UNION ALL`
-   Subqueries
-   CTEs (`WITH`)
-   Window functions
-   `RANK()`
-   Conditional filtering
-   Data cleaning using `UPDATE`

## 📊 Key Business Questions

Some of the questions answered through this project include:

-   Which teams played the most matches?
-   Which teams were the most successful?
-   Which players scored the most runs?
-   Which bowlers took the most wickets?
-   Which venues hosted the most matches?
-   Which venue had the highest average first innings score?
-   Who was the top run scorer in each season?
-   Who was the top wicket taker in each season?
-   What percentage of matches did each team win?

## 📁 Project Files

-   `Data Validation and cleaning.sql` -- Data quality checks and
    cleaning
-   `Player Performance Analysis.sql` -- Player performance analysis
-   `Team & Venue Analysis.sql` -- Team and venue analysis
-   `Advanced Business Analysis.sql` -- Advanced analysis and business
    metrics

## 🚀 How to Run

1.  Install Microsoft SQL Server and SQL Server Management Studio
    (SSMS).
2.  Create a database named `ipl`.
3.  Import the `matches` and `deliveries` datasets into the database.
4.  Open the SQL files from this repository in SSMS.
5.  Run the scripts phase by phase.
6.  Review the result sets for each requirement.

## 🎯 Project Outcome

This project demonstrates how SQL can be used to transform raw IPL data
into meaningful insights for sports and business analysis. It also
showcases practical skills in data cleaning, aggregation, joins,
subqueries, CTEs, and window functions.

## 👩‍💻 Author

**Sai Sri Varshini Yedla**

B.Tech Graduate \| Data Analytics Enthusiast

