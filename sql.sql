
CREATE TABLE directeurs (
    id int PRIMARY KEY AUTO_INCREMENT,
    nom varchar(255),
    prenom varchar(255),
    adresse varchar(255),
    numero_rue int,
    ville varchar(255),
    telephone varchar(255)
);


CREATE TABLE matiere(
    id int PRIMARY KEY AUTO_INCREMENT,
    nom varchar(255),
    code int
);

CREATE TABLE etablissement (
    id int PRIMARY KEY AUTO_INCREMENT,
    nom varchar(255) ,
    adresse varchar(255) ,
    numero_rue int ,
    ville varchar(255) ,
    director_id int,
    CONSTRAINT FOREIGN KEY (director_id) REFERENCES directeurs(id)
    );

CREATE TABLE classes (
    id int PRIMARY KEY AUTO_INCREMENT,
    nom varchar(255),
    code int,
    etablissement_id int,
    CONSTRAINT FOREIGN KEY (etablissement_id) REFERENCES etablissement(id)
);

CREATE TABLE eleves (
    id int PRIMARY KEY AUTO_INCREMENT,
    nom varchar(255),
    prenom varchar(255),
    adresse varchar(255),
    numero_rue int,
    ville varchar(255),
    telephone varchar(255),
    date_naissance date,
    classe_id int,
    CONSTRAINT FOREIGN KEY (classe_id) REFERENCES classes(id)
);

CREATE TABLE enseignants (
    id int PRIMARY KEY AUTO_INCREMENT,
    nom varchar(255),
    prenom varchar(255),
    adresse varchar(255),
    numero_rue int,
    ville varchar(255),
    telephone varchar(255),
    diplome varchar(255),
    etablissement_id int, 
    matiere_id int,
    CONSTRAINT FOREIGN KEY (etablissement_id) REFERENCES etablissement(id),
    CONSTRAINT FOREIGN KEY (matiere_id) REFERENCES matiere(id)
);

CREATE TABLE classes_enseignants (
classe_id INT NOT NULL,
enseignant_id INT NOT NULL,
CONSTRAINT FOREIGN KEY (classe_id) REFERENCES classes(id) ,
CONSTRAINT FOREIGN KEY (enseignant_id) REFERENCES enseignants(id),
CONSTRAINT PRIMARY KEY (classe_id, enseignant_id)
);

/*
* Insertion de quelques données
*/


INSERT INTO matiere (code, nom) VALUES 
    (001, 'Mathematiques'),
    (002, 'Anglais');

INSERT INTO directeurs (prenom, nom, adresse, numero_rue, ville, telephone) VALUES 
    ('Directeur1', 'Nom-directeur1', 'rue directeur 1', 01, 'Ville-du-directeur-1', '06-00-00-00-00'),
    ('Directeur2', 'Nom-directeur2', 'rue directeur 2', 02, 'Ville-du-directeur-2', '06-00-00-00-01');

INSERT INTO etablissement(nom, adresse, numero_rue, ville, director_id) 
    VALUES 
    ('Etablissement1', 'rue batiment 1', 01, 'Ville-du-batiment-1', 1),
    ('Etablissement 2', 'rue batiment 2', 02, 'Ville-du-batiment-2', 2);
   
INSERT INTO classes (code, nom, etablissement_id) VALUES 
    (101, 'classe A', 1),
    (102, 'classe B', 1),
    (103, 'classe C', 2),
    (104, 'classe D', 2);

INSERT INTO eleves (prenom, nom, adresse, numero_rue, ville, telephone, date_naissance, classe_id) VALUES 
    ('eleve1', 'Nom-eleve1', 'rue eleve 1', 01, 'Ville-eleve-1', '06-00-00-00-03', 15/01/1994, 1),
    ('eleve2', 'Nom-eleve2', 'rue eleve 2', 02, 'Ville-eleve-2', '06-00-00-00-04', 16/01/1994, 1),
    ('eleve3', 'Nom-eleve3', 'rue eleve 3', 03, 'Ville-eleve-3', '06-00-00-00-05', 17/01/1994, 1),
    ('eleve4', 'Nom-eleve4', 'rue eleve 4', 04, 'Ville-eleve-4', '06-00-00-00-06', 18/01/1994, 2),
    ('eleve5', 'Nom-eleve5', 'rue eleve 5', 05, 'Ville-eleve-5', '06-00-00-00-07', 19/01/1994, 2);

INSERT INTO enseignants (nom, prenom, adresse, numero_rue, ville, telephone, diplome, etablissement_id, matiere_id) VALUES 
    ('Enseignant1', 'Nom-enseignant1', 'rue enseignant 1', 01, 'Ville-enseignant-1', '06-00-00-00-02', 'Diplôme enseignant maths',1, 1),
    ('Enseignant2', 'Nom-enseignant2', 'rue enseignant 2', 02, 'Ville-enseignant-2',  '06-00-00-00-08', 'Diplôme enseignant anglais',1, 2),
    ('Enseignant3', 'Nom-enseignant3', 'rue enseignant 3', 03, 'Ville-enseignant-3',  '06-00-00-00-09', 'Diplôme enseignant maths',2, 1),
    ('Enseignant4', 'Nom-enseignant4', 'rue enseignant 4', 04, 'Ville-enseignant-4',  '06-00-00-00-10', 'Diplôme enseignant anglais', 2, 2);

INSERT INTO classes_enseignants VALUES 
(1,1), (1,2), (2,1), (3,3), (4,3), (4,4);
   