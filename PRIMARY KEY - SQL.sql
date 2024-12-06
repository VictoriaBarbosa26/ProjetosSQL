create database ESCOLA;
use ESCOLA;

create table ALUNO (
NomeALUNO varchar (100),
Endereco varchar (100),
TElefone varchar (25),
Email varchar (100)
);

select * from ALUNO

alter table ALUNO ADD DataNascimento datetime
ALTER TABLE ALUNO modify DataNascimento NOT NULL
Alter table ALUNO ADD codigo INT AUTO_INCREMENT PRIMARY KEY
 
 insert into ALUNO(
 NomeALUNO,
 Endereco,
 TElefone,
 Email,
 DataNascimento)
 values
 ('Mario Alberto','Rua das Pedras, 132, São José dos Campos,SP','1232569845','mario@gamil.com','19801015'),
 ('Luan Takeda','Rua das flores, 199, São José dos Campos,SP','40028922','takeda@gamil.com','20001212'),
 ('Maria Julia','Rua Alfredo Gonçalves,25,São José dos Campos,SP','123456789','jujuma@gamil.com','20010505'),
 ('Gabriel Ribeiro','Rua lavada,1020,São JOsé dos Campos,SP','07070707070','ribeiro777@gamil.com','20000606'),
 ('Nahtalya Muslera','avenida brasil,666,São José dos Campos,SP','66699977744','muslera@gamil.com','19991010');
 
 select * from  ALUNO;
 
/* CRIANDO A TABELA CURSO*/
create table CURSO (
codigoCURSO INT AUTO_INCREMENT primary key,
ALUNO int references ALUNO (codigo), 
NomeCURSO varchar (75) not null,
dataHomologacao datetime,
cargaHoraria time);

/* OUTRA MENEIRA DE ALTERAR ADICIONAR CHAVES DE OUTRA MANEIRA*/
alter table CURSO add constraint  fkcodigo foreign key (ALUNO) references ALUNO (codigo)

insert into CURSO (
ALUNO,
NomeCURSO,
dataHomologacao,
cargaHoraria)
values
(1,'Administração','20220331','450:00'),
(2,'Desenvolvimento de Sistemas','20220801','500:00'),
(3,'Automação Industrial','20220909','350:00'),
(4,'Marketing','20220725','600:00'),
(5,'Enfermagem','20220301','250:00');

SELECT  * FROM  CURSO;
select * from  ALUNO;

update
	ALUNO
set
	nomeALUNO = "MAria Clara Vilas Boas",
    Endereco = "Avenida Cidade Jardim,4890, São José dos Campos,SP",
    Email = "Mariavb@gmail.com",
    DataNascimento = "20070308"
    
where
	codigo = 1

select * from ALUNO