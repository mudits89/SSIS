using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Store_Disbursement : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["SSISConnectionString"].ConnectionString;
    SqlConnection con;
    SqlDataAdapter adapt;
    DataTable dt;

    SSISEntities ent = new SSISEntities();
    public static string rdlistValue, ext;
    public string name;
    protected void Page_Load(object sender, EventArgs e)
    {



        if (!IsPostBack)
        {
            rdlistValue = "'FASS'";
            RadioButtonList1.SelectedIndex = 0;
            Label1.Text = " Arts Department Disbursement Items";
            Label2.Text = DeliveryDate.getDeliveryDate();
            Label1.Text = " ARTS DEPARTMENT'S DISBURSEMENT ITEMS ";
            bindData();



        }
        if (GridView1.Rows.Count == 0)
        {
            imgCover.Visible = false;
            FileUploadImg.Visible = false;
            btnUpload.Visible = false;
            lblsign.Visible = false;
            btnsubmit.Enabled = false;
        }






    }


    //public void bindData()
    //{
    //    rdlistValue = RadioButtonList1.SelectedValue;

    //    GridView1.DataSource = ent.Store_GetDisbursementList(rdlistValue);
    //    GridView1.DataBind();



    //    string combineTxt = RadioButtonList1.SelectedItem.Text + "'s Disbursement Items";
    //    Label1.Text = combineTxt;

    //}


    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        rdlistValue = "'" + RadioButtonList1.SelectedValue + "'";
        string combineTxt = RadioButtonList1.SelectedItem.Text + "'s Disbursement Items";
        Label1.Text = combineTxt;
        bindData();

    }



    protected void bindData()
    {
        dt = new DataTable();
        con = new SqlConnection(cs);
        con.Open();
        string command = "SELECT depOrd.Department_Orders_ID,depOrd.[Department_ID],dep.[Department_Name],depOrd.[Item_ID],cat.[Description],depOrd.[Requisition_Date],depOrd.[Requisition_Quantity],depOrd.[Fulfilled_Quantity],depOrd.[IOU_Quantity],depOrd.[Return_Quantity],SUM((Fulfilled_Quantity+IOU_Quantity)-Return_Quantity) as Total FROM [SSIS].[dbo].[Department_Orders] depOrd, [Stationery_Catalogue] cat,[Department] dep where  depOrd.Requisition_Date >= DATEADD(day,-9, GETDATE()) and dep.Department_ID=depOrd.Department_ID AND depOrd.Item_ID=cat.Item_Number and depOrd.Department_ID=" + rdlistValue + " group by depOrd.Department_Orders_ID,depOrd.[Department_ID],dep.[Department_Name],depOrd.[Item_ID],cat.[Description],depOrd.[Requisition_Date],depOrd.[Requisition_Quantity] ,depOrd.[Fulfilled_Quantity],depOrd.[IOU_Quantity],depOrd.[Return_Quantity] ,depOrd.[Return_Quantity] order by Department_ID";
        adapt = new SqlDataAdapter(command, con);
        adapt.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        con.Close();

        if (GridView1.Rows.Count > 0)
        {
            imgCover.Visible = true;
            FileUploadImg.Visible = true;
            btnUpload.Visible = true;
            lblsign.Visible = true;
            btnsubmit.Enabled = true;
        }
        else if (GridView1.Rows.Count == 0)
        {
            imgCover.Visible = false;
            FileUploadImg.Visible = false;
            btnUpload.Visible = false;
            lblsign.Visible = false;
            btnsubmit.Enabled = false;
        }

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label id = GridView1.Rows[e.RowIndex].FindControl("lblDepOrdId") as Label;
        TextBox rtQty = GridView1.Rows[e.RowIndex].FindControl("txt_rtQty") as TextBox;

        int depOrdId = Int32.Parse(id.Text);
        int qtyUpdated = Int32.Parse(rtQty.Text);

        Department_Orders depOrd = ent.Department_Orders.Where(x => x.Department_Orders_ID == depOrdId).First();
        depOrd.Return_Quantity = qtyUpdated;
        ent.SaveChanges();

        GridView1.EditIndex = -1;
        bindData();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindData();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindData();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        string itemId, departmentId, reason;
        DateTime deliveryDate;
        int iou, reqQty, dQty, retrunQty;


        try
        {
            if (lblext.Text.ToLower() != ".jpg" && lblext.Text.ToLower() != ".png" && lblext.Text.ToLower() != ".gif" && lblext.Text.ToLower() != ".jpeg")
            {
                lbUploadMessage.Text = "A valid image file is required!";
            }
            else
            {
                string filename = "~/Signature/" + RadioButtonList1.SelectedValue + "(" + DeliveryDate.getDeliveryDate() + ")" + ext;
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    itemId = (GridView1.Rows[i].FindControl("lblItemId") as Label).Text;
                    departmentId = (GridView1.Rows[i].FindControl("lblDepId") as Label).Text;
                    iou = Int32.Parse((GridView1.Rows[i].FindControl("lblIouQty") as Label).Text);
                    reqQty = Int32.Parse((GridView1.Rows[i].FindControl("lblrQty") as Label).Text);
                    dQty = Int32.Parse((GridView1.Rows[i].FindControl("lblfQty") as Label).Text);
                    retrunQty = Int32.Parse((GridView1.Rows[i].FindControl("lblrtQty") as Label).Text);
                    deliveryDate = Convert.ToDateTime(DeliveryDate.getDeliveryDate());


                    reason = (GridView1.Rows[i].FindControl("DropDownList1") as DropDownList).SelectedItem.Text;
                    if (reason.Equals("null"))
                    {
                        reason = "no return";
                    }


                    var result = ent.Product_Disbursement.Where(x => x.Department_ID == departmentId && x.Item_ID == itemId && x.Delivery_Date == deliveryDate).FirstOrDefault();
                    if (result != null)
                    {
                        result.IOU_Quantity = iou;
                        result.Requested_Quantity = reqQty;
                        result.Delivery_Quantity = dQty;
                        result.Return_Quantity = retrunQty;
                        result.Reason = reason;
                        result.Signature = filename;
                        ent.SaveChanges();
                    }
                    else
                    {
                        Product_Disbursement disburse = new Product_Disbursement();
                        disburse.Item_ID = itemId;
                        disburse.Department_ID = departmentId;
                        disburse.IOU_Quantity = iou;
                        disburse.Requested_Quantity = reqQty;
                        disburse.Delivery_Quantity = dQty;
                        disburse.Return_Quantity = retrunQty;
                        disburse.Delivery_Date = deliveryDate;
                        disburse.Reason = reason;
                        result.Signature = filename;
                        ent.Product_Disbursement.Add(disburse);
                        ent.SaveChanges();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lbUploadMessage.Text = "Record creation error! The following error occured: " + ex.Message;
        }


    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string directory = Server.MapPath(null);
        if (!Directory.Exists(directory + "\\Signature"))
        {
            Directory.CreateDirectory(directory + "\\Signature");
        }
        else
        {

        }

        if (FileUploadImg.HasFile)
        {
            ext = System.IO.Path.GetExtension(FileUploadImg.FileName);

            if (ext.ToLower() != ".jpg" && ext.ToLower() != ".png" && ext.ToLower() != ".gif" && ext.ToLower() != ".jpeg")
            {
                lbUploadMessage.Text = "A valid image file is required!";
            }

            else
            {
                try
                {
                    //string filename = Path.GetFileName(FileUploadImg.FileName);

                    lblext.Text = ext;

                    string filename = RadioButtonList1.SelectedValue + "(" + DeliveryDate.getDeliveryDate() + ")";

                    FileUploadImg.SaveAs(Server.MapPath("~/") + "\\Signature\\" + filename + ext);
                    imgCover.ImageUrl = "~/Signature/" + filename + ext;
                    lbUploadMessage.Text = "Upload status: File uploaded!";
                }

                catch (Exception ex)
                {
                    lbUploadMessage.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }


            }

        }

        else
        {

        }
    }
}