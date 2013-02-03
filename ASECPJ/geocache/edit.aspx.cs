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
            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("all.aspx");
            }
            geocacheId = Request.QueryString["id"];
            
            geocache = GeocacheDb.retrieveGeocache(geocacheId);
            difficultyDropDownList.SelectedValue = geocache.geocacheDifficulty.ToString();
            nameTextBox.DataBind();
            descriptionTextBox.DataBind();
            latitudeTextBox.DataBind();
            longitudeTextBox.DataBind();

        }

        protected void backButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("view.aspx");
        }

        protected string getGeocacheName()
        {
            return geocache.geocacheName;
        }

        protected string getGeocacheDescription()
        {
            return geocache.geocacheDescription;
        }

        protected string getGeocacheLatitude()
        {
            return geocache.geocacheLatitude;
        }

        protected string getGeocacheLongitude()
        {
            return geocache.geocacheLongitude;
        }
    }
}