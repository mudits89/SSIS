using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string output = "";
        Response.Clear();
        Response.CacheControl = "no-cache";
        Response.ContentType = "text/xml";
        Response.ContentType = "application/json";

        if (Request.Files["file"] != null)
        {
            HttpPostedFile MyFile = Request.Files["file"];
            //Setting location to upload files
            string TargetLocation = Server.MapPath("~/Signature/");
            try
            {
                if (MyFile.ContentLength > 0)
                {
                    //Determining file name. You can format it as you wish.
                    string FileName = MyFile.FileName;
                    //Determining file size.
                    int FileSize = MyFile.ContentLength;
                    //Creating a byte array corresponding to file size.
                    byte[] FileByteArray = new byte[FileSize];
                    //Posted file is being pushed into byte array.
                    MyFile.InputStream.Read(FileByteArray, 0, FileSize);
                    //Uploading properly formatted file to server
                    MyFile.SaveAs(TargetLocation + FileName);

                    output = String.Format("{{\"file\":\"{0}\", \"caption\":\"{1}\", \"location\":\"{2}\" }}",
                        TargetLocation + FileName, Request.Params["caption"], Request.Params["location"]);
                }
            }
            catch (Exception exp)
            {
                output = String.Format("\"{0}\"", exp.ToString());
            }
        }
        Response.Write(output);
        Response.End();
    }
}