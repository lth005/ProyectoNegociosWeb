<?php 
require_once "libs/dao.php";

function getAllHistoricos(){
    $sqlstr = "select a.fctcod, c.username, a.fctEst, a.fctfch, a.fctMonto, a.fctIva, a.fctShip, a.fctTotal, b.fctfrmpago 
    from factura a inner join factura_forma_pago b on a.fctcod = b.fctcod inner join usuario c on a.userCode = c.usercod";
    $resultSet = array();
    $resultSet = obtenerRegistros($sqlstr);
    return $resultSet;
}


function gethistoricosByfiltro($filtro) {
    $ffiltro = $filtro.'%';
    $sqlstr = "SELECT factura.fctcod, usuario.username, factura.fctEst, factura.fctfch, factura.fctMonto, factura.fctIva, factura.fctShip, factura.fctTotal, factura_forma_pago.fctfrmpago 
    from factura inner join factura_forma_pago on factura.fctcod = factura_forma_pago.fctcod inner join usuario on factura.userCode = usuario.usercod
    where  factura.fctcod like '%s' or usuario.username like '%s'  ;";
    return obtenerRegistros(sprintf($sqlstr, $ffiltro,$ffiltro));
}


?>