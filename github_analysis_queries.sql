
-- Q1: Top 10 repositories by stars
SELECT name, full_name, language, stars, forks, open_issues, html_url
FROM repositories
ORDER BY stars DESC
LIMIT 10;

-- Q2: Most popular programming languages by repository count
SELECT language, COUNT(*) AS repository_count,
       ROUND(AVG(stars), 2) AS average_stars,
       SUM(stars) AS total_stars
FROM repositories
WHERE language <> 'Unknown'
GROUP BY language
ORDER BY repository_count DESC
LIMIT 15;

-- Q3: Languages with highest average popularity
SELECT language, COUNT(*) AS repository_count,
       ROUND(AVG(stars), 2) AS average_stars
FROM repositories
WHERE language <> 'Unknown'
GROUP BY language
HAVING COUNT(*) >= 3
ORDER BY average_stars DESC
LIMIT 10;

-- Q4: Most forked repositories
SELECT name, full_name, language, stars, forks
FROM repositories
ORDER BY forks DESC
LIMIT 10;

-- Q5: Most active repositories
SELECT name, full_name, language, stars, forks,
       days_since_push, activity_status
FROM repositories
ORDER BY days_since_push ASC
LIMIT 10;

-- Q6: Archived vs non-archived
SELECT is_archived, COUNT(*) AS repository_count,
       ROUND(AVG(stars), 2) AS average_stars
FROM repositories
GROUP BY is_archived;

-- Q7: Average popularity by activity status
SELECT activity_status, COUNT(*) AS repository_count,
       ROUND(AVG(stars), 2) AS average_stars,
       ROUND(AVG(forks), 2) AS average_forks
FROM repositories
GROUP BY activity_status
ORDER BY average_stars DESC;
