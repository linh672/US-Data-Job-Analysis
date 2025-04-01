WITH top_paying_jobs AS (SELECT 
    job_id,
    job_title,
    job_location,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM job_postings_fact
LEFT JOIN 
    company_dim ON job_postings_fact.company_id=company_dim.company_id
WHERE 
    job_title_short = 'Machine Learning Engineer' 
    AND job_country = 'United States' 
    AND salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN 
    skills_job_dim ON top_paying_jobs.job_id=skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;


/*
Insights from Skill Analysis:
-Python is the most in-demand skill, appearing in 5 job listings. This aligns with its widespread use in machine learning.
-PyTorch (4 listings) and TensorFlow (3 listings) are the most popular deep learning frameworks.
Big Data and Cloud Skills:
-Spark (2), SQL (2), AWS (2), and Go (2) indicate the importance of handling large datasets and cloud computing.
-Other notable skills include Terraform (1), Excel (1), and Scikit-Learn (1), which suggests a mix of infrastructure automation, data processing, and traditional ML tools.
*/

/*
[
  {
    "job_id": 1123031,
    "job_title": "Senior AI Platform Engineer",
    "job_location": "Santa Clara, CA",
    "salary_year_avg": "315000.0",
    "job_posted_date": "2023-07-23 14:02:45",
    "company_name": "Nvidia",
    "skill_name": "tensorflow"
  },
  {
    "job_id": 1123031,
    "job_title": "Senior AI Platform Engineer",
    "job_location": "Santa Clara, CA",
    "salary_year_avg": "315000.0",
    "job_posted_date": "2023-07-23 14:02:45",
    "company_name": "Nvidia",
    "skill_name": "pytorch"
  },
  {
    "job_id": 901491,
    "job_title": "Machine Learning Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-11-24 18:02:30",
    "company_name": "orbit",
    "skill_name": "python"
  },
  {
    "job_id": 901491,
    "job_title": "Machine Learning Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-11-24 18:02:30",
    "company_name": "orbit",
    "skill_name": "typescript"
  },
  {
    "job_id": 901491,
    "job_title": "Machine Learning Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-11-24 18:02:30",
    "company_name": "orbit",
    "skill_name": "golang"
  },
  {
    "job_id": 741323,
    "job_title": "Lead Machine Learning Engineer, Risk Data Mining",
    "job_location": "San Jose, CA",
    "salary_year_avg": "284000.0",
    "job_posted_date": "2023-05-27 14:07:17",
    "company_name": "TikTok",
    "skill_name": "spark"
  },
  {
    "job_id": 741323,
    "job_title": "Lead Machine Learning Engineer, Risk Data Mining",
    "job_location": "San Jose, CA",
    "salary_year_avg": "284000.0",
    "job_posted_date": "2023-05-27 14:07:17",
    "company_name": "TikTok",
    "skill_name": "hadoop"
  },
  {
    "job_id": 741323,
    "job_title": "Lead Machine Learning Engineer, Risk Data Mining",
    "job_location": "San Jose, CA",
    "salary_year_avg": "284000.0",
    "job_posted_date": "2023-05-27 14:07:17",
    "company_name": "TikTok",
    "skill_name": "linux"
  },
  {
    "job_id": 674661,
    "job_title": "Director of ML Research",
    "job_location": "Berkeley, CA",
    "salary_year_avg": "240000.0",
    "job_posted_date": "2023-03-08 22:00:39",
    "company_name": "Cognitiv",
    "skill_name": "sql"
  },
  {
    "job_id": 674661,
    "job_title": "Director of ML Research",
    "job_location": "Berkeley, CA",
    "salary_year_avg": "240000.0",
    "job_posted_date": "2023-03-08 22:00:39",
    "company_name": "Cognitiv",
    "skill_name": "python"
  },
  {
    "job_id": 938684,
    "job_title": "Predictive Science",
    "job_location": "Jersey City, NJ",
    "salary_year_avg": "237500.0",
    "job_posted_date": "2023-07-27 03:02:44",
    "company_name": "JPMorgan Chase Bank, N.A.",
    "skill_name": "python"
  },
  {
    "job_id": 938684,
    "job_title": "Predictive Science",
    "job_location": "Jersey City, NJ",
    "salary_year_avg": "237500.0",
    "job_posted_date": "2023-07-27 03:02:44",
    "company_name": "JPMorgan Chase Bank, N.A.",
    "skill_name": "java"
  },
  {
    "job_id": 938684,
    "job_title": "Predictive Science",
    "job_location": "Jersey City, NJ",
    "salary_year_avg": "237500.0",
    "job_posted_date": "2023-07-27 03:02:44",
    "company_name": "JPMorgan Chase Bank, N.A.",
    "skill_name": "azure"
  },
  {
    "job_id": 938684,
    "job_title": "Predictive Science",
    "job_location": "Jersey City, NJ",
    "salary_year_avg": "237500.0",
    "job_posted_date": "2023-07-27 03:02:44",
    "company_name": "JPMorgan Chase Bank, N.A.",
    "skill_name": "aws"
  },
  {
    "job_id": 938684,
    "job_title": "Predictive Science",
    "job_location": "Jersey City, NJ",
    "salary_year_avg": "237500.0",
    "job_posted_date": "2023-07-27 03:02:44",
    "company_name": "JPMorgan Chase Bank, N.A.",
    "skill_name": "spark"
  },
  {
    "job_id": 938684,
    "job_title": "Predictive Science",
    "job_location": "Jersey City, NJ",
    "salary_year_avg": "237500.0",
    "job_posted_date": "2023-07-27 03:02:44",
    "company_name": "JPMorgan Chase Bank, N.A.",
    "skill_name": "tensorflow"
  },
  {
    "job_id": 938684,
    "job_title": "Predictive Science",
    "job_location": "Jersey City, NJ",
    "salary_year_avg": "237500.0",
    "job_posted_date": "2023-07-27 03:02:44",
    "company_name": "JPMorgan Chase Bank, N.A.",
    "skill_name": "keras"
  },
  {
    "job_id": 938684,
    "job_title": "Predictive Science",
    "job_location": "Jersey City, NJ",
    "salary_year_avg": "237500.0",
    "job_posted_date": "2023-07-27 03:02:44",
    "company_name": "JPMorgan Chase Bank, N.A.",
    "skill_name": "pytorch"
  },
  {
    "job_id": 938684,
    "job_title": "Predictive Science",
    "job_location": "Jersey City, NJ",
    "salary_year_avg": "237500.0",
    "job_posted_date": "2023-07-27 03:02:44",
    "company_name": "JPMorgan Chase Bank, N.A.",
    "skill_name": "git"
  },
  {
    "job_id": 1277975,
    "job_title": "Principal Machine Learning Researcher",
    "job_location": "Los Altos, CA",
    "salary_year_avg": "235000.0",
    "job_posted_date": "2023-11-27 11:04:08",
    "company_name": "Jobot",
    "skill_name": "python"
  },
  {
    "job_id": 1277975,
    "job_title": "Principal Machine Learning Researcher",
    "job_location": "Los Altos, CA",
    "salary_year_avg": "235000.0",
    "job_posted_date": "2023-11-27 11:04:08",
    "company_name": "Jobot",
    "skill_name": "go"
  },
  {
    "job_id": 1277975,
    "job_title": "Principal Machine Learning Researcher",
    "job_location": "Los Altos, CA",
    "salary_year_avg": "235000.0",
    "job_posted_date": "2023-11-27 11:04:08",
    "company_name": "Jobot",
    "skill_name": "gcp"
  },
  {
    "job_id": 1277975,
    "job_title": "Principal Machine Learning Researcher",
    "job_location": "Los Altos, CA",
    "salary_year_avg": "235000.0",
    "job_posted_date": "2023-11-27 11:04:08",
    "company_name": "Jobot",
    "skill_name": "airflow"
  },
  {
    "job_id": 1277975,
    "job_title": "Principal Machine Learning Researcher",
    "job_location": "Los Altos, CA",
    "salary_year_avg": "235000.0",
    "job_posted_date": "2023-11-27 11:04:08",
    "company_name": "Jobot",
    "skill_name": "tensorflow"
  },
  {
    "job_id": 1277975,
    "job_title": "Principal Machine Learning Researcher",
    "job_location": "Los Altos, CA",
    "salary_year_avg": "235000.0",
    "job_posted_date": "2023-11-27 11:04:08",
    "company_name": "Jobot",
    "skill_name": "pytorch"
  },
  {
    "job_id": 1277975,
    "job_title": "Principal Machine Learning Researcher",
    "job_location": "Los Altos, CA",
    "salary_year_avg": "235000.0",
    "job_posted_date": "2023-11-27 11:04:08",
    "company_name": "Jobot",
    "skill_name": "terraform"
  },
  {
    "job_id": 1277975,
    "job_title": "Principal Machine Learning Researcher",
    "job_location": "Los Altos, CA",
    "salary_year_avg": "235000.0",
    "job_posted_date": "2023-11-27 11:04:08",
    "company_name": "Jobot",
    "skill_name": "kubernetes"
  },
  {
    "job_id": 1277975,
    "job_title": "Principal Machine Learning Researcher",
    "job_location": "Los Altos, CA",
    "salary_year_avg": "235000.0",
    "job_posted_date": "2023-11-27 11:04:08",
    "company_name": "Jobot",
    "skill_name": "docker"
  },
  {
    "job_id": 1412287,
    "job_title": "Engineering Manager, Machine Learning Foundations",
    "job_location": "San Francisco, CA",
    "salary_year_avg": "230500.0",
    "job_posted_date": "2023-07-12 10:03:26",
    "company_name": "Block",
    "skill_name": "go"
  },
  {
    "job_id": 1412287,
    "job_title": "Engineering Manager, Machine Learning Foundations",
    "job_location": "San Francisco, CA",
    "salary_year_avg": "230500.0",
    "job_posted_date": "2023-07-12 10:03:26",
    "company_name": "Block",
    "skill_name": "c"
  },
  {
    "job_id": 1294908,
    "job_title": "Machine Learning Scientist (Greater NYC Area, NY)",
    "job_location": "New York, NY",
    "salary_year_avg": "228000.0",
    "job_posted_date": "2023-01-06 16:03:20",
    "company_name": "ADP",
    "skill_name": "sql"
  },
  {
    "job_id": 1294908,
    "job_title": "Machine Learning Scientist (Greater NYC Area, NY)",
    "job_location": "New York, NY",
    "salary_year_avg": "228000.0",
    "job_posted_date": "2023-01-06 16:03:20",
    "company_name": "ADP",
    "skill_name": "python"
  },
  {
    "job_id": 1294908,
    "job_title": "Machine Learning Scientist (Greater NYC Area, NY)",
    "job_location": "New York, NY",
    "salary_year_avg": "228000.0",
    "job_posted_date": "2023-01-06 16:03:20",
    "company_name": "ADP",
    "skill_name": "scala"
  },
  {
    "job_id": 1294908,
    "job_title": "Machine Learning Scientist (Greater NYC Area, NY)",
    "job_location": "New York, NY",
    "salary_year_avg": "228000.0",
    "job_posted_date": "2023-01-06 16:03:20",
    "company_name": "ADP",
    "skill_name": "r"
  },
  {
    "job_id": 1294908,
    "job_title": "Machine Learning Scientist (Greater NYC Area, NY)",
    "job_location": "New York, NY",
    "salary_year_avg": "228000.0",
    "job_posted_date": "2023-01-06 16:03:20",
    "company_name": "ADP",
    "skill_name": "databricks"
  },
  {
    "job_id": 1294908,
    "job_title": "Machine Learning Scientist (Greater NYC Area, NY)",
    "job_location": "New York, NY",
    "salary_year_avg": "228000.0",
    "job_posted_date": "2023-01-06 16:03:20",
    "company_name": "ADP",
    "skill_name": "aws"
  },
  {
    "job_id": 1294908,
    "job_title": "Machine Learning Scientist (Greater NYC Area, NY)",
    "job_location": "New York, NY",
    "salary_year_avg": "228000.0",
    "job_posted_date": "2023-01-06 16:03:20",
    "company_name": "ADP",
    "skill_name": "pytorch"
  },
  {
    "job_id": 1294908,
    "job_title": "Machine Learning Scientist (Greater NYC Area, NY)",
    "job_location": "New York, NY",
    "salary_year_avg": "228000.0",
    "job_posted_date": "2023-01-06 16:03:20",
    "company_name": "ADP",
    "skill_name": "scikit-learn"
  },
  {
    "job_id": 1294908,
    "job_title": "Machine Learning Scientist (Greater NYC Area, NY)",
    "job_location": "New York, NY",
    "salary_year_avg": "228000.0",
    "job_posted_date": "2023-01-06 16:03:20",
    "company_name": "ADP",
    "skill_name": "excel"
  },
  {
    "job_id": 1294908,
    "job_title": "Machine Learning Scientist (Greater NYC Area, NY)",
    "job_location": "New York, NY",
    "salary_year_avg": "228000.0",
    "job_posted_date": "2023-01-06 16:03:20",
    "company_name": "ADP",
    "skill_name": "tableau"
  }
]
*/