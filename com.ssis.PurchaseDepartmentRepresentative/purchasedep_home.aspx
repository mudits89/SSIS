<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_PurchaseDept.Master" AutoEventWireup="true" CodeFile="purchasedep_home.aspx.cs" Inherits="purchasedep_home" %>
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

                                        <div class="row">
                        <div class="col-md-1 visible-md visible-lg" style="padding: 0px; width: 20px"></div>

                        <%--item 1--%>
                        <div class="col-md-2">
                             <div class="dashboard-t3">
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:LinkButton ID="LinkButton4" runat="server" CssClass="dashboard-image-t3"
                                            PostBackUrl="Store_PurchasingDeptOrderrDetails.aspx">
                    <span aria-hidden="true" class="glyphicon glyphicon-check"></span>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label ID="Label5" runat="server" Text="Check Invoice" CssClass="dashboard-label-t3"></asp:Label>
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
                                        <asp:LinkButton ID="LinkButton5" runat="server" CssClass="dashboard-image-t3"
                                            PostBackUrl="MaintainSupplierInformation.aspx">
                    <span aria-hidden="true" class="glyphicon glyphicon-info-sign"></span>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label ID="Label6" runat="server" Text="Supplier Information" CssClass="dashboard-label-t3"></asp:Label>
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
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="dashboard-image-t3"
                                            PostBackUrl="Store_PurchasingDeptOrderrDetails.aspx">
                    <span aria-hidden="true" class="glyphicon glyphicon-usd"></span>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label ID="Label1" runat="server" Text="Purchase Orders" CssClass="dashboard-label-t3"></asp:Label>
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
                           
                        </div>

                        <%--item 4--%>
                        <div class="col-md-2">
                            
                        </div>

                        <%--item 5--%>
                        <div class="col-md-2">
                            
                        </div>

                        <div class="col-md-1" style="width: 2%"></div>
                    <br /><br />
                    </div>

                </div>
                <br />
                <br />
            </div>
        </div>
    </div>
</asp:Content>