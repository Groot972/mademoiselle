<?php 
include 'etablissements-class.php';

$servername = 'localhost';
$username = 'root';
$password = '';
//On établit la connexion
$conn = new PDO("mysql:host=$servername;dbname=school", $username, $password);


$ets = new Etablissement($conn);
$id_etablissement = 1;
$ets->readEtablissement($id_etablissement);
$ets->listEnseignants($id_etablissement);
$ets->listClassesAndEleves($id_etablissement);
$ets->listClassesAndEnseignants($id_etablissement);