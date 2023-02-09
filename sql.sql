CREATE TABLE etablissement (
    id int,
    nom varchar(255),
    adresse varchar(255),
    nbrue int,
    ville varchar(255),
    director_id int,
    enseignants int,
    classes int */
);

CREATE TABLE peoples (
    id int PRIMARY KEY,
    nom varchar(255),
    prenom varchar(255),
    adresse varchar(255),
    nbrue int,
    ville varchar(255),
    numero varchar(255),
    role varchar(255)
);

CREATE TABLE classes (
    id int PRIMARY KEY,
    nom varchar(255),
    etablissement_id int? 
    FOREIGN KEY (etablissement_id) REFERENCES etablissement(id)
    ON DELETE CASCADE
);

CREATE TABLE matiere(
    matiere_id int PRIMARY KEY,
    nom varchar(255)
)

CREATE TABLE aliment_lieu (
aliment_id INT NOT NULL,
lieu_id INT NOT NULL,
FOREIGN KEY (aliment_id) REFERENCES aliment (id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (lieu_id) REFERENCES lieu (id) ON DELETE RESTRICT ON UPDATE CASCADE,
PRIMARY KEY (aliment_id, lieu_id)
);

