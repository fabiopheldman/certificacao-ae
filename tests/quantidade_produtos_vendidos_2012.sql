{{
    config (
        severity = 'error'
    )
}}
WITH
    quantidade_produtos_vendidos_2012 AS (
        SELECT sum(venda_quantidade) AS quantidade_produtos_vendidos
        FROM {{ ref('fct_vendas') }}
        WHERE data_venda BETWEEN '2012-01-01' AND '2012-12-31'
    )
SELECT quantidade_produtos_vendidos
    FROM quantidade_produtos_vendidos_2012
WHERE quantidade_produtos_vendidos <> 69275