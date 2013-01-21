using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Script.Serialization;
using System.Web.Script.Services;

namespace HTML5DragNDrpFileUpload
{
    public partial class _Default : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext postedContext = HttpContext.Current;
            HttpPostedFile file = postedContext.Request.Files[0];
            string name = file.FileName;
            byte[] binaryWriteArray = new
            byte[file.InputStream.Length];
            file.InputStream.Read(binaryWriteArray, 0,
            (int)file.InputStream.Length);
            FileStream objfilestream = new FileStream(Server.MapPath("uploads//" + name), FileMode.Create, FileAccess.ReadWrite);
            objfilestream.Write(binaryWriteArray, 0,
            binaryWriteArray.Length);
            objfilestream.Close();
            string[][] JaggedArray = new string[1][];
            JaggedArray[0] = new string[] { "File was uploaded successfully" };
            JavaScriptSerializer js = new JavaScriptSerializer();
            string strJSON = js.Serialize(JaggedArray);
            Response.Write(strJSON);
            Response.End();
        }
    }
}
