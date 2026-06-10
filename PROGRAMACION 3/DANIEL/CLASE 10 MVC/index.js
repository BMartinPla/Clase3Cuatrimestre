import { fncDbQuery } from "./models/DbConnection.js";

async function probarConexion() {
  try {
    // Vamos a hacer una consulta simple a la tabla de productos que creaste
    const resultado = await fncDbQuery("SELECT TOP 5 producto, descripcion, precio_unitario FROM productos");
    console.log("¡Conexión exitosa! Aquí tienes algunos productos:");
    console.table(resultado.recordset);
  } catch (error) {
    console.error("Hubo un problema al probar la conexión:", error);
  }
}

probarConexion();