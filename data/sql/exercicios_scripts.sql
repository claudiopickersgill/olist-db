--1. Faça uma consulta que retorne todos os vendedores do estado do Paraná.
select seller_id id_name, seller_state UF from olist_sellers_dataset osd where seller_state = 'PR';

--2. Faça uma consulta que retorne todos os vendedores do estado do Paraná ou da cidade de sarandi.
select seller_id id_name, seller_city Cidade, seller_state UF 
from olist_sellers_dataset osd 
where seller_state = 'PR' or seller_city ='sarandi'
order by Cidade desc;

--3. Faça uma consulta que retorne todos os pedidos que o preço esteja entre R\$ 45 e R\$ 125.
select order_id, payment_value valor
from olist_order_payments_dataset oopd 
where payment_value between 45 and 125
order by valor;


--4. Faça uma consulta que retorne todos os pedidos calculando o valor total do pedido (preço + frete).
select order_id pedido , (price + freight_value) total
from olist_order_items_dataset ooid  
order by total;

--5. Faça uma consulta que retorne a data mínima e máxima de limite de entrega 
select ooid.order_id Pedido, ooid.shipping_limit_date Data_minima,
ood.order_estimated_delivery_date Data_maxima
from olist_order_items_dataset ooid 
join olist_orders_dataset ood 
on ooid.order_id = ood.order_id 

--6. Faça uma consulta que retorne os 10 vendedores que mais realizaram vendas.
select seller_id venderdor , count(seller_id) N_vendas
from olist_order_items_dataset ooid 
group by seller_id 
order by N_vendas;

--7. Faça uma consulta que retorne os tipos distintos de tipo de pagamento.
select distinct(payment_type)  
from olist_order_payments_dataset oopd 

--8. Faça uma consulta que retorne a quantidade de pedidos agrupados por tipo de pagamento.
select payment_type tipo, count(*) total
from olist_order_payments_dataset oopd 
group by tipo
order by total;


--9. Faça uma consulta que retorne a soma dos valores do pedidos agrupados por tipo de pagamento.
select payment_type tipo, sum(payment_value) total
from olist_order_payments_dataset oopd 
group by tipo
order by total;

--10. Faça uma consulta que retorne as 10 cidades com mais clientes.
select customer_city cidades , count(customer_city) total
from olist_customers_dataset ocd
group by cidades
order by total desc
limit 10;

--11. Faça uma consulta que crie uma nova coluna concatenando as colunas de cidade e estado separando por hífen.
select customer_city ||'-'|| customer_state
from olist_customers_dataset ocd; 

--12. Faça uma consulta que retorne a quantidade de ordens agrupadas por status do pedido
select order_status status, count(*) quantidade  
from olist_orders_dataset ood
group by order_status order by quantidade;
--13. Faça uma consuta que calcule a diferença de tempo entre a compra e aprovação da realização do pedido.
    -- documentacao https://www.postgresql.org/docs/8.4/functions-formatting.html

select  ORDER_ID, age(date(order_approved_at),date(order_purchase_timestamp)) dias   
from olist_orders_dataset ood
order by dias DESC;

select  extract(day   from date(order_approved_at))- extract(day   from date(order_purchase_timestamp))
from olist_orders_dataset ood 

select order_id id,
(to_timestamp(order_approved_at, 'YYYY MM DD HH24 MI SS ') - to_timestamp(order_purchase_timestamp, 'YYYY MM DD HH24 MI SS ')) diferenca 
from olist_orders_dataset
order by diferenca DESC;

select to_timestamp(order_approved_at, 'YYYY MM DD HH24 MI SS ')
from olist_orders_dataset

--14. Faça uma consulta que retorne todos as reviews que tenham score maior ou igual a 3 e que não tenha conteúdo vazio no comentário da mensagem.
select review_id id, review_score score, review_comment_message comentarios 
from olist_order_reviews_dataset oord 
where review_score >= '3' and review_comment_message notnull ;

--15. Faça uma consulta que crie uma nova coluna com os meses de as datas de criação das reviews
select review_id id, extract(month  from date(review_creation_date)) mes 
from olist_order_reviews_dataset oord 
order by mes;
