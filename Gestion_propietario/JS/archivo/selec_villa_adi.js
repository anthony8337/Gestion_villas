document.addEventListener('DOMContentLoaded', () => {
    const originalTable = document.getElementById('tabla_villa_pro_adicionar').getElementsByTagName('tbody')[0];
    const destinationTable = document.getElementById('tabla_villa_adi').getElementsByTagName('tbody')[0];

    originalTable.addEventListener('click', (e) => {
        let target = e.target;
        while (target && target.nodeName !== 'TR') {
            target = target.parentElement;
        }
        if (target && target.nodeName === 'TR') {
            const newRow = target.cloneNode(true);

            // Añadir celda con botón de eliminación
            const deleteCell = newRow.insertCell(-1);
            deleteCell.innerHTML = '<button class="accion_tel" title="Eliminar fila"><img src="Imagenes/trash3-fill.svg"></button>';

            // Añadir event listener al botón de eliminación
            deleteCell.querySelector('button').addEventListener('click', (event) => {
                event.stopPropagation(); // Evitar que el evento se propague y dispare otros listeners
                newRow.remove(); // Eliminar la fila
            });

            destinationTable.appendChild(newRow);
            cerrar_pro_adicionar_tabla();
        }
    });
    
});