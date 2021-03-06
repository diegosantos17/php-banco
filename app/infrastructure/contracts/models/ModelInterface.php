<?php

namespace app\infrastructure\contracts\models;

interface ModelInterface {
    public function create($entity);
    public function update($entity);
    public function read($filtro = []);
    public function delete($id);
    public function view($id);
}