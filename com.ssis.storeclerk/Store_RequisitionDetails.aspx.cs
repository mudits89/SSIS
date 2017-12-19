using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Store_RequisitionDetails : System.Web.UI.Page
{
    static int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Int32.Parse(Request.QueryString["rid"]);


        if (!IsPostBack)
        {


            using (SSISEntities ctx = new SSISEntities())
            {
                Stationery_Requisition sr = ctx.Stationery_Requisition.Where(x => x.Requisition_ID == id).First();
                Employee em = ctx.Employees.Where(x => x.Id == sr.User_ID).First();
                string s = ctx.Departments.Where(x => x.Department_ID == em.Department_ID).Select(x => x.Department_Name).First();
                lblDepartmentName.Text = s;
                lblRequistionFormID.Text = sr.Requisition_ID.ToString();
                lblRequistionDate.Text = Convert.ToDateTime(sr.Requisition_Date).ToString("dd-MMMMM-yyyy");
                lblSubmittedBy.Text = sr.Employee.Name.ToString();
            }


            EntityDataSource1.Where = "it.[Requisition_ID]=" + id + " ";

        }
    }

    protected void btnReject_Click(object sender, EventArgs e)
    {

    }

    protected void btnApprove_Click(object sender, EventArgs e)
    {
        Department_Orders depOrder;
        string itemID;
        SSISEntities model = new SSISEntities();
        Stationery_Requisition reqToAdd = model.Stationery_Requisition.Where(x => x.Requisition_ID == id).First();
        Employee emp = model.Employees.Where(x => x.Id == reqToAdd.User_ID).First();
        string depId = model.Departments.Where(x => x.Department_ID == emp.Department_ID).Select(x => x.Department_ID).First();

        foreach (Requisition_Items req in reqToAdd.Requisition_Items)
        {
            itemID = req.Item_ID;
            var result = model.Department_Orders.Where(x => x.Item_ID == itemID && x.Department_ID == depId).SingleOrDefault();

            if (result == null)
            {
                Department_Orders deptOrder = new Department_Orders();
                deptOrder.Department_ID = depId;
                deptOrder.Item_ID = itemID;
                deptOrder.Requisition_Date = reqToAdd.Requisition_Date;
                deptOrder.Requisition_Quantity = req.Quantity;
                deptOrder.Fulfilled_Quantity = 0;
                deptOrder.IOU_Quantity = 0;
                deptOrder.Return_Quantity = 0;
                model.Department_Orders.Add(deptOrder);

                //reqToAdd.Status = "Processed";
                model.SaveChanges();
                //string script = "alert('Successfully Added to Retriveal List');";
                //ClientScript.RegisterClientScriptBlock(this.GetType(), "Successfully Added to Retriveal List", script, true);



            }
            else
            {
                depOrder = result;
                depOrder.Requisition_Quantity = depOrder.Requisition_Quantity + req.Quantity;
                model.SaveChanges();

            }


            Response.Redirect("~/com.ssis.storeclerk/Store_ListofRequisitionForms.aspx");
        }
    }


    //x.Department_ID = reqToAdd.D




}