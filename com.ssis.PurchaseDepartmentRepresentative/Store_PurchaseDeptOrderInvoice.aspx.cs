using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

    public partial class Store_PurchaseDeptOrderInvoice : System.Web.UI.Page
    {
        SSISEntities model = new SSISEntities();
        string orderid;
        int ord;
        String item_number;
        Stationery_Catalogue iteminfo;
        Purchase_Order_Details orderdetail;
        protected void Page_Load(object sender, EventArgs e)
        {
            String supplierID = Request.QueryString["supplier_id"];
            item_number = Request.QueryString["item_Number"];
            orderid = Request.QueryString["order_id"];
            string sts = Request.QueryString["status"];
            ord = Convert.ToInt32(orderid);
            Supplier s = model.Suppliers.Where(x => x.Supplier_ID == supplierID).First();
            lblsupname.Text = s.Supplier_Name;
            lblfax.Text = s.Fax_Number.ToString();
            lblcontanct.Text = s.Contact_Number.ToString();
            lblorderID.Text = orderid;
            lblstatus.Text = sts;

            var podetail = model.Purchase_Order_Details.Where(x => x.Order_ID == ord && x.Item_Number == item_number).Select(x => x.Quantity).First();
            lblqty.Text = podetail.ToString();

            iteminfo = model.Stationery_Catalogue.Where(x => x.Item_Number == item_number).First();
            lblcategory.Text = iteminfo.Category;
            lbldescription.Text = iteminfo.Description;
            lblunitprice.Text = iteminfo.Price.ToString();
            int qty = Convert.ToInt32(iteminfo.Reorder_Quantity);
            Double unitprice = ((double)podetail / (double)qty);
            Double total = (Double)((Double)iteminfo.Price * (double)unitprice);
            lbltotal.Text = total.ToString();

            DateTime today = DateTime.Today;
            if (today.DayOfWeek == DayOfWeek.Monday)
            {
                lbldelivery.Text = today.ToString();
            }
            else
            {
                int daysmonday = ((int)DayOfWeek.Monday - (int)today.DayOfWeek + 7) % 7;
                DateTime monday = today.AddDays(daysmonday);

                lbldelivery.Text = lbldelivery.Text = DeliveryDate.getDeliveryDate(); //monday.ToString();
            }
            orderdetail = model.Purchase_Order_Details.Where(x => x.Order_ID == ord && x.Item_Number == item_number).First();
            string status = orderdetail.Status;            
            orderdetail = model.Purchase_Order_Details.Where(x => x.Order_ID == ord && x.Item_Number == item_number).First();
            Random r = new Random();
            int invoicenp = r.Next(1000000, 9999999);
            lblInvoice.Text = invoicenp.ToString();


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           // DateTime d = (DateTime)model.Purchase_Order.Where(x => x.Order_ID == ord).Select(x => x.Order_Date).First();
            Response.Redirect("Store_PurchasingDeptOrderrDetails.aspx");

        }       

       
        protected void btnSendInvoice_Click(object sender, EventArgs e)
        {
            orderdetail.Status = "Purchased";
            model.SaveChanges();
            btnSendInvoice.Enabled = false;
            Response.Redirect("Store_PurchaseDeptOrderSucessfully.aspx");
        }

        protected void lCatalogue_Click(object sender, EventArgs e)
        {
            Response.Redirect("Store_StationeryCatalogue.aspx");
        }
    }
