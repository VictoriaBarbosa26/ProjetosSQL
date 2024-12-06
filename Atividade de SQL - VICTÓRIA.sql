create database Telecomunicacao;  
use telecomunicacao;
create table Cliente (
CPFCliente varchar (15),
nomeCliente varchar (100), 
datanascimentoCliente datetime,
enderecoCliente varchar (100),
CEPCliente varchar (10),
bairroCliente varchar (30),
cidadeCliente varchar (20),
UFCliente varchar (2)
);
alter table Cliente  add DATADAULTIMACOMPRA varchar (10);

insert into Cliente (
CPFCliente,
nomeCliente, 
datanascimentoCliente,
enderecoCliente,
CEPCliente,
bairroCliente,
cidadeCliente,
UFCliente,
DATADAULTIMACOMPRA)
values 
('04496332780','João da Silva','25/11/1969','Rua Antônio Numes', '88045963','Palmeiras','Londrina','PR',''),
('05485031490','Ana Regina Fagundes','21/09/1986','Rua Palmeiras Novas', '88078923','Leblon','Rio de Janeiro','RJ',''),
('03350314905','Fernando Soares','05/03/1990','Rua Palmeiras Novas','88048917','Copa Cabana','Rio de Janeiro','RJ','');


select *from Cliente  where cidadeCliente='Rio de Janeiro';
delete from Cliente where cidadeCliente='Londrina';
