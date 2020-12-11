<?php
namespace app\infrastructure\contracts\entities;

abstract class EntityBase {
    private $id;
    private $criadoEm;
    private $criadoPor;
    private $alteradoEm;
    private $alteradoPor;

    public function getId(){
        return $this->id;
    }

    public function setId($id){
        $this->id = $id;
    }

    public function getCriadoEm(){
        return $this->criadoEm;
    }

    public function setCriadoEm($criadoEm){
        $this->criadoEm = $criadoEm;
    }

    public function getCriadoPor(){
        return $this->criadoPor;
    }

    public function setCriadoPor($criadoPor){
        $this->criadoPor = $criadoPor;
    }

    public function getAlteradoPor(){
        return $this->alteradoPor;
    }

    public function setAlteradoPor($alteradoPor){
        $this->alteradoPor = $alteradoPor;
    }

    public function getAlteradoEm(){
        return $this->alteradoEm;
    }

    public function setAlteradoEm($alteradoEm){
        $this->updateAt = $alteradoEm;
    }
}