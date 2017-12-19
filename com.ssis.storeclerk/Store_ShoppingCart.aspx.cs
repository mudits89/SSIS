using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Store_ShoppingCart : System.Web.UI.Page
{
    public string defaultValue = "1";
    static int no;
    static double totprice;
    double allprice = 0.0;
    int i = 0;
    int j = 0;
    int k = 0;
    int qtyindex = 0;
    string[] suppliernameArray;
    List<Stationery_Catalogue> st;
    List<String> su;
    int[] totalqtyorder;
    int suppnameorderindex = 0;
    string[] sunameorder;
    SSISEntities model = new SSISEntities();
    int count = 0;
    //qty and total
    List<int> shoppingcartqty;
    List<double> shoppingcartTotal;
    int[] SCqty;
    double[] SCprice;

    protected void Page_Load(object sender, EventArgs e)
    {
        suppliernameArray = new string[100];
        totalqtyorder = new int[100];
        sunameorder = new string[100];
        SCqty = new int[100];
        SCprice = new double[100];
        st = (List<Stationery_Catalogue>)Session["Shoppingcart"];
        su = (List<String>)Session["ShoppingCartSupplierCart"];
        //qty and total
        shoppingcartqty = (List<int>)Session["totalqty"];
        shoppingcartTotal = (List<double>)Session["totalprice"];

        if (!IsPostBack)
        {


            GridView1.DataSource = st;
            GridView1.DataBind();
            totprice = 1;
            foreach (string v in su)
            {
                suppliernameArray[i] = v;
                i++;
            }

            i = 0;
            foreach (int qt in shoppingcartqty)
            {
                SCqty[i] = qt;
                i++;
            }
            i = 0;
            foreach (double tot in shoppingcartTotal)
            {
                SCprice[i] = tot;
                i++;
            }

            foreach (GridViewRow row in GridView1.Rows)
            {
                string LabelText = ((Label)row.FindControl("lbltotalPrice")).Text;

                LabelText = SCprice[j].ToString();
                ((Label)row.FindControl("lbltotalPrice")).Text = LabelText;

                ((Label)row.FindControl("qty")).Text = SCqty[j].ToString();
                ((Label)row.FindControl("SupplierName")).Text = suppliernameArray[j];
                allprice += SCprice[j];
                j++;
            }
            alltotal.Text = allprice.ToString();
            ViewState["pr"] = allprice.ToString();

        }

        if (!st.Any())
        {
            Button3.Enabled = false;
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Add")
        {
            GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            int index = row.RowIndex;
            String qty = (row.FindControl("qty") as Label).Text;
            string extraqty = (row.FindControl("ExtraText") as TextBox).Text;
            int extra;
            if (extraqty == "")
            {
                extra = 1;
            }
            else
            {
                extra = Convert.ToInt32(extraqty);
            }
            no = Int32.Parse(qty);
            //   no += Int32.Parse(reorderlevel);
            no += extra;

            shoppingcartqty[index] = no;
            (row.FindControl("qty") as Label).Text = no.ToString();

            double tprice = Double.Parse(row.Cells[4].Text);
            int reorderlevel = Convert.ToInt32(row.Cells[5].Text);
            double unitprice = tprice / reorderlevel;
            double extraprice = unitprice * extra;
            totprice = Convert.ToDouble((row.FindControl("lbltotalPrice") as Label).Text);
            Double total = totprice + extraprice;
            shoppingcartTotal[index] = total;
            (row.FindControl("lbltotalPrice") as Label).Text = total.ToString();

            allprice = Double.Parse(ViewState["pr"].ToString());
            allprice = allprice + extraprice; // (Double.Parse(row.Cells[4].Text));
            ViewState["pr"] = allprice.ToString();
            alltotal.Text = null;
            alltotal.Text = allprice.ToString();

            TextBox ext = row.FindControl("ExtraText") as TextBox;
            ext.Text = "";
            LinkButton reducebtn = row.FindControl("btnReduce") as LinkButton;
            reducebtn.Enabled = true;

        }// Reduce the Qty
        else if (e.CommandName == "reduce")
        {
            GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            string relevel = row.Cells[5].Text;

            String qty = (row.FindControl("qty") as Label).Text;

            string extraqty = (row.FindControl("ExtraText") as TextBox).Text;
            int extra;
            if (extraqty == "")
            {
                extra = 1;
            }
            else
            {
                extra = Convert.ToInt32(extraqty);
            }

            int rlvl = Int32.Parse(relevel);
            no = Int32.Parse(qty);

            double tprice = Double.Parse(row.Cells[4].Text);
            int reorderlevel = Convert.ToInt32(row.Cells[5].Text);
            double unitprice = tprice / reorderlevel;
            double extraprice = unitprice * extra;

            allprice = Double.Parse(ViewState["pr"].ToString());
            string ttprice = (row.FindControl("lbltotalPrice") as Label).Text.ToString();
            totprice = Convert.ToDouble(ttprice);
            Double total = Convert.ToDouble((row.FindControl("lbltotalPrice") as Label).Text);
            if (no >= rlvl)
            {
                if ((no - extra) >= rlvl)
                {
                    no -= extra;

                    allprice = allprice - extraprice;

                    total = totprice - extraprice;
                }
                else
                {
                    //string script = "&lt;script language='javascript'&gt;alert('abc');&lt;/script&gt;";
                    //ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script, true);
                    Response.Write("<script>alert('The Quantity should not be less than the reorder level !');</script>");
                }

            }
            else
            {

                LinkButton reducebtn = row.FindControl("btnReduce") as LinkButton;
                reducebtn.Enabled = false;
                Response.Write("<script>alert('The Quantity should not be less than the reorder level !');</script>");


            }
            (row.FindControl("qty") as Label).Text = no.ToString();

            (row.FindControl("lbltotalPrice") as Label).Text = total.ToString();

            ViewState["pr"] = allprice.ToString();
            alltotal.Text = null;
            alltotal.Text = allprice.ToString();

            TextBox ext = row.FindControl("ExtraText") as TextBox;
            ext.Text = "";

        }
        else if (e.CommandName == "delete")
        {
            int iee = 0;
            //GridViewRow rowss = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
            //string item = rowss.Cells[0].Text;
            string item = e.CommandArgument.ToString();
            foreach (Stationery_Catalogue a in st)
            {
                if (a.Item_Number == item)
                {
                    break;
                }
                iee++;
            }
            st.RemoveAt(iee);
            if (su[iee] != null)
            {
                su.RemoveAt(iee);

            }
            shoppingcartTotal.RemoveAt(iee);
            shoppingcartqty.RemoveAt(iee);

            GridView1.DataSource = st;
            GridView1.DataBind();

            foreach (string v in su)
            {
                suppliernameArray[i] = v;
                i++;
            }
            i = 0;
            foreach (int qt in shoppingcartqty)
            {
                SCqty[i] = qt;
                i++;
            }
            i = 0;
            foreach (double tot in shoppingcartTotal)
            {
                SCprice[i] = tot;
                i++;
            }

            foreach (GridViewRow row in GridView1.Rows)
            {
                string LabelText = ((Label)row.FindControl("lbltotalPrice")).Text;
                LabelText = SCprice[j].ToString();
                ((Label)row.FindControl("lbltotalPrice")).Text = LabelText;
                ((Label)row.FindControl("qty")).Text = SCqty[j].ToString();
                ((Label)row.FindControl("SupplierName")).Text = suppliernameArray[j];
                allprice += SCprice[j];
                j++;
            }
            alltotal.Text = allprice.ToString();
            ViewState["pr"] = allprice.ToString();

            count = (int)Session["ShoppingCartCount"];
            count--;

            Session["ShoppingCartCount"] = count;
            if (!st.Any())
            {
                Button3.Enabled = false;
            }
        }
    }
    // Make Order
    protected void Button3_Click(object sender, EventArgs e)
    {

        DateTime time = DateTime.Now;

        Purchase_Order po = new Purchase_Order();
        LoginDetails logininfo = User.Identity as LoginDetails;
        po.User_ID = Int32.Parse(logininfo.UserId);
        po.Order_Date = time;
        po.Purchase_Order_Details = addPurchaseDetailsItem();
        model.Purchase_Order.Add(po);
        model.SaveChanges();

        Button3.Visible = false;

        Session.Clear();
        Session.Abandon();


        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Order Successfully');window.location ='Store_MakePurchaseOrder.aspx';", true);

        //ShowMessage("Order Successfully", MessageType.Success);

    }


    public List<Purchase_Order_Details> addPurchaseDetailsItem()
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            string qty = ((Label)row.FindControl("qty")).Text;
            totalqtyorder[qtyindex] = Convert.ToInt32(qty);
            qtyindex++;

        }
        foreach (string v in su)
        {
            sunameorder[suppnameorderindex] = v;
            suppnameorderindex++;
        }
        List<Purchase_Order_Details> podList = new List<Purchase_Order_Details>();
        foreach (Stationery_Catalogue Scat in st)
        {
            string suppname = sunameorder[k];
            int qtyorder = totalqtyorder[k];
            string suuid = model.Suppliers.Where(x => x.Supplier_Name == suppname).Select(x => x.Supplier_ID).First();
            Purchase_Order_Details pod = new Purchase_Order_Details();
            pod.Item_Number = Scat.Item_Number;
            pod.Quantity = qtyorder;
            pod.Supplier_ID = suuid;
            pod.Status = "Pending";
            podList.Add(pod);
            k++;
        }
        return podList;
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    //protected void ShowMessage(string Message, MessageType type)
    //{
    //    ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    //}
}
