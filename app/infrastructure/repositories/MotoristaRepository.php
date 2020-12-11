<?php

namespace app\infrastructure\repositories;

use app\crosscuting\EncryptionTrait;
use app\infrastructure\contracts\repositories\RepositoryInterface;
use app\infrastructure\entities\Motorista;
use app\infrastructure\entities\Usuario;
use Exception;

class MotoristaRepository extends RepositoryBase implements RepositoryInterface
{
    use EncryptionTrait;

    public function create($motorista)
    {
        try {
            $sql  = "INSERT INTO db_diego_logistica.motorista 
                                (
                                    nome, 
                                    documento, 
                                    data_nascimento, 
                                    ativo_flag, 
                                    cnh_numero_registro, 
                                    cnh_categoria_id, 
                                    cnh_data_primeira_emissao, 
                                    cnh_data_validade, 
                                    motorista_situacao_id,                
                                    criado_por, 
                                    alterado_por
                                ) 
                    VALUES     (
                                    :nome, 
                                    :documento, 
                                    :data_nascimento, 
                                    :ativo_flag, 
                                    :cnh_numero_registro, 
                                    :cnh_categoria_id, 
                                    :cnh_data_primeira_emissao, 
                                    :cnh_data_validade, 
                                    :motorista_situacao_id,                
                                    :criado_por, 
                                    :alterado_por
                                )";

            $params = [
                ':nome' =>  $motorista->getNome(),
                ':documento' =>  $motorista->getDocumento(),
                ':data_nascimento' =>  $motorista->getDataNascimento(),
                ':ativo_flag' =>  $motorista->getAtivoFlag(),
                ':cnh_numero_registro' =>  $motorista->getCnhNumeroRegistro(),
                ':cnh_categoria_id' =>  $motorista->getCnhCategoriaId(),
                ':cnh_data_primeira_emissao' =>  $motorista->getCnhDataPrimeiraEmissao(),
                ':cnh_data_validade' =>  $motorista->getCnhDataValidade(),
                ':motorista_situacao_id' => $motorista->getMotoristaSituacaoId(),
                ':criado_por' => $motorista->getCriadoPor(), 
                ':alterado_por' => $motorista->getAlteradoPor()
            ];

            if (!$this->executeNonQuery($sql, $params))
                return -1; //Erro

            $id = $this->getLastID();
            $usuario = $this->view($id);
            return $usuario;
        } catch (Exception $ex) {
            throw new Exception("Erro interno, contate o administrador");
        }
    }

    public function read($filtros = [])
    {
        try {
            $sql = 'SELECT * FROM motorista WHERE 1 = 1';

            if (isset($filtros) && !empty($filtros["documento"])) {
                $sql .= ' AND documento = "' . $filtros["documento"] . '"';
            }

            if (isset($filtros) && !empty($filtros["cnh_numero_registro"])) {
                $sql .= ' AND cnh_numero_registro = "' . $filtros["cnh_numero_registro"] . '"';
            }

            $sql .=  ' ORDER BY nome ASC';
            $dt = $this->executeQuery($sql);
            $lista = [];

            foreach ($dt as $dr)
                $lista[] =  $this->collection($dr);

            return $lista;
        } catch (Exception $ex) {
            throw new Exception("Erro interno, contate o administrador");
        }
    }

    public function update($motorista): bool
    {
        try {

            $params = [];
            $params[':id'] =  $motorista->id;
            
            $sql  = 'UPDATE motorista SET ';                                    

            if(!empty($motorista->getNome())){
                $sql  .= 'nome = :nome,';
                $params[':nome'] =  $motorista->getNome();
            }

            if(!empty($motorista->getDocumento())){
                $sql  .= 'documento = :documento,';
                $params[':documento'] =  $motorista->getDocumento();
            }

            if(!empty($motorista->getDataNascimento())){
                $sql  .= 'data_nascimento = :data_nascimento,';
                $params[':data_nascimento'] =  $motorista->getDataNascimento();
            }

            if(!empty($motorista->getAtivoFlag())){
                $sql  .= 'ativo_flag = :ativo_flag,';
                $params[':ativo_flag'] =  $motorista->getAtivoFlag();                
            }

            if(!empty($motorista->getCnhNumeroRegistro())){
                $sql  .= 'cnh_numero_registro = :cnh_numero_registro,';
                $params[':cnh_numero_registro'] =  $motorista->getCnhNumeroRegistro();
            }

            if(!empty($motorista->getCnhCategoriaId())){
                $sql  .= 'cnh_categoria_id = :cnh_categoria_id,';
                $params[':cnh_categoria_id'] =  $motorista->getCnhCategoriaId();                
            }

            if(!empty($motorista->getCnhDataPrimeiraEmissao())){
                $sql  .= 'cnh_data_primeira_emissao = :cnh_data_primeira_emissao,';
                $params[':cnh_data_primeira_emissao'] =  $motorista->getCnhDataPrimeiraEmissao();                
            }

            if(!empty($motorista->getCnhDataValidade())){
                $sql  .= 'cnh_data_validade = :cnh_data_validade,';
                $params[':cnh_data_validade'] =  $motorista->getCnhDataValidade();                
            }

            if(!empty($motorista->getMotoristaSituacaoId())){
                $sql .= 'motorista_situacao_id = :motorista_situacao_id,';
                $params[':motorista_situacao_id'] = $motorista->getMotoristaSituacaoId();                
            }            

            $sql  .= 'WHERE';
            
            $sql = str_replace(',WHERE', ' WHERE ', $sql);
            $sql  .= 'id = :id' ;                

            return $this->executeNonQuery($sql, $params);
        } catch (Exception $ex) {
            throw new Exception("Erro interno, contate o administrador");
        }
    }

    public function view($id)
    {
        try {
            $sql = 'SELECT 
                        * 
                    FROM 
                        motorista 
                    WHERE 
                        id = :id';

            $dr = $this->executeQueryOneRow($sql, [':id' => $id]);

            return $this->collection($dr);
        } catch (Exception $ex) {
            throw new Exception("Erro interno, contate o administrador");
        }
    }

    public function delete($id): bool
    {
        try {
            $sql = 'DELETE 
                    FROM 
                        motorista
                    WHERE 
                        id = :id';

            return $this->executeNonQuery($sql, [':id' => $id]);
        } catch (Exception $ex) {
            throw new Exception("Erro interno, contate o administrador");
        }
    }

    private function collection($arr)
    {
        try {
            $motorista = new Motorista();
            $motorista->id = $arr['id'];
            $motorista->setNome($arr['nome']);
            $motorista->setDocumento($arr['documento']);
            $motorista->setDataNascimento($arr['data_nascimento']);
            $motorista->setAtivoFlag($arr['ativo_flag']);
            $motorista->setCnhNumeroRegistro($arr['cnh_numero_registro']);
            $motorista->setCnhCategoriaId($arr['cnh_categoria_id']);
            $motorista->setCnhDataPrimeiraEmissao($arr['cnh_data_primeira_emissao']);
            $motorista->setCnhDataValidade($arr['cnh_data_validade']);
            $motorista->setMotoristaSituacaoId($arr['motorista_situacao_id']);
            $motorista->setCriadoPor($arr['criado_por']);
            $motorista->setCriadoEm($arr['criado_em']);          
            $motorista->setAlteradoPor($arr['alterado_por']);
            $motorista->setAlteradoEm($arr['alterado_em']);

            return $motorista;
        } catch (Exception $ex) {
            throw new Exception("Erro interno, contate o administrador");
        }
    }
}