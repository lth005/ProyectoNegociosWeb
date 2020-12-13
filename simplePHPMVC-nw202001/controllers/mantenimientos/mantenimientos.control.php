<?php
/**
 * PHP Version 7
 * Controlador de Mantenimientos_Menu
 *
 * @category Controllers_Mantenimientos_Menu
 * @package  Controllers\Mantenimientos_Menu
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  Comercial http://
 *
 * @version CVS:1.0.0
 *
 * @link http://url.com
 */
 // Sección de requires

/**
 * Corre el Controlador
 *
 * @return void
 */
function run()
{
    $arrDataView = array();
    $arrMantenimientos = array();
    //Para Obtener el usuario logueado
    $usuario = $_SESSION["userCode"];
    if (isAuthorized('categorias', $usuario)) {
        $arrMantenimientos[] = array(
            "page" => "categorias",
            "pageDsc"=>"Categorias",
            "ionicon"=> "ios-cog"
        );
    }
/*    if (isAuthorized('centros_de_costos', $usuario)) {
        $arrMantenimientos[] = array(
            "page" => "centros_de_costos",
            "pageDsc"=>"Centro de Costos",
            "ionicon"=> "cash"
        );
    }*/
    if (isAuthorized('productos', $usuario)) {
        $arrMantenimientos[] = array(
          "page" => "productos",
          "pageDsc" => "Productos",
          "ionicon" => "cube"
        );
    }
    if (isAuthorized('proveedores', $usuario)) {
        $arrMantenimientos[] = array(
          "page" => "proveedores",
          "pageDsc" => "Proveedores",
          "ionicon" => "erlenmeyer-flask"
        );
    }

    if (isAuthorized('marcas', $usuario)) {
        $arrMantenimientos[] = array(
          "page" => "marcas",
          "pageDsc" => "Marcas",
          "ionicon" => "ios-keypad"
        );
    }
    if (isAuthorized('principios_activos', $usuario)) {
        $arrMantenimientos[] = array(
          "page" => "principios_activos",
          "pageDsc" => "Principios Activos de Medicamentos",
          "ionicon" => "android-clipboard"
        );
    }

    $arrDataView["mantenimientos"] = $arrMantenimientos;
    renderizar("mantenimientos/mantenimientos", $arrDataView);
}
// Correr el controlador
run();
?>
