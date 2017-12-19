using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CrystalReportSource1.ReportDocument.SetDatabaseLogon("lwin", "abc123");
            CrystalReportSource1.ReportDocument.SetParameterValue("categoryparam", "Clip");
            //CrystalReportSource1.ReportDocument.SetParameterValue("fromdateparam", fromdate.SelectedItem);
            //CrystalReportSource1.ReportDocument.SetParameterValue("todateparam", todate.SelectedItem);
            CrystalReportViewer1.DataBind();
        }

        protected void Processbtn_Click(object sender, EventArgs e)
        {
            CrystalReportSource1.ReportDocument.SetParameterValue("categoryparam", CATDropDownList.Text);
            CrystalReportSource1.ReportDocument.SetParameterValue("fromdateparam", fromdate.SelectedValue);
            CrystalReportSource1.ReportDocument.SetParameterValue("todateparam", todate.SelectedValue);
            CrystalReportViewer1.DataBind();
        }
    }
