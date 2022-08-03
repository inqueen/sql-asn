-- Databricks notebook source
SELECT descState 
      count(distinct idSeller) AS qtSellers
FROM silver_olist.sellers
GROUP BY descState
ORDER BY COUNT(DISTICT idSeller) DESC
LIMIT 1


-- COMMAND ----------

SELECT DATE(dtApproved) AS dtPedido,
      count(distinct idOrder) AS qtPedido
FROM silver_olist.orders
GROUP BY dtPedido
ORDER BY dtPedido


-- COMMAND ----------

select idOrder, count(*)
group by idOrder
having count(*) > 1

-- COMMAND ----------

select idCustomer, 
    count(*)
    from silver_olist.orders
    group by idCustomer
    having count(*) > 1

-- COMMAND ----------

select descCategoryName, 
avg(vlWeightGramas) AS avgPeso
from silver_olist.products
group by descCategoryName
order by avgPeso DESC
limit 1

-- COMMAND ----------

select distinct descCategoryName
from silver_olist.products
where descCategoryName like '%construcao%'
order by descCategoryName

-- COMMAND ----------

select distinct count(idProduct) as atProduto
from silver_olist.products
where descCategoryName in (

'casa_construcao',
'construcao_ferramentas_construcao',
'construcao_ferramentas_ferramentas',
'construcao_ferramentas_iluminacao',
'construcao_ferramentas_jardim',
'construcao_ferramentas_seguranca')

-- COMMAND ----------


