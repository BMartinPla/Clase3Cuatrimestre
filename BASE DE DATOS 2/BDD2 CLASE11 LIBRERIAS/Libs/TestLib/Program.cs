using LibPersona;
namespace TestLib;
public class Program {
    public static void Main(string[] args)
    {
        Pais pais = new Pais(1,"Argentina");
        Provincia provincia = new Provincia(1,pais, "Buenos Aires");
        Localidad localidad = new Localidad(1, provincia, "San Nicolas");
        Console.WriteLine(localidad);
        TipoDocumento tdoc = new TipoDocumento(1, pais, "DNI");
        Console.WriteLine(tdoc);
        
        string[] ctos = {"Celular","Whatsapp","Email", "SMS", "Instagram", "Facebook"};
        int cnt = 1;
        List<TipoContacto> tiposcontacto = new List<TipoContacto>();
        foreach(var tcon in ctos)
        {
            tiposcontacto.Add(new TipoContacto(cnt, tcon));
            cnt++;
        }
        foreach(var tc in tiposcontacto)
        {
            Console.WriteLine(tc);
        }
        Genero masculino = new Genero(1, "Masculino");
        EstadoCivil casado = new EstadoCivil(1, "Casado");
        Persona p = new Persona(1, "Arce", "Juan", 
            tdoc,
            "13798792", masculino,
            casado,
            DateOnly.FromDateTime(DateTime.Now),
            new List<Contacto>(), new List<Domicilio>());
        Console.WriteLine(p);
    }
}
