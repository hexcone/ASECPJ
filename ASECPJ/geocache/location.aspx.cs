using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASECPJ.geocache
{
    public partial class location : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected String getUrl(object geocacheId)
        {
            return "view.aspx?id=" + geocacheId;

        }

        protected String getDistance(object distance)
        {
            return distance + " km away";

        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            SqlDataSource_Near.SelectCommand = null;
            SqlDataSource_Near.SelectParameters.Clear();
            SqlDataSource_Near.SelectCommand = "SELECT geocache.geocacheId, geocache.geocacheName, DATE_FORMAT(geocache.geocacheDateCreated, '%e %M %Y') AS geocacheDateCreated, `user`.username, ROUND((6378.1 * 2 * ASIN(SQRT( POWER(SIN((@latitude1 - abs(geocacheLatitude)) * pi()/180 / 2),2) + COS(@latitude2 * pi()/180 ) * COS( abs(geocacheLatitude) *  pi()/180) * POWER(SIN((@longitude - geocacheLongitude) *  pi()/180 / 2), 2) ))),2) AS `distance` FROM geocache INNER JOIN `user` ON geocache.iduser = `user`.iduser ORDER BY `distance` ASC limit 10;";
            SqlDataSource_Near.SelectParameters.Add("@latitude1", latitudeTextBox.Text);
            SqlDataSource_Near.SelectParameters.Add("@latitude2", latitudeTextBox.Text);
            SqlDataSource_Near.SelectParameters.Add("@longitude", longitudeTextBox.Text);
        }
    }
}