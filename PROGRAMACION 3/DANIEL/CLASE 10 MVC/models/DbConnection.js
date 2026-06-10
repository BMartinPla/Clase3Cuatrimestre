import { DB_CONFIG } from "../config.js";
import sql from "mssql";

export async function fncDbConnection() {
  try {
    const pool = await sql.connect(DB_CONFIG);
    console.log("Conexión a la base de datos establecida");
    return pool;
  } catch (error) {
    console.error("Error al conectar a la base de datos:", error);
    throw error;
  }
}

export async function fncDbClose() {
  try {
    await sql.close();
    console.log("Conexión a la base de datos cerrada");
  } catch (error) {
    console.error("Error al cerrar la conexión a la base de datos:", error);
    throw error;
  }
}

export async function fncDbQuery(query, params = []) {
  try {
    const pool = await fncDbConnection(); // Establecer la conexión a la base de datos
    const request = pool.request(); // Crear una nueva conexión

    for (const param of params) {
      request.input(param.name, param.value);
    }

    const result = await request.query(query);
    return result;
  } catch (error) {
    console.error("Error al ejecutar la consulta:", error);
    throw error;
  } finally {
    await fncDbClose();
  }
}
