import { fncDbQuery } from "./DbConnection.js";

export class ProductosModel {
  static async getProductos() {
    const result = await fncDbQuery("select * from productos");

    return result.recordset;
  }

  static async getProductoNro(nro) {
    const result = await fncDbQuery(
      "select * from productos where producto = @nro",
      [{ name: "nro", value: nro }],
    );
    return result.recordset;

  }

}