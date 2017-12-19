using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SSISLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (this.Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/SSISLogin.aspx");
            }
        }
    }

    protected void ValidateUser(object sender, EventArgs e)
    {
        int userId = 0;
        string roles, roleIds = string.Empty;
        string userDataString = string.Empty;
        string constr = ConfigurationManager.ConnectionStrings["SSISConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Validate_User"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Username", Login1.UserName);
                cmd.Parameters.AddWithValue("@Password", Login1.Password);
                cmd.Connection = con;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();
                userId = Convert.ToInt32(reader["UserId"]);
                roles = reader["Roles"].ToString();
                roleIds = reader["roleIds"].ToString();
                con.Close();
                userDataString = string.Concat(userId, "|", roleIds, "|", roles);

            }
            switch (userId)
            {
                case -1:
                    Login1.FailureText = "Username and/or password is incorrect.";
                    break;
                case -2:
                    Login1.FailureText = "Account has not been activated.";
                    break;
                default:
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, Login1.UserName, DateTime.Now, DateTime.Now.AddMinutes(2880), Login1.RememberMeSet, userDataString, FormsAuthentication.FormsCookiePath);
                    string hash = FormsAuthentication.Encrypt(ticket);
                    HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash);

                    if (ticket.IsPersistent)
                    {
                        cookie.Expires = ticket.Expiration;
                    }
                    Response.Cookies.Add(cookie);
                    if (roles.Equals("Storeclerk"))
                    {
                        Response.Redirect("~/com.ssis.storeclerk/Store_Dashboard.aspx");
                    }
                    else if (roles.Equals("Employee")){
                            Response.Redirect("~/com.ssis.employee/Employee_home.aspx");
                    }
                    else if (roles.Equals("Department Head"))
                    {
                        Response.Redirect("~/com.ssis.departmenthead/Departmenthead_home.aspx");
                    }
                    else if (roles.Equals("Store Manager") || roles.Equals("Store Supervisor"))
                    {
                        Response.Redirect("~/com.ssis.storemanager/StoreManager_Dashboard.aspx");
                    }
                    else if (roles.Equals("Purchasing Department"))
                    {
                        Response.Redirect("~/com.ssis.PurchaseDepartmentRepresentative/purchasedep_home.aspx");
                    }
                    else if (roles.Equals("Department Representative"))
                    {
                        Response.Redirect("~/com.ssis.departmentrepresentative/departmentrep_home.aspx");
                    }


                    //Response.Redirect(FormsAuthentication.GetRedirectUrl(Login1.UserName, Login1.RememberMeSet));
                    break;
            }
        }
    }


}