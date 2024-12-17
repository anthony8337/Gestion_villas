
  function selec_pro_cuenta(){
    var tabla = document.getElementById("tabla_pro_gc");
    var filas = tabla.getElementsByTagName("tr");
  
    for (var i = 1; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");

        var id = celdas[0].innerText;
        var nombre = celdas[1].innerText;
        var villa = celdas[2].innerText;
        var telefono = celdas[4].innerText;

        document.getElementById('id_propi_gc').value = id;
        document.getElementById('txt_villa_gc').value = nombre;
        document.getElementById('txt_propietario_gc').value = villa;
        document.getElementById('telefono_gc_mt').value = telefono;
        
        actualizar_concepto_abono();
        cerrar_sele_pro_gp();
      });
    }
}

function selec_pro_estado_cuenta(){

  var tabla = document.getElementById("tabla_propi_estado_cuenta");
  var filas = tabla.getElementsByTagName("tr");

  for (var i = 1; i < filas.length; i++) {
    var fila = filas[i];
    fila.addEventListener("click", function() {
      var celdas = this.getElementsByTagName("td");

      var id = celdas[0].innerText;
      var nombre = celdas[1].innerText;
      var villa = celdas[2].innerText;
      var correo = celdas[5].innerText;

      document.getElementById('id_pro_sc').value = id;
      document.getElementById('txt_propi_estados').value = nombre;
      document.getElementById('txt_cod_estados').value = villa; 
      document.getElementById('txt_correo_estados').value = correo;      

      cerrar_selec_pro_estado();
      seleccionar_conceptos_cuenta();
      
    });
  }
}
//////////////////////////
function actualizar_automatico_js()
{
  $.ajax({
    type: 'GET',
    url: "PHP/ventana_principal/principales/interno/sql/accion_automatico/inicio_automatico.php",
    data: $(this).serialize(),
    success: function(response){
        $('#tbody_concep_cargo').html(response);
    }
}); 
}

///////////////////


function selec_concep_cuenta() {
  const originalTable = document.getElementById('tabla_concepto_cargo_selec').getElementsByTagName('tbody')[0];
  const destinationTable = document.getElementById('tabla_concepto_cargo_1').getElementsByTagName('tbody')[0];

  originalTable.addEventListener('click', (e) => {
      let target = e.target;
      while (target && target.nodeName !== 'TR') {
          target = target.parentElement;
      }
      if (target && target.nodeName === 'TR') {
          const newRow = target.cloneNode(true);

          const deleteCell = newRow.insertCell(-1);
          deleteCell.innerHTML = '<button class="accion_tel" title="Eliminar fila"><img src="Imagenes/trash3-fill.svg"></button>';

          deleteCell.querySelector('button').addEventListener('click', (event) => {
              event.stopPropagation();

              target.remove();
              newRow.deleteCell(-1);
              originalTable.appendChild(newRow);
          });

          destinationTable.appendChild(newRow);
          target.remove(); 
          conocepto_cargo_cerrar();


      }
  });

  destinationTable.addEventListener('click', (e) => {
      if (e.target && e.target.matches('button.accion_tel img')) {
          let target = e.target;
          while (target && target.nodeName !== 'TR') {
              target = target.parentElement;
          }
          if (target && target.nodeName === 'TR') {
              const newRow = target.cloneNode(true);
              newRow.deleteCell(-1); 
              originalTable.appendChild(newRow);
              target.remove();
              

              

          }
      }
  });


  
}

//////////////////
function actualizar_tabla_de_auto()
{

  var id_unir = document.getElementById('nn_id').value;

  $.ajax({
    type: 'POST',
    url: "PHP/celda/emergentes/sql/tabla_cuentas_auto.php",
    data:{ id_unir:id_unir,

    },
    success: function(response){
        $('#tabla_concep_auto').html(response);
    }
}); 
}