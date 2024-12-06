create database PETSHOP;
use PETSHOP;


/*1*/create table ANIMAL ( 
Id varchar (10) primary key not null,
Nome varchar(100) not null,
Raca varchar (100) references ESPECIE (Id));
/*2*/Alter table ANIMAL add Dono VARCHAR (10);
Alter table ANIMAL add foreign key (Dono) references DONO (IdDono);

/*3*/insert into ANIMAL (
Id,
Nome,
Raca,
Dono)
 values
 (1,'Toto','1','2'),
 (2,'Toto','2','3'),
 (3,'Lica','1','1'),
 (4,'Brutus','3','1'),
 (5,'Pluto','1','1');
 select * from  ANIMAL;
 /*4*/update ANIMAL
set
    Nome = "Rex"
where
	Raca = 4; 
	
/*4*/DELETE FROM ANIMAL 
 WHERE Nome = "Toto"
 AND Raca = "2";
 
 /*4*/update ANIMAL
 set
    Dono = "4"
where
	Id = 3;

 
/*1*/create table DONO ( 
IdDono varchar (10) primary key not null,
Nome varchar(100) not null,
CPF varchar (11),
Fone varchar (100));
/*3*/insert into DONO (
IdDono,
Nome,
CPF,
Fone)
 values
 (1,'João','1234','3333 4444'),
 (2,'Pedro','5678','3333 5555'),
 (3,'José','9123','3333 6666'),
 (4,'Maria','1245','3333 2222');
 select * from  DONO;
 
 
/*1*/create table ESPECIE ( 
Id varchar(10) primary key not null,
Nome varchar(100) not null);
/*2*/RENAME TABLE ESPECIE TO RACA;
/*3*/insert into RACA (
Id,
Nome)
 values
 (1,'Vira-Lata'),
 (2,'Poodle');
 select * from  RACA;
 
 
 
/*5*/create table CONSULTA ( 
Id varchar (10) primary key not null,
DataConsulta varchar(100) not null,
Animal varchar (100));
/*6*/ Alter table CONSULTA add hora time;

/*7*/insert into CONSULTA (
Id,
DataConsulta,
Animal,
hora)
 values
 (1,'12/01/2007','1','07:00'),
 (2,'12/01/2007','3','08:00'),
 (3,'13/01/2007','1','07:00');
 select * from  CONSULTA;
 
 
 /*8*/Delete from CONSULTA  
 where  Id = '1'  
 and DataConsulta = '12/01/2007';
 
 /*8*/update CONSULTA
set
    DataConsulta = '13/01/07'
where
	Id = 3;
select * from CONSULTA;
/*OBS: PROFESSOR AS ATIVIDADES ESTÃO JUNTO COM AS TABELAS PARA NÃO FICAR TÃO CONFUSO, DESDE JÁ AGRADEÇO A ATENÇÃO*/