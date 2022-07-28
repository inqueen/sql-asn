-- Databricks notebook source
SELECT COUNT(*) As qtLinhas, -- numero de linhas 
       COUNT( DISTINCT idSeller ) AS qtSeller, -- sellers únicos
       COUNT( DISTINCT descState) AS qtDistinctStates -- Estados distintos
       COUNT(descState) AS qtDistinctStates -- Estados não nulos
       
       FROM silver_olist.sellers

-- COMMAND ----------

SELECT 
      COUNT( DISTINCT idOrder ) AS qtPedidos,
      AVG(DATEDIFF(dtDeliveredCustomer, dtEstimatedDelivered)) AS avgDiasAtraso,
      STD(DATEDIFF(dtDeliveredCustomer, dtEstimatedDelivered)) AS avgDiasAtraso
FROM silver_olist.orders
WHERE DATE(dtDeliveredCustomer) > DATE(dtEstimatedDelivered)

-- COMMAND ----------


