<?php

require_once "models/mantenimientos/proveedores.model.php";

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
        $viewData["proveedores"] = getAllProveedores();
    } else {
        $viewData["proveedores"] = getProveedoresPorFiltro($viewData["pro_txtfilter"]);
    }

    renderizar("mantenimientos/proveedores", $viewData);
}

run();
?>