/*
Question: What are the most in-demand skills for data analysts?
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all remote job postings.

Purpose: Retrieves the top 5 skills with the highest demand in the job market, 
providing insights into the most valuable skills for job seekers.
*/


SELECT
    skills,
    COUNT(jpf.job_id) AS demand_count
FROM 
    job_postings_fact jpf
INNER JOIN skills_job_dim sj ON jpf.job_id = sj.job_id -- Inner joins ensure only jobs with explicitly listed skills are counted.
INNER JOIN skills_dim sd ON sj.skill_id = sd.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY 
    demand_count DESC
LIMIT 5;