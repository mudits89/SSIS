using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Store_ChangePurchaseOrder : System.Web.UI.Page
{
    SSISEntities model = new SSISEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        EntityDataSource1.WhereParameters.Clear();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Detail")
        {
            string[] arg = new string[3];
            arg = e.CommandArgument.ToString().Split(';');

            String orderid = arg[0];
            String userID = arg[1];

            String Order_Date = arg[2];
            Response.Redirect("Store_ChangePurchaseOrderDetails.aspx?order_id=" + orderid + "&user_id=" + userID + "&Order_Date=" + Order_Date);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        EntityDataSource1.Where = "it.[Order_ID]=@Category OR it.[User_ID]=@Category";// OR it.[Order_Date]=@Datetime";
        EntityDataSource1.WhereParameters.Add("Category", TypeCode.Int32, TextBox1.Text);
    }

    protected void SeeAll_Click(object sender, EventArgs e)
    {
        EntityDataSource1.EntitySetName = "Purchase_Order";
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
       
    }
}