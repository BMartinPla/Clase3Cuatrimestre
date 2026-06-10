const a= 1;
const b= 15;

let resultado;
resultado = a + b;

console.log ("Resultado: " + resultado);

if (resultado > 20) {
    console.log ("Mayor")
} else {
    console.log ("Menor")
}


// EJERCICIO DADOS



console.log ("INICIO");

function tirarDados() {
    const dado = 0;
    return dado;
}

let intentos  = 0;
let dado1, dado2;

function dados() {

    console.clear();

    intentos  = 0;

    do {
        intentos++;
        dado1 = Math.floor(Math.random()*6) + 1;
        dado2 = Math.floor(Math.random()*6) + 1;
    
        if (dado1 == dado2) {
            console.log("Ganaste en " + intentos + " intentos!");
            console.log("Dado 1: " + dado1);
            console.log("Dado 2: " + dado2);
        } else {
            console.log("Intento numero " + intentos);
            console.log("Perdiste...");
            console.log("Dado 1: " + dado1);
            console.log("Dado 2: " + dado2);
        }
    
    } while (dado1 != dado2);


}

do {
    intentos++;
    dado1 = Math.floor(Math.random()*6) + 1;
    dado2 = Math.floor(Math.random()*6) + 1;

    if (dado1 == dado2) {
        console.log("Ganaste en " + intentos + " intentos!");
        console.log("Dado 1: " + dado1);
        console.log("Dado 2: " + dado2);
    } else {
        console.log("Intento numero " + intentos);
        console.log("Perdiste...");
        console.log("Dado 1: " + dado1);
        console.log("Dado 2: " + dado2);
    }

} while (dado1 != dado2);


