namespace LibPersona;

public class Domicilio
{
    int _id{ get; set; }
    Localidad _localidad { get; set; }
    string _direccion { get; set; }
    string _codPos { get; set; }

    public Domicilio(int id, Localidad localidad, string direccion, string codpos)
    {
        _id= id;
        _localidad = localidad;
        _direccion = direccion;
        _codPos = codpos;
    }
    public override string ToString()
    {
        return $"{{Domicilio: Id: {_id}, Direccion: {_direccion}, {_localidad}, C.P: {_codPos}}}";
    }

}
