<%@ Page Language="C#" MasterPageFile="~/MasterPage_PurchaseDept.Master" AutoEventWireup="true" codefile="Store_PurchasingDeptOrderrDetails.aspx.cs" Inherits="Store_PurchasingDeptOrderrDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 889px;
            left: 0px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1" style="width: 2%"></div>
        <div class="col-md-10" style="width: 96%">
            <div class="panel panel-t3">
                <div class="panel-heading-t3" style="text-align: left">
                    <div class="row">
                        <div class="col-md-12" style="text-align: left; padding-top: 2%; padding-left: 3%;">
                            <asp:Label ID="Label1" runat="server" Text="Purchase Orders Details" CssClass="page-header"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <span class="underline-t3"></span>
                        </div>
                    </div>
                </div>

                <br/>
                <div class="panel-body-t3">		        
                <div class="row">
                        <div class="col-md-12">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Order_ID,Item_Number" DataSourceID="EntityDataSource1" OnRowCommand="GridView1_RowCommand"
                        EmptyDataText="No records found." EmptyDataRowStyle-HorizontalAlign="Center"
                        GridLines="Horizontal" BorderWidth="0px" Width="100%" AllowPaging="True" AllowSorting="True" 
                        PageSize="5" CssClass="table table-striped table-hover"    >
                         <RowStyle BorderColor="LightGray" />
                        <HeaderStyle CssClass="gridhead-t3"/>
                        <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                <Columns>
                    <asp:BoundField DataField="Order_ID" HeaderText="Order_ID" ReadOnly="True" SortExpression="Order_ID" />
                    <asp:BoundField DataField="Item_Number" HeaderText="Item_Number" ReadOnly="True" SortExpression="Item_Number" 
                        HeaderStyle-CssClass="visible-md visible-lg" ItemStyle-CssClass="visible-md visible-lg"/>
                    <asp:BoundField DataField="Supplier_ID" HeaderText="Supplier_ID" SortExpression="Supplier_ID" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" 
                        HeaderStyle-CssClass="visible-md visible-lg" ItemStyle-CssClass="visible-md visible-lg"/>
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" 
                        HeaderStyle-CssClass="visible-md visible-lg" ItemStyle-CssClass="visible-md visible-lg"/>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>               
                            <asp:Button ID="Invoice" runat="server" CausesValidation="false" CommandName="Invoice" CssClass="btn btn-primary"
                            Text=" See Invoice " CommandArgument='<%# Eval("Item_Number") +";"+ Eval("Supplier_ID") +";"+ Eval("Order_ID") +";"+ Eval("Status") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
            </Columns>
            <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle> 
            </asp:GridView>
              </div>
                    </div>
                    <div>
                        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=SSISEntities" DefaultContainerName="SSISEntities" EnableFlattening="False" EntitySetName="Purchase_Order_Details" Where="it.[Status]==&quot;Forwarded&quot;">
                        </asp:EntityDataSource>
                    </div>
            </div>
                <br/><br/>
        </div>
    </div>
    </div>
</asp:Content>
