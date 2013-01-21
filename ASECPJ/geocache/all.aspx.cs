using System;
using System.Collections.Generic;
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
            List<Geocache> geocacheList = GeocacheDb.retrieveGeocache();


        }

        protected void createButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("create.aspx");
        }

        protected void filterButton_Click(object sender, EventArgs e)
        {

        }

        protected String getUrl(object geocacheId)
        {
            return "/view.aspx?id=" + geocacheId;

        }

    }
}