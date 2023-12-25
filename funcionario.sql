USE supermercado;

CREATE TABLE Funcao (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100)
);

INSERT INTO Funcao (ID, Nome) VALUES
(1, 'Diretoria'),
(2, 'Almoxerifado'),
(3, 'Padeiro'),
(4, 'Servente'),
(5, 'Embalador'),
(6, 'Ajudante'),
(7, 'Açougueiro'),
(8, 'Porteiro');

CREATE TABLE Funcionario (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    CPF VARCHAR(14),
    Email VARCHAR(100),
    Idade INT,
    Sexo VARCHAR(10),
    OrientacaoSexual VARCHAR(50),
    ID_Funcao INT,
    FOREIGN KEY (ID_Funcao) REFERENCES Funcao(ID)
);

-- Inserção de dados Funcionario
INSERT INTO Funcionario (ID, Nome, CPF, Email, Idade, Sexo, OrientacaoSexual, ID_Funcao) VALUES
(1, 'Carlos', '123.456.789-01', 'carlos@email.com', 45, 'Masculino', 'Heterossexual', 1),
(2, 'Pablo', '123.456.789-02', 'pablo@email.com', 30, 'Masculino', 'Heterossexual', 2),
(3, 'Carla', '123.456.789-03', 'carla@email.com', 25, 'Feminino', 'Heterossexual', 3),
(4, 'Paula', '123.456.789-04', 'paula@email.com', 35, 'Feminino', 'Heterossexual', 4),
(5, 'Dudi', '123.456.789-05', 'dudi@email.com', 40, 'Masculino', 'Heterossexual', 5),
(6, 'João', '123.456.789-06', 'joao@email.com', 50, 'Masculino', 'Heterossexual', 6),
(7, 'Maria', '123.456.789-07', 'maria@email.com', 55, 'Feminino', 'Heterossexual', 7),
(8, 'Pedro', '123.456.789-08', 'pedro@email.com', 60, 'Masculino', 'Heterossexual', 8);
