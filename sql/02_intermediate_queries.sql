USE job_market_intelligence;

-- =====================================================
-- 01. COMPANY + INDUSTRY
-- =====================================================

SELECT
    c.company_id,
    c.company_name,
    i.industry_name
FROM companies c
JOIN industries i
    ON c.industry_id = i.industry_id
ORDER BY c.company_id;


-- =====================================================
-- 02. JOB + COMPANY
-- =====================================================

SELECT
    jp.job_id,
    jp.job_title,
    c.company_name
FROM job_postings jp
JOIN companies c
    ON jp.company_id = c.company_id
ORDER BY jp.job_id;


-- =====================================================
-- 03. JOB + ROLE
-- =====================================================

SELECT
    jp.job_id,
    jp.job_title,
    jr.role_name
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
ORDER BY jp.job_id;


-- =====================================================
-- 04. JOB + LOCATION
-- =====================================================

SELECT
    jp.job_id,
    jp.job_title,
    l.city,
    l.state
FROM job_postings jp
JOIN locations l
    ON jp.location_id = l.location_id
ORDER BY jp.job_id;


-- =====================================================
-- 05. COMPLETE JOB INFORMATION
-- =====================================================

SELECT
    jp.job_id,
    jp.job_title,
    c.company_name,
    jr.role_name,
    l.city,
    jp.job_type,
    jp.work_mode,
    jp.salary_min,
    jp.salary_max
FROM job_postings jp
JOIN companies c
    ON jp.company_id = c.company_id
JOIN job_roles jr
    ON jp.role_id = jr.role_id
JOIN locations l
    ON jp.location_id = l.location_id
ORDER BY jp.job_id;


-- =====================================================
-- 06. JOBS BY ROLE
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
-- 07. JOBS BY COMPANY
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
-- 08. JOBS BY INDUSTRY
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
-- 09. JOBS BY LOCATION
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
-- 10. JOBS BY WORK MODE
-- =====================================================

SELECT
    work_mode,
    COUNT(*) AS total_jobs
FROM job_postings
GROUP BY work_mode
ORDER BY total_jobs DESC;


-- =====================================================
-- 11. JOBS BY EXPERIENCE
-- =====================================================

SELECT
    experience_required,
    COUNT(*) AS total_jobs
FROM job_postings
GROUP BY experience_required
ORDER BY total_jobs DESC;


-- =====================================================
-- 12. JOBS BY JOB TYPE
-- =====================================================

SELECT
    job_type,
    COUNT(*) AS total_jobs
FROM job_postings
GROUP BY job_type
ORDER BY total_jobs DESC;


-- =====================================================
-- 13. AVERAGE SALARY BY WORK MODE
-- =====================================================

SELECT
    work_mode,
    COUNT(*) AS total_jobs,
    ROUND(AVG(salary_min), 2) AS average_min_salary,
    ROUND(AVG(salary_max), 2) AS average_max_salary
FROM job_postings
GROUP BY work_mode
ORDER BY average_max_salary DESC;


-- =====================================================
-- 14. AVERAGE SALARY BY JOB TYPE
-- =====================================================

SELECT
    job_type,
    COUNT(*) AS total_jobs,
    ROUND(AVG(salary_min), 2) AS average_min_salary,
    ROUND(AVG(salary_max), 2) AS average_max_salary
FROM job_postings
GROUP BY job_type
ORDER BY average_max_salary DESC;


-- =====================================================
-- 15. AVERAGE SALARY BY ROLE
-- =====================================================

SELECT
    jr.role_name,
    COUNT(jp.job_id) AS total_jobs,
    ROUND(AVG(jp.salary_min), 2) AS average_min_salary,
    ROUND(AVG(jp.salary_max), 2) AS average_max_salary
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
GROUP BY jr.role_name
ORDER BY average_max_salary DESC;


-- =====================================================
-- 16. AVERAGE SALARY BY INDUSTRY
-- =====================================================

SELECT
    i.industry_name,
    COUNT(jp.job_id) AS total_jobs,
    ROUND(AVG(jp.salary_min), 2) AS average_min_salary,
    ROUND(AVG(jp.salary_max), 2) AS average_max_salary
FROM job_postings jp
JOIN companies c
    ON jp.company_id = c.company_id
JOIN industries i
    ON c.industry_id = i.industry_id
GROUP BY i.industry_name
ORDER BY average_max_salary DESC;


-- =====================================================
-- 17. COMPANIES WITH MORE THAN 10 JOB POSTINGS
-- =====================================================

SELECT
    c.company_name,
    COUNT(jp.job_id) AS total_job_postings
FROM companies c
JOIN job_postings jp
    ON c.company_id = jp.company_id
GROUP BY c.company_name
HAVING COUNT(jp.job_id) > 10
ORDER BY total_job_postings DESC;


-- =====================================================
-- 18. ROLES WITH MORE THAN 20 JOB POSTINGS
-- =====================================================

SELECT
    jr.role_name,
    COUNT(jp.job_id) AS total_job_postings
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
GROUP BY jr.role_name
HAVING COUNT(jp.job_id) > 20
ORDER BY total_job_postings DESC;


-- =====================================================
-- 19. LOCATIONS WITH MORE THAN 10 JOBS
-- =====================================================

SELECT
    l.city,
    COUNT(jp.job_id) AS total_jobs
FROM job_postings jp
JOIN locations l
    ON jp.location_id = l.location_id
GROUP BY l.city
HAVING COUNT(jp.job_id) > 10
ORDER BY total_jobs DESC;


-- =====================================================
-- 20. INDUSTRIES WITH MORE THAN 20 JOBS
-- =====================================================

SELECT
    i.industry_name,
    COUNT(jp.job_id) AS total_jobs
FROM job_postings jp
JOIN companies c
    ON jp.company_id = c.company_id
JOIN industries i
    ON c.industry_id = i.industry_id
GROUP BY i.industry_name
HAVING COUNT(jp.job_id) > 20
ORDER BY total_jobs DESC;


-- =====================================================
-- 21. JOBS BY INDUSTRY AND WORK MODE
-- =====================================================

SELECT
    i.industry_name,
    jp.work_mode,
    COUNT(jp.job_id) AS total_jobs
FROM job_postings jp
JOIN companies c
    ON jp.company_id = c.company_id
JOIN industries i
    ON c.industry_id = i.industry_id
GROUP BY
    i.industry_name,
    jp.work_mode
ORDER BY
    i.industry_name,
    total_jobs DESC;


-- =====================================================
-- 22. JOBS BY ROLE AND JOB TYPE
-- =====================================================

SELECT
    jr.role_name,
    jp.job_type,
    COUNT(jp.job_id) AS total_jobs
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
GROUP BY
    jr.role_name,
    jp.job_type
ORDER BY
    jr.role_name,
    total_jobs DESC;


-- =====================================================
-- 23. JOBS BY ROLE AND WORK MODE
-- =====================================================

SELECT
    jr.role_name,
    jp.work_mode,
    COUNT(jp.job_id) AS total_jobs
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
GROUP BY
    jr.role_name,
    jp.work_mode
ORDER BY
    jr.role_name,
    total_jobs DESC;


-- =====================================================
-- 24. APPLICATION STATUS ANALYSIS
-- =====================================================

SELECT
    application_status,
    COUNT(*) AS total_applications
FROM applications
GROUP BY application_status
ORDER BY total_applications DESC;


-- =====================================================
-- 25. APPLICATIONS BY JOB
-- =====================================================

SELECT
    job_id,
    COUNT(*) AS total_applications
FROM applications
GROUP BY job_id
ORDER BY total_applications DESC;


-- =====================================================
-- 26. APPLICATIONS BY CANDIDATE
-- =====================================================

SELECT
    c.candidate_id,
    c.candidate_name,
    COUNT(a.application_id) AS total_applications
FROM candidates c
LEFT JOIN applications a
    ON c.candidate_id = a.candidate_id
GROUP BY
    c.candidate_id,
    c.candidate_name
ORDER BY total_applications DESC;


-- =====================================================
-- 27. CANDIDATE APPLICATION DETAILS
-- =====================================================

SELECT
    c.candidate_name,
    jp.job_title,
    a.application_date,
    a.application_status
FROM applications a
JOIN candidates c
    ON a.candidate_id = c.candidate_id
JOIN job_postings jp
    ON a.job_id = jp.job_id
ORDER BY a.application_date;


-- =====================================================
-- 28. INTERVIEW RESULT ANALYSIS
-- =====================================================

SELECT
    result,
    COUNT(*) AS total_interviews
FROM interviews
GROUP BY result
ORDER BY total_interviews DESC;


-- =====================================================
-- 29. INTERVIEW ROUND ANALYSIS
-- =====================================================

SELECT
    interview_round,
    COUNT(*) AS total_interviews
FROM interviews
GROUP BY interview_round
ORDER BY total_interviews DESC;


-- =====================================================
-- 30. APPLICATION TO INTERVIEW ANALYSIS
-- =====================================================

SELECT
    COUNT(DISTINCT a.application_id) AS total_applications,
    COUNT(DISTINCT i.interview_id) AS total_interviews
FROM applications a
LEFT JOIN interviews i
    ON a.application_id = i.application_id;


-- =====================================================
-- 31. APPLICATION TO INTERVIEW RATE
-- =====================================================

SELECT
    ROUND(
        COUNT(DISTINCT i.interview_id) * 100.0
        / COUNT(DISTINCT a.application_id),
        2
    ) AS application_to_interview_rate
FROM applications a
LEFT JOIN interviews i
    ON a.application_id = i.application_id;


-- =====================================================
-- 32. MONTHLY JOB POSTINGS
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
-- 33. MONTHLY APPLICATIONS
-- =====================================================

SELECT
    YEAR(application_date) AS application_year,
    MONTH(application_date) AS application_month,
    COUNT(*) AS total_applications
FROM applications
GROUP BY
    YEAR(application_date),
    MONTH(application_date)
ORDER BY
    application_year,
    application_month;


-- =====================================================
-- 34. JOBS POSTED BY MONTH
-- =====================================================

SELECT
    MONTH(posted_date) AS posting_month,
    COUNT(*) AS total_jobs
FROM job_postings
GROUP BY MONTH(posted_date)
ORDER BY posting_month;


-- =====================================================
-- 35. TOP 10 COMPANIES BY JOB POSTINGS
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
-- 36. TOP 10 JOBS BY APPLICATIONS
-- =====================================================

SELECT
    job_id,
    COUNT(*) AS total_applications
FROM applications
GROUP BY job_id
ORDER BY total_applications DESC
LIMIT 10;


-- =====================================================
-- 37. JOBS REQUIRING 5 OR MORE SKILLS
-- =====================================================

SELECT
    job_id,
    COUNT(skill_id) AS required_skill_count
FROM job_skills
GROUP BY job_id
HAVING COUNT(skill_id) >= 5
ORDER BY required_skill_count DESC;


-- =====================================================
-- 38. SKILL COUNT PER JOB
-- =====================================================

SELECT
    job_id,
    COUNT(skill_id) AS required_skill_count
FROM job_skills
GROUP BY job_id
ORDER BY required_skill_count DESC;


-- =====================================================
-- 39. SKILL CATEGORY DISTRIBUTION
-- =====================================================

SELECT
    skill_category,
    COUNT(*) AS total_skills
FROM skills
GROUP BY skill_category
ORDER BY total_skills DESC;


-- =====================================================
-- 40. ROLE-WISE SKILL DEMAND
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
-- 41. COMPANY + INDUSTRY + JOB COUNT
-- =====================================================

SELECT
    c.company_name,
    i.industry_name,
    COUNT(jp.job_id) AS total_jobs
FROM companies c
JOIN industries i
    ON c.industry_id = i.industry_id
LEFT JOIN job_postings jp
    ON c.company_id = jp.company_id
GROUP BY
    c.company_name,
    i.industry_name
ORDER BY total_jobs DESC;


-- =====================================================
-- 42. HIGHEST SALARY BY ROLE
-- =====================================================

SELECT
    jr.role_name,
    MAX(jp.salary_max) AS highest_salary
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
GROUP BY jr.role_name
ORDER BY highest_salary DESC;


-- =====================================================
-- 43. LOWEST SALARY BY ROLE
-- =====================================================

SELECT
    jr.role_name,
    MIN(jp.salary_min) AS lowest_salary
FROM job_postings jp
JOIN job_roles jr
    ON jp.role_id = jr.role_id
GROUP BY jr.role_name
ORDER BY lowest_salary ASC;


-- =====================================================
-- 44. AVERAGE CANDIDATE EXPERIENCE BY EDUCATION
-- =====================================================

SELECT
    education,
    COUNT(*) AS total_candidates,
    ROUND(AVG(experience_years), 2) AS average_experience
FROM candidates
GROUP BY education
ORDER BY average_experience DESC;


-- =====================================================
-- 45. CANDIDATES WITH MORE THAN 1 APPLICATION
-- =====================================================

SELECT
    c.candidate_id,
    c.candidate_name,
    COUNT(a.application_id) AS total_applications
FROM candidates c
JOIN applications a
    ON c.candidate_id = a.candidate_id
GROUP BY
    c.candidate_id,
    c.candidate_name
HAVING COUNT(a.application_id) > 1
ORDER BY total_applications DESC;


-- =====================================================
-- 46. JOBS WITH MORE THAN 1 APPLICATION
-- =====================================================

SELECT
    jp.job_id,
    jp.job_title,
    COUNT(a.application_id) AS total_applications
FROM job_postings jp
JOIN applications a
    ON jp.job_id = a.job_id
GROUP BY
    jp.job_id,
    jp.job_title
HAVING COUNT(a.application_id) > 1
ORDER BY total_applications DESC;


-- =====================================================
-- 47. SELECTED APPLICATIONS WITH CANDIDATE DETAILS
-- =====================================================

SELECT
    c.candidate_name,
    jp.job_title,
    a.application_date,
    a.application_status
FROM applications a
JOIN candidates c
    ON a.candidate_id = c.candidate_id
JOIN job_postings jp
    ON a.job_id = jp.job_id
WHERE a.application_status = 'Selected'
ORDER BY a.application_date;


-- =====================================================
-- 48. INTERVIEW DETAILS WITH APPLICATION DATA
-- =====================================================

SELECT
    i.interview_id,
    i.interview_date,
    i.interview_round,
    i.result,
    a.application_id,
    a.candidate_id,
    a.job_id
FROM interviews i
JOIN applications a
    ON i.application_id = a.application_id
ORDER BY i.interview_date;


-- =====================================================
-- 49. SELECTED INTERVIEW CANDIDATES
-- =====================================================

SELECT
    c.candidate_name,
    jp.job_title,
    i.interview_round,
    i.result
FROM interviews i
JOIN applications a
    ON i.application_id = a.application_id
JOIN candidates c
    ON a.candidate_id = c.candidate_id
JOIN job_postings jp
    ON a.job_id = jp.job_id
WHERE i.result = 'Selected'
ORDER BY c.candidate_name;


-- =====================================================
-- 50. INTERMEDIATE PROJECT SUMMARY
-- =====================================================

SELECT
    COUNT(DISTINCT c.company_id) AS companies_with_jobs,
    COUNT(DISTINCT jp.job_id) AS total_jobs,
    COUNT(DISTINCT a.application_id) AS total_applications,
    COUNT(DISTINCT i.interview_id) AS total_interviews
FROM companies c
LEFT JOIN job_postings jp
    ON c.company_id = jp.company_id
LEFT JOIN applications a
    ON jp.job_id = a.job_id
LEFT JOIN interviews i
    ON a.application_id = i.application_id;