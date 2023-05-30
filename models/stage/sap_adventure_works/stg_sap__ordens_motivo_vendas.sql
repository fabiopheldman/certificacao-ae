WITH
    fonte_ordens_motivo_vendas AS (
        SELECT *
        FROM {{ source('sap_adw', 'salesorderheadersalesreason') }}
    )

    , renomear AS (
        SELECT	
            CAST(salesorderid AS INT) AS id_ordem_venda	
            ,CAST(salesreasonid AS STRING) AS id_motivo_venda		
        FROM fonte_ordens_motivo_vendas
    )

SELECT
    *
FROM renomear