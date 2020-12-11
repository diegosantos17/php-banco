<?php

namespace app\infrastructure\contracts\repositories;

interface RepositoryInterface {
    public function create($entity);
    public function update($entity);
    public function read($filtro = []);
    public function delete($id);
    public function view($id);
}