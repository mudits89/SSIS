using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class RequisitionHistoryDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Int32.Parse(Session["Requisition_ID"].ToString());

                using (SSISEntities ctx = new SSISEntities())
                {
                    Stationery_Requisition sr = ctx.Stationery_Requisition.Where(x => x.Requisition_ID == id).First();
                    lblRequistionFormID.Text = sr.Requisition_ID.ToString();
                    lblRequistionDate.Text = Convert.ToDateTime(sr.Requisition_Date).ToString("dd-MMMMM-yyyy");
                    lblSubmittedBy.Text = sr.Employee.Name.ToString();
                    txtReason.Text = sr.Reason.ToString();
                }
            }
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            Response.Redirect("Departmenthead_history.aspx");
        }
    }
