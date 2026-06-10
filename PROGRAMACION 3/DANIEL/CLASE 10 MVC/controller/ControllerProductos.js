import { ProductosModel } from "../models/ProductosModel.js";

export class ControllerProductos {

  static async getProductos(req, res) {
    const productos = await ProductosModel.getProductos();
    res.status(200).json(productos || []);
  }

  static async getProductoNro(req, res) {
    const nro = Number.parseInt(req.params.nro, 10);
   /* if (!Number.isInteger(nro)) {
      throw new AppError(
        "BAD_REQUEST",
        "El parametro nro debe ser un numero entero.",
      );
    } */

    const producto = await ProductosModel.getProductoNro(nro);
    res.status(200).json(producto);
  }

  static async getSocios(req, res) {
    const socios = await ProductosModel.getSocios();
    res.status(200).json(socios || []);
  }

}