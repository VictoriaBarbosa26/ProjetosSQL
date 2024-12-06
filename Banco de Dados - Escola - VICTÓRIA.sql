create database Escola;
use Escola;

/*1*/ Create Table Aluno (
Aluno_id int primary key,
Nome varchar (50),
Idade int);
/*2*/ Insert into Aluno (
Aluno_id,
Nome,
Idade)
Values 
(1,'Victória Barbosa','17'),
(2,'Gabriel Deinart','17'),
(3,'Sara Scott','18');
select * from Aluno;


/*1*/ Create Table Disciplinas (
Disciplina_id int primary key,
Nome varchar (50));
/*2*/ Insert into Disciplinas (
Disciplina_id,
Nome)
Values 
(11,'Banco de Dados'),
(12,'Matemática'),
(13,'Desenvolvimento de Sistemas');
select * from Disciplinas;


/*1*/ Create Table Notas (
Nota_id int primary key,
Aluno_id int references Aluno (Aluno_id),
Disciplina_id int references Disciplinas (Disciplina_id),
Nota int);
/*2*/ Insert into Notas (
Nota_id,
Aluno_id,
Disciplina_id,
Nota)
Values 
(33,'1','11','10'),
(44,'2','12','8'),
(55,'3','13','9'),
(66,'1','12','9'),
(77,'2','11','10');
select * from Notas;


/*3*/
SELECT D.Nome AS Disciplinas, 
COUNT(N.Aluno_id) AS Quantidade_Alunos
FROM Disciplinas D
LEFT JOIN Notas N ON (D.Disciplina_id = N.Disciplina_id)
GROUP BY D.Disciplina_id;

/*4*/
SELECT D.Nome AS Disciplinas, SUM(N.Nota) AS Soma_Notas
FROM Disciplinas d
LEFT JOIN Notas n ON (D.Disciplina_id = N.Disciplina_id)
GROUP BY D.Disciplina_id;

/*5*/
SELECT A.Nome AS Alunos, MIN(N.Nota) AS Menor_nota
FROM Aluno A
LEFT JOIN Notas N ON (A.Aluno_id = N.Aluno_id)
GROUP BY A.Aluno_id;

/*6*/
SELECT * FROM Aluno
ORDER BY Idade;

/*7*/
SELECT D.Nome AS Disciplinasina, MAX(N.Nota) AS maior_nota
FROM Disciplinas D
LEFT JOIN Notas N ON (D.Disciplina_id = n.Disciplina_id)
GROUP BY D.Disciplina_id;

/*8*/
SELECT A.Nome AS aluno, D.Nome AS Disciplinas, N.Nota
FROM Aluno A
JOIN Notas N ON (A.Aluno_id = N.Aluno_id)
JOIN Disciplinas D ON (N.Disciplina_id = D.Disciplina_id)
ORDER BY A.Nome, D.Nome;