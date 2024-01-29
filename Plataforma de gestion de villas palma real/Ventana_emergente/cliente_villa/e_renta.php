<nav>
    <form action="#" method="post" autocomplete="off">
<div id="renta" class="mod">
<div class="mod_venta">
<span onclick="cerrarcuadro_renta()" class="cerrar">&times;</span>

<fieldset class="cuerpo_registrar">
<legend>Datos para completar la renta de la villa</legend>

<table class="fondo_emergente">


<tr>
<td>
<label>Buscar villa</label>
    <br>
    <input type="text" style="width: 180px;">
</td>
<td>
<label>Codigo de villa</label>
    <br>
    <label class="precio_ver">A-0</label>
</td>
<td>
<label>Forma de pago</label>
    <br>
        <form>
        <label><input type="radio" name="opcion" id="rb_unico">Pago unico</label>
        <label><input type="radio" name="opcion" id="rb_cuota">Pago por cuota</label>
        </form>
</td>
</tr>

<tr>
<td rowspan="3">
<div class="ver_villas">
        <table class="b_t_villa" style="text-align: center;">

        <?php
        $i = 0;

        while($i <= 100)
        {
            echo"
            <tr>
            <td> A-",$i,"</td>
            </tr>
            ";
            $i++;
        }
        ?>
        </table>
    </div>
</td>
            <td>
                <!--inicio celda-->

                <label>Descripcion de la villa</label>
                <br>
                <textarea id="txt_descripcion_v" name="txt_descripcion_v" style="height: 60px;"></textarea>
                <!--final celda-->
            </td>
            <!--siguiente celda-->
            <td>
                <!--inicio celda-->

                <label>Metodo de pago</label>
    <br>
    <select  id="cbx_mt_pago" name="cbx_mt_pago">
        <?php
        $i = 0;

        while($i <= 5)
        {
            echo "<option value='pago",$i,"'>pago ",$i,"</option>";
            $i++;
        }
        ?>
        
    </select>
    </td>
</tr>

        <!--siguiente fila-->
        <tr>
        <td>
            <label>Costo de la villa</label>
                <br>
                <label class="precio_ver">$50.00</label>
        </td>

        <td>
        <label>Periodo de cuota</label>
    <br>
    <select  id="cbx_mt_pago" name="cbx_mt_pago">
        <?php
        $i = 1;

        while($i <= 5)
        {
            echo "<option value='periodo",$i,"'>",$i," año(s)</option>";
            $i++;
        }
        ?>
        
    </select>
        </td>
    </tr>

    <tr>
<td>
    <label>Aplica un descuento de:</label>
    <br>
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
</td>
        
<td>
    
<label>Total a pagar</label>
    <br>
    <label class="precio_ver"><?php $i = 50; echo $i/12;?></label>
</td>
    </tr>
</table>
</fieldset>

<button class="registrar" type="button" onclick="">Confirmar renta</button>
</div>
</div>
</form>
</nav>