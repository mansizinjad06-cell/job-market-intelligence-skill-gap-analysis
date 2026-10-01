USE job_market_intelligence;


-- =========================================
-- 1. INDUSTRIES
-- =========================================

CREATE TABLE industries (
    industry_id INT PRIMARY KEY AUTO_INCREMENT,
    industry_name VARCHAR(100) NOT NULL UNIQUE
);


-- =========================================
-- 2. COMPANIES
-- =========================================

CREATE TABLE companies (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(150) NOT NULL,
    industry_id INT NOT NULL,

    FOREIGN KEY (industry_id)
        REFERENCES industries(industry_id)
);


-- =========================================
-- 3. JOB ROLES
-- =========================================

CREATE TABLE job_roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(100) NOT NULL UNIQUE
);


-- =========================================
-- 4. LOCATIONS
-- =========================================

CREATE TABLE locations (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);


-- =========================================
-- 5. JOB POSTINGS
-- =========================================

CREATE TABLE job_postings (
    job_id INT PRIMARY KEY AUTO_INCREMENT,
    company_id INT NOT NULL,
    role_id INT NOT NULL,
    location_id INT NOT NULL,
    job_title VARCHAR(150) NOT NULL,
    job_type VARCHAR(50) NOT NULL,
    experience_required VARCHAR(50) NOT NULL,
    salary_min DECIMAL(12,2),
    salary_max DECIMAL(12,2),
    work_mode VARCHAR(30) NOT NULL,
    posted_date DATE NOT NULL,
    closing_date DATE,

    FOREIGN KEY (company_id)
        REFERENCES companies(company_id),

    FOREIGN KEY (role_id)
        REFERENCES job_roles(role_id),

    FOREIGN KEY (location_id)
        REFERENCES locations(location_id)
);


-- =========================================
-- 6. SKILLS
-- =========================================

CREATE TABLE skills (
    skill_id INT PRIMARY KEY AUTO_INCREMENT,
    skill_name VARCHAR(100) NOT NULL UNIQUE,
    skill_category VARCHAR(50) NOT NULL
);


-- =========================================
-- 7. JOB SKILLS
-- =========================================

CREATE TABLE job_skills (
    job_id INT NOT NULL,
    skill_id INT NOT NULL,

    PRIMARY KEY (job_id, skill_id),

    FOREIGN KEY (job_id)
        REFERENCES job_postings(job_id),

    FOREIGN KEY (skill_id)
        REFERENCES skills(skill_id)
);


-- =========================================
-- 8. CANDIDATES
-- =========================================

CREATE TABLE candidates (
    candidate_id INT PRIMARY KEY AUTO_INCREMENT,
    candidate_name VARCHAR(150) NOT NULL,
    education VARCHAR(150) NOT NULL,
    experience_years DECIMAL(4,1) NOT NULL
);


-- =========================================
-- 9. CANDIDATE SKILLS
-- =========================================

CREATE TABLE candidate_skills (
    candidate_id INT NOT NULL,
    skill_id INT NOT NULL,

    PRIMARY KEY (candidate_id, skill_id),

    FOREIGN KEY (candidate_id)
        REFERENCES candidates(candidate_id),

    FOREIGN KEY (skill_id)
        REFERENCES skills(skill_id)
);


-- =========================================
-- 10. APPLICATIONS
-- =========================================

CREATE TABLE applications (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    candidate_id INT NOT NULL,
    job_id INT NOT NULL,
    application_date DATE NOT NULL,
    application_status VARCHAR(50) NOT NULL,

    FOREIGN KEY (candidate_id)
        REFERENCES candidates(candidate_id),

    FOREIGN KEY (job_id)
        REFERENCES job_postings(job_id)
);


-- =========================================
-- 11. INTERVIEWS
-- =========================================

CREATE TABLE interviews (
    interview_id INT PRIMARY KEY AUTO_INCREMENT,
    application_id INT NOT NULL,
    interview_date DATE NOT NULL,
    interview_round VARCHAR(50) NOT NULL,
    result VARCHAR(50) NOT NULL,

    FOREIGN KEY (application_id)
        REFERENCES applications(application_id)
);


-- =========================================
-- 12. OFFERS
-- =========================================

CREATE TABLE offers (
    offer_id INT PRIMARY KEY AUTO_INCREMENT,
    application_id INT NOT NULL,
    offer_date DATE NOT NULL,
    offered_salary DECIMAL(12,2) NOT NULL,
    offer_status VARCHAR(50) NOT NULL,

    FOREIGN KEY (application_id)
        REFERENCES applications(application_id)
);
