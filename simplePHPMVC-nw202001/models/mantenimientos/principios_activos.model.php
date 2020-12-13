<?php 
require_once "libs/dao.php";

function getAllPrincipios_activos(){
    $sqlstr = "SELECT * from principio_activo;";
    $resultSet = array();
    $resultSet = obtenerRegistros($sqlstr);
    return $resultSet;
}
function getprincipiosActivos()
{
    $sqlstr = "SELECT * from principio_activo where estado = 'ACT';";
    return obtenerRegistros($sqlstr);
}

function getPrincipio_activoById($id_Principio_activo) {
    $sqlstr = "SELECT * from principio_activo where idprincipio_activo= %d;";
    return obtenerUnRegistro(sprintf($sqlstr, $id_Principio_activo));
}

function getPrincipios_activosPorFiltro($filtro) {
    $ffiltro = $filtro.'%';
    $sqlstr = "SELECT * from principio_activo where  idprincipio_activo like '%s' or nombre_principio_activo like '%s';";
    return obtenerRegistros(sprintf($sqlstr, $ffiltro, $ffiltro));
}

function addNewPrincipio_activo($nombre_principio_activo,$estado){
    $insSql = "INSERT INTO `principio_activo` (`nombre_principio_activo`,`estado`)
VALUES ( '%s', '%s');";

    return ejecutarNonQuery(
        sprintf(
            $insSql,
            $nombre_principio_activo,
            $estado
        )
    );
}

function updatePrincipio_activo($nombre_principio_activo,$estado,$idprincipio_activo) {
    $updsql = "UPDATE `principio_activo` SET  `nombre_principio_activo` = '%s', `estado` = '%s'
    WHERE `idprincipio_activo` = %d; ";

    return ejecutarNonQuery(
        sprintf(
            $updsql,
            $nombre_principio_activo,
            $estado,
            $idprincipio_activo
        )
    );
}

function deletePrincipio_activo($idprincipio_activo) {
    return ejecutarNonQuery(sprintf("DELETE from principio_activo where idprincipio_activo=%d;", $idprincipio_activo));
}


?>