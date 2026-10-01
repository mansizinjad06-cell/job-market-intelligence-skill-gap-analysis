Job Market Intelligence & Skill Gap Analysis System

A data analytics project that analyzes job postings, salaries, skills, job roles, industries, work modes, and candidate skill gaps using MySQL, SQL, Python, Pandas, Matplotlib, and Streamlit.

📌 Project Overview

The purpose of this project is to understand job-market related data and turn it into useful insights through database analysis, Python-based analysis, and an interactive dashboard.

The project follows a complete data analytics workflow:

Database → SQL Analysis → Python Analysis → Visualization → Dashboard

«Dataset Note:
This project uses a realistic synthetic dataset created for educational and portfolio purposes. The data is not collected from a live job portal and should not be considered real-time job-market statistics.»

🎯 Objectives

- Analyze job postings using SQL
- Identify high-demand job roles and industries
- Analyze salary ranges
- Identify the most demanded skills
- Analyze remote, hybrid, and onsite jobs
- Compare market skill demand with candidate skills
- Perform additional analysis using Python and Pandas
- Create visualizations using Matplotlib
- Build an interactive dashboard using Streamlit

🛠️ Technologies Used

Technology| Purpose
MySQL| Database management
SQL| Data analysis
Python| Data analysis
Pandas| Data manipulation
Matplotlib| Data visualization
Streamlit| Interactive dashboard
MySQL Connector| Python-MySQL connection
VS Code| Development

🗃️ Dataset

The synthetic dataset contains approximately:

- 500 job postings
- 50 companies
- 20 job roles
- 15 industries

The dataset includes information such as:

- Job title
- Job type
- Experience required
- Minimum salary
- Maximum salary
- Work mode
- Posted date
- Company
- Industry
- Skills
- Candidate skills

🗄️ Database

Database name:

job_market_intelligence

Main tables include:

- "companies"
- "industries"
- "job_postings"
- "job_roles"
- "locations"
- "skills"
- "job_skills"
- "candidates"
- "candidate_skills"
- "interviews"

An ER diagram was created to represent the relationships between the database tables.

🔎 SQL Analysis

The SQL part of the project is divided into five sections:

Basic Queries

- Filtering
- Sorting
- Aggregate functions
- GROUP BY
- HAVING
- Basic salary analysis

Intermediate Queries

- JOIN operations
- Multiple-table analysis
- Subqueries
- CASE statements
- Aggregation-based analysis

Advanced Queries

- Complex subqueries
- CTEs
- Window functions
- Ranking and comparisons

Skill Analysis

- Top demanded skills
- Skill demand by role
- Candidate skill availability
- Skill gap analysis
- Candidate skill matching

Business Insights

- Job demand
- Salary patterns
- Company job postings
- Industry analysis
- Work mode analysis
- Skill demand

🐍 Python Analysis

Python was used after completing the SQL analysis.

The Python workflow includes:

- MySQL connection
- Data loading using Pandas
- Data cleaning
- Grouping
- Aggregation
- Salary analysis
- Work mode analysis
- Job type analysis
- Experience analysis
- Skill demand analysis
- Insight generation

📊 Visualizations

The following charts were created using Matplotlib:

1. Job Distribution by Work Mode
2. Job Distribution by Job Type
3. Jobs by Experience Requirement
4. Distribution of Maximum Salary
5. Monthly Job Postings

The generated charts are available in the "screenshots" folder.

📈 Streamlit Dashboard

An interactive dashboard was created using Streamlit and connected directly to MySQL.

Dashboard sections

Job Market Overview

- Total Jobs
- Total Companies
- Total Roles
- Total Industries
- Top Job Roles
- Top Industries

Skill Demand

- Top 10 Most Demanded Skills
- Skill Demand Table
- Role-wise Skill Demand

Salary Analysis

- Average Salary
- Salary by Work Mode
- Salary by Experience

Work Mode Analysis

- Work Mode Distribution
- Job Type Distribution

Skill Gap Analysis

- Market Demand vs Candidate Availability
- Candidate Skill Match
- Skill Match Percentage

Job Postings Data

- Job posting records displayed in the dashboard

⭐ Key Project Highlights

- Relational MySQL database design
- Normalized database structure
- Basic to advanced SQL analysis
- Skill demand and skill gap analysis
- Python-MySQL integration
- Pandas-based analysis
- Matplotlib visualizations
- Interactive Streamlit dashboard
- Candidate skill matching
- Portfolio-ready project structure

📁 Project Structure

Job-Market-Intelligence/
│
├── database/
│   ├── create_database.sql
│   ├── create_tables.sql
│   └── insert_data.sql
│
├── sql/
│   ├── basic_queries.sql
│   ├── intermediate_queries.sql
│   ├── advanced_queries.sql
│   ├── skill_analysis.sql
│   └── business_insights.sql
│
├── python/
│   └── mysql_connection.py
│
├── dashboard/
│   └── app.py
│
├── er_diagram/
│
├── screenshots/
│
├── data/
│
└── documentation/
    └── project_documentation.txt

▶️ How to Run the Dashboard

1. Install required Python libraries

pip install mysql-connector-python pandas numpy matplotlib streamlit

2. Make sure MySQL is running

The database used by the project is:

job_market_intelligence

3. Run the Streamlit dashboard

From the project folder:

python -m streamlit run dashboard\app.py

The dashboard will open in the browser.

⚠️ Limitations

- The dataset is synthetic.
- The data is created for educational and portfolio purposes.
- It does not represent real-time job-market conditions.
- Candidate matching is based on the skills available in the project dataset.

🚀 Future Scope

Possible future improvements include:

- Real-time job-market datasets
- More candidate profiles
- Interactive dashboard filters
- Job recommendation functionality
- More detailed skill analysis
- Online deployment of the Streamlit dashboard
- Integration with external job-market datasets or APIs

👩‍💻 Project Focus

This project demonstrates practical skills in:

SQL | MySQL | Python | Pandas | NumPy | Matplotlib | Streamlit | Data Analysis | Data Visualization

---

Note

This project was developed as a portfolio and educational data analytics project to demonstrate the complete process of storing, analyzing, visualizing, and presenting structured job-market data.