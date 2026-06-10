DROP VIEW IS EXISTS V_BarriosProvincia;

CREATE VIEW V_BarriosProvincia
AS
Select p.nombre as provincia, count(*) as Total
from Barrio b
inner join Localidad l
  on l.id = b.localidad_id
inner join Departamento d
  on d.id = l.depto_id
inner join Provincia p
  on p.id = d.provincia_id
group by p.nombre;


-- Problema con las views en sql server:
-- No se le puede agregar el order by.
-- Posible solucion es llamar a la views desde una Stored Procedure
-- y ahi el podemos agregar el order by a un select * from la view.


DROP VIEW IS EXISTS V_Totales;

CREATE VIEW V_Totales
AS
select 
	sum(cantidad_viviendas) AS TotalViviendas,
	sum(cantidad_familias) as TotalFamilias,
	max(superficie)as Total_M2
from Barrio;
