using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



    public partial class StoreManager_ApproveAdjustmentVoucher : System.Web.UI.Page
    {

        SSISEntities ssisEntities = new SSISEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateVoucherRequests();
            }

        }

        private void populateVoucherRequests()
        {
            // have to get user id from user session

            List<Voucher_Request> voucherRequestList = Voucher_Request_DAO.GetAll_PendingRequests_ByID();
            List<Voucher_Request> supervisorList = new List<Voucher_Request>();
            List<Voucher_Request> managerList = new List<Voucher_Request>();
            foreach (Voucher_Request voucher_request in voucherRequestList)
            {
                double amount = Convert.ToDouble(voucher_request.Quantity * voucher_request.Stationery_Catalogue.Price);
                if (amount > 250)
                {
                    managerList.Add(voucher_request);
                }
                else
                {
                    supervisorList.Add(voucher_request);
                }
            }
            LoginDetails loginDetails = User.Identity as LoginDetails;
            string roleId = loginDetails.RoleId;
            if (roleId.Equals("5"))
            {
                GridVoucherRequest.DataSource = managerList;
            }
            else if(roleId.Equals("6"))
            {
                GridVoucherRequest.DataSource = supervisorList;
            }
           
            GridVoucherRequest.DataBind();
           
        }

        protected void Voucher_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve")
            {

                int rowIndex = Convert.ToInt32(e.CommandArgument);
                HiddenField itemNumerHdden = (HiddenField)GridVoucherRequest.Rows[rowIndex].FindControl("LblVoucherId");
                int voucherId = Convert.ToInt32(itemNumerHdden.Value);

                Voucher_Request voucher_request = ssisEntities.Voucher_Request.Where(x => x.Voucher_ID == voucherId).First();
                voucher_request.Status = SSISConstants.APPROVED;
                int qty = Convert.ToInt32(voucher_request.Quantity);
                voucher_request.Stationery_Catalogue.Total_Quantity = voucher_request.Stationery_Catalogue.Total_Quantity + qty;
                ssisEntities.SaveChanges();
                populateVoucherRequests();
            }
            else if (e.CommandName == "Reject")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                HiddenField itemNumerHdden = (HiddenField)GridVoucherRequest.Rows[rowIndex].FindControl("LblVoucherId");
                int voucherId = Convert.ToInt32(itemNumerHdden.Value);

                Voucher_Request voucher_request = ssisEntities.Voucher_Request.Where(x => x.Voucher_ID == voucherId).First();
                voucher_request.Status = SSISConstants.REJECTED;
                ssisEntities.SaveChanges();
                populateVoucherRequests();
            }
        }
    }
