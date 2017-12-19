using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class Departmenthead_history : System.Web.UI.Page
    {
        static int deptHeadId;

        protected void Page_Load(object sender, EventArgs e)
        {
            LoginDetails loginDetails = User.Identity as LoginDetails;
            string userId = loginDetails.UserId;
            deptHeadId = Convert.ToInt32(userId);
            EntityDataSource1.Where = "it.[Status]!='Pending' AND it.[Employee].[Reportsto]=" + deptHeadId + "";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            filterGridview();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "details")
            {
                string[] arg = e.CommandArgument.ToString().Split(';');
                Session["Requisition_ID"] = arg[0];
                Session["Requisition_Date"] = arg[1];
                Session["Name"] = arg[2];
                Response.Redirect("RequisitionHistoryDetails.aspx");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            filterGridview();
        }

        protected void filterGridview()
        {
            if (!ddlSearchBy.SelectedValue.Equals("Initial"))
            {
                EntityDataSource1.Where = "it.[Status] != 'Pending' AND CAST(" + ddlSearchBy.SelectedValue + " as System.String) LIKE '%'+ @SearchInput +'%' AND it.[Employee].[Reportsto]=" + deptHeadId;
            }
            else if (ddlSearchBy.SelectedValue.Equals("Initial") && txtSearch.Equals(String.Empty))
            {
                EntityDataSource1.Where = "it.[Status] != 'Pending' AND it.[Employee].[Reportsto]=" + deptHeadId;
            }
            else if (ddlSearchBy.SelectedValue.Equals("Initial") && !txtSearch.Equals(String.Empty))
            {
                EntityDataSource1.Where = "(it.[Status] != 'Pending' AND CAST(it.[Requisition_Date] as System.String) LIKE '%'+ @SearchInput +'%'AND it.[Employee].[Reportsto]=" + deptHeadId + ")" + "OR (it.[Status] != 'Pending' AND CAST(it.[Employee].[Name] as System.String) LIKE '%'+ @SearchInput +'%' AND it.[Employee].[Reportsto]=" + deptHeadId + ")";
            }
        }

    }
