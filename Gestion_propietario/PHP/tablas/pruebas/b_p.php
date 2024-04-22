<?php

$filtro_vi = $_POST['filtro_vi'];

switch ($filtro_vi) {
    case 'filtro_vi1':
        echo "Has seleccionado la opción 1";
        break;
    case 'filtro_vi2':
        echo "Has seleccionado la opción 2";
        break;
    case 'filtro_vi3':
        echo "Has seleccionado la opción 3";
        break;
    default:
        echo "Selecciona una opción válida";
        break;
}


?>