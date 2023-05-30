WITH
    fonte_endereco AS (
        SELECT *
        FROM {{ source('sap_adw', 'address') }}
    )

    , renomear AS (
        SELECT
            CAST(addressid AS INT) AS id_endereco			
            ,CAST(stateprovinceid AS INT) AS id_estado				
            ,CAST(addressline1 AS STRING) AS endereco				
            ,CAST(city AS STRING) AS cidade
        FROM fonte_endereco
    )

SELECT
    *
FROM renomear