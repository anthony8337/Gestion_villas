<nav>
<form action="#" method="post" autocomplete="off">
<div id="renta" class="mod">
<div class="ejecutar_renta">
<span onclick="cerrar_renta()" class="cerrar">&times;</span>

<fieldset style=" width:95.5%; height: 500px; overflow: auto; padding-bottom: 5px;">
<legend class="titulo">Datos al solicitar renta</legend>

<div style="width: 65%; margin-right: 40px;" class="ajuste_cuado">
<table class="fondo_emergente">
    <tr>
        <td>
            <fieldset style="width: 120px;">
            <legend>Codigo de villa</legend>
            <input id="b_villa" type="text" style="width: 100px;">
            </fieldset>
        </td>

        <td>
        <fieldset>
                <legend>Precio de renta</legend>
                <label class="precio_ver">$100.00</label>
            </fieldset>
        </td>
    </tr>

    <tr>
    <td style="width: 50%;">
    <fieldset style="height: 330px;">
        <legend>Villas disponibles</legend>
        <div class="ver_villas">

        <table class="tabla_principal" style="text-align: center;" id="t_villa">

        <?php
        $i = 0;
        while($i <= 100)
        {
            echo"
            <tr class='contenido'>
            <td style='width: 15%; border: 1px solid chocolate;'> A-",$i,"</td>
            <td style='border: 1px solid chocolate;'>",$i," descripciones</td>
            <td style='border: 1px solid chocolate;'>bloquedo</td>
            </tr>
            ";
            $i++;
        }
        ?>
        </table>
        </div>
    </fieldset>
    </td>
    <td style="width: 50%;">
    <fieldset style="height: 330px;">
        <legend>Descripcion completa de la villa</legend>
        <textarea disabled id="txt_descripcion_v" name="txt_descripcion_v" style="width: 93%; height: 90%;"></textarea>
    </fieldset>
    </td>
    </tr>
</table>
</div>

<div style="width:30%;" class="ajuste_cuado">
<table class="fondo_emergente">
    <tr>
        <td>
            <fieldset>
                <legend>Forma de pago</legend>
                <label><input type="radio" name="opcion" id="rb_unico">Pago unico</label>
                <label><input type="radio" name="opcion" id="rb_cuota">Pago por cuota</label>
            </fieldset>
        </td>
    </tr>

    <tr>
        <td>
            <fieldset>
                <legend>Metodo de pago</legend>
                <select  id="cbx_mt_pago" name="cbx_mt_pago">
        <?php
        $a = ["Efectivo","Cheque","Tarjeta de credito","Tarjeta de debito"];
        $i = 0;

        while($i < count($a))
        {
            echo "<option value='periodo",$i,"'>",$a[$i],"</option>";
            $i++;
        }
        ?>
        </select>
            </fieldset>
        </td>
    </tr>

    <tr>
        <td>
            <fieldset>
                <legend>Periodo de cuota</legend>
                
                <input type="text" style=" width: 50px;">
                <select  id="cbx_mt_pago" name="cbx_mt_pago" style="width: 160px;">
        <?php
        $a = ["Dia(s)","Semana(s)","Meses(s)"];
        $i = 0;

        while($i < count($a))
        {
            echo "<option value='periodo",$i,"'>",$a[$i],"</option>";
            $i++;
        }
        ?>
        
    </select>
            </fieldset>
        </td>
    </tr>

    <tr>
        <td>
            <fieldset>
                <legend>Aplica un descuento de:</legend>
                <select  id="cbx_mt_pago" name="cbx_mt_pago">
        <?php
        $i = 0;

        while($i <= 5)
        {
            echo "<option value='periodo",$i,"'>",$i*10,"%</option>";
            $i++;
        }
        ?>
        
    </select>
            </fieldset>
        </td>
    </tr>

    <tr>
        <td>
            <fieldset>
                <legend>Total a pagar</legend>
                <label class="precio_ver"><?php $i = 50; echo "$ ",round($i/12,2);?></label>
            </fieldset>
        </td>
    </tr>
</table>
</div>


</fieldset>
<table class="fondo_emergente">
    <tr>
        <td style="text-align: center;">
        <button class="registrar" type="button" onclick="">Confirmar renta</button>
        </td>
    </tr>
</table>


</div>
</div>
</form>
</nav>

<script src="a_archivo/buscar_villa.js"></script>