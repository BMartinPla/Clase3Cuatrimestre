// Configuración original: 6 filas y 7 columnas
const FILAS = 6;
const COLUMNAS = 7;

let matrizTablero = [];
let jugadorActual = 1;
let juegoActivo = true;

const elementoTablero = document.getElementById('tablero');
const elementoMensaje = document.getElementById('mensaje');
const botonReiniciar = document.getElementById('reiniciar');

// Función para inicializar o reiniciar el juego
function iniciarJuego() {
    // Crear matriz vacía (0 = vacío, 1 = J1, 2 = J2)
    matrizTablero = Array(FILAS).fill().map(() => Array(COLUMNAS).fill(0));
    jugadorActual = 1;
    juegoActivo = true;
    actualizarMensajeTurno();
    renderizarTablero();
}

// Dibuja el tablero en el HTML
function renderizarTablero() {
    elementoTablero.innerHTML = ''; // Limpiar tablero
    for (let f = 0; f < FILAS; f++) {
        for (let c = 0; c < COLUMNAS; c++) {
            const celda = document.createElement('div');
            celda.classList.add('celda');
            
            // Asignar color si ya hay una ficha
            if (matrizTablero[f][c] === 1) celda.classList.add('jugador1');
            if (matrizTablero[f][c] === 2) celda.classList.add('jugador2');
            
            // Evento al hacer clic en cualquier lugar de la columna
            celda.addEventListener('click', () => manejarClicColumna(c));
            elementoTablero.appendChild(celda);
        }
    }
}

// Lógica de gravedad y turnos al hacer clic
function manejarClicColumna(col) {
    if (!juegoActivo) return; // Si alguien ganó o empató, ignorar clics

    // Encontrar la fila más baja disponible en la columna clicada
    let filaDisponible = -1;
    for (let f = FILAS - 1; f >= 0; f--) {
        if (matrizTablero[f][col] === 0) {
            filaDisponible = f;
            break;
        }
    }

    // Si la columna está llena, no hacer nada
    if (filaDisponible === -1) return;

    // Colocar la ficha
    matrizTablero[filaDisponible][col] = jugadorActual;
    renderizarTablero();

    // Verificar victoria
    if (verificarVictoria(filaDisponible, col)) {
        juegoActivo = false;
        elementoMensaje.textContent = `¡Felicidades Jugador ${jugadorActual}! ¡Has ganado la partida! 🎉`;
        return;
    }

    // Verificar empate (si la fila superior de todas las columnas está ocupada)
    if (verificarEmpate()) {
        juegoActivo = false;
        elementoMensaje.textContent = "¡Es un empate! El tablero está lleno y no hay más movimientos posibles. 🤝";
        elementoMensaje.style.color = "#333";
        return;
    }

    // Cambiar de turno si no hay victoria ni empate
    jugadorActual = jugadorActual === 1 ? 2 : 1;
    actualizarMensajeTurno();
}

// Actualiza el texto en pantalla que indica a quién le toca jugar
function actualizarMensajeTurno() {
    elementoMensaje.textContent = `Turno del Jugador ${jugadorActual} (${jugadorActual === 1 ? 'Rojo' : 'Amarillo'})`;
    elementoMensaje.style.color = jugadorActual === 1 ? "#ff4136" : "#ffdc00";
}

// Analiza las 4 direcciones posibles desde la última ficha colocada
function verificarVictoria(fila, col) {
    return (
        contarEnDireccion(fila, col, 1, 0) || // Horizontal
        contarEnDireccion(fila, col, 0, 1) || // Vertical
        contarEnDireccion(fila, col, 1, 1) || // Diagonal descendente (\)
        contarEnDireccion(fila, col, 1, -1)   // Diagonal ascendente (/)
    );
}

// Cuenta fichas consecutivas en una línea específica
function contarEnDireccion(fila, col, dirFila, dirCol) {
    let contador = 0;
    let jugador = matrizTablero[fila][col];

    // Revisamos hasta 3 espacios hacia atrás y 3 hacia adelante en esa dirección
    for (let i = -3; i <= 3; i++) {
        let f = fila + i * dirFila;
        let c = col + i * dirCol;
        
        // Si estamos dentro de los límites del tablero y la ficha pertenece al mismo jugador
        if (f >= 0 && f < FILAS && c >= 0 && c < COLUMNAS && matrizTablero[f][c] === jugador) {
            contador++;
            if (contador === 4) return true; // ¡4 en línea detectado!
        } else {
            contador = 0; // Se rompió la racha consecutiva, reiniciamos el contador
        }
    }
    return false;
}

// Si no hay ningún espacio vacío ('0') en la fila superior, significa que el tablero está lleno
function verificarEmpate() {
    return matrizTablero[0].every(celda => celda !== 0);
}

// Asignar evento al botón de reinicio
botonReiniciar.addEventListener('click', iniciarJuego);

// Arrancar el juego por primera vez al cargar la página
iniciarJuego();