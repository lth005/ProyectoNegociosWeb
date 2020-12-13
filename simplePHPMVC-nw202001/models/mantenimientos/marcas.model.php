
<?php 
require_once "libs/dao.php";

function getAllMarcas(){
    $sqlstr = "SELECT * from marcas;";
    $resultSet = array();
    $resultSet = obtenerRegistros($sqlstr);
    return $resultSet;
}

function getMarcasById($id_marca) {
    $sqlstr = "SELECT * from marcas where id_marca= %d;";
    return obtenerUnRegistro(sprintf($sqlstr, $id_marca));
}

function getMarcasPorFiltro($filtro) {
    $ffiltro = $filtro.'%';
    $sqlstr = "SELECT * from marcas where  id_marca like '%s' or nombre_marca like '%s';";
    return obtenerRegistros(sprintf($sqlstr, $ffiltro, $ffiltro));
}

function addNewMarca($nombre_marca,$estado){
    $insSql = "INSERT INTO `marcas` (`nombre_marca`,`estado`)
VALUES ( '%s', '%s');";

    return ejecutarNonQuery(
        sprintf(
            $insSql,
            $nombre_marca,
            $estado
        )
    );
}

function updateMarca($nombre_marca,$estado,$id_marca) {
    $updsql = "UPDATE `marcas` SET  `nombre_marca` = '%s', `estado` = '%s'
    WHERE `id_marca` = %d; ";

    return ejecutarNonQuery(
        sprintf(
            $updsql,
            $nombre_marca,
            $estado,
            $id_marca
        )
    );
}

function deleteMarca($id_marca) {
    return ejecutarNonQuery(sprintf("DELETE from marcas where id_marca=%d;", $id_marca));
}

function getmarcasActivas()
{
    $sqlstr = "SELECT * from marcas where estado = 'ACT';";
    return obtenerRegistros($sqlstr);
}

?>