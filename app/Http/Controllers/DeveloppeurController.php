<?php


namespace App\Http\Controllers;


use App\Developpeur;
use App\Kernel\ToolBox;
use App\Langage;

class DeveloppeurController
{
    // afficher la page pour lister les developpeurs
    public function index(){
//        echo "salut voici la liste des développeurs";
        //recuperer les devs de l'équipe
        // 1- on recupere l'id de l'équipe dans l'url via $_GET
        $id_equipe = isset($_GET['id']) ? $_GET['id'] : null;
        $nom_equipe = isset($_GET['nom']) ? $_GET['nom'] : null;
        if(!empty($id_equipe) && !empty($nom_equipe)){
            $developpeur = new Developpeur();
            $developpeurs = $developpeur->findDeveloppeurEquipe($id_equipe);
//            var_dump($developpeurs);
//            die();
            require 'resources/views/developpeur/index.php';
        }
    }

    public function profil(){
        $id_developpeur = isset($_GET['id']) ? $_GET['id'] : null;
//        $nom_developpeur = isset($_GET['nom']) ? $_GET['nom'] : null;
        $dev = new Developpeur();
        $developpeur = $dev->findOneDeveloppeur($id_developpeur);
//        var_dump($deleveloppeur);
//        die();

        require 'resources/views/developpeur/profil.php';
    }

    public function add(){
        $langage = new Langage();
        $langages = $langage->findAllLangages();

//        var_dump($langages);
//        die();

        require 'resources/views/developpeur/add.php';
    }

    // créer un dev et associer des langages connus dans la table de liaison langage developeur
    public function store(){
        // vérifier que les champs du forum sont remplis
        print_r($_POST);
        $datas_clean = ToolBox::extractDatasForm($_POST,['nom','bio','langages']);
        if(in_array(null,$datas_clean)){
            session_start();
            $_SESSION['messages'] = ['Tous les champs sont obligatoires'];
            header('Location: index.php?uri=developpeur/add');
            exit();
        }else{
            // créer un objet dev
            $developpeur = new Developpeur();
            // "hydrater" l'objet
            $developpeur->setNom($datas_clean['nom']);
            $developpeur->setBio($datas_clean['bio']);
            $developpeur->setCreatedAt(new \DateTime());

            // insérer dans la db
            $developpeur->addDeveloppeur();
            $developpeur->addLangages($datas_clean['langages']);
            header('Location: ?uri=developpeur/profil&id='.$developpeur->getId());
        }
        // puis insérer dans les tables
    }
}