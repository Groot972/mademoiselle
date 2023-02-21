<?php

class Etablissement{
    ///DB
    private $db;


    //Etablissement properties
    public $id;
    public $nom;
    public $adresse;
    public $numero_rue;
    public $ville;
    public $director;
    public $enseignants;
    public $classes;
    
    public function __construct($db){
        $this->db = $db;
    }

    //Create Etablissement
    public function createEtablissement(){
        $sql = "INSERT INTO etablissement(nom, adresse, numero_rue, ville, director, enseignants, classes) 
                VALUES (:nom, :adresse, :numero_rue, :ville, :director)";

        $query = $this->db->prepare($sql);
        //bind the value
        $query->bindValue(":nom", $this->nom);
        $query->bindValue(":adresse", $this->adresse);
        $query->bindValue(":nbrue", $this->numero_rue);
        $query->bindValue(":ville", $this->ville);
        $query->bindValue(":director", $this->director);

        if ( $query->execute() ) {
            return true;
        }

        return false;
    }   


    //afficher ses informations et le directeur.
    public function readEtablissement($id_etablissement){
        $sql="SELECT etablissement.nom, etablissement.adresse, etablissement.numero_rue, etablissement.ville, 
        directeurs.nom AS directeur_nom, 
        directeurs.prenom AS directeur_prenom, 
        directeurs.numero_rue AS directeur_rue,
        directeurs.adresse AS directeur_adresse,
        directeurs.ville AS directeur_ville,
        directeurs.telephone AS directeur_telephone 
        FROM etablissement JOIN directeurs 
        WHERE etablissement.id=$id_etablissement AND directeurs.id = etablissement.director_id";

        $query = $this->db->query($sql);
        
        if($query->execute()){
            while ($row = $query->fetch()){
                
                echo '<h1>Etablissement : </h1>';
                echo '<p>nom :'.$row['nom'].'<p>';
                echo '<p>adresse :'.$row['adresse'].'<p>';
                echo '<p>numero_rue :'.$row['numero_rue'].'<p>';
                echo '<p>ville :'.$row['ville'].'<p>';
                echo '<h2>Directeur infos : </h2>';
                echo '<p>nom :'.$row['directeur_nom'].'<p>';
                echo '<p>prenom :'.$row['directeur_prenom'].'<p>';
                echo '<p>numero_rue :'.$row['directeur_rue'].'<p>';
                echo '<p>adresse :'.$row['directeur_adresse'].'<p>';
                echo '<p>ville :'.$row['directeur_ville'].'<p>';
                echo '<p>telephone :'.$row['directeur_telephone'].'<p>';
            }
        }
        else{
            echo 'erreur';
        }

    }

    //Lister ensuite les enseignants qui y travaillent
    public function listEnseignants($id_etablissement){
        $sql = "SELECT enseignants.nom, enseignants.prenom, enseignants.adresse, enseignants.numero_rue, enseignants.ville, enseignants.telephone, enseignants.diplome, matiere.nom AS matiere, matiere.code AS code FROM enseignants JOIN matiere
        WHERE enseignants.etablissement_id = $id_etablissement AND enseignants.matiere_id = matiere.id";

        $query = $this->db->query($sql);

        if($query->execute()){
            while ($row = $query->fetch()){
                echo "<div>";
                echo '<h1>Enseignant : </h1>';
                echo '<p>nom :'.$row['nom'].'<p>';
                echo '<p>prenom :'.$row['prenom'].'<p>';
                echo '<p>adresse :'.$row['adresse'].'<p>';
                echo '<p>numero_rue :'.$row['numero_rue'].'<p>';
                echo '<p>ville :'.$row['ville'].'<p>';
                echo '<p>telephone :'.$row['telephone'].'<p>';
                echo '<p>diplome :'.$row['diplome'].'<p>';
                echo '<p>matiere :'.$row['matiere'].'<p>';
                echo '<p>code :'.$row['code'].'<p>';
                
                echo "</div>";
            }
        }
        else{
            echo 'erreur';
        }

    }

     

    //Afficher ensuite les classes  , les élèves et les professeurs de la classe.
    public function listClassesAndEleves($id_etablissement){
        $sql = "SELECT eleves.nom AS nom, eleves.prenom AS prenom, eleves.adresse AS adresse, 
        eleves.numero_rue AS rue, eleves.ville AS ville, eleves.telephone AS telephone, eleves.date_naissance AS birthday, classes.nom AS classe_nom, classes.code AS classe_code FROM `classes` 
        JOIN eleves 
        WHERE eleves.classe_id = classes.id
        AND etablissement_id = $id_etablissement
        ORDER BY classe_id
        ";

        
        $query = $this->db->query($sql);

        $array = array();
        
        while( $row = $query->fetchAll() ) {

            $array[] = $row;
        }

        return($array) ;
    }


//enseignants /classes
    public function listClassesAndEnseignants($id_etablissement){
        $sql = "SELECT enseignants.nom AS nom, enseignants.prenom AS prenom, enseignants.adresse AS adresse, 
        enseignants.numero_rue AS rue, enseignants.ville AS ville, enseignants.telephone AS telephone, enseignants.diplome AS diplome, classes.nom AS classe_nom, classes.code AS classe_code FROM `classes` 
       INNER JOIN enseignants, classes_enseignants
        WHERE classes.id = classes_enseignants.classe_id
        AND classes.etablissement_id = $id_etablissement
       
        ORDER BY classes.id
        ";

        
        $query = $this->db->query($sql);

        $array = array();
        
        while( $row = $query->fetchAll() ) {

            $array[] = $row;
        }

        return($array) ;}
    }

       