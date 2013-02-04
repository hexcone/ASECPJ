using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASECPJ.geocache
{
    public partial class record : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource_Geocache.SelectCommand = "SELECT geocache.geocacheId, geocache.geocacheName, DATE_FORMAT(geocache.geocacheDateCreated, '%e %M %Y') AS geocacheDateCreated FROM geocache INNER JOIN `user` ON geocache.iduser = `user`.iduser ORDER BY geocacheDateCreated DESC";

            SqlDataSource_Find.SelectCommand = "SELECT find.findId, find.findName, DATE_FORMAT(find.findDateCreated, '%e %M %Y') AS findDateCreated, find.geocacheId FROM find INNER JOIN `user` ON find.iduser = `user`.iduser ORDER BY findDateCreated DESC";
        }

        protected String getUrl(object geocacheId)
        {
            return "view.aspx?id=" + geocacheId;

        }
    }
}