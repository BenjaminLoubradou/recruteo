<?php
// chargement du fichier autoloader généré par Composer.
require 'vendor/autoload.php';

//print_r($_GET);

// par la methode GET on défini un variable 'URI'
$uri = $_GET['uri'];
//echo $uri;
//die();

if($uri == "main/index"){
    $controller = new \App\Http\Controllers\MainController();
    $controller->index();
}elseif($uri == "main/contact"){
    $controller = new \App\Http\Controllers\MainController();
    $controller->contact();
}elseif ($uri == "developpeur/index"){
    $controller = new \App\Http\Controllers\DeveloppeurController();
    $controller->index();
}elseif ($uri == "developpeur/profil"){
    $controller = new \App\Http\Controllers\DeveloppeurController();
    $controller->profil();
}elseif ($uri == "developpeur/add"){
    $controller = new \App\Http\Controllers\DeveloppeurController();
    $controller->add();
}elseif ($uri == "developpeur/store"){
    $controller = new \App\Http\Controllers\DeveloppeurController();
    $controller->store();
}



