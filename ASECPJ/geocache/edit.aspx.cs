using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASECPJ.geocache
{
    public partial class edit : System.Web.UI.Page
    {
        string geocacheId;
        Geocache geocache;
        protected void Page_Load(object sender, EventArgs e)
        {
            geocacheId = Request.QueryString["id"];
            geocache = GeocacheDb.retrieveGeocache(geocacheId);

        }

        protected void backButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("view.aspx");
        }
    }
}