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

            if (!Page.IsPostBack)
            {
                nameTextBox.Text = geocache.geocacheName;
                descriptionTextBox.Text = geocache.geocacheDescription;
                latitudeTextBox.Text = geocache.geocacheLatitude;
                longitudeTextBox.Text = geocache.geocacheLongitude;
                verificationCodeLabel.Text = geocache.geocacheVerificationId;
                difficultyDropDownList.SelectedValue = geocache.geocacheDifficulty.ToString();
            }
        }

        protected void backButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("view.aspx");
        }

        //protected string getGeocacheName()
        //{
        //    return geocache.geocacheName;
        //}

        //protected string getGeocacheDescription()
        //{
        //    return geocache.geocacheDescription;
        //}

        //protected string getGeocacheLatitude()
        //{
        //    return geocache.geocacheLatitude;
        //}

        //protected string getGeocacheLongitude()
        //{
        //    return geocache.geocacheLongitude;
        //}

        //protected string getGeocacheVerificationId()
        //{
        //    return geocache.geocacheVerificationId;
        //}

        protected void updateButton_Click(object sender, EventArgs e)
        {
            string geocacheImage = "";

            if (imageFileUpload.HasFile)
            {
                try
                {
                    if (imageFileUpload.PostedFile.ContentType == "image/jpeg")
                    {
                        if (imageFileUpload.PostedFile.ContentLength < 10485760)
                        {
                            geocacheImage = Guid.NewGuid().ToString().Substring(0, 8) + System.IO.Path.GetExtension(imageFileUpload.PostedFile.FileName);
                            //string filename = Path.GetFileName(imageFileUpload.FileName);
                            imageFileUpload.PostedFile.SaveAs(Server.MapPath("uploads/") + geocacheImage);
                        }
                        else
                        {
                            //StatusLabel.Text = "Upload status: The file has to be less than 100 kb!";
                        }
                    }
                    else
                    {
                        //StatusLabel.Text = "Upload status: Only JPEG files are accepted!";
                    }
                }
                catch (Exception ex)
                {
                    // StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
            else
            {
                geocacheImage = geocache.geocacheImage;
            }
            

            GeocacheDb.updateGeocache(geocacheId, nameTextBox.Text, descriptionTextBox.Text, Convert.ToInt32(difficultyDropDownList.SelectedValue),
                latitudeTextBox.Text, longitudeTextBox.Text, geocacheImage);
            Response.Redirect("view.aspx?id=" + geocacheId);
        }
    }
}