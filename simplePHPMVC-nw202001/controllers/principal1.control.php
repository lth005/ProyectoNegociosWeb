<?php
 require_once "models/mantenimientos/productos.model.php";
 function run(){
    $arrDataView = array();
    $arrDataView["productos"] = productoCatalogo2();
    renderizar("principal",$arrDataView);
  }

  run();
?>
       
