<?php

require_once "models/mantenimientos/marcas.model.php";

function run(){
    $viewData = array();
    $viewData["mark_txtfilter"] = "";
    if (isset($_SESSION["mark_txtfilter"])) {
        $viewData["mark_txtfilter"] = $_SESSION["mark_txtfilter"];
    }
    if (isset($_POST["btnFiltrar"])) {
        mergeFullArrayTo($_POST, $viewData);
        $_SESSION["mark_txtfilter"] = $viewData["mark_txtfilter"];
    }
    if ($viewData["mark_txtfilter"] === "") {
        $viewData["marcas"] = getAllMarcas();
    } else {
        $viewData["marcas"] = getMarcasPorFiltro($viewData["mark_txtfilter"]);
    }

    renderizar("mantenimientos/marcas", $viewData);
}

run();
?>