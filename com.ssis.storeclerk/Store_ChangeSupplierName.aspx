<%@ Page Title="" Language="C#" MasterPageFile="~/StoreClerk_MasterPage.master" AutoEventWireup="true" CodeFile="Store_ChangeSupplierName.aspx.cs" Inherits="Store_ChangeSupplierName" %>

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
                    <asp:Label ID="Label3" runat="server" Text="Change Supplier" CssClass="page-header"></asp:Label>
                </div>
                <div class="panel-body-t3">
		        <div class="row">
                        <div  class="col-md-1">  </div>
                        <div class="col-md-1" style="padding: 0px; width: 8%">
                            <asp:Label ID="Label4" runat="server" Text="Order ID : " CssClass="label-t3"></asp:Label>
                        </div>
                      <div class="col-md-1" style="padding: 0px; width: 8%">
                          <asp:Label ID="lblItem" runat="server"  Text="Label"  CssClass="label-t3"></asp:Label>
                        </div>
                    </div>
                    <br />
                   <div class="row">
                       <div class="col-md-3"></div>
                        <div  class="col-md-6">
                         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Supplier_Item_ID" DataSourceID="EntityDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
                          GridLines="Horizontal" BorderWidth="0px" Width="100%" AllowPaging="True" AllowSorting="True" 
                          PageSize="5" CssClass="table table-striped table-hover">
                          <RowStyle BorderColor="LightGray" />
                          <HeaderStyle CssClass="gridhead-t3"/>
                          <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" /> 
                         <Columns>               
                            <asp:BoundField DataField="Supplier_Item_ID" HeaderText="Supplier_Item_ID" ReadOnly="True" SortExpression="Supplier_Item_ID" ItemStyle-Width="20%"/>
                            <asp:BoundField DataField="Supplier_ID" HeaderText="Supplier_ID" SortExpression="Supplier_ID" ItemStyle-Width="20%" />
                            <asp:BoundField DataField="Item_Number" HeaderText="Item_Number" SortExpression="Item_Number" ItemStyle-Width="20%" />
                            <asp:BoundField DataField="Rank" HeaderText="Rank" SortExpression="Rank" ItemStyle-Width="20%" />
                            <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass="btn btn-link" SelectText="<i aria-hidden='ture' Class='glyphicon glyphicon-check'></i>"  ItemStyle-Width="20%"/>                            
                        </Columns>
                        <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>     
                        </asp:GridView>
                        </div>
                   </div>
                   <div class="row">
                       <div class="col-md-3"></div>                    
                   <div class="col-md-2">
                                 <asp:LinkButton ID="LinkButton1" runat="server" ControlStyle-CssClass="btn btn-link">                       
                                    <span class="glyphicon glyphicon-check" style="font-size:large; padding:0; width:19px;"></span>                            
                         </asp:LinkButton>- Select Supplier 
                  </div>
                       </div>
                    <br />
                    <div>
                         <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=SSISEntities" DefaultContainerName="SSISEntities" EnableFlattening="False" EntitySetName="Supplier_Item">
                         </asp:EntityDataSource>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

