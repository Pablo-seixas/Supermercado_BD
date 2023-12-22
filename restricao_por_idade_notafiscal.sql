USE supermercado;

-- Adiciona uma coluna 'Idade' na tabela Cliente
ALTER TABLE Cliente ADD Idade INT;

-- Adiciona uma coluna 'Restrito' na tabela Produto para indicar se o produto é restrito para menores de 18 anos
ALTER TABLE Produto ADD Restrito BOOLEAN;

-- Supondo que os IDs 12 e 13 são para 'Bebida Alcoólica' e 'Cigarro'
UPDATE Produto SET Restrito = TRUE WHERE ID IN (12, 13);

-- Cria uma PROCEDURE para realizar uma compra
DELIMITER //
CREATE PROCEDURE RealizarCompra(IN cliente_id INT, IN produto_id INT)
BEGIN
    DECLARE idade_cliente INT;
    DECLARE produto_restrito BOOLEAN;

    -- Obtém a idade do cliente
    SELECT Idade INTO idade_cliente FROM Cliente WHERE ID = cliente_id;

    -- Verifica se o produto é restrito
    SELECT Restrito INTO produto_restrito FROM Produto WHERE ID = produto_id;

    -- Se o cliente for menor de 18 anos e o produto for restrito, retorna uma mensagem de erro
    IF idade_cliente < 18 AND produto_restrito THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Venda proibida para menores de 18 anos.';
    ELSE
        -- Insere a compra na tabela NotaFiscal
        INSERT INTO NotaFiscal (DataEmissao, ID_Cliente) VALUES (CURDATE(), cliente_id);

        -- Obtém o ID da nota fiscal inserida
        SET @nota_fiscal_id = LAST_INSERT_ID();

        -- Insere o item na tabela ItensNotaFiscal
        INSERT INTO ItensNotaFiscal (ID_NotaFiscal, ID_Produto, Quantidade) VALUES (@nota_fiscal_id, produto_id, 1);

        -- Retorna uma mensagem de sucesso
        SELECT 'Compra realizada com sucesso. Feliz Ano Novo!';
    END IF;
END //
DELIMITER ;

ALTER TABLE Cliente MODIFY Idade INT;

UPDATE Cliente SET Idade = 25 WHERE ID = 1;

