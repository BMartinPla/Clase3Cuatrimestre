import sqlite3

sql = "SELECT DISTINCT provincia FROM Base ORDER By 1"

conn = sqlite3.connect("Barrios.db", autocommit=True)
cursor = conn.cursor()
cursor.execute(sql)
provincias = []
for row in cursor:
	provincias.append(row[0])

print(provincias)


sql_create = """
CREATE TABLE IF NOT EXISTS Usuario ( 
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	nombre varchar(128) not null unique,
	email varchar(128) not null unique,
	password varchar(128) not null)
"""
cursor.execute(sql_create)

sql_delete = "DELETE FROM Usuario";
cursor.execute(sql_delete)

datos=[
	("Juan","juan@pepe.net", "abc123"),
	("Pedro","pedro@pepe.net", "abc123"),
	("Luis","luis@pepe.net", "abc123"),
	("Maria","maria@pepe.net", "abc123"),
	("Lucas","lucas@pepe.net", "abc123"),
	("Nacho","nacho@pepe.net", "abc123"),
	("Laura","laura@pepe.net", "abc123")
]

sql_insert="INSERT INTO Usuario(nombre,email,password) VALUES (?,?,?)"
for dato in datos:
	cursor.execute(sql_insert, dato)

sql_select="SELECT nombre, email, password FROM Usuario"
cursor.execute(sql_select)
for row in cursor:
	print(row)

