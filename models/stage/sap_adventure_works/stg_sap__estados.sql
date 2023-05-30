WITH
    fonte_estados AS (
        SELECT *
        FROM {{ source('sap_adw', 'stateprovince') }}
    )

    , renomear AS (
        SELECT
            CAST(stateprovinceid AS INT) AS id_estado
            ,CAST(territoryid AS INT) AS id_territorio			
            ,CAST(stateprovincecode AS STRING) AS cod_estado			
            ,CAST(countryregioncode AS STRING) AS cod_pais					
            ,CAST(name AS STRING) AS estado
        FROM fonte_estados
    )

SELECT
    *
FROM renomear