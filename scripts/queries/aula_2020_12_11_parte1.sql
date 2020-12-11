SELECT -- PARTE 1: O que eu quero?
	veic.placa as 'Placa',
	veic.nome as 'Nome Veiculo',
	multa_tp.nome as 'Tipo da multa',
	multa_tp.pontos,
	multa_st.descricacao as 'Situação Multa', 
	prop.nome as 'Proprietario',
	prop.documento as 'CPF do Proprietário',
	IFNULL(moto.nome, 'NDA') as 'Motorista'	
FROM -- PARTE 2: De onde eu pego?
	db_diego_logistica.veiculo_multa veic_multa
	INNER JOIN db_diego_logistica.multa_tipo multa_tp ON veic_multa.multa_tipo_id  = multa_tp.id 
	INNER JOIN db_diego_logistica.multa_situacao multa_st ON multa_st.id = veic_multa.multa_situacao_id 	
	LEFT JOIN db_diego_logistica.motorista moto ON moto.id = veic_multa.motorista_responsavel_id 
	INNER JOIN db_diego_logistica.veiculo veic ON veic.id = veic_multa.veiculo_id
	INNER JOIN db_diego_logistica.proprietario prop ON veic.proprietario_id = prop.id
 WHERE -- PARTE 3: Quais condições?
 	veic.placa = 'CJC1752'
-- PARTE 4+
ORDER BY -- PARTE 4 (Opcional)
	multa_tp.pontos DESC;
	

SELECT -- PARTE 1: O que eu quero?
	veic.placa as 'Placa',
	COUNT(multa_tp.pontos) as 'Quantidade de multas',
	SUM(multa_tp.pontos) as 'Total de pontos'
FROM -- PARTE 2: De onde eu pego?
	db_diego_logistica.veiculo_multa veic_multa
	INNER JOIN db_diego_logistica.multa_tipo multa_tp ON veic_multa.multa_tipo_id  = multa_tp.id 
	INNER JOIN db_diego_logistica.multa_situacao multa_st ON multa_st.id = veic_multa.multa_situacao_id 	
	LEFT JOIN db_diego_logistica.motorista moto ON moto.id = veic_multa.motorista_responsavel_id 
	INNER JOIN db_diego_logistica.veiculo veic ON veic.id = veic_multa.veiculo_id
	INNER JOIN db_diego_logistica.proprietario prop ON veic.proprietario_id = prop.id
 -- WHERE -- PARTE 3: Quais condições?
 	-- veic.placa = 'CJC1752'
-- PARTE 4+
 GROUP BY -- PARTE 4 (Opcional)
	 veic.placa HAVING COUNT(multa_tp.pontos) > 1
;


SELECT 
	MONTH(veic_multa.data_infracao),
	count(*) 
FROM 
	db_diego_logistica.veiculo_multa veic_multa
GROUP BY	
	MONTH(veic_multa.data_infracao)
;
 
SELECT 
	date_format(veic_multa.data_infracao, '%d/%m/%Y') as 'Data',  -- Y m d H i s
	COUNT(veic_multa.data_infracao)
FROM 
	db_diego_logistica.veiculo_multa veic_multa
WHERE
	veic_multa.data_infracao > '2020-10-11 00:00:00' 
	AND veic_multa.data_infracao < '2020-12-11 23:59:59'
GROUP BY 
	date_format(veic_multa.data_infracao, '%d/%m/%Y')
;

SELECT 
	date_format(veic_multa.data_infracao, '%d/%m/%Y') as 'Data',  -- Y m d H i s
	COUNT(veic_multa.data_infracao)
FROM 
	db_diego_logistica.veiculo_multa veic_multa
WHERE
	veic_multa.data_infracao BETWEEN '2020-10-11 00:00:00' AND '2020-12-10 23:59:59'
GROUP BY 
	veic_multa.data_infracao
;

SELECT 
	date_format(veic_multa.data_infracao, '%d/%m/%Y') as 'Data',  -- Y m d H i s
	COUNT(veic_multa.data_infracao)
FROM 
	db_diego_logistica.veiculo_multa veic_multa
WHERE
	veic_multa.data_infracao BETWEEN '2020-10-11 00:00:00' AND NOW()
GROUP BY 
	veic_multa.data_infracao
;


SELECT -- PARTE 1: O que eu quero?
	veic.placa as 'Placa',
	veic.nome as 'Nome Veiculo',
	multa_tp.nome as 'Tipo da multa',
	multa_tp.pontos,
	multa_st.descricacao as 'Situação Multa', 
	prop.nome as 'Proprietario',
	prop.documento as 'CPF do Proprietário',
	IFNULL(moto.nome, 'NDA') as 'Motorista'	
FROM -- PARTE 2: De onde eu pego?
	db_diego_logistica.veiculo_multa veic_multa
	INNER JOIN db_diego_logistica.multa_tipo multa_tp ON veic_multa.multa_tipo_id  = multa_tp.id 
	INNER JOIN db_diego_logistica.multa_situacao multa_st ON multa_st.id = veic_multa.multa_situacao_id 	
	LEFT JOIN db_diego_logistica.motorista moto ON moto.id = veic_multa.motorista_responsavel_id 
	INNER JOIN db_diego_logistica.veiculo veic ON veic.id = veic_multa.veiculo_id
	INNER JOIN db_diego_logistica.proprietario prop ON veic.proprietario_id = prop.id
 WHERE -- PARTE 3: Quais condições?
 	veic.placa = 'DMK3097'
 	OR moto.nome LIKE '%B%'
-- PARTE 4+
ORDER BY -- PARTE 4 (Opcional)
	multa_tp.pontos DESC; 


select * from db_diego_logistica.veiculo_multa;
select * from db_diego_logistica.veiculo;
select * from db_diego_logistica.proprietario p where p.nome LIKE '%M%'; 