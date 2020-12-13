<?php

require_once "models/mantenimientos/historicos.model.php";

function run(){
    $viewData = array();
    $viewData["h_txtfilter"] = "";
    if (isset($_SESSION["h_txtfilter"])) {
        $viewData["h_txtfilter"] = $_SESSION["h_txtfilter"];
    }
    if (isset($_POST["btnFiltrar"])) {
        mergeFullArrayTo($_POST, $viewData);
        $_SESSION["h_txtfilter"] = $viewData["h_txtfilter"];
    }
    if ($viewData["h_txtfilter"] === "") {
        $viewData["historicos"] =  getAllHistoricos();
    } else {
        $viewData["historicos"] =  gethistoricosByfiltro($viewData["h_txtfilter"]);
    }

    renderizar("mantenimientos/historicos", $viewData);
}

run();
?>