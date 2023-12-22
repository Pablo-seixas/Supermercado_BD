CREATE DATABASE supermercado;

USE supermercado;

-- Criação das tabelas
CREATE TABLE Produto (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Preco DECIMAL(5,2),
    Peso DECIMAL(5,2),
    Setor VARCHAR(100)
);

CREATE TABLE Cliente (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    CPF VARCHAR(14),
    DataNascimento DATE,
    EstadoCivil VARCHAR(10),
    TemFilhos BOOLEAN,
    Telefone VARCHAR(15),
    Email VARCHAR(100),
    TipoCliente VARCHAR(10)
);

INSERT INTO Cliente (ID, Nome, CPF, DataNascimento, EstadoCivil, TemFilhos, Telefone, Email, TipoCliente, Idade) VALUES
(1, 'João', '123.456.789-00', '2000-01-01', 'Solteiro', FALSE, '(11) 12345-6789', 'joao@email.com', 'Normal', 23);


CREATE TABLE NotaFiscal (
    ID INT PRIMARY KEY,
    DataEmissao DATE,
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID)
);

CREATE TABLE ItensNotaFiscal (
    ID INT PRIMARY KEY,
    ID_NotaFiscal INT,
    ID_Produto INT,
    Quantidade INT,
    FOREIGN KEY (ID_NotaFiscal) REFERENCES NotaFiscal(ID),
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID)
);

-- Inserção de dados na tabela Produto
INSERT INTO Produto (ID, Nome, Preco, Peso, Setor) VALUES
(1, 'Leite', 3.50, 1.00, 'Alimentos'),
(2, 'Café', 5.00, 0.50, 'Alimentos'),
(3, 'Açúcar', 2.50, 1.00, 'Alimentos'),
(4, 'Macarrão', 4.00, 0.50, 'Alimentos'),
(5, 'Biscoito', 1.50, 0.30, 'Alimentos'),
(6, 'Bolacha', 1.50, 0.30, 'Alimentos'),
(7, 'Ovo', 6.00, 0.10, 'Alimentos'),
(8, 'Banana', 2.00, 0.20, 'Alimentos'),
(9, 'Batata', 3.00, 0.50, 'Alimentos'),
(10, 'Suco de Laranja', 7.00, 1.00, 'Bebidas'),
(11, 'Produtos de Limpeza', 10.00, 2.00, 'Limpeza');
