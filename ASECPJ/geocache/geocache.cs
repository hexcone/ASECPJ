using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Web.Security;

public class Geocache
{
    public Guid geocacheId { get; set; }
    public string geocacheName { get; set; }
    public string geocacheDescription { get; set; }
    public int geocacheDifficulty { get; set; }
    public string geocacheCoordinates { get; set; }
    public string geocacheImage { get; set; }
    public DateTime geocacheDateCreated { get; set; }
    public string geocacheVerificationId { get; set; }
    public string geocacheStatus { get; set; }
    public int iduser { get; set; }

}
