using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Store_IOUList : System.Web.UI.Page
{
    public static bool ddClick, searchText = false;
public int addition;
SSISEntities ssis = new SSISEntities();

protected void Button4_Click(object sender, EventArgs e)
{
    string search = TextBox2.Text.ToString();
    GridView2.DataSource = ssis.iou_list_searchProcedure(search);
    GridView2.DataBind();
}

protected void LButton5_Click(object sender, EventArgs e)
{
    GridView2.DataSource = ssis.iou_list_view.ToList();
    GridView2.DataBind();
}


protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
{
    string departmentIOU = DropDownList2.SelectedValue.ToString();
    GridView2.DataSource = ssis.iou_list_Procedure(departmentIOU);
    GridView2.DataBind();
}

protected void GridView2_AddRetrievalList(object sender, GridViewCommandEventArgs e)
{
    if (e.CommandName == "addRetrievalList")
    {
        String rowindex = e.CommandArgument.ToString();
        GridViewRow row = GridView2.Rows[Convert.ToInt32(rowindex)];



        // int rowindex = ((sender as Button).namingcontainer as gridviewrow).rowindex;
        string description = row.Cells[0].Text;
        string departmentname = row.Cells[1].Text;
        int iouquantity = Int32.Parse(row.Cells[2].Text);


        DateTime now = DateTime.Now;
        DateTime date = now.Date;


        string itemNumber = ssis.Stationery_Catalogue.Where(x => x.Description == description).Select(x => x.Item_Number).FirstOrDefault().ToString();

        string depID = ssis.IOUs.Where(x => x.Item_Number == itemNumber).Select(x => x.Department_ID).FirstOrDefault();

        Department_Orders depOrdSelected = ssis.Department_Orders.Where(x => x.Department_ID == depID && x.Item_ID == itemNumber).FirstOrDefault();

        //string iouID = ssis.IOUs.Where(p => p.Item_Number == itemNumber && p.Department_ID == depID && p.Status == "'Processed'").Select(x=>x.IOU_ID).FirstOrDefault();

        IOU iou = ssis.IOUs.Where(p => p.Item_Number == itemNumber && p.Department_ID == depID && p.Status == "Unprocess").First<IOU>();
        if (depOrdSelected != null)
        {


            string deptOrderID = depOrdSelected.Department_ID;
            string deptOrderIouNum = depOrdSelected.Item_ID;
            int deptOrderIouQuantity = (int)depOrdSelected.IOU_Quantity;
            DateTime deptDate = (DateTime)depOrdSelected.Requisition_Date;
            //  int different = Int32.Parse( date - deptDate).ToString();
            int dateDept = (date - deptDate).Days;
            //DateTime deD= DateTime.Now.Date.AddDays(-7);
            if (depID == deptOrderID && deptOrderIouNum == itemNumber && dateDept < 3)
            {
                iouquantity += deptOrderIouQuantity;
                Department_Orders selectedDepOrd = ssis.Department_Orders.Where(x => x.Department_ID == depID && x.Item_ID == itemNumber).First<Department_Orders>();
                selectedDepOrd.IOU_Quantity = iouquantity;
                ssis.SaveChanges();

            }
            else
            {
                Department_Orders deptOrder = new Department_Orders
                {
                    Department_ID = depID,
                    Item_ID = itemNumber,
                    Requisition_Date = date,
                    Requisition_Quantity = 0,
                    Fulfilled_Quantity = 0,
                    IOU_Quantity = iouquantity,
                    Return_Quantity = 0


                };

                ssis.Department_Orders.Add(deptOrder);
                ssis.SaveChanges();
            }
        }
        else
        {

            Department_Orders deptOrder = new Department_Orders
            {
                Department_ID = depID,
                Item_ID = itemNumber,
                Requisition_Date = date,
                Requisition_Quantity = 0,
                Fulfilled_Quantity = 0,
                IOU_Quantity = iouquantity,
                Return_Quantity = 0


            };

            ssis.Department_Orders.Add(deptOrder);
            ssis.SaveChanges();
        }

        iou.Status = "Processed";
        ssis.SaveChanges();

        Response.Redirect("~/com.ssis.storeclerk/Store_IOUList.aspx");

    }
}



protected void Page_Load(object sender, EventArgs e)
{
    GridView2.DataSource = ssis.iou_list_view.ToList();
    GridView2.DataBind();


}
    }