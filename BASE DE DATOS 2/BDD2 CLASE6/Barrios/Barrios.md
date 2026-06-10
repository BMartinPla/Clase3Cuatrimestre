# Barrios Populares

1. Crear una carpeta llamada "Barrios Populares"
2. Dentro de esta carpeta, copiar el sqlite3.exe y el archivo barrios_populares.csv adjunto.
3. Abrir la consola cmd e ir a la carpeta creada en la paso 1.
4. Una vez dentro de la consola cmd, ejecutar:

```
sqlite> sqlite3 Barrios.db
```

Esto creará la base de datos Barrios.db donde importaremos el archivo csv.

5. Una vez dentro de la consola sqlite> Importamos el archivo csv:

```
sqlite> .mode csv
sqlite> .import barrios_populares.csv Base
```

Esto importara el archivo csv y se creará la tabla Base.\
Podemos ver s estructura con el siguiente comando: sqlite> .schema Base

```
  sqlite> .schema Base
   CREATE TABLE IF NOT EXISTS "Base"(
    "id_renabap" TEXT,
    "nombre_barrio" TEXT,
    "provincia" TEXT,
    "departamento" TEXT,
    "localidad" TEXT,
    "cantidad_viviendas_aproximadas" TEXT,
    "cantidad_familias_aproximada" TEXT,
    "decada_de_creacion" TEXT,
    "anio_de_creacion" TEXT,
    "energia_electrica" TEXT,
    "efluentes_cloacales" TEXT,
    "agua_corriente" TEXT,
    "cocina" TEXT,
    "calefaccion" TEXT,
    "titulo_propiedad" TEXT,
    "clasificacion_barrio" TEXT,
    "superficie_m2" TEXT);
```

- Nota: quizá la salida en cada una de las PCs sea distinta en formato,
  pero tendrá la misma estructura.

# Ejercitación:

1. Cuantos barrios hay por provincia?

select provincia, count(nombre_barrio) as cantidad
from Base
group by provincia;

2. Cuantos barrios hay por provincia y departamento?

select provincia, departamento, count(nombre_barrio) as cantidad
from Base
group by provincia, departamento;

3. Cuantos barrios hay por provincia, departamento y localidad?


select provincia, departamento, localidad, count(nombre_barrio) as cantidad
from Base
group by provincia, departamento, localidad;

4. Cuantos tipos distintos hay de:
   - Cocina
   - Calefaccion
   - Efluentes cloacales
   - Energia Electrica

select distinct cocina, 'cocina'
from Base;

5. Cual es el barrio mas viejo?

select nombre_barrio, anio_de_creacion
from base
where anio_de_creacion = (select min(anio_de_creacion) 
from base 
where anio_de_creacion IS NOT NULL
and anio_de_creacion != '');

6. Cual es el barrio con mayor cantidad de viviendas?

select nombre_barrio, max(cast(cantidad_viviendas_aproximadas as integer)) as cantidad_viviendas
from base;

7. Cual es el barrio con la mayor cantidad de familias?

select nombre_barrio, max(cast(cantidad_familias_aproximada as integer)) as cantidad_familias
from base;

8. Y el menor?

select nombre_barrio, min(cast(cantidad_familias_aproximada as integer)) as cantidad_familias
from base;

9. Cuantos barrios se crearon por década?

select decada_de_creacion, count(nombre_barrio) as cantidad
from Base
group by decada_de_creacion;

10. Cuantos barrios de crearon por año?

select anio_de_creacion, count(nombre_barrio) as cantidad
from Base
group by anio_de_creacion;

11. Cuantos barrios hay en total?

Select count(*) as cantidad_barrios
from base;

12. Hay barrios que estén mas de una vez?

select nombre_barrio, count(nombre_barrio)
from base
group by nombre_barrio
having count(nombre_barrio) > 1
order by count(nombre_barrio) desc;

13. Que provincias tienen mas de 20 barrios populares?

select provincia, count(nombre_barrio) as cantidad
from Base
group by provincia
having count(nombre_barrio) > 20;

14. Y cuales tienen menos de 5?

select provincia, count(nombre_barrio) as cantidad
from Base
group by provincia
having count(nombre_barrio) < 10;
