using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CustomPrincipal
/// </summary>
public class CustomPrincipal: System.Security.Principal.IPrincipal
{
    private LoginDetails _identity;

    public CustomPrincipal(LoginDetails identity)
    {
        _identity = identity;
    }

    public System.Security.Principal.IIdentity Identity
    {
        get { return (System.Security.Principal.IIdentity)_identity; }
    }

    public bool IsInRole(string role)
    {
        return false;
    }
}