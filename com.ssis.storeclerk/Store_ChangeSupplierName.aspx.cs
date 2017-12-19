using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Store_ChangeSupplierName : System.Web.UI.Page
{
    int order_ID;
    SSISEntities model = new SSISEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        order_ID = Convert.ToInt32(Request.QueryString["order_id"]);
        string item_number = Request.QueryString["item_Number"];
        string supplier_ID = Request.QueryString["supplier_id"];
        lblItem.Text = item_number;
        EntityDataSource1.Where = "it.[Item_Number]=@item_Number && it.[Supplier_ID]!=@Supplier_ID";
        EntityDataSource1.WhereParameters.Add("Item_Number", TypeCode.String, item_number);
        EntityDataSource1.WhereParameters.Add("Supplier_ID", TypeCode.String, supplier_ID);
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        String item = row.Cells[2].Text;
        String supplierid = row.Cells[1].Text;
        Purchase_Order_Details update = model.Purchase_Order_Details.Where(x => x.Order_ID == order_ID && x.Item_Number == item).First();
        if (update != null)
        {
            update.Supplier_ID = supplierid;
            update.Status = "Pending";
            model.SaveChanges();
        }
        Purchase_Order order = model.Purchase_Order.Where(x => x.Order_ID == order_ID).First();
        var date = order.Order_Date;
        var user = order.User_ID;
        Response.Redirect("Store_ChangePurchaseOrderDetails.aspx?Order_ID=" + order_ID + "&Order_Date=" + date + "&user_id=" + user);

    }

    //protected void LinkButton1_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("Store_ChangePurchaseOrderDetails.aspx");
    //}
}