using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASECPJ.geocache
{
    public partial class view1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Guid geocacheId = new Guid(Request.QueryString["id"]);
        }

        protected void reportButton_Click(object sender, EventArgs e)
        {

        }

        protected void editButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("edit.aspx?id=123");

        }


    }
}