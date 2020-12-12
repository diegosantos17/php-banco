-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: db_diego_logistica
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cnh_categoria`
--

DROP TABLE IF EXISTS `cnh_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cnh_categoria` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `criado_em` datetime DEFAULT current_timestamp() COMMENT 'Data da criação do registro',
  `criado_por` int(11) DEFAULT NULL COMMENT 'Usuário que criou o registro',
  `alterado_em` datetime DEFAULT current_timestamp() COMMENT 'Data da última alteração do registro',
  `alterado_por` int(11) DEFAULT NULL COMMENT 'Usuário que realizou a última alteração no registro.',
  PRIMARY KEY (`id`),
  KEY `cnh_categoria_FK` (`criado_por`),
  KEY `cnh_categoria_FK_1` (`alterado_por`),
  CONSTRAINT `cnh_categoria_FK` FOREIGN KEY (`criado_por`) REFERENCES `usuario` (`id`),
  CONSTRAINT `cnh_categoria_FK_1` FOREIGN KEY (`alterado_por`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tipos de CNH permitidos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnh_categoria`
--

LOCK TABLES `cnh_categoria` WRITE;
/*!40000 ALTER TABLE `cnh_categoria` DISABLE KEYS */;
INSERT INTO `cnh_categoria` VALUES (1,'Categoria A',' Para condutor de veículo motorizado de 2 ou 3 rodas, como motos ou triciclos.','2020-12-10 15:20:15',NULL,NULL,NULL),(2,'Categoria B','Para condutor de veículo motorizado cujo peso total não deve exceder 3500 kg, com lotação máxima de 8 ocupantes. Ex: carros de passeio.','2020-12-10 15:20:15',NULL,NULL,NULL),(3,'Categoria C','Para condutor de veículo motorizado utilizado para transporte de carga, com o peso bruto para além de 3500 kg. Para  essa categoria o motorista deve estar a pelo menos um ano com a CNH da Categoria B.','2020-12-10 15:20:15',NULL,NULL,NULL),(4,'Categoria D','Para condutor de veículo motorizado que trabalhe com transporte de passageiros em veículo com mais de 8 lugares. Para essa categoria o motorista deve ter 1 ano da CNH Categoria C ou dois anos da CNH Categoria B.','2020-12-10 15:20:15',NULL,NULL,NULL),(5,'Categoria E','Para condutor de veículo motorizado que se enquadre nas categorias B, C ou D e sobre o qual esteja acoplada uma carroceria reboque, semi-reboque ou articulada com 6000 kg ou mais. A modalidade trailer se encaixa nessa categoria. Para ser habilitado na Categoria E, o motorista deve estar habilitado a pelo menos 1 ano na Categoria C.','2020-12-10 15:20:15',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cnh_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fabricante`
--

DROP TABLE IF EXISTS `fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fabricante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `criado_em` datetime DEFAULT current_timestamp() COMMENT 'Data da criação do registro.',
  `criado_por` int(11) DEFAULT NULL COMMENT 'Usuário que criou o registro',
  `alterado_em` datetime DEFAULT current_timestamp() COMMENT 'Data da última alteração do registro',
  `alterado_por` int(11) DEFAULT NULL COMMENT 'Usuário que realizou a última alteração',
  PRIMARY KEY (`id`),
  KEY `fabricante_FK` (`criado_por`),
  KEY `fabricante_FK_1` (`alterado_por`),
  CONSTRAINT `fabricante_FK` FOREIGN KEY (`criado_por`) REFERENCES `usuario` (`id`),
  CONSTRAINT `fabricante_FK_1` FOREIGN KEY (`alterado_por`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabricante`
--

LOCK TABLES `fabricante` WRITE;
/*!40000 ALTER TABLE `fabricante` DISABLE KEYS */;
INSERT INTO `fabricante` VALUES (1,'Volvo','2020-12-10 15:16:28',1,'2020-12-10 15:16:28',1),(2,'Scania ','2020-12-10 15:16:28',1,'2020-12-10 15:16:28',1),(3,'Mercedes-Benz','2020-12-10 15:16:28',1,'2020-12-10 15:16:28',1),(4,'DAF ','2020-12-10 15:16:28',1,'2020-12-10 15:16:28',1);
/*!40000 ALTER TABLE `fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitoramento`
--

DROP TABLE IF EXISTS `monitoramento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitoramento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Id do monitoramento',
  `viagem_id` int(11) DEFAULT NULL COMMENT 'Viagem em monitoramento',
  `data_alerta` datetime DEFAULT current_timestamp() COMMENT 'Data do recebimento do alerta',
  `monitoramento_situacao_id` smallint(6) DEFAULT NULL COMMENT 'Tipo de monitoramento.',
  PRIMARY KEY (`id`),
  KEY `monitoramento_FK` (`monitoramento_situacao_id`),
  CONSTRAINT `monitoramento_FK` FOREIGN KEY (`monitoramento_situacao_id`) REFERENCES `monitoramento_situacao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='Registra todos os monitoramentos da viagem.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitoramento`
--

LOCK TABLES `monitoramento` WRITE;
/*!40000 ALTER TABLE `monitoramento` DISABLE KEYS */;
INSERT INTO `monitoramento` VALUES (1,2,'2020-12-10 12:00:00',1),(2,2,'2020-12-10 12:02:00',1),(3,2,'2020-12-10 12:02:00',1),(4,2,'2020-12-10 12:02:00',1),(5,2,'2020-12-10 12:02:00',1),(6,2,'2020-12-10 12:02:00',1),(7,2,'2020-12-10 12:20:00',4);
/*!40000 ALTER TABLE `monitoramento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitoramento_situacao`
--

DROP TABLE IF EXISTS `monitoramento_situacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitoramento_situacao` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Id do Tipo de monitoramento.',
  `nome` varchar(100) DEFAULT NULL COMMENT 'Nome do monitoramento',
  `descricao` varchar(5000) DEFAULT NULL COMMENT 'Observações do tipo de monitoramento.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='Situação de monitoramento';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitoramento_situacao`
--

LOCK TABLES `monitoramento_situacao` WRITE;
/*!40000 ALTER TABLE `monitoramento_situacao` DISABLE KEYS */;
INSERT INTO `monitoramento_situacao` VALUES (1,'Normal',NULL),(2,'Parada',NULL),(3,'Porta aberta',NULL),(4,'Violação da carga',NULL),(5,'Acionamento botão de pânico',NULL),(6,'Área de risco',NULL);
/*!40000 ALTER TABLE `monitoramento_situacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motorista`
--

DROP TABLE IF EXISTS `motorista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motorista` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador do motorista',
  `nome` varchar(100) NOT NULL COMMENT 'Nome do motorista',
  `documento` varchar(20) DEFAULT NULL COMMENT 'CPF ou CNPJ do motorista somente números',
  `data_nascimento` date DEFAULT NULL COMMENT 'Data de nascimento do motorista',
  `ativo_flag` bit(1) DEFAULT NULL COMMENT '0 = Inativo, 1 = Ativo ',
  `cnh_numero_registro` varchar(11) DEFAULT NULL COMMENT 'Número do registro da CNH',
  `cnh_categoria_id` int(11) NOT NULL COMMENT 'Categoria de CNH do motorista',
  `cnh_data_primeira_emissao` datetime DEFAULT NULL COMMENT 'Data da primeira emissão da CNH',
  `cnh_data_validade` varchar(100) DEFAULT NULL COMMENT 'Data de vencimento da CNH',
  `motorista_situacao_id` int(11) DEFAULT NULL COMMENT 'Situação do motorista',
  `criado_em` datetime NOT NULL DEFAULT current_timestamp(),
  `criado_por` int(11) NOT NULL,
  `alterado_por` int(11) NOT NULL DEFAULT current_timestamp(),
  `alterado_em` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `motorista_un` (`documento`),
  KEY `motorista_FK` (`criado_por`),
  KEY `motorista_FK_1` (`alterado_por`),
  KEY `motorista_FK_2` (`cnh_categoria_id`),
  KEY `motorista_FK_3` (`motorista_situacao_id`),
  CONSTRAINT `motorista_FK` FOREIGN KEY (`criado_por`) REFERENCES `usuario` (`id`),
  CONSTRAINT `motorista_FK_1` FOREIGN KEY (`alterado_por`) REFERENCES `usuario` (`id`),
  CONSTRAINT `motorista_FK_2` FOREIGN KEY (`cnh_categoria_id`) REFERENCES `cnh_categoria` (`id`),
  CONSTRAINT `motorista_FK_3` FOREIGN KEY (`motorista_situacao_id`) REFERENCES `motorista_situacao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='Motorista de verículos no sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motorista`
--

LOCK TABLES `motorista` WRITE;
/*!40000 ALTER TABLE `motorista` DISABLE KEYS */;
INSERT INTO `motorista` VALUES (4,'Benício E Pinto','66478301894','1980-07-01',_binary '','80891789817',4,'1999-10-02 00:00:00','2021-08-01',NULL,'2020-12-10 12:00:00',1,1,'2020-12-10 12:00:00'),(5,'Noah Alexandre Nogueira','99321428836','1975-03-08',_binary '','83398786220',4,'1993-03-08 00:00:00','2020-12-25',NULL,'2020-12-10 12:00:00',1,1,'2020-12-10 12:00:00'),(6,'Sebastião Matheus Gael Figueiredo','09861585850','1968-05-05',_binary '','27439427368',3,'1988-05-10 00:00:00','2021-05-05',NULL,'2020-12-10 12:00:00',1,1,'2020-12-10 12:00:00'),(7,'André Benício Gonçalves','87522645808','1973-05-05',_binary '','58544784505',3,'1989-05-10 00:00:00','2022-10-05',NULL,'2020-12-10 12:00:00',1,1,'2020-12-10 12:00:00'),(8,'Igor Yago Gael Pires','52182295505','1965-05-05',_binary '','85765606822',4,'1982-05-10 00:00:00','2019-11-12',6,'2020-12-10 12:00:00',1,1,'2020-12-10 12:00:00');
/*!40000 ALTER TABLE `motorista` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tgr_motorista
BEFORE UPDATE
ON motorista FOR EACH ROW
BEGIN 
	INSERT INTO 
		estudo.motorista_log
		(
			motorista_id, 
			nome, 
			documento, 
			motorista_situacao_id,
			ativo_flag, 
			cnh_categoria_id,
			cnh_data_primeira_emissao,
			cnh_data_validade,
			cnh_numero_registro,
			criado_em, 
			criado_por, 
			alterado_por, 
			alterado_em
		)
	VALUES
		(
			OLD.id, 
			OLD.nome, 
			OLD.documento, 		
			OLD.motorista_situacao_id,
			OLD.ativo_flag,
			OLD.cnh_categoria_id,
			OLD.cnh_data_primeira_emissao,
			OLD.cnh_data_validade,
			OLD.cnh_numero_registro,
			OLD.criado_em, 
			OLD.criado_por, 
			OLD.alterado_por, 
			OLD.alterado_em
		);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `motorista_log`
--

DROP TABLE IF EXISTS `motorista_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motorista_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador do log',
  `motorista_id` int(11) NOT NULL COMMENT 'Identificador do motorista',
  `nome` varchar(100) NOT NULL COMMENT 'Nome do motorista',
  `documento` varchar(20) DEFAULT NULL COMMENT 'CPF ou CNPJ do motorista somente números',
  `data_nascimento` date DEFAULT NULL COMMENT 'Data de nascimento do motorista',
  `ativo_flag` bit(1) DEFAULT NULL COMMENT '0 = Inativo, 1 = Ativo ',
  `cnh_numero_registro` varchar(11) DEFAULT NULL COMMENT 'Número do registro da CNH',
  `cnh_categoria_id` int(11) DEFAULT NULL,
  `cnh_data_primeira_emissao` datetime DEFAULT NULL COMMENT 'Data de emissão da primeira CNH',
  `cnh_data_validade` datetime DEFAULT NULL COMMENT 'Data de vencimento da CNH',
  `criado_em` datetime NOT NULL,
  `criado_por` int(11) NOT NULL,
  `alterado_por` int(11) NOT NULL,
  `alterado_em` datetime DEFAULT NULL,
  `motorista_situacao_id` int(11) DEFAULT NULL COMMENT 'Situação do motorista',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='Logs de Motorista de verículos no sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motorista_log`
--

LOCK TABLES `motorista_log` WRITE;
/*!40000 ALTER TABLE `motorista_log` DISABLE KEYS */;
INSERT INTO `motorista_log` VALUES (1,4,'Benício Emanuel Pinto','66478301893',NULL,_binary '','80891789817',5,'1999-10-02 00:00:00','2020-07-01 00:00:00','2020-12-10 12:00:00',1,1,'2020-12-08 12:00:00',NULL),(2,4,'Benício Emanuel Pinto','66478301892',NULL,_binary '','80891789817',5,'1999-10-02 00:00:00','2020-07-01 00:00:00','2020-12-10 12:00:00',1,1,'2020-12-10 12:00:00',NULL),(3,4,'Benício Emanuel Pinto','66478301894',NULL,_binary '','80891789817',5,'1999-10-02 00:00:00','2020-07-01 00:00:00','2020-12-10 12:00:00',1,1,'2020-12-10 12:00:00',NULL),(4,4,'Benício E Pinto','66478301894',NULL,_binary '','80891789817',5,'1999-10-02 00:00:00','2020-07-01 00:00:00','2020-12-10 12:00:00',1,1,'2020-12-10 12:00:00',NULL);
/*!40000 ALTER TABLE `motorista_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motorista_situacao`
--

DROP TABLE IF EXISTS `motorista_situacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motorista_situacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Situação do motorista',
  `nome` varchar(100) DEFAULT NULL COMMENT 'Descrição da situação do motorista',
  `observacoes` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='Tabela que contém as situações dos motoristas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motorista_situacao`
--

LOCK TABLES `motorista_situacao` WRITE;
/*!40000 ALTER TABLE `motorista_situacao` DISABLE KEYS */;
INSERT INTO `motorista_situacao` VALUES (1,'Regular','Motorista em situação regular'),(2,'Atestado Médico','Motorista afastado com atestado médico'),(3,'Black List','Motorista entrou na blacklist por algum motivo'),(4,'Férias','Motorista de férias'),(5,'Óbtio','Motorista faleceu'),(6,'CNH Vencida','Motorista com CNH vencida');
/*!40000 ALTER TABLE `motorista_situacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multa`
--

DROP TABLE IF EXISTS `multa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(300) NOT NULL,
  `multa_tipo_id` int(11) NOT NULL,
  `codigo_detran` int(11) NOT NULL COMMENT 'Código da multa no Detran',
  `criado_em` datetime DEFAULT current_timestamp(),
  `criado_por` int(11) DEFAULT NULL COMMENT 'Usuário responsável pela criação do registro',
  `alterado_por` int(11) DEFAULT NULL COMMENT 'Usuário responsável pela última alteração.',
  `alterado_em` datetime DEFAULT current_timestamp() COMMENT 'Data da última alteração',
  PRIMARY KEY (`id`),
  KEY `multa_FK` (`multa_tipo_id`),
  KEY `multa_FK_1` (`criado_por`),
  KEY `multa_FK_2` (`alterado_por`),
  CONSTRAINT `multa_FK` FOREIGN KEY (`multa_tipo_id`) REFERENCES `multa_tipo` (`id`),
  CONSTRAINT `multa_FK_1` FOREIGN KEY (`criado_por`) REFERENCES `usuario` (`id`),
  CONSTRAINT `multa_FK_2` FOREIGN KEY (`alterado_por`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='Multas de transito cadastradas do Detran';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multa`
--

LOCK TABLES `multa` WRITE;
/*!40000 ALTER TABLE `multa` DISABLE KEYS */;
INSERT INTO `multa` VALUES (1,'Dirigir sem atenção ou sem os cuidados indispensáveis à segurança',1,52070,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(2,'Fazer ou deixar que se faça reparo em veículos nas vias (quando não rodovia/transito rápido)',1,53630,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(3,'Estacionar afastado da guia da calçada (meio-fio) de 50cm a 1m',1,53980,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(4,'Estacionar nos acostamentos',1,54440,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(5,'Parar afastado da guia da calçada (meio-fio) de 50cm a 1m',1,55840,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(6,'Parar em desacordo com as posições estabelecidas no CTB',1,56060,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(7,'Usar veículo para arremessar sobre os pedestres água ou detritos',2,52231,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(8,'Usar veículo para arremessar sobre os veículos água ou detritos',2,52232,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(9,'Atirar do veículo objetos ou substâncias',2,52311,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(10,'Abandonar na via objetos ou substâncias',2,52312,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(11,'Deixar o condutor envolvido em acidente s/ vítima, de remover o veículo do local',2,53470,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(12,'Ter seu veículo imobilizado na via por falta de combustível',2,53710,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(13,'Deixar o condutor de usar o cinto segurança',3,51851,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(14,'Deixar o passageiro de usar o cinto segurança',3,51852,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(15,'Deixar o condutor de prestar socorro vítima acidente de trânsito, qdo solicit p/ agente',3,53390,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(16,'Fazer ou deixar que se faça reparo em veículo, em rodovia e via de trânsito rápido',3,53550,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(17,'Estacionar afastado da guia da calçada (meio-fio) a mais de 1m',3,54010,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(18,'Estacionar no passeio',3,54521,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(19,'Dirigir veículo sem possuir CNH/PPD/ACC',4,50100,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(20,'Dirigir veículo com CNH/PPD/ACC cassada',4,50291,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(21,'Dirigir veículo com CNH/PPD/ACC com suspensão do direito de dirigir',4,50292,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(22,'Dirigir veículo com CNH de categoria diferente da do veículo',4,50371,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07'),(23,'Dirigir veículo com PPD de categoria diferente da do veículo',4,50372,'2020-12-10 15:13:07',1,1,'2020-12-10 15:13:07');
/*!40000 ALTER TABLE `multa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multa_situacao`
--

DROP TABLE IF EXISTS `multa_situacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multa_situacao` (
  `id` tinyint(4) NOT NULL COMMENT 'Identificador da situação da multa',
  `descricacao` varchar(100) NOT NULL COMMENT 'Descrição da situação da multa.',
  `criado_por` int(11) DEFAULT NULL COMMENT 'Usuário que criou o registro',
  `criado_em` datetime DEFAULT current_timestamp() COMMENT 'Data da criação do registro.',
  `alterado_por` int(11) DEFAULT NULL COMMENT 'Usuário que realizou a última alteração no registro',
  `alterado_em` datetime DEFAULT current_timestamp() COMMENT 'Data da última alteração',
  PRIMARY KEY (`id`),
  KEY `multa_situacao_FK` (`criado_por`),
  KEY `multa_situacao_FK_1` (`alterado_por`),
  CONSTRAINT `multa_situacao_FK` FOREIGN KEY (`criado_por`) REFERENCES `usuario` (`id`),
  CONSTRAINT `multa_situacao_FK_1` FOREIGN KEY (`alterado_por`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Registros da situações de multa.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multa_situacao`
--

LOCK TABLES `multa_situacao` WRITE;
/*!40000 ALTER TABLE `multa_situacao` DISABLE KEYS */;
INSERT INTO `multa_situacao` VALUES (1,'Em aberta',NULL,'2020-12-10 15:26:51',NULL,'2020-12-10 15:26:51'),(2,'Em recurso',NULL,'2020-12-10 15:26:51',NULL,'2020-12-10 15:26:51'),(3,'Em atraso',NULL,'2020-12-10 15:26:51',NULL,'2020-12-10 15:26:51'),(4,'Quitada',NULL,'2020-12-10 15:26:51',NULL,'2020-12-10 15:26:51');
/*!40000 ALTER TABLE `multa_situacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multa_tipo`
--

DROP TABLE IF EXISTS `multa_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multa_tipo` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `pontos` int(11) DEFAULT NULL,
  `valor` double(10,2) NOT NULL,
  `criado_por` int(11) DEFAULT NULL COMMENT 'Usuário que criou o registro',
  `criado_em` datetime DEFAULT current_timestamp() COMMENT 'Data da criação do registro',
  `alterado_por` int(11) DEFAULT NULL COMMENT 'Usuário responsável pela última alteração no registro.',
  `alterado_em` datetime DEFAULT current_timestamp() COMMENT 'Data da última alteração no registro',
  PRIMARY KEY (`id`),
  KEY `multa_tipo_FK` (`criado_por`),
  KEY `multa_tipo_FK_1` (`alterado_por`),
  CONSTRAINT `multa_tipo_FK` FOREIGN KEY (`criado_por`) REFERENCES `usuario` (`id`),
  CONSTRAINT `multa_tipo_FK_1` FOREIGN KEY (`alterado_por`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabela de tipos de multa e os pontos registrados em carteira';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multa_tipo`
--

LOCK TABLES `multa_tipo` WRITE;
/*!40000 ALTER TABLE `multa_tipo` DISABLE KEYS */;
INSERT INTO `multa_tipo` VALUES (1,'Leve',3,88.38,NULL,'2020-12-10 15:34:37',NULL,'2020-12-10 15:34:37'),(2,'Media',4,130.16,NULL,'2020-12-10 15:34:37',NULL,'2020-12-10 15:34:37'),(3,'Grave',5,195.23,NULL,'2020-12-10 15:34:37',NULL,'2020-12-10 15:34:37'),(4,'Gravíssima',7,880.41,NULL,'2020-12-10 15:34:37',NULL,'2020-12-10 15:34:37');
/*!40000 ALTER TABLE `multa_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proprietario`
--

DROP TABLE IF EXISTS `proprietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proprietario` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador do proprietário',
  `nome` varchar(100) NOT NULL COMMENT 'Nome do proprietário',
  `documento` varchar(20) DEFAULT NULL COMMENT 'CPF ou CNPJ do proprietário',
  `ativo_flag` bit(1) DEFAULT b'1' COMMENT '0 = Inativo, 1 = Ativo ',
  `criado_em` datetime NOT NULL DEFAULT current_timestamp(),
  `criado_por` int(11) NOT NULL,
  `alterado_por` int(11) NOT NULL DEFAULT current_timestamp(),
  `alterado_em` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proprietario_FK` (`criado_por`),
  KEY `proprietario_FK_1` (`alterado_por`),
  CONSTRAINT `proprietario_FK` FOREIGN KEY (`criado_por`) REFERENCES `usuario` (`id`),
  CONSTRAINT `proprietario_FK_1` FOREIGN KEY (`alterado_por`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='Proprietários de verículos no sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proprietario`
--

LOCK TABLES `proprietario` WRITE;
/*!40000 ALTER TABLE `proprietario` DISABLE KEYS */;
INSERT INTO `proprietario` VALUES (1,'Kauê Marcos da Paz','84025009862',_binary '','2020-12-09 16:00:00',1,1,'2020-12-09 16:00:00'),(2,'Thiago Henrique','66703045879',_binary '','2020-12-09 16:00:00',1,1,'2020-12-09 16:00:00'),(3,'Mário Matheus Benício da Cunha','14518566874',_binary '','2020-12-09 16:00:00',1,1,'2020-12-09 16:00:00');
/*!40000 ALTER TABLE `proprietario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tgr_proprietario
BEFORE UPDATE
ON proprietario FOR EACH ROW
BEGIN
	INSERT INTO 
		estudo.proprietario_log
		(
			proprietario_id, 
			nome, 
			documento, 
			ativo_flag, 
			criado_em, 
			criado_por, 
			alterado_por, 
			alterado_em
		)
	VALUES
		(
			OLD.id, 
			OLD.nome, 
			OLD.documento, 
			OLD.ativo_flag, 
			OLD.criado_em, 
			OLD.criado_por, 
			OLD.alterado_por, 
			OLD.alterado_em
		);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proprietario_contato`
--

DROP TABLE IF EXISTS `proprietario_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proprietario_contato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `proprietario_id` int(11) NOT NULL,
  `contato_tipo` int(11) DEFAULT NULL COMMENT 'Tipo do contato do cliente',
  `criado_por` int(11) DEFAULT NULL COMMENT 'Usuário que criou o registro',
  `criado_em` datetime DEFAULT current_timestamp() COMMENT 'Data da criação do registro',
  `alterado_por` int(11) DEFAULT NULL COMMENT 'Usuário responsável pela última alteração no registro.',
  `alterado_em` datetime DEFAULT current_timestamp() COMMENT 'Data da última alteração no registro',
  PRIMARY KEY (`id`),
  KEY `proprietario_contato_FK` (`proprietario_id`),
  KEY `proprietario_contato_FK_2` (`criado_por`),
  KEY `proprietario_contato_FK_3` (`alterado_por`),
  CONSTRAINT `proprietario_contato_FK` FOREIGN KEY (`proprietario_id`) REFERENCES `proprietario` (`id`),
  CONSTRAINT `proprietario_contato_FK_2` FOREIGN KEY (`criado_por`) REFERENCES `usuario` (`id`),
  CONSTRAINT `proprietario_contato_FK_3` FOREIGN KEY (`alterado_por`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Contatos de proprietarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proprietario_contato`
--

LOCK TABLES `proprietario_contato` WRITE;
/*!40000 ALTER TABLE `proprietario_contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `proprietario_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proprietario_log`
--

DROP TABLE IF EXISTS `proprietario_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proprietario_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador do log',
  `proprietario_id` int(11) NOT NULL COMMENT 'Identificador do proprietário',
  `nome` varchar(100) NOT NULL COMMENT 'Nome do proprietário',
  `documento` varchar(20) DEFAULT NULL COMMENT 'CPF ou CNPJ do proprietário',
  `ativo_flag` bit(1) DEFAULT NULL COMMENT '0 = Inativo, 1 = Ativo ',
  `criado_em` datetime NOT NULL,
  `criado_por` int(11) NOT NULL,
  `alterado_por` int(11) NOT NULL,
  `alterado_em` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='Log de proprietários de veículos no sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proprietario_log`
--

LOCK TABLES `proprietario_log` WRITE;
/*!40000 ALTER TABLE `proprietario_log` DISABLE KEYS */;
INSERT INTO `proprietario_log` VALUES (4,1,'Diego Rodrigues','11111111111',_binary '','2020-12-09 16:00:00',1,1,'2020-12-09 16:00:00'),(5,2,'Thiago Henrique','22222222222',_binary '','2020-12-09 16:00:00',1,1,'2020-12-09 16:00:00'),(6,3,'Anna Raio','33333333333',_binary '','2020-12-09 16:00:00',1,1,'2020-12-09 16:00:00');
/*!40000 ALTER TABLE `proprietario_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguradora`
--

DROP TABLE IF EXISTS `seguradora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguradora` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador da seguradora.',
  `nome` varchar(100) NOT NULL COMMENT 'Nome da seguradora.',
  `criado_em` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Data da criação da seguradora.',
  `criado_por` int(11) NOT NULL COMMENT 'Responsável pela criação da seguradora no sistema',
  `alterado_em` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Data da alteração da seguradora no sistema.',
  `alterado_por` int(11) NOT NULL COMMENT 'Responsável pela última alteração da seguradora no sistema.',
  PRIMARY KEY (`id`),
  KEY `seguradora_FK_2` (`criado_por`),
  KEY `seguradora_FK_3` (`alterado_por`),
  CONSTRAINT `seguradora_FK_2` FOREIGN KEY (`criado_por`) REFERENCES `usuario` (`id`),
  CONSTRAINT `seguradora_FK_3` FOREIGN KEY (`alterado_por`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='Seguradas registradas no sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguradora`
--

LOCK TABLES `seguradora` WRITE;
/*!40000 ALTER TABLE `seguradora` DISABLE KEYS */;
INSERT INTO `seguradora` VALUES (1,'Suhai','2020-12-10 12:00:00',1,'2020-12-10 12:00:00',1),(2,'Porto Seguro','2020-12-10 12:00:00',1,'2020-12-10 12:00:00',1),(3,'Azul','2020-12-10 12:00:00',1,'2020-12-10 12:00:00',1),(4,'Itaú','2020-12-10 12:00:00',1,'2020-12-10 12:00:00',1);
/*!40000 ALTER TABLE `seguradora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `ativo_flag` bit(1) DEFAULT b'1',
  `token` varchar(200) DEFAULT NULL COMMENT 'Token único do usuário',
  `foto` varchar(200) DEFAULT NULL,
  `criado_por` int(11) DEFAULT NULL COMMENT 'Usuário que criou o registro',
  `criado_em` datetime DEFAULT current_timestamp() COMMENT 'Data da criação do registro',
  `alterado_por` int(11) DEFAULT NULL COMMENT 'Usuário responsável pela última alteração no registro.',
  `alterado_em` datetime DEFAULT current_timestamp() COMMENT 'Data da última alteração no registro',
  PRIMARY KEY (`id`),
  KEY `usuario_FK_1` (`criado_por`),
  KEY `usuario_FK_2` (`alterado_por`),
  CONSTRAINT `usuario_FK_1` FOREIGN KEY (`criado_por`) REFERENCES `usuario` (`id`),
  CONSTRAINT `usuario_FK_2` FOREIGN KEY (`alterado_por`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Cadastro dos usuários do sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Administrador','admin@admin.com','683e60cff9f09684602dddc7e296722f',_binary '',NULL,NULL,NULL,'2020-12-10 15:57:34',NULL,'2020-12-10 15:57:34'),(2,'Robô','robo@gmail.com','683e60cff9f09684602dddc7e296722f',_binary '',NULL,NULL,NULL,'2020-12-10 15:57:34',NULL,'2020-12-10 15:57:34');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `renavam` varchar(15) DEFAULT NULL COMMENT 'Renavam do veículo',
  `fabricante_id` int(11) DEFAULT NULL,
  `ano_modelo` int(11) DEFAULT NULL,
  `ano_fabricacao` int(11) DEFAULT NULL,
  `cnh_categoria_id` int(11) DEFAULT NULL COMMENT 'Categoria de CNH permitida',
  `proprietario_id` int(11) DEFAULT NULL,
  `data_licenciamento` datetime DEFAULT NULL COMMENT 'Data do licenciamento',
  `data_prox_licenciamento` datetime DEFAULT NULL COMMENT 'Data próximo licenciamento.',
  `criado_por` int(11) DEFAULT NULL,
  `criado_em` datetime DEFAULT current_timestamp(),
  `alterado_em` datetime DEFAULT current_timestamp(),
  `alterado_por` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `veiculo_FK` (`fabricante_id`),
  KEY `veiculo_FK_1` (`cnh_categoria_id`),
  KEY `veiculo_FK_2` (`proprietario_id`),
  KEY `veiculo_FK_3` (`criado_por`),
  KEY `veiculo_FK_4` (`alterado_por`),
  CONSTRAINT `veiculo_FK` FOREIGN KEY (`fabricante_id`) REFERENCES `fabricante` (`id`),
  CONSTRAINT `veiculo_FK_1` FOREIGN KEY (`cnh_categoria_id`) REFERENCES `cnh_categoria` (`id`),
  CONSTRAINT `veiculo_FK_2` FOREIGN KEY (`proprietario_id`) REFERENCES `proprietario` (`id`),
  CONSTRAINT `veiculo_FK_3` FOREIGN KEY (`criado_por`) REFERENCES `usuario` (`id`),
  CONSTRAINT `veiculo_FK_4` FOREIGN KEY (`alterado_por`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (1,'Volvo FH 540','DMK3097','36851539310',1,2020,2019,4,1,NULL,NULL,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(2,'Scania R 450','CJC1752','41524540559',2,2018,2018,5,1,NULL,NULL,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(3,'Volvo FH 460','BZW0943','13913313230',1,2015,2014,4,1,NULL,NULL,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(4,'Mercedes-Benz Actros 2651','BUS2333','22164348086',3,2020,2020,4,2,NULL,NULL,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(5,'DAF XF 105 510','CTA1790','02515849657',4,2017,2017,5,2,NULL,NULL,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(6,'Scania R 500','CBB2058','61785905776',2,2020,2019,5,3,NULL,NULL,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(7,'Mercedes-Benz Actros 2546','BOA8560','32504215696',3,2015,2015,4,3,NULL,NULL,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(8,'Mercedes-Benz Axor 2544','ERH5951','23616424727',3,2018,2018,5,3,NULL,NULL,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(9,'Mercedes-Benz Axor 3344','CGB7741','27165756405',3,2019,2018,5,3,NULL,NULL,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(10,'Volvo FH 500','GEP5749','16364137858',1,2019,2018,5,3,NULL,NULL,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1);
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tgr_veiculo
BEFORE UPDATE
ON veiculo FOR EACH ROW
BEGIN
	INSERT INTO estudo.veiculo_log
	(veiculo_id, nome, placa, renavam, fabricante_id, ano_modelo, ano_fabricacao, cnh_categoria_id, proprietario_id, criado_por, criado_em, alterado_em, alterado_por)
	VALUES(OLD.id, OLD.nome, OLD.placa, OLD.renavam, OLD.fabricante_id, OLD.ano_modelo, OLD.ano_fabricacao, OLD.cnh_categoria_id, OLD.proprietario_id, OLD.criado_por, OLD.criado_em, OLD.alterado_em, OLD.alterado_por);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `veiculo_log`
--

DROP TABLE IF EXISTS `veiculo_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `veiculo_id` int(11) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `renavam` varchar(15) DEFAULT NULL COMMENT 'Renavam do veiculo',
  `fabricante_id` int(11) DEFAULT NULL,
  `ano_modelo` int(11) DEFAULT NULL,
  `ano_fabricacao` int(11) DEFAULT NULL,
  `cnh_categoria_id` int(11) DEFAULT NULL COMMENT 'Categoria de CNH permitida',
  `proprietario_id` int(11) DEFAULT NULL,
  `criado_por` int(11) DEFAULT NULL,
  `criado_em` datetime DEFAULT NULL,
  `alterado_em` datetime DEFAULT NULL,
  `alterado_por` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo_log`
--

LOCK TABLES `veiculo_log` WRITE;
/*!40000 ALTER TABLE `veiculo_log` DISABLE KEYS */;
INSERT INTO `veiculo_log` VALUES (11,6,'Scania R 500','HHH8888',NULL,2,2020,2019,5,2,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(12,6,'Scania R 500','HHH8888',NULL,2,2020,2019,5,2,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(13,6,'Scania R 500','HHH8888',NULL,2,2020,2019,5,3,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(14,6,'Scania R 500','HHH8888',NULL,2,2020,2019,5,1,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(15,1,'Volvo FH 540','AAA1010',NULL,1,2020,2019,4,1,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(16,1,'Volvo FH 540','AAA1010',NULL,1,2020,2019,4,1,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(17,2,'Scania R 450','BBB2020',NULL,2,2018,2018,5,1,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(18,3,'Volvo FH 460','CCC3030',NULL,1,2015,2014,4,1,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(19,4,'Mercedes-Benz Actros 2651','ABC123',NULL,3,2020,2020,4,2,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(20,5,'DAF XF 105 510','FHG2222',NULL,4,2017,2017,5,2,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(21,6,'Scania R 500','HHH8888',NULL,2,2020,2019,5,3,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(22,7,'Mercedes-Benz Actros 2546','FFF1234',NULL,3,2015,2015,4,3,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(23,8,'Mercedes-Benz Axor 2544','BCC5555',NULL,3,2018,2018,5,3,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(24,9,'Mercedes-Benz Axor 3344','DFT1020',NULL,3,2019,2018,5,3,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1),(25,10,'Volvo FH 500','YYG6768',NULL,1,2019,2018,5,3,1,'2020-12-09 17:00:00','2020-12-09 17:00:00',1);
/*!40000 ALTER TABLE `veiculo_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo_multa`
--

DROP TABLE IF EXISTS `veiculo_multa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo_multa` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador da multa',
  `multa_tipo_id` int(11) NOT NULL COMMENT 'Tipo da multa aplicada',
  `veiculo_id` int(11) NOT NULL COMMENT 'Veiculo na qual a multa foi aplicada.',
  `motorista_responsavel_id` int(11) DEFAULT NULL COMMENT 'Caso motorista não seja o proprietário e a multa seja transferida para o motorista da ocorrência.',
  `data_infracao` datetime NOT NULL COMMENT 'Data em que ocorreu a infração',
  `multa_situacao_id` tinyint(4) NOT NULL COMMENT 'Situação da multa',
  `criado_por` int(11) DEFAULT NULL COMMENT 'Usuário que criou o registro',
  `criado_em` datetime DEFAULT current_timestamp() COMMENT 'Data da criação do registro',
  `alterado_por` int(11) DEFAULT NULL COMMENT 'Usuário responsável pela última alteração no registro.',
  `alterado_em` datetime DEFAULT current_timestamp() COMMENT 'Data da última alteração no registro',
  PRIMARY KEY (`id`),
  KEY `veiculo_multa_FK` (`criado_por`),
  KEY `veiculo_multa_FK_1` (`alterado_por`),
  KEY `veiculo_multa_FK_2` (`veiculo_id`),
  KEY `veiculo_multa_FK_3` (`motorista_responsavel_id`),
  KEY `veiculo_multa_FK_4` (`multa_situacao_id`),
  KEY `veiculo_multa_FK_5` (`multa_tipo_id`),
  CONSTRAINT `veiculo_multa_FK` FOREIGN KEY (`criado_por`) REFERENCES `usuario` (`id`),
  CONSTRAINT `veiculo_multa_FK_1` FOREIGN KEY (`alterado_por`) REFERENCES `usuario` (`id`),
  CONSTRAINT `veiculo_multa_FK_2` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculo` (`id`),
  CONSTRAINT `veiculo_multa_FK_3` FOREIGN KEY (`motorista_responsavel_id`) REFERENCES `motorista` (`id`),
  CONSTRAINT `veiculo_multa_FK_4` FOREIGN KEY (`multa_situacao_id`) REFERENCES `multa_situacao` (`id`),
  CONSTRAINT `veiculo_multa_FK_5` FOREIGN KEY (`multa_tipo_id`) REFERENCES `multa_tipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='Registros de multa dos veículos no sistema.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo_multa`
--

LOCK TABLES `veiculo_multa` WRITE;
/*!40000 ALTER TABLE `veiculo_multa` DISABLE KEYS */;
INSERT INTO `veiculo_multa` VALUES (1,2,2,NULL,'2020-12-11 12:00:00',1,1,'2020-12-11 20:00:17',1,'2020-12-11 20:00:17'),(2,3,2,NULL,'2020-10-05 12:00:00',1,1,'2020-12-11 20:00:17',1,'2020-12-11 20:00:17'),(3,4,2,4,'2020-11-16 12:00:00',1,1,'2020-12-11 20:00:17',1,'2020-12-11 20:00:17'),(4,4,1,5,'2020-11-16 18:00:00',1,1,'2020-12-11 20:00:17',1,'2020-12-11 20:00:17');
/*!40000 ALTER TABLE `veiculo_multa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viagem`
--

DROP TABLE IF EXISTS `viagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Viagens registradas no sistema.',
  `motorista_titular_id` int(11) NOT NULL COMMENT 'Motorista principal',
  `motorista_reserva_id` int(11) DEFAULT NULL COMMENT 'Motorista reserva.',
  `veiculo_id` int(11) NOT NULL COMMENT 'Veículo que realizou a viagem.',
  `data_saida_prevista` datetime NOT NULL COMMENT 'Data prevista de saída',
  `data_saida` datetime DEFAULT NULL COMMENT 'Data real da saída',
  `data_chegada_prevista` datetime NOT NULL COMMENT 'Data prevista de chegada',
  `data_chegada` datetime DEFAULT NULL COMMENT 'Data real da chegada',
  `viagem_situacao_id` int(11) NOT NULL COMMENT 'Situação atual da viagem.',
  `logradouro_origem` varchar(1000) NOT NULL COMMENT 'Origem da viagem',
  `logradouro_destino` varchar(1000) NOT NULL COMMENT 'Destino final da viagem',
  `valor` double(10,2) DEFAULT NULL COMMENT 'Valor da viagem',
  `observacoes` varchar(5000) DEFAULT NULL COMMENT 'Observações sobre a viagem',
  `criado_por` int(11) NOT NULL COMMENT 'Usuário que criou o registro.',
  `criado_em` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Data da criação do registro',
  `alterado_por` int(11) NOT NULL COMMENT 'Usuário responsável pela última alteração',
  `alterado_em` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Data da última alteração no registro.',
  PRIMARY KEY (`id`),
  KEY `viagem_FK` (`motorista_titular_id`),
  KEY `viagem_FK_1` (`motorista_reserva_id`),
  KEY `viagem_FK_2` (`criado_por`),
  KEY `viagem_FK_3` (`alterado_por`),
  KEY `viagem_FK_4` (`viagem_situacao_id`),
  CONSTRAINT `viagem_FK` FOREIGN KEY (`motorista_titular_id`) REFERENCES `motorista` (`id`),
  CONSTRAINT `viagem_FK_1` FOREIGN KEY (`motorista_reserva_id`) REFERENCES `motorista` (`id`),
  CONSTRAINT `viagem_FK_2` FOREIGN KEY (`criado_por`) REFERENCES `usuario` (`id`),
  CONSTRAINT `viagem_FK_3` FOREIGN KEY (`alterado_por`) REFERENCES `usuario` (`id`),
  CONSTRAINT `viagem_FK_4` FOREIGN KEY (`viagem_situacao_id`) REFERENCES `viagem_situacao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='Registro das viagens do sistema.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viagem`
--

LOCK TABLES `viagem` WRITE;
/*!40000 ALTER TABLE `viagem` DISABLE KEYS */;
INSERT INTO `viagem` VALUES (2,4,NULL,1,'2020-12-10 12:00:00','2020-12-10 11:50:00','2020-12-10 16:00:00','2020-12-11 16:50:00',1,'Rua que cai, 123, 01121333, São Paulo, SP','Rua que sobe, 343, 0111111, São Paulo, SP',1000.00,'Motorista se atrasou',1,'2020-12-10 17:34:04',1,'2020-12-10 17:34:04'),(3,4,5,1,'2020-12-05 10:00:00','2020-12-05 10:20:00','2020-12-07 16:00:00','2020-12-07 15:30:00',1,'Rua que cai, 123, 01121333, São Paulo, SP','Rua que sobe, 343, 0111111, São Paulo, SP',5000.00,'Motorista se atrasou',1,'2020-12-10 17:34:04',1,'2020-12-10 17:34:04'),(4,5,6,1,'2020-11-15 12:00:00','2020-11-15 15:00:00','2020-11-15 16:00:00','2020-11-15 22:00:00',1,'Rua que cai, 123, 01121333, São Paulo, SP','Rua que sobe, 343, 0111111, São Paulo, SP',500.00,'Motorista se atrasou',1,'2020-12-10 17:34:04',1,'2020-12-10 17:34:04'),(5,4,NULL,1,'2020-11-10 16:00:00','2020-11-10 16:15:00','2020-11-10 23:00:00','2020-11-10 23:59:00',1,'Rua que cai, 123, 01121333, São Paulo, SP','Rua que sobe, 343, 0111111, São Paulo, SP',1200.00,'Motorista se atrasou',1,'2020-12-10 17:34:04',1,'2020-12-10 17:34:04'),(6,6,NULL,1,'2020-11-14 12:00:00','2020-11-14 11:00:00','2020-11-14 16:00:00','2020-11-14 15:00:00',1,'Rua que cai, 123, 01121333, São Paulo, SP','Rua que sobe, 343, 0111111, São Paulo, SP',400.00,'Motorista se atrasou',1,'2020-12-10 17:34:04',1,'2020-12-10 17:34:04'),(7,6,NULL,1,'2020-11-14 12:00:00','2020-11-14 11:00:00','2020-11-14 16:00:00','2020-11-14 15:00:00',1,'Rua que cai, 123, 01121333, São Paulo, SP','Rua que sobe, 343, 0111111, São Paulo, SP',400.00,'Motorista se atrasou',1,'2020-12-10 17:34:04',1,'2020-12-10 17:34:04');
/*!40000 ALTER TABLE `viagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viagem_log`
--

DROP TABLE IF EXISTS `viagem_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viagem_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id do log.',
  `viagem_id` int(11) NOT NULL COMMENT 'Viagens registradas no sistema.',
  `motorista_titular_id` int(11) NOT NULL COMMENT 'Motorista principal',
  `motorista_reserva_id` int(11) DEFAULT NULL COMMENT 'Motorista reserva.',
  `veiculo_id` int(11) NOT NULL COMMENT 'Veículo que realizou a viagem.',
  `data_saida_prevista` datetime NOT NULL COMMENT 'Data prevista de saída',
  `data_saida` datetime DEFAULT NULL COMMENT 'Data real da saída',
  `data_chegada_prevista` datetime NOT NULL COMMENT 'Data prevista de chegada',
  `data_chegada` datetime DEFAULT NULL COMMENT 'Data real da chegada',
  `viagem_situacao_id` int(11) NOT NULL COMMENT 'Situação atual da viagem.',
  `logradouro_origem` varchar(1000) NOT NULL COMMENT 'Origem da viagem',
  `logradouro_destino` varchar(1000) NOT NULL COMMENT 'Destino final da viagem',
  `valor` double(10,2) DEFAULT NULL COMMENT 'Valor da viagem no sistema',
  `criado_por` int(11) NOT NULL COMMENT 'Usuário que criou o registro.',
  `criado_em` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Data da criação do registro',
  `alterado_por` int(11) NOT NULL COMMENT 'Usuário responsável pela última alteração',
  `alterado_em` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Data da última alteração no registro.',
  `observacoes` varchar(5000) DEFAULT NULL COMMENT 'Observações sobre a viagem',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='Registro de log das viagens do sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viagem_log`
--

LOCK TABLES `viagem_log` WRITE;
/*!40000 ALTER TABLE `viagem_log` DISABLE KEYS */;
INSERT INTO `viagem_log` VALUES (3,2,4,NULL,1,'2020-12-10 12:00:00','2020-12-10 11:50:00','2020-12-10 16:00:00','2020-12-10 16:50:00',1,'Rua que cai, 123, 01121333, São Paulo, SP','Rua que sobe, 343, 0111111, São Paulo, SP',1000.00,1,'2020-12-10 17:34:04',1,'2020-12-10 17:34:04',NULL);
/*!40000 ALTER TABLE `viagem_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viagem_situacao`
--

DROP TABLE IF EXISTS `viagem_situacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viagem_situacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id da situação da viagem no sistema',
  `descricao` varchar(100) DEFAULT NULL COMMENT 'Descrição da situação da viagem',
  `criado_por` int(11) DEFAULT NULL COMMENT 'Usuário que criou o registro',
  `alterado_por` int(11) DEFAULT NULL COMMENT 'Usuário que alterou por último o registro',
  `criado_em` datetime DEFAULT current_timestamp() COMMENT 'Data da criação do registro',
  `alterado_em` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='Situação das viagens do sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viagem_situacao`
--

LOCK TABLES `viagem_situacao` WRITE;
/*!40000 ALTER TABLE `viagem_situacao` DISABLE KEYS */;
INSERT INTO `viagem_situacao` VALUES (1,'Aguardando motorista',1,1,'2020-12-10 17:00:00','2020-12-10 17:00:00'),(2,'Em andamento - No Prazo',1,1,'2020-12-10 17:00:00','2020-12-10 17:00:00'),(3,'Em andamento - Atrasada',1,1,'2020-12-10 17:00:00','2020-12-10 17:00:00'),(4,'Finalizada - No Prazo',1,1,'2020-12-10 17:00:00','2020-12-10 17:00:00'),(5,'Finalizada  - Com atraso',1,1,'2020-12-10 17:00:00','2020-12-10 17:00:00'),(6,'Cancelada',1,1,'2020-12-10 17:00:00','2020-12-10 17:00:00'),(7,'Reprogramada',1,1,'2020-12-10 22:02:42','2020-12-10 22:02:42');
/*!40000 ALTER TABLE `viagem_situacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_diego_logistica'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-11 21:09:20
