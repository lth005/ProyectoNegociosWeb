
<?php 
require_once "libs/dao.php";

function getAllProveedores(){
    $sqlstr = "SELECT * from proveedores;";
    $resultSet = array();
    $resultSet = obtenerRegistros($sqlstr);
    return $resultSet;
}
function getproveedoresActivos()
{
    $sqlstr = "SELECT * from proveedores where estado = 'ACT';";
    return obtenerRegistros($sqlstr);
}

function getProveedoresById($idproveedor) {
    $sqlstr = "SELECT * from proveedores where idproveedor= %d;";
    return obtenerUnRegistro(sprintf($sqlstr, $idproveedor));
}

function getProveedoresPorFiltro($filtro) {
    $ffiltro = $filtro.'%';
    $sqlstr = "SELECT * from proveedores where  idproveedor like '%s' or nombre_proveedor like '%s';";
    return obtenerRegistros(sprintf($sqlstr, $ffiltro, $ffiltro));
}

function addNewProveedor($nombre_proveedor, $telefono_proveedor, $direccion_proveedor,$estado){
    $insSql = "INSERT INTO `proveedores` (`nombre_proveedor`, `telefono_proveedor`, `direccion_proveedor`, `estado`)
VALUES ( '%s', '%s', '%s', '%s');";

    return ejecutarNonQuery(
        sprintf(
            $insSql,
            $nombre_proveedor,
            $telefono_proveedor,
            $direccion_proveedor,
            $estado
        )
    );
}

function updateProveedor($nombre_proveedor, $telefono_proveedor, $direccion_proveedor,$estado,$idproveedor) {
    $updsql = "UPDATE `proveedores` SET  `nombre_proveedor` = '%s', `telefono_proveedor` = '%s',
    `direccion_proveedor` = '%s', `estado` = '%s'
    WHERE `idproveedor` = %d; ";

    return ejecutarNonQuery(
        sprintf(
            $updsql,
            $nombre_proveedor,
            $telefono_proveedor,
            $direccion_proveedor,
            $estado,
            $idproveedor
        )
    );
}

function deleteProveedor($idproveedor) {
    return ejecutarNonQuery(sprintf("DELETE from proveedores where idproveedor=%d;", $idproveedor));
}


?>