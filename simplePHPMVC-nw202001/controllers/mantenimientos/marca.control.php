<?php 
require_once "models/mantenimientos/marcas.model.php";
//ALTER TABLE `marcas` ADD `estado` CHAR(3) NOT NULL AFTER `nombre_marca`; 

function run() {
    $viewData=array();
    $viewData["mode"] = "";
    $viewData["modedsc"] = "";
    $viewData["id_marca"] = 0;
    $viewData["nombre_marca"] = "" ;
    $viewData["estado"] = "ACT";

    $viewData["estado_ACT"] = "selected";
    $viewData["estado_INA"] = "";

    $viewData["readonly"] = "";
    $viewData["deletemsg"] = "";

    $modedsc = array(
      "INS"=>"Nuevo marca",
      "UPD"=>"Actualizar marca %s",
      "DEL"=>"Eliminar marca %s",
      "DSP"=>"Detalle de marca %s"
    );
    if (isset($_GET["mode"])) {
        $viewData["mode"] = $_GET["mode"];
        $viewData["id_marca"] = intval($_GET["id_marca"]);
        if (!isset($modedsc[$viewData["mode"]])) {
            redirectWithMessage("No se puede realizar esta operación", "index.php?page=marcas");
            die();
        }
    }

    if (isset($_POST["btnsubmit"])) {
        mergeFullArrayTo($_POST, $viewData);
        //Verificacion de XSS_Token
        if (!(isset($_SESSION["cln_csstoken"]) && $_SESSION["cln_csstoken"] == $viewData["xsstoken"])) {
            redirectWithMessage("No se puede realizar esta operación", "index.php?page=marcas");
            die();
        }

        // Validaciones de Entrada de Datos


        switch ($viewData["mode"]){
        case "INS":
            $result = addNewMarca(
                $viewData["nombre_marca"],
                $viewData["estado"]
    
            );
            if ($result > 0) {
                redirectWithMessage("Guardado Exitosamente", "index.php?page=marcas");
                die();
            }
            break;
        case "UPD":
            $result = updateMarca(
                $viewData["nombre_marca"],
                $viewData["estado"],
                $viewData["id_marca"]
            );
            if ($result >= 0) {
                redirectWithMessage("Actualizado Exitosamente", "index.php?page=marcas");
                die();
            }
            break;
        case "DEL":
            $result = deleteMarca($viewData["id_marca"]);
            if ($result > 0) {
                redirectWithMessage("Eliminado Exitosamente", "index.php?page=marcas");
                die();
            }
            break;
        }
    }
    if ($viewData["mode"] === "INS") {
        $viewData["modedsc"] = $modedsc[$viewData["mode"]];
    } else {
        $marcaDBData = getMarcasById($viewData["id_marca"]);
        mergeFullArrayTo($marcaDBData, $viewData);

        $viewData["modedsc"] = sprintf($modedsc[$viewData["mode"]], $viewData["nombre_marca"]);

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
    renderizar("mantenimientos/marca", $viewData);
}

run();
?>