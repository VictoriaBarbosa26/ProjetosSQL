/*1. Desenvolva a estrutura do bando de dados citado na atividade.*/
Create database Atividade_TRIGGER;
use Atividade_TRIGGER;

create table EX2_CLIENTE (
codcliente int PRIMARY KEY, 
nome varchar(100), 
datanascimento datetime, 
cpf varchar(12));

/*2*/ insert into EX2_CLIENTE (
codcliente, 
nome, 
datanascimento, 
cpf)

values 
(1,'Victória Barbosa','19980603','104.89'),
(2,'Luan Pereira','19620110','67.90'),
(3,'Julia Campanelli','19990909','56.99'),
(4,'Marta Souza','20000606','1023.89'),
(5,'Sara Scoot','20030708','100.90');
select * from EX2_CLIENTE;


create table EX2_PEDIDO (
codpedido int PRIMARY KEY, 
codcliente int REFERENCES EX2_CLIENTE (codcliente), 
datapedido datetime, 
nf varchar(20), 
valortotal numeric (4,2));

/*2*/ insert into EX2_PEDIDO(
codpedido, 
codcliente, 
datapedido, 
nf, 
valortotal)
	
values
(11,'2','20230310','568152014986230',2.644),
(12,'4','20221010','569874520369874',824.00),
(13,'5','20230401','189302569874103',899.99),
(14,'1','20231230','285203698741203',2.499),
(15,'3','20230509','785203145698745',989.70);
select * from EX2_PEDIDO;


create table EX2_PRODUTO(
codproduto int PRIMARY KEY, 
descricao varchar(250), 
quantidade int);

/*2*/ insert into EX2_PRODUTO(
codproduto, 
descricao, 
quantidade)
	
values
(1,'Um ícone da moda, os Converse Chuck Taylor All Star são tênis de lona versáteis e atemporais, adequados para diversas ocasiões.','8'),
(2,'Os tênis Adidas Ultraboost são famosos por seu amortecimento responsivo e malha elástica, garantindo um ajuste confortável e alto desempenho.','2'),
(3,'O Nike Air Max 270 é conhecido por seu design de calcanhar com a maior unidade de ar da Nike, proporcionando conforto e estilo excepcionais.','1'),
(4,'Os New Balance 990 são conhecidos por seu design clássico e conforto excepcional, tornando-os uma escolha popular para o dia a dia.','9'),
(5,'Os Reebok Classic Leather são tênis de estilo retrô com um toque moderno, oferecendo conforto e um visual atemporal.','3');
select * from EX2_PRODUTO;


create table EX2_ITEMPEDIDO (
itempedido int PRIMARY KEY, 
codpedido int REFERENCES EX2_PEDIDO (codpedido),  
numeroitem INT, 
valorunitario varchar(50), 
quantidade int, 
codproduto INT REFERENCES EX2_PRODUTO (codproduto));

/*2*/ insert into EX2_ITEMPEDIDO(
itempedido, 
codpedido, 
numeroitem, 
valorunitario, 
quantidade, 
codproduto) 

values
(120,'12','38',3.822,'8','1'),
(121,'15','42',1.824,'3','5'),
(122,'11','36',899.99,'9','4'),
(123,'14','35',2.499,'2','2'),
(124,'13','39',329.90,'1','3');
select * from EX2_ITEMPEDIDO;


create table EX2_LOG (
codlog int PRIMARY KEY,
datai DATETIME, 
descricao varchar(250));

/*2*/ insert into EX2_LOG(
codlog,
datai, 
descricao)

values
(33,'20230808','Rastreamento de eventos: Registrar eventos específicos, como login de usuários, transações, atualizações de dados, etc.'),
(44,'20230220','Segurança: Monitorar atividades suspeitas, como tentativas de acesso não autorizado.'),
(55,'20230126','Histórico de atividades: Manter um histórico de atividades do sistema para referência futura e relatórios.'),
(66,'20230723','Modificações de Cliente: Se informações de clientes forem modificadas um registro pode ser criado na tabela EX2_LOG com uma descrição indicando que o cliente foi modificado e quais foram as mudanças.'),
(77,'20231017','Redução de Estoque: Quando um item de pedido é inserido no sistema, reduzindo a quantidade de um produto em estoque.'); /*adicione descrição*/
select * from EX2_LOG;

/*3. Crie um TRIGGER para baixar o estoque de um PRODUTO quando ele for vendido.*/

DELIMITER $
CREATE TRIGGER Trg_EX2_ITEMPEDIDO_insert AFTER INSERT
ON EX2_ITEMPEDIDO
FOR EACH ROW
BEGIN
    UPDATE EX2_PRODUTO SET quantidade = quantidade - NEW.quantidade
    WHERE codproduto = NEW.codproduto;
END$
DELIMITER ;


/*4. Crie um TRIGGER para criar um log dos CLIENTES modificados.*/

DELIMITER $
CREATE TRIGGER Trg_EX2_CLIENTE_update AFTER UPDATE
ON EX2_CLIENTE
FOR EACH ROW
BEGIN
    INSERT INTO EX2_LOG (datai, descricao)
    VALUES (NOW(), CONCAT('Cliente ', OLD.codcliente, ' modificado.'));
END$
DELIMITER ;
UPDATE EX2_LOG
	SET datai = '20230101',
    descricao = 'Modificações de Cliente: Se informações de clientes forem modificadas um registro pode ser criado na tabela EX2_LOG com uma descrição indicando que o cliente foi modificado e quais foram as mudanças.'
    WHERE codlog = 3



/*5. Crie um TRIGGER para criar um LOG quando o valor total do pedido for maior que R$1000.*/

DELIMITER $
CREATE TRIGGER Trg_EX2_PEDIDO_insert AFTER INSERT 
ON EX2_PEDIDO
FOR EACH ROW
BEGIN
    IF NEW.valortotal > 1000 THEN
        INSERT INTO EX2_LOG (datai, descricao)
        VALUES (NOW(), CONCAT('Pedido ', NEW.codpedido, 'Valor superior a R$1000.'));
    END IF;
END$

DELIMITER$;
show triggers;
