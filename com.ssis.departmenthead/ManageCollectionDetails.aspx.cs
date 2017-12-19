using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class ManageCollectionDetails : System.Web.UI.Page
{
    static int deptHeadId;

    protected void Page_Load(object sender, EventArgs e)
    {
        LoginDetails loginDetails = User.Identity as LoginDetails;
        string userId = loginDetails.UserId;
        deptHeadId = Convert.ToInt32(userId);
        EntityDataSource1.Where = "it.[Reportsto]=" + deptHeadId + "";

        if (!IsPostBack)
        {
            using (SSISEntities ctx = new SSISEntities())
            {
                int depRep = (int)ctx.Departments.Where(x => x.Department_Head == deptHeadId).Select(x => x.Department_Representative).First();
                string depRepName = ctx.Employees.Where(x => x.Id == depRep).Select(x => x.Name).First();
                int depCp = (int)ctx.Departments.Where(x => x.Department_Head == deptHeadId).Select(x => x.CollectionPoint_ID).First();
                lblCurrentDepartmentRep.Text = depRepName.ToString();
                ddlDepartmentRep.SelectedValue = depRep.ToString();
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
            //Revert role of current nominated employee
            int depRep = (int)ctx.Departments.Where(x => x.Department_Head == deptHeadId).Select(x => x.Department_Representative).First();
            User u = ctx.Users.Where(x => x.UserId == depRep).First();
            if (u.RoleId == 3)
            {
                u.RoleId = 3;
            }
            else
            {
                u.RoleId = 1;
            }

            //Assign new rep / collection point
            int newRep = Int32.Parse(ddlDepartmentRep.SelectedValue);
            Department d = ctx.Departments.Where(x => x.Department_Head == deptHeadId).First();
            User r = ctx.Users.Where(x => x.UserId == newRep).First();
            d.Department_Representative = newRep;
            d.CollectionPoint_ID = Int32.Parse(rblCollectionPoint.SelectedValue);
            if (r.RoleId == 3)
            {
                r.RoleId = 3;
            }
            else
            {
                r.RoleId = 2;
            }
            ctx.SaveChanges();
        }

        ShowMessage("Collection details updated successfully", MessageType.Success);
    }

    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
}