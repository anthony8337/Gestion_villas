<nav>
    <form action="#" method="post" autocomplete="off">
<div id="cuadro" class="mod">
    <div class="mod_contenido">
    <span onclick="cerrarcuadro()" class="cerrar">&times;</span>

    <h1 class="centro">Ingreso de nuevo cliente a comprar</h1>

    <fieldset class="cuerpo_registrar">
        <table class="fondo_emergente">
        <tr>

        <td>    
            <label>Nombre y apellido</label>
            <br>
            <input type="text" id="txt_nombre" name="txt_nombre">
        </td>

        <td>    
            <label>RTN</label>
            <br>
            <input type="text" id="txt_rid" name="txt_rid">
        </td>

        <td>
        <label>Numero telefónico</label>
        <br>
        <input type="text" id="txt_telefono" name="txt_telefono"  oninput="actualizarLabel(this.value)">
        </td>
    </tr>

        <tr>
            <td>    
            <label>Cantidad de personas</label>
            <br>
            <input type="text" id="txt_cantidad" name="txt_cantidad">
        </td>

        <td>
        <label>Fecha de ingreso </label>
        <br>
    <input type="date" id="dt_facha" name="dt_facha">
        </td>
        
        </tr>
    </table>

</fieldset>

<fieldset class="cuerpo_registrar">

    <table class="fondo_emergente">
        <tr>
            <td>
                <!--inicio celda-->
                <label>Codigo de villa</label>
    <br>
    <select type="text" id="cbx_villa" name="cbx_villa">
        <?php
        $i = 0;

        while($i <= 100)
        {
            echo "<option value='villa",$i,"'>villa #",$i," (Disponible)</option>";
            $i++;
        }
        ?>
        
    </select>
                <!--final celda-->
            </td>
            <!--siguiente celda-->
            <td>
                <!--inicio celda-->

                <label>Descripcion de la villa</label>
                <br>
                <textarea id="txt_descripcion_v" name="txt_descripcion_v"></textarea>

                <!--final celda-->
            </td>
            <!--siguiente celda-->
            <td>
                <!--inicio celda-->

                <div><label>Costo de la villa</label>
                <br>
                <label class="precio_ver">$50.00</label>
                <!--final celda-->
            </td>
            <!--siguiente celda-->
        </tr>
        <!--siguiente fila-->
        <tr>
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
                <!--final celda-->
            </td>
            <!--siguiente celda-->
            <td>
                <!--inicio celda-->
                <label>Forma de pago</label>
    <br>
        <form>
        <label><input type="radio" name="opcion" id="rb_unico">Pago unico</label>
        <label><input type="radio" name="opcion" id="rb_cuota">Pago por cuota</label>
        </form>
                <!--final celda-->
            </td>
            <!--siguiente celda-->
            <td>
                <!--inicio celda-->
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
                <!--final celda-->
            </td>
            <!--siguiente celda-->
            <tr>
            <td>
                <!--inicio celda-->
                <!--final celda-->
            </td>
            <!--siguiente celda-->
            <td>
                <!--inicio celda-->
                <!--final celda-->
            </td>
            <!--siguiente celda-->
            <td>
                <!--inicio celda-->

                <!--final celda-->
            </td>
            </tr>
        </tr>
        <!--siguiente fila-->
    </table>
</fieldset>


        <div class="total_pago">

        <label>Cantidad a pagar por mes</label>
                <br>
            <label class="precio_ver" id="cuenta"><?php $i = 50; echo"$",number_format($i / 12,2),"";?></label>
        </div>

            <button class="registrar" type="button" onclick="">Registar e imprimir factura</button>


</form>
</nav>