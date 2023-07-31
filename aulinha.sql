CREATE DATABASE intel;
USE intel;

CREATE TABLE tb_funcionario(
    id_fun CHAR(4) PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    data_contratacao DATE NOT NULL,
    genero ENUM('M', 'F') NOT NULL
);  

ALTER TABLE tb_funcionario ADD COLUMN genero ENUM('M', 'F') NOT NULL;

CREATE TABLE tb_salario(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    salario FLOAT(8) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    fun_id CHAR(4) NOT NULL,
    FOREIGN KEY (fun_id) REFERENCES tb_funcionario(id_fun)
);

CREATE TABLE tb_cargo(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    fun_id CHAR(4) NOT NULL,
    FOREIGN KEY(fun_id) REFERENCES tb_funcionario(id_fun)
);

CREATE TABLE tb_departamento(
    id_dept CHAR(4) PRIMARY KEY NOT NULL,
    nome VARCHAR(50) UNIQUE NOT NULL 
);

CREATE TABLE tb_dept_fun(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    fun_id CHAR(4) NOT NULL,
    dept_id CHAR(4) NOT NULL,
    FOREIGN KEY(fun_id) REFERENCES tb_funcionario(id_fun),
    FOREIGN KEY(dept_id) REFERENCES tb_departamento(id_dept)
);









INSERT INTO `tb_funcionario` VALUES ('F001','Ana','Silva','1990-01-10','2015-03-01','F'),('F002','Bruno','Santos','1988-05-15','2016-06-20','M'),('F003','Carla','Oliveira','1992-09-30','2017-10-05','F'),('F004','Daniel','Costa','1986-12-25','2014-01-15','M'),('F005','Eduarda','Ribeiro','1991-04-07','2018-07-30','F'),('F006','Fabio','Gomes','1989-07-12','2016-09-10','M'),('F007','Gabriela','Martins','1993-02-14','2019-04-01','F'),('F008','Henrique','Lima','1987-06-18','2015-05-25','M'),('F009','Isabela','Alves','1990-03-21','2017-08-15','F'),('F010','João','Pereira','1985-10-31','2013-11-01','M'),('F011','Karina','Souza','1992-08-24','2018-12-20','F'),('F012','Lucas','Rodrigues','1989-11-11','2016-02-29','M'),('F013','Maria','Ferreira','1991-05-05','2017-06-06','F'),('F014','Nelson','Barbosa','1988-04-04','2015-07-07','M'),('F015','Olivia','Cardoso','1993-03-03','2019-08-08','F'),('F016','Pedro','Machado','1986-02-02','2014-09-09','M'),('F017','Raquel','Nunes','1990-01-01','2016-10-10','F'),('F018','Tiago','Silveira','1987-12-12','2015-11-11','M'),('F019','Valeria','Campos','1994-11-11','2020-12-12','F'),('F020','Wesley','Araujo','1985-10-10','2013-01-01','M');
INSERT INTO `tb_cargo` VALUES (1,'Desenvolvedor','2017-10-05','2019-10-05','F001'),(2,'Engenheiro de Software','2014-01-15','2016-01-15','F002'),(57,'Analista de Sistemas','2016-06-20','2018-06-20','F003'),(58,'Tester','2018-07-15','2020-07-12','F004'),(59,'Arquiteto de Software','2019-04-01','2021-04-08','F005'),(60,'Gerente de Projetos','2015-05-25','2019-04-07','F006'),(61,'Scrum Master','2017-08-15','2020-04-01','F007'),(62,'Product Owner','2013-11-01','2015-04-01','F008'),(63,'DevOps Engineer','2018-12-20','2019-12-20','F009'),(64,'UX Designer','2016-02-29','2018-12-20','F010'),(65,'Desenvolvedor','2017-10-05','2018-12-27','F011'),(66,'Engenheiro de Software','2014-01-15','2018-06-20','F012'),(67,'Analista de Sistemas','2016-06-20','2018-11-20','F013'),(68,'Tester','2018-07-30','2018-12-20','F014'),(69,'Arquiteto de Software','2019-04-01','2020-12-20','F015'),(70,'Gerente de Projetos','2015-05-25','2018-01-20','F016'),(71,'Scrum Master','2017-08-15','2018-12-20','F017'),(72,'Product Owner','2013-11-01','2015-12-20','F018'),(73,'DevOps Engineer','2018-12-20','2018-08-20','F019'),(74,'UX Designer','2016-02-29','2018-09-20','F020');
INSERT INTO `tb_departamento` VALUES ('D001','Administração'),('D002','Contabilidade'),('D003','Desenvolvimento'),('D004','Engenharia'),('D005','Finanças');
INSERT INTO `tb_dept_fun` VALUES (1,'2015-03-01','2018-03-01','F001','D001'),(2,'2016-06-20','2019-03-01','F002','D002'),(3,'2017-10-05','2019-05-01','F003','D003'),(4,'2014-01-15','2018-06-01','F004','D004'),(5,'2018-07-30','2020-03-01','F005','D005'),(16,'2015-03-01','2018-03-01','F006','D001'),(17,'2016-06-20','2019-03-01','F007','D002'),(18,'2017-10-05','2019-05-01','F008','D003'),(19,'2014-01-15','2018-06-01','F009','D004'),(20,'2018-07-30','2020-03-01','F010','D005'),(21,'2015-03-01','2018-03-01','F011','D001'),(22,'2016-06-20','2019-03-01','F012','D002'),(23,'2017-10-05','2019-05-01','F013','D003'),(24,'2014-01-15','2018-06-01','F014','D004'),(25,'2018-07-30','2020-03-01','F015','D005'),(26,'2015-03-01','2018-03-01','F016','D001'),(27,'2016-06-20','2019-03-01','F017','D002'),(28,'2017-10-05','2019-05-01','F018','D003'),(29,'2014-01-15','2018-06-01','F019','D004'),(30,'2018-07-30','2020-03-01','F020','D005');
INSERT INTO `tb_salario` VALUES (39,5000,'2015-03-01','2016-02-29','F001'),(40,6000,'2016-03-01','2017-02-28','F002'),(41,7000,'2017-03-01','2018-02-28','F003'),(42,8000,'2018-03-01','2019-02-28','F004'),(43,9000,'2019-03-01','2020-02-29','F005'),(44,10000,'2020-03-01','2021-02-28','F006'),(45,11000,'2021-03-01','2021-04-28','F007'),(46,4000,'2016-06-20','2017-06-19','F008'),(47,4500,'2017-06-20','2018-06-19','F009'),(48,5000,'2018-06-20','2021-08-28','F010'),(49,3000,'2017-10-05','2018-02-20','F011'),(50,3500,'2014-01-15','2021-08-28','F012'),(51,4000,'2018-07-30','2021-10-28','F013'),(52,4500,'2016-09-10','2022-02-28','F014'),(53,5000,'2019-04-01','2021-02-15','F015'),(54,5500,'2015-05-25','2023-02-28','F016'),(55,6000,'2017-08-15','2020-02-28','F017'),(56,7500,'2013-11-01','2021-04-28','F018'),(57,8500,'2013-11-01','2015-02-28','F019'),(58,2500,'2013-11-01','2016-02-28','F020');


DROP TABLE tb_departamento;

# OPERADORES SQL

-- Comparação (<, >, <=, >=, =)
-- BETWEEN: Seleção entre os intervalos;
-- LIKE: Seleciona por meio de um padrão;
-- IN: Seleção entre um conjunto de valores;

SELECT * FROM tb_funcionario WHERE sobrenome = "Vinícius";
SELECT * FROM tb_funcionario WHERE id_fun = "F005";
SELECT * FROM tb_salario WHERE salario <= 6000;

-- DISTINCT
SELECT DISTINCT cargo FROM tb_cargo;
SELECT DISTINCT genero FROM tb_funcionario;

# Operadores lógicas
-- AND: Só se as duas condições forem verdadeiras;
-- OR (||):Se algumas das condições forem verdadeiras;
-- NOT: Negar o resultado final;

# AND -

SELECT * FROM tb_salario WHERE salario >= 5000 AND salario <= 10000;
SELECT * FROM tb_salario WHERE salario >= 2000 AND salario <= 5000 AND fun_id > 'F006';

# OR - 

SELECT * FROM tb_cargo WHERE cargo = "Engenheiro de Software" OR cargo = "Tester";

# NOT - Inverte uma cláusula

SELECT * FROM tb_cargo WHERE NOT cargo = "Tester" AND NOT cargo = "Engenheiro de Software";

# ORDENANDO RESULTADOS
-- ORDER BY utiliza dois parâmetros;
    -- ASC: Ordem crescente;
    -- DESC: Ordem descrescente;

-- Utilizamos o "ORDER BY" APÓS O WHERE.
SELECT * FROM tb_salario ORDER BY salario DESC;
SELECT * FROM tb_salario ORDER BY salario ASC;

-- SELECIONAR NA TABELA CARGOS TODAS AS COLUNAS, PORÉM, COM OS CARGOS EM ORDEM DECRESCENTE
SELECT * FROM tb_cargo ORDER BY cargo DESC;

-- LIMITAR OS DADOS EM UMA CONSULTA
    -- LIMIT: Comando utilizado para limitar uma consulta;
    -- Podemos unir com o WHERE

SELECT * FROM tb_salario ORDER BY salario DESC LIMIT 10;