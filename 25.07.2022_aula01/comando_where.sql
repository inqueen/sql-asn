-- Databricks notebook source
SELECT *
FROM bronze_olist.olist_sellers_dataset
LIMIT 5;

-- COMMAND ----------

SELECT COUNT(0)
FROM bronze_olist.olist_sellers_dataset
WHERE seller_state = 'RJ' -- case sensitive

-- COMMAND ----------

SELECT COUNT(*)
FROM bronze_olist.olist_orders_dataset
WHERE order_delivered_carrier_date > order_estimated_delivery_date -- FILTRO 

-- show columns from bronze_olist.olist_orders_dataset -- APENAS PARA VER OS NOMES DAS COLUNAS

-- describe table bronze_olist.olist_orders_dataset -- PARA OBTER OS TIPOS DE DADOS

-- COMMAND ----------

SELECT COUNT(*)
FROM bronze_olist.olist_orders_dataset
WHERE date(order_delivered_carrier_date) > date(order_estimated_delivery_date) -- FILTRO 

-- COMMAND ----------

SELECT customer_id,
       date(order_delivered_carrier_date) AS entrega,
       date(order_estimated_delivery_date) AS prometida
FROM bronze_olist.olist_orders_dataset
WHERE date(order_delivered_carrier_date) > date(order_estimated_delivery_date) -- FILTRO 

-- COMMAND ----------


