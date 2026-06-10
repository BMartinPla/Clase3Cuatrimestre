const sqlite3 = require('sqlite3').verbose(); // verbose gives richer stack traces

// Open database connection
const db = new sqlite3.Database('./Users.db', (err) => {
  if (err) return console.error(err.message);
  console.log('Connected to Barrios.db.');
});

const sql_select='SELECT id,nombre,email,password FROM Usuario';

db.all(sql_select, [], (err, rows) => {
  if (err) {
    console.error('Database error:', err.message);
    return;
  }
  
  console.log(`Hay ${rows.length} usuarios:`);
  rows.forEach((row) => {
    console.log(`ID: ${row.id}, Nombre: ${row.nombre}, Email: ${row.email}`);
  });
});
