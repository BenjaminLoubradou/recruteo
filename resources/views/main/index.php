<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        table,td,th {
            border:1px solid #000;
            border-collapse: collapse;
            padding:5px;
        }
    </style>
</head>
<body>
    <?php require 'resources/views/layout/menu.php' ?>
    <h1>Bienvenue sur Recruteo</h1>
    <p>Cette application vous permettra de gérer des équipes de développeur.</p>

    <h2>Voici la liste des équipes: </h2>
    <table >
        <thead>
            <tr>
                <th>Nom</th>
                <th>Date de création</th>
            </tr>
        </thead>
        <tbody>
<!--            on affiche la liste des équipes-->
            <?php foreach ($equipes as $equipe) :?>
                <tr>
                    <td><?= $equipe->getNom() ?></td>
                    <td><?= $equipe->getCreatedAt() ?></td>
                    <td><a href="index.php?uri=developpeur/index&id=<?= $equipe->getId() ?>&nom=<?= $equipe->getNom() ?>">Voir les développeurs</a>
                    </td>
                </tr>
            <?php endforeach ?>
        </tbody>
    </table>
</body>
</html>
