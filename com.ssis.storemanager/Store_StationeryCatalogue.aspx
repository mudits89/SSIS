<%@ Page Title="" Language="C#" MasterPageFile="~/StoreManagerMaster.Master" AutoEventWireup="true" CodeFile="Store_StationeryCatalogue.aspx.cs" Inherits="Store_StationeryCatalogue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>Stationery Catalogue</title>
    <link href="../style/StyleSheet1.css" rel="stylesheet" />  
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">     
      <div class="row">
            <div class="col-md-1" style="width: 2%"></div>
            <div class="col-md-10" style="width: 96%">
       <div class="panel panel-t3">
            <div class="panel-heading-t3">
                <div class="row">
                    <div class="col-md-12" style="text-align:left">
                        <asp:Label ID="Label1" runat="server" Text="Stationery Catalogue" CssClass="page-header"></asp:Label>
                    </div>
                </div>
            </div>
          
                <div class="row">
                    <div class="col-md-6"></div>
                    <div class="col-md-2" style="padding: 0px; width: 12%"></div>
                   
                </div>
            <div class="panel-body-t3">
                <div class="row">
                    <div class="col-md-1"></div>         
                    <div class="col-md-1" style="padding: 0px; width: 10%">
                           <asp:Label ID="Label5" runat="server" Text="Sorted By : " CssClass="label-t3"></asp:Label>
                          
                    </div>
                    <div class="col-md-1" style="padding: 0px; width: 14%">
                           <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"  CssClass="input-lg" >
                                <asp:ListItem Text="--Search By--" Value="Initial" />
                                <asp:ListItem>Total Quantity</asp:ListItem>
                                <asp:ListItem>ReOrder Quantity</asp:ListItem>
                                <asp:ListItem>Price</asp:ListItem>
                                <asp:ListItem>Name</asp:ListItem>
                                <asp:ListItem>Category</asp:ListItem>
                           </asp:DropDownList>
                   </div>
                   <div class="col-md-5" style="text-align:left; padding: 0px; width: 20%">
                             <asp:LinkButton ID="SeeAll" runat="server" CssClass="btn btn-primary" OnClick="BtnSeeAll_Click" >
                            <span  class="glyphicon glyphicon-list"> View All Items</span>
                            </asp:LinkButton>
                       
                    </div>
                    <div class="col-md-1" style="padding: 0px; width: 25%" >
                           <asp:LinkButton ID="LbtnSeeAll0" runat="server" CssClass="btn btn-primary" OnClick="BtnSeeAll0_Click" >
                             <span class="glyphicon glyphicon-new-window"> Reorder Report</span>
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
            <div class="row"> 
                <div class="col-md-1"></div>       
                    <a href="Store_AddNewStationeryCatalogue.aspx" class="btn btn-primary" role="button"> <span aria-hidden="true"  class="glyphicon glyphicon-file" ><asp:Label ID="LblCount" style=" color:#fff; padding:0 0 0 0; vertical-align:top;" runat="server" CssClass="glyphicon glyphicon-plus"  ForeColor="Black" Font-Size="X-Small"/></span></a>  
            </div>
             <br />     
           <div class="row">
                <div class="col-md-12">
                     <asp:GridView ID="GridViewCatalogue" runat="server" AutoGenerateColumns="False" DataKeyNames="Item_Number" DataSourceID="EntityDataSource1" 
                         GridLines="Horizontal" BorderWidth="0px" Width="100%" AllowPaging="True" AllowSorting="True" 
                         PageSize="5" CssClass="table table-striped table-hover" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataText="There is No Result Found" OnRowDataBound="GridViewCatalogue_RowDataBound" OnPageIndexChanging="GridViewCatalogue_PageIndexChanging" OnRowUpdated="GridViewCatalogue_RowUpdated" OnRowDeleted="GridViewCatalogue_RowDeleted">
                         <RowStyle BorderColor="LightGray" />
                         <HeaderStyle CssClass="gridhead-t3"/>
                         <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                    <Columns>
                        <asp:BoundField DataField="Description" HeaderText="Item Name" SortExpression="Description" ItemStyle-Width="15%"  />
                        <asp:BoundField DataField="Item_Number" HeaderText="Item_Number" SortExpression="Item_Number" Visible="false" ItemStyle-Width="0%" />
                        <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" ItemStyle-Width="10%"  />                   
                        <asp:BoundField DataField="Reorder_Level" HeaderText="Reorder_Level" SortExpression="Reorder_Level" ItemStyle-Width="7%"  ReadOnly="true"  />
                        <asp:BoundField DataField="Reorder_Quantity" HeaderText="Reorder_Quantity" SortExpression="Reorder_Quantity" ItemStyle-Width="7%"  />
                        <asp:BoundField DataField="Measure_Unit" HeaderText="Measure_Unit" SortExpression="Measure_Unit" ItemStyle-Width="11%"  />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" ItemStyle-Width="10%"  ReadOnly="true" />
                        <asp:TemplateField HeaderText="Total_Quantity" ItemStyle-Width="10%" >
                            <ItemTemplate>
                                <asp:Label id="lblqty" runat="server" Text='<%#Eval("Total_Quantity") %>'></asp:Label>
                            </ItemTemplate> 
                        </asp:TemplateField>                   
                        <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-link"   EditText="<i aria-hidden='true' class='glyphicon glyphicon-pencil' title='Edit'></i>"  DeleteText="<i aria-hidden='true' class='glyphicon glyphicon-trash' title='Delete'></i>" ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                    <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>                        
                    </asp:GridView>                 
                 </div>
             </div>
                <div class="row">
                 <div class="col-md-2">
                            
                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-danger" Font-Size="Small"  >
                        10
                         </asp:LinkButton>- Out of Stock   
                        </div>
                 <div class="col-md-2">
                        <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-success" Font-Size="Small" >
                        50
                         </asp:LinkButton>-Sufficient Stock  
                        </div>
                </div>
           <br />
           
                <br />    
             <div>
                 <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=SSISEntities" DefaultContainerName="SSISEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Stationery_Catalogue">
                 </asp:EntityDataSource>
              </div>
              </div>
              </div>  
            </div>
            </div>
         
                 
</asp:Content>


