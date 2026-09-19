# 🏏 IPL Cricket Analytics Project — SQL & Excel Dashboard

## 📌 Project Overview

The **IPL Cricket Analytics Project** is an end-to-end data analytics project focused on analyzing Indian Premier League (IPL) match-level and ball-by-ball data.

The project combines **SQL analysis** and **Microsoft Excel dashboard development** to transform raw IPL data into meaningful insights about teams, players, matches, toss decisions, venues, batting, bowling, and season-wise performance.

The project demonstrates the complete data analytics workflow:

**Data Cleaning → Data Transformation → SQL Analysis → Exploratory Analysis → Excel Analysis → Data Visualization → Interactive Dashboard → Insights**

This project was developed to gain practical experience in working with real-world datasets and applying data analytics techniques using SQL and Excel.

---

# 🎯 Project Objectives

The main objectives of this project are:

* Analyze IPL match and ball-by-ball data.
* Clean and prepare raw datasets for analysis.
* Standardize team names across different IPL seasons.
* Identify the most successful IPL teams.
* Analyze team-wise match performance.
* Analyze toss winners and match winners.
* Understand toss decisions such as Bat and Field.
* Identify top batsmen based on runs scored.
* Identify top wicket-taking bowlers.
* Find the highest individual scores.
* Analyze Player of the Match performances.
* Identify teams with the highest totals.
* Analyze venue-wise match statistics.
* Perform season-wise player and team analysis.
* Calculate team winning percentages.
* Create an interactive Excel dashboard.
* Present complex cricket data through easy-to-understand visualizations.

---

# 📊 Dataset Description

The project uses two major IPL datasets:

## 1. Matches Dataset

The matches dataset contains information about individual IPL matches.

### Important fields include:

| Field             | Description                        |
| ----------------- | ---------------------------------- |
| `id`              | Unique identifier for each match   |
| `season`          | IPL season                         |
| `city`            | City where the match was played    |
| `date`            | Date of the match                  |
| `match_type`      | Type of match                      |
| `player_of_match` | Player awarded Player of the Match |
| `venue`           | Stadium/venue                      |
| `team1`           | First participating team           |
| `team2`           | Second participating team          |
| `toss_winner`     | Team that won the toss             |
| `toss_decision`   | Decision taken after winning toss  |
| `winner`          | Match-winning team                 |
| `result`          | Match result                       |
| `result_margin`   | Winning margin                     |
| `target_runs`     | Target runs                        |

---

## 2. Deliveries Dataset

The deliveries dataset contains detailed ball-by-ball information for IPL matches.

### Important fields include:

| Field              | Description              |
| ------------------ | ------------------------ |
| `match_id`         | Match identifier         |
| `inning`           | Innings number           |
| `batting_team`     | Team batting             |
| `bowling_team`     | Team bowling             |
| `over`             | Over number              |
| `ball`             | Ball number              |
| `batter`           | Batsman                  |
| `bowler`           | Bowler                   |
| `non_striker`      | Non-striker              |
| `batsman_runs`     | Runs scored by batsman   |
| `extra_runs`       | Runs from extras         |
| `total_runs`       | Total runs from delivery |
| `extras_type`      | Type of extra            |
| `is_wicket`        | Wicket indicator         |
| `player_dismissed` | Dismissed player         |

The two datasets allow analysis at both the **match level** and **ball-by-ball level**.

---

# 🧹 Data Cleaning & Preparation

Before performing analysis, the raw IPL data was cleaned and standardized.

### Data preparation included:

* Identifying missing values.
* Checking inconsistent records.
* Handling unavailable values such as `NA`.
* Checking numerical columns for incorrect data types.
* Standardizing team names.
* Standardizing team names across:

  * `team1`
  * `team2`
  * `winner`
  * `batting_team`
  * `bowling_team`
* Updating historical team names to their current names.

### Team Name Standardization

Examples include:

* **Delhi Daredevils → Delhi Capitals**
* **Kings XI Punjab → Punjab Kings**

This standardization was important because the same team could otherwise appear as different teams during analysis.

---

# 🗄️ Part 1 — SQL Analysis

SQL Server was used to perform detailed analysis on the IPL dataset.

The SQL analysis focuses on extracting useful information from the raw data and answering business-style analytical questions.

---

## 🔍 SQL Analysis Performed

### 1. Missing Value Analysis

Missing values were identified in important columns such as:

* City
* Winner
* Player of the Match
* Venue
* Other match-related fields

This helped understand the quality and completeness of the dataset.

---

### 2. Team Name Standardization

Historical team names were standardized to ensure that the same team was not treated as multiple teams during analysis.

For example:

```text
Delhi Daredevils → Delhi Capitals
Kings XI Punjab → Punjab Kings
```

---

### 3. Matches Played by Season

The number of IPL matches played in each season was calculated.

This analysis helps understand the distribution of matches across different IPL seasons.

---

### 4. Most Successful Teams

Team performance was analyzed using:

* Number of matches
* Number of wins
* Match-winning performance
* Toss-to-match conversion

This allows teams to be compared based on their historical match performance.

---

### 5. Toss Winner vs Match Winner

The analysis checks whether the team that won the toss also won the match.

This provides an understanding of the relationship between toss results and final match outcomes.

---

### 6. Toss Decision Analysis

Teams' decisions after winning the toss were analyzed.

The two main decisions are:

* **Bat**
* **Field**

The analysis helps understand how frequently each decision was selected.

---

### 7. Top 10 Batsmen by Runs

Ball-by-ball data was aggregated to calculate total runs scored by individual batsmen.

The analysis identifies the top batsmen based on total runs.

---

### 8. Top Wicket-Takers

Bowler performance was analyzed using wicket information from the deliveries dataset.

Dismissals that should not be counted as bowler wickets, such as:

* Run Out
* Retired Hurt
* Obstructing the Field

were excluded where applicable.

---

### 9. Highest Individual Score

The highest individual score in a match was identified using ball-by-ball batting data.

---

### 10. Player of the Match Analysis

Player of the Match records were analyzed to identify players who received the award most frequently.

---

### 11. Highest Team Totals

Team innings totals were analyzed to identify the highest team scores.

---

### 12. Venue Analysis

IPL venues were analyzed based on:

* Number of matches
* Match frequency
* Team participation
* Venue-wise performance

---

### 13. Season-wise Top Scorer

A CTE and ranking/window functions were used to identify the highest-scoring batsman for each IPL season.

---

### 14. Season-wise Top Wicket-Taker

Bowling data was analyzed to identify the leading wicket-taker for each season.

---

### 15. Team Winning Percentage

Team winning percentages were calculated to understand performance relative to matches played.

---

# 🧠 SQL Concepts Used

The project demonstrates practical knowledge of:

* `SELECT`
* `WHERE`
* `GROUP BY`
* `ORDER BY`
* `HAVING`
* `CASE`
* Aggregate Functions
* `COUNT()`
* `SUM()`
* `MAX()`
* `JOIN`
* Subqueries
* Common Table Expressions (CTEs)
* `RANK()`
* Window Functions
* Conditional Aggregation
* Data Cleaning
* Data Standardization

---

# 📊 Part 2 — Excel Cricket Analytics Dashboard

After completing the SQL analysis, the IPL data was further analyzed using **Microsoft Excel**.

An interactive **IPL Cricket Analytics Dashboard** was created using PivotTables, PivotCharts, slicers, calculated fields, and KPI cards.

The dashboard provides a visual overview of IPL performance.

---

# 🎯 Dashboard KPIs

The dashboard contains important KPI cards including:

### 🏏 Total Matches

Displays the total number of IPL matches included in the analysis.

### 🏃 Total Runs

Shows the total runs generated from the available ball-by-ball data.

### 🎯 Total Wickets

Displays the total wickets recorded in the dataset.

### 🏆 Total Teams

Shows the number of teams participating in the analyzed data.

### 🏟️ Total Venues

Displays the number of venues included in the dataset.

### 🪙 Toss & Match

Analyzes the relationship between toss winners and match winners.

### 🏅 Matches Won

Provides a summary of match-winning performance.

---

# 📈 Excel Dashboard Analysis

The dashboard includes several analytical areas.

## 🏆 Season Analysis

Season-wise analysis includes:

* Number of matches
* Teams
* Venues
* Cities
* Season performance
* Season winner
* Toss and match results

A season slicer allows users to filter the dashboard based on the selected IPL season.

---

## 🏏 Team Performance

Team performance is analyzed using:

* Matches played
* Matches won
* Toss wins
* Toss-to-match wins
* Season performance

This provides a visual comparison of IPL teams.

---

## 🪙 Toss Analysis

The dashboard analyzes:

* Toss winners
* Toss decisions
* Bat vs Field decisions
* Toss winner vs match winner

This helps understand team decisions after winning the toss.

---

## 👤 Batting Analysis

The deliveries dataset is used to analyze batting performance.

The analysis includes:

* Total runs
* Top batsmen
* Player-wise performance
* Season-wise batting performance

---

## 🎳 Bowling Analysis

Bowling performance is analyzed using wicket information.

The dashboard includes:

* Total wickets
* Top wicket-takers
* Bowler-wise performance
* Season-wise bowling performance

---

## 🏟️ Venue Analysis

Venue-level analysis includes:

* Number of matches
* Venue frequency
* Match distribution
* Toss decisions by venue

This helps understand where IPL matches have been played most frequently.

---

# 📊 Excel Features Used

The dashboard was created using:

* Excel Tables
* PivotTables
* PivotCharts
* Slicers
* Calculated Columns
* Excel formulas
* KPI Cards
* Conditional formatting
* Data Cleaning
* Data Transformation
* Data Visualization
* Interactive filtering

---

# 🎛️ Interactive Dashboard

The dashboard includes **Slicers** that allow users to dynamically filter the analysis.

For example, users can select a particular season and view the corresponding:

* Matches
* Runs
* Wickets
* Teams
* Venues
* Toss information
* Player performance
* Match performance

This makes the dashboard interactive rather than being a static report.

---

# 🔄 Complete Project Workflow

```text
                 IPL Raw Dataset
                       │
                       ▼
                Data Understanding
                       │
                       ▼
                 Data Cleaning
                       │
                       ▼
              Team Name Standardization
                       │
                       ▼
                 SQL Analysis
                       │
          ┌────────────┴────────────┐
          ▼                         ▼
    Match Analysis             Player Analysis
          │                         │
          ▼                         ▼
    Team & Toss                 Batting &
      Analysis                  Bowling
          │                         │
          └────────────┬────────────┘
                       ▼
                Excel Data Preparation
                       │
                       ▼
                  PivotTables
                       │
                       ▼
                  PivotCharts
                       │
                       ▼
                 KPI Development
                       │
                       ▼
                  Slicers
                       │
                       ▼
             Interactive Dashboard
                       │
                       ▼
                IPL Insights
```

---

# 📂 Project Structure

```text
IPL-Cricket-Analytics/
│
├── IPL_SQL_Analysis.sql
│
├── IPL_Cricket_Analytics_Dashboard.xlsx
│
├── IPL_Dashboard.png
│
└── README.md
```

---

# 📁 Project Files

| File                                   | Description                                       |
| -------------------------------------- | ------------------------------------------------- |
| `IPL_SQL_Analysis.sql`                 | SQL queries used for IPL data analysis            |
| `IPL_Cricket_Analytics_Dashboard.xlsx` | Complete Excel analysis and interactive dashboard |
| `IPL_Dashboard.png`                    | Screenshot/preview of the Excel dashboard         |
| `README.md`                            | Project documentation                             |

---

# 📷 Dashboard Preview

Add your dashboard screenshot to the repository and display it here:

<img width="851" height="443" alt="IPL_Dashboard" src="https://github.com/user-attachments/assets/3c1971bd-727f-4652-b12e-f2aecd503c7e" />



---

# 💡 Key Insights from the Analysis

The project provides insights into several aspects of IPL cricket:

### Team Insights

* Team performance can be compared using matches played and matches won.
* Historical team names need to be standardized for accurate analysis.
* Team performance varies across IPL seasons.

### Toss Insights

* Toss winners can be compared with match winners.
* Teams have historically selected both batting and fielding after winning the toss.
* Toss decisions can be analyzed alongside final match outcomes.

### Player Insights

* Ball-by-ball data can be aggregated to identify leading run scorers.
* Bowling data can be used to identify leading wicket-takers.
* Player of the Match records provide another measure of individual contribution.

### Venue Insights

* Some venues have hosted significantly more IPL matches than others.
* Venue-level analysis can reveal differences in match frequency and toss decisions.

### Season Insights

* The number of matches and participating teams varies across IPL seasons.
* Season-wise ranking can identify leading batsmen and bowlers for individual seasons.

> **Note:** Dashboard values may change depending on the selected season or slicer/filter.

---

# 📚 What I Learned from This Project

This project helped me develop practical data analytics skills beyond simply writing queries or creating charts.

### SQL Skills

I learned how to:

* Work with large datasets.
* Clean and standardize data.
* Join related datasets.
* Write analytical queries.
* Use CTEs.
* Use ranking functions.
* Perform aggregations.
* Solve real-world analytical questions.

### Excel Skills

I learned how to:

* Prepare data for analysis.
* Create PivotTables.
* Create PivotCharts.
* Build KPI cards.
* Use slicers.
* Create interactive dashboards.
* Design data visualizations.
* Present analytical findings clearly.

### Data Analytics Skills

The project improved my understanding of:

* Exploratory Data Analysis
* Data Cleaning
* Data Transformation
* Data Aggregation
* Data Visualization
* Performance Analysis
* Comparative Analysis
* Insight Generation

---

# 🚀 Future Improvements

The project can be further improved by:

* Recreating the dashboard in Power BI.
* Connecting SQL Server directly to Power BI.
* Automating data refresh.
* Adding batting average.
* Adding strike rate.
* Adding bowling economy rate.
* Adding bowling average.
* Adding player consistency analysis.
* Adding team win percentage by season.
* Adding head-to-head team analysis.
* Adding player performance trends.
* Adding advanced venue analysis.
* Creating interactive player-level filters.

---

# 💼 Business/Data Analyst Perspective

Although this project is based on cricket data, the analytical process is similar to real-world business analytics.

The project demonstrates how to:

**Collect → Clean → Transform → Analyze → Visualize → Communicate**

For example:

| IPL Analysis       | Business Analytics Equivalent |
| ------------------ | ----------------------------- |
| Team performance   | Company/Product performance   |
| Player performance | Employee/Product performance  |
| Match wins         | Successful transactions       |
| Venue analysis     | Location analysis             |
| Season analysis    | Time-period analysis          |
| Toss analysis      | Decision analysis             |
| Runs               | Revenue/Performance metric    |
| Wickets            | Outcome/Activity metric       |

This makes the project useful for demonstrating practical **Data Analyst skills**.

---

# 🛠️ Tools & Technologies

### Database

**SQL Server**

Used for:

* Data cleaning
* Data transformation
* Data analysis
* Aggregation
* Advanced SQL queries

### Microsoft Excel

Used for:

* Data analysis
* PivotTables
* PivotCharts
* Slicers
* KPI cards
* Dashboard development
* Data visualization

### Additional Skills

* Data Cleaning
* Exploratory Data Analysis
* Data Visualization
* Analytical Thinking
* Problem Solving
* Insight Generation

---

# ⭐ Project Highlights

🏏 **End-to-End IPL Data Analytics Project**

🗄️ **SQL Server Data Analysis**

📊 **Interactive Excel Dashboard**

📈 **Team Performance Analysis**

👤 **Player Performance Analysis**

🎳 **Bowling & Batting Analysis**

🪙 **Toss Analysis**

🏟️ **Venue Analysis**

📅 **Season-wise Analysis**

🎯 **KPI Dashboard**

🔎 **Data Cleaning & Standardization**

📊 **PivotTable & PivotChart Analysis**

---

# 👩‍💻 Author

## Varshini

**Aspiring Data Analyst**

### Technical Skills

`SQL` `Excel` `Python` `Pandas` `NumPy` `Matplotlib` `Seaborn`

### Data Analytics Skills

`Data Cleaning` `Data Analysis` `Data Visualization` `Dashboard Development` `Exploratory Data Analysis` `SQL Analysis`

---

# 📌 Conclusion

The **IPL Cricket Analytics Project** demonstrates an end-to-end approach to data analysis using **SQL Server and Microsoft Excel**.

Starting from raw match-level and ball-by-ball data, the project performs data cleaning, standardization, analysis, aggregation, visualization, and dashboard development.

The combination of **SQL analysis and Excel dashboarding** demonstrates the ability to work with data at different stages of the analytics process and convert raw information into meaningful, visually understandable insights.
