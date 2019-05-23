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
    <h2>Voici la liste des développeur de l'équipe <?= $nom_equipe ?></h2>
    <ul>
        <?php foreach ($developpeurs as $developpeur) :?>
            <li><a href="index.php?uri=developpeur/profil&id=<?= $developpeur->getId() ?>"><?= $developpeur->getNom() ?></a>
            </li>
        <?php endforeach; ?>
    </ul>

</body>
</html>