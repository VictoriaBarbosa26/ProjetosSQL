/*ATIVIDADE DE BANCO DE DADOS - COPA DO MUNDO*/

create database SERVERCOPA;
use SERVERCOPA;

create table PAIS( 
nome_pais varchar (50) primary key not null,
numero_de_jogadores varchar (25),
numero_de_pessoas_comissao_tecnica varchar (50),
qtde_de_jogos_pais varchar (150),
tecnico varchar (100),
capitao varchar (100),
grupo_atual references GRUPOS (Id_grupo));

insert into PAIS(
nome_pais,
numero_de_jogadores,
numero_de_pessoas_comissao_tecnica,
qtde_de_jogos_pais,
tecnico,
capitao,
grupo_atual)
(BRASIL,'26','20','3 jogos (sem contar caso passe para as proximas fases.)','Adenor Leonardo Bachi(TITE)','Thiago Silva','G'),
(SUIÇA,'26','20','3 jogos (sem contar caso passe para as proximas fases.)','Murak yakin','Granit Xhaka','G'),

(ALEMANHA,'26','15','3 jogos (sem contar caso passe para as proximas fases.)','Hans-Dieter Flick','Neuer','E'),
(ESPANHA,'26','15','3 jogos (sem contar caso passe para as proximas fases.)','Luis Henrique','Sergio Busquets','E'),

(ARGENTINA,'26','14','3 jogos (sem contar caso passe para as proximas fases.)','Lionel Scaloni','Lionel Messi','C'),
(MÉXICO,'26','14','3 jogos (sem contar caso passe para as proximas fases.)','Gerardo Martino','Andrés Guardado','C'),

(PORTUGAL,'26','13','3 jogos (sem contar caso passe para as proximas fases.)','Fernando Santos','Cristiano Ronaldo','H'),
(URUGUAI,'26','13','3 jogos (sem contar caso passe para as proximas fases.)','Diego Alonso','Diogo Godín','H'),

(INGLATERRA,'26','16','3 jogos (sem contar caso passe para as proximas fases.)','Gareth Southgate','Harry Kane','B'),
(ESTADOS UNIDOS,'26','16','3 jogos (sem contar caso passe para as proximas fases.)','Gregg Berhalter','tyler Adams','B');
select * from PAIS;



create table GRUPOS(
Id_grupo varchar (50) primary key not null,
nome_pais varchar (50) references PAIS (nome_pais),
confrontos references JOGOS (id_jogos),
posicao_na_tabela varchar (50));

insert into GRUPOS (
Id_grupo,
nome_pais,
confrontos,
posicao_na_tabela)
(G,'BRASIL','3','1º Lugar'),/*tem mais confrontos porém são muitos e achei melhor não colocar, para não pesar*/
(G,'SUIÇA','4','2º Lugar'),

(E,'ALEMANHA','5','3º Lugar'),
(E,'ESPANHA','6','1º Lugar'),

(C,'ARGENTINA','9','2º Lugar'),
(C,'MÉXICO','10','4º Lugar'),

(H,'PORTUGAL','7','1º Lugar'),
(H,'URUGUAI','8','3º Lugar'),

(B,'INGLATERRA','2','1º Lugar'),
(B,'ESTADOS UNIDOS','1','2º Lugar');
select * from GRUPOS;




create table JOGADORES (
id_jogadores varchar (50) primary key not null,
nacionalidade varchar (50) references PAIS (nome_pais),
idade_jogador varchar (10),
posicao varchar (30),
nome_jogador varchar (100),
clube_jogador varchar (75),
numero_camisa_selecao varchar(5));

insert into JOGADORES (
id_jogadores,
nacionalidade,
idade_jogador,
posicao,
nome_jogador,
clube_jogador,
numero_camisa_selecao)
(123,'BRASIL','30','Atacante','Neymar da Silva Santos Júnior','Paris Saint-Germain Football Club','10'),
(124,'BRASIL','21','Atacante','Gabriel Teodoro Martinelli Silva','Arsenal Fotball Club','26'),

(125,'ALEMANHA','33','Atacante','Thomas Müller','Bayer de Munich'),
(126,'ALEMANHA','33','Atacante','Thomas Müller','Bayer de Munich'),

(127,'ARGENTINA','35','Atacante','Lionel Andrés Messi Cuccittini','Paris Saint-Germain Football Club','10'),
(128,'ARGENTINA','25','Atacante','Lautaro Javier Martínez','Inter de Milão','22'),

(129,'PORTUGAL','37','Atacante','Cristiano Ronaldo dos Santos Aveiro','Manchester United','7'),
(130,'PORTUGAL','23','Goleiro','Diogo Meireles Costa','Futebol Clube do Porto','22'),

(131,'INGLATERRA','29','Atacante','Harry Edward Kane MBE','Tottenham','9'),
(132,'INGLATERRA','27','Atacante','Raheem Sterling','Chelsea Fotball Club','10'),

(133,'MÉXICO','37','Goleiro','Guillermo Ochoa Magaña','Club de Fútbol América','13'),
(134,'MÉXICO','31','Atacante','Raúl Jiménez','Wolverhsmpton Wanderers F.C.','9'),

(135,'ESTADOS UNIDOS','24','Meia','Christian Pulisic','Chelsea Fottball Club','10'),
(136,'ESTADOS UNIDOS','20','Meia','Giovanni Reyna','Borussia Dortmund','7'),


(137,'URUGUAI','35','Atacante','Luis Alberto Suárez','Club Nacional de Football','9'),
(138,'URUGUAI','36','Zagueiro','Diego Roberto Godín Leal','Club Atlético Vélez Sarsfield','3'),

(131,'ARABIA SAUDITA','31','Meia','Salem Mohammed Al-Dawsari','Al-Hilal Saudi Fotball Club','29'),
(13,'ARABIA SAUDITA','33','Meia','Salman Mohammed Al-Faraj','Al-Hilal Saudi Fotball Club','7');
select * from JOGADORES;




create table JOGOS (
id_jogos varchar (50) primary key not null,
confronto varchar (90),
arbitragem varchar (250) references ARBITROS (id_arbitro),
estadio references ESTADIO (id_estadio),
data_jogos datetime,
hora_jogos time,
placar_final_jogos varchar (30),
grupo_jogo references GRUPOS (Id_grupo));

insert into JOGOS (
id_jogos,
confronto,
arbitragem,
estadio,
data_jogos,
hora_jogos,
placar_final_jogos,
grupo_jogo)
(1,'Estados Unidos x Irã','111','11','29/11/2022','07:00','1x0','B'),
(2,'Inglaterra x Gales','333','22','29/11/2022','13:00','3x0','B'),

(3,'Brasil x Sérvia','444','33','24/11/2022','16:00','2x0','G'),
(4,'Suiça x Sérvia','555','44','02/12/2022','12:00','3x2','G'),

(5,'Espanha x Alemanha','222','55','27/11/2022','16:00','1x1','E'),
(6,'Espanha x Japão','444','22','01/11/22022','12:00','1x2','E'),

(7,'Portugal x Uruguai','111','11','21/11/2022','10:00','2x0','H'),
(8,'Uruguai x Gana','333','33','02/12/2022','16:00','2x0','H'),

(9,'Argentina x Arabia Saudita','444','22','22/11/2022','12:00','1x2','C'),
(10,'México x Argentina','222','55','26/11/2022','16:00','2x0','C');
select * from JOGOS;



create table ARBITROS (
id_arbitros varchar (50) primary key not null,
nome_arbitro varchar (100),
jogos_que_apita_na_copa references JOGOS (id_jogos),
nacionalidade varchar (50),
idade_arbitro varchar (25),
pais_que_atua varchar (50));

insert into ARBITROS(
id_arbitros,
nome_arbitro,
jogos_que_apita_na_copa,
nacionalidade,
idade_arbitro,
pais_que_atua)
(111,'Stephanie Frappart','1','França','38','França'),
(222,'Salima Mukansanga','3','Ruanda','38','Ruanda'),
(333,'Yoshimi Yamashita','5','Japão','36','Japão'),
(444,'Raphael Claus','8','Brasil','43','Brasil'),
(555,'Victor Gomes','2','África do Sul','39','África do Sul');
select * from ARBITROS;



create table ESTADIO (
id_estadio varchar (50) primary key not null,
nome_estadio varchar (50),
capacidade varchar (50),
localizacao varchar (50),
numero_de_jogos_no_estadio varchar (50));


insert into ESTADIO (
id_estadio,
nome_estadio,
capacidade,
localizacao,
numero_de_jogos_no_estadio)
(11,'Estádio Al Thumama','40.000','6GPJ+8X4, Doha, Catar','7'),
(22,'Estádio Khalifa International','45.416','Doha, no Qatar','10'),
(33,'Estádio Al Bayt','60.000','MF2Q+W4G, Al Khor, Catar','5'),
(44,'Estádio Lusail','80.000','CFCR+75، لوسيل،, Catar','4'),
(55,'Estádio Al Janoub','40.000','Estádio Al-Wakrah','20');
select * from ESTADIO;


