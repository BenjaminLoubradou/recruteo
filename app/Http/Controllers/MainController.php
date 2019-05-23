<?php


namespace App\Http\Controllers;


use App\Equipe;

class MainController
{
    //Affichage de la page d'accueil
    public function index(){
        $equipe = new Equipe();
        $equipes = $equipe->findAllEquipe();

//        var_dump($equipes);
//        die();

        require 'resources/views/main/index.php';
    }

    //page pour afficher la page de contact() {
    public function contact(){
//        echo "salut c'est la methode qui permettra d'afficher la page de contact";
        require 'resources/views/main/contact.php';
    }
}