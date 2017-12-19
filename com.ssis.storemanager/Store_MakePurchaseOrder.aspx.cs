using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Store_MakePurchaseOrder : System.Web.UI.Page
{
    static bool dropdownSelected, searchDo = false;

    List<Stationery_Catalogue> stationery;
    List<int> shoppingcartqty;

    //total
    List<double> shoppingcartTotal;
    List<String> su;

    SSISEntities model = new SSISEntities();
    int count;
    protected void Page_Load(object sender, EventArgs e)
    {

        EntityDataSource1.WhereParameters.Clear();

        if (IsPostBack)
        {
            stationery = (List<Stationery_Catalogue>)Session["Shoppingcart"];
            count = 0;
            LblCount.Text = count.ToString();

            //qty and total
            shoppingcartqty = (List<int>)Session["totalqty"];
            shoppingcartTotal = (List<double>)Session["totalprice"];
        }
        else
        {
            count = (int)Session["ShoppingCartCount"];
            LblCount.Text = count.ToString();

        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        searchDo = true;
        dropdownSelected = false;
        int abc;
        bool canInt = Int32.TryParse(txtSearch.Text, out abc);
        if (canInt)
        {
            EntityDataSource1.Where = "it.[Price]=" + abc + " OR it.[Reorder_Level]=" + abc + " OR it.[Reorder_Quantity]=" + abc + "";
        }
        else
        {
            EntityDataSource1.Where = "it.[Category]Like '%'+@Category+'%' OR it.[Description]=@Category";
            EntityDataSource1.WhereParameters.Add("Category", TypeCode.String, txtSearch.Text);
        }


    }

    protected void BtnSeeAll_Click(object sender, EventArgs e)
    {
        searchDo = false;
        dropdownSelected = false;
        EntityDataSource1.EntitySetName = "Stationery_Catalogue";
    }



    protected void Button1_Click1(object sender, EventArgs e)
    {

    }
    protected void GridViewCatalogue_RowCommand(object sender, GridViewCommandEventArgs e)
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
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('This item is Already Exist');window.location ='Store_MakePurchaseOrder.aspx';", true);

            }
        }
    }



    protected void GridViewCatalogue_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblQty = (Label)e.Row.FindControl("lblqty");
            lblQty.Attributes.Add("class", "  label label-danger");

        }



    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        EntityDataSource1.OrderBy = "it.[Price]";
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        dropdownSelected = true;
        searchDo = false;
        int index = DropDownList1.SelectedIndex;
        if (index == 0)
        {
            EntityDataSource1.OrderBy = "it.[Total_Quantity]";
        }
        else if (index == 1)
        {
            EntityDataSource1.OrderBy = "it.[Reorder_Quantity]";
        }
        else if (index == 2)
        {
            EntityDataSource1.OrderBy = "it.[Price]";
        }
        else if (index == 3)
        {
            EntityDataSource1.OrderBy = "it.[Description]";
        }
        else if (index == 4)
        {
            EntityDataSource1.OrderBy = "it.[Category]";
        }

    }

    protected void GridViewCatalogue_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (dropdownSelected)
        {
            int index = DropDownList1.SelectedIndex;
            if (index == 0)
            {
                EntityDataSource1.OrderBy = "it.[Total_Quantity]";
            }
            else if (index == 1)
            {
                EntityDataSource1.OrderBy = "it.[Reorder_Quantity]";
            }
            else if (index == 2)
            {
                EntityDataSource1.OrderBy = "it.[Price]";
            }
            else if (index == 3)
            {
                EntityDataSource1.OrderBy = "it.[Description]";
            }
            else if (index == 4)
            {
                EntityDataSource1.OrderBy = "it.[Category]";
            }
        }
        else if (searchDo)
        {

            int abc;
            bool canInt = Int32.TryParse(txtSearch.Text, out abc);
            if (canInt)
            {
                EntityDataSource1.Where = "it.[Price]=" + abc + " OR it.[Reorder_Level]=" + abc + " OR it.[Reorder_Quantity]=" + abc + "";
            }
            else
            {
                EntityDataSource1.Where = "it.[Category]Like '%'+@Category+'%' OR it.[Description]=@Category";
                EntityDataSource1.WhereParameters.Add("Category", TypeCode.String, txtSearch.Text);
            }

        }
    }

    protected void lCatalogue_Click(object sender, EventArgs e)
    {
        Response.Redirect("Store_StationeryCatalogue.aspx");
    }

    protected void lRetrievalbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Store_RetrivalForm.aspx");
    }

    protected void LShoppingCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Store_ShoppingCart.aspx");
    }

    protected void LClearCart_Click(object sender, EventArgs e)
    {

        Session.Clear();
        Session.Abandon();
        Response.Redirect("Store_MakePurchaseOrder.aspx");
        //su = (List<String>)Session["ShoppingCartSupplierCart"];
        //Session["Shoppingcart"] = null;
        //Session["totalprice"] = null;
        //Session["totalqty"] = null;
        //Session["ShoppingCartCount"] = null;
        //Session["ShoppingCartSupplierCart"] = null;


    }

    protected void ClearCart_Click(object sender, ImageClickEventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("Store_MakePurchaseOrder.aspx");
    }

    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    //protected void GridViewCatalogue_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //        GridViewCatalogue.PageIndex = e.NewPageIndex;
    //        EntityDataSource1.Where = "it.[Category]=@Category OR it.[Item_Number]=@Category OR it.[Description]=@Category";
    //        EntityDataSource1.WhereParameters.Add("Category", TypeCode.String, txtSearch.Text);



    //}

}