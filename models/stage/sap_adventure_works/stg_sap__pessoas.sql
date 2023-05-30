WITH
    fonte_pessoas AS (
        SELECT *
        FROM {{ source('sap_adw', 'person') }}
    )

    , renomear AS (
        SELECT	
            CAST(businessentityid AS INT) AS id_pessoa	
            ,CAST(firstname || ' ' || lastname AS STRING) AS pessoa_nome	
        FROM fonte_pessoas
    )

SELECT
    *
FROM renomear