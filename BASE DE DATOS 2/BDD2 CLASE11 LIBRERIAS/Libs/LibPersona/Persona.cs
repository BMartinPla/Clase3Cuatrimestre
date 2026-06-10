using System.Collections.Generic;

namespace LibPersona;

public class Persona
{
    int _id { get; set; }
    string _apellido { get; set; }
    string _nombre { get; set; }
    TipoDocumento _tipodocumento { get; set; }
    string _documento { get; set; }
    Genero _genero { get; set; }
    EstadoCivil _estadocivil { get; set; }
    DateOnly _fnacto { get; set; }
    List<Contacto> _contactos { get; set; }
    List<Domicilio> _domicilios { get; set; }


    public Persona (int id, string apellido, string nombre,
                    TipoDocumento tipodocumento,
                    string documento, Genero genero,
                    EstadoCivil estadocivil, DateOnly fnacto,
                    List<Contacto> contactos,
                    List<Domicilio> domicilios)
    {
        _id = id;
        _apellido = apellido;
        _nombre = nombre;
        _tipodocumento = tipodocumento;
        _documento = documento;
        _genero = genero;
        _estadocivil = estadocivil;
        _fnacto = fnacto;
        _contactos = contactos;
        _domicilios = domicilios;
    }

    public override string ToString()
    {
        string persona = $"{{Persona: {_nombre} {_apellido}, {_tipodocumento} ";
        persona += $"{_documento}, {_genero}, {_estadocivil}, {_fnacto.ToString()} ";
        foreach (var c in _contactos)
        {
            persona += $"{c}\n";
        }
        foreach (var d in _domicilios)
        {
            persona += $"{d}\n";
        }
        persona += "}";
        return persona;
    }
}