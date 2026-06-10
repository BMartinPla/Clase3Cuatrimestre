import express from "express";
import { ControllerProductos } from "../controller/ControllerProductos.js";

const RouterProductos = express.Router();

RouterProductos.get("/", ControllerProductos.getProductos);
RouterProductos.get("/socios", ControllerProductos.getSocios);
RouterProductos.get("/:nro", ControllerProductos.getProductoNro);
RouterProductos.post("/", ControllerProductos.createProducto);

export default RouterProductos;