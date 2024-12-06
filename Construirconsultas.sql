
-- Listar todos Clientes que não tenham realizado uma compra

select * from [dbo].[f_orders] r with (nolock) 

FULL OUTER JOIN [dbo].[d_customers] t with (nolock) 

ON r.customers_id = t.customers_id

WHERE r.customers_id is null


-- Listar os Produtos que não tenham sido comprados


select * from [dbo].[d_order_items] O  with (nolock)

FULL OUTER JOIN [dbo].[p_products] p with (nolock)

ON O.products_id = P.products_id

WHERE O.products_id IS NULL


-- Listar os Produtos sem Estoque;

SELECT products_id
FROM [dbo].[p_products]
WHERE NOT EXISTS
(SELECT products_id FROM [dbo].[p_stocks] WHERE 1=1)


--Agrupar a quantidade de vendas que uma determinada Marca por Loja.

SELECT 
K.Column_brand_id,
SUM(CAST(j.quantity AS INT)) as quantity,
g.store_id

 FROM [dbo].[f_orders] g WITH (NOLOCK)

LEFT JOIN [dbo].[d_order_items] j  WITH (NOLOCK) ON G.order_id = J.f_orders_order_id

LEFT JOIN [dbo].[p_products] K  WITH (NOLOCK) ON J.products_id = K.products_id
 GROUP BY g.store_id, k.Column_brand_id
 


 --Listar os Funcionarios que não estejam relacionados a um Pedido.


SELECT  staff_id
FROM [dbo].[d_staffs]
WHERE NOT EXISTS
(SELECT staff_id FROM [dbo].[f_orders] WHERE 1=1)