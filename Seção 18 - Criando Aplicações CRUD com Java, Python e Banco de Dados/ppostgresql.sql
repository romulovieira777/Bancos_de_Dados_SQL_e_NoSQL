-- Criar banco de dados jpostgresql
jpostgresql

-- Criando tabela produtos
CREATE TABLE produtos
(
    id SERIAL PRIMARY KEY
  , nome VARCHAR(50) NOT NULL
  , preco DECIMAL(8,2) NOT NULL
  , estoque INT NOT NULL
);