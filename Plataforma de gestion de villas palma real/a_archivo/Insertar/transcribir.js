//entrada de medidas del lote
var texto = document.getElementById('medidas_lote');
var numero;

////Metros del lote
    var l_mt = document.getElementById('metros_lote');
    texto.addEventListener('input', function() {
        numero = parseFloat(texto.value);
        l_mt.textContent = numero.toFixed(2) * 1;
      });

////varas del lote
    var l_vr = document.getElementById('varas_lote');
    texto.addEventListener('input', function() {
        numero = parseFloat(texto.value);
        l_vr.textContent = (numero.toFixed(2) / 0.6987).toFixed(2);
      });

////Pies del lote
    var l_ft = document.getElementById('pies_lote');
    texto.addEventListener('input', function() {
        numero = parseFloat(texto.value);
        l_ft.textContent = (numero.toFixed(2)* 10.764).toFixed(2);
      });
///////////////////////////////////////////////////////////////////////////////////

var texto_construccion = document.getElementById('medidas_construccion');
var nume;
////Metros de construccion
var c_mt = document.getElementById('metros_construccion');
texto_construccion.addEventListener('input', function() {
    nume = parseFloat(texto_construccion.value);
    c_mt.textContent = nume.toFixed(2) * 1;
  });

////varas de construccion
var c_vr = document.getElementById('varas_construccion');
texto_construccion.addEventListener('input', function() {
    nume = parseFloat(texto_construccion.value);
    c_vr.textContent = (nume.toFixed(2) / 0.6987).toFixed(2);
  });

////Pies de construccion
var c_ft = document.getElementById('pies_construccion');
texto_construccion.addEventListener('input', function() {
    nume = parseFloat(texto_construccion.value);
    c_ft.textContent = (nume.toFixed(2)* 10.764).toFixed(2);
  });


  ///limpieza de direccion

document.getElementById('atxt_direccion').textContent ="";