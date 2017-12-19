﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class EmployeeHistory : System.Web.UI.Page
    {
        SSISEntities context;
        protected void Page_Load(object sender, EventArgs e)
        {
            context = new SSISEntities();

        }
        protected void RequisitionDetails_Click(object sender, EventArgs e)
        {
            string Id = (sender as LinkButton).CommandArgument;

            Response.Redirect("EmployeeEditDelete.aspx?ID=" + Id);
        }

        protected void Button_click(object sender, EventArgs e)
        {
            if((searchtxt.Text.Trim().Length>0)&& (!searchtxt.Text.Equals("All")))
            {
                SqlDataSource1.FilterExpression = string.Format(" (Status = '{0}')", searchtxt.Text);

            }
            else
            {
                SqlDataSource1.FilterExpression = string.Empty;
            }
            GridView2.DataBind();
        }
    }
