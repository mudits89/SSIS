<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Employee.Master" AutoEventWireup="true" CodeFile="Employee_home.aspx.cs" Inherits="Employee_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1" style="width: 2%"></div>

        <div class="col-md-10" style="width: 96%">
            <div class="panel panel-t3">

                <div class="panel-heading-t3">
                    <div class="row">
                        <div class="col-md-12" style="text-align: left; padding-top: 2%; padding-left: 3%;">
                            <asp:Label ID="Label2" runat="server" Text="Home" CssClass="page-header"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <span class="underline-t3"></span>
                        </div>
                    </div>
                </div>

                
                <div class="panel-body-t3">

                    <%--first row--%>
                    <div class="row">
                        <div class="col-md-1 visible-md visible-lg" style="padding: 0px; width: 20px"></div>

                        <%--item 1--%>
                        <div class="col-md-2">
                            <div class="dashboard-t3">

                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="dashboard-image-t3"
                                            PostBackUrl="~/com.ssis.employee/RequestStationery.aspx">
                    <span aria-hidden="true" class="glyphicon glyphicon-send"></span>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label ID="Label1" runat="server" Text="Submit Request" CssClass="dashboard-label-t3"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <span class="dashboard-underline-t3"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--item 2--%>
                        <div class="col-md-2">
                            <div class="dashboard-t3">
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="dashboard-image-t3"
                                            PostBackUrl="~/com.ssis.employee/EmployeeHistory.aspx">
                    <span aria-hidden="true" class="glyphicon glyphicon-folder-open"></span>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label ID="Label3" runat="server" Text="My Requisitions" CssClass="dashboard-label-t3"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <span class="dashboard-underline-t3"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--item 3--%>
                        <div class="col-md-2">
                            <div class="dashboard-t3">
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:LinkButton ID="LinkButton3" runat="server" CssClass="dashboard-image-t3"
                                            PostBackUrl="~/com.ssis.employee/Favourites.aspx">
                    <span aria-hidden="true" class="glyphicon glyphicon-star"></span>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label ID="Label4" runat="server" Text="Favourites" CssClass="dashboard-label-t3"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <span class="dashboard-underline-t3"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--item 4--%>
                        <div class="col-md-2">
                           
                        </div>

                        <%--item 5--%>
                        <div class="col-md-2">
                            
                        </div>

                        <div class="col-md-1" style="width: 2%"></div>
                    </div>

                    <%--second row--%>

                                        <div class="row">
                        <div class="col-md-1 visible-md visible-lg" style="padding: 0px; width: 20px"></div>

                        <%--item 1--%>
                        <div class="col-md-2">
                          
                        </div>

                        <%--item 2--%>
                        <div class="col-md-2">
                            
                        </div>

                        <%--item 3--%>
                        <div class="col-md-2">
                           
                        </div>

                        <%--item 4--%>
                        <div class="col-md-2">

                        </div>

                        <%--item 5--%>
                        <div class="col-md-2">
                            
                        </div>

                        <div class="col-md-1" style="width: 2%"></div>
                    </div>

                </div>
                <br />
                <br />
            </div>
        </div>
    </div>
</asp:Content>
