/*
Question: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill) for a data analyst?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles.
- Concentrates on remote positions with specified salaries.

Purpose: Targets skills that offer job security (high demand) and financial benefits (high salaries), 
offering strategic insights for career development in data analysis.
*/


SELECT
    sd.skill_id,
    sd.skills,
    COUNT(jpf.job_id) AS demand_count, -- Find skills in high demand.
    ROUND(AVG(salary_year_avg), 0) AS avg_salary -- Find high paying skills.
FROM
    job_postings_fact jpf
INNER JOIN skills_job_dim sj ON jpf.job_id = sj.job_id
INNER JOIN skills_dim sd ON sj.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    sd.skill_id
HAVING
    COUNT(jpf.job_id) > 10 -- Keeps results to skills with more than 10 associated jobs.
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;