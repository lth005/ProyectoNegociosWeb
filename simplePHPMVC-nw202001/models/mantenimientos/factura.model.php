<?php 
require_once "libs/dao.php";

function getAllFacturas(){
    $sqlstr = "select a.fctcod, c.username, a.fctEst, a.fctfch, a.fctMonto, a.fctIva, a.fctShip, a.fctTotal, b.fctfrmpago 
    from factura a inner join factura_forma_pago b on a.fctcod = b.fctcod inner join usuario c on a.userCode = c.usercod";
    $resultSet = array();
    $resultSet = obtenerRegistros($sqlstr);
    return $resultSet;
}


function getLastFactura() {
    $sqlstr = "select a.fctcod, c.username, a.fctEst, a.fctfch, a.fctMonto, a.fctIva, a.fctShip, a.fctTotal, b.fctfrmpago 
    from factura a inner join factura_forma_pago b on a.fctcod = b.fctcod inner join usuario c on a.userCode = c.usercod
    ORDER BY a.fctcod DESC LIMIT 1;";
    return obtenerRegistros(sprintf($sqlstr));
}

function getFacturaDetalle($factura) {
    $sqlstr = "SELECT * FROM gemfarma.factura_detalle WHERE fctcod='%s';";
    return obtenerRegistros(sprintf($sqlstr,$factura));
}
?>