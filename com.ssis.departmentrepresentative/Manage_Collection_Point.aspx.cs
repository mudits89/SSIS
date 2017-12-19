using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class Manage_Collection_Point : System.Web.UI.Page
    {
        static int deptRepId;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoginDetails loginDetails = User.Identity as LoginDetails;
            string userId = loginDetails.UserId;
            deptRepId = Convert.ToInt32(userId);


            if (!IsPostBack)
            {
                using (SSISEntities ctx = new SSISEntities())
                {

                    int depCp = (int)ctx.Departments.Where(x => x.Department_Representative == deptRepId).Select(x => x.CollectionPoint_ID).First();
                    rblCollectionPoint.SelectedValue = depCp.ToString();
                }
                using (SSISEntities ctx = new SSISEntities())
                {
                    var qry = ctx.CollectionPoints.ToList()
                        .Select(x => new { id = x.CollectionPoint_ID, cpAndTime = x.CollectionPoint_Name + " | " + x.CollectionPoint_Time });
                    rblCollectionPoint.DataSource = qry;
                    rblCollectionPoint.DataTextField = "cpAndTime";
                    rblCollectionPoint.DataValueField = "id";
                    rblCollectionPoint.DataBind();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SSISEntities ctx = new SSISEntities())
            {
                Department d = ctx.Departments.Where(x => x.Department_Representative == deptRepId).First();
                d.CollectionPoint_ID = Int32.Parse(rblCollectionPoint.SelectedValue);
                ctx.SaveChanges();

            }
            ShowMessage("Collection details updated successfully", MessageType.Success);
        }
        protected void ShowMessage(string Message, MessageType type)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
        }
    }
    