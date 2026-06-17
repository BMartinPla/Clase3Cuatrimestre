using System;
using Microsoft.Data.SqlClient;

namespace CargaGeneral;
public class Procedure
{
    string _name;
    List<Parameter> _parameters;
    public Procedure() {}
    public Procedure(string name, List<Parameter> parameters)
    {
        _name = name;
        _parameters = parameters;
    }
    public override string ToString()
    {
        string str = $"Procedure: {_name} {Environment.NewLine}Parameters:{Environment.NewLine}";
        foreach(Parameter p in _parameters)
            str += $"\t{p}{Environment.NewLine}";
        return str;
    }
    public static Procedure GetProcedure(string proc, SqlConnection conn)
    {
        try
        {
            return new Procedure(proc, Parameter.GetParameters(proc, conn));
        }
        catch(SqlException sqle)
        {
            Console.WriteLine("Error en Procedure.GetProcedures()");
            Console.WriteLine(sqle.Message);
            return null;
        }
    }
    public static List<Procedure> GetProcedures(SqlConnection conn)
    {
        List<Procedure> procs = new List<Procedure>();
        string sql = "SELECT name FROM sys.procedures WHERE name like 'I_%'";
        try
        {
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Procedure proc = new Procedure(reader.GetString(0), Parameter.GetParameters(reader.GetString(0), conn));
                procs.Add(proc);
            }
            reader.Close();
        }
        catch(SqlException sqle)
        {
            Console.WriteLine("Error en Procedure.GetProcedures()");
            Console.WriteLine(sqle.Message);
        }
        return procs;
    }
}