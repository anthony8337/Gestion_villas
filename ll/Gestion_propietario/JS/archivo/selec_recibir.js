
function pro_recibir() {

    var tabla = document.getElementById("tabla_pro_recibir");
    var filas = tabla.getElementsByTagName("tr");
  
    for (var i = 1; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");

        
        var nombre = celdas[1].innerText;
        var telefono = celdas[4].innerText;
        var rtn = celdas[2].innerText;
        var correo = celdas[3].innerText;
        var id = celdas[0].innerText;
        
        document.getElementById("txtnombre_rec").value = nombre;
        document.getElementById("txtrtn_rec").value = rtn;
        document.getElementById("txtcorreo_rec").value = correo;
        document.getElementById("txttelefono_rec").value = telefono;
        document.getElementById("id_rec_pro").value = id;

        cerrar_pro_recibir()

      });
    }
  }