using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASECPJ.geocache
{
    public partial class create : System.Web.UI.Page
    {
        string geocacheName;
        string geocacheDescription;
        int geocacheDifficulty;
        string geocacheCoordinates;
        char geocacheBlock;
        char geocacheLevel;
        string geocacheImage;
        DateTime geocacheDateCreated;
        string geocacheVerificationId;
        string geocacheStatus;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void createButton_Click(object sender, EventArgs e)
        {
            geocacheName = nameTextBox.Text;
            geocacheDescription = descriptionTextBox.Text;
            geocacheDifficulty = Convert.ToInt32(difficultyLabel.Text);
            geocacheCoordinates = latitudeTextBox.Text + "," + longitudeTextBox.Text;
            geocacheBlock = Convert.ToChar(blockDropDownList.SelectedValue); //this
            geocacheLevel = Convert.ToChar(levelDropDownList.SelectedValue); //this
            geocacheImage = "/image.jpeg"; //this
            geocacheDateCreated = DateTime.Now;
            geocacheVerificationId = Convert.ToString(Guid.NewGuid()); //this
            geocacheStatus = "pending";
            GeocacheDb.createGeocache(geocacheName, geocacheDescription, geocacheDifficulty, geocacheCoordinates, geocacheBlock, geocacheLevel, geocacheImage,
                geocacheDateCreated, geocacheVerificationId, geocacheStatus);
             
        }
    }
}