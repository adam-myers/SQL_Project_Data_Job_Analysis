/*
Question: What are the top skills based on salary? 
- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries.

Purpose: Reveals how different skills impact salary levels for Data Analysts 
and helps identify the most financially rewarding skills to acquire or improve.
*/


SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM 
    job_postings_fact jpf
INNER JOIN skills_job_dim sj ON jpf.job_id = sj.job_id -- Inner joins ensure only jobs with explicitly listed skills are included in the salary average.
INNER JOIN skills_dim sd ON sj.skill_id = sd.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25;

/*
AI-Generated Analysis:

Based on the analysis of the top 25 highest-paying remote skills for data analysts in 2023, here are the three key insights:

1. Big Data Mastery Commands the Highest Premium: 
    PySpark is the clear leader with an average salary of $208,172, outperforming the second-highest skill by nearly $19,000.
    This underscores that the ability to process and analyze large-scale data using distributed computing is the most valuable 
    technical asset for a remote analyst.

2. DevOps and Engineering Integration is a Major Salary Accelerator: 
    High-paying roles are increasingly requiring skills traditionally associated with software engineering and systems administration. 
    Tools like Bitbucket ($189k), GitLab ($154k), Linux ($136k), and Kubernetes ($132k) are all in the top 25, 
    indicating that analysts who can manage their own pipelines and deployment environments earn a significant premium.

3. Specialized AI and Niche Languages Offer High Returns: 
    Beyond standard data tools, top-tier compensation is tied to specialized AI platforms like Watson and DataRobot (both approx $160k) 
    and unconventional languages such as Swift ($153k) and Golang ($145k). This suggests a high demand for analysts who can bridge 
    the gap between data analysis, machine learning deployment, and modern application development.