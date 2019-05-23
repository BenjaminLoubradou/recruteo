<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <?php require 'resources/views/layout/menu.php' ?>
    <h1>Voici le profil de <?= ucfirst($developpeur->getNom()) ?> </h1>
    <p><?= ucfirst($developpeur->getBio()) ?></p>
    <h2>Languages :</h2>
    <ul>
        <?php foreach ($developpeur->getLangages() as $langage) :?>
            <li><?= $langage->getNom() ?></li>
        <?php endforeach; ?>
    </ul>

</body>
</html>