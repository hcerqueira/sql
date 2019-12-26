		-- Usando um banco espec�fico: 
			use DB_LOGIN_DEV;

		--  A QUERY precisa trazer os seguintes dados:
		-- 1A PLAN: Pedido, DataPedido, StatusPedido, UnidadePedido, CodPedido, Produto, CategoriaPedido, valorUnitario, qntdPedido, valorTotal;
		-- 2A PLAN: Pedido, DataPedido, StatusPedido, UnidadePedido, ValorPedido;

		-- Planilha 1;
			select 
		-- setando a tabela e a coluna que quero trazer (Ex: tabela_col_tabela)
			pedido.num_pedido, pedido.dt_abertura_pedido, pedido.st_pedido, pedido.cd_unidade, itemPedido.cd_produto, 
			produto.descr_produto, produto.cd_categoria, itemPedido.vl_venda, itemPedido.qtd_item 
			
		-- renomeando a tabela pedido para simplificar, somente.
			from tab_pedido as Pedido 
			
		-- o inner join busca a rela��o entre duas ou mais tabelas,
			inner join tab_item_pedido as itemPedido  on (pedido.num_orcamento = itemPedido.num_orcamento)
			inner join tab_produto as produto  on (produto.cd_produto = itemPedido.cd_produto)

		-- o where � s� pra limitar o tanto de informa��es que a Query vai trazer, para ser mais r�pida, filtrando ainda mais.
		-- trazendo pedidos que tenham o n�mero de pedido 1 e 2;
			where pedido.num_pedido in (1, 2)



		-- Planilha 2;
			select 
			pedido.num_pedido, pedido.dt_abertura_pedido, pedido.st_pedido, pedido.cd_unidade, itemPedido.vl_venda
			
			from tab_pedido as Pedido 
			inner join tab_item_pedido as itemPedido on (pedido.num_orcamento = itemPedido.num_orcamento)
			inner join tab_produto as produto on (produto.cd_produto = itemPedido.cd_produto)
			
			where pedido.num_pedido in (1, 2)
