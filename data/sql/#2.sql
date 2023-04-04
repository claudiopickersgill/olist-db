SELECT seller_id, seller_state, seller_city 
FROM sellers 
WHERE seller_state = 'PR'
OR LOWER(seller_city) LIKE '%rio de janeiro%'
ORDER BY seller_city DESC