using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class Supplier_Detail : System.Web.UI.Page
    {
        SSISEntities entity;
        static string id,si;
        protected void Page_Load(object sender, EventArgs e)
        {
            entity = new SSISEntities();
            if (!IsPostBack)
            {
              


                id = Convert.ToString(Request.QueryString["sid"]);




                si = entity.Suppliers.Where(x => x.Supplier_ID == id).Select(x => x.Supplier_Name).First().ToString();

                Label1.Text = si.ToString();
                //List<string>ItemNumber = entity.Supplier_Item.Where(x => x.Supplier_ID == si.Supplier_ID).Select(y => y.Item_Number).ToList<string>();
                ////String ProductID = entity.Supplier_Item.Where(x => x.Item_Number == x.Stationery_Catalogue.Item_Number).Select(y => y.Item_Number).ToString();

                //entity.Stationery_Catalogue.Where(x => x.Item_Number == ItemNumber).Select(y =>  y.Description).First();


                GridView1.DataSource = entity.Supplier_Details(si);
                GridView1.DataBind();
            }
         
            
    
        }

        

        protected void Button1_Click(object sender, EventArgs e)
        {

          
            Response.Redirect("~/com.ssis.PurchaseDepartmentRepresentative/PurchDept_Add_New_item.aspx?suppliername=" + id);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/com.ssis.PurchaseDepartmentRepresentative/MaintainSupplierInformation.aspx");
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            GridView1.PageIndex = e.NewPageIndex;
          
            GridView1.DataSource = entity.Supplier_Details(si);
            GridView1.DataBind();
        }
    }
