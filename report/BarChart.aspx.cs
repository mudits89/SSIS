using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using System.Configuration;
using System.Data;
using CrystalDecisions.Shared;
using System.IO;


    public partial class BarChart : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["SSISConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            CrystalReportSource1.ReportDocument.SetDatabaseLogon("lwin", "abc123");
            CrystalReportSource1.ReportDocument.SetParameterValue("@category","Pen");
            //CrystalReportSource1.ReportDocument.SetParameterValue("fromdateparam", fromdate.SelectedItem);
            //CrystalReportSource1.ReportDocument.SetParameterValue("todateparam", todate.SelectedItem);
            CrystalReportViewer1.DataBind();

        }

        protected void loadbtn_Click(object sender, EventArgs e)
        {
            //CrystalReportProduct crp = new CrystalReportProduct();
            //crp172.27.243.210\
            //this.CrystalReportViewer1.ReportSource = crp;
            //this.CrystalReportViewer1.DataBind();

            //ReportDocument reportdocument = new ReportDocument();
            //reportdocument.Load(Server.MapPath("DateComparisonChart.rpt"));
            //ParameterFields paramFields = new ParameterFields();
            //ParameterField paramField = new ParameterField();
            //ParameterDiscreteValue paramDiscreteValue = new ParameterDiscreteValue();
            //ParameterRangeValue rangeVal = new ParameterRangeValue();
            //CrystalReportViewer1.ReportSource = reportdocument;
            //cn.Close();
            CrystalReportSource1.ReportDocument.SetParameterValue("@category", CATDropDownList.Text);
            CrystalReportSource1.ReportDocument.SetParameterValue("@fromdate", fromdate.SelectedValue);
            CrystalReportSource1.ReportDocument.SetParameterValue("@todate", todate.SelectedValue);
            //CrystalReportSource1.ReportDocument.SetParameterValue("Date Range", fromdate.SelectedValue,todate.SelectedValue);

            // CrystalReportViewer1.RefreshReport();
            CrystalReportViewer1.DataBind();
            //MemoryStream oStream;

            //oStream = (MemoryStream)CrystalReportSource1.ReportDocument.ExportToStream(ExportFormatType.PortableDocFormat);

            //Response.ContentType = "application/pdf";
            //Response.BinaryWrite(oStream.ToArray());

            //Response.End();
            //oStream.Flush();

            //oStream.Close();

            //oStream.Dispose();
        }
    }


//in case you want to export it as an attachment use the line below

/*

crReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Your Exported File Name");
        }
    }
    //}
}
*/