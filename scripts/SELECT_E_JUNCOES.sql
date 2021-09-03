-- Atividade 01: 

SELECT 
cli.nome, 
cli.cpf,
CASE 
WHEN ped.vltotal IS NULL THEN 0
ELSE ped.vltotal
END vltotal
FROM CLIENTE CLI 
LEFT JOIN PEDIDO PED 
ON cli.idcliente = ped.idcliente


-- Atividade 02: 

SELECT 
nome, 
cpf,
vltotal
FROM(
    SELECT 
    cli.nome, 
    cli.cpf,
    CASE 
    WHEN ped.vltotal IS NULL THEN 0
    ELSE ped.vltotal
    END vltotal
    FROM CLIENTE CLI 
    LEFT JOIN PEDIDO PED 
    ON cli.idcliente = ped.idcliente
) TMP 
ORDER BY vltotal DESC


-- Atividade 03:

SELECT 
idproduto,
descricao,
qtdade_pedidos
FROM(
    SELECT 
    prod.idproduto, 
    prod.descricao, 
    --ped.idpedido,
    COUNT(ped.idpedido) QTDADE_PEDIDOS
    FROM PRODUTO PROD
    INNER JOIN ITEMPEDIDO ITEM
    ON prod.idproduto = item.idproduto
    INNER JOIN PEDIDO PED
    ON item.idpedido = ped.idpedido
    GROUP BY prod.idproduto,prod.descricao
    ORDER BY COUNT(ped.idpedido) DESC
) TMP
WHERE ROWNUM <= 3


-- Atividade 04:

SELECT 
nome,
maior_qtdade
FROM(
    SELECT  
    cli.nome,
    SUM(item.quantidade) MAIOR_QTDADE
    FROM CLIENTE CLI
    LEFT JOIN PEDIDO PED
    ON cli.idcliente = ped.idcliente
    INNER JOIN ITEMPEDIDO ITEM
    ON ped.idpedido = item.idpedido
    GROUP BY cli.nome
    ORDER BY SUM(item.quantidade) DESC
) TMP
WHERE ROWNUM <= 1




