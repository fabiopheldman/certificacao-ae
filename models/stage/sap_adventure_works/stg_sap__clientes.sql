WITH
    fonte_clientes AS (
        SELECT *
        FROM {{ source('sap_adw', 'customer') }}
    )

    , renomear AS (
        SELECT
            CAST(customerid AS INT)	AS id_cliente			
            ,CAST(personid AS STRING) AS id_pessoa				
            ,CAST(storeid AS STRING) AS id_loja					
            ,CAST(territoryid AS STRING) AS id_territorio
        FROM fonte_clientes
    )

SELECT
    *
FROM renomear