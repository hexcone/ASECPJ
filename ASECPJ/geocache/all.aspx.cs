using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASECPJ.geocache
{
    public partial class view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //List<Geocache> geocacheList = GeocacheDb.retrieveGeocache();
            SqlDataSource_All.SelectCommand = "SELECT geocache.geocacheId, geocache.geocacheName, DATE_FORMAT(geocache.geocacheDateCreated, '%e %M %Y') AS geocacheDateCreated, `user`.username, COUNT(find.findId) AS noOfFind, (SELECT COUNT(*) FROM geocacheReport WHERE geocache.geocacheId = geocacheReport.geocacheId) AS noOfReport FROM geocache INNER JOIN `user` ON geocache.iduser = `user`.iduser LEFT JOIN find ON geocache.geocacheId = find.geocacheId GROUP BY geocache.geocacheId ORDER BY geocache.geocacheDateCreated DESC;";

        }

        protected void createButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("create.aspx");
        }

        protected void filterButton_Click(object sender, EventArgs e)
        {
            string[] geocacheDifficulty = { difficultyLabel.Text.Substring(0, 1), difficultyLabel.Text.Substring(4, 1) };
            string keyword = keywordTextBox.Text;
            
            string sortBy = sortDropDownList.SelectedItem.Text;

            SqlDataSource_All.SelectCommand = null;
            SqlDataSource_All.SelectParameters.Clear();

            SqlDataSource_All.SelectCommand = "SELECT geocache.geocacheId, geocache.geocacheName, DATE_FORMAT(geocache.geocacheDateCreated, '%e %M %Y') AS geocacheDateCreated, `user`.username, COUNT(find.findId) AS noOfFind , (SELECT COUNT(*) FROM geocacheReport WHERE geocache.geocacheId = geocacheReport.geocacheId) AS noOfReport FROM geocache INNER JOIN `user` ON geocache.iduser = `user`.iduser LEFT JOIN find ON geocache.geocacheId = find.geocacheId WHERE (geocacheDifficulty BETWEEN @geocacheDifficultyBottomBound AND @geocacheDifficultyTopBound) ";

            if (!keyword.Equals(""))
            {
                SqlDataSource_All.SelectCommand += "AND (`user`.username LIKE @username OR geocacheName LIKE @geocacheName OR geocacheDescription LIKE @geocacheDescription) ";
            }

            SqlDataSource_All.SelectCommand += "GROUP BY geocache.geocacheId ";

            if (!sortBy.Equals(null))
            {
                if (sortBy.Equals("Newest First"))
                {
                    SqlDataSource_All.SelectCommand += "ORDER BY geocacheDateCreated DESC ";
                }
                if (sortBy.Equals("Oldest First"))
                {
                    SqlDataSource_All.SelectCommand += "ORDER BY geocacheDateCreated ASC ";
                }
                if (sortBy.Equals("Most Found First"))
                {
                    SqlDataSource_All.SelectCommand += "ORDER BY noOfFind DESC ";
                }
                if (sortBy.Equals("Least Found First"))
                {
                    SqlDataSource_All.SelectCommand += "ORDER BY noOfFind ASC ";
                }
            }
            

            SqlDataSource_All.SelectParameters.Add("@geocacheDifficultyBottomBound", geocacheDifficulty[0]);
            SqlDataSource_All.SelectParameters.Add("@geocacheDifficultyTopBound", geocacheDifficulty[1]);
            if (!keyword.Equals(""))
            {
                SqlDataSource_All.SelectParameters.Add("@username", "%" + keyword + "%");
                SqlDataSource_All.SelectParameters.Add("@geocacheName", "%" + keyword + "%");
                SqlDataSource_All.SelectParameters.Add("@geocacheDescription", "%" + keyword + "%");
            }
           

            ListView1.DataBind();
        }

        protected String getUrl(object geocacheId)
        {
            return "view.aspx?id=" + geocacheId;

        }

        protected String getNoOfFind(object noOfFind)
        {
            return noOfFind + " times";

        }

        protected String getStyle(object noOfReport)
        {
            if (int.Parse(noOfReport.ToString()) > 5)
            {
                return "color: lightgrey; ";
            }
            else
            {
                return "";
            }
        }

        protected Color getColor(object noOfReport)
        {
            if (int.Parse(noOfReport.ToString()) > 5)
            {
                return Color.LightGray;
            }
            else
            {
                return Color.Black;
            }
        }
    }
}