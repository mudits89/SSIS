<%@ Page Title="" Language="C#" MasterPageFile="~/StoreManagerMaster.Master" AutoEventWireup="true" CodeFile="Store_ListofRequisitionForms.aspx.cs" Inherits="Store_ListofRequisitionForms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <div class="row">
        <div class="col-md-1" style="width: 2%"></div>

        <div class="col-md-10" style="width: 96%">
            <div class="panel panel-t3">
                <div class="panel-heading-t3">
                    <div class="row">
                        <div class="col-md-12" style="text-align:left">
                             <asp:Label ID="Label2" runat="server"  Text="Remaining IOU Items  " CssClass="page-header"></asp:Label>
                            <asp:Label ID="Lable21" runat="server" CssClass="page-header" ><span class="glyphicon glyphicon-lock"></span></asp:Label>
                            
                        </div>

                    </div>
                </div>

           <div class="panel-body-t3">
               <div class="row">
                    <div class="col-md-12" style="text-align:left">
                        <asp:Label runat="server"  CssClass="label-t3"> Department Name:&nbsp;&nbsp;&nbsp;</asp:Label> 
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="EntityDataSource4" DataTextField="Department_Name" DataValueField="Department_Name" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True" CssClass="input-lg">
                    </asp:DropDownList>
                    <a style="padding-left:50px; text-decoration:none;">
                     <asp:LinkButton ID="LButton5" runat="server"  CssClass="btn btn-primary" ><span class="glyphicon glyphicon-th-list
"></span> View All Items</asp:LinkButton>
                        </a>
                      <a style="padding-left:50px; text-decoration:none;">
                    <asp:TextBox ID="TextBox2" runat="server"  CssClass=" input-lg"></asp:TextBox>
                          </a>
                    <asp:LinkButton ID="linkbt2" runat="server"  CssClass="btn btn-primary" OnClick="Button4_Click" >
                          <span aria-hidden="true" class="glyphicon glyphicon-search"></span>
                         </asp:LinkButton>
                   <br /> <br />
                   </div>
               </div>
               <div class="row">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover" EmptyDataText="No Record Found" OnRowCommand="GridView2_AddRetrievalList"
                                   Width="100%" BorderWidth="0px" GridLines="Horizontal"    PageSize="8" AllowPaging="True" OnPageIndexChanging="GridRequisitionLists_PageIndexChanging" >
                                <Columns>
                                      <asp:BoundField  ItemStyle-Width="20%" DataField="Description"  HeaderText="Item" ReadOnly="True" SortExpression="Requisition_ID" />
                                      <asp:BoundField  ItemStyle-Width="20%" DataField="Department_Name" HeaderText="Department" SortExpression="Requisition_Date" />
                                      <asp:BoundField  ItemStyle-Width="20%" DataField="IOU_Quantity" HeaderText="IOU_Quantity" SortExpression="Name" ReadOnly="True" />
                                    <asp:TemplateField  ItemStyle-Width="40%">
                                        <ItemTemplate >
                                            <asp:LinkButton ID="insert" runat="server" CommandName="addRetrievalList" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>'><span class="glyphicon glyphicon-copy">(Add to Retrieval List)</span></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                             <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>

                                             <HeaderStyle CssClass="gridhead-t3"/>
                                             <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                                             <RowStyle BorderColor="LightGray" />
                            </asp:GridView>
                </div>
             </div>
                </div>
            </div>
    </div>
    <div class="row">
        <div class="col-md-1" style="width: 2%"></div>

        <div class="col-md-10" style="width: 96%">
            <div class="panel panel-t3">
                <div class="panel-heading-t3">
                    <div class="row">
                        <div class="col-md-12" style="text-align:left">
                           
                             <asp:Label ID="Label1" runat="server" CssClass="page-header" Text="Stationery Requisition Forms "></asp:Label>
                           <asp:Label ID="Label10" CssClass="page-header" runat="server"><span class="glyphicon glyphicon-list-alt "></span></asp:Label> 
                            </div>

                    </div>
                </div>

           <div class="panel-body-t3">
               <div class="row">
                 <div class="col-md-12" style="text-align:left">
                     <asp:Label runat="server"  CssClass="label-t3"> Department Name:&nbsp;&nbsp;&nbsp;</asp:Label> 

                  <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EntityDataSource2" DataTextField="Department_Name" DataValueField="Department_Name" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" Height="30px" Width="210px"  CssClass="input-lg" >
                        <asp:ListItem Selected="True" Value="Default">Selected the Department</asp:ListItem>
                    </asp:DropDownList>

                     <a style="padding-left:50px; text-decoration:none;">
           
                         <asp:LinkButton ID="BtnSeeAll" runat="server" OnClick="BtnSeeAll_Click"  CssClass="btn btn-primary" ><span class="glyphicon glyphicon-th-list
"></span> View All Items</asp:LinkButton>

                         
                      
                    </a>
                   
              
                    <a style="padding-left:50px; padding-right:0px; text-decoration:none;">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass=" input-lg"></asp:TextBox>
                    </a>
                       <a style="padding-left:0px; text-decoration:none;">
                    <asp:LinkButton ID="ButtonSearch" runat="server" CssClass="btn btn-primary" OnClick="ButtonSearch_Click" >
                          <span aria-hidden="true" class="glyphicon glyphicon-search"></span>
                         </asp:LinkButton>


                     </a>
                 </div>
                   <br /><br />
               </div>
              
                <div class="row">
                            <div class="col-md-12">
                     <asp:GridView ID="GridRequisitionLists" runat="server" AutoGenerateColumns="False"  CssClass="table table-striped table-hover"
                        DataKeyNames="Requisition_ID" DataSourceID="EntityDataSource1"
                        Width="100%" BorderWidth="0px" GridLines="Horizontal"
                     PageSize="8" AllowPaging="True"  EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataText="No records found." OnRowCommand="GridRequisitionLists_RowCommand" OnPageIndexChanging="GridRequisitionLists_PageIndexChanging" >
                        <Columns>
                          
                            <asp:BoundField  ItemStyle-Width="20%" DataField="Requisition_ID"  HeaderText="Requisition_ID" ReadOnly="True" SortExpression="Requisition_ID" />
                            <asp:BoundField  ItemStyle-Width="20%" DataField="Requisition_Date" HeaderText="Requisition_Date" SortExpression="Requisition_Date" />
                            <asp:BoundField  ItemStyle-Width="20%" DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True" />
                            <asp:BoundField  ItemStyle-Width="20%" DataField="Department_Name" HeaderText="Department_Name" SortExpression="Department_Name" />

                             <asp:TemplateField  ItemStyle-Width="20%"  SortExpression="Order ID">
                                <ItemTemplate>
                                    <asp:LinkButton ID="viewReq" runat="server"
                                        CommandName="View" CommandArgument='<%# Eval("[Requisition_ID]")  %>'> 
                                             <span aria-hidden="true" class="glyphicon glyphicon-eye-open" title="Details" ></span>
                          </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                        <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>

                         <HeaderStyle CssClass="gridhead-t3"/>
                         <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                         <RowStyle BorderColor="LightGray" />
                        
                    </asp:GridView>
                    </div>
                 </div>


        <br />
       
                                   
                    <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=SSISEntities" DefaultContainerName="SSISEntities" EnableFlattening="False" EntitySetName="Departments" Select="it.[Department_ID], it.[Department_Name]">
                    </asp:EntityDataSource>
                        
                    <asp:EntityDataSource ID="EntityDataSource4" runat="server" ConnectionString="name=SSISEntities" DefaultContainerName="SSISEntities" EnableFlattening="False" EntitySetName="Departments" Select="it.[Department_Name]">
                    </asp:EntityDataSource>

                    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=SSISEntities" DefaultContainerName="SSISEntities" EnableFlattening="False" EntitySetName="Stationery_Requisition" 
                     Select="it.[Requisition_ID], it.[Requisition_Date],it.[Employee].[Name], it.[Employee].[Department].[Department_Name]" OrderBy="it.[Requisition_Date]" AutoSort="False" EntityTypeFilter="" Where="it.[Status]='Approved'"></asp:EntityDataSource>
                    
         
   </div>
          
              </div>
            </div>
          </div>
                    
</asp:Content>


