create database Biblioteca;
use Biblioteca;

/*1*/ Create Table Autores (
Autor_Id varchar (1) primary key,
Nome_Autor varchar (50));
/*2*/ Insert into Autores (
Autor_Id,
Nome_Autor)
Values 
(1,'Colleen Hoover'),
(2,'Jojo Moyes'),
(3,'Alex Michaelides');
select * from Autores;


/*1*/ Create Table Livros (
Livro_Id int primary key,
Titulo varchar (50),
Autor_Id int references Autores (Autor_Id),
Quantidade int);
/*2*/ Insert into Livros (
Livro_Id,
Titulo,
Autor_Id,
Quantidade)
Values 
(11,'E assim que começa','1','5'),
(12,'E assim  que acaba','1','8'),
(13,'Como eu era antes de você','2','12'),
(14,'Depois de você','2','13'),
(15,'A paciente silenciosa','3','1');
select * from Livros;


/*1*/ Create Table Emprestimos (
Emprestimo_Id int primary key,
Livro_Id int references Livros (Livro_Id),
Data_Emprestimo datetime,
Data_Devolucao datetime);
/*2*/ Insert into Emprestimos (
Emprestimo_Id,
Livro_Id,
Data_Emprestimo,
Data_Devolucao)
Values 
(33,'11','20210303','20210421'),
(44,'13','20221201','20211231'),
(55,'14','20220905','20221010'),
(66,'15','20221130','20221212');
select * from Emprestimos;


/*3*/
Select Nome_Autor, Count(*) as TotalLivrosAutor
From Autores A
Inner Join Livros L on (A.Autor_Id = L.Autor_Id)
Group By
A.Nome_Autor;

/*4*/
Select Sum(Quantidade)TotalLivros
From Livros;

/*5*/
Select Titulo,
Min(Quantidade) as MenorQuantidade
from Livros L;

/*6*/
Select * from Livros
order by titulo;

/*7*/
Select Titulo,
Max(Quantidade) as MaiorQuantidade
From Livros;

/*8*/
Select L.Livro_Id, E.Data_Emprestimo
from Emprestimos E
Inner Join Livros L on (L.Livro_Id = E.Livro_Id)
order by E.Data_Emprestimo;