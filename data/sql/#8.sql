SELECT payment_type, COUNT(order_id) as qtd
FROM order_payments
GROUP BY payment_type 
ORDER BY qtd