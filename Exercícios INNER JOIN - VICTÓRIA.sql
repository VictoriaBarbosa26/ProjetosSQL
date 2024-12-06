/*Criar o banco de dados ExerciciosInner*/
Create Database ExerciciosInner;

drop database ExerciciosInner;

/*Utilizar o banco de dados*/
Use ExerciciosInner;


/*Criar a tabela Funcionarios*/
Create Table Funcionarios(
CodigoF INT auto_increment primary key,
PrimeiroNome varchar (30),
SegundoNome varchar (20),
UltimoNome varchar (20),
DataNascimento Datetime,
CPF varchar(11),
RG varchar (7),
Endereco varchar (100),
CEP varchar (8),
Cidade varchar (15),
Telefone varchar (13),
Funcao varchar (50),
Salario Numeric (15,2));


/*Inserir CodigoDepartamento como chave estrangeira na tabela Funcionários*/
Alter table Funcionarios add CodigoDepartamento int;
Alter Table Funcionarios Add Foreign Key (CodigoDepartamento) references Departamentos (CodigoD);

Insert Into Funcionarios (
CodigoF, 
PrimeiroNome,
SegundoNome,
UltimoNome,
DataNascimento,
CPF,
RG,
Endereco,
CEP,
Cidade,
Telefone,
Funcao,
Salario)
Values
(1, 'Victória','Brito','Barbosa','20060626','47958963001','2260253','Rua Benedita Nunes Campos','58963205','São José dos Campos','(12)963258741','Gerente',5507.59),
(11, 'Marcos','','Costa','20060403','15975385210','1234569','Rua Dos Eucaliptos','78963025','São José dos Campos','(12)952368001','Assistente de Manutenção',2098.57),
(2, 'Nicolas','Eduardo','Oliveira','20061117','48569320569','7894562','Rua dos Ypes','78965412','São José dos Campos','(12)946291885','Programador',3690.03),
(12, 'Rebeka','Justus','Silva','19960202','78963205963','7895203','Rua Salmão Rosa','78963205','São José dos Campos','(17)963025441','Analista de Sistemas',2707.02),
(3, 'Fernanda','','Victor','20060625','78944612302','1234567','Rua Alto de Santana','77744452','São José do Rio Pardo','(12)963025551','Folha de Pagamento',2505.00),
(13, 'Gabriel','','Francelino','20060313','4125896300','1234560','Rua Alto Alegre','88852036','São José do Rio Pardo','(32)963205441','Supervisor',3507.19),
(4, 'Trevor','Deinart','White','19921119','78963025874','8569584','Avenida Lisboa Benfica','78520369','Rio Grande do Sul','(05)963014285','Diretor Criativo',4510.59),
(14, 'Miranda','','Ross','19981212','25369015896','2301456','Avenida Benfica de Fabrica','78962541','Rio Grande do Sul','(12)946231559','Bolsista Criativa',2307.59),
(5, 'Sara','Alice','Scott','19890505','78945625893','1205698','Avenida Canada Vermelho','85236914','São Paulo','(11)962058771','Gerente',4508.20),
(15, 'Thomas','Groot','Foster','20060626','47958963001','2260253','Rua Benedita Nunes Campos','58963205','São Paulo','(11)912356425','Contador',2897.07);
Select * from Funcionarios;



/*Criar a tabela Departamentos*/ 
Create Table Departamentos (
CodigoD INT primary key,
Nome varchar (50),
Localizacao varchar (100));

/*Inserir CodigoFuncionarioGerente como chave estrangeira na tabela Departamentos*/
Alter Table Departamentos Add CodigoFuncionarioGerente int;
Alter Table Departamentos Add Foreign Key (CodigoFuncionarioGerente) References Funcionarios (Funcao);


Insert Into Departamentos (CodigoD, Nome, Localizacao, CodigoFuncionarioGerente) Values
(1, 'Departamento Operacional', 'Prédio Thompson Mídia - SP - 10º Andar', 1),
(2, 'Departamento Software', 'Prédio Thompson Mídia - SP - 5º Andar', 7),
(3, 'Departamento Pessoal', 'Prédio Thompson Mídia - SP - 2º Andar', 9),
(4, 'Departamwnto Marketing', 'Prédio Thompson Mídia - SP - 7º Andar', 10),
(5, 'Deparatmento Financeiro', 'Prédio Thompson Mídia - SP - 9º Andar', 5);
Select * from Departamentos;


/*Exercício 1 - Listar nome e sobrenome ordenado por sobrenome*/
Select 
	PrimeiroNome, 
	UltimoNome
From 
	Funcionarios
Order By 
	UltimoNome;


/*Exercício 2 - Listar todos os campos de funcionários ordenados por cidade*/
Select * From Funcionarios
Order By Cidade;


/*Exercício 3 - Liste Funcionários que têm salário superior a R$ 1000,00 ordenados pelo nome completo*/
Select * From Funcionarios
Where
Salario > 1000.00 
Order By 
	PrimeiroNome,
	SegundoNome, 
	UltimoNome;


/*Exercício 4 - Liste a Data de Nascimento e o primeiro nome dos funcionários ordenados do mais novo para o mais velho*/
Select 
	DataNascimento, 
	PrimeiroNome
From 
	Funcionarios
Order By 
	DataNascimento DESC,
	PrimeiroNome;


/*Exercício 5 - Liste os funcionários como uma listagem telefônica*/
Select 
	UltimoNome, 
	PrimeiroNome,
	SegundoNome, 
	Telefone,
	Endereco,
	Cidade
From 
	Funcionarios
Order By  
	UltimoNome, 
	PrimeiroNome,
	SegundoNome;


/*Exercício 6 - Liste o total da folha de pagamento*/
Select 
	SUM(Salario) AS TotalSalario
From
	Funcionarios;


/*Exercício 7 - Liste o nome, o nome do departamento e a função de todos os funcionários*/
Select 
	PrimeiroNome, 
	Nome,
	Funcao
From 
	Funcionarios F 
Inner Join 
	Departamentos D  ON (F.CodigoF = D.CodigoD)
Order By 
	PrimeiroNome;


/*Exercício 8 - Liste todos departamentos com seus respectivos gerentes*/
Select 
	Nome,
	PrimeiroNome
From	
	Departamentos D
Inner Join
	Funcionarios F ON (D.CodigoFuncionarioGerente = F.CodigoDepartamento)
Order By
	D.Nome;
	

/*Exercício 9 - Liste o Valor da folha de pagamento de cada departamento (nome)*/
Select 
	Nome, 
	SUM(Salario) AS SalarioPorDepartamento
From 
	Departamentos D
Inner Join
	Funcionarios F ON (D.CodigoD = F.CodigoF)
Group By 
	D.Nome;
	
	
/*Exercício 10 - Liste os departamentos dos funcionários que têm a função de supervisor*/
Select 
	Nome, 
	PrimeiroNome
From 
	Departamentos D
Inner Join 
	Funcionarios F ON (D.CodigoD = F.CodigoF)
Where 
	F.Funcao = 'Supervisor'
Order By 
	D.Nome;	
	
/*Exercício 11 - Liste a quantidade de funcionários desta empresa*/
SELECT COUNT(*) AS TotalFuncionarios
FROM Funcionarios;


/*Exercício 12 - Liste o salário médio pago pela empresa*/
Select
	AVG (Salario) AS MediaSalario
From
	Funcionarios;


/*Exercício 13 - Liste o menor salário pago pela empresa em cada departamento*/
Select
	Nome,
    MIN(Salario) AS MenorSalario
From
	Funcionarios F
Inner Join 
	Departamentos D ON (F.CodigoF = D.CodigoD)
Group By
	D.Nome;
	

/*Exercício 14 - Liste o nome completo de todos os funcionários que não tenham segundo nome*/
Select 
	PrimeiroNome,
	SegundoNome,
	UltimoNome
From 
	Funcionarios
Where 
	SegundoNome IFNULL(SegundoNome,'Sem Nome') as SegundoNome
Order By 
	PrimeiroNome, 
	UltimoNome;


/*Exercício 15 - Liste o nome do departamento e do funcionário ordenados por departamento e funcionário*/
Select 
	Nome, 
	PrimeiroNome
From 
	Departamentos D
Inner Join 
	Funcionarios F ON (D.CodigoD = F.CodigoF)
Order By
	D.Nome,
	F.PrimeiroNome;
	
	
/*Exercício 16 - Liste os nomes dos funcionários que moram em 'São José dos Campos' e que exerçam a função de 'Programador'*/
Select  
	PrimeiroNome
From 
	Funcionarios  
Where 
    Cidade = 'São José dos Campos'
And 
	Funcao = 'Programador';


/*Exercício 17 - Liste os nomes dos funcionários que trabalham no departamento Pessoal*/
Select  
	PrimeiroNome
From 
	Funcionarios 
WHERE 
	CodigoF = (Select CodigoD FROM Departamentos Where Nome = 'Departamento Pessoal');


/*Exercício 18 - Liste o nome e o departamento de todos os funcionários que ganham mais do que algum gerentes*/
Select 
	PrimeiroNome, 
	Nome 
From 
	Funcionarios F 
Inner Join  
	Departamentos D ON (F.CodigoF = D.CodigoD)
Where 
	F.Salario > SOME 
(Select 
	Salario FROM Funcionarios 
Where 
	CodigoD IN 
(Select 
	CodigoFuncionarioGerente 
From
	Departamentos));
