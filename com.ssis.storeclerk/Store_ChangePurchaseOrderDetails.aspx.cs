using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Store_ChangePurchaseOrderDetails : System.Web.UI.Page
{
    SSISEntities model = new SSISEntities();
    protected void Page_Load(object sender, EventArgs e)
    {

        string order_ID = Request.QueryString["order_id"];
        string user_ID = Request.QueryString["user_id"];
        String order_Date = Request.QueryString["Order_Date"];
        String date = Convert.ToDateTime(order_Date).ToString("yyyy-MM-dd");
        lblorderid.Text = order_ID;
        lblorderdate.Text = date;
        lbluserID.Text = user_ID;

        EntityDataSource1.Where = "it.[Order_ID]=@order_ID";
        EntityDataSource1.WhereParameters.Add("order_ID", TypeCode.Int32, order_ID);
        foreach (GridViewRow row in GridView1.Rows)
        {
            string status = row.Cells[4].Text;
            if (status.Equals("Available") || status.Equals("Purchased") || status.Equals("Forwarded"))
            {
                LinkButton button = (LinkButton)row.FindControl("ChooseSupplier");
                button.Visible = false;
                //Button invoicebutton = (Button)row.FindControl("Invoice");
                //    invoicebutton.Visible = false;

            }
            else
            {
                LinkButton invoicebutton = (LinkButton)row.FindControl("Invoice");
                invoicebutton.Visible = false;
            }
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ChooseSupplier")
        {
            string[] arg = new string[3];
            arg = e.CommandArgument.ToString().Split(';');
            String orderid = arg[0];
            String item = arg[1];

            String supplierid = arg[2];
            Response.Redirect("Store_ChangeSupplierName.aspx?order_id=" + orderid + "&item_Number=" + item + "&supplier_id=" + supplierid);
        }
        else if (e.CommandName == "Invoice")
        {
            string[] args = new string[4];
            args = e.CommandArgument.ToString().Split(';');
            String Item = args[0];
            String suppid = args[1];
            String orderid = args[2];
            string status = args[3];
            Response.Redirect("Store_ViewInvoice.aspx?item_Number=" + Item + "&supplier_id=" + suppid + "&order_id=" + orderid + "&status=" + status);
        }

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Store_ChangePurchaseOrder.aspx");
    }
}
