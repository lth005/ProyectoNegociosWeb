<?php 
require_once "models/mantenimientos/proveedores.model.php";


function run() {
    $viewData=array();
    $viewData["mode"] = "";
    $viewData["modedsc"] = "";
    $viewData["idproveedor"] = 0;
    $viewData["nombre_proveedor"] = "" ;
    $viewData["telefono_proveedor"] = "";
    $viewData["direccion_proveedor"] = "";
    $viewData["estado"] = "ACT";

    $viewData["estado_ACT"] = "selected";
    $viewData["estado_INA"] = "";

    $viewData["readonly"] = "";
    $viewData["deletemsg"] = "";

    $modedsc = array(
      "INS"=>"Nuevo proveedor",
      "UPD"=>"Actualizar proveedor %s",
      "DEL"=>"Eliminar proveedor %s",
      "DSP"=>"Detalle de proveedor %s"
    );
    if (isset($_GET["mode"])) {
        $viewData["mode"] = $_GET["mode"];
        $viewData["idproveedor"] = intval($_GET["idproveedor"]);
        if (!isset($modedsc[$viewData["mode"]])) {
            redirectWithMessage("No se puede realizar esta operación", "index.php?page=proveedores");
            die();
        }
    }

    if (isset($_POST["btnsubmit"])) {
        mergeFullArrayTo($_POST, $viewData);
        //Verificacion de XSS_Token
        if (!(isset($_SESSION["cln_csstoken"]) && $_SESSION["cln_csstoken"] == $viewData["xsstoken"])) {
            redirectWithMessage("No se puede realizar esta operación", "index.php?page=proveedores");
            die();
        }

        // Validaciones de Entrada de Datos


        switch ($viewData["mode"]){
        case "INS":
            $result = addNewProveedor(
                $viewData["nombre_proveedor"],
                $viewData["telefono_proveedor"],
                $viewData["direccion_proveedor"],
                $viewData["estado"]
    
            );
            if ($result > 0) {
                redirectWithMessage("Guardado Exitosamente", "index.php?page=proveedores");
                die();
            }
            break;
        case "UPD":
            $result = updateProveedor(
                $viewData["nombre_proveedor"],
                $viewData["telefono_proveedor"],
                $viewData["direccion_proveedor"],
                $viewData["estado"],
                $viewData["idproveedor"]
            );
            if ($result >= 0) {
                redirectWithMessage("Actualizado Exitosamente", "index.php?page=proveedores");
                die();
            }
            break;
        case "DEL":
            $result = deleteProveedor($viewData["idproveedor"]);
            if ($result > 0) {
                redirectWithMessage("Eliminado Exitosamente", "index.php?page=proveedores");
                die();
            }
            break;
        }
    }
    if ($viewData["mode"] === "INS") {
        $viewData["modedsc"] = $modedsc[$viewData["mode"]];
    } else {
        $ProveedorDBData = getProveedoresById($viewData["idproveedor"]);
        mergeFullArrayTo($ProveedorDBData, $viewData);

        $viewData["modedsc"] = sprintf($modedsc[$viewData["mode"]], $viewData["nombre_proveedor"]);

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
    renderizar("mantenimientos/proveedor", $viewData);
}

run();
?>