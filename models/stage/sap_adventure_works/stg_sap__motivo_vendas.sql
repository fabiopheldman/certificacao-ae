WITH
    fonte_motivos_vendas AS (
        SELECT *
        FROM {{ source('sap_adw', 'salesreason') }}
    )

    , renomear AS (
        SELECT	
            CAST(salesreasonid AS INT) AS id_motivo_venda	
            ,CAST(name AS STRING) AS motivo_venda
            ,CAST(reasontype AS STRING) AS tipo_venda				
        FROM fonte_motivos_vendas
    )

SELECT
    *
FROM renomear