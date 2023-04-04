SELECT seller_id, COUNT(DISTINCT order_id) AS qtd
FROM order_items 
GROUP BY seller_id
ORDER BY qtd DESC 