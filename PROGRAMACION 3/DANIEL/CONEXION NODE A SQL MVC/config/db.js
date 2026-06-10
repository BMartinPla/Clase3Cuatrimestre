const sql = require('mssql/msnodesqlv8'); // IMPORTANTE: El require debe tener esta ruta
require('dotenv').config();

const dbSettings = {
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    server: 'localhost\\SQLEXPRESS01', // O 'TSP206\\SQLEXPRESS01' si localhost te rechaza
    database: process.env.DB_DATABASE,
    driver: 'msnodesqlv8', // Activamos el driver nativo
    options: {
        encrypt: false, 
        trustServerCertificate: true 
    }
};

async function getConnection() {
    try {
        const pool = await sql.connect(dbSettings);
        return pool;
    } catch (error) {
        console.error("Error conectando a SQL Server:", error);
    }
}

module.exports = { getConnection, sql };