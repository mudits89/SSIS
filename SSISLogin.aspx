<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Login.Master" AutoEventWireup="true" CodeFile="SSISLogin.aspx.cs" Inherits="SSISLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <br/><br/>
    <div class="row">
        <div class="col-md-1 visible-md visible-lg" style="padding-left:450px"></div>
        <div class="col-md-7">
            <asp:Login ID="Login1" runat="server" OnAuthenticate="ValidateUser">
                <LayoutTemplate>
                    <div class="row">                        
                        <div class="col-md-4">
                            <asp:Label ID="UserNameLabel" CssClass="label-t3" runat="server" AssociatedControlID="UserName" Text="User Name:" 
                                ForeColor="White"></asp:Label>
                        </div>
                        <div class="col-md-8">
                                <asp:TextBox ID="UserName" runat="server" CssClass="form-control input-lg"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-8">
                            <asp:RequiredFieldValidator ID="UserNameRequired" CssClass="label-t3" runat="server" ControlToValidate="UserName"
                                ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">
                            <span style="color:#ff2a67;">*User Name is required.</span></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row">                        
                        <div class="col-md-4">
                            <asp:Label ID="PasswordLabel" CssClass="label-t3" runat="server" AssociatedControlID="Password" ForeColor="White">Password:</asp:Label>
                        </div>
                        <div class="col-md-8">

                                <asp:TextBox ID="Password" runat="server" CssClass="form-control input-lg" TextMode="Password"></asp:TextBox>                                
                        </div>
                    </div>

                                        <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-8">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="label-t3" runat="server" ControlToValidate="Password" 
                                ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">
                                <span style="color:#ff2a67;">*Password is required.</span></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row">                        
                        <div class="col-md-12">
                            <asp:CheckBox ID="RememberMe" runat="server" CssClass="checkbox-btn" Text="Remember me next time." ForeColor="White" />
                        </div>
                    </div>

                    <div class="row">                        
                        <div class="col-md-12">
                            <span style="color:#ff2a67;"><asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal></span>
                        </div>
                    </div>
                    <br/>
                    <div class="row">                        
                        <div class="col-md-5" style="padding-left: 20px">
                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="btn btn-primary" Text="Log In" 
                                ValidationGroup="Login1" Width="300px" />
                        </div>
                    </div>

                </LayoutTemplate>
            </asp:Login>
        </div>
    </div>

    <br/><br/><br/><br/><br/>

<%--    <div class="row">
        <div class="col-md-1" style="width: 2%"></div>
        <div class="col-md-10" style="width: 96%">
            <div class="panel panel-t3">
                <div class="panel-heading-t3">
                    <div class="row">
                        <div class="col-md-12" style="text-align:left">
                             <asp:Label ID="Label2" runat="server"  Text="Login Form " CssClass="page-header"></asp:Label>
                        </div>
                    </div>
                </div>

                <div class="panel-body-t3">--%>
            

<%--                     <div class="row">
                     <asp:Label ID="UserNameLabel" CssClass="label-t3" runat="server" AssociatedControlID="UserName" Text="User Name :"></asp:Label>
                                
                     <a style="padding-left:20px; text-decoration:none;">
                        <asp:TextBox ID="UserName" runat="server" CssClass=" input-lg"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" CssClass="label-t3" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1"><span style="color:#ff2a67;">*User Name is required.</span></asp:RequiredFieldValidator>
                     </a>
                           </div><br />                
                        <div class="row">            
                     <asp:Label ID="PasswordLabel" CssClass="label-t3" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                           
                       <a style="padding-left:28px; text-decoration:none;">               
                     <asp:TextBox ID="Password" runat="server"  CssClass=" input-lg" TextMode="Password"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="label-t3" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1"><span style="color:#ff2a67;">*Password is required.</span></asp:RequiredFieldValidator>
                       </a> 
                        </div>               
                                        
                     <asp:CheckBox ID="RememberMe" runat="server" CssClass="checkbox-btn" Text="Remember me next time." />
                                       
                                   
                                      
                     <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                  
                     <asp:Button ID="LoginButton" runat="server" CommandName="Login"  CssClass="btn btn-primary" Text="Log In" ValidationGroup="Login1"  />--%>
                                        
                         

                      <hr />
    <div style="color:#fff; padding-left:30px;">
                <div class="row"  >
                    <div class="col-md-2">
                        
                        Username: Lwin<br />
                        Password: abc123<br />
                        Role: Employee<br />
                        <br /><br />

                    </div>
                     <div class="col-md-2">
                        
                        Username: Kaung<br />
                        Password: abc123<br />
                        Role: Store Mgr
                     </div>
                    <div class="col-md-2">
                        Username: Naren<br />
                        Password: abc123<br />
                        Role: Store Sup
                    </div>
                    <div class="col-md-2">
                        Username: Vamsi<br />
                        Password: abc123<br />
                        Role: Storeman
                    </div>
                    <div class="col-md-2">
                        
                        Username: John<br />
                        Password: abc123<br />
                        Role: Dept Head
                      </div>
                  </div>
                    <div class="row">
                          <div class="col-md-10">
                              <h1>How to get login Username and Other Details </h1>
                                  LoginDetails loginDetails = User.Identity as LoginDetails;--------------> build object excatly like this<br />
                                  string name = loginDetails.Name;//E.g Sathish<br /> 
                                  string roleId = loginDetails.RoleId;//E.g 1,2,3,...<br /> 
                                  string userId = loginDetails.UserId;// E.g 4 (for Sathish)<br /> 
                                  string roleName = loginDetails.RoleName;// Employee, Department Head<br /> 
                              </div>
                    </div>
                      </div>
<%--              </div>
          </div>
                  
       </div>
     </div>--%>
                    
                 
   
  
</asp:Content>
