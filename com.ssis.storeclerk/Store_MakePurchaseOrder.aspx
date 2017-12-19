<%@ Page Title="" Language="C#" MasterPageFile="~/StoreClerk_MasterPage.master" AutoEventWireup="true" CodeFile="Store_MakePurchaseOrder.aspx.cs" Inherits="Store_MakePurchaseOrder" %>

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
            <div class="panel-heading-t3">                 
            <div class="row">                
                <div class="col-md-10" style="text-align:left" >
                     <asp:Label ID="Label1" runat="server" CssClass="page-header" Text="Make Purchase Orders"></asp:Label>
                </div>
                
                 <div class="col-md-1">                        
                        <asp:LinkButton ID="LShoppingCart" runat="server" OnClick="LShoppingCart_Click" >
                        <span class="glyphicon glyphicon-shopping-cart" style="font-size:x-large; padding:0; width:19px;">
                        </span>
                             <asp:Label ID="LblCount" style="background:#ff0000; color:#fff; padding:0 0 0 0; vertical-align:top;" runat="server" CssClass="badge badge-warning"  ForeColor="Black" Text="0"/>
                        </asp:LinkButton>
                        
                </div> 
                <div class="col-md-1">                        
                        <asp:LinkButton ID="LClearCart" runat="server" OnClick="LClearCart_Click" >                        
                        <asp:ImageButton ID="ClearCart" runat="server" OnClick="ClearCart_Click" ImageUrl="~/images/clear shoppingcart.png" style="font-size:small; width: 30px;" />                           
                        </asp:LinkButton>
                    
                        
                </div> 
            </div>
            </div>
            <div  class="panel-body-t3">
                <div class="row">                   
                    <div class="col-md-1" style="padding: 0px; width: 10%">
                         <asp:Label ID="Label2" runat="server" Text="Sorted By : " CssClass="label-t3"></asp:Label>
                    </div>
                    <div class="col-md-1" style="padding: 0px; width: 14%">
                         <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="25px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="input-lg">
                                <asp:ListItem Text="--Search By--" Value="Initial" />
                                <asp:ListItem>Total Quantity</asp:ListItem>
                                <asp:ListItem>ReOrder Quantity</asp:ListItem>
                                <asp:ListItem>Price</asp:ListItem>
                                <asp:ListItem>Name</asp:ListItem>
                                <asp:ListItem>Category</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                       <div class="col-md-5" style="text-align:left; padding: 0px; width: 20%">
                           <asp:LinkButton ID="Button2" runat="server" Text="See All" CssClass="btn btn-primary" OnClick="BtnSeeAll_Click" >
                               <span  class="glyphicon glyphicon-list">View All Items</span>
                           </asp:LinkButton>
                       </div>
                    <div class="col-md-1" style="padding: 0px; width: 13%" >
                         <asp:LinkButton ID="lCatalogue" runat="server" OnClick="lCatalogue_Click" CssClass="btn bg-success">
                         <span class="glyphicon glyphicon-list-alt">Catalogue</span>
                    </asp:LinkButton>
                    </div>
                    <div class="col-md-1" style="padding: 0px; width: 20%" >
                         <asp:LinkButton ID="lRetrievalbtn" runat="server" OnClick="lRetrievalbtn_Click" CssClass="btn bg-success">
                         <span class="glyphicon glyphicon-list-alt">Retrieval List</span>
                    </asp:LinkButton>
                    </div>
                    <div class="col-md-1" style="text-align:right; padding: 0px; width: 14%">   
                        <asp:TextBox ID="txtSearch" runat="server" Width="174px" CssClass="input-lg" ></asp:TextBox>
                    </div>
                    <div class="col-md-2" style="padding: 0px; width: 5%"> 
                        <asp:LinkButton ID="btnSearch2" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click">
                        <span aria-hidden="true"  class="glyphicon glyphicon-search" ></span></asp:LinkButton>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12">
                         <asp:GridView ID="GridViewCatalogue" runat="server" AutoGenerateColumns="False" DataKeyNames="Item_Number" DataSourceID="EntityDataSource1"  
                         GridLines="Horizontal" BorderWidth="0px" Width="100%" AllowPaging="True" AllowSorting="True" 
                         PageSize="5" CssClass="table table-striped table-hover" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataText="There is No Result Found" OnRowCommand="GridViewCatalogue_RowCommand" OnRowDataBound="GridViewCatalogue_RowDataBound" OnPageIndexChanging="GridViewCatalogue_PageIndexChanging" >
                        <RowStyle BorderColor="LightGray" />
                        <HeaderStyle CssClass="gridhead-t3"/>
                        <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                        <Columns>
                            <asp:BoundField DataField="Description" HeaderText="Name" SortExpression="Description" ItemStyle-Width="15%" />
                            <asp:BoundField DataField="Item_Number" HeaderText="Item_Number" ReadOnly="True" SortExpression="Item_Number" Visible="false" ItemStyle-Width="0%" />
                            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" ItemStyle-Width="10%" />  
                            <asp:BoundField DataField="Reorder_Level" HeaderText="Reorder_Level" SortExpression="Reorder_Level" ItemStyle-Width="7%" />
                            <asp:BoundField DataField="Reorder_Quantity" HeaderText="Reorder_Quantity" SortExpression="Reorder_Quantity" ItemStyle-Width="7%" />
                            <asp:BoundField DataField="Measure_Unit" HeaderText="Measure_Unit" SortExpression="Measure_Unit" ItemStyle-Width="11%" />
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" ItemStyle-Width="10%"  />
                            <asp:TemplateField HeaderText="Total_Quantity" ItemStyle-Width="10%">
                                <ItemTemplate>
                                    <asp:Label id="lblqty" runat="server" Text='<%#Eval("Total_Quantity") %>'></asp:Label>
                                </ItemTemplate> 
                            </asp:TemplateField>                                 
                            <asp:TemplateField ShowHeader="False" ItemStyle-Width="50%">
                                <ItemTemplate>
                                    <asp:LinkButton ID="Button1" runat="server" CausesValidation="false" CommandName="AddToCart"
                                    CommandArgument='<%# Eval("Item_Number") %>' >
                                    <span class="glyphicon glyphicon-shopping-cart" style="font-size:large; padding:0; width:19px;">
                                    </span>
                             <asp:Label ID="LblCount" runat="server" style="vertical-align:top;" CssClass="glyphicon glyphicon-plus"  Font-Size="X-Small"/>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                       </Columns>
                       <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>  
                       </asp:GridView>
                    </div>
                     <div class="row" >
                        <div class="col-md-2">
                            
                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-danger" Font-Size="Small" >
                        10
                         </asp:LinkButton>-  Out of Stock   
                        </div>                      
                         <div class="col-md-2">
                                 <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primary">                       
                                    <span class="glyphicon glyphicon-search" style="font-size:large; padding:0; width:19px;"></span>                            
                         </asp:LinkButton>- Search 
                         </div>
                           <div class="col-md-2">
                            <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-link">                       
                                    <span class="glyphicon glyphicon-shopping-cart" style="font-size:large; padding:0; width:19px;"></span>
                             <asp:Label ID="Label3" runat="server" style="vertical-align:top;" CssClass="glyphicon glyphicon-plus"  Font-Size="X-Small"/>                                   
                         </asp:LinkButton> - Add To Cart 
                        </div>                                        
                    </div>
                    <br />   
                </div>
                <div>
                    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=SSISEntities" DefaultContainerName="SSISEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Stationery_Catalogue" EntityTypeFilter="" OrderBy="it.[Total_Quantity]" Select="" Where="it.[Total_Quantity]&lt;= it.[Reorder_Level]">
                    </asp:EntityDataSource> 
                </div>
            </div>                     
            <div class="col-md-1" style="width: 2%"></div>           
            </div>     
            </div>
            </div>     
</asp:Content>
