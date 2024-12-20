document.addEventListener('DOMContentLoaded', () => {
    const originalTable = document.getElementById('tabla_donante_villa').getElementsByTagName('tbody')[0];
    const destinationTable = document.getElementById('tabla_destino_villa').getElementsByTagName('tbody')[0];

    function addRowClickListener(table, destination) {
        table.addEventListener('click', (e) => {
            let target = e.target;
            while (target && target.nodeName !== 'TR') {
                target = target.parentElement;
            }
            if (target && target.nodeName === 'TR') {
                const newRow = target.cloneNode(true);

                destination.appendChild(newRow);
                target.remove();
            }
        });
    }

    addRowClickListener(originalTable, destinationTable);
    addRowClickListener(destinationTable, originalTable);
});

function limpiar_tabla_donante() {
    var tbody = document.querySelector("#tabla_donante_villa tbody.borrar_t");
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }
  }

  function limpiar_tabla_destino() {
    var tbody = document.querySelector("#tabla_destino_villa tbody.borrar_t");
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }
  }

  function limpiar_tabla_automatico() {
    var tbody = document.querySelector("#tabla_concepto_cargo_1 tbody.borrar_t");
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }
  }

  function limpiar_tabla_autorizados() {
    var tbody = document.querySelector("#tbody_agregar_perso_adi tbody.borrar_t");
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }
  }

  function lim_tabla_donantes()
  {
    limpiar_tabla_donante();
    limpiar_tabla_destino();
  }