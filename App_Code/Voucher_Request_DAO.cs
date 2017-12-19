
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    public static class Voucher_Request_DAO
    {
        public static SSISEntities ssisEntities = new SSISEntities();

        public static int Add_Voucher_Request(Voucher_Request voucher_request)
        {
            ssisEntities.Voucher_Request.Add(voucher_request);
            int result=ssisEntities.SaveChanges();
            return result;
        }

        public static List<Voucher_Request> GetAll_PendingRequests_ByID()
        {
            List<Voucher_Request> voucherRequestList = ssisEntities.Voucher_Request.Where(x => x.Status == SSISConstants.PENDING).ToList();
            return  voucherRequestList;
        }

        public static Voucher_Request GetVoucherRequest_ByID(int voucher_ID)
        {
            Voucher_Request voucher_request = ssisEntities.Voucher_Request.Where(x => x.Voucher_ID == voucher_ID).First();
            return voucher_request;
        }

        public static int Update_VoucherRequests()
        {
            int result= ssisEntities.SaveChanges();
            return result;
        }
    }
