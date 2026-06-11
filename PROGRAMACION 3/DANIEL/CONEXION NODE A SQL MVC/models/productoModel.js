const { getConnection, sql } = require('../config/db');

// [R] Leer todos los productos
const getAllProductos = async () => {
    const pool = await getConnection();
    const result = await pool.request().query('SELECT * FROM productos'); 
    return result.recordset;
};

// [R] Leer un producto por ID
const getProductoById = async (id) => {
    const pool = await getConnection();
    const result = await pool.request()
        .input('id', sql.Numeric(6, 0), id)
        .query('SELECT * FROM productos WHERE producto = @id');
    return result.recordset[0]; 
};

// [C] Crear nuevo producto
const createProducto = async (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) => {
    const pool = await getConnection();
    const result = await pool.request()
        .input('producto', sql.Numeric(6, 0), producto)
        .input('descripcion', sql.Char(120), descripcion)
        .input('marca', sql.Numeric(6, 0), marca)
        .input('grupo', sql.Char(3), grupo)
        .input('tipo', sql.Char(3), tipo)
        .input('cantidad', sql.Numeric(9, 2), cantidad)
        .input('punto_pedido', sql.Numeric(9, 2), punto_pedido)
        .input('precio_unitario', sql.Money, precio_unitario)
        .input('estado', sql.Char(3), estado)
        .query(`
            INSERT INTO productos 
            (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) 
            VALUES 
            (@producto, @descripcion, @marca, @grupo, @tipo, @cantidad, @punto_pedido, @precio_unitario, @estado)
        `);
    return result;
};

// [U] Actualizar producto existente
const updateProducto = async (id, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) => {
    const pool = await getConnection();
    const result = await pool.request()
        .input('id', sql.Numeric(6, 0), id)
        .input('descripcion', sql.Char(120), descripcion)
        .input('marca', sql.Numeric(6, 0), marca)
        .input('grupo', sql.Char(3), grupo)
        .input('tipo', sql.Char(3), tipo)
        .input('cantidad', sql.Numeric(9, 2), cantidad)
        .input('punto_pedido', sql.Numeric(9, 2), punto_pedido)
        .input('precio_unitario', sql.Money, precio_unitario)
        .input('estado', sql.Char(3), estado)
        .query(`
            UPDATE productos 
            SET descripcion = @descripcion, marca = @marca, grupo = @grupo, tipo = @tipo, 
                cantidad = @cantidad, punto_pedido = @punto_pedido, precio_unitario = @precio_unitario, estado = @estado 
            WHERE producto = @id
        `);
    return result;
};

// [D] Eliminar producto
const deleteProducto = async (id) => {
    const pool = await getConnection();
    const result = await pool.request()
        .input('id', sql.Numeric(6, 0), id)
        .query('DELETE FROM productos WHERE producto = @id');
    return result;
};

module.exports = { 
    getAllProductos, getProductoById, createProducto, updateProducto, deleteProducto
};