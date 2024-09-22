function modificar_usuario(){
  var tabla = document.getElementById("cont_usuarios_tabla");
  var filas = tabla.getElementsByTagName("tr");

  for (var i = 0; i < filas.length; i++) {
    var fila = filas[i];
    fila.addEventListener("click", function() {
      var celdas = this.getElementsByTagName("td");
      var id = celdas[0].innerText;
      var usuario = celdas[1].innerText;
      var nombre = celdas[10].innerText;
      var apellido = celdas[11].innerText;
      var dni = celdas[3].innerText;
      var telefono = celdas[4].innerText;
      var correo = celdas[5].innerText;
      var acceso = celdas[6].innerText;
      var clave = celdas[7].innerText;
      var r1  = celdas[12].innerText;
      var r2  = celdas[13].innerText;
      var r3  = celdas[14].innerText;
      
      var estado  = celdas[15].innerText;

      document.getElementById("txt_id").value = id;
      document.getElementById("txt_usuario").value = usuario;
      document.getElementById("txt_nombre").value = nombre;
      document.getElementById("txt_apellido").value = apellido;
      document.getElementById("txt_dni").value = dni;
      document.getElementById("txt_tele").value = telefono;
      document.getElementById("txt_correo").value = correo;
      document.getElementById("txt_clave").value = clave;
      document.getElementById("txt_tipo").value = acceso;

      document.getElementById("txt_estado_usu").value = estado;


      if(r1 == "si")
      {
        document.getElementById('pe_reporte').checked = true;
      }
      else
      {
        document.getElementById('pe_reporte').checked = false;
      }

      if(r2 == "si")
        {
          document.getElementById('pe_registro').checked = true;
        }
        else
        {
          document.getElementById('pe_registro').checked = false;
        }

        if(r3 == "si")
          {
            document.getElementById('pe_eliminar').checked = true;
          }
          else
          {
            document.getElementById('pe_eliminar').checked = false;
          }

          ingresar_usuario_edi();
    });
  }


}

function modificar_grupo(){
  var tabla = document.getElementById("tabla_grupo_villa");
  var filas = tabla.getElementsByTagName("tr");

  for (var i = 0; i < filas.length; i++) {
    var fila = filas[i];
    fila.addEventListener("click", function() {
      var celdas = this.getElementsByTagName("td");
      var id = celdas[0].innerText;
      var usuario = celdas[1].innerText;


      document.getElementById("id_grupo_villa").value = id;
      document.getElementById("txt_grupo_villa").value = usuario;

    });
  }
}

function modificar_modelo(){
  var tabla = document.getElementById("tabla_modelo_villa");
  var filas = tabla.getElementsByTagName("tr");

  for (var i = 0; i < filas.length; i++) {
    var fila = filas[i];
    fila.addEventListener("click", function() {
      var celdas = this.getElementsByTagName("td");
      var id = celdas[0].innerText;
      var usuario = celdas[1].innerText;


      document.getElementById("id_modelo_villa").value = id;
      document.getElementById("txt_modelo_villa").value = usuario;

    });
  }
}