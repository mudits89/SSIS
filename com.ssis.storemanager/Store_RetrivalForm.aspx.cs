using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Store_RetrivalForm : System.Web.UI.Page
{
 static bool btncheck;
string cs = ConfigurationManager.ConnectionStrings["SSISConnectionString"].ConnectionString;
SqlConnection con;
SqlDataAdapter adapt;
DataTable dt;
SSISEntities model = new SSISEntities();
List<Stationery_Catalogue> stationery;
List<int> shoppingcartqty;

//total
List<double> shoppingcartTotal;
int count;
int enableindex;

protected void Page_Load(object sender, EventArgs e)
{

    stationery = (List<Stationery_Catalogue>)Session["Shoppingcart"];
    shoppingcartqty = (List<int>)Session["totalqty"];
    shoppingcartTotal = (List<double>)Session["totalprice"];
    enableindex = 0;

    if (!IsPostBack)
    {
        ShowData();

        //if (!checkSubmitButton())
        //{
        //    lbtnApprove.Enabled = false;
        //}

    }

}

protected void ShowData()
{
    dt = new DataTable();
    con = new SqlConnection(cs);
    con.Open();
    string command = "SELECT p.[Department_Orders_ID],p.[Item_ID],c.[Description] as Item,dep.[Department_Name],p.Requisition_Quantity,p.[Fulfilled_Quantity],p.[IOU_Quantity],SUM(q.Fulfilled_Quantity + q.IOU_Quantity) as Total,c.Total_Quantity FROM[Department_Orders] p,[Department_Orders]q,[Stationery_Catalogue]c,[Department]dep where p.Requisition_Date >= DATEADD(day,-7, GETDATE()) and q.Requisition_Date >= DATEADD(day,-7, GETDATE()) and p.Item_ID=q.Item_ID and p.Item_ID=c.Item_Number and p.Department_ID=dep.Department_ID group by c.[Description], p.[Item_ID], dep.[Department_Name], p.Department_ID, p.Requisition_Quantity, p.Fulfilled_Quantity, p.IOU_Quantity, p.[Department_Orders_ID],c.[Total_Quantity] order by c.[Description]";
    adapt = new SqlDataAdapter(command, con);
    adapt.Fill(dt);
    if (dt.Rows.Count > 0)
    {
        GridView1.DataSource = dt;
        GridView1.DataBind();


    }
    con.Close();


}

protected void GridView1_PreRender(object sender, EventArgs e)
{
    GridViewMerge.MergeRows(GridView1);
}

protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
{
    GridView1.EditIndex = -1;
    ShowData();
    //GridView1.DataSource = EntityDataSource1;
    //GridView1.DataBind();
}

protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
{
    GridView1.EditIndex = e.NewEditIndex;
    ShowData();
    //GridView1.DataSource = EntityDataSource1;
    //GridView1.DataBind();
}

protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
{
    //Finding the controls from Gridview for the row which is going to update  
    Label id = GridView1.Rows[e.RowIndex].FindControl("lblId") as Label;

    TextBox rtQty = GridView1.Rows[e.RowIndex].FindControl("txt_rtQty") as TextBox;
    Label existingitem = GridView1.Rows[e.RowIndex].FindControl("lblretirevaltotal") as Label;
    int existingqty = Int32.Parse(existingitem.Text);
    int depOrdId = Int32.Parse(id.Text);
    int qtyUpdated = Int32.Parse(rtQty.Text);
    if (existingqty < qtyUpdated)
    {
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Order Successfully');window.location ='Store_MakePurchaseOrder.aspx';",true);
        //string script = "alert('Actual Quantity should not greater than Needed Item !');";
        //ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script, true);
        ShowMessage("Actual Quantity should not greater than Needed Item !", MessageType.Warning);
    }
    else
    {
        con = new SqlConnection(cs);
        con.Open();
        //updating the record  
        string updateCommand = " update Department_Orders set Fulfilled_Quantity=" + qtyUpdated + "where Department_Orders_ID=" + depOrdId + "";
        SqlCommand cmd = new SqlCommand(updateCommand, con);
        cmd.ExecuteNonQuery();
        con.Close();
        //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
        GridView1.EditIndex = -1;


        //Call ShowData method for displaying updated data  
        ShowData();
    }


}
protected void ShowMessage(string Message, MessageType type)
{
    ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
}

protected void Button2_Click(object sender, EventArgs e)
{

}

protected void btnApprove_Click(object sender, EventArgs e)
{
    Response.Redirect("~/com.ssis.storeclerk/Store_Disbursement.aspx");
}

protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
{

    if (e.CommandName == "AddToCart")
    {
        String item = e.CommandArgument.ToString();
        Stationery_Catalogue st = model.Stationery_Catalogue.Where(x => x.Item_Number == item).First();
        bool rpItem = false;
        int qty = Convert.ToInt32(st.Reorder_Level);
        double price = Convert.ToDouble(st.Price);

        foreach (Stationery_Catalogue a in stationery)
        {
            if (a.Item_Number == st.Item_Number)
            {
                rpItem = true;

            }

        }
        if (!rpItem)
        {
            stationery.Add(st);
            Session["Shoppingcart"] = stationery;
            count = (int)Session["ShoppingCartCount"];
            count++;

            Session["ShoppingCartCount"] = count;

            //qty and total
            shoppingcartqty.Add(qty);
            shoppingcartTotal.Add(price);
            Session["totalqty"] = shoppingcartqty;
            Session["totalprice"] = shoppingcartTotal;
            Response.Redirect("Store_SupplierforItems.aspx?item_Number=" + item);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('This item is Already Exit');window.location ='Store_MakePurchaseOrder.aspx';", true);
        }
    }
}

protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
{
    if (e.Row.RowType == DataControlRowType.DataRow)
    {

        Label lblstock = (Label)e.Row.FindControl("lblqty");
        Label lblretrieval = (Label)e.Row.FindControl("lblRetrieval");
        LinkButton btnSave = (LinkButton)e.Row.FindControl("btnAddToCart");
        int stock = Convert.ToInt32(lblstock.Text);
        int retrieval = Convert.ToInt32(lblretrieval.Text);
        if (stock < retrieval)
        {
            lblstock.Attributes.Add("class", "  label label-danger");
            lblretrieval.Attributes.Add("class", "  label label-danger");
            btnSave.Visible = true;
            btnApprove.Enabled = false;
            enableindex++;

        }
        else if (stock > retrieval)
        {
            lblstock.Attributes.Add("class", "  label label-success");
            lblretrieval.Attributes.Add("class", "  label label-success");
            btnSave.Visible = false;
            btnApprove.Enabled = true;

        }
        else if (stock == retrieval)
        {
            lblstock.Attributes.Add("class", "  label label-warning");
            lblretrieval.Attributes.Add("class", "  label label-warning");
            btnSave.Visible = true;

            btnApprove.Enabled = true;
        }

        if (enableindex > 0)
        {
            btnApprove.Enabled = false;
        }
        //if (!checkSubmitButton())
        //{
        //    lbtnApprove.Enabled = false;
        //}

    }
}
public bool checkSubmitButton()
{
    bool result = true;
    int q1, q2;
    for (int i = 0; i < GridView1.Rows.Count; i++)
    {
        q1 = Int32.Parse((GridView1.Rows[i].FindControl("lblqty") as Label).Text);
        q2 = Int32.Parse((GridView1.Rows[i].FindControl("lblRetrieval") as Label).Text);
        if (q1 < q2)
        {
            result = false;
            break;
        }

    }
    return result;
}

           
        //protected void Page_LoadComplete(object sender, EventArgs e)
        //{
        //    if(enableindex>0)
        //    {
        //        lbtnApprove.Enabled = false;
        //    }
        //}
    }