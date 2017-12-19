<%@ Page Title="" Language="C#" MasterPageFile="~/StoreClerk_MasterPage.master" AutoEventWireup="true" CodeFile="Store_ShoppingCart.aspx.cs" Inherits="Store_ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Stationery Catalogue</title>
    <link href="style/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 50%;
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
                <div class="panel-heading-t3">
                    <div class="col-md-12" style="text-align:left">
                        <asp:Label ID="Label1" runat="server" Text="Shopping Cart" CssClass="page-header"></asp:Label>
                        <asp:Label runat="server" CssClass="page-header"><span class="glyphicon glyphicon-shopping-cart  " style="font-size:x-large; color:firebrick"></span></asp:Label>           
                     </div>
                </div>
                <div class="panel-body-t3">
                    <div class="row">
                        <div  class="col-md-1">  </div>
                        <div class="col-md-12" style="text-align:right">                         
                          <asp:Label ID="Label2" runat="server" Text="Total : " CssClass="label-t3"></asp:Label>                         
                            <asp:Label runat="server" CssClass="label-t3 "><span class="glyphicon glyphicon-usd" style="font-size:x-small"></span></asp:Label>           
                            <asp:Label ID="alltotal" runat="server" Text="" CssClass="label-t3"></asp:Label>
                        </div>
                    </div >
                    <div class="row">
                        <div class="col-md-12">
                             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" EmptyDataText="There is no item in shopping cart" OnRowDeleting="GridView1_RowDeleting" 
                              GridLines="Horizontal" EmptyDataRowStyle-HorizontalAlign="Center"
                              BorderWidth="0px" Width="100%" AllowPaging="True" AllowSorting="True" 
                             PageSize="5" CssClass="table table-striped table-hover">
                             <RowStyle BorderColor="LightGray" />
                            <HeaderStyle CssClass="gridhead-t3"/>
                            <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />                                
                            <Columns>                 
                            <asp:BoundField DataField="Description" HeaderText="Item Name" SortExpression="Description" />    
                            <asp:BoundField DataField="Item_Number" HeaderText="Item_Number" ReadOnly="True" SortExpression="Item_Number" Visible="false" />
                            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />                                     
                            <asp:BoundField DataField="Measure_Unit" HeaderText="Measure_Unit" SortExpression="Measure_Unit" />                
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price"/>                  
                            <asp:BoundField DataField="Reorder_Level" HeaderText="Reorder_Level" SortExpression="Reorder_Level" />
                            <asp:TemplateField ShowHeader="True" HeaderText="Supplier_Name">
                                <ItemTemplate>
                                    <asp:Label ID="SupplierName" runat="server" Text="0"></asp:Label>  
                                </ItemTemplate>
                            </asp:TemplateField>
                                <asp:TemplateField ShowHeader="True" HeaderText="Quantity">
                                <ItemTemplate>
                                    <asp:Label ID="qty" runat="server"  Text="0" />
                                </ItemTemplate>                     
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnAdd" runat="server" CausesValidation="false" CommandName="Add" CommandArgument='<%# Eval("Price") %>' >
                                    <span aria-hidden="true"  class="glyphicon glyphicon-plus-sign" style="font-size: x-large; color:darkturquoise"  ></span>
                                    </asp:LinkButton>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>  
                                <asp:TextBox ID="ExtraText" runat="server" Width="50px" placeholder=" 1 "></asp:TextBox>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>  
                                <asp:LinkButton ID="btnReduce" runat="server" CausesValidation="false" CommandName="reduce"
                                CommandArgument='<%# Eval("Item_Number") %>'  >
                                <span aria-hidden="true"  class="glyphicon glyphicon-minus-sign" style="font-size: x-large; color:darkturquoise"></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="True" HeaderText="Total Amount">
                            <ItemTemplate>
                                <asp:Label ID="lbltotalPrice" runat="server" Text="0"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>                
                                <asp:LinkButton ID="Btndelete" runat="server" CausesValidation="false" CommandName="delete"
                                CommandArgument='<%# Eval("Item_Number") %>'>
                                  <span aria-hidden="true"  class="glyphicon glyphicon-remove-sign" style="font-size: x-large; color:darkturquoise" ></span>                              
                                </asp:LinkButton>
                            </ItemTemplate>
                     </asp:TemplateField> 
                </Columns>
                <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>                        
              </asp:GridView>  
            </div>
            </div>
            <div class="row">
                 <div class="col-md-10" style="text-align:left">
                    <a href="Store_MakePurchaseOrder.aspx" ><asp:Label ID="Label3" runat="server" CssClass="glyphicon glyphicon-circle-arrow-left" style="font-size:xx-large; color:darkturquoise"> </asp:Label></a>
                </div>
                <div class="col-md-2" style="text-align:right">
                    <asp:Button ID="Button3" runat="server" Text="Order" OnClick="Button3_Click" CssClass="btn btn-primary" />
                </div>
               
             </div>
                       

            </div>
        </div>
    </div>
    </div>
</asp:Content>

