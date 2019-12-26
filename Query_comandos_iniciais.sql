-- Alguns comandos que s�o importantes (e como us�-los); 

   --                  Criando o banco de dados;                                    
   --   ex:
			create database db_loja -- 'nome do banco'

   /*
   --   			   Usando o banco de dados;										
		ex:	
			use db_loja


   -- 				   Criando uma tabela;							
		ex: 
			create table tab_produtos 
		{
		  id_prod int auto_increment primary key, 
			nome_prod varchar(50), 
			 preco_prod double
		}


   --                  Inserir dados numa tabela: INSERT INTO;

		ex: 
		  insert into tab_fornecedores -- 'nome da tabela' (coluna_A, coluna_B)
			values (-- dados pra coluna_A, dados para a coluna_B);

			  insert into tab_fornecedores (cod_fornec, nome_fornec)
				values (1, "Jos�")
					
		-- Adicionando v�rios dados de uma s� vez;
		  insert into tab_produtos 
			values (100, "Monitor", 12, 550.00, 1), 
					(101, "Roteador", 8, 130.00, 1),
					 (102, "Pendrive", 15, 40.00, 1),
					  (103, "Mouse USB", 1, 70.00, 1)


  --                   Efetuar consultas trazendo colunas espec�ficas: SELECT * FROM          
	  
	   ex:
	    -- Fazendo a busca em uma tabela e trazendo uma coluna espec�fica;
		    select cod_fornec from tab_fornecedores

	    -- Fazendo a busca em uma tabela e trazendo mais de uma coluna;
		    select cod_fornec, nome_fornec from tab_fornecedores 

		-- Fazendo a busca em uma tabela com FILTROS: SELECT * FROM WHERE
		    select nome_fornec from tab_fornecedores where cod_fornec = 1

		

  --			     Alterar um registro na tabela, atualizar as informa��es: UPDATE              
   
	  ex:
	  -- Atualizando os pre�os de um produto;
		  update tab_produtos 'nome da tabela' set preco_prod 'nome da coluna' = 630.00 where id_prod = 1 
													-- o where � obrigat�rio para identificar onde vai ser atualizado; 


  --			     Excluindo registros 'dentro' de uma tabela: DELETE FROM

	 ex:
		 delete from tab_produtos where id_prod = 1;
				-- ATEN��O: Ao n�o fazer uso do comando 'where' � bem provav�l que exclua mais que o registro que queria apagar; 


  --                Trazendo dados de duas ou mais tabelas, dados relacionais: INNER JOINS;
					-- Outros joins: left join, right join, full join

	 ex: 

		  select nome_prod, nome_fornec                            -- nome das colunas que queremos apresentar, que est�o RELACIONADAS;
		   from tab_fornec                                         -- listando um das tabelas, que tem a chave prim�ria (primary key);
		    inner join tab_produtos                                -- nome da tabela onde fica a chave a chave estrangeira (fore.. key); 
			 on tab_fornec.cod_fornec = tab_produtos.cod_fornec;   -- especificando com o 'on' qual os campos que fazem a liga��o; 

			  -- Esse comando permite que eu traga dados da tabela_A e da tabela_B, desde que elas tenham um relacionamento entre-si;
				-- Assim � poss�vel aprsentar mais dados de tabelas diferentes;


          -- inner join = traz o que h� em comum entre as duas tabelas; 
		   -- left join = d� prioridade a tabela da esquerda, ou seja, ele vai trazer todos os dados da tabela da esquerda;
		      -- independentemente se a informa��o, o dado, t� ligada ou n�o a tabela da direita;

		  -- right join = faz o mesmo que o left, s� que pra tabela da direita; 
		   -- full join = vai trazer as informa��es das duas tabelas, obrigat�riamente
			 
		***	 Estrutura dos joins:

			 select tabela_a, tabela_b
				from tabela_a 
				  inner join tabela_b
					 on tabela_a.codigo = tabela_b.codigo


		*** O full join n�o existe no sql, mas h� uma forma (macete) de pegar todos os dados, e for�ar: UNION;
		   -- O comando UNION junta o comando de cima com o comando de baixo, fazendo a busca dos dois

			 select tabela_a, tabela_b
				from tabela_a 
				  left join tabela_b
					 on tabela_a.codigo = tabela_b.codigo
				union 
			 select tabela_a, tabela_b
				from tabela_a 
				  right join tabela_b
					 on tabela_a.codigo = tabela_b.codigo


  --				Outros comandos: ORDER BY - Serve para organizar.
		 
	ex: 
		 select nome_prod, preco_prod from tab_produtos order by nome_prod
  
  --				Excluir de vez: TRUNCATE
	ex: 
		 truncate table tab_produtos  
		   -- Excluindo a tabela;
			 
		 truncate database loja
		   -- Excluindo o banco;
*/