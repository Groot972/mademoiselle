<?php

class Etablissement{
    ///DB
    private $db;


    //Etablissement properties
    public $id;
    public $nom;
    public $adresse;
    public $nbrue;
    public $ville;
    public $director;
    public $enseignants;
    public $classes;
  
    public function __construct($db){
        $this->db = $db;
    }
}