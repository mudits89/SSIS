 <%@ Page Title="" Language="C#" MasterPageFile="~/StoreManagerMaster.Master" AutoEventWireup="true" CodeFile="Store_SupplierforItems.aspx.cs" Inherits="Store_SupplierforItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>Supplier For Items</title>
    <link href="style/StyleSheet1.css" rel="stylesheet" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1" style="width: 2%"></div>
        <div class="col-md-10" style="width: 96%">
            <div class="panel panel-t3">
                <div class="panel-heading-t3"  style="text-align:left">
                    <asp:Label ID="Label3" runat="server" Text="Supplier Information" CssClass="page-header"></asp:Label>
                </div>
                <div class="panel-body-t3">
		<div class="row">
                        <div  class="col-md-1">  </div>
                        <div class="row">
                            <div  class="col-md-1">  </div>
                            <div  class="col-md-10"> 
                                 <asp:Label ID="Label1" runat="server" Text="Item Name : " CssClass="label-t3"></asp:Label>
                                 <asp:Label ID="lblName" runat="server" Text="Label" CssClass="label-t3"></asp:Label>
                            </div>
                            <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource1" EmptyDataText="Currently there is no supplier for this item\n Please Contact Purchasing Department for Tender Process" htmlencode="false"
                                 Width="100%" BorderWidth="0px" GridLines="Horizontal" AllowSorting="True" 
                                 PageSize="5" CssClass="table table-striped table-hover"
                                 AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="Supplier_Item_ID" OnRowDataBound="GridView1_RowDataBound">
                                 <RowStyle BorderColor="LightGray" />
                                 <HeaderStyle CssClass="gridhead-t3"/>
                                <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                        <Columns>
                            <asp:BoundField DataField="Supplier_Item_ID" HeaderText="Supplier_Item_ID"  SortExpression="Supplier_Item_ID" Visible="false" ItemStyle-Width="5%"/>
                            <asp:BoundField DataField="Supplier_Name" HeaderText="Supplier_Name" SortExpression="Supplier_Name" ItemStyle-Width="50%"  />
                            <asp:TemplateField ShowHeader="true" HeaderText="Rank" ItemStyle-Width="10%"> 
                                <ItemTemplate>
                                    <asp:Label id="lblrank" runat="server" Text='<%#Eval("Rank") %>'></asp:Label>
                                </ItemTemplate>
                             </asp:TemplateField>                            
                            <asp:CommandField ShowSelectButton="True"  ItemStyle-Width="15%" />                 
                        </Columns>
                        <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>
                         <selectedrowstyle BackColor="lightblue"/>
                        </asp:GridView>
                        
                            <div class="row">
                                  <div class="col-md-8"></div>
                                <div class="col-md-2">
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="OK" CssClass="btn btn-primary" />
                                </div>
                                <div  class="col-md-1">
                                    <asp:Button ID="Button2" runat="server"  
                                       CssClass="btn btn-primary" Text=" << Back" OnClick="Button2_Click" />
                                </div>
                            </div>
                         </div>
                        </div>
                        </div>
                        <div>
                            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=SSISEntities" DefaultContainerName="SSISEntities" EnableFlattening="False" EntitySetName="Supplier_Item" Select=" it.[Rank], it.[Supplier_Item_ID], it.[Supplier].[Supplier_Name]" EntityTypeFilter="" OrderBy="it.[Rank]">
                            </asp:EntityDataSource>
                        </div>
                    </div>
                    <br />
                    <br />
                </div>
            </div>
            </div>
            </div>
</asp:Content>

