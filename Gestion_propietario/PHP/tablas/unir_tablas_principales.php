<div id="ver_cuadros">
<table>



    <tr>
        <td id="lis_pro_cu" onclick="l_pro()">
        <input type="radio" name="v_lista" id="rb_pro" checked>Lista de propietarios
        </td>
        
        <td rowspan="2">
        <input type="text" name="Busca_prin" id="Busca_prin" placeholder="Buscar propietario">
        </td>

        <td rowspan="2"><button type="button">Imprimir</button></td>
    </tr>

    <tr>
        <td id="lis_vi_cu" onclick="l_villa()">
        <input type="radio" name="v_lista" id="rb_villas">Lista de villas
        </td>
    </tr>


</table>
</div>

<?php
include "PHP/tablas/tabla_villas_principal.php";
?>

<?php
include "PHP/tablas/tabla_propi_principal.php";
?>