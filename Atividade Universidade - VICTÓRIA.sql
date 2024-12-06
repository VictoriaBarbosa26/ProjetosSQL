Create Database UNIVERSIDADE;
Use UNIVERSIDADE;

Create Table ALUNOS(
MATRICULA int primary key not null,
Nome varchar (100),
Sobrenome varchar (100), 
Endereco varchar (100),
Cidade varchar (100),
Estado varchar (2),
CEP varchar (9),
RG varchar (13),
CPF varchar (15),
DataNascimento datetime);

Insert Into ALUNOS(
MATRICULA,
Nome,
Sobrenome, 
Endereco,
Cidade,
Estado,
CEP,
RG,
CPF,
DataNascimento)

Values
('1','Victoria Antonia','Brito Barbosa','Rua Benedita Nunes Campos - 354','São José dos Campos','SP','02385-123','0235847-023','010058962013','20060626'),
('2','Nicolas Eduardo','Castro','Rua Bosque dos Ypes - 123','São José dos Campos','SP','02369-025','0236987-025','02558963212','20061116'),
('6','João Luís','Carvalho Souza','Rua bosque Verde - 657','São José dos Campos','SP','12345-025','10226319-950','028887459685','20060403'),
('45','Valentina','Almeida Campos','Avenida Brasil - 345','Guarulhos','SP','03030-785','0258963-027','025003158596','19910325'),
('17','Gabriel','Deinart White','Avenida Ouro Fino Julivan - 819','Rio Roxo','RS','12058-295','0258963-213','04005632063','20041201');
Select * From ALUNOS;



Create Table DISCIPLINAS(
CODIGODISCIPLINA int primary key not null, 
Nome_Disciplina varchar (100),
Carga_Horaria time);

Insert Into DISCIPLINAS (
CODIGODISCIPLINA,
Nome_Disciplina,
Carga_Horaria)

Values
('1','Programação Web I','150:00:00'),
('2','Programação de Algoritimos','200:00:00'),
('5','Analise de Software','300:00:00'),
('103','Matemática','120:00:00'),
('27','Biologia','100:00:00');
Select * From DISCIPLINAS;



Create Table PROFESSORES(
CODIGOPROFESSOR int primary key not null,
Nome varchar (100),
Sobrenome varchar (100), 
Endereco varchar (100),
Cidade varchar (100),
Estado varchar (2),
CEP varchar (9),
RG varchar (13),
CPF varchar (15),
DataNascimento datetime,
Formacao varchar (100));


Insert Into PROFESSORES (
CODIGOPROFESSOR,
Nome,
Sobrenome, 
Endereco,
Cidade,
Estado,
CEP,
RG,
CPF,
DataNascimento,
Formacao)

Values
('11','Donizete','Soares','Rua Benedita Nunes - 456','São José dos Campos','SP','12587-208','302587-0251','01003658956','19651017','Bacharelado'),
('9','Neymar','Siqueira','Rua Vale Sul - 243','São José dos Campos','SP','02030-203','025876-0258','08553694589','19850508','Bacharelado'),
('3','Maria Luiza','Marques','Rua Guaratingueta','Guaratinga','SP','02036-257','023698-0254','02006986315','19701010','Licenciatura'),
('2','Julia','Mercedes Campos','Avenida Alemã','Olimpo','RJ','02035-025','023695-0258','63851256900','20000606','Mestrado'),
('1','Patricia','Alves','Avenida Paulista','São Paulo','SP','02369-025','045698-0123','03778589999','19990919','tecnologa');
Select * From PROFESSORES;



/*3- FAÇA UMA LISTAGEM DE PROFESSORES SOMENTE COM O CODIGOPROFESSOR, Nome e Formação.*/

Select 
	CODIGOPROFESSOR,
    Nome,
	Formacao
From
	PROFESSORES;
	
	
	
/*4- FAÇA UMA LISTAGEM DE DISCIPLINAS COM O NOME_DISCIPLINA E CARGA_HORARIA COM O CODIGODISCIPLINA >=2.*/

Select 
	Nome_Disciplina,
	Carga_Horaria
From
	DISCIPLINAS
Where
	CODIGODISCIPLINA >=2;
	
	
	
/*5- FAÇA UMA LISTAGEM DE ALUNOS COM A MATRICULA >1 E COM DATANASCIMENTO ENTRE 2001 E 2010.*/

Select
	MATRICULA,
	DataNascimento
From
	ALUNOS
Where
	MATRICULA >1
And
	DataNascimento Between'20010101' And '20101231';
	
	
	
/*6- FAÇA UMA LISTAGEM DE ALUNOS COM TODOS OS ATRIBUTOS COM MATRICULA >2 E DATANASCIMENTO >2005*/

Select 
	MATRICULA,
	Nome,
	Sobrenome, 
	Endereco,
	Cidade,
	Estado,
	CEP,
	RG,
	CPF,
	DataNascimento
From
	ALUNOS
Where
	MATRICULA >2
And 
    DataNascimento >'20050101';



/*7- FAÇA UMA LISTAGEM DE NOME E CARGA_HORARIA DE PROFESSORES*/

/*ALTEREI A TABELA POIS NÃO TINHA CARGA HORARIA*/
ALTER TABLE PROFESSORES ADD Carga_Horaria varchar (100) references DISCIPLINAS (CODIGODISCIPLINA);

/*SELECIONEI PARA DEIXAR CLARO QUE CARGA HORARIA AINDA NÃO TEM REGISTROS*/
SELECT
	CODIGOPROFESSOR,
	Nome,
	Sobrenome, 
	Endereco,
	Cidade,
	Estado,
	CEP,
	RG,
	CPF,
	DataNascimento,
	Carga_Horaria,
	Formacao,
	IFNULL (Carga_Horaria, 'SEM CARGA HORÁRIA DEFINIDA') as Carga_Horaria
FROM
	PROFESSORES;
	
/*UPDATE FOI PARA PELO MENOS UM PROFESSOR TER CARGA HORARIA!!!*/
UPDATE
	PROFESSORES
SET
	Carga_Horaria = '103:00:00'
WHERE
	CODIGOPROFESSOR= 9;
Select * from PROFESSORES;

/*ENFIM A ATIVIDADE 7 CONCLUIDA ABAIXO!*/
Select 
	Nome,
    Carga_Horaria
From
	PROFESSORES;
	
	
	
/*8- FAÇA UMA LISTAGEM GERAL DE DISCIPLINAS*/

Select * from DISCIPLINAS;



/*9- FAÇA UMA LISTAGEM DE NOME E CPF DA TABELA ALUNOS COM NOME DOS ALUNOS COMEÇANDO A PRIMEIRA LETRA DO SEU NOME.*/

Select 
	Nome,
	CPF
From
	ALUNOS
Where
	Nome Like 'V%';



/*10- ATUALIZE A DISCIPLINA QUE POSSUI O CÓDIGO 5 PARA Banco de Dados II.*/

Update
	DISCIPLINAS
Set  
	Nome_Disciplina = 'Banco de Dados II'
Where	
	CODIGODISCIPLINA = '5';
Select * From DISCIPLINAS;
	

/*11- LISTE NOME E FORMAÇÃO DOS 3 PRIMEIROS REGISTROS DO BANCO DE DADOS.*/

Select
	Nome,
	Formacao
From
	PROFESSORES
Limit 3;



/*12-LISTE CODIGOPROFESSOR MAIOR QUE 3 E DATANASCIMENTO MAIOR QUE '20001110' DA TABELA PROFESSOR.*/

Select 
	CODIGOPROFESSOR,
    DataNascimento
From
	PROFESSORES
Where
	CODIGOPROFESSOR >3
And 
    DataNascimento >'20001110';
	
	

/*13- LISTE MATRÍCULA MAIOR IGUAL A 3 E DATANASCIMENTO MAIOR QUE '20080312' DA TABELA ALUNO*/

Select 
	MATRICULA,
    DataNascimento
From
	ALUNOS
Where
	MATRICULA >=3
And 
    DataNascimento >'20080312';

/*14- LISTE EM ORDEM ALFABÉTICA O NOME_DISCIPLINA.*/
Select
	Nome_Disciplina
From
	DISCIPLINAS
Order By
	Nome_Disciplina;

