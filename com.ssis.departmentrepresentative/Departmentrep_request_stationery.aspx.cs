using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class Departmentrep_request_stationery : System.Web.UI.Page
    {
        List<Stationery_Catalogue> selectedproductList;
        protected void Page_Load(object sender, EventArgs e)
        {
            List<String> productCategoryList;
            if (!IsPostBack)
            {
                productCategoryList = Stationery_Catalogue_DAO.GetAllCategoryNames();
                DropDownCategory.DataSource = productCategoryList;
                DropDownCategory.DataBind();
                DropDownCategory.Items.Insert(0, new ListItem("Select", "NA"));
            }
            else
            {
                selectedproductList = (List<Stationery_Catalogue>)Session["Cart"];
            }
        }


        protected void DropDownCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            LblStioneryItem.Visible = true;
            populateStationeryCatalogue();

        }

        private void populateStationeryCatalogue()
        {
            String selectedValue = DropDownCategory.SelectedValue;
            List<Stationery_Catalogue> stationeryCatalogueList = Stationery_Catalogue_DAO.GetStationeryItemsByCategory(selectedValue);
            GridStationery.DataSource = stationeryCatalogueList;
            GridStationery.DataBind();
        }

        protected void addItem_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AddItem")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                TextBox tb = (TextBox)GridStationery.Rows[rowIndex].FindControl("Quantity");
                String qty = tb.Text;
                HiddenField itemNumerHdden = (HiddenField)GridStationery.Rows[rowIndex].FindControl("HiddenField1");
                String productid = itemNumerHdden.Value;
                Stationery_Catalogue product = Stationery_Catalogue_DAO.GetStationeryCatalogueByItemId(productid);
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

        protected void GridStationery_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridStationery.PageIndex = e.NewPageIndex;
            populateStationeryCatalogue();
        }

        protected void ImgBtnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("departmentrep_cart.aspx");
        }
    }
