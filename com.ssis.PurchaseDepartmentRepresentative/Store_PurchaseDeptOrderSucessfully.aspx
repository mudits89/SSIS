<%@ Page Language="C#" MasterPageFile="~/MasterPage_PurchaseDept.Master" AutoEventWireup="true" codefile="Store_PurchaseDeptOrderSucessfully.aspx.cs" Inherits="Store_PurchaseDeptOrderSucessfully" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1" style="width: 2%"></div>
        <div class="col-md-11" style="width: 96%">
            <div class="panel panel-t3">
                <br/><br/>
                <div class="panel-heading-t3" style="text-align: left">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <asp:Label ID="Label2" runat="server" CssClass="page-header">
                                <span class="glyphicon glyphicon-ok-sign" style="font-size:60px"></span></asp:Label>
                        </div>
                        <div class="col-md-10">
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Label ID="Label1" runat="server" Text="Order Sucessful " CssClass="page-header"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Label ID="Label3" runat="server" Text="Your order has been sent!" CssClass="label-t3"></asp:Label>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                
                <div class="panel-footer-t3">
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-9">
                            <asp:Button ID="Button1" runat="server" Text="Back to Purchase Orders" Width="150px"
                                PostBackUrl="Store_PurchasingDeptOrderrDetails.aspx"
                                CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <br />
            </div>
        </div>
    </div>

</asp:Content>
