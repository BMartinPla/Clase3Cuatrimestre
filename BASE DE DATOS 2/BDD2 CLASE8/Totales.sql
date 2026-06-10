-- Totalizadores 
select top 1 nombre, max(superficie) as M2 from Barrio b
group by nombre
order by 2 desc; 

select top 1 nombre, max(b.cantidad_viviendas) as Viviendas from Barrio b
group by nombre
order by 2 desc; 

select top 1 nombre, max(b.cantidad_familias) as Fmilias from Barrio b 
group by nombre
order by 2 desc; 

