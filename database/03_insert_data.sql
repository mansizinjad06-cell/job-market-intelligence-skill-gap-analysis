USE job_market_intelligence;

-- =========================================
-- 1. INDUSTRIES
-- =========================================

INSERT INTO industries (industry_name)
VALUES
('Information Technology'),
('FinTech'),
('E-commerce'),
('Healthcare'),
('EdTech'),
('Banking'),
('Insurance'),
('Telecommunications'),
('Manufacturing'),
('Consulting'),
('Retail'),
('Logistics'),
('Media and Entertainment'),
('Automotive'),
('Government and Public Sector');

SELECT * FROM industries;

SELECT COUNT(*) AS total_industries FROM industries;

USE job_market_intelligence;

-- =========================================
-- COMPANIES
-- =========================================

INSERT INTO companies (company_name, industry_id)
VALUES
('TechNova Solutions', 1),
('DataSphere Technologies', 1),
('CloudBridge Systems', 1),
('CodeCraft Technologies', 1),
('NextGen Digital Labs', 1),

('FinEdge Technologies', 2),
('PayMatrix Solutions', 2),
('MoneyWise Digital', 2),

('ShopKart Online', 3),
('QuickCart Technologies', 3),
('MarketHub Online', 3),
('RetailSphere', 3),

('MediCore Analytics', 4),
('HealthBridge Systems', 4),
('CareTech Solutions', 4),

('LearnSphere Technologies', 5),
('EduNext Learning', 5),
('SkillBridge Academy', 5),

('PrimeBank Services', 6),
('UrbanBank Digital', 6),
('National Finance Bank', 6),

('SecureLife Insurance', 7),
('TrustShield Insurance', 7),
('InsureTech Solutions', 7),

('ConnectWave Telecom', 8),
('TeleNet Communications', 8),
('NextLink Networks', 8),

('AutoMotion Industries', 9),
('Precision Manufacturing', 9),
('SmartFactory Technologies', 9),

('Insight Consulting Group', 10),
('BusinessEdge Consulting', 10),
('Analytics Advisory Services', 10),
('StrategyWorks India', 10),

('MegaRetail India', 11),
('UrbanMart Retail', 11),
('ValueStore India', 11),

('LogiTrack Solutions', 12),
('FleetFlow Technologies', 12),
('SupplyChain Connect', 12),

('MediaPulse Network', 13),
('StreamVista Entertainment', 13),
('CreativeSphere Media', 13),

('DriveTech Motors', 14),
('AutoVision Systems', 14),
('MobilityWorks India', 14),

('CivicData Solutions', 15),
('PublicTech Services', 15),
('GovAnalytics Systems', 15),
('Digital Governance Labs', 15);

SELECT * FROM companies;

SELECT COUNT(*) AS total_companies FROM companies;

SELECT*FROM companies ORDER BY company_id;

SELECT c.company_id, c.company_name, i.industry_name 
FROM companies c
JOIN industries i 
ON c.industry_id = i.industry_id 
ORDER BY c.company_id;

-- =========================================
-- JOB ROLES
-- =========================================

INSERT INTO job_roles (role_name)
VALUES
('Data Analyst'),
('Business Analyst'),
('Data Scientist'),
('Business Intelligence Analyst'),
('Python Developer'),
('SQL Developer'),
('Data Engineer'),
('Machine Learning Engineer'),
('Machine Learning Intern'),
('Data Analyst Intern'),
('Business Analyst Intern'),
('Software Developer'),
('Software Engineer'),
('Product Analyst'),
('Financial Analyst'),
('Marketing Analyst'),
('Operations Analyst'),
('Risk Analyst'),
('Research Analyst'),
('BI Developer');

SELECT COUNT(*) AS total_roles FROM job_roles;

SELECT * FROM job_roles ORDER BY role_id;

-- =========================================
-- LOCATIONS
-- =========================================

INSERT INTO locations (city, state, country)
VALUES
('Pune', 'Maharashtra', 'India'),
('Mumbai', 'Maharashtra', 'India'),
('Bengaluru', 'Karnataka', 'India'),
('Hyderabad', 'Telangana', 'India'),
('Chennai', 'Tamil Nadu', 'India'),
('Delhi', 'Delhi', 'India'),
('New Delhi', 'Delhi', 'India'),
('Gurugram', 'Haryana', 'India'),
('Noida', 'Uttar Pradesh', 'India'),
('Ahmedabad', 'Gujarat', 'India'),
('Kolkata', 'West Bengal', 'India'),
('Jaipur', 'Rajasthan', 'India'),
('Indore', 'Madhya Pradesh', 'India'),
('Nagpur', 'Maharashtra', 'India'),
('Nashik', 'Maharashtra', 'India'),
('Surat', 'Gujarat', 'India'),
('Chandigarh', 'Chandigarh', 'India'),
('Kochi', 'Kerala', 'India'),
('Coimbatore', 'Tamil Nadu', 'India'),
('Bhubaneswar', 'Odisha', 'India'),
('Mysuru', 'Karnataka', 'India'),
('Thiruvananthapuram', 'Kerala', 'India'),
('Vadodara', 'Gujarat', 'India'),
('Lucknow', 'Uttar Pradesh', 'India'),
('Bhopal', 'Madhya Pradesh', 'India'),
('Patna', 'Bihar', 'India'),
('Ranchi', 'Jharkhand', 'India'),
('Visakhapatnam', 'Andhra Pradesh', 'India'),
('Remote', 'Multiple Locations', 'India'),
('Pan India', 'Multiple States', 'India');

SELECT COUNT(*) AS total_locations FROM locations;

SELECT * FROM locations ORDER BY location_id;

-- =========================================
-- SKILLS
-- =========================================

INSERT INTO skills (skill_name, skill_category)
VALUES
('SQL', 'Technical'),
('Python', 'Technical'),
('Excel', 'Technical'),
('Power BI', 'Technical'),
('Tableau', 'Technical'),
('Pandas', 'Technical'),
('NumPy', 'Technical'),
('Matplotlib', 'Technical'),
('Statistics', 'Technical'),
('Machine Learning', 'Technical'),
('Deep Learning', 'Technical'),
('R Programming', 'Technical'),
('MySQL', 'Technical'),
('PostgreSQL', 'Technical'),
('MongoDB', 'Technical'),
('Data Visualization', 'Technical'),
('Data Cleaning', 'Technical'),
('ETL', 'Technical'),
('Data Warehousing', 'Technical'),
('Power Query', 'Technical'),
('DAX', 'Technical'),
('Git', 'Technical'),
('GitHub', 'Technical'),
('AWS', 'Cloud'),
('Microsoft Azure', 'Cloud'),
('Google Cloud', 'Cloud'),
('Apache Spark', 'Big Data'),
('Hadoop', 'Big Data'),
('Apache Airflow', 'Big Data'),
('TensorFlow', 'Machine Learning'),
('Scikit-learn', 'Machine Learning'),
('Natural Language Processing', 'Machine Learning'),
('Financial Analysis', 'Business'),
('Business Intelligence', 'Business'),
('Market Research', 'Business'),
('Requirements Analysis', 'Business'),
('Agile', 'Methodology'),
('Jira', 'Tools'),
('Communication', 'Soft Skill'),
('Problem Solving', 'Soft Skill'),
('Critical Thinking', 'Soft Skill'),
('Presentation', 'Soft Skill'),
('Project Management', 'Management'),
('Stakeholder Management', 'Management'),
('Business Strategy', 'Management'),
('Data Modeling', 'Technical');

SELECT COUNT(*) AS total_skills FROM skills;

SELECT * FROM skills ORDER BY skill_id;

SELECT skill_category, COUNT(*) AS  skill_count FROM skills GROUP BY skill_category;

-- =========================================
-- JOB POSTINGS - 500 SYNTHETIC RECORDS
-- =========================================

USE job_market_intelligence;

INSERT INTO job_postings
(
    company_id,
    role_id,
    location_id,
    job_title,
    job_type,
    experience_required,
    salary_min,
    salary_max,
    work_mode,
    posted_date,
    closing_date
)
SELECT
    ((n - 1) MOD 50) + 1 AS company_id,

    ((n - 1) MOD 20) + 1 AS role_id,

    ((n - 1) MOD 30) + 1 AS location_id,

    CONCAT(
        CASE ((n - 1) MOD 20) + 1
            WHEN 1 THEN 'Data Analyst'
            WHEN 2 THEN 'Business Analyst'
            WHEN 3 THEN 'Data Scientist'
            WHEN 4 THEN 'Business Intelligence Analyst'
            WHEN 5 THEN 'Python Developer'
            WHEN 6 THEN 'SQL Developer'
            WHEN 7 THEN 'Data Engineer'
            WHEN 8 THEN 'Machine Learning Engineer'
            WHEN 9 THEN 'Machine Learning Intern'
            WHEN 10 THEN 'Data Analyst Intern'
            WHEN 11 THEN 'Business Analyst Intern'
            WHEN 12 THEN 'Software Developer'
            WHEN 13 THEN 'Software Engineer'
            WHEN 14 THEN 'Product Analyst'
            WHEN 15 THEN 'Financial Analyst'
            WHEN 16 THEN 'Marketing Analyst'
            WHEN 17 THEN 'Operations Analyst'
            WHEN 18 THEN 'Risk Analyst'
            WHEN 19 THEN 'Research Analyst'
            WHEN 20 THEN 'BI Developer'
        END,
        ' - ',
        CASE
            WHEN n MOD 4 = 0 THEN 'Entry Level'
            WHEN n MOD 4 = 1 THEN 'Junior'
            WHEN n MOD 4 = 2 THEN 'Associate'
            ELSE 'Analyst'
        END
    ) AS job_title,

    CASE
        WHEN ((n - 1) MOD 20) + 1 IN (9,10,11) THEN 'Internship'
        WHEN n MOD 10 = 0 THEN 'Contract'
        WHEN n MOD 7 = 0 THEN 'Part-time'
        ELSE 'Full-time'
    END AS job_type,

    CASE
        WHEN ((n - 1) MOD 20) + 1 IN (9,10,11) THEN '0-1 years'
        WHEN n MOD 5 = 0 THEN '3-5 years'
        WHEN n MOD 3 = 0 THEN '2-4 years'
        ELSE '0-2 years'
    END AS experience_required,

    CASE
        WHEN ((n - 1) MOD 20) + 1 IN (9,10,11)
            THEN 15000 + ((n MOD 8) * 2500)
        ELSE
            300000 + ((n MOD 10) * 50000)
    END AS salary_min,

    CASE
        WHEN ((n - 1) MOD 20) + 1 IN (9,10,11)
            THEN 25000 + ((n MOD 8) * 3000)
        ELSE
            450000 + ((n MOD 10) * 60000)
    END AS salary_max,

    CASE
        WHEN n MOD 3 = 0 THEN 'Remote'
        WHEN n MOD 3 = 1 THEN 'Hybrid'
        ELSE 'Onsite'
    END AS work_mode,

    DATE_ADD(
        '2026-01-01',
        INTERVAL (n MOD 270) DAY
    ) AS posted_date,

    DATE_ADD(
        DATE_ADD(
            '2026-01-01',
            INTERVAL (n MOD 270) DAY
        ),
        INTERVAL (15 + (n MOD 45)) DAY
    ) AS closing_date

FROM (
    SELECT
        ones.n
        + tens.n * 10
        + hundreds.n * 100
        + 1 AS n
    FROM
        (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) ones
    CROSS JOIN
        (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) tens
    CROSS JOIN
        (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4) hundreds
) numbers
WHERE n <= 500;

SELECT COUNT(*) AS total_jobs FROM  job_postings;

SELECT * FROM job_postings LIMIT 10;

-- =========================================
-- JOB SKILLS
-- =========================================

USE job_market_intelligence;

INSERT INTO job_skills (job_id, skill_id)

SELECT
    jp.job_id,
    s.skill_id

FROM job_postings jp
JOIN skills s

WHERE

    -- Data Analyst
    (
        jp.role_id = 1
        AND s.skill_name IN
        ('SQL', 'Python', 'Excel', 'Pandas',
         'Statistics', 'Power BI', 'Data Visualization',
         'Data Cleaning')
    )

    OR

    -- Business Analyst
    (
        jp.role_id = 2
        AND s.skill_name IN
        ('SQL', 'Excel', 'Power BI', 'Tableau',
         'Business Intelligence', 'Requirements Analysis',
         'Communication', 'Presentation')
    )

    OR

    -- Data Scientist
    (
        jp.role_id = 3
        AND s.skill_name IN
        ('Python', 'SQL', 'Pandas', 'NumPy',
         'Statistics', 'Machine Learning',
         'Scikit-learn', 'Data Visualization')
    )

    OR

    -- Business Intelligence Analyst
    (
        jp.role_id = 4
        AND s.skill_name IN
        ('SQL', 'Excel', 'Power BI', 'Tableau',
         'DAX', 'Business Intelligence',
         'Data Visualization', 'Data Modeling')
    )

    OR

    -- Python Developer
    (
        jp.role_id = 5
        AND s.skill_name IN
        ('Python', 'Git', 'GitHub', 'SQL',
         'MongoDB', 'Problem Solving')
    )

    OR

    -- SQL Developer
    (
        jp.role_id = 6
        AND s.skill_name IN
        ('SQL', 'MySQL', 'PostgreSQL',
         'Data Modeling', 'ETL', 'Git')
    )

    OR

    -- Data Engineer
    (
        jp.role_id = 7
        AND s.skill_name IN
        ('Python', 'SQL', 'ETL',
         'Data Warehousing', 'Apache Spark',
         'Apache Airflow', 'AWS', 'Data Modeling')
    )

    OR

    -- Machine Learning Engineer
    (
        jp.role_id = 8
        AND s.skill_name IN
        ('Python', 'SQL', 'Machine Learning',
         'Scikit-learn', 'TensorFlow',
         'Deep Learning', 'Git', 'AWS')
    )

    OR

    -- Machine Learning Intern
    (
        jp.role_id = 9
        AND s.skill_name IN
        ('Python', 'NumPy', 'Pandas',
         'Statistics', 'Machine Learning',
         'Scikit-learn')
    )

    OR

    -- Data Analyst Intern
    (
        jp.role_id = 10
        AND s.skill_name IN
        ('Python', 'SQL', 'Excel',
         'Pandas', 'Statistics',
         'Data Visualization')
    )

    OR

    -- Business Analyst Intern
    (
        jp.role_id = 11
        AND s.skill_name IN
        ('Excel', 'SQL', 'Power BI',
         'Business Intelligence',
         'Requirements Analysis',
         'Communication')
    )

    OR

    -- Software Developer
    (
        jp.role_id = 12
        AND s.skill_name IN
        ('Python', 'SQL', 'Git',
         'GitHub', 'Problem Solving')
    )

    OR

    -- Software Engineer
    (
        jp.role_id = 13
        AND s.skill_name IN
        ('Python', 'SQL', 'Git',
         'GitHub', 'Problem Solving',
         'AWS')
    )

    OR

    -- Product Analyst
    (
        jp.role_id = 14
        AND s.skill_name IN
        ('SQL', 'Excel', 'Python',
         'Statistics', 'Data Visualization',
         'Business Intelligence', 'Communication')
    )

    OR

    -- Financial Analyst
    (
        jp.role_id = 15
        AND s.skill_name IN
        ('Excel', 'SQL', 'Financial Analysis',
         'Statistics', 'Power BI',
         'Communication')
    )

    OR

    -- Marketing Analyst
    (
        jp.role_id = 16
        AND s.skill_name IN
        ('Excel', 'SQL', 'Python',
         'Statistics', 'Market Research',
         'Data Visualization', 'Communication')
    )

    OR

    -- Operations Analyst
    (
        jp.role_id = 17
        AND s.skill_name IN
        ('Excel', 'SQL', 'Power BI',
         'Data Visualization', 'Problem Solving',
         'Communication')
    )

    OR

    -- Risk Analyst
    (
        jp.role_id = 18
        AND s.skill_name IN
        ('SQL', 'Excel', 'Python',
         'Statistics', 'Financial Analysis',
         'Critical Thinking')
    )

    OR

    -- Research Analyst
    (
        jp.role_id = 19
        AND s.skill_name IN
        ('Python', 'SQL', 'Excel',
         'Statistics', 'Research',
         'Critical Thinking')
    )

    OR

    -- BI Developer
    (
        jp.role_id = 20
        AND s.skill_name IN
        ('SQL', 'Power BI', 'DAX',
         'Data Modeling', 'ETL',
         'Data Warehousing', 'Excel')
    );
    
    SELECT COUNT(*) AS total_job_skill_records FROM job_skills;
    
    SELECT
    jp.job_id,
    jp.job_title,
    s.skill_name
    FROM  job_skills js
    JOIN job_postings jp
    ON js.job_id = jp.job_id
    JOIN skills s
    ON js.skill_id = s.skill_id LIMIT 20;
    
    USE job_market_intelligence;

-- =========================================
-- CANDIDATES
-- =========================================

INSERT INTO candidates
(candidate_name, education, experience_years)
VALUES
('Aarav Sharma', 'BSc Data Science', 0.5),
('Ananya Patil', 'BSc Computer Science', 1.0),
('Rohan Kulkarni', 'BTech Computer Engineering', 2.0),
('Sneha Joshi', 'BSc Statistics', 0.0),
('Aditya Deshmukh', 'BCA', 1.5),
('Priya Mehta', 'BSc Data Science', 0.8),
('Rahul Shah', 'BTech Information Technology', 3.0),
('Neha More', 'BSc Mathematics', 0.5),
('Omkar Jadhav', 'BCA', 1.0),
('Isha Verma', 'BSc Data Analytics', 0.0),
('Kunal Singh', 'BTech Computer Science', 2.5),
('Pooja Nair', 'BSc Statistics', 1.0),
('Akash Pawar', 'BSc Data Science', 0.5),
('Simran Kaur', 'BBA Business Analytics', 1.5),
('Vivek Joshi', 'BTech Information Technology', 2.0),
('Kavya Kulkarni', 'BSc Data Science', 0.0),
('Siddharth Patil', 'BCA', 1.0),
('Tanvi Shah', 'BSc Computer Science', 0.5),
('Harsh Mehta', 'BTech Computer Engineering', 3.5),
('Riya Desai', 'BSc Data Analytics', 1.0),
('Yash Thakur', 'BSc Data Science', 0.0),
('Aditi Joshi', 'BBA Business Analytics', 2.0),
('Nikhil More', 'BTech Information Technology', 1.5),
('Mitali Patil', 'BSc Statistics', 0.5),
('Saurabh Kulkarni', 'BCA', 2.0),
('Shruti Sharma', 'BSc Data Science', 1.0),
('Manav Shah', 'BTech Computer Science', 2.5),
('Rutuja Deshmukh', 'BSc Mathematics', 0.0),
('Aman Verma', 'BSc Data Analytics', 1.5),
('Sakshi Nair', 'BSc Computer Science', 0.5),
('Pranav Joshi', 'BTech Information Technology', 3.0),
('Meera Patil', 'BSc Data Science', 1.0),
('Abhishek More', 'BCA', 2.0),
('Diya Shah', 'BBA Business Analytics', 0.5),
('Tejas Kulkarni', 'BTech Computer Engineering', 1.5),
('Nandini Desai', 'BSc Statistics', 0.0),
('Vishal Patil', 'BSc Data Science', 2.0),
('Pallavi Joshi', 'BSc Computer Science', 1.0),
('Arjun Mehta', 'BTech Information Technology', 3.0),
('Shreya Sharma', 'BSc Data Analytics', 0.5),
('Ritesh Shah', 'BCA', 1.5),
('Ayesha Khan', 'BSc Data Science', 0.0),
('Sahil Verma', 'BTech Computer Science', 2.0),
('Komal Nair', 'BSc Statistics', 1.0),
('Deepak More', 'BSc Mathematics', 2.5),
('Priti Patil', 'BSc Data Science', 0.5),
('Raj Deshmukh', 'BTech Information Technology', 1.0),
('Vaishnavi Joshi', 'BSc Computer Science', 0.0),
('Mohit Kulkarni', 'BCA', 2.0),
('Gauri Shah', 'BSc Data Analytics', 1.0);

SELECT COUNT(*) AS total_candidates FROM candidates;

SELECT * FROM candidates LIMIT 10;

USE job_market_intelligence;

USE job_market_intelligence;

-- =========================================
--  CANDIDATE SKILLS
-- =========================================

INSERT IGNORE INTO candidate_skills (candidate_id, skill_id)
SELECT c.candidate_id, s.skill_id
FROM candidates c
JOIN skills s
WHERE
    (
        c.candidate_id IN (1,6,13,21,26,32,37,42,46)
        AND s.skill_name IN ('Python','SQL','Excel','Pandas','NumPy','Statistics')
    )
    OR
    (
        c.candidate_id IN (2,14,20,22,34,38,40,48)
        AND s.skill_name IN ('SQL','Excel','Power BI','Communication','Business Intelligence')
    )
    OR
    (
        c.candidate_id IN (3,11,15,19,27,31,35,39,43,47)
        AND s.skill_name IN ('Python','SQL','Git','GitHub','Problem Solving','AWS')
    )
    OR
    (
        c.candidate_id IN (4,12,24,36,44)
        AND s.skill_name IN ('Statistics','Python','SQL','Excel','Critical Thinking')
    )
    OR
    (
        c.candidate_id IN (5,9,17,25,33,41,49)
        AND s.skill_name IN ('Python','SQL','Git','GitHub','Problem Solving')
    )
    OR
    (
        c.candidate_id IN (7,23,29,45)
        AND s.skill_name IN ('SQL','Python','Excel','Power BI','Data Visualization','Statistics')
    )
    OR
    (
        c.candidate_id IN (8,28)
        AND s.skill_name IN ('Excel','SQL','Statistics','Critical Thinking')
    )
    OR
    (
        c.candidate_id IN (10,18,30,40,50)
        AND s.skill_name IN ('Python','SQL','Excel','Pandas','Matplotlib','Data Visualization')
    );
    
    USE job_market_intelligence;
    
    SELECT COUNT(*) AS
    total_candidates_skills FROM candidate_skills;
    
    SELECT c.candidate_id,
    c.candidate_name,
    s.skill_name
    FROM candidate_skills cs
    JOIN candidates c
    ON cs.candidate_id = c.candidate_id
    JOIN skills s 
    ON cs.skill_id = s.skill_id
    ORDER BY c.candidate_id
    LIMIT 30;

USE job_market_intelligence;

-- =========================================
-- APPLICATIONS
-- =========================================


INSERT INTO applications
(candidate_id, job_id, application_date, application_status)

SELECT
    ((n - 1) MOD 50) + 1 AS candidate_id,
    ((n - 1) MOD 500) + 1 AS job_id,
    DATE_ADD('2026-03-01', INTERVAL (n MOD 180) DAY) AS application_date,

    CASE
        WHEN n MOD 10 IN (0, 1) THEN 'Selected'
        WHEN n MOD 10 IN (2, 3) THEN 'Interview'
        WHEN n MOD 10 IN (4, 5, 6) THEN 'Applied'
        WHEN n MOD 10 = 7 THEN 'Rejected'
        ELSE 'Under Review'
    END AS application_status

FROM
(
    SELECT
        ones.n
        + tens.n * 10
        + hundreds.n * 100
        + 1 AS n

    FROM
    (
        SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2
        UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
        UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8
        UNION ALL SELECT 9
    ) ones

    CROSS JOIN
    (
        SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2
        UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
        UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8
        UNION ALL SELECT 9
    ) tens

    CROSS JOIN
    (
        SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2
        UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
        UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8
        UNION ALL SELECT 9
    ) hundreds
) numbers

WHERE n <= 500;

SELECT COUNT(*) AS total_apllications FROM applications;

SELECT application_status, COUNT(*) AS total_applications FROM applications GROUP BY application_status;

USE job_market_intelligence;

-- ============================================
-- INTERVIEWS
-- ============================================

INSERT INTO interviews
(application_id, interview_date, interview_round, result)
VALUES
(1, '2026-01-10', 'HR Round', 'Selected'),
(2, '2026-01-12', 'Technical Round', 'Selected'),
(3, '2026-01-15', 'HR Round', 'Rejected'),
(4, '2026-01-18', 'Technical Round', 'Selected'),
(5, '2026-01-20', 'Managerial Round', 'Selected'),
(6, '2026-01-22', 'HR Round', 'Rejected'),
(7, '2026-01-25', 'Technical Round', 'Selected'),
(8, '2026-01-28', 'HR Round', 'Selected'),
(9, '2026-02-02', 'Technical Round', 'Rejected'),
(10, '2026-02-05', 'Managerial Round', 'Selected'),
(11, '2026-02-08', 'HR Round', 'Rejected'),
(12, '2026-02-10', 'Technical Round', 'Selected'),
(13, '2026-02-12', 'HR Round', 'Selected'),
(14, '2026-02-15', 'Technical Round', 'Rejected'),
(15, '2026-02-18', 'Managerial Round', 'Selected'),
(16, '2026-02-20', 'HR Round', 'Rejected'),
(17, '2026-02-22', 'Technical Round', 'Selected'),
(18, '2026-02-25', 'HR Round', 'Selected'),
(19, '2026-02-28', 'Technical Round', 'Rejected'),
(20, '2026-03-02', 'Managerial Round', 'Selected'),
(21, '2026-03-05', 'HR Round', 'Selected'),
(22, '2026-03-08', 'Technical Round', 'Rejected'),
(23, '2026-03-10', 'HR Round', 'Selected'),
(24, '2026-03-12', 'Technical Round', 'Selected'),
(25, '2026-03-15', 'Managerial Round', 'Rejected'),
(26, '2026-03-18', 'HR Round', 'Selected'),
(27, '2026-03-20', 'Technical Round', 'Rejected'),
(28, '2026-03-22', 'HR Round', 'Selected'),
(29, '2026-03-25', 'Technical Round', 'Selected'),
(30, '2026-03-28', 'Managerial Round', 'Rejected');


SELECT COUNT(*) AS total_interviews
FROM interviews;

SELECT *
FROM interviews;

SELECT * FROM interviews ORDER BY interview_id;

SELECT application_status,
COUNT(*) AS 
total_applications
FROM applications
GROUP BY application_status
ORDER BY total_applications
DESC;


SELECT
    job_id,
    COUNT(*) AS total_applications
FROM applications
GROUP BY job_id
ORDER BY total_applications DESC;

SELECT
    jr.role_name,
    COUNT(jp.job_id) AS total_job_postings
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
GROUP BY jr.role_name
ORDER BY total_job_postings DESC;

SELECT
    i.industry_name,
    COUNT(jp.job_id) AS total_job_postings
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN industries i
    ON jr.industry_id = i.industry_id
GROUP BY i.industry_name
ORDER BY total_job_postings DESC;

DESCRIBE job_roles;

DESCRIBE job_postings;

SELECT
    i.industry_name,
    COUNT(jp.job_id) AS total_job_postings
FROM job_postings jp
JOIN companies c
    ON jp.company_id = c.company_id
JOIN industries i
    ON c.industry_id = i.industry_id
GROUP BY i.industry_name
ORDER BY total_job_postings DESC;

SELECT
    l.city,
    COUNT(jp.job_id) AS total_job_postings
FROM job_postings jp
JOIN locations l
    ON jp.location_id = l.location_id
GROUP BY l.city
ORDER BY total_job_postings DESC;

SELECT
    work_mode,
    COUNT(*) AS total_jobs
FROM job_postings
GROUP BY work_mode
ORDER BY total_jobs DESC;

SELECT
    experience_required,
    COUNT(*) AS total_jobs
FROM job_postings
GROUP BY experience_required
ORDER BY total_jobs DESC;

SELECT
    jobtitle,
    COUNT(*) AS total_jobs,
    ROUND(AVG(salaraymin), 2) AS average_min_salary,
    ROUND(AVG(salarymax), 2) AS average_max_salary
FROM job_postings
GROUP BY jobtitle
ORDER BY average_max_salary DESC;

SELECT * FROM job_postings LIMIT 1;



SELECT
    `job_title`,
    COUNT(*) AS total_jobs,
    ROUND(AVG(`salary_min`), 2) AS average_min_salary,
    ROUND(AVG(`salary_max`), 2) AS average_max_salary
FROM `job_postings`
GROUP BY `job_title`
ORDER BY average_max_salary DESC;

SHOW CREATE TABLE job_postings;

SELECT
    AVG(salary_min) AS average_min_salary,
    AVG(salary_max) AS average_max_salary
FROM job_postings;



SELECT
    work_mode,
    COUNT(*) AS total_jobs,
    ROUND(AVG(salary_min), 2) AS average_min_salary,
    ROUND(AVG(salary_max), 2) AS average_max_salary
FROM job_postings
GROUP BY work_mode
ORDER BY average_max_salary DESC;

USE job_market_intelligence;

SELECT
    s.skill_name,
    COUNT(js.job_id) AS total_jobs
FROM job_skills js
JOIN skills s
    ON js.skill_id = s.skill_id
GROUP BY s.skill_name
ORDER BY total_jobs DESC;

USE job_market_intelligence;

SELECT
    jr.role_name,
    s.skill_name,
    COUNT(js.job_id) AS demand_count
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
ORDER BY
    jr.role_name,
    demand_count DESC;
    
    USE job_market_intelligence;

SELECT
    s.skill_name,
    COUNT(js.job_id) AS demand_count
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN job_skills js
    ON jp.job_id = js.job_id
JOIN skills s
    ON js.skill_id = s.skill_id
WHERE LOWER(jr.role_name) LIKE '%data analyst%'
GROUP BY s.skill_name
ORDER BY demand_count DESC;

USE job_market_intelligence;

SELECT
    s.skill_name,
    COUNT(js.job_id) AS demand_count
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN job_skills js
    ON jp.job_id = js.job_id
JOIN skills s
    ON js.skill_id = s.skill_id
WHERE LOWER(jr.role_name) LIKE '%business analyst%'
GROUP BY s.skill_name
ORDER BY demand_count DESC;

USE job_market_intelligence;

-- =====================================================
-- 01. APPLICATION STATUS ANALYSIS
-- =====================================================

SELECT
    application_status,
    COUNT(*) AS total_applications
FROM applications
GROUP BY application_status
ORDER BY total_applications DESC;


-- =====================================================
-- 02. APPLICATIONS BY JOB
-- =====================================================

SELECT
    job_id,
    COUNT(*) AS total_applications
FROM applications
GROUP BY job_id
ORDER BY total_applications DESC;


-- =====================================================
-- 03. JOB ROLE DEMAND
-- =====================================================

SELECT
    jr.role_name,
    COUNT(jp.job_id) AS total_job_postings
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
GROUP BY jr.role_name
ORDER BY total_job_postings DESC;


-- =====================================================
-- 04. INDUSTRY-WISE JOB DEMAND
-- =====================================================

SELECT
    i.industry_name,
    COUNT(jp.job_id) AS total_job_postings
FROM job_postings jp
JOIN companies c
    ON jp.company_id = c.company_id
JOIN industries i
    ON c.industry_id = i.industry_id
GROUP BY i.industry_name
ORDER BY total_job_postings DESC;


-- =====================================================
-- 05. LOCATION-WISE JOB DEMAND
-- =====================================================

SELECT
    l.city,
    COUNT(jp.job_id) AS total_job_postings
FROM job_postings jp
JOIN locations l
    ON jp.location_id = l.location_id
GROUP BY l.city
ORDER BY total_job_postings DESC;


-- =====================================================
-- 06. WORK MODE ANALYSIS
-- =====================================================

SELECT
    workmode,
    COUNT(*) AS total_jobs
FROM job_postings
GROUP BY workmode
ORDER BY total_jobs DESC;


-- =====================================================
-- 07. EXPERIENCE REQUIREMENT ANALYSIS
-- =====================================================

SELECT
    experience_required,
    COUNT(*) AS total_jobs
FROM job_postings
GROUP BY experience_required
ORDER BY total_jobs DESC;


-- =====================================================
-- 08. OVERALL AVERAGE SALARY
-- =====================================================

SELECT
    ROUND(AVG(salarymin), 2) AS average_min_salary,
    ROUND(AVG(salarymax), 2) AS average_max_salary
FROM job_postings;


-- =====================================================
-- 09. SALARY BY WORK MODE
-- =====================================================

SELECT
    workmode,
    COUNT(*) AS total_jobs,
    ROUND(AVG(salarymin), 2) AS average_min_salary,
    ROUND(AVG(salarymax), 2) AS average_max_salary
FROM job_postings
GROUP BY workmode
ORDER BY average_max_salary DESC;


-- =====================================================
-- 10. OVERALL SKILL DEMAND
-- =====================================================

SELECT
    s.skill_name,
    COUNT(js.job_id) AS total_jobs
FROM job_skills js
JOIN skills s
    ON js.skill_id = s.skill_id
GROUP BY s.skill_name
ORDER BY total_jobs DESC;


-- =====================================================
-- 11. ROLE-WISE SKILL DEMAND
-- =====================================================

SELECT
    jr.role_name,
    s.skill_name,
    COUNT(js.job_id) AS demand_count
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
ORDER BY
    jr.role_name,
    demand_count DESC;


-- =====================================================
-- 12. DATA ANALYST SKILL DEMAND
-- =====================================================

SELECT
    s.skill_name,
    COUNT(js.job_id) AS demand_count
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN job_skills js
    ON jp.job_id = js.job_id
JOIN skills s
    ON js.skill_id = s.skill_id
WHERE LOWER(jr.role_name) LIKE '%data analyst%'
GROUP BY s.skill_name
ORDER BY demand_count DESC;


-- =====================================================
-- 13. BUSINESS ANALYST SKILL DEMAND
-- =====================================================

SELECT
    s.skill_name,
    COUNT(js.job_id) AS demand_count
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN job_skills js
    ON jp.job_id = js.job_id
JOIN skills s
    ON js.skill_id = s.skill_id
WHERE LOWER(jr.role_name) LIKE '%business analyst%'
GROUP BY s.skill_name
ORDER BY demand_count DESC;


-- =====================================================
-- 14. INTERVIEW RESULT ANALYSIS
-- =====================================================

SELECT
    result,
    COUNT(*) AS total_interviews
FROM interviews
GROUP BY result
ORDER BY total_interviews DESC;


-- =====================================================
-- 15. INTERVIEW ROUND ANALYSIS
-- =====================================================

SELECT
    interview_round,
    COUNT(*) AS total_interviews
FROM interviews
GROUP BY interview_round
ORDER BY total_interviews DESC;


-- =====================================================
-- 16. APPLICATION → INTERVIEW ANALYSIS
-- =====================================================

SELECT
    COUNT(DISTINCT a.application_id) AS total_applications,
    COUNT(DISTINCT i.interview_id) AS total_interviews
FROM applications a
LEFT JOIN interviews i
    ON a.application_id = i.application_id;


-- =====================================================
-- 17. INTERVIEW CONVERSION RATE
-- =====================================================

SELECT
    ROUND(
        COUNT(DISTINCT i.interview_id)
        * 100.0
        / COUNT(DISTINCT a.application_id),
        2
    ) AS application_to_interview_percentage
FROM applications a
LEFT JOIN interviews i
    ON a.application_id = i.application_id;


-- =====================================================
-- 18. JOB POSTINGS BY JOB TYPE
-- =====================================================

SELECT
    job_type,
    COUNT(*) AS total_jobs
FROM job_postings
GROUP BY job_type
ORDER BY total_jobs DESC;


-- =====================================================
-- 19. MONTHLY JOB POSTINGS
-- =====================================================

SELECT
    YEAR(posted_date) AS posting_year,
    MONTH(posted_date) AS posting_month,
    COUNT(*) AS total_jobs
FROM job_postings
GROUP BY
    YEAR(posted_date),
    MONTH(posted_date)
ORDER BY
    posting_year,
    posting_month;


-- =====================================================
-- 20. COMPANY-WISE JOB POSTINGS
-- =====================================================

SELECT
    c.company_name,
    COUNT(jp.job_id) AS total_job_postings
FROM companies c
JOIN job_postings jp
    ON c.company_id = jp.company_id
GROUP BY c.company_name
ORDER BY total_job_postings DESC;


-- =====================================================
-- 21. TOP COMPANIES BY JOB POSTINGS
-- =====================================================

SELECT
    c.company_name,
    COUNT(jp.job_id) AS total_job_postings
FROM companies c
JOIN job_postings jp
    ON c.company_id = jp.company_id
GROUP BY c.company_name
ORDER BY total_job_postings DESC
LIMIT 10;


-- =====================================================
-- 22. JOB SKILLS COUNT PER JOB
-- =====================================================

SELECT
    job_id,
    COUNT(skill_id) AS required_skill_count
FROM job_skills
GROUP BY job_id
ORDER BY required_skill_count DESC;


-- =====================================================
-- 23. JOBS REQUIRING MANY SKILLS
-- =====================================================

SELECT
    job_id,
    COUNT(skill_id) AS required_skill_count
FROM job_skills
GROUP BY job_id
HAVING COUNT(skill_id) >= 5
ORDER BY required_skill_count DESC;


-- =====================================================
-- 24. TOP 10 MOST DEMANDED SKILLS
-- =====================================================

SELECT
    s.skill_name,
    COUNT(js.job_id) AS demand_count
FROM job_skills js
JOIN skills s
    ON js.skill_id = s.skill_id
GROUP BY s.skill_name
ORDER BY demand_count DESC
LIMIT 10;

USE job_market_intelligence;

SELECT
    c.candidate_id,
    c.candidate_name,
    s.skill_name
FROM candidate_skills cs
JOIN candidates c
    ON cs.candidate_id = c.candidate_id
JOIN skills s
    ON cs.skill_id = s.skill_id
WHERE c.candidate_id = 1
ORDER BY s.skill_name;

USE job_market_intelligence;

SELECT DISTINCT
    jr.role_name,
    s.skill_name
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN job_skills js
    ON jp.job_id = js.job_id
JOIN skills s
    ON js.skill_id = s.skill_id
WHERE LOWER(jr.role_name) LIKE '%data analyst%'
ORDER BY s.skill_name;

USE job_market_intelligence;

-- =====================================================
-- 25. CANDIDATE SKILLS
-- =====================================================

SELECT
    c.candidate_id,
    c.candidate_name,
    s.skill_name
FROM candidate_skills cs
JOIN candidates c
    ON cs.candidate_id = c.candidate_id
JOIN skills s
    ON cs.skill_id = s.skill_id
WHERE c.candidate_id = 1
ORDER BY s.skill_name;


-- =====================================================
-- 26. DATA ANALYST REQUIRED SKILLS
-- =====================================================

SELECT DISTINCT
    jr.role_name,
    s.skill_name
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN job_skills js
    ON jp.job_id = js.job_id
JOIN skills s
    ON js.skill_id = s.skill_id
WHERE LOWER(jr.role_name) LIKE '%data analyst%'
ORDER BY s.skill_name;


-- =====================================================
-- 27. MATCHED SKILLS FOR CANDIDATE 1
-- =====================================================

SELECT DISTINCT
    s.skill_name AS matched_skill
FROM candidate_skills cs
JOIN skills s
    ON cs.skill_id = s.skill_id
WHERE cs.candidate_id = 1
AND s.skill_id IN (
    SELECT DISTINCT js.skill_id
    FROM job_postings jp
    JOIN job_roles jr
        ON jp.role_id = jr.role_id
    JOIN job_skills js
        ON jp.job_id = js.job_id
    WHERE LOWER(jr.role_name) LIKE '%data analyst%'
);


-- =====================================================
-- 28. MISSING SKILLS FOR CANDIDATE 1
-- =====================================================

SELECT DISTINCT
    s.skill_name AS missing_skill
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN job_skills js
    ON jp.job_id = js.job_id
JOIN skills s
    ON js.skill_id = s.skill_id
WHERE LOWER(jr.role_name) LIKE '%data analyst%'
AND js.skill_id NOT IN (
    SELECT skill_id
    FROM candidate_skills
    WHERE candidate_id = 1
)
ORDER BY s.skill_name;


-- =====================================================
-- 29. TOTAL REQUIRED SKILLS FOR DATA ANALYST
-- =====================================================

SELECT
    COUNT(DISTINCT js.skill_id) AS total_required_skills
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN job_skills js
    ON jp.job_id = js.job_id
WHERE LOWER(jr.role_name) LIKE '%data analyst%';


-- =====================================================
-- 30. MATCHED SKILL COUNT FOR CANDIDATE 1
-- =====================================================

SELECT
    COUNT(DISTINCT js.skill_id) AS matched_skills
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN job_skills js
    ON jp.job_id = js.job_id
WHERE LOWER(jr.role_name) LIKE '%data analyst%'
AND js.skill_id IN (
    SELECT skill_id
    FROM candidate_skills
    WHERE candidate_id = 1
);


-- =====================================================
-- 31. SKILL MATCH PERCENTAGE
-- =====================================================

SELECT
    ROUND(
        COUNT(DISTINCT CASE
            WHEN cs.skill_id IS NOT NULL THEN js.skill_id
        END) * 100.0
        / COUNT(DISTINCT js.skill_id),
        2
    ) AS skill_match_percentage
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN job_skills js
    ON jp.job_id = js.job_id
LEFT JOIN candidate_skills cs
    ON cs.skill_id = js.skill_id
    AND cs.candidate_id = 1
WHERE LOWER(jr.role_name) LIKE '%data analyst%';


-- =====================================================
-- 32. CANDIDATE SKILL COUNT
-- =====================================================

SELECT
    c.candidate_id,
    c.candidate_name,
    COUNT(cs.skill_id) AS total_skills
FROM candidates c
LEFT JOIN candidate_skills cs
    ON c.candidate_id = cs.candidate_id
GROUP BY
    c.candidate_id,
    c.candidate_name
ORDER BY total_skills DESC;


-- =====================================================
-- 33. MOST COMMON SKILLS AMONG CANDIDATES
-- =====================================================

SELECT
    s.skill_name,
    COUNT(cs.candidate_id) AS candidate_count
FROM candidate_skills cs
JOIN skills s
    ON cs.skill_id = s.skill_id
GROUP BY s.skill_name
ORDER BY candidate_count DESC;


-- =====================================================
-- 34. MARKET DEMAND VS CANDIDATE AVAILABILITY
-- =====================================================

SELECT
    s.skill_name,
    COUNT(DISTINCT js.job_id) AS job_demand,
    COUNT(DISTINCT cs.candidate_id) AS candidate_count
FROM skills s
LEFT JOIN job_skills js
    ON s.skill_id = js.skill_id
LEFT JOIN candidate_skills cs
    ON s.skill_id = cs.skill_id
GROUP BY s.skill_id, s.skill_name
ORDER BY job_demand DESC;


-- =====================================================
-- 35. SKILL GAP PRIORITY
-- =====================================================

SELECT
    s.skill_name,
    COUNT(DISTINCT js.job_id) AS job_demand,
    COUNT(DISTINCT cs.candidate_id) AS candidate_count,
    (
        COUNT(DISTINCT js.job_id)
        - COUNT(DISTINCT cs.candidate_id)
    ) AS demand_gap
FROM skills s
LEFT JOIN job_skills js
    ON s.skill_id = js.skill_id
LEFT JOIN candidate_skills cs
    ON s.skill_id = cs.skill_id
GROUP BY s.skill_id, s.skill_name
ORDER BY demand_gap DESC;


-- =====================================================
-- 36. JOB MATCHING — CANDIDATE 1
-- =====================================================

SELECT
    jp.job_id,
    jp.jobtitle,
    COUNT(DISTINCT CASE
        WHEN cs.skill_id IS NOT NULL
        THEN js.skill_id
    END) AS matched_skills,
    COUNT(DISTINCT js.skill_id) AS required_skills,
    ROUND(
        COUNT(DISTINCT CASE
            WHEN cs.skill_id IS NOT NULL
            THEN js.skill_id
        END) * 100.0
        / COUNT(DISTINCT js.skill_id),
        2
    ) AS skill_match_percentage
FROM job_postings jp
JOIN job_skills js
    ON jp.job_id = js.job_id
LEFT JOIN candidate_skills cs
    ON js.skill_id = cs.skill_id
    AND cs.candidate_id = 1
GROUP BY jp.job_id, jp.jobtitle
ORDER BY skill_match_percentage DESC;


-- =====================================================
-- 37. TOP JOB MATCHES FOR CANDIDATE 1
-- =====================================================

SELECT
    jp.job_id,
    jp.jobtitle,
    COUNT(DISTINCT CASE
        WHEN cs.skill_id IS NOT NULL
        THEN js.skill_id
    END) AS matched_skills,
    COUNT(DISTINCT js.skill_id) AS required_skills,
    ROUND(
        COUNT(DISTINCT CASE
            WHEN cs.skill_id IS NOT NULL
            THEN js.skill_id
        END) * 100.0
        / COUNT(DISTINCT js.skill_id),
        2
    ) AS skill_match_percentage
FROM job_postings jp
JOIN job_skills js
    ON jp.job_id = js.job_id
LEFT JOIN candidate_skills cs
    ON js.skill_id = cs.skill_id
    AND cs.candidate_id = 1
GROUP BY jp.job_id, jp.jobtitle
HAVING skill_match_percentage >= 50
ORDER BY skill_match_percentage DESC
LIMIT 10;


-- =====================================================
-- 38. JOBS WITH HIGHEST SALARY
-- =====================================================

SELECT
    job_id,
    jobtitle,
    salarymin,
    salarymax
FROM job_postings
ORDER BY salarymax DESC
LIMIT 10;


-- =====================================================
-- 39. JOB TYPE DISTRIBUTION
-- =====================================================

SELECT
    jobtype,
    COUNT(*) AS total_jobs
FROM job_postings
GROUP BY jobtype
ORDER BY total_jobs DESC;


-- =====================================================
-- 40. JOB POSTINGS BY MONTH
-- =====================================================

SELECT
    MONTH(posteddate) AS posting_month,
    COUNT(*) AS total_jobs
FROM job_postings
GROUP BY MONTH(posteddate)
ORDER BY posting_month;


-- =====================================================
-- 41. INTERVIEW RESULTS
-- =====================================================

SELECT
    result,
    COUNT(*) AS total_interviews
FROM interviews
GROUP BY result
ORDER BY total_interviews DESC;


-- =====================================================
-- 42. INTERVIEW ROUND ANALYSIS
-- =====================================================

SELECT
    interview_round,
    COUNT(*) AS total_interviews
FROM interviews
GROUP BY interview_round
ORDER BY total_interviews DESC;


-- =====================================================
-- 43. APPLICATION TO INTERVIEW RATE
-- =====================================================

SELECT
    COUNT(DISTINCT i.application_id) AS interviewed_applications,
    COUNT(DISTINCT a.application_id) AS total_applications,
    ROUND(
        COUNT(DISTINCT i.application_id) * 100.0
        / COUNT(DISTINCT a.application_id),
        2
    ) AS application_to_interview_rate
FROM applications a
LEFT JOIN interviews i
    ON a.application_id = i.application_id;


-- =====================================================
-- 44. OVERALL PROJECT SUMMARY
-- =====================================================

SELECT
    (SELECT COUNT(*) FROM companies) AS total_companies,
    (SELECT COUNT(*) FROM job_postings) AS total_jobs,
    (SELECT COUNT(*) FROM skills) AS total_skills,
    (SELECT COUNT(*) FROM candidates) AS total_candidates,
    (SELECT COUNT(*) FROM applications) AS total_applications,
    (SELECT COUNT(*) FROM interviews) AS total_interviews;
    
    USE job_market_intelligence;

SELECT DISTINCT
    s.skill_name AS matched_skill
FROM candidate_skills cs
JOIN skills s
    ON cs.skill_id = s.skill_id
WHERE cs.candidate_id = 1
AND s.skill_id IN (
    SELECT DISTINCT js.skill_id
    FROM job_postings jp
    JOIN job_roles jr
        ON jp.role_id = jr.role_id
    JOIN job_skills js
        ON jp.job_id = js.job_id
    WHERE LOWER(jr.role_name) LIKE '%data analyst%'
)
ORDER BY s.skill_name;

USE job_market_intelligence;

-- =====================================================
-- 28. MISSING SKILLS FOR CANDIDATE 1
-- =====================================================

SELECT DISTINCT
    s.skill_name AS missing_skill
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN job_skills js
    ON jp.job_id = js.job_id
JOIN skills s
    ON js.skill_id = s.skill_id
WHERE LOWER(jr.role_name) LIKE '%data analyst%'
AND js.skill_id NOT IN (
    SELECT skill_id
    FROM candidate_skills
    WHERE candidate_id = 1
)
ORDER BY s.skill_name;


-- =====================================================
-- 29. TOTAL REQUIRED SKILLS FOR DATA ANALYST
-- =====================================================

SELECT
    COUNT(DISTINCT js.skill_id) AS total_required_skills
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN job_skills js
    ON jp.job_id = js.job_id
WHERE LOWER(jr.role_name) LIKE '%data analyst%';


-- =====================================================
-- 30. MATCHED SKILL COUNT FOR CANDIDATE 1
-- =====================================================

SELECT
    COUNT(DISTINCT js.skill_id) AS matched_skills
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN job_skills js
    ON jp.job_id = js.job_id
WHERE LOWER(jr.role_name) LIKE '%data analyst%'
AND js.skill_id IN (
    SELECT skill_id
    FROM candidate_skills
    WHERE candidate_id = 1
);


-- =====================================================
-- 31. SKILL MATCH PERCENTAGE
-- =====================================================

SELECT
    ROUND(
        COUNT(DISTINCT CASE
            WHEN cs.skill_id IS NOT NULL THEN js.skill_id
        END) * 100.0
        / COUNT(DISTINCT js.skill_id),
        2
    ) AS skill_match_percentage
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN job_skills js
    ON jp.job_id = js.job_id
LEFT JOIN candidate_skills cs
    ON cs.skill_id = js.skill_id
    AND cs.candidate_id = 1
WHERE LOWER(jr.role_name) LIKE '%data analyst%';


-- =====================================================
-- 32. CANDIDATE SKILL COUNT
-- =====================================================

SELECT
    c.candidate_id,
    c.candidate_name,
    COUNT(cs.skill_id) AS total_skills
FROM candidates c
LEFT JOIN candidate_skills cs
    ON c.candidate_id = cs.candidate_id
GROUP BY
    c.candidate_id,
    c.candidate_name
ORDER BY total_skills DESC;


-- =====================================================
-- 33. MOST COMMON SKILLS AMONG CANDIDATES
-- =====================================================

SELECT
    s.skill_name,
    COUNT(cs.candidate_id) AS candidate_count
FROM candidate_skills cs
JOIN skills s
    ON cs.skill_id = s.skill_id
GROUP BY s.skill_name
ORDER BY candidate_count DESC;


-- =====================================================
-- 34. MARKET DEMAND VS CANDIDATE AVAILABILITY
-- =====================================================

SELECT
    s.skill_name,
    COUNT(DISTINCT js.job_id) AS job_demand,
    COUNT(DISTINCT cs.candidate_id) AS candidate_count
FROM skills s
LEFT JOIN job_skills js
    ON s.skill_id = js.skill_id
LEFT JOIN candidate_skills cs
    ON s.skill_id = cs.skill_id
GROUP BY s.skill_id, s.skill_name
ORDER BY job_demand DESC;


-- =====================================================
-- 35. SKILL GAP PRIORITY
-- =====================================================

SELECT
    s.skill_name,
    COUNT(DISTINCT js.job_id) AS job_demand,
    COUNT(DISTINCT cs.candidate_id) AS candidate_count,
    COUNT(DISTINCT js.job_id)
      - COUNT(DISTINCT cs.candidate_id) AS demand_gap
FROM skills s
LEFT JOIN job_skills js
    ON s.skill_id = js.skill_id
LEFT JOIN candidate_skills cs
    ON s.skill_id = cs.skill_id
GROUP BY s.skill_id, s.skill_name
ORDER BY demand_gap DESC;


-- =====================================================
-- 36. JOB SKILL MATCHING FOR CANDIDATE 1
-- =====================================================

SELECT
    jp.job_id,
    jp.jobtitle,
    COUNT(DISTINCT CASE
        WHEN cs.skill_id IS NOT NULL THEN js.skill_id
    END) AS matched_skills,
    COUNT(DISTINCT js.skill_id) AS required_skills,
    ROUND(
        COUNT(DISTINCT CASE
            WHEN cs.skill_id IS NOT NULL THEN js.skill_id
        END) * 100.0
        / COUNT(DISTINCT js.skill_id),
        2
    ) AS skill_match_percentage
FROM job_postings jp
JOIN job_skills js
    ON jp.job_id = js.job_id
LEFT JOIN candidate_skills cs
    ON cs.skill_id = js.skill_id
    AND cs.candidate_id = 1
GROUP BY jp.job_id, jp.jobtitle
ORDER BY skill_match_percentage DESC;


-- =====================================================
-- 37. TOP 10 JOB MATCHES FOR CANDIDATE 1
-- =====================================================

SELECT
    jp.job_id,
    jp.jobtitle,
    COUNT(DISTINCT CASE
        WHEN cs.skill_id IS NOT NULL THEN js.skill_id
    END) AS matched_skills,
    COUNT(DISTINCT js.skill_id) AS required_skills,
    ROUND(
        COUNT(DISTINCT CASE
            WHEN cs.skill_id IS NOT NULL THEN js.skill_id
        END) * 100.0
        / COUNT(DISTINCT js.skill_id),
        2
    ) AS skill_match_percentage
FROM job_postings jp
JOIN job_skills js
    ON jp.job_id = js.job_id
LEFT JOIN candidate_skills cs
    ON cs.skill_id = js.skill_id
    AND cs.candidate_id = 1
GROUP BY jp.job_id, jp.jobtitle
ORDER BY skill_match_percentage DESC
LIMIT 10;

USE job_market_intelligence;

SELECT DISTINCT
    s.skill_name AS missing_skill
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN job_skills js
    ON jp.job_id = js.job_id
JOIN skills s
    ON js.skill_id = s.skill_id
WHERE LOWER(jr.role_name) LIKE '%data analyst%'
AND js.skill_id NOT IN (
    SELECT skill_id
    FROM candidate_skills
    WHERE candidate_id = 1
)
ORDER BY s.skill_name;

USE job_market_intelligence;

-- =====================================================
-- 29. TOTAL REQUIRED SKILLS FOR DATA ANALYST
-- =====================================================

SELECT
    COUNT(DISTINCT js.skill_id) AS total_required_skills
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN job_skills js
    ON jp.job_id = js.job_id
WHERE LOWER(jr.role_name) LIKE '%data analyst%';


-- =====================================================
-- 30. MATCHED SKILL COUNT FOR CANDIDATE 1
-- =====================================================

SELECT
    COUNT(DISTINCT js.skill_id) AS matched_skills
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN job_skills js
    ON jp.job_id = js.job_id
WHERE LOWER(jr.role_name) LIKE '%data analyst%'
AND js.skill_id IN (
    SELECT skill_id
    FROM candidate_skills
    WHERE candidate_id = 1
);


-- =====================================================
-- 31. SKILL MATCH PERCENTAGE
-- =====================================================

SELECT
    ROUND(
        COUNT(DISTINCT CASE
            WHEN cs.skill_id IS NOT NULL THEN js.skill_id
        END) * 100.0
        / COUNT(DISTINCT js.skill_id),
        2
    ) AS skill_match_percentage
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN job_skills js
    ON jp.job_id = js.job_id
LEFT JOIN candidate_skills cs
    ON cs.skill_id = js.skill_id
    AND cs.candidate_id = 1
WHERE LOWER(jr.role_name) LIKE '%data analyst%';


-- =====================================================
-- 32. CANDIDATE SKILL COUNT
-- =====================================================

SELECT
    c.candidate_id,
    c.candidate_name,
    COUNT(cs.skill_id) AS total_skills
FROM candidates c
LEFT JOIN candidate_skills cs
    ON c.candidate_id = cs.candidate_id
GROUP BY
    c.candidate_id,
    c.candidate_name
ORDER BY total_skills DESC;


-- =====================================================
-- 33. MOST COMMON SKILLS AMONG CANDIDATES
-- =====================================================

SELECT
    s.skill_name,
    COUNT(cs.candidate_id) AS candidate_count
FROM candidate_skills cs
JOIN skills s
    ON cs.skill_id = s.skill_id
GROUP BY s.skill_name
ORDER BY candidate_count DESC;


-- =====================================================
-- 34. MARKET DEMAND VS CANDIDATE AVAILABILITY
-- =====================================================

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
ORDER BY job_demand DESC;


-- =====================================================
-- 35. SKILL GAP PRIORITY
-- =====================================================

SELECT
    s.skill_name,
    COUNT(DISTINCT js.job_id) AS job_demand,
    COUNT(DISTINCT cs.candidate_id) AS candidate_count,
    COUNT(DISTINCT js.job_id)
    - COUNT(DISTINCT cs.candidate_id) AS demand_gap
FROM skills s
LEFT JOIN job_skills js
    ON s.skill_id = js.skill_id
LEFT JOIN candidate_skills cs
    ON s.skill_id = cs.skill_id
GROUP BY
    s.skill_id,
    s.skill_name
ORDER BY demand_gap DESC;


-- =====================================================
-- 36. JOB SKILL MATCHING FOR CANDIDATE 1
-- =====================================================

SELECT
    jp.job_id,
    jp.jobtitle,
    COUNT(DISTINCT CASE
        WHEN cs.skill_id IS NOT NULL
        THEN js.skill_id
    END) AS matched_skills,
    COUNT(DISTINCT js.skill_id) AS required_skills,
    ROUND(
        COUNT(DISTINCT CASE
            WHEN cs.skill_id IS NOT NULL
            THEN js.skill_id
        END) * 100.0
        / COUNT(DISTINCT js.skill_id),
        2
    ) AS skill_match_percentage
FROM job_postings jp
JOIN job_skills js
    ON jp.job_id = js.job_id
LEFT JOIN candidate_skills cs
    ON cs.skill_id = js.skill_id
    AND cs.candidate_id = 1
GROUP BY
    jp.job_id,
    jp.jobtitle
ORDER BY skill_match_percentage DESC;


-- =====================================================
-- 37. TOP 10 JOB MATCHES FOR CANDIDATE 1
-- =====================================================

SELECT
    jp.job_id,
    jp.jobtitle,
    COUNT(DISTINCT CASE
        WHEN cs.skill_id IS NOT NULL
        THEN js.skill_id
    END) AS matched_skills,
    COUNT(DISTINCT js.skill_id) AS required_skills,
    ROUND(
        COUNT(DISTINCT CASE
            WHEN cs.skill_id IS NOT NULL
            THEN js.skill_id
        END) * 100.0
        / COUNT(DISTINCT js.skill_id),
        2
    ) AS skill_match_percentage
FROM job_postings jp
JOIN job_skills js
    ON jp.job_id = js.job_id
LEFT JOIN candidate_skills cs
    ON cs.skill_id = js.skill_id
    AND cs.candidate_id = 1
GROUP BY
    jp.job_id,
    jp.jobtitle
ORDER BY skill_match_percentage DESC
LIMIT 10;

USE job_market_intelligence;

SELECT
    job_id,
    job_title,
    salary_min,
    salary_max,
    work_mode
FROM job_postings
ORDER BY salary_max DESC
LIMIT 10;

