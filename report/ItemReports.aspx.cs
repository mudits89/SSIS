using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class ItemReports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CrystalReportSource1.ReportDocument.SetDatabaseLogon("lwin", "abc123");
            CrystalReportSource1.ReportDocument.SetParameterValue("categoryparam", "Clip");
            CrystalReportViewer1.DataBind();
        }

        protected void processbtn_Click(object sender, EventArgs e)
        {
            CrystalReportSource1.ReportDocument.SetParameterValue("categoryparam", CATDropDownList.Text);
            CrystalReportSource1.ReportDocument.SetParameterValue("fromdate", fromdate.SelectedValue);
            CrystalReportSource1.ReportDocument.SetParameterValue("todate", todate.SelectedValue);
            CrystalReportViewer1.DataBind();
        }
    }
