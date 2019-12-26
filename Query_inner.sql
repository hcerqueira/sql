/*	
	select 
		pedido.num_pedido, pedido.dt_abertura_pedido, pedido.st_pedido, pedido.cd_unidade, itemPedido.cd_produto, 
		produto.descr_produto, produto.cd_categoria, itemPedido.vl_venda, itemPedido.qtd_item 
	from		
		tab_pedido as Pedido 
			inner join tab_item_pedido as itemPedido  on (pedido.num_orcamento = itemPedido.num_orcamento)
			inner join tab_produto as produto  on (produto.cd_produto = itemPedido.cd_produto)
	where		
		pedido.num_pedido in (1, 2)
*/

/*
	select 
		pedido.num_pedido, pedido.dt_abertura_pedido, pedido.st_pedido, pedido.cd_unidade, item.cd_produto, 
		produto.descr_produto, produto.cd_categoria, item.vl_venda, item.qtd_item 
	from 
		tab_pedido as Pedido
		  inner join tab_item_pedido as Item 
			on (pedido.num_pedido = item.num_pedido)
		  inner join tab_produto as Produto 
			on (produto.cd_produto = item.cd_produto) 
*/	
		
/*
		select ST_ETIQUETA from TAB_ETIQUETA
		select ST_ETIQUETA from TAB_ETIQUETA_LOG
	

	select 
		Etiqueta.cd_etiqueta, LogE.cd_etiqueta, etiqueta.ST_ETIQUETA, LogE.ST_ETIQUETA
	from 
		TAB_ETIQUETA as Etiqueta
		inner join TAB_ETIQUETA_LOG as LogE
			on (Etiqueta.CD_ETIQUETA = LogE.CD_ETIQUETA)
	where 
		Etiqueta.ST_ETIQUETA in (1,10)
	order by Etiqueta.ST_ETIQUETA desc
*/


/*
select 
		Etiqueta.cd_etiqueta, LogE.cd_etiqueta, etiqueta.ST_ETIQUETA, LogE.ST_ETIQUETA
	from 
		TAB_ETIQUETA as Etiqueta
		inner join TAB_ETIQUETA_LOG as LogE
			on (Etiqueta.CD_ETIQUETA = LogE.CD_ETIQUETA)

	where 
		etiqueta.CD_ETIQUETA = '11392273'

*/

/* select CD_OPERADOR from TAB_ETIQUETA_LOG
select CD_OPERADOR from TAB_OPERADOR

select 
	Etiqueta.CD_ETIQUETA as Etiqueta, Operador.CD_OPERADOR as CódigoOperador, Operador.NM_OPERADOR as Nome, Operador.LOGIN_OPERADOR, Operador.ST_OPERADOR 
from tab_etiqueta_log as Etiqueta 
	inner join tab_operador as Operador 
		on (Etiqueta.cd_operador = Operador.CD_OPERADOR)
where 
	Operador.ST_OPERADOR = 'Ativo'
	order by Operador.LOGIN_OPERADOR asc
*/

/*
select cd_item_pedido, vl_venda,
    case
    when vl_venda < 10 
		then vl_venda * 0.9
    when vl_venda >= 10 and vl_venda < 13 
		then vl_venda * .8
    else
        vl_venda * .7
    end resultado
    from tab_item_pedido
	where cd_item_pedido between 1 and 100
	
*/



--	select VL_VENDA from TAB_ITEM_PEDIDO where VL_VENDA between 10 and 100
	-- select * from TAB_ITEM_PEDIDO  
	-- cd_item_produto
	












