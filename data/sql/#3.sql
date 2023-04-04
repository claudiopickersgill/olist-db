SELECT order_id, payment_value
FROM order_payments
WHERE payment_value BETWEEN 45 AND 125
ORDER BY payment_value 