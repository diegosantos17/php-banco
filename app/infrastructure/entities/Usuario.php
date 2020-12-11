<?php

namespace app\infrastructure\entities;

use app\infrastructure\contracts\entities\EntityBase;
use app\crosscuting\EncryptionTrait;

class Usuario extends EntityBase{

    use EncryptionTrait;

    private $nome;
    private $email;
    private $senha;
    private $token;
    private $foto;

    public function getNome(){
        return $this->nome;
    }

    public function setNome($nome){
        $this->nome = $nome;
    }

    public function getEmail(){
        return $this->email;
    }

    public function setEmail($email){
        $this->email = $email;
    }

    public function getFoto(){
        return $this->foto;
    }

    public function setFoto($foto){
        $this->foto = $foto;
    }

    public function getSenha(){
        return $this->senha;
    }

    public function setSenha($senha){
        $this->senha = $senha;
    } 
    
    public function getToken(){
        return $this->token;
    }

    public function setToken($token){
        $this->token = $this->encryption($token, PRIVATE_KEY);
    }
}