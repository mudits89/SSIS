<%@ Page Title="" Language="C#" MasterPageFile="~/StoreManagerMaster.Master" AutoEventWireup="true" CodeFile="Store_ChangePurchaseOrderDetails.aspx.cs" Inherits="Store_ChangePurchaseOrderDetails" %>

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
                <div class="panel-heading-t3" style="text-align:left">
                    <asp:Label ID="Label1" runat="server" Text="Change Purchase Orders Details" CssClass="page-header" ></asp:Label>
                    <asp:Label ID="labelicon" runat="server" CssClass="page-header"><span class="glyphicon glyphicon-list-alt"></span></asp:Label>
                </div>
                <div class="panel-body-t3">
		        <div class="row">                   
                        <div  class="col-md-10">  </div>
                        <div class="col-md-1" style="padding: 0px; width: 8%">
                             <asp:Label ID="Label2" runat="server" Text="Order ID:" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-1" style="padding: 0px; width: 8%">
                             <asp:Label ID="lblorderid" runat="server" Text="Label" CssClass="label-t3"></asp:Label>
                        </div>
                    </div>
                <div class="row">
                        <div  class="col-md-10">  </div>
                        <div class="col-md-1" style="padding: 0px; width: 8%">
                              <asp:Label ID="Label8" runat="server" Text="Order Date :" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-1" style="padding: 0px; width: 8%">
                            <asp:Label ID="lblorderdate" runat="server" Text="Label" CssClass="label-t3" DataFormatString="{0:dd-MMMMM-yyyy}"></asp:Label>
                        </div>
                    </div>
                <div class="row">
                        <div  class="col-md-10">  </div>
                        <div class="col-md-1" style="padding: 0px; width: 8%">
                             <asp:Label ID="Label9" runat="server" Text="User ID :" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-1" style="padding: 0px; width: 8%" >
                             <asp:Label ID="lbluserID" runat="server" Text="Label" CssClass="label-t3"></asp:Label>
                        </div>
                    </div>
                    <div class="row">                        
                        <div class="col-md-12">
                            <br />
                             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Order_ID,Item_Number" DataSourceID="EntityDataSource1" OnRowCommand="GridView1_RowCommand" 
                             EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataText="No records found."
                             GridLines="Horizontal" BorderWidth="0px" Width="100%" AllowPaging="True" AllowSorting="True" 
                             PageSize="5" CssClass="table table-striped table-hover">
                             <RowStyle BorderColor="LightGray" />
                             <HeaderStyle CssClass="gridhead-t3"/>
                             <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                        <Columns>
                            
                            <asp:BoundField DataField="Order_ID" HeaderText="Order_ID" ReadOnly="True" SortExpression="Order_ID" />
                            <asp:BoundField DataField="Item_Number" HeaderText="Item_Number" ReadOnly="True" SortExpression="Item_Number" Visible="False" />
                            <asp:BoundField DataField="Supplier_ID" HeaderText="Supplier_ID" SortExpression="Supplier_ID" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="ChooseSupplier" runat="server" CausesValidation="false" CommandName="ChooseSupplier"
                                    CssClass="btn btn-primary"  CommandArgument='<%#Eval("Order_ID") +";"+ Eval("Item_Number") +";"+ Eval("Supplier_ID") %>' Width="50%" >
                                    <span class="glyphicon glyphicon-edit" title="Change Supplier"></span> 
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="Invoice" runat="server" CausesValidation="false" CommandName="Invoice" 
                                    CssClass="btn btn-primary" CommandArgument='<%# Eval("Item_Number") +";"+ Eval("Supplier_ID") +";"+ Eval("Order_ID")+";"+ Eval("Status") %>' Width="50%" >
                                    <span class="glyphicon glyphicon-paste" title="See Invoice"> </span>
                                    </asp:LinkButton>
               
                                </ItemTemplate>
                         </asp:TemplateField>                        
                    </Columns>
                    <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>  
                    </asp:GridView>
                    </div>
                    <div class="row" >
                        <div class="col-md-2">
                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-primary">
                        <span class="glyphicon glyphicon-edit"></span>
                         </asp:LinkButton>- Change Supplier   
                        </div>
                        <div class="col-md-2">
                            <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-primary">
                        <span class="glyphicon glyphicon-paste"></span>
                         </asp:LinkButton>- Send Invoice  
                        </div>
                                             
                    </div>
                         <br />
                    <div class="row">
                                   
                        <div class="col-md-12" >
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="btn btn-primary">
                            <span class="glyphicon glyphicon-chevron-left"><span class="glyphicon glyphicon-chevron-left">Back </span></span>
                        </asp:LinkButton>
                        </div>
                        
                    </div>
                    <br />
                    
                   </div>
                </div>
            </div>
        </div>
    </div>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=SSISEntities" DefaultContainerName="SSISEntities" EnableFlattening="False" EntitySetName="Purchase_Order_Details" EnableUpdate="True">
                        </asp:EntityDataSource>
</asp:Content>


