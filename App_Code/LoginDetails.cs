using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

/// <summary>
/// Summary description for LoginDetails
/// </summary>
public class LoginDetails : System.Security.Principal.IIdentity
{
    private FormsAuthenticationTicket _ticket;


    public LoginDetails(FormsAuthenticationTicket ticket)
    {
        _ticket = ticket;
    }


    public string AuthenticationType
    {
        get { return "Custom"; }
    }

    public bool IsAuthenticated
    {
        get { return true; }
    }

    public string Name
    {
        get { return _ticket.Name; }
    }

    public FormsAuthenticationTicket Ticket
    {
        get { return _ticket; }
    }

    public string RoleId
    {
        get
        {
            string[] userDataPieces = _ticket.UserData.Split("|".ToCharArray());
            return userDataPieces[1];
        }
    }

    public string UserId
    {
        get
        {
            string[] userDataPieces = _ticket.UserData.Split("|".ToCharArray());
            return userDataPieces[0];
        }
    }
    public string RoleName
    {
        get
        {
            string[] userDataPieces = _ticket.UserData.Split("|".ToCharArray());
            return userDataPieces[2];
        }
    }
}