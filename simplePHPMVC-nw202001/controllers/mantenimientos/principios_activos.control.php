<?php

require_once "models/mantenimientos/principios_activos.model.php";

function run(){
    $viewData = array();
    $viewData["pro_txtfilter"] = "";
    if (isset($_SESSION["pro_txtfilter"])) {
        $viewData["pro_txtfilter"] = $_SESSION["pro_txtfilter"];
    }
    if (isset($_POST["btnFiltrar"])) {
        mergeFullArrayTo($_POST, $viewData);
        $_SESSION["pro_txtfilter"] = $viewData["pro_txtfilter"];
    }
    if ($viewData["pro_txtfilter"] === "") {
        $viewData["principios_activos"] = getAllPrincipios_activos();
    } else {
        $viewData["principios_activos"] = getPrincipios_activosPorFiltro($viewData["pro_txtfilter"]);
    }

    renderizar("mantenimientos/principios_activos", $viewData);
}

run();
?>