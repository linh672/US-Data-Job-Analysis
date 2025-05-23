SELECT 
    skills_dim.skills,
    ROUND (AVG(salary_year_avg), 0) AS salary_year_avg_per_skill
FROM job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    job_title_short = 'Machine Learning Engineer' 
    AND job_country = 'United States' 
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills
ORDER BY
    salary_year_avg_per_skill DESC
LIMIT 30;

/*
Here is the breakdown of the results for top payin skills:
-Functional & Low-Level Languages Dominate: Haskell ($213K), Julia ($213K), and C ($196K) lead in salaries, showing demand for high-performance computing and functional programming.
-Cloud & Big Data Expertise Pay Well: Tools like BigQuery ($165K), Snowflake ($159K), and AWS ($153K) highlight the need for scalable ML deployment and data engineering.
-Surprising Frontend & Miscellaneous Skills: HTML/CSS ($195K), Excel ($189K), and GitHub ($163K) suggest a growing demand for ML-powered web apps and collaborative ML workflows.
*/

/*
[
  {
    "skills": "haskell",
    "salary_year_avg_per_skill": "213000"
  },
  {
    "skills": "julia",
    "salary_year_avg_per_skill": "213000"
  },
  {
    "skills": "c",
    "salary_year_avg_per_skill": "196239"
  },
  {
    "skills": "html",
    "salary_year_avg_per_skill": "195000"
  },
  {
    "skills": "css",
    "salary_year_avg_per_skill": "195000"
  },
  {
    "skills": "golang",
    "salary_year_avg_per_skill": "194000"
  },
  {
    "skills": "excel",
    "salary_year_avg_per_skill": "189625"
  },
  {
    "skills": "typescript",
    "salary_year_avg_per_skill": "181025"
  },
  {
    "skills": "unify",
    "salary_year_avg_per_skill": "173750"
  },
  {
    "skills": "scala",
    "salary_year_avg_per_skill": "171379"
  },
  {
    "skills": "airflow",
    "salary_year_avg_per_skill": "169750"
  },
  {
    "skills": "spark",
    "salary_year_avg_per_skill": "168801"
  },
  {
    "skills": "terraform",
    "salary_year_avg_per_skill": "168015"
  },
  {
    "skills": "bigquery",
    "salary_year_avg_per_skill": "165833"
  },
  {
    "skills": "github",
    "salary_year_avg_per_skill": "163750"
  },
  {
    "skills": "hadoop",
    "salary_year_avg_per_skill": "162975"
  },
  {
    "skills": "flow",
    "salary_year_avg_per_skill": "162717"
  },
  {
    "skills": "pytorch",
    "salary_year_avg_per_skill": "162052"
  },
  {
    "skills": "swift",
    "salary_year_avg_per_skill": "160000"
  },
  {
    "skills": "mongodb",
    "salary_year_avg_per_skill": "160000"
  },
  {
    "skills": "postgresql",
    "salary_year_avg_per_skill": "160000"
  },
  {
    "skills": "snowflake",
    "salary_year_avg_per_skill": "159167"
  },
  {
    "skills": "java",
    "salary_year_avg_per_skill": "158649"
  },
  {
    "skills": "c++",
    "salary_year_avg_per_skill": "157662"
  },
  {
    "skills": "numpy",
    "salary_year_avg_per_skill": "157181"
  },
  {
    "skills": "rust",
    "salary_year_avg_per_skill": "157015"
  },
  {
    "skills": "go",
    "salary_year_avg_per_skill": "156197"
  },
  {
    "skills": "gcp",
    "salary_year_avg_per_skill": "155038"
  },
  {
    "skills": "tensorflow",
    "salary_year_avg_per_skill": "154796"
  },
  {
    "skills": "aws",
    "salary_year_avg_per_skill": "153913"
  }
]
*/