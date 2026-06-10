const sqlite3 = require('sqlite3').verbose(); // verbose gives richer stack traces

// Open database connection
const db = new sqlite3.Database('./Barrios.db', (err) => {
  if (err) return console.error(err.message);
  console.log('Connected to Barrios.db.');
});

const datos=[
	{nombre:'Juan',email:'juan@pepe.net', password:'abc123'},
	{nombre:'Pedro',email:'pedro@pepe.net', password:'abc123'},
	{nombre:'Luis',email:'luis@pepe.net', password:'abc123'},
	{nombre:'Maria',email:'maria@pepe.net', password:'abc123'},
	{nombre:'Laura',email:'laura@pepe.net', password:'abc123'}
];

const sql_create=`CREATE TABLE IF NOT EXISTS Usuario (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	nombre varchar(128) not null unique,
	email varchar(128) not null unique,
	password varchar(128) not null)`;

const sql_insert='INSERT INTO Usuario(nombre,email,password) VALUES (?,?,?)';

const sql_select='SELECT nombre,email,password FROM Usuario';

db.serialize( () => {
	db.run(sql_create);

	const insertStmt = db.prepare(sql_insert);

	db.exec('BEGIN TRANSACTION');
	try {
		for (const dato of datos) {
			console.log(dato['nombre'], dato['email'], dato['password']);
			insertStmt.run(dato['nombre'], dato['email'], dato['password']);
		}
		insertStmt.finalize();
		db.exec('COMMIT');
		console.log(`${datos.length} usuarios creados exitosamente`);
	} catch(error) {
		db.exec('ROLLBACK');
		console.log('Error insertando el array de usuarios:', error);
	}
});

