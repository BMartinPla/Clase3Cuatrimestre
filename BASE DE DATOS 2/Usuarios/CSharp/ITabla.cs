using Microsoft.Data.Sqlite;
public interface ITabla
{
    public void CrearTabla();
    public void Buscar();
    public void Insertar();
    public void Eliminar();
}