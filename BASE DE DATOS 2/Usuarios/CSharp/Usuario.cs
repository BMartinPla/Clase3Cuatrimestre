using Microsoft.Data.Sqlite;

namespace CSharp;

public class Usuario : ITabla
{
    public int Id { get; set;} 
    public string Nombre { get; set; } = "";
    public string Email { get; set;} = "";
    public string Password { get; set;} = "";

    private SqliteConnection? conn;

    public Usuario() {}
    public Usuario(SqliteConnection conn)
    {
        this.conn = conn;
    }
    public void CrearTabla()
    {
        string sql = @"CREATE TABLE IF NOT EXISTS Usuarios (
            Id INTEGER PRIMARY KEY AUTOINCREMENT,
            Nombre VARCHAR(128) NOT NULL UNIQUE,
            Email VARCHAR(128) NOT NULL UNIQUE,
            Password VARCHAR(128) NOT NULL
        );";
        try {
            SqliteCommand command = new SqliteCommand(sql, conn);
            command.ExecuteNonQuery();        
        }
        catch (Exception e)
        {
            Console.WriteLine($"Error executing:\n{sql}\n{e.Message} ");
        }
    }

    public void Buscar()
    {
        string sql = "SELECT Id, Nombre, Email, Password FROM Usuarios WHERE nombre = $nombre";
        try
        {
            SqliteCommand command = new SqliteCommand(sql, conn);
            command.Parameters.AddWithValue("$nombre", this.Nombre);
            SqliteDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                this.Id = reader.GetInt32(0);
                this.Nombre = reader.GetString(1);
                this.Email = reader.GetString(2);
                this.Password = reader.GetString(3);
            }
            else
            {
                Console.WriteLine("No encontré nada");
            }
        }
        catch (Exception e)
        {
            Console.WriteLine($"Error executing:\n{sql}\n{e.Message} ");
        }
    }

    public void Insertar()
    {
        string sql = "INSERT INTO Usuarios(nombre, email, password) VALUES ($nombre, $email, $password)";
        try
        {
            SqliteCommand command = new SqliteCommand(sql, conn);
            command.Parameters.AddWithValue("$nombre", this.Nombre);
            command.Parameters.AddWithValue("$email", this.Email);
            command.Parameters.AddWithValue("$password", this.Password);
            this.Id = command.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            Console.WriteLine($"Error executing:\n{sql}\n{e.Message} ");
        }
    }

    public void Eliminar()
    {
        string sql = "DELETE FROM Usuarios WHERE Id = $Id";
        try
        {
            SqliteCommand command = new SqliteCommand(sql, conn);
            command.Parameters.AddWithValue("Id", this.Id);
            int borrado = command.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            Console.WriteLine($"Error executing:\n{sql}\n{e.Message} ");
        }
    }

    public void Actualizar()
    {
        string sql = @"UPDATE Usuarios SET 
                    nombre = isnull($nombre, nombre),
                    email = isnull($email, email),
                    password = isnull($email, emaill)
                    WHERE = $Id";
        try
        {
            SqliteCommand command = new SqliteCommand(sql, conn);
            command.Parameters.AddWithValue("Id", this.Id);
            command.Parameters.AddWithValue("$nombre", this.Nombre);
            command.Parameters.AddWithValue("$email", this.Email);
            command.Parameters.AddWithValue("$nombre", this.Password);
            int actualizado = command.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            Console.WriteLine($"Error executing:\n{sql}\n{e.Message} ");
        }
    }

    public static List<Usuario> Todos(SqliteConnection conn)
    {
        List<Usuario> todos = new List<Usuario>();
        string sql = "SELECT id, nombre, email, password FROM Usuarios";
        try
        {
            SqliteCommand command = new SqliteCommand(sql, conn);
            SqliteDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Usuario u = new Usuario();
                u.Id = reader.GetInt32(0);
                u.Nombre = reader.GetString(1);
                u.Email = reader.GetString(2);
                u.Password = reader.GetString(3);
                todos.Add(u);
            }
        }
        catch (Exception e)
        {
            Console.WriteLine($"Error executing:\n{sql}\n{e.Message} ");
        }
        return todos;
    }

    public override string ToString()
    {
        return $"Usuario({this.Id}): {this.Nombre}, Email: {this.Email}, Password: {this.Password}";
    }
}