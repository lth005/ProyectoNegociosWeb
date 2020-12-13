<?php 
require_once "models/mantenimientos/principios_activos.model.php";
//ALTER TABLE `principio_activo` ADD `estado` CHAR(3) NOT NULL AFTER `nombre_principio_activo`; 
//idprincipio_activo
//nombre_principio_activo
function run() {
    $viewData=array();
    $viewData["mode"] = "";
    $viewData["modedsc"] = "";
    $viewData["idprincipio_activo"] = 0;
    $viewData["nombre_principio_activo"] = "" ;
    $viewData["estado"] = "ACT";

    $viewData["estado_ACT"] = "selected";
    $viewData["estado_INA"] = "";

    $viewData["readonly"] = "";
    $viewData["deletemsg"] = "";

    $modedsc = array(
      "INS"=>"Nuevo principio activo",
      "UPD"=>"Actualizar principio activo %s",
      "DEL"=>"Eliminar principio activo %s",
      "DSP"=>"Detalle de principios activo %s"
    );
    if (isset($_GET["mode"])) {
        $viewData["mode"] = $_GET["mode"];
        $viewData["idprincipio_activo"] = intval($_GET["idprincipio_activo"]);
        if (!isset($modedsc[$viewData["mode"]])) {
            redirectWithMessage("No se puede realizar esta operación", "index.php?page=principios_activos");
            die();
        }
    }

    if (isset($_POST["btnsubmit"])) {
        mergeFullArrayTo($_POST, $viewData);
        //Verificacion de XSS_Token
        if (!(isset($_SESSION["cln_csstoken"]) && $_SESSION["cln_csstoken"] == $viewData["xsstoken"])) {
            redirectWithMessage("No se puede realizar esta operación", "index.php?page=principios_activos");
            die();
        }

        // Validaciones de Entrada de Datos


        switch ($viewData["mode"]){
        case "INS":
            $result = addNewPrincipio_activo(
                $viewData["nombre_principio_activo"],
                $viewData["estado"]
    
            );
            if ($result > 0) {
                redirectWithMessage("Guardado Exitosamente", "index.php?page=principios_activos");
                die();
            }
            break;
        case "UPD":
            $result = updatePrincipio_activo(
                $viewData["nombre_principio_activo"],
                $viewData["estado"],
                $viewData["idprincipio_activo"]
            );
            if ($result >= 0) {
                redirectWithMessage("Actualizado Exitosamente", "index.php?page=principios_activos");
                die();
            }
            break;
        case "DEL":
            $result = deletePrincipio_activo($viewData["idprincipio_activo"]);
            if ($result > 0) {
                redirectWithMessage("Eliminado Exitosamente", "index.php?page=principios_activos");
                die();
            }
            break;
        }
    }
    if ($viewData["mode"] === "INS") {
        $viewData["modedsc"] = $modedsc[$viewData["mode"]];
    } else {
        $principios_activoDBData = getPrincipio_activoById($viewData["idprincipio_activo"]);
        mergeFullArrayTo($principios_activoDBData, $viewData);

        $viewData["modedsc"] = sprintf($modedsc[$viewData["mode"]], $viewData["nombre_principio_activo"]);

        $viewData["estado_ACT"] = ($viewData["estado"] == "ACT") ? "selected" : "";
        $viewData["estado_INA"] = ($viewData["estado"] == "INA") ? "selected" : ""; 
        // Sacar la data de la DB
        if ($viewData["mode"] != 'UPD') {
            $viewData["readonly"] = "readonly";
        }

        if ($viewData["mode"] == 'DEL') {
            $viewData["deletemsg"] = "Esta Seguro de Eliminar este registro, es una operación definitiva.";
        }
    }
  
    // Crear un token unico
    // Guardar en sesión ese token unico para su verificación posterior
    $viewData["xsstoken"] = uniqid("cln", true);
    $_SESSION["cln_csstoken"] = $viewData["xsstoken"];
    renderizar("mantenimientos/principio_activo", $viewData);
}

run();
?>