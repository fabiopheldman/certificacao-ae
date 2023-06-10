WITH
    fonte_ordens_vendas AS (
        SELECT *
        FROM {{ source('sap_adw', 'salesorderheader') }}
    )

    , renomear AS (
        SELECT	
            CAST(salesorderid AS INT) AS id_ordem_venda		
            ,CAST(customerid AS INT) AS id_cliente				
            ,CAST(salespersonid AS INT)	AS id_vendedor			
            ,CAST(territoryid AS INT) AS id_territorio				
            ,CAST(billtoaddressid AS INT) AS id_endereco_fatura				
            ,CAST(shiptoaddressid AS INT) AS id_endereco_entrega				
            ,CAST(shipmethodid AS INT) AS id_entrega_info			
            ,CAST(creditcardid AS INT) AS id_cartao_credito
            ,CAST(currencyrateid AS INT) AS id_taxa					
            ,CAST(orderdate AS DATETIME) AS data_venda			
            ,CAST(duedate AS DATETIME) AS data_vencimento		
            ,CAST(shipdate AS DATETIME)	AS data_entrega
            ,CAST(status AS INT) AS status_venda			
            ,CAST(subtotal AS DECIMAL) AS total_vendido
            ,CAST(taxamt AS DECIMAL) AS taxa_cambio
            ,CAST(freight AS DECIMAL) AS peso	
            ,CAST(totaldue AS DECIMAL) AS total_devido
        FROM fonte_ordens_vendas
    )

SELECT
    *
FROM renomear


	
		
