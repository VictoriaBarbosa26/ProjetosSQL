Create Database Pizzaria;
use Pizzaria;

/*1*/ Create Table Clientes(
ID int primary key,
Nome varchar (100),
Telefone varchar (15),
Endereco varchar (200),
CPF varchar (12));

/*2*/ Insert into Clientes(
ID,
Nome,
Telefone,
Endereco,
CPF)
Values  
	(1,'Amanda Garcia','(11)946299007','Rua Ouro Fino - 34','089935378-12'),
    (2,'Julio Gonçalves','(12)936473827','Avenida castelo Branco - 264','947728029-14'),
    (3,'Marta Vasconcelhos','(12)908976554','Avenida Diamante Rosa - 24367','12345678-09'),
    (4,'Bruna Marquezine','(11)957489004','Avenida Castelo Preto - 1023','98789092-78'),
    (5,'Eduarda Vinart','(12)908564778','Rua Pedra Lavada - 342','018876548-12');
select * from Clientes;

/*1*/ Create table Pedidos (
ID int primary key,
ClienteID int references Clientes (ID),
DataPedido datetime,
ValorTotal numeric (4,2));

/*2*/ Insert into Pedidos(
ID,
ClienteID,
DataPedido,
ValorTotal)
Values  
	(11,'1','20230831','104.89'),
    (12,'2','20230701','67.90'),
    (13,'3','20230909','56.99'),
    (14,'4','20230405','1023.89'),
	(15,'5','20230908','100.90'),
	(16,'5','20230907','122.90');
select * from Pedidos;
    
/*1*/ Create Table Pizzas (
ID int primary key,
Nome varchar (100),
Tamanho varchar (10),
Preco numeric (4,2));

/*2*/ Insert into Pizzas(
ID,
Nome,
Tamanho,
Preco)
Values  
	(22,'Ninho','Broto','15.99'),
    (33,'Beijinho','Broto','12.90'),
    (44,'Calabresa','Familia','35.99'),
    (55,'Mussarela','Familia','40.99'),
    (66,'Portuguesa','Gigante','67.90');
select * from Pizzas;


/*1*/ Create Table Ingredientes(
ID int primary key,
Nome varchar (50),
QuantidadeDisponivel Varchar(10));

/*2*/ Insert into Ingredientes(
ID,
Nome,
QuantidadeDisponivel)
Values  
	(01,'Farinha','50 kilos'),
    (02,'Milho','4 kilos'),
    (03,'Calabresa','20 Kilos'),
    (04,'Leite Ninho','5 Kilos'),
    (05,'Mussarela','9 Kilos');
select * from Ingredientes;


/*1*/ Create Table Funcionarios(
ID int primary key,
Nome varchar(100),
Cargo varchar(50),
DataContratacao datetime);

/*2*/ Insert into Funcionarios(
ID,
Nome,
Cargo,
DataContratacao)
Values  
	(123,'Trevor White','Faxineiro','20210202'),
    (124,'Atlas Corrigan','Pizzaiolo','20220808'),
    (125,'Lily Bloom','Entregadora','20230404'),
    (126,'Sara Scoot','Caixista','20210708'),
    (127,'Victória Barbosa','Gerente','20200905');
select * from Funcionarios;



/*3 - Calcular a média de valores totais gastos em todos os pedidos.*/
select
	AVG (ValorTotal) AS MediaValorTotal
from
	Pedidos;
	
	
	
/*4 - Contar quantos clientes fizeram pedidos.*/
select COUNT(*) AS TotalClientesComPedidos
from Pedidos;



/*5 - Encontrar o valor mínimo de todas as pizzas disponíveis.*/
select
	Nome,
    MIN(Preco) AS MenorValorPizza
FROM
	Pizzas;
	


/*6 - Encontrar o valor máximo gasto em um único pedido.*/
select
    MAX(ValorTotal) AS MaiorPedido
from
	Pedidos;
	


/*7 -  Calcular a soma de todos os valores totais gastos em pedidos.*/
select
    SUM(ValorTotal) AS ValorTotalPedidos
from
	Pedidos;
	
	
	
/*8 -  Imagine que a quantidade disponível de queijo Mussarela (ID 1) diminuiu em 10 kg devido ao uso em pedidos.*/
/*Atualize a quantidade disponível desse ingrediente na tabela*/
update
	Ingredientes
set 
	QuantidadeDisponivel = '20 kilos'
where	
	ID = 05;
select * from Ingredientes;



/*9 - Contar o número de pedidos feitos por cada cliente:*/
select
    C.Nome,
    COUNT(P.ID) AS NumeroDePedidos
from
    Clientes C
Inner Join Pedidos P ON (C.ID = P.ClienteID)
group by
    C.ID, C.Nome;
	


/*10 - Calcular o total gasto por cada cliente*/
select
	C.Nome,
    SUM(P.ValorTotal) AS ValorTotalPorCliente
from
	Clientes C
Inner Join Pedidos P ON (C.ID = P.ClienteID)
group by
    C.ID, 
	C.Nome;
	
    

/*11 - Encontrar o preço mínimo e máximo de pizzas*/
select
    MIN(Preco) AS PrecoMinimoPizza,
    MAX(Preco) AS PrecoMaximoPizza
from
    Pizzas;
	


/*12 -  Listar as pizzas de cada pedido com seus respectivos clientes*/
select
    P.ID AS PedidoID,
    C.Nome AS NomeCliente,
    PIZ.Nome AS NomePizza
from
    Pedidos P
Left Join Clientes C ON (P.ClienteID = C.ID)
Left Join Pizzas PIZ ON (PIZ.ID = P.ID); 



/*13 -  Inner Join entre Pedidos e Clientes para obter os detalhes do cliente para cada pedido*/
select
    P.ID AS PedidoID,
    C.Nome AS NomeCliente,
    C.Telefone AS TelefoneCliente,
    C.Endereco AS EnderecoCliente,
    C.CPF AS CPFCliente,
    P.DataPedido,
    P.ValorTotal
from
    Pedidos P
Inner Join Clientes C ON (P.ClienteID = C.ID);
	
	

/*14 - Inner Join entre Pedidos e Pizzas para listar as pizzas em cada pedido*/
select
    P.ID AS PedidoID,
    PIZ.Nome AS NomePizza,
    PIZ.Tamanho AS TamanhoPizza
from
    Pedidos P
Left Join Pizzas PIZ ON (P.ID = PIZ.ID);



/*15 - Inner Join entre Pedidos, Clientes e Funcionários para listar os pedidos feitos por cada cliente atendido por um funcionário*/
select
    P.ID AS PedidoID,
    C.Nome AS NomeCliente,
    F.Nome AS NomeFuncionario
from
    Pedidos P
Left Join Clientes C ON (P.ClienteID = C.ID)
Left Join Funcionarios F ON (C.ID = F.ID);



/*16 - Inner Join entre Pizzas e Ingredientes para listar os ingredientes de cada pizza*/
select
    P.Nome,
    I.Nome,
    I.QuantidadeDisponivel
from
    Pizzas P
Left Join Ingredientes I ON (P.ID = I.ID);



/*17 - Inner Join entre Funcionários e Pedidos para listar os pedidos atendidos por cada funcionário*/
select
    F.Nome,
    P.ID,
    P.DataPedido,
    P.ValorTotal
from
    Funcionarios F
Left Join Pedidos P ON (F.ID = P.ID);



/*18 -  Inner Join entre Pedidos e Pizzas para calcular o valor total gasto em cada pedido*/
select
    P.ID AS PedidoID,
    SUM(PIZ.Preco) AS ValorTotalGastoPorPizza
from
    Pedidos P
Left Join Pizzas PIZ ON (P.ID = PIZ.ID)
group by
    P.ID;
	
	
	
/*19 - Crie uma View para listar os detalhes dos pedidos de cada cliente*/
create VIEW DetalhesPedidosClientes AS
select
    C.Nome AS NomeCliente,
    P.ID AS PedidoID,
    P.DataPedido,
    P.ValorTotal
from
    Clientes C
Inner Join Pedidos P ON (C.ID = P.ClienteID);
select * from DetalhesPedidosClientes;



/*20 - Crie uma View para listar as pizzas e seus ingredientes*/
create VIEW IngredientePorPizza AS
select
	P.ID,
	P.Tamanho,
    I.Nome,
    I.QuantidadeDisponivel
from
    Pizzas P
Left Join Ingredientes I ON (I.ID = P.ID);
select * from IngredientePorPizza;



/*21 - Crie uma View para mostrar os funcionários e seus respectivos cargos*/
create VIEW FuncionariosCargos AS
select
    ID,
	Nome,
	Cargo
from
    Funcionarios;
select * from FuncionariosCargos;



/*22 -  Crie uma View para exibir o valor total gasto em cada pedido de pizza*/
create VIEW ValorTotalGastoPizzaPedido AS
select
    P.ID AS PedidoID,
    SUM(PIZ.Preco) AS ValorTotalGasto
from
    Pedidos P
Left Join Pizzas PIZ ON (P.ID = PIZ.ID)
group by
    P.ID;
select * from ValorTotalGastoPizzaPedido;



/*23 - Crie uma View para mostrar os clientes que fizeram pelo menos um pedido*/
create VIEW PedidosClientes AS
select
    ClienteID
from
    Pedidos 
group by
    ClienteID;
select * from PedidosClientes;