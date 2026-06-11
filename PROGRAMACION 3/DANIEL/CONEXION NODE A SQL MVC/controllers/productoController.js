const productoModel = require('../models/productoModel');

const getProductos = async (req, res) => {
    try {
        const productos = await productoModel.getAllProductos();
        res.status(200).json(productos);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error al obtener los productos" });
    }
};

const getProducto = async (req, res) => {
    try {
        const { id } = req.params;
        const producto = await productoModel.getProductoById(id);
        
        if (!producto) return res.status(404).json({ message: "Producto no encontrado" });
        res.status(200).json(producto);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error al obtener el producto" });
    }
};

const createProducto = async (req, res) => {
    try {
        const { producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado } = req.body;
        
        // Validamos los campos NOT NULL requeridos por la tabla
        if(producto === undefined || !descripcion || cantidad === undefined) {
            return res.status(400).json({ message: "Los campos: producto, descripcion y cantidad son OBLIGATORIOS." });
        }

        await productoModel.createProducto(producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado);
        res.status(201).json({ message: "Producto creado exitosamente" });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error al crear el producto" });
    }
};

const updateProducto = async (req, res) => {
    try {
        const { id } = req.params;
        const { descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado } = req.body;

        await productoModel.updateProducto(id, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado);
        res.status(200).json({ message: "Producto actualizado exitosamente" });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error al actualizar el producto" });
    }
};

const deleteProducto = async (req, res) => {
    try {
        const { id } = req.params;
        await productoModel.deleteProducto(id);
        res.status(200).json({ message: "Producto eliminado exitosamente" });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error al eliminar el producto" });
    }
};

module.exports = { 
    getProductos, getProducto, createProducto, updateProducto, deleteProducto
};