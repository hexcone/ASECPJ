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
        int geocacheId;
        protected void Page_Load(object sender, EventArgs e)
        {
            geocacheId = Int32.Parse(Request.QueryString["id"]);
        }

        protected void backButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("view.aspx");
        }
    }
}