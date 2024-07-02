
function tabla_multi_pro(){

    var tabla = document.getElementById("tabla_pro_multi");
    var filas = tabla.getElementsByTagName("tr");
  
    for (var i = 1; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");

        
        var nombre = celdas[2].innerText;
        var telefono = celdas[4].innerText;
        var villa = celdas[1].innerText;
        var id = celdas[0].innerText;

        document.getElementById('hd_id_propietario').value = id;
        document.getElementById('sp_codigo_multi').textContent = villa;
        document.getElementById('txt_mn').value = nombre;
        document.getElementById('txt_tl').value = telefono;

        cerrar_sele_pro_multi();

      });
    }
  }