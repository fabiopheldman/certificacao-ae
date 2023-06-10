WITH
    stg_ordens_vendas AS (
        SELECT
            *
        FROM {{ ref('stg_sap__ordens_vendas') }}
    )

    , stg_detalhes_vendas AS (
        SELECT
            *
        FROM {{ ref('stg_sap__detalhe_vendas') }}
    )

    , join_pedido_itens AS (
        SELECT
            pedidos.id_ordem_venda		
            , pedidos.id_cliente				
            , pedidos.id_vendedor			
            , pedidos.id_territorio				
            , pedidos.id_endereco_fatura				
            , pedidos.id_endereco_entrega				
            , pedidos.id_entrega_info			
            , pedidos.id_cartao_credito
            , pedidos.id_taxa
            , itens.id_produto					
            , pedidos.data_venda			
            , pedidos.data_vencimento		
            , pedidos.data_entrega			
            , pedidos.total_vendido
            , pedidos.taxa_cambio
            , pedidos.peso	
            , pedidos.total_devido
            , itens.venda_quantidade
            , itens.preco_unitario
        FROM stg_detalhes_vendas AS itens
        LEFT JOIN stg_ordens_vendas AS pedidos
            ON itens.id_ordem_venda = pedidos.id_ordem_venda
    )

SELECT 
    *
FROM join_pedido_itens
ORDER BY id_ordem_venda ASC