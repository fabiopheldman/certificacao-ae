WITH
    fonte_cartao_credito AS (
        SELECT *
        FROM {{ source('sap_adw', 'creditcard') }}
    )

    , renomear AS (
        SELECT	
            CAST(creditcardid AS INT) AS id_cartao_credito
            ,CAST(cardtype AS STRING) AS cartao_tipo
        FROM fonte_cartao_credito
    )

SELECT
    *
FROM renomear