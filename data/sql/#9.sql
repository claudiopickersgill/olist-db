SELECT payment_type, ROUND(CAST(SUM(payment_value) as numeric), 2) AS total 
FROM order_payments
GROUP BY payment_type 
ORDER BY total