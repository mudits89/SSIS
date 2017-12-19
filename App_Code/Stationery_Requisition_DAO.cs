using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    public static class Stationery_Requisition_DAO
    {
        static SSISEntities ssisEntities = new SSISEntities();
        public static int AddStationeryRequistion(Stationery_Requisition stationery_request)
        {
            ssisEntities.Stationery_Requisition.Add(stationery_request);
            int result = ssisEntities.SaveChanges();
            return result;
        }


    }
