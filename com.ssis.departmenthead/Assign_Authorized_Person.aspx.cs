using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


   

    public partial class Assign_Authorized_Person : System.Web.UI.Page
    {
        static int dhhid;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoginDetails loginDetails = User.Identity as LoginDetails;
            string userId = loginDetails.UserId;
            dhhid = Convert.ToInt32(userId);
            EntityDataSource1.Where = "it.[Reportsto]=" + dhhid + "";

            if (!IsPostBack)
            {
                
                this.BindGrid();

                bool notiChecker =(bool) Session["notiCheck"];
                if (notiChecker)
                {
                    ShowMessage("Authorized employee updated successfully", MessageType.Success);

                    notiChecker = false;
                    Session["notiCheck"] = notiChecker;
                }
            }
        }

        private void BindGrid()
        {
            using (SSISEntities ctx = new SSISEntities())
            {
                int depAutPerson = Convert.ToInt32(ctx.Departments.Where(x => x.Department_Head == dhhid).Select(x => x.Department_Authorized_Person).First());
                GridView1.DataSource = ctx.Employees.Where(x => x.Id == depAutPerson).ToList();
                GridView1.DataBind();
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            using (SSISEntities ctx = new SSISEntities())
            {
                //Revert role of current nominated employee
                int depAutPerson = Convert.ToInt32(ctx.Departments.Where(x => x.Department_Head == dhhid).Select(x => x.Department_Authorized_Person).First());
                if (depAutPerson != 0)
                {
                    User u = ctx.Users.Where(x => x.UserId == depAutPerson).First();
                    u.RoleId = 1;
                }

                //Assign new rep
                int newAutPerson = Int32.Parse(DropDownList1.SelectedValue);
                Department dep = ctx.Departments.Where(y => y.Department_Head == dhhid).First();
                User r = ctx.Users.Where(x => x.UserId == newAutPerson).First();

                dep.Department_Authorized_Person = newAutPerson;
                r.RoleId = 3;
                ctx.SaveChanges();
            }
            Session["notiCheck"] = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "remove")
            {
                using (SSISEntities ctx = new SSISEntities())
                {
                    //Revert role of current nominated employee
                    int depAutPerson = Convert.ToInt32(ctx.Departments.Where(x => x.Department_Head == dhhid).Select(x => x.Department_Authorized_Person).First());
                    Department dep = ctx.Departments.Where(x => x.Department_Head == dhhid).First();
                    User u = ctx.Users.Where(x => x.UserId == depAutPerson).First();
                    if (dep.Department_Representative == depAutPerson)
                    {
                        u.RoleId = 2;
                    }
                    else { u.RoleId = 1; }

                    dep.Department_Authorized_Person = 0;
                    ctx.SaveChanges();
                }                
                this.BindGrid();
                Session["notiCheck"] = true;
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void ShowMessage(string Message, MessageType type)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
        }

    }
