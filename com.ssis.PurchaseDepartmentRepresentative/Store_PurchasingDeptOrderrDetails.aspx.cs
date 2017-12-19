using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class Store_PurchasingDeptOrderrDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Invoice")
            {
                string[] args = new string[4];
                args = e.CommandArgument.ToString().Split(';');
                String Item = args[0];
                String suppid = args[1];
                String orderid = args[2];
                string status = args[3];
                Response.Redirect("Store_PurchaseDeptOrderInvoice.aspx?item_Number=" + Item + "&supplier_id=" + suppid + "&order_id=" + orderid + "&status=" + status);
            }
        }
    }
