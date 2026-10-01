import streamlit as st
import mysql.connector
import pandas as pd


# =====================================================
# PAGE CONFIGURATION
# =====================================================

st.set_page_config(
    page_title="Job Market Intelligence Dashboard",
    page_icon="📊",
    layout="wide"
)


# =====================================================
# TITLE
# =====================================================

st.title("📊 Job Market Intelligence Dashboard")

st.write(
    "Job Market analysis using MySQL, Python, Pandas and Streamlit"
)


# =====================================================
# MYSQL CONNECTION
# =====================================================

try:

    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Mansi@1810",
        database="job_market_intelligence"
    )

    st.success("MySQL database connected successfully!")


    # =================================================
    # LOAD JOB POSTINGS
    # =================================================

    job_query = """
    SELECT
        job_id,
        job_title,
        job_type,
        experience_required,
        salary_min,
        salary_max,
        work_mode,
        posted_date,
        company_id,
        role_id
    FROM job_postings
    """

    df = pd.read_sql(job_query, connection)


    # =================================================
    # LOAD COMPANIES
    # =================================================

    company_query = """
    SELECT
        company_id,
        company_name,
        industry_id
    FROM companies
    """

    companies_df = pd.read_sql(company_query, connection)


    # =================================================
    # LOAD JOB ROLES
    # =================================================

    role_query = """
    SELECT
        role_id,
        role_name
        
    FROM job_roles
    """

    roles_df = pd.read_sql(role_query, connection)


    # =================================================
    # LOAD INDUSTRIES
    # =================================================

    industry_query = """
    SELECT
        industry_id,
        industry_name
    FROM industries
    """

    industries_df = pd.read_sql(industry_query, connection)


    # =================================================
    # LOAD SKILL DEMAND
    # =================================================

    skill_query = """
    SELECT
        s.skill_name,
        COUNT(DISTINCT js.job_id) AS demand_count
    FROM job_skills js
    JOIN skills s
        ON js.skill_id = s.skill_id
    GROUP BY s.skill_name
    ORDER BY demand_count DESC
    """

    skill_df = pd.read_sql(skill_query, connection)


    # =================================================
    # DATA CLEANING
    # =================================================

    df["posted_date"] = pd.to_datetime(
        df["posted_date"],
        errors="coerce"
    )

    df["salary_min"] = pd.to_numeric(
        df["salary_min"],
        errors="coerce"
    )

    df["salary_max"] = pd.to_numeric(
        df["salary_max"],
        errors="coerce"
    )


    # =================================================
    # DASHBOARD SECTION 1
    # JOB MARKET OVERVIEW
    # =================================================

    st.header("📌 Job Market Overview")

    total_jobs = len(df)

    total_companies = companies_df["company_id"].nunique()

    total_roles = roles_df["role_id"].nunique()

    total_industries = industries_df["industry_id"].nunique()


    col1, col2, col3, col4 = st.columns(4)


    with col1:
        st.metric(
            "Total Jobs",
            total_jobs
        )


    with col2:
        st.metric(
            "Total Companies",
            total_companies
        )


    with col3:
        st.metric(
            "Total Roles",
            total_roles
        )


    with col4:
        st.metric(
            "Total Industries",
            total_industries
        )


    # =================================================
    # TOP ROLES
    # =================================================

    st.subheader("Top Job Roles")

    role_demand = (
        df.groupby("role_id")
        .size()
        .reset_index(name="total_jobs")
        .merge(
            roles_df[["role_id", "role_name"]],
            on="role_id",
            how="left"
        )
        .sort_values(
            "total_jobs",
            ascending=False
        )
        .head(10)
    )

    st.bar_chart(
        role_demand.set_index("role_name")["total_jobs"]
    )


    # =================================================
    # TOP INDUSTRIES
    # =================================================

    st.subheader("Top Industries")

    industry_demand = (
        companies_df
        .merge(
            industries_df,
            on="industry_id",
            how="left"
        )
        .merge(
            df.groupby("company_id")
            .size()
            .reset_index(name="job_count"),
            on="company_id",
            how="left"
        )
    )

    industry_demand["job_count"] = (
        industry_demand["job_count"]
        .fillna(0)
    )

    industry_summary = (
        industry_demand
        .groupby("industry_name")["job_count"]
        .sum()
        .sort_values(ascending=False)
        .head(10)
    )

    st.bar_chart(industry_summary)


    # =================================================
    # DASHBOARD SECTION 2
    # SKILL DEMAND
    # =================================================

    st.header("💡 Skill Demand")


    col1, col2 = st.columns(2)


    with col1:

        st.subheader("Top 10 Most Demanded Skills")

        top_skills = skill_df.head(10)

        st.bar_chart(
            top_skills.set_index(
                "skill_name"
            )["demand_count"]
        )


    with col2:

        st.subheader("Skill Demand Table")

        st.dataframe(
            top_skills,
            width="stretch"
        )


    # =================================================
    # ROLE-WISE SKILL DEMAND
    # =================================================

    st.subheader("Role-wise Skill Demand")

    role_skill_query = """
    SELECT
        jr.role_name,
        s.skill_name,
        COUNT(DISTINCT js.job_id) AS demand_count
    FROM job_roles jr
    JOIN job_postings jp
        ON jr.role_id = jp.role_id
    JOIN job_skills js
        ON jp.job_id = js.job_id
    JOIN skills s
        ON js.skill_id = s.skill_id
    GROUP BY
        jr.role_name,
        s.skill_name
    ORDER BY demand_count DESC
    """

    role_skill_df = pd.read_sql(
        role_skill_query,
        connection
    )

    st.dataframe(
        role_skill_df.head(20),
        width="stretch"
    )


    # =================================================
    # DASHBOARD SECTION 3
    # SALARY ANALYSIS
    # =================================================

    st.header("💰 Salary Analysis")


    col1, col2, col3 = st.columns(3)


    with col1:

        avg_min_salary = round(
            df["salary_min"].mean(),
            2
        )

        st.metric(
            "Average Minimum Salary",
            avg_min_salary
        )


    with col2:

        avg_max_salary = round(
            df["salary_max"].mean(),
            2
        )

        st.metric(
            "Average Maximum Salary",
            avg_max_salary
        )


    with col3:

        highest_salary = round(
            df["salary_max"].max(),
            2
        )

        st.metric(
            "Highest Maximum Salary",
            highest_salary
        )


    # =================================================
    # SALARY BY WORK MODE
    # =================================================

    st.subheader("Salary by Work Mode")

    salary_work_mode = (
        df.groupby("work_mode")
        .agg(
            average_min_salary=(
                "salary_min",
                "mean"
            ),
            average_max_salary=(
                "salary_max",
                "mean"
            )
        )
        .round(2)
    )

    st.dataframe(
        salary_work_mode,
        width="stretch"
    )


    # =================================================
    # SALARY BY EXPERIENCE
    # =================================================

    st.subheader("Salary by Experience")

    salary_experience = (
        df.groupby("experience_required")
        .agg(
            average_min_salary=(
                "salary_min",
                "mean"
            ),
            average_max_salary=(
                "salary_max",
                "mean"
            )
        )
        .round(2)
    )

    st.bar_chart(
        salary_experience
    )


    # =================================================
    # DASHBOARD SECTION 4
    # WORK MODE
    # =================================================

    st.header("🏢 Work Mode Analysis")

    work_mode_counts = (
        df["work_mode"]
        .value_counts()
    )

    st.bar_chart(
        work_mode_counts
    )


    st.dataframe(
        work_mode_counts
        .reset_index()
        .rename(
            columns={
                "work_mode": "Work Mode",
                "count": "Total Jobs"
            }
        ),
        width="stretch"
    )


    # =================================================
    # JOB TYPE
    # =================================================

    st.subheader("Job Type Distribution")

    job_type_counts = (
        df["job_type"]
        .value_counts()
    )

    st.bar_chart(
        job_type_counts
    )


    # =================================================
    # DASHBOARD SECTION 5
    # SKILL GAP
    # =================================================

    st.header("🎯 Skill Gap Analysis")


    skill_gap_query = """
    SELECT
        s.skill_name,
        COUNT(DISTINCT js.job_id) AS job_demand,
        COUNT(DISTINCT cs.candidate_id) AS candidate_count
    FROM skills s
    LEFT JOIN job_skills js
        ON s.skill_id = js.skill_id
    LEFT JOIN candidate_skills cs
        ON s.skill_id = cs.skill_id
    GROUP BY
        s.skill_id,
        s.skill_name
    ORDER BY job_demand DESC
    """

    skill_gap_df = pd.read_sql(
        skill_gap_query,
        connection
    )


    skill_gap_df["demand_gap"] = (
        skill_gap_df["job_demand"]
        -
        skill_gap_df["candidate_count"]
    )


    st.subheader(
        "Market Demand vs Candidate Availability"
    )

    st.dataframe(
        skill_gap_df.head(15),
        width="stretch"
    )


    # =================================================
    # CANDIDATE 1 SKILL MATCH
    # =================================================

    st.subheader(
        "Candidate 1 — Data Analyst Skill Match"
    )


    candidate_match_query = """
    SELECT
        COUNT(DISTINCT CASE
            WHEN cs.skill_id IS NOT NULL
            THEN js.skill_id
        END) AS matched_skills,

        COUNT(DISTINCT js.skill_id)
        AS required_skills

    FROM job_postings jp

    JOIN job_roles jr
        ON jp.role_id = jr.role_id

    JOIN job_skills js
        ON jp.job_id = js.job_id

    LEFT JOIN candidate_skills cs
        ON cs.skill_id = js.skill_id
        AND cs.candidate_id = 1

    WHERE LOWER(jr.role_name)
        LIKE '%data analyst%'
    """

    candidate_match = pd.read_sql(
        candidate_match_query,
        connection
    )


    matched = int(
        candidate_match.loc[
            0,
            "matched_skills"
        ]
    )

    required = int(
        candidate_match.loc[
            0,
            "required_skills"
        ]
    )


    if required > 0:

        match_percentage = round(
            matched * 100 / required,
            2
        )

    else:

        match_percentage = 0


    col1, col2, col3 = st.columns(3)


    with col1:

        st.metric(
            "Matched Skills",
            matched
        )


    with col2:

        st.metric(
            "Required Skills",
            required
        )


    with col3:

        st.metric(
            "Skill Match %",
            f"{match_percentage}%"
        )


    # =================================================
    # DASHBOARD SECTION 6
    # JOB POSTINGS DATA
    # =================================================

    st.header("📋 Job Postings Data")

    st.dataframe(
        df,
        width="stretch"
    )


    # =================================================
    # FOOTER
    # =================================================

    st.success(
        "Dashboard loaded successfully from MySQL database."
    )


except mysql.connector.Error as error:

    st.error(
        f"MySQL Error: {error}"
    )


finally:

    if (
        "connection" in locals()
        and connection.is_connected()
    ):

        connection.close()