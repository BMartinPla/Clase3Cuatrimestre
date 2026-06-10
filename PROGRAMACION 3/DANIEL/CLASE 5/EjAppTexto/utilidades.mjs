export function contarPalabras(texto, palabraBusqueda) {
    texto = texto.toLowerCase();
    palabraBusqueda = palabraBusqueda.toLowerCase();
    let cantidad = 0;
    let posicion = 0;

    while ((posicion = texto.indexOf(palabraBusqueda, posicion)) !== -1) {
        cantidad++;
        posicion += palabraBusqueda.length;
    }

    return cantidad;
}

export function separarPalabras(textoCompleto) {
    if (!textoCompleto) return [];
  
    const palabras = textoCompleto.split(/\s+/);
    const palabrasDistintas = [...new Set(palabras)];
  
    const conteo = {};
    for (const palabra of palabrasDistintas) {
      conteo[palabra] = contarPalabras(textoCompleto, palabra);
    }
  
    return { palabrasDistintas, conteo };
  }