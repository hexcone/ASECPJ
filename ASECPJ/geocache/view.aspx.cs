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
        string geocacheId;
        string username;
        Geocache geocache;
        string findName;
        string findDescription;
        string findImage;
        DateTime findDateCreated;
        string findStatus;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("all.aspx");
            }
            geocacheId = Request.QueryString["id"];

            geocache = GeocacheDb.retrieveGeocache(geocacheId);
            username = GeocacheDb.retrieveUsername(geocache.iduser);
            geocacheNameLabel.DataBind();
            usernameLabel.DataBind();
            geocacheDateCreatedLabel.DataBind();
            geocacheImage.DataBind();
            geocacheDescriptionTextBox.DataBind();


            SqlDataSource_Find.SelectCommand = "SELECT find.findId, find.findName, find.findDescription, find.findImage, find.findDateCreated, `user`.username, find.findStatus FROM find INNER JOIN `user` ON find.idUser = `user`.iduser WHERE find.geocacheId = @geocacheId";
            SqlDataSource_Find.SelectParameters.Add("@geocacheId", geocacheId);

        }

        protected void reportButton_Click(object sender, EventArgs e)
        {

        }

        protected void editButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("edit.aspx?id=" + geocacheId);

        }

        protected void submitButton_Click(object sender, EventArgs e)
        {

            if (!(GeocacheDb.verifyCode(verificationCodeTextBox.Text, geocacheId)))
            {
                //validation error
            }
            else
            {
                if (findImageFileUpload.HasFile)
                {
                    try
                    {
                        if (findImageFileUpload.PostedFile.ContentType == "image/jpeg")
                        {
                            if (findImageFileUpload.PostedFile.ContentLength < 10485760)
                            {
                                string imageName = Guid.NewGuid().ToString().Substring(0, 8);
                                findImage = imageName + ".bmp";
                                System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(findImageFileUpload.PostedFile.InputStream);
                                bmpPostedImage.Save(Server.MapPath(@"uploads/") + imageName + ".bmp");
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

                findName = findNameTextBox.Text;
                findDescription = findDescriptionTextBox.Text;
                findDateCreated = DateTime.Now;
                findStatus = "live";
                GeocacheDb.createFind(findName, findDescription, findImage, findDateCreated, findStatus, geocacheId);

                Response.Redirect("view.aspx?id=" + geocacheId);
            }
        }

        protected string getGeocacheName()
        {
            return geocache.geocacheName;
        }

        protected string getUsername()
        {
            return username;
        }

        protected string getGeocacheDateCreated()
        {
            return geocache.geocacheDateCreated.ToLongDateString();
        }

        protected string getGeocacheImage()
        {
            return "uploads\\" + geocache.geocacheImage;
        }

        protected string getGeocacheDescription()
        {
            return geocache.geocacheDescription;
        }

        protected string getFindImage(string findImage)
        {
            return "uploads\\" + findImage;
        }

        protected string getFindDateCreated(string findDateCreated)
        {
            return DateTime.Parse(findDateCreated).ToLongDateString();
        }

        protected void reportGeocacheButton_Click(object sender, EventArgs e)
        {
            GeocacheDb.createGeocacheReport(geocacheReasonRadioButtonList.SelectedValue, reportGeocacheTextBox.Text, geocacheId);
        }

        protected void filterButton_Click(object sender, EventArgs e)
        {
            GeocacheDb.createFindReport(findReasonRadioButtonList.SelectedValue, reportFindTextBox.Text, findIdHiddenField.Value);
        }


    }
}