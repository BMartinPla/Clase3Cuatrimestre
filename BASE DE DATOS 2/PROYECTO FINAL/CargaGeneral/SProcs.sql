create procedure S_PAIS
@id int = null,
@nombre varchar(128) = null
As
Begin
 	select id, nombre
 	from Pais 
 	where id = isnull(@id, id)
 	  and nombre = isnull(@nombre, nombre)
	order by nombre;
END;

create procedure S_Provincia
@id int = null,
@nombre varchar(128) = null,
@paisid int = null,
@nombrepais varchar(128) = null
As
Begin
 	select pr.id, pr.nombre, pa.id as paisid, pa.nombre as nombrepais
 	from Provincia pr
    inner join Pais pa
       on pr.pais_id = pa.id
 	where pr.id = isnull(@id, pr.id)
 	  and pr.nombre = isnull(@nombre, pr.nombre)
      and pa.id = isnull(@paisid, pa.id)
      and pa.nombre = isnull(@nombrepais, pa.nombre)
	order by pa.nombre, pr.nombre;
END;
