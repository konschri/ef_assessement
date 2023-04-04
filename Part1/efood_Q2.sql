-- Query for contribution of top 10 users for each city
WITH ranks AS (
  SELECT user_id,
         city,
         ROW_NUMBER() OVER (PARTITION BY city ORDER BY COUNT(*) DESC) AS user_rank
  FROM `main_assessment.orders`
  GROUP BY user_id, city
)

SELECT 
      orders.city, 
      ROUND(COUNT(CASE WHEN user_rank <= 10 THEN 1 END) / COUNT(*), 3) AS top_10_pct
FROM `main_assessment.orders` AS orders
JOIN ranks ON orders.user_id = ranks.user_id AND orders.city = ranks.city
GROUP BY orders.city
ORDER BY top_10_pct DESC