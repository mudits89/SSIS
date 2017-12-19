using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

    public partial class EmployeeEditDelete : System.Web.UI.Page
    {
        SSISEntities context;
        string requisitionID;
        protected void Page_Load(object sender, EventArgs e)
        {
            context = new SSISEntities();
            requisitionID = Request.QueryString["ID"].ToString();


            requisitionlbl.Text = requisitionID;
            //GridView1.DataSource = context.Requisition_Items.Where(x => x.Requisition_ID == rid).ToList();
            //GridView1.DataBind();

        }

    }
