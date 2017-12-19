
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class StationeryCart : System.Web.UI.Page
    {
        List<Stationery_Catalogue> cartList;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            cartList = (List<Stationery_Catalogue>)Session["Cart"];
            if (!IsPostBack)
            {
                if (cartList != null)
                {
                    refereshDataGrid();
                }
            }
        }

        private void refereshDataGrid()
        {
            GridStationeryCart.DataSource = cartList;
            GridStationeryCart.DataBind();
        }

        protected void remove_ItemRowCommand(object sender, GridViewCommandEventArgs e)
        {
            TextBox tb = (TextBox)GridStationeryCart.Rows[0].FindControl("Quantity");
            String qty = tb.Text;
            if (e.CommandName == "editQuantity")
            {
                String itemID = e.CommandArgument.ToString();
                Stationery_Catalogue product = null;
                foreach (Stationery_Catalogue stationery_catalogue in cartList)
                {
                    if (stationery_catalogue.Item_Number == itemID)
                    {
                        product = stationery_catalogue;
                        break;
                    }
                }
                product.Total_Quantity = Convert.ToInt32(qty);
            }
            else if (e.CommandName == "remove")
            {
                String itemID = e.CommandArgument.ToString();
                Stationery_Catalogue product = null;
                foreach (Stationery_Catalogue stationery_catalogue in cartList)
                {
                    if (stationery_catalogue.Item_Number == itemID)
                    {
                        product = stationery_catalogue;
                        break;
                    }
                }
                cartList.Remove(product);
                Session["Cart"] = cartList;
                refereshDataGrid();
            }
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {

            Stationery_Requisition stationeryRequest = new Stationery_Requisition();
            LoginDetails loginDetails = User.Identity as LoginDetails;
            string userId = loginDetails.UserId;
            stationeryRequest.User_ID = Convert.ToInt32(userId);
            stationeryRequest.Status = SSISConstants.PENDING;
            stationeryRequest.Requisition_Date = DateTime.Now;
            stationeryRequest.Requisition_Items = addRequisition_Items();
            int result = Stationery_Requisition_DAO.AddStationeryRequistion(stationeryRequest);
            sendEmail();
             List<Stationery_Catalogue> reqList =(List<Stationery_Catalogue>) Session["Cart"];
             reqList.Clear();
             Session["Cart"] = reqList;
             Response.Redirect("RequestStationery.aspx");
        }
        public List<Requisition_Items> addRequisition_Items()
        {
            List<Requisition_Items> addedList = new List<Requisition_Items>();
            foreach (Stationery_Catalogue stationery_catalogue in cartList)
            {
                Requisition_Items req = new Requisition_Items();
                req.Item_ID = stationery_catalogue.Item_Number;
                req.Quantity = stationery_catalogue.Total_Quantity;
                addedList.Add(req);

            }
            return addedList;
        }


        protected void Quantity_ChangeTextBox(object sender, EventArgs e)
        {
            HiddenField hiddenField1 = (HiddenField)(GridStationeryCart.Rows[0].FindControl("HiddenItemNumber"));
            String itemID = hiddenField1.Value;
            TextBox qtyText = (TextBox)(GridStationeryCart.Rows[0].FindControl("Quantity"));
            String qty = qtyText.Text;
            Stationery_Catalogue product = null;
            foreach (Stationery_Catalogue stationery_catalogue in cartList)
            {
                if (stationery_catalogue.Item_Number == itemID)
                {
                    product = stationery_catalogue;
                    break;
                }
            }
            product.Total_Quantity = Convert.ToInt32(qty);
        }

        protected void sendEmail()
        {
            LoginDetails loginDetails = User.Identity as LoginDetails;
            string userId = loginDetails.UserId;
            string subject = "Stationery Requistion by "+loginDetails.Name;
            List<Stationery_Catalogue> stationeryCatalogueList = (List<Stationery_Catalogue>)Session["Cart"];
            User headUser=UserDAO.GetUserdOfDeptHead(Convert.ToInt32(userId));           
            String body=setEmailBody();               
            MailerService.SendEmail(headUser.Email,headUser.Employee.Name, subject, body);
        }

        protected string setEmailBody()
        {
            String body = "";
            LoginDetails loginDetails = User.Identity as LoginDetails;
            string userId = loginDetails.Name;
             body += "<p>The stationery items requested by " + userId + "</p><br>";
              body += "<br><table style='border:Solid 1px Black; text-align:center; vertical-align:middle;' ><tr style='height:40px; text-align:center; vertical-align:middle; border-bottom-color: #000'>";
                body +=  "<th>ItemName</th>" + "<th>Requested Quantity</th>" + "<th>Price</th></tr>";
            foreach (var item in (List<Stationery_Catalogue>)Session["Cart"])
            {
                body += "<tr>";
                body += "<td stlye='color:blue;'>" + item.Description + "</td>" + "<td stlye='color:blue;'>" + item.Total_Quantity + "</td>" + "<td stlye='color:blue;'>" + item.Price + "</td>";
                body += "</tr>";
            }
            body += "</table>";

            return body;
        }
    }


    
