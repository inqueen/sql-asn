-- Databricks notebook source
SELECT *, 
  CASE WHEN descState = 'SP' THEN 'paulista' 
       WHEN descState = 'RJ' THEN 'fluminense'
  ELSE '---' END AS descCidadania
FROM silver_olist.sellers

-- COMMAND ----------

SELECT *,
    CASE WHEN DATE(dtDeliveredCustomer) > DATE(dtEstimatedDelivered) THEN 'Atraso'
    ELSE 'Entregue' END AS status,
    
    CASE WHEN DATE(dtDeliveredCustomer) > DATE(dtEstimatedDelivered) THEN 1
    ELSE 0 END AS flag

FROM silver_olist.orders

-- COMMAND ----------

SELECT *, 
      CASE WHEN vlFreight / (vlPrice + vlFreight) <= 0.10 THEN '10%'
           WHEN vlFreight / (vlPrice + vlFreight) > 0.10 AND <= 0.25 THEN '10% a 25%'
           WHEN vlFreight / (vlPrice + vlFreight) > 0.25 AND <= 0.50 THEN '25% a 50%'
           ELSE '+50%'
      END AS flValue

FROM silver_olist.order_items --CORRIGIR

-- COMMAND ----------

SELECT *
FROM silver_olist.order_items

-- COMMAND ----------


