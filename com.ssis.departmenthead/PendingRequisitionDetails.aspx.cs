using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class PendingRequisitionDetails : System.Web.UI.Page
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
                }
            }
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            string reason = txtReason.Text;
            int id = Int32.Parse(Session["Requisition_ID"].ToString());

            using (SSISEntities ctx = new SSISEntities())
            {
                Stationery_Requisition sr = ctx.Stationery_Requisition.Where(x => x.Requisition_ID == id).First();
                sr.Status = "Approved";
                sr.Reason = reason;
                ctx.SaveChanges();
            }
            Response.Redirect("PendingRequisitions.aspx");
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            string reason = txtReason.Text;
            int id = Int32.Parse(Session["Requisition_ID"].ToString());

            using (SSISEntities ctx = new SSISEntities())
            {
                Stationery_Requisition sr = ctx.Stationery_Requisition.Where(x => x.Requisition_ID == id).First();
                sr.Status = "Rejected";
                sr.Reason = reason;
                ctx.SaveChanges();
            }
            Response.Redirect("PendingRequisitions.aspx");

        }
    }
