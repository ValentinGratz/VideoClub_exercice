<?php
/*inclusion des fichiers connexion bdd, function, titre et menu*/
include_once ('includes/config/config.php');
include_once ('includes/bdconnexion.php');
include_once ('includes/functions.php');
include_once ('includes/VCITitre.php');
include_once ('includes/VCIMenu.html');

/**/

?>
<html>
<div id="corps" style="text-align: center;">
    <h1>Sélectionner le type de film que vous recherchez :</h1>
    <br><br>

    <form action="VCIResa2.php" method="GET">
        <select name="type_film">
            <option value="Mon premier film">Mon premier film</option>
            <option value="Mon 2? film">Mon 2? film</option>
            <option value="Mon 3? film">Mon 3? film</option>
        </select>
        <br><br>

        <a href="VCIResa2.php"><button type="button" class="btn btn-primary" value="submit">Valider</button></a>
    </form>
</div>
</html>
