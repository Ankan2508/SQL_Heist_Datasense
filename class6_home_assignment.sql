-- Q1. Calculate the total revenue (SUM(RevenueLastMonth)) for influencers in the "Gaming" category.

SELECT SUM(revenuelastmonth) AS total_revenue
FROM youtube
WHERE channeltype = 'Gaming';

-- Q2. Find the total revenue for each Country.

SELECT country, SUM(revenuelastmonth) AS total_revenue
FROM youtube
GROUP BY country;

-- Q3. Calculate the total revenue for each country, but only include rows where ChannelType is "Gaming".

SELECT country, SUM(revenuelastmonth) AS total_revenue
FROM youtube
WHERE channeltype = 'Gaming'
GROUP BY country;

-- Q4. Find countries where the total revenue exceeds $200,000.

SELECT country, SUM(revenuelastmonth) AS total_revenue
FROM youtube
GROUP BY country
HAVING SUM(revenuelastmonth) > 200000;

-- Q5. Find countries with influencers in the "Gaming" category, where the total revenue for gaming channels exceeds $30,000.

SELECT country, SUM(revenuelastmonth) AS total_revenue
FROM youtube
WHERE channeltype = 'Gaming'
GROUP BY country
HAVING SUM(revenuelastmonth) > 30000;

-- Q6. For each Country, calculate the total number of influencers (COUNT(*)), total revenue (SUM), and average revenue (AVG).

SELECT country, COUNT(*), SUM(revenuelastmonth) AS total_revenue, AVG(revenuelastmonth) AS average_revenue
FROM youtube
GROUP BY country;

-- Q7.Find countries where the total revenue exceeds $150,000 and the average revenue per influencer exceeds $20,000.

SELECT country, SUM(revenuelastmonth) AS total_revenue, AVG(revenuelastmonth) AS average_revenue
FROM youtube
GROUP BY country
HAVING SUM(revenuelastmonth)>150000 AND AVG(revenuelastmonth)>20000;

-- Q8. Find the ChannelType with the highest total revenue.

SELECT channeltype, SUM(revenuelastmonth) AS total_revenue
FROM youtube
GROUP BY channeltype
ORDER BY SUM(revenuelastmonth) DESC
LIMIT 1;

-- Q9. Identify ChannelType groups where the average revenue per influencer (AVG(RevenueLastMonth)) is greater than 50% of the maximum revenue among all influencers.

SELECT channeltype, AVG(revenuelastmonth) AS avg_revenue
FROM youtube
GROUP BY channeltype
HAVING AVG(revenuelastmonth) > 0.5*MAX(revenuelastmonth);

-- Q10. Identify ChannelType groups where the total views (SUM(AvgViewsPerVideo)) contribute more than 10% of the overall views across all influencers in the dataset.

SELECT channeltype, (SUM(AvgViewsPerVideo)) AS total_views
FROM youtube
GROUP BY channeltype
HAVING SUM(AvgViewsPerVideo) > 0.1*(
SELECT (SUM(AvgViewsPerVideo))
FROM youtube);








