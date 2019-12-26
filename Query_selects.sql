-- Comando select para trazer todos os dados da Tabela...
	select * from tab_item_pedido

-- Comando select para trazer uma coluna especifica...
	select vl_venda from tab_item_pedido 

-- Comando select para trazer um dado igual ao valor citado
	select vl_venda from tab_item_pedido where vl_venda = 9

-- Comando select para trazer um dado diferente, não exibir o item
	select vl_venda from tab_item_pedido where vl_venda <> 9

-- Comando select para trazer os itens maiores que o valor citado
	select vl_venda from tab_item_pedido where vl_venda > 9

-- Comando select para trazer os itens menores que o valor citado
	select vl_venda from tab_item_pedido where vl_venda < 9

-- Comando select para trazer dados entre uma coisa e outra 
	select vl_venda from tab_item_pedido where vl_venda between 1 and 9

-- Comando para trazer uma sequência de caracteres
	select cd_etiqueta from tab_item_pedido where cd_etiqueta like 'NS%'

-- Comando select para verificar valores (comparando-os)
	select vl_venda from tab_item_pedido where vl_venda in (9, 20)
	select cd_etiqueta from tab_item_pedido where cd_etiqueta in ('NS-743846','18031000155229', 'NS-238264')

-- Comando select AND E OR 
	select vl_venda, cd_etiqueta from tab_item_pedido where vl_venda = 9 and cd_etiqueta like 'NS%'
	select vl_venda, cd_etiqueta from tab_item_pedido where vl_venda = 9 or cd_etiqueta like 'NS%'

-- Comando para somar 


