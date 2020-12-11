SELECT 
	mt.nome,
	ms.nome,
	m2.*
FROM 
	viagem v
	INNER JOIN motorista mt ON mt.id = v.motorista_titular_id 
	INNER JOIN monitoramento m2 ON m2.viagem_id = v.id 
	INNER JOIN monitoramento_situacao ms ON m2.monitoramento_situacao_id  = ms.id 
WHERE 
	v.id = 2
ORDER BY 
	m2.data_alerta DESC;
	

-- YEAR, MONTH, DAY, HOUR, MINUTE
SELECT 
	v.id,
	mt.nome as "Motorista titular",
	mr.nome as "Motorista reserva",
	DATEDIFF(v.data_chegada, v.data_saida) as duracao_dias,
	TIMESTAMPDIFF(HOUR,v.data_saida, v.data_chegada) as duracao_horas, 
	TIMESTAMPDIFF(MINUTE,v.data_saida_prevista, v.data_saida) as data_saida,
	IF(
		TIMESTAMPDIFF(MINUTE,v.data_saida_prevista, v.data_saida) <= 0, -- CONDIÇÃO
		concat('Saída com ', TIMESTAMPDIFF(MINUTE,v.data_saida_prevista, v.data_saida), ' minutos de antecedencia') , 
		concat('Saída com ', TIMESTAMPDIFF(MINUTE,v.data_saida_prevista, v.data_saida), ' minutos de atraso')
	) as 'status_saida'
FROM 
	viagem v
	INNER JOIN motorista mt ON v.motorista_titular_id = mt.id
	LEFT JOIN motorista mr ON v.motorista_reserva_id = mr.id;
	
SELECT 
	MONTH(v.data_chegada), SUM(v.valor)
FROM 	
	viagem v
GROUP BY
	MONTH(v.data_chegada);

SELECT 
	v.data_chegada
FROM 	
	viagem v;

SELECT 
	MONTH(v.data_chegada), COUNT(*)
FROM 
	viagem v
GROUP BY 
	MONTH(v.data_chegada); 
	
SELECT 
	v.motorista_titular_id, m2.nome, COUNT(*) AS total
FROM 
	viagem v
	INNER JOIN motorista m2 ON m2.id = v.motorista_titular_id 
GROUP BY 
	v.motorista_titular_id, m2.nome
	HAVING count(*) >= 2
ORDER BY total DESC; 


SELECT IF(1 = 2, 'Verdade', 'mentira');
SELECT concat('Agora são ', DATE_FORMAT(now(), '%d/%m/%Y %H:%i'));