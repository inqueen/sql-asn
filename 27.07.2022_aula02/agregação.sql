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

SELECT COUNT( DISTINCT idProduct) AS qtProduto
FROM silver_olist.products
WHERE descCategoryName = 'perfumaria'

-- COMMAND ----------

SELECT 
    descCategoryName,
    COUNT( DISTINCT idProduct) AS qtProduto,
    ROUND(AVG(vlWeightGramas) / 100, 2) AS vlPeso
FROM silver_olist.products
GROUP BY descCategoryName

-- COMMAND ----------


