USE supermercado;

CREATE TABLE Beneficios (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Valor DECIMAL(8,2),
    ID_Funcionario INT,
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID)
);

-- Cria uma PROCEDURE para calcular o salário total de um funcionário
DELIMITER //
CREATE PROCEDURE CalcularSalario(IN funcionario_id INT)
BEGIN
    DECLARE salario_base DECIMAL(8,2);
    DECLARE total_beneficios DECIMAL(8,2);
    DECLARE dias_de_falta INT;
    DECLARE salario_total DECIMAL(8,2);

    -- Obtém o salário base do funcionário
    SELECT f.SalarioBase INTO salario_base
    FROM Funcionario AS func
    JOIN Funcao AS f ON func.ID_Funcao = f.ID
    WHERE func.ID = funcionario_id;

    -- Calcula o total de benefícios do funcionário
    SELECT SUM(Valor) INTO total_beneficios
    FROM Beneficios
    WHERE ID_Funcionario = funcionario_id;

    -- Obtém o número de dias de falta do funcionário
    SELECT DiasDeFalta INTO dias_de_falta
    FROM Funcionario
    WHERE ID = funcionario_id;

    -- Calcula o salário total
    SET salario_total = salario_base + total_beneficios;

    -- Se o funcionário não faltou muito no mês, adiciona 15% de participação nos lucros
    IF dias_de_falta <= 5 THEN
        SET salario_total = salario_total * 1.15;
    END IF;

    -- Retorna o salário total
    SELECT salario_total AS 'Salario Total';
    
   
DELIMITER //
DROP PROCEDURE IF EXISTS CalcularSalario;
CREATE PROCEDURE CalcularSalario(IN funcionario_id INT)
BEGIN
END //
DELIMITER ;

INSERT INTO Beneficios (ID, Nome, Valor, ID_Funcionario)
VALUES (1, 'Beneficio 1', 100.00, 1);

DROP TABLE IF EXISTS Beneficios;

CREATE TABLE Beneficios (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Valor DECIMAL(8,2),
    ID_Funcionario INT,
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID)
);


    
END //
DELIMITER ;
