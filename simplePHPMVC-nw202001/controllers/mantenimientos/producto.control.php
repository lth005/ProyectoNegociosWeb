<?php

require_once "models/mantenimientos/productos.model.php";
require_once "models/mantenimientos/principios_activos.model.php";
require_once "models/mantenimientos/proveedores.model.php";
require_once "models/mantenimientos/marcas.model.php";
require_once "models/mantenimientos/categorias.model.php";

function run() {
    $viewData=array();
    $viewData["mode"] = "";
    $viewData["modedsc"] = "";
    $viewData["codprd"] = 0;
    $viewData["dscprd"] = "" ;
    $viewData["sdscprd"] = "";
    $viewData["ldscprd"] = "";
    $viewData["skuprd"] = "" ;
    $viewData["bcdprd"] = "";
    $viewData["stkprd"] = 0;
    $viewData["typprd"] = "RTL";
    $viewData["typprd_RTL"] = "selected";
    $viewData["typprd_SRV"] = "";
    $viewData["typprd_ISK"] = "";
    $viewData["prcprd"] = 0;
    $viewData["idprincipio_activo"] = "";
    $viewData["principio_activo_cmb"] = "";
    $viewData["idproveedor"] = "";
    $viewData["proveedor_cmb"] = "";
    $viewData["id_marca"] = "";
    $viewData["marca_cmb"] = "";
    $viewData["ctgcod"] = "";
    $viewData["categoria_cmb"] = "";
    $viewData["urlprd"] = "";
    $viewData["urlthbprd"] = "";
    $viewData["estprd_ACT"] = "selected";
    $viewData["estprd_INA"] = "";
    $viewData["estprd_PLN"] = "";
    $viewData["estprd_RET"] = "";
    $viewData["estprd_DSC"] = "";

    $viewData["readonly"] = "";
    $viewData["deletemsg"] = "";

    $modedsc = array(
      "INS"=>"Nuevo producto",
      "UPD"=>"Actualizar producto %s",
      "DEL"=>"Eliminar producto %s",
      "DSP"=>"Detalle de producto %s"
    );
    if (isset($_GET["mode"])) {
        $viewData["mode"] = $_GET["mode"];
        $viewData["codprd"] = intval($_GET["codprd"]);
        if (!isset($modedsc[$viewData["mode"]])) {
            redirectWithMessage("No se puede realizar esta operación", "index.php?page=productos");
            die();
        }
    }

    if (isset($_POST["btnsubmit"])) {
        mergeFullArrayTo($_POST, $viewData);
        //Verificacion de XSS_Token
        if (!(isset($_SESSION["cln_csstoken"]) && $_SESSION["cln_csstoken"] == $viewData["xsstoken"])) {
            redirectWithMessage("No se puede realizar esta operación", "index.php?page=productos");
            die();
        }

        // Validaciones de Entrada de Datos
        

        switch ($viewData["mode"]){
        case "INS":
            $result = addNewProducto(
                $viewData["dscprd"],
                $viewData["sdscprd"],
                $viewData["ldscprd"],
                $viewData["skuprd"],
                $viewData["bcdprd"],
                intval($viewData["stkprd"]),
                $viewData["typprd"],
                floatval( $viewData["prcprd"]),
                $viewData["idprincipio_activo"],
                $viewData["idproveedor"],
                $viewData["id_marca"],
                $viewData["ctgcod"],
                $viewData["urlprd"],
                $viewData["urlthbprd"],
                $viewData["estprd"]
    
            );
        
            if ($result > 0) {
                redirectWithMessage("Guardado Exitosamente", "index.php?page=productos");
                die();
            }
            break;
        case "UPD":
            $result = updateProducto(
                $viewData["dscprd"],
                $viewData["sdscprd"],
                $viewData["ldscprd"],
                $viewData["skuprd"],
                $viewData["bcdprd"],
                $viewData["stkprd"],
                $viewData["typprd"],
                $viewData["prcprd"],
                $viewData["idprincipio_activo"],
                $viewData["idproveedor"],
                $viewData["id_marca"],
                $viewData["ctgcod"],
                $viewData["urlprd"],
                $viewData["urlthbprd"],
                $viewData["estprd"],
                $viewData["codprd"]
            );
            if ($result >= 0) {
                redirectWithMessage("Actualizado Exitosamente", "index.php?page=productos");
                die();
            }
            break;
        case "DEL":
            $result = deleteProducto($viewData["codprd"]);
            if ($result > 0) {
                redirectWithMessage("Eliminado Exitosamente", "index.php?page=productos");
                die();
            }
            break;
        }
    }
    if ($viewData["mode"] === "INS") {
        $viewData["modedsc"] = $modedsc[$viewData["mode"]];
    } else {
        $ProductoDBData = getProductosById($viewData["codprd"]);
        mergeFullArrayTo($ProductoDBData, $viewData);

        $viewData["modedsc"] = sprintf($modedsc[$viewData["mode"]], $viewData["dscprd"]);
        $viewData["typprd_RTL"] = ($viewData["typprd"] == "RTL") ? "selected" : "";
        $viewData["typprd_SRV"] = ($viewData["typprd"] == "SRV") ? "selected" : "";
        $viewData["typprd_ISK"] = ($viewData["typprd"] == "ISK") ? "selected" : "";

        $viewData["estprd_ACT"] = ($viewData["estprd"] == "ACT") ? "selected" : "";
        $viewData["estprd_INA"] = ($viewData["estprd"] == "INA") ? "selected" : ""; 
        $viewData["estprd_PLN"] = ($viewData["estprd"] == "PLN") ? "selected" : ""; 
        $viewData["estprd_RET"] = ($viewData["estprd"] == "RET") ? "selected" : ""; 
        $viewData["estprd_DSC"] = ($viewData["estprd"] == "DSC") ? "selected" : ""; 
        // Sacar la data de la DB
        if ($viewData["mode"] != 'UPD') {
            $viewData["readonly"] = "readonly";
        }

        if ($viewData["mode"] == 'DEL') {
            $viewData["deletemsg"] = "Esta Seguro de Eliminar este registro, es una operación definitiva.";
        }
    }
    //principio_activo ALTER TABLE `productos` CHANGE `principio_activo` `idprincipio_activo` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL; 
    //proveedor    ALTER TABLE `productos` CHANGE `proveedor` `idproveedor` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL; 
    //marca         ALTER TABLE `productos` CHANGE `marca` `id_marca` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL; 
    //categoria    ALTER TABLE `productos` CHANGE `categoria` `ctgcod` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL; 

    $viewData["principio_activo_cmb"] = addSelectedCmbArray(getprincipiosActivos(), "idprincipio_activo", $viewData["idprincipio_activo"]);
    $viewData["proveedor_cmb"] = addSelectedCmbArray(getproveedoresActivos(), "idproveedor", $viewData["idproveedor"]);
    $viewData["marca_cmb"] = addSelectedCmbArray(getmarcasActivas(), "id_marca", $viewData["id_marca"]);
    $viewData["categoria_cmb"] = addSelectedCmbArray(getcategoriasActivas(), "ctgcod", $viewData["ctgcod"]);
    // Crear un token unico
    // Guardar en sesión ese token unico para su verificación posterior
    $viewData["xsstoken"] = uniqid("cln", true);
    $_SESSION["cln_csstoken"] = $viewData["xsstoken"];
    renderizar("mantenimientos/producto", $viewData);
}

run();
?>

