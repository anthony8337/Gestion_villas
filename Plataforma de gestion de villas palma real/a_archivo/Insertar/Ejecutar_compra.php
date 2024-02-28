<nav>
<form action="#" method="post" autocomplete="off">
<div id="venta" class="mod">
<fieldset class="ejecutar_inscripcion">
<legend class="titulo">Datos de la villa del propietario</legend>
<span onclick="cerrar_compra()" class="cerrar">&times;</span>
<br>

<fieldset style="padding: 5px; width: 500px; height: 460px; text-align: center; float: inline-start; border: 0px;">

<fieldset style="width: 200px;">
<legend>Cuota mensual</legend>
<table style="height: 100%;">
    <tr>
        <td style="text-align: center;">
        <input type="number" style="width: 80%;" id="num_cuota">
        </td>
    </tr>
</table>
</fieldset>

<fieldset style="width: 95%; height: 330px;">
<legend>Observacion</legend>
<table style="height: 100%;">
    <tr>
        <td style="text-align: center;">
        <textarea style="resize: none; width: 98%; height: 290px; color: black; padding: 5px;" name="" id="" cols="30" rows="10"></textarea>

        </td>
    </tr>
</table>
</fieldset>

</fieldset>

<fieldset style="padding: 5px; width: 500px; height: 460px; text-align: center; float: inline-end; border: 0px;">

<button type="button" style="height: 60px; float: left; margin-top: 15px;" onclick="Seleccionar_villa_in()">Seleccionar villa</button>

<fieldset style="width: 320px; float: left;">
<legend>Datos de villa</legend>
<table style="height: 100%;">
    <tr>
        <td>Clave:</td>
        <td><label id="lb_clave_villa"></label></td>
    </tr>

    <tr>
        <td>Contador EHH:</td>
        <td><label id="lb_EHH_villa"></label></td>
    </tr>
</table>
</fieldset>



<fieldset style="width:94%; height: 150px;">
    <legend>Detalles de la villa</legend>
    <table>
    <?php
    $i = ["2 habitaciones","2 baño","1 piscina","1 corredor","1 fuente"];
    $a = 0;

    while($a < count($i))
    {
        echo"
        <tr>
        <td  style='text-align: start;'><li>
            ",$i[$a],"
        </li></td>
        </tr>
        ";
        $a++;
    }

    ?>

    </table>

</fieldset>

<fieldset style="width:96%; height: 150px; text-align: center; padding: 5px;">
<legend >Direccion</legend>

<textarea style="resize: none; width: 98%; height: 120px; color: black; padding: 5px;" name="" id="" cols="30" rows="10" disabled></textarea>

</fieldset>

</fieldset>








<table class="fondo_emergente">
    <tr>
        <td style="text-align: center;">
        <button class="con" type="button" style="float: inline-start;" onclick="confirmar()">Confirmar</button>
        <button class="can" type="button" onclick="cerrar_compra(),cerrar_insertar_cliente()">Cancelar</button>
        </td>
    </tr>
</table>


</fieldset>
</div>
</form>
</nav>

<script src="a_archivo/buscar_villa.js"></script>