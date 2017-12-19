using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Store_AddNewStationeryCatalogue : System.Web.UI.Page
{
    SSISEntities model = new SSISEntities();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SSISEntities model = new SSISEntities();
        var stationery = new Stationery_Catalogue();
        string item = txtItemNumber.Text;
        //get inital 
        string unoperated = txtDescription.Text;
        string first = unoperated.Substring(0, 1).ToUpper();

        item = first + item;

        if (model.Stationery_Catalogue.Where(x => x.Item_Number == item).FirstOrDefault() != null)
        {
            //check item already exist or not!
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
            "alert('This item already exist !');window.location ='AddStationeryCatalogue.aspx';", true);
        }
        else
        {
            //insert to the database
            stationery.Item_Number = item;
            stationery.Category = dropCategory.SelectedValue.ToString();
            stationery.Description = txtDescription.Text;
            stationery.Reorder_Level = Convert.ToInt32(txtReorderLevel.Text);
            stationery.Reorder_Quantity = Convert.ToInt32(txtReorderQuantity.Text);
            stationery.Measure_Unit = UnitMeasure.SelectedValue.ToString();
            stationery.Price = Convert.ToDouble(txtPrice.Text);
            stationery.Total_Quantity = Convert.ToInt32(txtTotal.Text);
            model.Stationery_Catalogue.Add(stationery);
            model.SaveChanges();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
"alert('Successfully Added');window.location ='Store_StationeryCatalogue.aspx';", true);
            txtItemNumber.Text = "";
            txtDescription.Text = "";
            txtReorderLevel.Text = "";
            txtReorderQuantity.Text = "";
            txtPrice.Text = "";
            txtTotal.Text = "";
        }
    }
    protected void dropCategory_SelectedIndexChanged(object sender, EventArgs e)
    {

        string selected = dropCategory.SelectedValue.ToString();
        String s = selected.Trim();


    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Store_AddNewStationeryCatalogue.aspx");
    }


}

    