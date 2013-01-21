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

    private static string connectionString = ConfigurationManager.ConnectionStrings["asecpjConnectionString"].ConnectionString;

    public static Guid createGeocache(string geocacheName, string geocacheDescription, int geocacheDifficulty, string geocacheCoordinates, char geocacheBlock, 
        char geocacheLevel, string geocacheImage, DateTime geocacheDateCreated, string geocacheVerificationId, string geocacheStatus)
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
        cmd.CommandText = "INSERT INTO geocache(geocacheId, geocacheName, geocacheDescription, geocacheDifficulty, geocacheCoordinates, geocacheBlock, " +
            "geocacheLevel, geocacheImage, geocacheDateCreated, geocacheVerificationId, geocacheStatus, iduser) VALUES (@geocacheId, " +
            "@geocacheName, @geocacheDescription, @geocacheDifficulty, @geocacheCoordinates, @geocacheBlock, " +
            "@geocacheLevel, @geocacheImage, @geocacheDateCreated, @geocacheVerificationId, " +
            "@geocacheStatus, @iduser)";
        cmd.Prepare();

        cmd.Parameters.AddWithValue("@geocacheId", geocacheId.ToString());
        cmd.Parameters.AddWithValue("@geocacheName", geocacheName);
        cmd.Parameters.AddWithValue("@geocacheDescription", geocacheDescription);
        cmd.Parameters.AddWithValue("@geocacheDifficulty", geocacheDifficulty);
        cmd.Parameters.AddWithValue("@geocacheCoordinates", geocacheCoordinates);
        cmd.Parameters.AddWithValue("@geocacheBlock", geocacheBlock);
        cmd.Parameters.AddWithValue("@geocacheLevel", geocacheLevel);
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

    public static List<Geocache> retrieveGeocache(string keyword, int[] geocacheDifficulty, string sortBy, char[] geocacheBlock, 
        char[] geocacheLevel)
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
        int[] iduser = {1,2,3};

        cmd.CommandText = "SELECT geocacheId, geocacheName, geocacheDateCreated FROM geocache WHERE (geocacheDifficulty BETWEEN @geocacheDifficultyBottomBound AND @geocacheDifficultyTopBound) ";
        if (!keyword.Equals(null))
        {
            cmd.CommandText += "AND (FIND_IN_SET (iduser, @iduser) OR geocacheName=@geocacheName OR geocacheDescription=@geocacheDescription) ";
        }
        if (!geocacheBlock.Equals(null))
        {
            cmd.CommandText += "AND FIND_IN_SET (geocacheBlock, @geocacheBlock) ";
        }
        if (!geocacheLevel.Equals(null))
        {
            cmd.CommandText += "AND FIND_IN_SET (geocacheLevel, @geocacheLevel) ";
        }
        if (!sortBy.Equals(null))
        {
            if (sortBy.Equals("Newest First"))
            {
                cmd.CommandText += "ORDER BY geocacheDateCreated DESC";
            }
            if (sortBy.Equals("Oldest First"))
            {
                cmd.CommandText += "ORDER BY geocacheDateCreated ASC";
            }
        }
        cmd.Prepare();

        cmd.Parameters.AddWithValue("@geocacheDifficultyBottomBound", geocacheDifficulty[0]);
        cmd.Parameters.AddWithValue("@geocacheDifficultyTopBound", geocacheDifficulty[1]);
        if (!keyword.Equals(null))
        {
            cmd.Parameters.AddWithValue("@iduser", string.Join(",", iduser));
            cmd.Parameters.AddWithValue("@geocacheName", keyword);
            cmd.Parameters.AddWithValue("@geocacheDescription", keyword);
        }
        if (!geocacheBlock.Equals(null))
        {
            cmd.Parameters.AddWithValue("@geocacheBlock", string.Join(",", geocacheBlock));
        }
        if (!geocacheLevel.Equals(null))
        {
            cmd.Parameters.AddWithValue("@geocacheLevel", string.Join(",", geocacheLevel));
        }

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
