using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class MaintainSupplierInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            loadData();

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            String Category = DropDownList1.SelectedValue;
            using (SSISEntities entity = new SSISEntities())
            {

                List<String> ProductList = entity.Stationery_Catalogue.Where(x => x.Category == Category).Select(y => y.Description).ToList();
                DropDownList2.DataSource = ProductList;
                DropDownList2.DataBind();




            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            Response.Redirect("");
        }



        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = e.RowIndex;
            HiddenField supIdHidden = (HiddenField)GridView1.Rows[id].FindControl("SupplierID");

            SSISEntities entityContext = new SSISEntities();

            Guid guid = Guid.NewGuid();
            Random random = new Random();
            int key = random.Next();

            String Item_Number = DropDownList2.SelectedValue.Trim();
            String ItemID = entityContext.Stationery_Catalogue.Where(x => x.Description == Item_Number).Select(z => z.Item_Number).First();

            // Remove from grid and supplier-item tables
            Supplier_Item si = entityContext.Supplier_Item.Where(x => x.Supplier_ID == supIdHidden.Value && x.Item_Number == ItemID).First();

            entityContext.Supplier_Item.Remove(si);
            entityContext.SaveChanges();


            loadData();


            // Response.Redirect("MaintainSupplierInformation.aspx");
        }

        protected void loadData()
        {

            SSISEntities entity = new SSISEntities();
            String Item_Number = DropDownList2.SelectedValue.Trim();
            String ItemID = entity.Stationery_Catalogue.Where(x => x.Description == Item_Number).Select(z => z.Item_Number).First();

            var q = entity.Supplier_Item.
                 Where(x => x.Item_Number == ItemID && x.Supplier_ID == x.Supplier.Supplier_ID).
                 Select(y => new
                 {
                     y.Supplier_ID,
                     y.Supplier.Supplier_Name,
                     y.Supplier.Contact_Number,
                     y.Supplier.Address,
                     y.Supplier.Fax_Number,
                     y.Rank
                 }).
                     OrderBy(z => z.Rank).ToList();
            GridView1.DataSource = q;

            GridView1.DataBind();
        }

        protected void btnnewSupplier_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/com.ssis.PurchaseDepartmentRepresentative/Add_New_supplier.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "supid")
            {
                string arg = e.CommandArgument.ToString();
                Response.Redirect("~/com.ssis.PurchaseDepartmentRepresentative/Supplier_Detail.aspx?sid=" + arg);
            }
        }

       
    }

    
    
