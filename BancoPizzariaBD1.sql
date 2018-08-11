create database BancoPizzaria
use BancoPizzaria

  create table cidade(
	idcidade int auto_increment,
	cidade varchar (50)not null,
	id_endereco int,
    primary key (idcidade)
	) engine = InnoDB;

    create table estado(
	idestado int auto_increment,
	sigla char(2) not null,
	nome varchar (30)not null,
	id_endereco int,
    primary key (idestado)
	) engine = InnoDB;

    create table endereco (
	idendereco int auto_increment,
	numero_da_casa varchar (50),
	rua varchar(30),
	bairro varchar(50),
	id_cliente int,
    primary key (idendereco)
	) engine = InnoDB;

    create table cliente (
	idcliente int auto_increment,
	nome varchar(40) not null,
	sexo char (2),
	cpf varchar(10),
	email varchar(50),
	data_nascimento date,
	idade int (4),
    primary key (idcliente)
	) engine = InnoDB;
    
    create table telefone (
	idtelefone int auto_increment,
	numero varchar(30),
	tipo enum('cell','res'),
	id_cliente int,
    primary key (idtelefone)
	) engine = InnoDB;
    
    create table pedido(
	idpedido int auto_increment,
	numero_pedido varchar(30),
	tipos_atendimento varchar(30),
	valor_pedido decimal (10,2),
	data_pedido date,
	id_cliente int, 	
	id_funcionario int,
    primary key (idpedido)
	) engine = InnoDB;

    create table tipo_pagamento(
	idtipopag int auto_increment,
	tipo_pagamento varchar (30),
	id_pedido int,
    primary key (idtipopag)
	) engine = InnoDB;

    create table entrega(
	identrega int auto_increment,
	tipo_entrega varchar(30),
	data_entrega date,
	id_pedido int,
	id_funcionario int,
    primary key (identrega)
	) engine = InnoDB;
    
    create table veiculo(
	idveiculo int auto_increment,
	tipo_veiculo varchar(30),
	id_entrega int,
    primary key (idveiculo)
	);
    
    alter table veiculo  engine InnoDB;
    
    create table funcionario (
	idfuncionario int auto_increment,
	nome varchar (40),
	salario decimal (10,2),
	sexo char (2),
	cpf varchar (15),
	funcao varchar (50),
    primary key (idfuncionario)
	) engine = InnoDB;

    create table tel_funcionario(
	idtelfuncionario int auto_increment,
	numero varchar (30),
	id_funcionario int,
    primary key (idtelfuncionario)
	) engine = InnoDB;

    create table itens_pedido(
	iditenspedido int auto_increment,
	tipo_pizza varchar (30),
    bebida varchar (30),
    id_pedido int,
    primary key (iditenspedido)
	) engine = InnoDB;
    
    create table pizza(
	idpizza int auto_increment,
	tamanho varchar (30),
	preco decimal(10,2),
	sabor varchar (30),
	nome_pizza varchar (30),
	id_itens_pedido int,
    id_ingredientes int,
    primary key (idpizza)
	) engine = InnoDB;
    
    create table ingredientes (
	idingrediente int auto_increment,
	tipo_frios varchar (30),
	tipo_molhos varchar (30),
    primary key (idingrediente)
	) engine = InnoDB;
    
	alter table cidade 
	add constraint fk_cidade_endereco
	foreign key (id_endereco)
	references endereco(idendereco);
    
    alter table cidade drop foreign key fk_cidade_endereco

    alter table endereco add constraint fk_endereco_cliente
    foreign key (id_cliente) references cliente(idcliente);
    
    alter table estado add constraint fk_estado_endereco
    foreign key (id_endereco) references endereco(idendereco);
    
    alter table estado drop foreign key fk_estado_endereco;
    
    
    alter table telefone add constraint fk_telefone_cliente
	foreign key (id_cliente) references cliente(idcliente);
    
    alter table pedido add constraint fk_pedido_cliente
	foreign key(id_cliente) references cliente(idcliente);
    
    alter table pedido add constraint fk_pedido_funcionario
    foreign key(id_funcionario) references funcionario(idfuncionario);
    
    alter table tipo_pagamento add constraint fk_tipo_pagamento_pedido
    foreign key (id_pedido) references pedido(idpedido); 
    
    alter table entrega add constraint fk_entrega_pedido
	foreign key(id_pedido) references pedido(idpedido);
    
    alter table veiculo add constraint fk_veiculo_entrega
	foreign key(id_entrega) references entrega(identrega);
    
    alter table veiculo drop foreign key fk_veiculo_entrega
    
    alter table entrega add constraint fk_entrega_funcionario
	foreign key(id_funcionario) references funcionario(idfuncionario);
    
	alter table tel_funcionario add constraint fk_tel_funcionario_funcionario
	foreign key(id_funcionario) references funcionario(idfuncionario);
    
	alter table itens_pedido add constraint fk_iten_pedido_pedido
	foreign key(id_pedido) references pedido(idpedido);
    
    alter table pizza add constraint fk_pizza_itens_pedido
	foreign key(id_itens_pedido) references itens_pedido(iditenspedido);
    
	alter table pizza add constraint fk_pizza_ingredientes
	foreign key(id_ingredientes) references ingredientes(idingrediente);
	
    -- Insert Estado
    INSERT INTO ESTADO VALUES(1,'SP','SAO PAULO',1);
    INSERT INTO ESTADO VALUES(2,'BA','SALVADOR',2);
	INSERT INTO ESTADO VALUES(3,'RN','RIO GRANDE DO NORTE',3);
	INSERT INTO ESTADO VALUES(4,'RS','RIO GRANDE DO SUL',4);
	INSERT INTO ESTADO VALUES(5,'SC','SANTA CATARINA',5);
	INSERT INTO ESTADO VALUES(6,'MT','MATO GROSSO',6);
	INSERT INTO ESTADO VALUES(7,'MS','MATO GROSSO DO SUL',7);
	INSERT INTO ESTADO VALUES(8,'PE','PERNANBUCO',8);
	INSERT INTO ESTADO VALUES(9,'TO','TOCANTINS',9);
	INSERT INTO ESTADO VALUES(10,'AM','AMAZONAS',10);
    
    select * from estado;
    
    -- Insert Cidade
    INSERT INTO CIDADE VALUES(1,'CAMPINAS',1);
	INSERT INTO CIDADE VALUES(2,'UBAIRA',2);
	INSERT INTO CIDADE VALUES(3,'NATAL',3);
	INSERT INTO CIDADE VALUES(4,'PORTO ALEGRE',4);
	INSERT INTO CIDADE VALUES(5,'FLORIPA',5);
	INSERT INTO CIDADE VALUES(6,'CUIBA',6);
	INSERT INTO CIDADE VALUES(7,'CAMPO GRANDE',7);
	INSERT INTO CIDADE VALUES(8,'OLINDA',8);
	INSERT INTO CIDADE VALUES(9,'PALMAS',9);
	INSERT INTO CIDADE VALUES(10,'MANAUS',10);

    -- Insert Cliente
    insert into cliente values(1,'Romeu','M','1245659878-58','romeu@hot.com','1998-05-25',20);
	insert into cliente values(2,'Julia','F','5484455448-58','julia@hot.com','1994-04-15',24);
	insert into cliente values(3,'Roni','M',' 1236598814-14','roni@hotmail.com','1977-08-14',34);
	insert into cliente values(4,'Julio','M','1258455412-58','julio@yahoo.com','1988-09-05',65);
	insert into cliente values(5,'Diogo','M','511155855-89','diogo@yahoo.com','1999-05-25',79);
	insert into cliente values(6,'Kleber','M','658947814-69','kleber@outlook.com','1998-05-06',54);
	insert into cliente values(7,'Maria','F','1245659878-25','maria@hot.com','2006-05-06',58);
	insert into cliente values(8,'Rita','F','458965141-98','rita@hotmail.com','1969-08-19',60);
	insert into cliente values(9,'Rosilda','M','8969894514-87','rosil@hotmail.com','1960-10-21',87);
	insert into cliente values(10,'Mariela','F','51551515158-56','mariela@hot.com','1994-10-12',100);
    
    select *, date_format(data_nascimento, '%d-%m-%Y') as data_nasc from cliente;
    -- Passando data nascimento do cliente para formato Brasileiro

    select * from cliente;
	-- Insert Endereço
    insert into endereco values(1,'234','rua 1','lapa',1);
	insert into endereco values(2,'96','rua 2','centro',2);
	insert into endereco values(3,'23','rua 3','estacio',3);
	insert into endereco values(4,'24','rua 4','ipiranga',4);
	insert into endereco values(5,'34','rua 5','nacoes',5);
	insert into endereco values(6,'284','rua 6','roma',6);
	insert into endereco values(7,'274','rua 7','sao francisco',7);
	insert into endereco values(8,'124','rua 8','sao judas',8);
	insert into endereco values(9,'874','rua 9','bandeirantes',9);
	insert into endereco values(10,'704','rua 10','lapa',10);
    
    -- Insert Telefone
    insert into telefone values(1,'3884-8969','cell',1);
	insert into telefone values(2,'1458-8969','res',2);
	insert into telefone values(3,'5698-4514','res',3);
	insert into telefone values(4,'7898-5689','cell',4);
	insert into telefone values(5,'1445-8914','cell',5);
	insert into telefone values(6,'2398-8965','res',6);
	insert into telefone values(7,'3884-1466','cell',7);
	insert into telefone values(8,'4565-1245','res',8);
	insert into telefone values(9,'1245-7898','cell',9);
	insert into telefone values(10,'7845-4598','res',10);

   -- Insert Funcionários
    insert into funcionario values(1,'Crislaine',2000.00,'F','511614577-89','atendente');
	insert into funcionario values(2,'Neilton',2500.00,'M','  258788444-53','Entregador');
	insert into funcionario values(3,'Samanta',1000.00,'F','   511615672-54','Atendente');
	insert into funcionario values(4,'Roger',2000.00,'M','135246589-14','Entregador');
	insert into funcionario values(5,'Luiz',2000.00,'M',' 255455454-45','Entregador');
	insert into funcionario values(6,'Paulo',2000.00,'M','569852112-45','Entregador');
	insert into funcionario values(7,'Eliza',2400.00,'F','145874691-89','Atendente');
	insert into funcionario values(8,'Rosimara',2040.00,'F',' 645698855-87','Atendente');
	insert into funcionario values(9,'Helena',2050.00,'F','123569845-10','Atendente');
	insert into funcionario values(10,'Olivia',6000.00,'F','789962252-15','Atendente');
    
   -- Insert Pedidos
    insert into pedido values(1,'200','Mesa',50.00,'2018-12-25',1,1);
	insert into pedido values(2,'201','Entrega',65.00,'2018-12-28',2,2);
	insert into pedido values(3,'202','Mesa',78.00,'2018-12-25',3,3);
	insert into pedido values(4,'203','Entrega',100.00,'2018-12-25',4,4);
	insert into pedido values(5,'204','Entrega',34.00,'2018-12-25',5,5);
	insert into pedido values(6,'205','Entrega',50.00,'2018-12-26',6,6);
	insert into pedido values(7,'206','Mesa',78.00,'2018-12-26',7,7);
	insert into pedido values(8,'207','Mesa',58.00,'2018-12-28',8,8);
	insert into pedido values(9,'208','Balcao',45.00,'2018-12-30',9,9);
	insert into pedido values(10,'209','Mesa',40.00,'2018-12-27',10,10);
    -- Formatando a data de pedido pro padrão Brasileiro
	select *, date_format(data_pedido, '%d-%m-%Y') as data_pedido_br from pedido;
    select * FROM pedido

   -- Insert Pagamento
    insert into tipo_pagamento values(1,'Debito',1);
	insert into tipo_pagamento values(2,'Credito',2);
	insert into tipo_pagamento values(3,'Dinheiro',3);
	insert into tipo_pagamento values(4,'Debito',4);
	insert into tipo_pagamento values(5,'Credito',5);
	insert into tipo_pagamento values(6,'Dinheiro',6);
	insert into tipo_pagamento values(7,'Dinheiro',7);
	insert into tipo_pagamento values(8,'Debito',8);
	insert into tipo_pagamento values(9,'Credito',9);
	insert into tipo_pagamento values(10,'Dinheiro',10);
    
   -- Insert Veículo
    insert into veiculo values(1,'Moto',1,'Titan 150');
	insert into veiculo values(2,'Moto',2,'Fan 125');
	insert into veiculo values(3,'Moto',3,'Twister 250');
	insert into veiculo values(4,'Moto',4,'Fan 125');
    
    select * from veiculo
    
   -- Insert Entrega
	insert into entrega values(1,'Moto','2018-12-28',2,1);
	insert into entrega values(2,'Moto','2018-12-25',4,2);
	insert into entrega values(3,'Moto','2018-12-25',5,3);
	insert into entrega values(4,'Moto','2018-12-26',6,4);
	-- Formatando data de entrega pro formato Brasileiro
    select *, date_format(data_entrega, '%d-%m-%Y') as data_entrega_br from entrega;
    select * from entrega
 
  -- Insert Tel do Funcionário
    insert into tel_funcionario values(1,'1256-8969',1);
	insert into tel_funcionario values(2,'5698-4514',2);
	insert into tel_funcionario values(3,'4587-1565',3);
	insert into tel_funcionario values(4,'1248-6589',4);
	insert into tel_funcionario values(5,'8969-1247',5);
	insert into tel_funcionario values(6,'1245-1477',6);
	insert into tel_funcionario values(7,'7845-7812',7);
	insert into tel_funcionario values(8,'6598-8888',8);
	insert into tel_funcionario values(9,'1488-3254',9);
	insert into tel_funcionario values(10,'7784-4747',10);
    
 -- Insert dos Itens Pedidos
    insert into itens_pedido values(1,'Mussarela','Coca-cola',1,'grande');
	insert into itens_pedido values(2,'California','Coca-cola',2,'media');
	insert into itens_pedido values(3,'Banana','Fanta',3,'pequena');
	insert into itens_pedido values(4,'Doce de leite','Coca-cola',4,'grande');
	insert into itens_pedido values(5,'Suprema','Coca-cola',5,'media');
	insert into itens_pedido values(6,'4 Queijos','Coca-cola',6,'grande');
	insert into itens_pedido values(7,'Presunto','Coca-cola',7,'grande');
	insert into itens_pedido values(8,'Portuguesa','Coca-cola',8,'pequena');
	insert into itens_pedido values(9,'Milho','Fanta',9,'grande');
	insert into itens_pedido values(10,'Lombo','Fanta',10,'media');
    
    SELECT * FROM ITENS_PEDIDO
  -- Insert Ingredientes
    insert into ingredientes values(1,'Queijo','tradicional');
	insert into ingredientes values(2,'Queijo','tradicional');
	insert into ingredientes values(3,'Queijo','tradicional');
	insert into ingredientes values(4,'Coco','tradicional');
	insert into ingredientes values(5,'Champignon','tradicional');
	insert into ingredientes values(6,'Queijo','tradicional');
	insert into ingredientes values(7,'Presunto','tradicional');
	insert into ingredientes values(8,'Presunto','tradicional');
	insert into ingredientes values(9,'Presunto','tradicional');
	insert into ingredientes values(10,'Lombo canadense','tradicional');
    
 -- Insert Pizzas
    insert into pizza values(1,'Grande',30.00,'Salgada','Mussarela',1,1);
	insert into pizza values(2,'Media',33.00,'Doce','California',2,2);
	insert into pizza values(3,'Pequena',35.00,' Doce ','Banana',3,3);
	insert into pizza values(4,'Grande',37.00,'Doce ','Doce de leite',4,4);
	insert into pizza values(5,'Media',39.00,' Doce ','Suprema',5,5);
	insert into pizza values(6,'Grande',30.00,'Salgada','4 Queijos',6,6);
	insert into pizza values(7,'Grande',43.00,'Salgada','Presunto',7,7);
	insert into pizza values(8,'Pequena',30.00,'Salgada','Portuguesa',8,8);
	insert into pizza values(9,'Grande',90.00,'Doce','Milho ',9,9);
	insert into pizza values(10,'Media',22.00,'Salgada','Lombo',10,10);
    
    alter table estado add column id_cidade int   
    alter table estado add foreign key (id_cidade) references cidade (idcidade)
    
    alter table veiculo add foreign key (id_entrega) references entrega (identrega)


     -- Exercício A)
       select  * ,c.nome,e.bairro,c.sexo,t.cidade,c.idade, count(*)as total from  cliente c
	   inner join endereco e
	   on e.id_cliente = c.idcliente
	   inner join cidade t
	   on t.id_endereco = e.idendereco;	
	
    -- Exercício B)
      select nome_pizza, preco, tipo_frios, tipo_molhos, sabor from pizza 
	  inner join ingredientes
	  on id_ingredientes = idingrediente
	  group by sabor;
      
   -- Exercício C)
      
    SELECT COUNT(*) FROM pedido
    where data_pedido = '2018-12-25'; -- Aqui seleciona a quantidade de pedidos de um determinado dia, mes e ano, no padrao NA
   
   select   data_pedido , date_format(data_pedido,'%d-%m-%y')as brasil from pedido ; -- Aqui converte padrão NA para BR
   

   -- Exercício D)
	select * from pedido 
	where data_pedido ='2018-12-25';
    
    
   -- Exercício E)
    select tipo_pagamento , valor_pedido,data_pedido from pedido
	inner join tipo_pagamento
	on id_pedido = idpedido
	where data_pedido = '2018-12-25';


    -- Exercício F)
    select e.data_entrega,f.funcao,p.numero_pedido 
	from entrega e
	inner join funcionario f
	on f.idfuncionario = e.id_funcionario
	inner join pedido p
	on e.id_pedido = p.idpedido
	where funcao = 'Entregador';	-- Ao invés de Motoboy, chamei como Entregador
	
    
    
    -- Exercício G)
	
	select nome_pizza,tipo_frios from pizza
    inner join ingredientes
    on idingrediente = id_ingredientes
	where tipo_frios = 'Queijo';
    


alter table tb_veiculo rename veiculo









    



