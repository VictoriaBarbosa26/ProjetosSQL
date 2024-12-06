create database EMPRESA;
use EMPRESA;

create table EMPREGADOS (
CODempregado INT AUTO_INCREMENT primary key not null,
NOME varchar (100),
SOBRENOME varchar (100), 
DEPARTAMENTO int references DEPARTAMENTOS (CODIGOdepto),
TELEFONE varchar(20),
DATAADMISSAO datetime,
CARGO varchar (30),
FORMACAO varchar (75),
SEXO varchar (10),
DATANASCIMENTO datetime,
NomeGerente VARCHAR (100)
);

insert into EMPREGADOS(
CODempregado,
NOME,
SOBRENOME,
DEPARTAMENTO,
TELEFONE,
DATAADMISSAO,
CARGO,
FORMACAO,
SEXO,
DATANASCIMENTO,
NomeGERENTE)
 values
 (1,'Luan','Medeiros','11','985657410','20200808','Análise da conjuntura econômica','Economia','Masculino','19871010','Julia Morais'),
 (2,'João','Carvalho','22','148259307','20170919','Programador','Desenvolvedor de sistemas','Masculino','19950403','Julio Nogueira'),
 (3,'Luana','Muslera','33','968523025','20160719','Desenvolvimento de software','Software e Ánalise de Sistemas','Feminino','19680202','Alberto Almeida'),
 (4,'Nicolas','Castro','44','969988661','20220918','Gestor de recrutamento e seleção','Recursos Humanos','Masculino','20001117','Antonieta Bonaparte'),
 (5,'Maria','Correia','55','999666777','20120606','Contabilidade','Economia','Feminino','19990404','Marcos Gomes');
 select * from  EMPREGADOS;


create table DEPARTAMENTOS (
CODIGOdepto INT AUTO_INCREMENT primary key,
NOME varchar (75), 
NomeGERENTE varchar (100)
);
insert into DEPARTAMENTOS (
CODIGOdepto,
NOME, 
NomeGERENTE)
values
(11,'Contabilidade','Julia Morais'),
(22,'Recursos Humanos','Antonieta Bonaparte'),
(33,'Financeiro','Marcos Gomes'),
(44,'Sistemas Desenvolvidos','Julio Nogueria'),
(55,'Ánalise de Sistemas','Alberto Almeida');
select * from  DEPARTAMENTOS;

create table PROJETO (
CODIGOproj INT AUTO_INCREMENT primary key not null,
NOME varchar (75), 
RESPONSAVEL int references EMPREGADOS (CODempregado),
numEQUIPE varchar (75),
DATAINICIO datetime,
DATAFIM datetime
);
insert into PROJETO (
CODIGOproj,
NOME, 
RESPONSAVEL,
numEQUIPE,
DATAINICIO,
DATAFIM)
values
(111,'R35 Nissan GTR','2','5','20011010','20220909'),
(222,'Metaverso','3','5','20160606','20280202'),
(333,'Catarse','5','5','19990303','20220101'),
(444,'Bliive','1','5','20220203','20220930'),
(555,'LOL Legends 5000','4','5','20171002','20220505');
SELECT  * FROM  PROJETO;


create table CLIENTE (
CODcliente INT AUTO_INCREMENT primary key not null,
NOME varchar (75), 
SOBRENOME varchar (75) not null,
ENDERECO varchar (75),
CIDADE varchar (100),
ESTADOCEP varchar (15),
RG varchar (15),
CPF varchar (12),
DATANASCIMENTO datetime,
TELEFONE varchar (15),
SEXO varchar (10),
EMAIL varchar (75)
);
insert into CLIENTE (
CODcliente,
NOME, 
SOBRENOME,
ENDERECO,
CIDADE,
ESTADOCEP,
RG,
CPF,
DATANASCIMENTO,
TELEFONE,
SEXO,
EMAIL)
values
(123,'Juliano','Morais','Rua limpa','Guaratingueta','SP,12026588','480265897','01892589','20001005','369852147','Masculino','julinmorais@gmail.com'),
(124,'Sheila','Santos','Rua Suja Limpa','itapoã','SP,15836975','432561598','12182312412','20000303','365214789','Feminino','sheilasantos@gmail.com'),
(125,'Gabriel','monteiro','Rua Humberto Silva Monte','Suzano','SP,12050767','157975325','19028580823','19990203','147258369','Masculino','monteirinhogabrel@gmail.com'),
(126,'Pablo','Maustero','Rua Rocinha','Niteroi','RJ,12026588','480206589','01098792559','20010326','023587159','Masculino','pablomausr@gmail.com'),
(127,'Roberto','Gomes','Rua gominho','Sapucai','MG,18925845','489105975','01892589304','20001010','089367159','Masculino','robertin@gmail.com');
select * from  CLIENTE;

/*5*/select NOME, SOBRENOME, TELEFONE from EMPREGADOS;
select * from  EMPREGADOS;

/*6*/select NOME, SEXO from CLIENTE;
select * from  CLIENTE;

/*7*/select NOME, NomeGERENTE from EMPREGADOS;
select * from  EMPREGADOS;

/*8*/select RESPONSAVEL, numEQUIPE, DATAFIM from PROJETOS;
select * from  PROJETOS;

/*9*/update
	EMPREGADOS
set
	NOME = "Victória",
    SOBRENOME = "Brito",
    TELEFONE = "946291885",
    SEXO = "Feminino",
	DATANASCIMENTO = '20060626'
/*PROFESSOR EU NÃO SABIA SE ERA PRA MUDAR A FACULDADE E CARGOS ENTÃO MUDEI APENAS OS DADOS PESSOAIS, POIS MINHA IDEIA DE INICIO ERA COLOCAR
MEU NOME LÁ EM CIMA MAS VI AS ATIVIDADES E MUDEI APENAS MEUS DADOS PESSOAIS, DESDE JÁ AGRADEÇO A ATENÇÃO!*/

where
	CODEmpregado = 3;
select * from  EMPREGADOS;

/*10*/
update
	CLIENTE set CODcliente = '6' where CODcliente = '123';
update
    CLIENTE set CODcliente = '7' where CODcliente = '124';
update
    CLIENTE set CODcliente = '8' where CODcliente = '125';
update
    CLIENTE set CODcliente = '9' where CODcliente = '126';
update
    CLIENTE set CODcliente = '10' where CODcliente = '127';
SELECT  * FROM  CLIENTE;