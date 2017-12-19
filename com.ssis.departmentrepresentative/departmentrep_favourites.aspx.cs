using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class departmentrep_favourites : System.Web.UI.Page
    {
        SSISEntities ssisEntities;
        List<Stationery_Catalogue> selectedproductList;

        protected void Page_Load(object sender, EventArgs e)
        {
            ssisEntities = new SSISEntities();
            if (IsPostBack)
            {
                selectedproductList = (List<Stationery_Catalogue>)Session["Cart"];
            }
        }
    protected void addItem_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "AddItem")
        {
            String rowIndex = e.CommandArgument.ToString();
            HiddenField itemNumerHdden = (HiddenField)GridView1.Rows[Convert.ToInt32(rowIndex)].FindControl("HiddenField1");
            String productid = itemNumerHdden.Value;
            TextBox tb = (TextBox)GridView1.Rows[Convert.ToInt32(rowIndex)].FindControl("Quantity");
            String qty = tb.Text;
            Stationery_Catalogue product = ssisEntities.Stationery_Catalogue.Where(x => x.Item_Number == productid).First();
            product.Total_Quantity = (Convert.ToInt32(qty));
            Stationery_Catalogue existingproduct = null;
            foreach (Stationery_Catalogue stationery_catalogue in selectedproductList)
            {
                if (stationery_catalogue.Item_Number == productid)
                {
                    existingproduct = stationery_catalogue;
                    break;
                }
            }
            if (existingproduct != null)
            {
                existingproduct.Total_Quantity = existingproduct.Total_Quantity + product.Total_Quantity;
            }
            else
            {
                selectedproductList.Add(product);
            }
            Session["Cart"] = selectedproductList;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("departmentrep_cart.aspx");
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
