<?php

require_once "models/mantenimientos/productos.model.php";

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
        $viewData["productos"] = todosLosProductos();
    } else {
        $viewData["productos"] = getProductosPorFiltro($viewData["pro_txtfilter"]);
    }

    renderizar("mantenimientos/productos", $viewData);
}

run();
?>