using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Store_StationeryCatalogue : System.Web.UI.Page
{
    static bool dropdownSelected, searchDo = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        EntityDataSource1.WhereParameters.Clear();
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
            int bce;
            bool canInt = Int32.TryParse(txtSearch.Text, out bce);
            if (canInt)
            {
                EntityDataSource1.Where = "it.[Price]=" + bce + " OR it.[Reorder_Level]=" + bce + " OR it.[Reorder_Quantity]=" + bce + "";
            }
            else
            {
                EntityDataSource1.Where = "it.[Category]Like '%'+@Category+'%' OR it.[Description]=@Category";
                EntityDataSource1.WhereParameters.Add("Category", TypeCode.String, txtSearch.Text);
            }
        }
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



    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {

    }

    protected void GridViewCatalogue_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int reqty, total;
            bool a = Int32.TryParse(e.Row.Cells[3].Text, out reqty);
            Label lblQty = (Label)e.Row.FindControl("lblqty");
            bool b = Int32.TryParse(lblQty.Text.ToString(), out total);

            if (a && b)
            {
                if (total > reqty)
                {

                    lblQty.Attributes.Add("class", "  label label-success");
                }
                else
                {
                    lblQty.Attributes.Add("class", "  label label-danger");
                }
            }


        }
    }

    protected void BtnSeeAll0_Click(object sender, EventArgs e)
    {
        Response.Redirect("Store_MakePurchaseOrder.aspx");
    }

    protected void GridViewCatalogue_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        ShowMessage("Successfully Edited", MessageType.Success);
    }
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    protected void GridViewCatalogue_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        ShowMessage("Successfully Deleted", MessageType.Success);
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
}
