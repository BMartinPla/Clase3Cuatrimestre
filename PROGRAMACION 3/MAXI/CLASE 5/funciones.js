// 1. Seleccionamos los elementos
const inputNombre = document.querySelector('#nombreUsuario');
const btnSaludar = document.querySelector('#btnSaludar');
const btnDespedir = document.querySelector('#btnDespedir');
const pantallaMensaje = document.querySelector('#mensajeResultado');

// 2. Evento para Saludar
btnSaludar.addEventListener('click', () => {
    const nombre = inputNombre.value; // Capturamos lo que escribió

    if (nombre.trim() === "") {
        pantallaMensaje.textContent = "Por favor, ingresá un nombre.";
    } else {
        pantallaMensaje.textContent = `¡Hola, ${nombre}! Qué bueno verte.`;
    }
});

// 3. Evento para Despedir
btnDespedir.addEventListener('click', () => {
    const nombre = inputNombre.value;

    if (nombre.trim() === "") {
        pantallaMensaje.textContent = "¡Adiós, desconocido!";
    } else {
        pantallaMensaje.textContent = `¡Chau, ${nombre}! Hasta la próxima.`;
    }
});