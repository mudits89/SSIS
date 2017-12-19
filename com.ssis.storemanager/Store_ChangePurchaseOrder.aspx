<%@ Page Title="" Language="C#" MasterPageFile="~/StoreManagerMaster.Master" AutoEventWireup="true" CodeFile="Store_ChangePurchaseOrder.aspx.cs" Inherits="Store_ChangePurchaseOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 800px;
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
                    <asp:Label ID="Label1" runat="server" Text="Change Purchase Orders " CssClass="page-header" />
                    <asp:Label ID="labelicon" runat="server" CssClass="page-header"><span class="glyphicon glyphicon-edit"></span></asp:Label>
                </div>
                <div class="panel-body-t3">
		          <div class="row">
                     <div class="col-md-4"></div>
                    <div class="col-md-2">                   
                            <asp:LinkButton ID="SeeAll" runat="server" CssClass="btn btn-primary" OnClick="SeeAll_Click">                           
                             <span  class="glyphicon glyphicon-list">View All Items</span>
                            </asp:LinkButton>
                        </div> 
                    <div class="col-md-3 input-group">
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="Search" Width="100%" CssClass="form-control input-lg"></asp:TextBox>                      
                            <span class="input-group-btn"><asp:LinkButton ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" >
                            <span aria-hidden="true"  class="glyphicon glyphicon-search" ></span></asp:LinkButton> </span>                            
                        </div>                  
                       
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Order_ID" DataSourceID="EntityDataSource1" OnRowCommand="GridView1_RowCommand" 
                              GridLines="Horizontal" BorderWidth="0px" Width="100%" AllowPaging="True" AllowSorting="True" 
                              PageSize="5" CssClass="table table-striped table-hover" EmptyDataText="No records found." OnPageIndexChanging="GridView1_PageIndexChanging">
                              <RowStyle BorderColor="LightGray" />
                              <HeaderStyle CssClass="gridhead-t3"/>
                              <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                            <Columns>
                                <asp:BoundField DataField="Order_ID" HeaderText="Order_ID" ReadOnly="True" SortExpression="Order_ID" ItemStyle-Width="30%" />
                                <asp:BoundField DataField="User_ID" HeaderText="User_ID" SortExpression="User_ID" ItemStyle-Width="30%" />
                                <asp:BoundField DataField="Order_Date" HeaderText="Order_Date" SortExpression="Order_Date" ReadOnly="True"  DataFormatString="{0:dd-MMMMM-yyyy}" ItemStyle-Width="30%"/>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Detail" runat="server" CausesValidation="false" CommandName="Detail"
                                        CommandArgument='<%# Eval("Order_ID")+";"+ Eval("User_ID")+";"+ Eval("Order_Date") %>'>
                                        <span aria-hidden="true" class="glyphicon glyphicon-eye-open" title="Details" ></span>
                                        </asp:LinkButton>
                                        </ItemTemplate>
                                 </asp:TemplateField>
                         </Columns>
                        <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>                        
                        </asp:GridView>   
                        </div>
                    </div>                    
                    <div>
                        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=SSISEntities" DefaultContainerName="SSISEntities" EnableFlattening="False" EntitySetName="Purchase_Order">
                        </asp:EntityDataSource>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

