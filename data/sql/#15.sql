select review_id, order_id,
	EXTRACT(DAY FROM review_creation_date) as dia,
	EXTRACT(MONTH FROM review_creation_date) as mes,
	EXTRACT(YEAR FROM review_creation_date) as ano 
from order_reviews
order by ano, mes, dia