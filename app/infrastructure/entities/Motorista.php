<?php

namespace app\infrastructure\entities;

use app\infrastructure\contracts\entities\EntityBase;
use app\crosscuting\EncryptionTrait;

class Motorista extends EntityBase{

    use EncryptionTrait;

    private $nome; 
    private $documento; 
    private $data_nascimento; 
    private $ativo_flag; 
    private $cnh_numero_registro; 
    private $cnh_categoria_id; 
    private $cnh_data_primeira_emissao; 
    private $cnh_data_validade; 
    private $motorista_situacao_id;                

    public function getNome(){
        return $this->nome;
    }

    public function setNome($nome){
        $this->nome = $nome;
    }

    public function getDocumento(){
        return $this->documento;
    }

    public function setDocumento($documento){
        $this->documento = $documento;
    }

    public function getDataNascimento(){
        return $this->data_nascimento;
    }

    public function setDataNascimento($data_nascimento){
        $this->data_nascimento = $data_nascimento;
    }

    public function getAtivoFlag(){
        return $this->ativo_flag;
    }

    public function setAtivoFlag($ativo_flag){
        $this->ativo_flag = $ativo_flag;
    }

    public function getCnhNumeroRegistro(){
        return $this->cnh_numero_registro;
    }

    public function setCnhNumeroRegistro($cnh_numero_registro){
        $this->cnh_numero_registro = $cnh_numero_registro;
    }

    public function getCnhCategoriaId(){
        return $this->cnh_categoria_id;
    }

    public function setCnhCategoriaId($cnh_numero_registro){
        $this->cnh_categoria_id = $cnh_numero_registro;
    }
    
    public function getCnhDataPrimeiraEmissao(){
        return $this->cnh_data_primeira_emissao;
    }

    public function setCnhDataPrimeiraEmissao($cnh_data_primeira_emissao){
        $this->cnh_data_primeira_emissao = $cnh_data_primeira_emissao;
    }

    public function getCnhDataValidade(){
        return $this->cnh_data_validade;
    }

    public function setCnhDataValidade($cnh_data_validade){
        $this->cnh_data_validade = $cnh_data_validade;
    }

    public function getMotoristaSituacaoId(){
        return $this->motorista_situacao_id;
    }

    public function setMotoristaSituacaoId($motorista_situacao_id){
        $this->motorista_situacao_id = $motorista_situacao_id;
    }
}