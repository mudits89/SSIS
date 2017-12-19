using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class PurchDept_Add_New_item : System.Web.UI.Page
    {
        string suppliername;


             protected void Page_Load(object sender, EventArgs e)
        {


            suppliername = Convert.ToString(Request.QueryString["suppliername"]);

        }


        protected void Button1_Click(object sender, EventArgs e)
        {

            string Description = DropDownList1.SelectedItem.ToString();
            string Rank = RadioButtonList1.SelectedValue;
            string ItemNo;

            //try
            //{
            using (SSISEntities entity = new SSISEntities())
            {
                string stationeryCata = entity.Stationery_Catalogue.Where(p => p.Description == Description).Select(p => p.Item_Number).First().ToString();
                Supplier_Item supplier_Item = entity.Supplier_Item.Where(y => y.Item_Number == stationeryCata).First();
                ItemNo = entity.Stationery_Catalogue.Where(k => k.Description == Description).Select(k => k.Item_Number).First().ToString();
                supplier_Item.Supplier_ID = suppliername.ToString();
                supplier_Item.Rank = Rank.ToString();
                supplier_Item.Price = Double.Parse(TextBox1.Text);
                entity.SaveChanges();
                Save();

            }
            using (SSISEntities entity = new SSISEntities())
            {
                if (Rank.ToString() == "1")
                {
                    Stationery_Catalogue sc = entity.Stationery_Catalogue.Where(s => s.Item_Number == ItemNo).First();
                    sc.Price = Double.Parse(TextBox1.Text);
                    entity.SaveChanges();
                    Save();
                }
                

            }

            //}
            //catch (Exception exp)
            //{
            //    Response.Write(exp.ToString());
            //}

            Response.Redirect("~/com.ssis.PurchaseDepartmentRepresentative/MaintainSupplierInformation.aspx");
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void Save()
        {
            //Insert record here.

            //Display success message.
            string message = "Your details have been saved successfully.";
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "')};";
            ClientScript.RegisterStartupScript(this.GetType(), "Details added successfully", script, true);
        }

    }
    