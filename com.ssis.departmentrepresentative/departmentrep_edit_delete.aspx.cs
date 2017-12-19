using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class departmentrep_edit_delete : System.Web.UI.Page
    {
        SSISEntities context;
        string requisitionID;
        protected void Page_Load(object sender, EventArgs e)
        {
            context = new SSISEntities();
            requisitionID = Request.QueryString["ID"].ToString();


            requisitionlbl.Text = requisitionID;
        }

    }
