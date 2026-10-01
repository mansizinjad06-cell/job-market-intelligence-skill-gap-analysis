import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt


# ==========================================
# MYSQL DATABASE CONNECTION
# ==========================================

try:

    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Mansi@1810",
        database="job_market_intelligence"
    )

    print("MySQL database connected successfully!")


    # ==========================================
    # 1. DATA LOADING
    # ==========================================

    query = """
    SELECT
        job_id,
        job_title,
        job_type,
        experience_required,
        salary_min,
        salary_max,
        work_mode,
        posted_date
    FROM job_postings;
    """

    df = pd.read_sql(query, connection)

    # ==========================================
# DATA CLEANING
# ==========================================

    print("\n--- Data Cleaning ---")

    print("Missing values before cleaning:")
    print(df.isnull().sum())

# Remove duplicate records
    df = df.drop_duplicates()

# Fill missing salary values with median
    df["salary_min"] = df["salary_min"].fillna(
    df["salary_min"].median()
)

    df["salary_max"] = df["salary_max"].fillna(
    df["salary_max"].median()
)

# Convert posted_date to datetime
    df["posted_date"] = pd.to_datetime(
    df["posted_date"],
    errors="coerce"
)

    print("\nMissing values after cleaning:")
    print(df.isnull().sum())

    print("\nTotal records after cleaning:", len(df))

    print("\n--- Job Postings Data ---")
    print(df.head())

    print("\nTotal job records:", len(df))


    # ==========================================
    # 2. DATA CLEANING
    # ==========================================

    print("\n--- Data Cleaning ---")

    print("Missing values before cleaning:")
    print(df.isnull().sum())

    print("\nDuplicate records:", df.duplicated().sum())

    # Remove duplicate records
    df = df.drop_duplicates()

    # Convert date column
    df["posted_date"] = pd.to_datetime(
        df["posted_date"],
        errors="coerce"
    )

    # Remove rows with missing important values
    df = df.dropna(
        subset=[
            "job_title",
            "job_type",
            "experience_required",
            "salary_min",
            "salary_max",
            "work_mode",
            "posted_date"
        ]
    )

    print("\nData cleaning completed.")

    print("Records after cleaning:", len(df))


    # ==========================================
    # 3. GROUPING ANALYSIS
    # ==========================================

    print("\n--- Work Mode Analysis ---")

    work_mode_analysis = df["work_mode"].value_counts()
    print(work_mode_analysis)


    print("\n--- Job Type Analysis ---")

    job_type_analysis = df["job_type"].value_counts()
    print(job_type_analysis)


    print("\n--- Experience Requirement Analysis ---")

    experience_analysis = df["experience_required"].value_counts()
    print(experience_analysis)


    # ==========================================
    # 4. SALARY AGGREGATION
    # ==========================================

    print("\n--- Salary Analysis ---")

    print(
        "Average Minimum Salary:",
        round(df["salary_min"].mean(), 2)
    )

    print(
        "Average Maximum Salary:",
        round(df["salary_max"].mean(), 2)
    )

    print(
        "Highest Maximum Salary:",
        round(df["salary_max"].max(), 2)
    )

    print(
        "Lowest Minimum Salary:",
        round(df["salary_min"].min(), 2)
    )

    print(
        "Average Salary Range:",
        round(
            (df["salary_max"] - df["salary_min"]).mean(),
            2
        )
    )


    # ==========================================
    # 5. BASIC VISUALIZATION
    # ==========================================

    # ------------------------------------------
    # 5.1 JOB DISTRIBUTION BY WORK MODE
    # ------------------------------------------

    plt.figure(figsize=(8, 5))

    work_mode_analysis.plot(kind="bar")

    plt.title("Job Distribution by Work Mode")
    plt.xlabel("Work Mode")
    plt.ylabel("Number of Jobs")
    plt.xticks(rotation=0)

    plt.tight_layout()

    plt.savefig(
        "screenshots/work_mode_distribution.png",
        dpi=300,
        bbox_inches="tight"
    )

    plt.show()
    plt.close()


    # ------------------------------------------
    # 5.2 JOB DISTRIBUTION BY JOB TYPE
    # ------------------------------------------

    plt.figure(figsize=(8, 5))

    job_type_analysis.plot(kind="bar")

    plt.title("Job Distribution by Job Type")
    plt.xlabel("Job Type")
    plt.ylabel("Number of Jobs")
    plt.xticks(rotation=45)

    plt.tight_layout()

    plt.savefig(
        "screenshots/job_type_distribution.png",
        dpi=300,
        bbox_inches="tight"
    )

    plt.show()
    plt.close()


    # ------------------------------------------
    # 5.3 JOBS BY EXPERIENCE REQUIREMENT
    # ------------------------------------------

    plt.figure(figsize=(8, 5))

    experience_analysis.plot(kind="bar")

    plt.title("Jobs by Experience Requirement")
    plt.xlabel("Experience Required")
    plt.ylabel("Number of Jobs")
    plt.xticks(rotation=45)

    plt.tight_layout()

    plt.savefig(
        "screenshots/experience_requirement.png",
        dpi=300,
        bbox_inches="tight"
    )

    plt.show()
    plt.close()


    # ------------------------------------------
    # 5.4 DISTRIBUTION OF MAXIMUM SALARY
    # ------------------------------------------

    plt.figure(figsize=(8, 5))

    df["salary_max"].plot(
        kind="hist",
        bins=10
    )

    plt.title("Distribution of Maximum Salary")
    plt.xlabel("Maximum Salary")
    plt.ylabel("Number of Jobs")

    plt.tight_layout()

    plt.savefig(
        "screenshots/maximum_salary_distribution.png",
        dpi=300,
        bbox_inches="tight"
    )

    plt.show()
    plt.close()


    # ------------------------------------------
    # 5.5 MONTHLY JOB POSTINGS
    # ------------------------------------------

    monthly_jobs = (
        df.groupby(
            df["posted_date"].dt.to_period("M")
        )
        .size()
    )

    plt.figure(figsize=(10, 5))

    monthly_jobs.plot(kind="bar")

    plt.title("Monthly Job Postings")
    plt.xlabel("Month")
    plt.ylabel("Number of Jobs")
    plt.xticks(rotation=45)

    plt.tight_layout()

    plt.savefig(
        "screenshots/monthly_job_postings.png",
        dpi=300,
        bbox_inches="tight"
    )

    plt.show()
    plt.close()


    # ==========================================
# INSIGHT GENERATION
# ==========================================

    print("\n--- KEY INSIGHTS ---")

# Most common work mode
    most_common_work_mode = work_mode_analysis.idxmax()
    print(
    "1. Most common work mode:",
    most_common_work_mode
)

# Most common job type
    most_common_job_type = job_type_analysis.idxmax()
    print(
    "2. Most common job type:",
    most_common_job_type
)

# Most demanded skill
    top_skill = skill_df.iloc[0]["skill_name"]
    top_skill_demand = skill_df.iloc[0]["demand_count"]

    print(
    "3. Most demanded skill:",
    top_skill,
    "with",
    top_skill_demand,
    "job postings"
)

# Highest average maximum salary by work mode
    highest_salary_mode = work_mode_salary[
    "average_max_salary"
].idxmax()

    highest_salary_value = work_mode_salary[
    "average_max_salary"
].max()

    print(
    "4. Work mode with highest average maximum salary:",
    highest_salary_mode,
    "(",
    round(highest_salary_value, 2),
    ")"
)

# Highest salary job
    highest_salary_job = df.loc[
    df["salary_max"].idxmax()
]

    print(
    "5. Highest maximum salary job:",
    highest_salary_job["job_title"],
    "with salary",
    highest_salary_job["salary_max"]
)

    # ==========================================
    # COMPLETION MESSAGE
    # ==========================================

    print("\nPython analysis completed successfully!")

    print("\n5 charts saved in screenshots folder:")
    print("1. work_mode_distribution.png")
    print("2. job_type_distribution.png")
    print("3. experience_requirement.png")
    print("4. maximum_salary_distribution.png")
    print("5. monthly_job_postings.png")


except mysql.connector.Error as error:

    print("MySQL Error:", error)


finally:

    if 'connection' in locals() and connection.is_connected():

        connection.close()

        print("\nConnection closed.")