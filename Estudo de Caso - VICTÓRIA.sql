Create Database BIBLIOTECA;
Use BIBLIOTECA;

Create Table  LIVRO (
CodL varchar (100) PRIMARY KEY,
Titulo varchar (40),
Editora varchar (40),
Edicao INTEGER,
AnoPublicacao varchar (4));

Insert Into LIVRO (
CodL,
Titulo,
Editora,
Edicao,
AnoPublicacao)
Values
('9780525478812','A culpa e das Estrelas','Robb Sullivan','2','2012'),
('9788501113498','E Assim que Acaba','Grupo Editorial Record','3','2016'),
('9780261103689','O Senhor dos Anéis','	Allen & Unwin','4','2002'),
('9781501182099','It - A coisa','Editora Suma','1','1986'),
('9780670881468','48 Leis do Poder','Viking Press','2','1998');
SELECT * FROM LIVRO;



Create Table  LIVRO_AUTOR (
Livro_CodL varchar (100) references LIVRO (CodL),
Autor_CodAU varchar (100) references AUTOR (CodAU));

Insert Into LIVRO_AUTOR (
Livro_CodL,
Autor_CodAU)
Values
('9780525478812','123'),
('9788501113498','124'),
('9780261103689','125'),
('9781501182099','126'),
('9780670881468','127');
SELECT * FROM LIVRO_AUTOR;



Create Table AUTOR (
CodAU INTEGER PRIMARY KEY,
Nome varchar (40));

Insert Into AUTOR (
CodAU,
Nome)
Values
('124','Collen Hoover'),
('123','John Green'),
('125','J. R. R. Tolkien'),
('127','Robert Greene'),
('126','Stephen King');
SELECT * FROM AUTOR;



Create Table LIVRO_ASSUNTO (
Livro_CodL INTEGER references LIVRO (CodL),
Assunto_CodAS INTEGER references ASSUNTO (CodAS));

Insert Into LIVRO_ASSUNTO (
Livro_CodL,
Assunto_CodAS)
Values
('9780525478812','20'),
('9788501113498','21'),
('9780261103689','22'),
('9781501182099','23'),
('9780670881468','24');
SELECT * FROM LIVRO_ASSUNTO;



Create Table ASSUNTO (
CodAS INTEGER PRIMARY KEY,
Descricao varchar (300));

Insert Into ASSUNTO(
CodAS,
Descricao)
Values
('20','Hazel Grace Lancaster e Augustus Waters são dois adolescentes que se conhecem em um grupo de apoio para pacientes com câncer'),
('21','Um romance sobre as escolhas corretas nas situações mais difíceis. As coisas não foram sempre fáceis para Lily, mas isso nunca a impediu de conquistar a vida tão sonhada.'),
('22','A história narra o conflito contra o mal que se alastra pela Terra-média, através da luta de várias raças - Humanos, Anãos, Elfos, Ents e Hobbits.'),
('23','It é um romance de terror de 1986 do autor estadunidense Stephen King. Foi seu 22º livro e seu 17º romance escrito em seu próprio nome.'),
('24','Descobre por que alguns conseguem ser tão bem-sucedidos, enquanto outros estão sempre sendo passados para trás.');
SELECT * FROM ASSUNTO;


Create Table ALUNOS (
NumMatricula varchar (100) PRIMARY KEY,
Nome varchar (100),
Endereco varchar (100),
Telefone varchar (12),
Celular varchar (13),
CPF varchar (15),
RG varchar (15),
Email varchar (30));

Insert Into ALUNOS (
NumMatricula,
Nome,
Endereco,
Telefone,
Celular,
CPF,
RG,
Email)
Values
('111','Victória Antônia Brito Barbosa','Rua Benedita Nunes - 354 - SJC','2412-3959','012946291885','02503698712','20369870','vicbrito@gmail.com'),
('222','Nicolas Eduardo Castro','Rua Interlagos - 256 - SJC','1235-2023','012987420336','05801478963','12358796','neckzada@email.com'),
('333','Fernanda dos Santos','Rua Leste da Ponte - 147 - SJC','2035-0213','012985620114','25889630012','02589631','nandinhaaaaa@outlook.com'),
('444','Gabriel Deinart Ribeiro','Avenida Paulista - 120 - SP','2058-3698','011985201447','20993651255','02369852','bielzinh@gmail.com'),
('555','Sara Scott','Avenida Italia Marcondez - 589 - SP','2013-4569','011965887445','023369874563','02587413','scotttofc@yahoo.com');
SELECT * FROM ALUNOS;



Create Table PROFESSORES (
Nome varchar (100) PRIMARY KEY NOT NULL,
Endereco varchar (100),
Telefone varchar (12),
Celular varchar (12),
CPF varchar (15),
RG varchar (15),
Email varchar (30),
Titulacao varchar (20));

Insert Into PROFESSORES(
Nome,
Endereco,
Telefone,
Celular,
CPF,
RG,
Email,
Titulacao)
Values
('Maria Luiza','Avenida Guaratingueta - 789','2036-1111','012963201447','52003698874','36985214','malu@gmail.com','Graduação'),
('Donizete Soares','Rua Lua vermelha - 7850','2589-2305','012987456123','02003694589','20586314','donis@gmail.com','Graduação'),
('Julia Vasconcelhos','Avenida Brasil - 777','2058-7411','011965230123','02559684523','20158963','jujuvava@yahoo.com','Ensino Superior'),
('Amanda Moreira','Avenida Sudeste Lucimara - 852','7852-2036','011965555888','01223698523','78945630','moreirinha@email.com','Mestrado'),
('Trevor Ross','Rua Lucinda Nestle - 023','5896-2035','013965857205','02559630212','58964120','rosstrevor@outlok.com','Graduação');
SELECT * FROM PROFESSORES;



Create Table EMPRESTIMO_DE_LIVROS (
Pessoa_que_pegou_livro varchar (100),
DataEmprestimo datetime,
DataDevolucaoPrevista datetime,
ExemplarEmpres varchar (500) references LIVRO (CodL));

Insert Into EMPRESTIMO_DE_LIVROS(
Pessoa_que_pegou_livro,
DataEmprestimo,
DataDevolucaoPrevista,
ExemplarEmpres)
Values 
('Victória Antônia Brito Barbosa','2023-02-20','2023-06-26','E assim que Acaba. Exemplar 1 / 48 Leis do poder. Exemplar 35 / It - A Coisa. Exemplar 12 '),
('Donizete Soares','2023-01-10','2023-08-10','A culpa e das Estrelas. exemplar 7 / O Senhor dos Anéis. Exemplar 10'),
('Gabriel Deinart Ribeiro','2023-02-26','2023-03-31','E assim que Acaba. Exemplar 19'),
('Nicolas Eduardo Castro','2023-03-17','2023-07-10','A culpa e das Estrelas. Exemplar 29 / 48 Leis do poder. Exemplar 17'),
('Maria Luiza','2022-01-20','2024-01-03','48 Leis do poder. Exemplar. 99');
SELECT * FROM  EMPRESTIMO_DE_LIVROS;



Create Table DEVOLUCAO_DE_LIVROS (
Devoludor varchar (100),
Exemplar_Devolvido varchar (300),
Quant_Livros_a_devolver INT,
DataDevolucao datetime,
Multa varchar (100));

Insert Into DEVOLUCAO_DE_LIVROS(
Devoludor,
Exemplar_Devolvido,
Quant_Livros_a_devolver,
DataDevolucao)
Values 
('Victória Antônia Brito Barbosa','E assim que Acaba. Exemplar 1','2','2023-06-27','R$1,00'),
('Donizete Soares','O Senhor dos Anéis. Exemplar 10','1','2023-08-07','///'),
('Gabriel Deinart Ribeiro','E assim que Acaba. Exemplar 19','0','2023-03-31','///'),
('Nicolas Eduardo Castro','48 Leis do poder. Exemplar 17','1','2023-06-11','///'),
('Maria Luiza','48 Leis do poder. Exemplar. 99','0','2024-01-05','R$2,00');
/*O valor da Multa e de R$1,00 por dia de atraso*/
SELECT * FROM DEVOLUCAO_DE_LIVROS;



/*FAZER UMA SELEÇÃO DE NOME DE LIVROS E AUTORES*/
SELECT Titulo FROM LIVRO;
SELECT Nome FROM AUTOR;

/*FAZER UMA SELEÇÃO DE NOME DE ALUNOS CADASTRADOS NA BIBLIOTECA*/ 
SELECT Nome FROM ALUNOS;
	
	
/*ATUALIZAR O REGITRO DE PELO MENOS UM ALUNO*/
/*1*/
UPDATE
	ALUNOS
SET 
	Nome = 'João Stanford',
	Endereco = 'Avenida São José - 7200 - SJC',
	Telefone = '2582-2200',
	Celular = '012952036995',
	CPF = '123520698444',
	RG = '00022255',
	Email = 'stanfordinho@yahoo.com'
WHERE	
	NumMatricula = '222';
	
/*2*/
UPDATE
	ALUNOS
SET 
	Nome = 'Luana das Dores',
	Endereco = 'Rua da Pedra Lavada - 452 - SP',
	Telefone = '2020-2020',
	Celular = '011963025885',
	CPF = '99958525783',
	RG = '55588896',
	Email = 'dorzinha@gmail.com'
WHERE	
	NumMatricula = '555';
	
SELECT * FROM ALUNOS;
 
 
/*EXCLUIR PELO MENOS UM REGISTRO*/
DELETE FROM ALUNOS WHERE NumMatricula = '333';
SELECT * FROM ALUNOS;



	
	


