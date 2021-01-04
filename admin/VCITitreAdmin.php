<?php
getDb()
?>

<html>
<head>
    <title>Bienvenue au Vidéo-Club !</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="styleadmin.css.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4">
            <a href="../VCIAccueil.php"><img src="../images/VCLogo.gif"></a>
        </div>
        <div class="col-md-4">
            <center><br><h1>Vidéo-Club</h1>
                <strong>... et si on se faisait une toile, à la maison ?</strong><br></center>
        </div>
        <div class="col-md-4">
            <center><br><p><?php
                    setlocale (LC_TIME, 'fr_FR.utf8','fra');
                    echo (strftime("%A %d %B"));
                    ?><br>
                </p>
                <p><a href="./admin/VCIAdmin.php">Connexion</a></p></center></td>
        </div>
    </div>
</div>