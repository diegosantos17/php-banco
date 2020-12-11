<?php

// Carregar o autoloader do composer

use app\infrastructure\repositories\UsuarioRepository;

require "../../vendor/autoload.php";
require "../config/global.php";

$usuarioRepository = new UsuarioRepository();

$usuarios = $usuarioRepository->read();

foreach ($usuarios as $key=>$usuario) {
    echo $usuario->getNome() . PHP_EOL;
}
