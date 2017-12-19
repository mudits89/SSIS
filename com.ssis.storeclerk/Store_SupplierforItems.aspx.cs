using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Store_SupplierforItems : System.Web.UI.Page
{
    SSISEntities model = new SSISEntities();
    List<String> list = new List<String>();
    List<Stationery_Catalogue> sclist = new List<Stationery_Catalogue>();
    int count;
    String supplierID;
    string item_number;
    protected void Page_Load(object sender, EventArgs e)
    {
        item_number = Request.QueryString["item_Number"];
        //Label2.Text = item_number;
        String itemname = model.Stationery_Catalogue.Where(x => x.Item_Number == item_number).Select(x => x.Description).First();
        lblName.Text = itemname;
        EntityDataSource1.Where = "it.[Item_Number]=@item_Number";
        EntityDataSource1.WhereParameters.Add("Item_Number", TypeCode.String, item_number);
        list = (List<String>)Session["ShoppingCartSupplierCart"];
        sclist = (List<Stationery_Catalogue>)Session["Shoppingcart"];
        count = (int)Session["shoppingcartCount"];
        Button1.Visible = false;
        //List<string> supplier = model.Supplier_Item.Select(x => x.Item_Number).ToList();
        // foreach(String sup in supplier)
        // {
        //     if(sup==item_number)
        //     {
        //         flag = true;
        //     }

        // }

        // if(flag==false)
        // {
        //     Button1.Visible = false;
        // }

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;

        supplierID = GridView1.DataKeys[row.RowIndex]["Supplier_Item_ID"].ToString();
        //supplierID = row.Cells[0].Text;
        ViewState["suppID"] = supplierID;
        //int id = Int32.Parse(supplierID);
        //Supplier_Item s = model.Supplier_Item.Where(x => x.Supplier_Item_ID == id).First();
        //Supplier supplier = model.Suppliers.Where(x => x.Supplier_ID == s.Supplier_ID).First();
        //list.Add(supplier.Supplier_Name);
        //Session["ShoppingCartSupplierCart"] = list;
        Button1.Visible = true;



    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        supplierID = ViewState["suppID"].ToString();
        int id = Int32.Parse(supplierID);
        Supplier_Item s = model.Supplier_Item.Where(x => x.Supplier_Item_ID == id).First();
        Supplier supplier = model.Suppliers.Where(x => x.Supplier_ID == s.Supplier_ID).First();
        list.Add(supplier.Supplier_Name);
        Session["ShoppingCartSupplierCart"] = list;
        Response.Redirect("Store_MakePurchaseOrder.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //if(!list.Any())
        //{
        //    //                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
        //    //"alert('Please Select the Supplier');
        //    //string script = "&lt;script language='javascript'&gt;alert('abc');&lt;/script&gt;"; "ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script, true);
        //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Select the Supplier Information :')", true);
        //}
        //else
        //{
        // list<Stationery_Catalogue> list =
        foreach (Stationery_Catalogue s in sclist)
        {
            if (s.Item_Number == item_number)
            {
                sclist.Remove(s);
                count--;
                Session["shoppingcartCount"] = count;
                break;
            }
        }
        Response.Redirect("Store_MakePurchaseOrder.aspx");
        // }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int rank;


            Label lblrank = (Label)e.Row.FindControl("lblrank");
            rank = Convert.ToInt32(lblrank.Text);

            if (rank == 1)
            {

                lblrank.Attributes.Add("class", "label label-success");
            }
            else if (rank == 2)
            {

                lblrank.Attributes.Add("class", " label label-warning");
            }
            else if (rank == 3)
            {

                lblrank.Attributes.Add("class", "  label label-danger");
            }
            //int reqty, total;
            //bool a = Int32.TryParse(e.Row.Cells[3].Text, out reqty);
            //Label lblQty = (Label)e.Row.FindControl("lblqty");
            //bool b = Int32.TryParse(lblQty.Text.ToString(), out total);

            //if (a && b)
            //{
            //    if (total > reqty)
            //    {
            //        lblQty.Style.Add("color", "	#00FF00");
            //    }
            //    else
            //    {
            //        lblQty.Style.Add("color", "#f00");
            //    }
            //}
            //}
        }
    }
}