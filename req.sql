-- se connecter au serveur Mysql avec le user root
mysql -u root -p

-- créer une base de données
CREATE DATABASE recruteo_db CHARACTER SET UTF8mb4 COLLATE utf8mb4_general_ci;

-- voir les bases de données
SHOW DATABASES;

-- sélectionner la base de notre choix
USE recruteo_db;

-- créer une table
CREATE TABLE societe(
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    code_postal VARCHAR(255) NOT NULL,
    ville VARCHAR(255) NOT NULL,
    CONSTRAINT pk_id_societe PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE langage(
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    CONSTRAINT pk_id_langage PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE developpeur(
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    bio TEXT NOT NULL,
    created_at DATETIME NOT NULL,
    CONSTRAINT pk_id_developpeur PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE equipe(
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL,
    id_societe INT NOT NULL,
    CONSTRAINT pk_id_equipe PRIMARY KEY (id),
    CONSTRAINT fk_id_societe FOREIGN KEY (id_societe) REFERENCES societe(id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- table de jointure entre equipe et developpeur
CREATE TABLE equipe_developpeur(
   id_developpeur INT NOT NULL,
   id_equipe INT NOT NULL,
   date_inscription DATETIME,
   CONSTRAINT pk_equipe_developpeur PRIMARY KEY (id_developpeur,id_equipe),
   CONSTRAINT fk_id_developpeur FOREIGN KEY (id_developpeur) REFERENCES developpeur(id) ON DELETE CASCADE,
   CONSTRAINT fk_id_equipe FOREIGN KEY (id_equipe) REFERENCES equipe(id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- table de jointure entre langage et develeppeur
CREATE TABLE langage_developpeur(
    id_developpeur INT NOT NULL,
    id_langage INT NOT NULL,
    CONSTRAINT pk_langage_developpeur PRIMARY KEY (id_developpeur,id_langage),
    CONSTRAINT fk_id_developpeur_lang FOREIGN KEY (id_developpeur) REFERENCES developpeur(id) ON DELETE CASCADE,
    CONSTRAINT fk_id_langage FOREIGN KEY (id_langage) REFERENCES langage(id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- table de jointure enre langage et equipe
CREATE TABLE langage_requis_equipe(
    id_equipe INT NOT NULL,
    id_langage INT NOT NULL,
    CONSTRAINT pk_langage_requis_equipe PRIMARY KEY (id_equipe,id_langage),
    CONSTRAINT fk_id_equipe_langage_requis FOREIGN KEY (id_equipe) REFERENCES equipe(id) ON DELETE CASCADE,
    CONSTRAINT fk_id_langage_requis FOREIGN KEY (id_langage) REFERENCES langage(id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- créer une société
INSERT INTO societe (nom, adresse, code_postal, ville) VALUES ('Next-Formation','6 rue Firmin Guillot','75015','paris');

UPDATE societe SET adresse = '6-8 rue Firmin Gillot';

-- afficher le contenu de societe
SELECT * FROM societe;

-- créer une équipe
INSERT INTO equipe (nom, created_at, id_societe) VALUES ('DWWM',NOW(),1);



-- jointure entre societe et equipe
SELECT * FROM equipe LEFT JOIN societe ON societe.id = equipe.id_societe;
-- autre syntaxe
SELECT * FROM equipe,societe WHERE societe.id = equipe.id.societe;

-- supprimer un tuple
DELETE FROM societe WHERE id = 1;

-- créer un dev
INSERT INTO developpeur(nom,bio,created_at) VALUES ('vincent','j\'aime les tic tac',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('alain','j\'aime m\'entrainer',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('ozan','j\'aime les mangas',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('marie-line','j\'aime la moto',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('serge','j\'aime l\'amour véritable',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('jamal','j\'aime la sieste',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('said','j\'aime la grasse mat\'',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('benjamin','j\'aime le hockey sur glace',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('julien','j\'aime tinder',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('marie','j\'aime just dance',NOW());
INSERT INTO developpeur(nom,bio,created_at) VALUES ('majid','j\'aime bien me reposer à la maison',NOW());

-- lier les dev à l'équipe
INSERT INTO equipe_developpeur (id_developpeur, id_equipe, date_inscription) VALUES (1,2,NOW());
INSERT INTO equipe_developpeur (id_developpeur, id_equipe, date_inscription) VALUES (2,2,NOW());
INSERT INTO equipe_developpeur (id_developpeur, id_equipe, date_inscription) VALUES (3,2,NOW());
INSERT INTO equipe_developpeur (id_developpeur, id_equipe, date_inscription) VALUES (4,2,NOW());
INSERT INTO equipe_developpeur (id_developpeur, id_equipe, date_inscription) VALUES (5,2,NOW());
INSERT INTO equipe_developpeur (id_developpeur, id_equipe, date_inscription) VALUES (6,2,NOW());
INSERT INTO equipe_developpeur (id_developpeur, id_equipe, date_inscription) VALUES (7,2,NOW());
INSERT INTO equipe_developpeur (id_developpeur, id_equipe, date_inscription) VALUES (8,2,NOW());
INSERT INTO equipe_developpeur (id_developpeur, id_equipe, date_inscription) VALUES (9,2,NOW());
INSERT INTO equipe_developpeur (id_developpeur, id_equipe, date_inscription) VALUES (10,2,NOW());
INSERT INTO equipe_developpeur (id_developpeur, id_equipe, date_inscription) VALUES (11,2,NOW());

-- insérer un langage
INSERT INTO langage (nom) VALUES ('php');
INSERT INTO langage (nom) VALUES ('javascript');
INSERT INTO langage (nom) VALUES ('node.js');
INSERT INTO langage (nom) VALUES ('html');
INSERT INTO langage (nom) VALUES ('css');
INSERT INTO langage (nom) VALUES ('laravel');
INSERT INTO langage (nom) VALUES ('symfony');
INSERT INTO langage (nom) VALUES ('react');
INSERT INTO langage (nom) VALUES ('react native');
INSERT INTO langage (nom) VALUES ('vue.js');
INSERT INTO langage (nom) VALUES ('angular');

-- associer les dev avec les langages
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (1,1);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (1,2);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (1,3);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (2,3);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (2,4);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (2,5);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (3,5);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (3,6);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (3,7);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (4,7);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (4,8);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (4,9);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (5,9);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (5,10);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (5,11);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (6,11);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (6,10);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (6,9);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (7,9);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (7,8);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (7,7);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (8,7);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (8,6);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (8,5);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (9,5);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (9,4);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (9,3);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (10,3);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (10,2);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (10,1);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (11,4);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (11,6);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (11,9);

INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (2,1);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (2,2);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (3,1);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (3,2);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (4,1);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (4,2);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (5,1);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (5,2);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (6,1);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (6,2);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (7,1);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (7,2);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (8,1);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (8,2);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (9,1);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (9,2);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (11,1);
INSERT INTO langage_developpeur (id_developpeur, id_langage) VALUES (11,2);

-- associer langage_requis et equipe
INSERT INTO langage_requis_equipe (id_equipe, id_langage) VALUES (2,1);
INSERT INTO langage_requis_equipe (id_equipe, id_langage) VALUES (2,2);


-- consulter la liste des devs qui appartiennet à une équipe
SELECT * FROM developpeur d
    LEFT JOIN equipe_developpeur ed on d.id = ed.id_developpeur
    LEFT JOIN equipe e on e.id = ed.id_equipe
    LEFT JOIN societe s on s.id = e.id_societe;

-- autres syntaxe(oracle?)
SELECT * FROM developpeur,equipe_developpeur,equipe,societe
WHERE developpeur.id = equipe_developpeur.id_developpeur
AND equipe.id = equipe_developpeur.id_equipe
AND societe.id = equipe.id_societe;
