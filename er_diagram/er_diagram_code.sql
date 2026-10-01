USE job_market_intelligence;

-- =========================================
-- ER DIAGRAM : DATABASE STRUCTURE CHECK
-- =========================================

SHOW TABLES;

-- Table structures
DESCRIBE industries;
DESCRIBE companies;
DESCRIBE job_roles;
DESCRIBE locations;
DESCRIBE skills;
DESCRIBE job_postings;
DESCRIBE job_skills;
DESCRIBE candidates;
DESCRIBE candidate_skills;
DESCRIBE applications;
DESCRIBE interviews;

-- Foreign key relationships
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'job_market_intelligence'
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME, COLUMN_NAME;