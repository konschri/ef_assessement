-- Unified Query for calculating all three metrics
SELECT 
      q1.city, q1.breakfast_basket, q1.efood_basket, q1.breakfast_freq, q1.efood_freq, q2.breakfast_users3freq_perc, q2.efood_users3freq_perc
FROM (
      SELECT city,
              SUM(CASE WHEN cuisine = 'Breakfast' THEN amount ELSE 0 END) / COUNT(CASE WHEN cuisine = 'Breakfast' THEN 1 ELSE NULL END) AS breakfast_basket,
              SUM(amount)/COUNT(*) AS efood_basket,
              COUNT(CASE WHEN cuisine = 'Breakfast' THEN order_id ELSE NULL END) / COUNT(DISTINCT CASE WHEN cuisine = 'Breakfast' THEN `main_assessment.orders`.user_id ELSE NULL END) AS breakfast_freq,
              COUNT(*) / COUNT(DISTINCT `main_assessment.orders`.user_id) AS efood_freq,
      FROM `main_assessment.orders`
      GROUP BY city
      HAVING COUNT(*) > 1000
      ORDER BY COUNT(*) DESC
      LIMIT 5
     ) AS q1
JOIN (
      SELECT orders_by_user.city,
              COUNT(CASE WHEN orders_by_user.breakfast_orders > 3 THEN 1 ELSE NULL END) / NULLIF(COUNT(CASE WHEN orders_by_user.breakfast_orders > 0 THEN 1 ELSE NULL END), 0) AS breakfast_users3freq_perc,
              COUNT(CASE WHEN orders_by_user.total_orders > 3 THEN 1 ELSE NULL END) / NULLIF(COUNT(CASE WHEN orders_by_user.total_orders > 0 THEN 1 ELSE NULL END), 0) AS efood_users3freq_perc
      FROM (
            SELECT user_id,
                   city,
                   COUNT(*) AS total_orders,
                   SUM(CASE WHEN cuisine = 'Breakfast' THEN 1 ELSE NULL END) AS breakfast_orders
            FROM `main_assessment.orders`
            GROUP BY user_id, city) as orders_by_user
            GROUP BY orders_by_user.city
            HAVING COUNT(*) > 1000
            ORDER BY COUNT(*) DESC
            LIMIT 5
     ) AS q2 
ON q1.city = q2.city;