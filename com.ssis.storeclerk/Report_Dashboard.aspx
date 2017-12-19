<%@ Page Title="" Language="C#" MasterPageFile="~/StoreClerk_MasterPage.master" AutoEventWireup="true" CodeFile="Report_Dashboard.aspx.cs" Inherits="Report_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="row">
        <div class="col-md-1" style="width: 2%"></div>

        <div class="col-md-10" style="width: 96%">
            <div class="panel panel-t3">

                <div class="panel-heading-t3">
                    <div class="row">
                        <div class="col-md-12" style="text-align: left; padding-top: 2%; padding-left: 3%;">
                            <asp:Label ID="Label2" runat="server" Text="Report" CssClass="page-header"></asp:Label>
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
                                            PostBackUrl="~/report/BarChart.aspx">
                    <span aria-hidden="true" class="glyphicon glyphicon-stats"></span>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label ID="Label1" runat="server" Text="Dept Requisition Chart" CssClass="dashboard-label-t3"></asp:Label>
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
                                            PostBackUrl="~/report/ItemReports.aspx">
                    <span aria-hidden="true" class="glyphicon glyphicon-pencil"></span>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label ID="Label3" runat="server" Text="Item Requisition Chart" CssClass="dashboard-label-t3"></asp:Label>
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
                                            PostBackUrl="~/report/Reports.aspx">
                    <span aria-hidden="true" class="glyphicon glyphicon-alert"></span>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label ID="Label4" runat="server" Text="IOU Chart" CssClass="dashboard-label-t3"></asp:Label>
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

                </div>
                <br />
                <br />
            </div>
        </div>
    </div>
</asp:Content>

