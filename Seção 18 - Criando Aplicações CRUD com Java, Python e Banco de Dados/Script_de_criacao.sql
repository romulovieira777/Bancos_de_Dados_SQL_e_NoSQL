-- Criando um banco de dados pmysql
CREATE DATABASE
	pmysql;

-- Escolhendo banco de dados mysql
USE 
	pmysql;

-- Criando tabela produtos
CREATE TABLE IF NOT EXISTS produtos
(
	id INT PRIMARY KEY AUTO_INCREMENT
  , nome VARCHAR(50) NOT NULL
  , preco DECIMAL(8,2) NOT NULL
  , estoque INT NOT NULL
);