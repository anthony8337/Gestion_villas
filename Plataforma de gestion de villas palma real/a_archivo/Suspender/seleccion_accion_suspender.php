


<form action="#" method="post" autocomplete="off">
    <div id="seleccionar_suspender" class="mod">
    <fieldset class="mod_contenido_editar">
    <span onclick="cerrar_suspender_seleccion()" class="cerrar">&times;</span>
    <legend class="titulo">Seleccionar opcion</legend>

    <br>
<!-- Botones para insertar los datos -->

            <div id="div_insertar">
            <fieldset style="float: inline-start; text-align: center; float: left; margin-right: 60px;" class="f_boton" onclick="cerrar_suspender_seleccion()">
            <img class="im_ico" src="imagenes/cliente.png" width="50px" height="50px">
            <br>
            <label>Insertar Cliente</label>
            </fieldset>
            </td>

            <td>
            <fieldset style="float: inline-end; text-align: center; float: left;" class="f_boton" onclick="cerrar_suspender_seleccion()">
            <img class="im_ico" src="imagenes/casa.png" width="50px" height="50px">
            <br>
            <label>Insertar Villa</label>
            </fieldset>
            </td>
            </div>

<!-- Botones para modificar los datos -->
            
            <div id="div_modificar">
            <fieldset style="float: inline-start; text-align: center; float: left; margin-right: 60px;" class="f_boton" onclick="sele_mod_cliente()">
            <img class="im_ico" src="imagenes/cliente.png" width="50px" height="50px">
            <br>
            <label>Modificar Cliente</label>
            </fieldset>
            </td>

            <td>
            <fieldset style="float: inline-end; text-align: center; float: left;" class="f_boton" onclick="">
            <img class="im_ico" src="imagenes/casa.png" width="50px" height="50px">
            <br>
            <label>Modificar Villa</label>
            </fieldset>
            </td>
            </div>

<!-- Botones para borrar los datos -->
            
<div id="div_suspender">
            <fieldset style="float: inline-start; text-align: center; float: left; margin-right: 60px;" class="f_boton" onclick="selec_cliente_editar(),cerrar_decision_insertar()">
            <img class="im_ico" src="imagenes/cliente.png" width="50px" height="50px">
            <br>
            <label>Suspender Cliente</label>
            </fieldset>
            </td>

            <td>
            <fieldset style="float: inline-end; text-align: center; float: left;" class="f_boton" onclick="edicion_selec_villa(),cerrar_decision_insertar()">
            <img class="im_ico" src="imagenes/casa.png" width="50px" height="50px">
            <br>
            <label>Suspender Villa</label>
            </fieldset>
            </td>
            </div>

</div>
</fieldset>
</form>
