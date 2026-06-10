import {readFile} from "node:fs/promises";
import {contarPalabras, separarPalabras} from "./utilidades.mjs";

const prlg = await readFile ("./prologo.txt", "utf-8");

const palabra = "ballena";

const cantidad = contarPalabras(prlg, palabra);

console.log(`La palabra "${palabra}" aparece ${cantidad} veces en el texto.`);

const cantPalabras = separarPalabras(prlg);

console.log("Cantidad de palabras distintas: " + cantPalabras.palabrasDistintas.length);

console.log("-Palabras repetidas-");

console.log(cantPalabras.conteo);