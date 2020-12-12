<?php
/**
 * É aqui que a CNH vai espanar, é aqui que o motorista é descoberto na calça curta.
 */
require "../../../vendor/autoload.php";
require "../../config/global.php";

use app\infrastructure\repositories\MotoristaRepository;

$motoristaRepository = new MotoristaRepository();

$motoristas = $motoristaRepository->read();

$hoje = new DateTime();

foreach ($motoristas as $key=>$motorista) {
    $cnhValidade =  date_create($motorista->getCnhDataValidade());

    $isVencida = ($cnhValidade->getTimestamp() - $hoje->getTimestamp()) < 0;

    if($isVencida){
        $motorista->setMotoristaSituacaoId(MOTORISTA_CNH_VENCIDA);
        $motoristaRepository->update($motorista);
    }
}
