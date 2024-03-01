<nav>
<form action="#" method="post" autocomplete="off">
<div id="asig_villa" class="mod">
<fieldset class="ejecutar_inscripcion">
<span onclick="asig_villa_cerrar()" class="cerrar">&times;</span>

<legend class="titulo">Datos de la villa del propietario</legend>

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

<button style="margin-top: 15px;" type="button" onclick="edi_s_villa()">Seleccionar villa</button>

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


<fieldset style="width: 94%; float: left;">
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
        <button class="can" type="button" onclick="cliente_cerrar(),cliente_villa_asig_cerrar()">Cancelar</button>
        </td>
    </tr>
</table>


</fieldset>
</div>
</form>
</nav>

<script src="a_archivo/buscar_villa.js"></script>