-- Databricks notebook source
SELECT DATE(COALESCE(dtApproved, dtDeliveredCarrier, dtPurchase)) As dtAprovado,
       COUNT(DISTINCT o.idOrder) AS qtPedidos,
       ROUND(SUM(vlPrice), 2) AS vlGrana

FROM silver_olist.orders AS o

LEFT JOIN silver_olist.order_items AS oi
ON o.idOrder = oi.idOrder
-- WHERE dtApproved IS NOT NULL
GROUP BY dtAprovado
ORDER BY vlGrana ASC
-- HAVING COUNT(DISTINCT o.idOrder) > 1

-- COMMAND ----------

SELECT idOrder,
      dtPurchase,
      dtApproved,
      dtDeliveredCarrier,
      
      CASE WHEN dtApproved IS NOT NULL THEN dtApproved -- ISSO É IGUAL O COALESCE QUE ESTÁ LOGO ABAIXO
           WHEN dtDeliveredCarrier IS NOT NULL THEN dtDeliveredCarrier
           WHEN dtPurchase IS NOT NULL THEN dtPurchase
           ELSE dtApproved
           END AS dtPedido,
           
           COALESCE(dtApproved, dtDeliveredCarrier, dtPurchase) AS dtPedido
           
FROM silver_olist.orders
WHERE dtApproved IS NULL



-- COMMAND ----------

SELECT t2.descCategoryName,
       COUNT(*) AS qtVendas,
       COUNT(DISTINCT t1.idOrder, t1.idOrderItem) AS qtVendas

FROM silver_olist.order_items AS t1

LEFT JOIN silver_olist.products AS t2
ON t1.idProduct = t2.idProduct

GROUP BY t2.descCategoryName
ORDER BY COUNT(*) DESC

-- COMMAND ----------



-- COMMAND ----------

SELECT 'dani' || ' ' || 'go go go'

-- COMMAND ----------

SELECT t2.descCategoryName,
       ROUND(AVG(vlPrice)) AS avgPreco,
       STD(vlPrice) AS stdPreco

FROM silver_olist.order_items AS t1

LEFT JOIN silver_olist.products AS t2
ON t1.idProduct = t2.idProduct

GROUP BY t2.descCategoryName
ORDER BY avgPreco DESC

-- COMMAND ----------

SELECT t2.descCategoryName,
       ROUND(AVG(t1.vlFreight)) AS avgFrete

FROM silver_olist.order_items AS t1
LEFT JOIN silver_olist.products AS t2
ON t1.idProduct = t2.idProduct
GROUP BY t2.descCategoryName
ORDER BY avgFrete DESC

-- COMMAND ----------

SELECT 
--        t1.idOrder,
--        t1.idOrderItem,
--        t1.vlFreight,
--        t2.idCustomer,
       t3.descState,
       ROUND(AVG(t1.vlFreight)) AS vlFrete

FROM silver_olist.order_items AS t1
LEFT JOIN silver_olist.orders AS t2
ON t1.idOrder = t2.idOrder

LEFT JOIN silver_olist.customers AS t3
ON t2.idCustomer = t3.idCustomer
GROUP BY t3.descState
ORDER BY vlFrete DESC

-- COMMAND ----------

SELECT 

-- t1.idOrder,

      CASE WHEN t1.vlPrice < t1.vlFreight THEN 1
      ELSE 0 END AS flFreteMaior,
      
--        t1.vlFreight,
--        t1.vlPrice,
       t2.descType,
       COUNT(t1.idOrder) AS qtPedido

FROM silver_olist.order_items AS t1

LEFT JOIN silver_olist.order_payment AS t2
ON t2.idOrder = t1.idOrder
GROUP BY flFreteMaior, t2.descType
ORDER BY t2.descType, flFreteMaior


-- FROM silver_olist.order_payment


-- COMMAND ----------


