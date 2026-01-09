/*
Question: What are the top-paying data analyst jobs, and what skills are required?
- Identify the top 10 highest-paying Data Analyst jobs and the specific skills required for these roles.
- Filters for roles with specified salaries that are remote.

Purpose: Provides a detailed look at which high-paying jobs demand certain skills, 
helping job seekers understand which skills to develop that align with top salaries.
*/

-- CTE: Identifies the top 10 highest-paying remote Data Analyst roles, listing associated company names.
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact jpf
    LEFT JOIN company_dim cd ON jpf.company_id = cd.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
-- Main Query: Retrieves the required skills associated with each top-paying job.
SELECT
    t.*,
    skills
FROM 
    top_paying_jobs t
INNER JOIN skills_job_dim sj ON t.job_id = sj.job_id -- Inner joins ensure only jobs with explicitly listed skills are returned.
INNER JOIN skills_dim sd ON sj.skill_id = sd.skill_id
ORDER BY 
    salary_year_avg DESC;


/*
AI-Generated Analysis (Only 8 of the top 10 jobs had skills associated):

SKILLS BREAKDOWN FOR TOP-PAYING DATA ANALYST ROLES (2023)
=========================================================

- SQL:          Found in 8/8 jobs | Avg Salary: $207,320
- Python:       Found in 7/8 jobs | Avg Salary: $205,937
- Tableau:      Found in 6/8 jobs | Avg Salary: $214,260
- R:            Found in 4/8 jobs | Avg Salary: $215,313
- Excel/Pandas: Found in 3/8 jobs | Avg Salary: $215,609

Note: Cloud (AWS/Snowflake) and Engineering tools (Git/Jira) 
are key secondary requirements for the $184k - $255k range.

1. Core Technical "Must-Haves"
    SQL (100%): Universal requirement across all top-paying roles.
    Python (88%): The primary language for automation and advanced analysis.
    Tableau (75%): The leading visualization tool for high-salary positions.

2. Salary-Boosting Specializations
    Cloud Platforms: Proficiency in AWS, Snowflake, or Azure is a major differentiator, with AWS-related roles averaging $222k+.
    Programming Ecosystem: Higher pay is correlated with Pandas, NumPy, and R for statistical modeling.
*/












