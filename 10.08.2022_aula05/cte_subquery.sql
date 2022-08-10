-- Databricks notebook source
SELECT -- NAO FAZER ISSO NO TRAMPO PELO AMOR DE JESUS
  * 
FROM
  (
    SELECT
      *,
      CASE
        WHEN descCity = 'sao paulo' THEN 'paulistano'
        WHEN descCity = 'campinas' THEN 'campineiro'
        ELSE '---'
      END AS desNaturalidade
    FROM
      silver_olist.sellers
    WHERE
      descState = 'SP'
  )
WHERE
  desNaturalidade = 'campineiro'

-- COMMAND ----------

WITH sellers_paulistas AS (
  SELECT
    *,
    CASE
      WHEN descCity = 'sao paulo' THEN 'paulistano'
      WHEN descCity = 'campinas' THEN 'campineiro'
      ELSE '---'
    END AS desNaturalidade
  FROM
    silver_olist.sellers
  WHERE
    descState = 'SP'
)
SELECT
  *
FROM
  sellers_paulista
WHERE
  desNaturalidade = 'campineiro'

-- COMMAND ----------

WITH orders_freight AS (
  SELECT
    idOrder,
    ROUND(SUM(vlPrice), 2) AS vlPrice,
    ROUND(SUM(vlFreight), 2) AS vlFreight,
    CASE WHEN SUM(vlPrice) < SUM(vlFreight) THEN 1 ELSE 0 END AS flFreteCaro
  FROM silver_olist.order_items
  GROUP BY idOrder
), 

order_payment AS (

SELECT *,
         case when descType = 'boleto' then 1 else 0 end as fl_boleto,
         case when descType = 'not_defined' then 1 else 0 end as fl_not_defined,
         case when descType = 'credit_card' then 1 else 0 end as fl_credit_card,
         case when descType = 'voucher' then 1 else 0 end as fl_voucher,
         case when descType = 'debit_card' then 1 else 0 end as fl_debit_card

  FROM silver_olist.order_payment

),

order_qt_payment AS (

  SELECT 
        idOrder,
        MAX(fl_boleto) as qt_boleto,
        MAX(fl_not_defined) as qt_not_defined,
        MAX(fl_credit_card) as qt_credit_card,
        MAX(fl_voucher) as qt_voucher,
        MAX(fl_debit_card) as qt_debit_card

  FROM order_payment

  GROUP BY idOrder
)

select 
       flfreteCaro,
       count( distinct t1.idOrder) as qtPedido,
       ROUND(AVG(qt_boleto), 2) as avg_boleto,
       ROUND(AVG(qt_not_defined), 2) as avg_not_defined,
       ROUND(AVG(qt_credit_card), 2) as avg_credit_card,
       ROUND(AVG(qt_voucher), 2) as avg_voucher,
       ROUND(AVG(qt_debit_card), 2) as avg_debit_card
       

from orders_freight as t1

left join order_qt_payment as t2
on t1.idOrder = t2.idOrder

GROUP BY flfreteCaro
ORDER BY flfreteCaro

-- COMMAND ----------


