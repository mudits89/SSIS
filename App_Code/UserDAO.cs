using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    
    public static class UserDAO
    {       
            static SSISEntities ssisEntities = new SSISEntities();
            public static User GetUserdOfDeptHead(int userId)
            {
                User user=(User)ssisEntities.Users.Where(x => x.UserId == userId).First();
                int reportsToID = Convert.ToInt32(user.Employee.Reportsto);
                User headUser = (User)ssisEntities.Users.Where(x => x.UserId == reportsToID).First();
                  
            return headUser;
            }


        }
