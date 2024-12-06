CREATE DATABASE Sacolao;
USE Sacolao;

CREATE TABLE Cliente (
  codigoCliente INT AUTO_INCREMENT PRIMARY KEY,
  nomeCliente VARCHAR(100),
  enderecoCliente VARCHAR(100),
  bairroCliente VARCHAR(50),
  cidadeCliente VARCHAR(50),
  estadoCliente VARCHAR(2),
  datanascimentoCliente DATE, 
  RG VARCHAR(20),
  CPF VARCHAR(15),
  CEP VARCHAR(20),
  Telefone VARCHAR(20),
  Email VARCHAR(100) 
);

CREATE TABLE Produto (
  codigoProduto INT AUTO_INCREMENT PRIMARY KEY,
  nomeProduto VARCHAR(100),
  origemProduto VARCHAR(50),
  vendaProduto VARCHAR(20),
  loteProduto VARCHAR(50),
  fabricacaoProduto DATE,  
  validadeProduto DATE    
);

CREATE TABLE Fornecedor (
  codigoFornecedor INT AUTO_INCREMENT PRIMARY KEY,
  nomeFornecedor VARCHAR(100),  
  CPFFornecedor VARCHAR(15),
  enderecoFornecedor VARCHAR(100),
  bairroFornecedor VARCHAR(100),
  cidadeFornecedor VARCHAR(50),
  EstadoFornecedor VARCHAR(2),
  CEPFornecedor VARCHAR(20),
  CNPJFornecedor VARCHAR(100),
  inscricaoestadualFornecedor VARCHAR(100),
  telefoneFornecedor VARCHAR(30),
  Email VARCHAR(100)
);

CREATE TABLE Funcionario (
  codigoFuncionario INT AUTO_INCREMENT PRIMARY KEY,
  nomeFuncionario VARCHAR(100),
  datanascimentoFuncionario DATE, 
  CPFFuncionario VARCHAR(20),
  enderecoFuncionario VARCHAR(100),
  bairroFuncionario VARCHAR(20),
  estadoFuncionario VARCHAR(2),
  cidadeFuncionario VARCHAR(20),
  CEPFuncionario VARCHAR(20),
  cargoFuncionario VARCHAR(30),
  entradaFuncionario VARCHAR(10),
  saidaFuncionario VARCHAR(10),
  salarioFuncionario DECIMAL(10,2),  
  telefoneFuncionario VARCHAR(30),
  Email VARCHAR(100)  
);
