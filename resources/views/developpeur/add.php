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

    <h1 style="color:red"><?= \App\Kernel\ToolBox::getFlash() ?></h1>
    <h1>Ajoutez un nouveau développeur :</h1>
    <form action="?uri=developpeur/store" method="POST">
        <div>
            <label for="nom">Nom</label> <br/>
            <input type="text" id="nom" name="nom">
        </div>
        <div>
            <label for="bio">Biographie</label> <br/>
            <textarea id="bio" name="bio" cols="30" rows="10"></textarea>
            <!--lié à la base de donnée l'attribut bio est configuré en tant que TEXT.-->
        </div>
        <div>
            <input type="hidden" name="langages[]" value="">
            <?php foreach ($langages as $langage) :?>
            <label>
                    <input type="checkbox" name="langages[]" value="<?= $langage->getId() ?>"><?= $langage->getNom() ?>
                    <!--on rajoute des crochets pour que l'on puisse mettre tous les langages dans un tableau langages.-->
            </label><br>
            <?php endforeach; ?>
        </div>
        <div>
            <input type="submit">
        </div>
    </form>
</body>
</html>