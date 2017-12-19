<%@ Application Language="C#" %>


<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        System.Web.UI.ScriptManager.ScriptResourceMapping.AddDefinition
                ("jquery",
                 new System.Web.UI.ScriptResourceDefinition
                 {
                     Path = "~/scripts/jquery-1.12.4.min.js",
                     DebugPath = "~/scripts/jquery-1.12.4.js",
                     CdnPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-1.12.4.min.js",
                     CdnDebugPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-1.12.4.js"
                 }
                );

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        List<Stationery_Catalogue> cat = new List<Stationery_Catalogue>();
        Session["cart"] = cat;
        //shopping cart to supplier
        Session["shoppingcartCount"] = 0;
        //shopping cart 
        List<Stationery_Catalogue> Shoppingcart = new List<Stationery_Catalogue>();
        Session["Shoppingcart"] = Shoppingcart;
        List<String> ItemNumber = new List<String>();
        Session["ItemNumber"] = ItemNumber;
        List<String> ShoppingCartSupplierCart = new List<String>();
        Session["ShoppingCartSupplierCart"] = ShoppingCartSupplierCart;

        //qty
        List<int> shoppingcartqty = new List<int>();
        Session["totalqty"] = shoppingcartqty;

        //total
        List<double> shoppingcartTotal = new List<double>();
        Session["totalprice"] = shoppingcartTotal;

        bool noti = false;
        Session["notiCheck"]=noti;

        int qid = 0;
        Session["Requisition_ID"] = qid;

    }

    void Application_AuthenticateRequest(object sender, EventArgs e)
    {
        if (HttpContext.Current.User != null)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                if (HttpContext.Current.User.Identity is FormsIdentity)
                {
                    FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
                    //FormsAuthenticationTicket ticket = id.Ticket;
                    LoginDetails lgDetail = new LoginDetails(id.Ticket);
                    CustomPrincipal p = new CustomPrincipal(lgDetail);
                    //string userData = ticket.UserData;
                    //string[] roles = userData.Split(',');
                    HttpContext.Current.User = (System.Security.Principal.IPrincipal)p;
                    System.Threading.Thread.CurrentPrincipal = (System.Security.Principal.IPrincipal) p;
                }
            }
        }
    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>
