using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Reflection;
using System.Runtime.InteropServices;
using Microsoft.Data.Sqlite;
using Microsoft.Extensions.Primitives;
using System.Security.Cryptography;

namespace Barrios
{
    internal class Barrio
    {
        string? id_renabap {  get; set; }
        string? nombre_barrio { get; set; }
        string? provincia { get; set; }

    }
}
