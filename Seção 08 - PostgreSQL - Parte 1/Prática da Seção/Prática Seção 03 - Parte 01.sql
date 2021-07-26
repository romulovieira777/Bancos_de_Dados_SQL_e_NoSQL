-- Criando um Banco de Dados
CREATE DATABASE IF NOT EXISTS
    secao_03;

-- Escolhendo um Banco de Dados
USE
    secao_03;

-- Criando Tabelas
CREATE TABLE IF NOT EXISTS tipos_produto
(
    id SERIAL PRIMARY KEY
  , descricao CHARACTER VARYING(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS produto
(
    id SERIAL PRIMARY KEY
  , descricao CHARACTER VARYING(50) NOT NULL
  , preco MONEY NOT NULL
  , id_tipo_produto INT REFERENCES tipos_produto
);