/*
Atividade 01: Criar procedure para incluir PRODUTO.
*/
CREATE OR REPLACE PROCEDURE SP_PRODUTO_NEW(
    cPRODUTO VARCHAR,
    nQTD NUMBER) 
IS 
V_ID NUMBER := 0; 

BEGIN    
    SELECT COUNT(idproduto)+1 INTO V_ID FROM PRODUTO;
    
    INSERT INTO PRODUTO (idproduto, descricao, quantidade) VALUES (V_ID,cPRODUTO,nQTD);
    DBMS_OUTPUT.PUT_LINE('Produto incluído com sucesso');
END; 

/*
Atividade 02: Criar procedure para incluir CLIENTE.
*/
CREATE OR REPLACE PROCEDURE SP_CLIENTE_NEW(
    V_NOME VARCHAR2,
    V_CPF VARCHAR2,
    V_NASC VARCHAR2) 
IS 
V_ID NUMBER := 0; 

BEGIN    
    SELECT COUNT(idcliente)+1 INTO V_ID FROM CLIENTE;
    
    INSERT INTO CLIENTE (idcliente, nome, dtnascimento, cpf) VALUES (V_ID,V_NOME,TO_DATE(V_NASC,'DD/MM/YYYY'),V_CPF);
    --VALUES (8,'Zumira da Silva',TO_DATE(V_NASC,'DD/MM/YYYY'),'32589674155'); 
    -- VALUES (V_ID,V_NOME,TO_DATE(V_NASC,'DD/MM/YYYY'),V_CPF);
    DBMS_OUTPUT.PUT_LINE('Produto incluído com sucesso');
END; 

