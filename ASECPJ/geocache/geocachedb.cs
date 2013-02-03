using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Web.Security;

public class GeocacheDb
{

    protected static MembershipUser m;
    protected static int iduser = 2;
    protected static Guid geocacheId;
    protected static Guid findId;
    protected static Guid geocacheReportId;
    protected static Guid findReportId;

    private static string connectionString = ConfigurationManager.ConnectionStrings["asecpjConnectionString"].ConnectionString;

    public static Guid createGeocache(string geocacheName, string geocacheDescription, int geocacheDifficulty, string geocacheLatitude, 
        string geocacheLongitude, string geocacheImage, DateTime geocacheDateCreated, string geocacheVerificationId, string geocacheStatus)
    {
        //if (Membership.GetUser() != null)
        //{
        //    m = Membership.GetUser();
        //    // (retrieve memberId here) memberId = new int(m.ProviderUserKey.ToString());
        //}
        geocacheId = Guid.NewGuid();

        MySqlConnection con = new MySqlConnection(connectionString);
        con.Open();
        MySqlCommand cmd = new MySqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO geocache(geocacheId, geocacheName, geocacheDescription, geocacheDifficulty, geocacheLatitude, " +
            "geocacheLongitude, geocacheImage, geocacheDateCreated, geocacheVerificationId, geocacheStatus, iduser) VALUES (@geocacheId, " +
            "@geocacheName, @geocacheDescription, @geocacheDifficulty, @geocacheLatitude, @geocacheLongitude" +
            "@geocacheImage, @geocacheDateCreated, @geocacheVerificationId, " +
            "@geocacheStatus, @iduser)";
        cmd.Prepare();

        cmd.Parameters.AddWithValue("@geocacheId", geocacheId.ToString());
        cmd.Parameters.AddWithValue("@geocacheName", geocacheName);
        cmd.Parameters.AddWithValue("@geocacheDescription", geocacheDescription);
        cmd.Parameters.AddWithValue("@geocacheDifficulty", geocacheDifficulty);
        cmd.Parameters.AddWithValue("@geocacheLatitude", geocacheLatitude);
        cmd.Parameters.AddWithValue("@geocacheLongitude", geocacheLongitude);
        cmd.Parameters.AddWithValue("@geocacheImage", geocacheImage);
        cmd.Parameters.AddWithValue("@geocacheDateCreated", geocacheDateCreated);
        cmd.Parameters.AddWithValue("@geocacheVerificationId", geocacheVerificationId);
        cmd.Parameters.AddWithValue("@geocacheStatus", geocacheStatus);
        cmd.Parameters.AddWithValue("@iduser", iduser);


        cmd.ExecuteNonQuery();

        return geocacheId;
    }

    public static List<Geocache> retrieveGeocache()
    {
        //if (Membership.GetUser() != null)
        //{
        //    m = Membership.GetUser();
        //    // (retrieve memberId here) memberId = new int(m.ProviderUserKey.ToString());
        //}

        List<Geocache> geocacheList = new List<Geocache>();
        MySqlDataReader reader;
        MySqlConnection con = new MySqlConnection(connectionString);
        con.Open();
        MySqlCommand cmd = new MySqlCommand();
        cmd.Connection = con;

        //if keyword if not null, search user table for match, return iduser[]
        int[] iduser = { 1, 2, 3 };

        cmd.CommandText = "SELECT geocacheId, geocacheName, geocacheDateCreated FROM geocache";
        
        cmd.Prepare();

        reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            Geocache g = new Geocache();
            g.geocacheId = Guid.Parse(reader.GetString(0));
            g.geocacheName = reader.GetString(1);
            g.geocacheDateCreated = reader.GetDateTime(2);

            geocacheList.Add(g);
        }

        return geocacheList;
    }

    public static Geocache retrieveGeocache(string geocacheId)
    {
        //if (Membership.GetUser() != null)
        //{
        //    m = Membership.GetUser();
        //    // (retrieve memberId here) memberId = new int(m.ProviderUserKey.ToString());
        //}

        Geocache g = new Geocache();
        g.geocacheId = Guid.Parse(geocacheId);
        MySqlDataReader reader;
        MySqlConnection con = new MySqlConnection(connectionString);
        con.Open();
        MySqlCommand cmd = new MySqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT geocache.geocacheName, geocache.geocacheDescription, geocache.geocacheDifficulty, geocache.geocacheLatitude, geocache.geocacheLongitude, geocache.geocacheImage, geocache.geocacheDateCreated, geocache.iduser FROM geocache WHERE geocacheId=@geocacheId";

        cmd.Prepare();
        cmd.Parameters.AddWithValue("@geocacheId", geocacheId);

        reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            g.geocacheName = reader.GetString(0);
            g.geocacheDescription = reader.GetString(1);
            g.geocacheDifficulty = reader.GetInt32(2);
            g.geocacheLatitude = reader.GetString(3);
            g.geocacheLongitude = reader.GetString(4);
            g.geocacheImage = reader.GetString(5);
            g.geocacheDateCreated = reader.GetDateTime(6);
            g.iduser = reader.GetInt32(7);
        }

        return g;
    }

    public static string retrieveUsername(int iduser)
    {
        //if (Membership.GetUser() != null)
        //{
        //    m = Membership.GetUser();
        //    // (retrieve memberId here) memberId = new int(m.ProviderUserKey.ToString());
        //}

        string username = "";
        MySqlDataReader reader;
        MySqlConnection con = new MySqlConnection(connectionString);
        con.Open();
        MySqlCommand cmd = new MySqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT `user`.username FROM `user` WHERE iduser=@iduser";

        cmd.Prepare();
        cmd.Parameters.AddWithValue("@iduser", iduser);

        reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            username = reader.GetString(0);
        }

        return username;
    }

    public static bool verifyCode(string enteredCode, string geocacheId)
    {
        string code = "";
        MySqlDataReader reader;
        MySqlConnection con = new MySqlConnection(connectionString);
        con.Open();
        MySqlCommand cmd = new MySqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT geocache.geocacheVerificationId FROM geocache WHERE geocacheId=@geocacheId";

        cmd.Prepare();
        cmd.Parameters.AddWithValue("@geocacheId", geocacheId);

        reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            code = reader.GetString(0);
        }

        if (code.Equals(enteredCode))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public static Guid createFind(string findName, string findDescription, string findImage, DateTime findDateCreated, string findStatus, string geocacheId)
    {
        //if (Membership.GetUser() != null)
        //{
        //    m = Membership.GetUser();
        //    // (retrieve memberId here) memberId = new int(m.ProviderUserKey.ToString());
        //}
        findId = Guid.NewGuid();

        MySqlConnection con = new MySqlConnection(connectionString);
        con.Open();
        MySqlCommand cmd = new MySqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO find(findId, findName, findDescription, " +
            "findImage, findDateCreated, findStatus, geocacheId, iduser) VALUES (@findId, " +
            "@findName, @findDescription, " +
            "@findImage, @findDateCreated, @findStatus, @geocacheId, @iduser)";
        cmd.Prepare();

        cmd.Parameters.AddWithValue("@findId", findId);
        cmd.Parameters.AddWithValue("@findName", findName);
        cmd.Parameters.AddWithValue("@findDescription", findDescription);
        cmd.Parameters.AddWithValue("@findImage", findImage);
        cmd.Parameters.AddWithValue("@findDateCreated", findDateCreated);
        cmd.Parameters.AddWithValue("@findStatus", findStatus);
        cmd.Parameters.AddWithValue("@geocacheId", geocacheId);
        cmd.Parameters.AddWithValue("@iduser", iduser);

        cmd.ExecuteNonQuery();

        return findId;
    }

    public static Guid createGeocacheReport(string geocacheReportReason, string geocacheReportComment, string geocacheId)
    {
        //if (Membership.GetUser() != null)
        //{
        //    m = Membership.GetUser();
        //    // (retrieve memberId here) memberId = new int(m.ProviderUserKey.ToString());
        //}
        geocacheReportId = Guid.NewGuid();

        MySqlConnection con = new MySqlConnection(connectionString);
        con.Open();
        MySqlCommand cmd = new MySqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO geocacheReport(geocacheReportId, geocacheReportReason, geocacheReportComment, geocacheReportStatus, geocacheReportDateTime, " +
            "geocacheId, iduser) VALUES (@geocacheReportId, " +
            "@geocacheReportReason, @geocacheReportComment, @geocacheReportStatus, @geocacheReportDateTime, @geocacheId, @iduser)";
        cmd.Prepare();

        cmd.Parameters.AddWithValue("@geocacheReportId", geocacheReportId.ToString());
        cmd.Parameters.AddWithValue("@geocacheReportReason", geocacheReportReason);
        cmd.Parameters.AddWithValue("@geocacheReportComment", geocacheReportComment);
        cmd.Parameters.AddWithValue("@geocacheReportStatus", "pending");
        cmd.Parameters.AddWithValue("@geocacheReportDateTime", DateTime.Now);
        cmd.Parameters.AddWithValue("@geocacheId", geocacheId);
        cmd.Parameters.AddWithValue("@iduser", iduser);


        cmd.ExecuteNonQuery();

        return geocacheReportId;
    }

    public static Guid createFindReport(string findReportReason, string findReportComment, string findId)
    {
        //if (Membership.GetUser() != null)
        //{
        //    m = Membership.GetUser();
        //    // (retrieve memberId here) memberId = new int(m.ProviderUserKey.ToString());
        //}
        findReportId = Guid.NewGuid();

        MySqlConnection con = new MySqlConnection(connectionString);
        con.Open();
        MySqlCommand cmd = new MySqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO findReport(findReportId, findReportReason, findReportComment, findReportStatus, findReportDateTime, " +
            "findId, iduser) VALUES (@findReportId, " +
            "@findReportReason, @findReportComment, @findReportStatus, @findReportDateTime, @findId, @iduser)";
        cmd.Prepare();

        cmd.Parameters.AddWithValue("@findReportId", findReportId.ToString());
        cmd.Parameters.AddWithValue("@findReportReason", findReportReason);
        cmd.Parameters.AddWithValue("@findReportComment", findReportComment);
        cmd.Parameters.AddWithValue("@findReportStatus", "pending");
        cmd.Parameters.AddWithValue("@findReportDateTime", DateTime.Now);
        cmd.Parameters.AddWithValue("@findId", geocacheId);
        cmd.Parameters.AddWithValue("@iduser", iduser);


        cmd.ExecuteNonQuery();

        return findReportId;
    }

    /*
    //this method updates the event title and description
    public static void updateEvent(int id, String title, String description)
    {
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("UPDATE event SET title=@title, description=@description WHERE event_id=@event_id", con);
        cmd.Parameters.AddWithValue("@title", title);
        cmd.Parameters.AddWithValue("@description", description);
        cmd.Parameters.AddWithValue("@event_id", id);
        using (con)
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }


    }

    //this method updates the event start and end time
    public static void updateEventTime(int id, DateTime start, DateTime end)
    {
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("UPDATE event SET event_start=@event_start, event_end=@event_end WHERE event_id=@event_id", con);
        cmd.Parameters.AddWithValue("@event_start", start);
        cmd.Parameters.AddWithValue("@event_end", end);
        cmd.Parameters.AddWithValue("@event_id", id);
        using (con)
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

    //this mehtod deletes event with the id passed in.
    public static void deleteEvent(int id)
    {
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("DELETE FROM event WHERE (event_id = @event_id)", con);
        cmd.Parameters.AddWithValue("@event_id", id);
        using (con)
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

    //this method adds events to the database
    public static int addEvent(CalendarEvent cevent)
    {
        if (Membership.GetUser() != null)
        {
            m = Membership.GetUser();
            idStaff = new Guid(m.ProviderUserKey.ToString());
        }
        //add event to the database and return the primary key of the added event row

        //insert
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("INSERT INTO event(title, description, event_start, event_end, user_id) VALUES(@title, @description, @event_start, @event_end, @user_id)", con);
        cmd.Parameters.AddWithValue("@title", cevent.title);
        cmd.Parameters.AddWithValue("@description", cevent.description);
        cmd.Parameters.AddWithValue("@event_start", cevent.start);
        cmd.Parameters.AddWithValue("@event_end", cevent.end);
        cmd.Parameters.AddWithValue("@user_id", idStaff);

        int key = 0;
        using (con)
        {
            con.Open();
            cmd.ExecuteNonQuery();

            //get primary key of inserted row
            cmd = new SqlCommand("SELECT max(event_id) FROM event where title=@title AND description=@description AND event_start=@event_start AND event_end=@event_end", con);
            cmd.Parameters.AddWithValue("@title", cevent.title);
            cmd.Parameters.AddWithValue("@description", cevent.description);
            cmd.Parameters.AddWithValue("@event_start", cevent.start);
            cmd.Parameters.AddWithValue("@event_end", cevent.end);

            key = (int)cmd.ExecuteScalar();
        }

        return key;

    }

    */

}
