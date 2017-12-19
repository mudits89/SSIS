<%@ Page Title="" Language="C#" MasterPageFile="~/StoreClerk_MasterPage.master" AutoEventWireup="true" CodeFile="Store_RequisitionDetails.aspx.cs" Inherits="Store_RequisitionDetails" %>

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
                            <asp:Label ID="lblRequistionDetails" runat="server" Text="REQUISITION DETAILS"  CssClass="page-header"></asp:Label>
                         </div>
                    </div>
                </div>
               <div class="panel-body-t3">
                   <div class="row">
                       <div class="col-md-2" style="text-align:left">
                            <asp:Label ID="Label1" runat="server" Text="Requisition Form#:"  CssClass="label-t3" Font-Bold="true"></asp:Label>
                       </div>
                      
                       <div class="col-md-2" style="text-align:left">
                            <asp:Label ID="lblRequistionFormID" runat="server" CssClass="label-t3" ></asp:Label>
                       </div>
                   </div>
                   <div class="row">
                       <div class="col-md-2" style="text-align:left">
                            <asp:Label ID="Label2" runat="server" Text="Requistion Date:" CssClass="label-t3" Font-Bold="true"></asp:Label>
                       </div>
                      
                       <div class="col-md-2" style="text-align:left">
                           <asp:Label ID="lblRequistionDate" runat="server" CssClass="label-t3" ></asp:Label>
                       </div>
                   </div>
                     <div class="row">
                       <div class="col-md-2" style="text-align:left">
                             <asp:Label ID="Label3" runat="server" Text="Department Name:" CssClass="label-t3" Font-Bold="true"></asp:Label>&nbsp;</td>
                       </div>
                      
                       <div class="col-md-2" style="text-align:left">
                             <asp:Label ID="lblDepartmentName" runat="server" CssClass="label-t3"></asp:Label>
                       </div>
                   </div>
                     <div class="row">
                       <div class="col-md-2" style="text-align:left">
                             <asp:Label ID="Label4" runat="server" Text="Submitted By:" CssClass="label-t3" Font-Bold="true"></asp:Label>
                       </div>
                      
                       <div class="col-md-2" style="text-align:left">
                           <asp:Label ID="lblSubmittedBy" runat="server" CssClass="label-t3"></asp:Label>
                       </div>
                         <br /><br />
                   </div>
                     <div class="row">
                       <div class="col-md-2" style="text-align:left">
                             <asp:Label ID="Label5" runat="server" Text="Requisition Items:" CssClass="label-t3"  Font-Bold="true"></asp:Label>
                       </div>
                      
                       <div class="col-md-10" style="text-align:left">
                          <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-hover" AutoGenerateColumns="False" DataSourceID="EntityDataSource1"
                            GridLines="Horizontal" BorderWidth="0px"  Width="95%"
                            AllowPaging="True" AllowSorting="True"
                            Style="font-family: arial, sans-serif; font-size: small" PageSize="5">
                       
                            <Columns>
                                <asp:BoundField   DataField="Description" HeaderText="Description" ReadOnly="True" SortExpression="Description" ItemStyle-Width="50%" />
                                <asp:BoundField   DataField="Quantity" HeaderText="Quantity" ReadOnly="True" SortExpression="Quantity" ItemStyle-Width="25%"/>
                                <asp:BoundField   DataField="Measure_Unit" HeaderText="Measure_Unit" ReadOnly="True" SortExpression="Measure_Unit" ItemStyle-Width="25%"/>
                            </Columns>
                          <HeaderStyle CssClass="gridhead-t3"/>
                         <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                         <RowStyle BorderColor="LightGray" />
                        </asp:GridView>
                       </div>
                         <br /><br />    <br /><br />    <br /><br />
                   </div>

                    <div class="row">
                         
                         <div class="col-md-12" style="text-align:left;">
                            <asp:Button ID="btnApprove" runat="server" Text="Add to Retrival" CssClass="btn btn-primary" Width="89%"
                           OnClick="btnApprove_Click"  OnClientClick="return confirm('Are you sure you want to proceed?')" />

                              <asp:Button ID="btnReject" runat="server" Text="Back" CssClass="btn btn-primary"  PostBackUrl="~/com.ssis.storeclerk/Store_ListofRequisitionForms.aspx" /></td>
                         </div>
                       
                    </div>
               </div>
                 <br /><br />
       
           </div>
        </div>
        
         </div>
     <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=SSISEntities"
                    DefaultContainerName="SSISEntities" EnableFlattening="False" EntitySetName="Requisition_Items"
                    EntityTypeFilter="Requisition_Items"
                    Select="it.[Stationery_Catalogue].[Description], it.[Quantity], it.[Stationery_Catalogue].[Measure_Unit]"
                    OrderBy="it.[Quantity]">
                </asp:EntityDataSource>
    
</asp:Content>


