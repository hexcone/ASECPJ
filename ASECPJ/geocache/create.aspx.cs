using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Script.Serialization;
using System.Web.Script.Services;

namespace ASECPJ.geocache
{
    public partial class create : System.Web.UI.Page
    {
        string geocacheName;
        string geocacheDescription;
        int geocacheDifficulty;
        string geocacheCoordinates;
        string geocacheImage;
        DateTime geocacheDateCreated;
        string geocacheVerificationId;
        string geocacheStatus;

        protected void Page_Load(object sender, EventArgs e)
        {
            string verificationCode = Guid.NewGuid().ToString().Substring(0, 8);
            verificationCodeLabel.Text = verificationCode;
        }

        protected void createButton_Click(object sender, EventArgs e)
        {
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

            geocacheName = nameTextBox.Text;
            geocacheDescription = descriptionTextBox.Text;
            geocacheDifficulty = Convert.ToInt32(difficultyLabel.Text);
            geocacheCoordinates = latitudeTextBox.Text + "," + longitudeTextBox.Text;
            //geocacheImage = "/image.jpeg";
            geocacheDateCreated = DateTime.Now;
            geocacheVerificationId = verificationCodeLabel.Text; 
            geocacheStatus = "pending";
            GeocacheDb.createGeocache(geocacheName, geocacheDescription, geocacheDifficulty, geocacheCoordinates, geocacheImage,
                geocacheDateCreated, geocacheVerificationId, geocacheStatus);
             
        }

    }
}