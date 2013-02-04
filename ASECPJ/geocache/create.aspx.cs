using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Drawing;
using Anu.Steganography.Bitmap.Header;

namespace ASECPJ.geocache
{
    public partial class create : System.Web.UI.Page
    {
        string geocacheName;
        string geocacheDescription;
        int geocacheDifficulty;
        string geocacheLatitude;
        string geocacheLongitude;
        string geocacheImage;
        DateTime geocacheDateCreated;
        string geocacheVerificationId;
        string geocacheStatus;
        string iduser = "2";

        protected void Page_Load(object sender, EventArgs e)
        {
            string verificationCode = Guid.NewGuid().ToString().Replace("-", "");
            verificationCodeLabel.Text = verificationCode.Substring(0, 8);
        }

        protected void createButton_Click(object sender, EventArgs e)
        {

            if (imageFileUpload.HasFile)
            {
                try
                {
                    string imageName = Guid.NewGuid().ToString().Substring(0, 8);
                    geocacheImage = imageName + ".bmp";
                    System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(imageFileUpload.PostedFile.InputStream);
                    bmpPostedImage.Save(Server.MapPath(@"uploads/") + imageName + ".bmp");
                    
                    //bmpPostedImage.Save(Server.MapPath(@"uploads/") + imageName + ".bmp");
                    //Stegano encryptStegano = new Stegano();
                    //encryptStegano.HideMessage(geocacheImage, geocacheImage, iduser);
                }
                catch (Exception ex)
                {
                    // StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }

            geocacheName = nameTextBox.Text;
            geocacheDescription = descriptionTextBox.Text;
            geocacheDifficulty = Convert.ToInt32(difficultyLabel.Text);
            geocacheLatitude = latitudeTextBox.Text;
            geocacheLongitude = longitudeTextBox.Text;
            //geocacheImage = "/image.jpeg";
            geocacheDateCreated = DateTime.Now;
            geocacheVerificationId = verificationCodeLabel.Text;
            geocacheStatus = "pending";
            GeocacheDb.createGeocache(geocacheName, geocacheDescription, geocacheDifficulty, geocacheLatitude, geocacheLongitude, geocacheImage,
                geocacheDateCreated, geocacheVerificationId, geocacheStatus);

            Response.Redirect("all.aspx");
        }

        protected void CustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //string imageName = Guid.NewGuid().ToString().Substring(0, 8);
            //string geocacheImageTemp = imageName + ".bmp";
            //System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(imageFileUpload.PostedFile.InputStream);
            //bmpPostedImage.Save(Server.MapPath(@"temp\") + imageName + ".bmp");
            ////bmpPostedImage.Save("C:\\Users\\Juliana\\Documents\\GitHub\\ASECPJ\\ASECPJ\\geocache\\temp\\" + imageName + ".bmp");

            //Stegano decryptStegano = new Stegano();
            //string message = decryptStegano.RetrieveMessage(Server.MapPath(@"temp\") + imageName + ".bmp");
            ////string message = decryptStegano.RetrieveMessage("C:\\Users\\Juliana\\Documents\\GitHub\\ASECPJ\\ASECPJ\\geocache\\temp\\3a902149.bmp");
            
            //if (message.Equals(""))
            //{
            //    Response.Redirect("true");
            //    args.IsValid = true;

            //}
            //else
            //{
            //    Response.Redirect("false");
            //    args.IsValid = false;
            //}

            args.IsValid = true;
        }
    }
}