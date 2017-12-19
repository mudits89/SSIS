<%@ Page Title="" Language="C#" MasterPageFile="~/StoreManagerMaster.Master" AutoEventWireup="true" CodeFile="StoreManager_Dashboard.aspx.cs" Inherits="Store_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1" style="width: 2%"></div>
        <div class="col-md-10" style="width: 96%">
            <div class="panel panel-t3">
                <div class="panel-heading-t3" style="text-align:left">
                    <asp:Label ID="Label1" runat="server" Text="Store Management Department" CssClass="page-header"></asp:Label>
                </div>
                <div class="panel-body-t3">
		        <div class="row">
                        <div  class="col-md-1">  </div>
                        <div class="col-md-12">
                        <div class="row" style="align-items: center;">   
                              <div class="col-md-3">
                              <asp:LinkButton runat="server" CssClass="btn btn-default btn-block" data-toggle="tooltip" title="Stationery Catalogue" style="height:150px; border-color:brown" >
                              <br /> <asp:ImageButton ID="ImageButton2" runat="server" PostBackUrl="~/com.ssis.storemanager/Store_StationeryCatalogue.aspx" style="height:100px; border-color:brown" ToolTip="Stationery Catalogue" ImageUrl="~/images/book.png" />
                               <br />   Stationery Catalogue
                               </asp:LinkButton> 
                                                                  
                                </div>
                         <div class="col-md-3">
                              <asp:LinkButton runat="server" CssClass="btn btn-default btn-block" data-toggle="tooltip" style="height:150px; border-color:brown" >
                              <br /> <asp:ImageButton ID="ImageButton4" runat="server" PostBackUrl="~/com.ssis.storemanager/Store_MakePurchaseOrder.aspx" style="height:100px; border-color:brown" ToolTip="Make Purchase Order" ImageUrl="~/images/purchase_order.png"  />
                               <br />   Make Purchase Order
                               </asp:LinkButton>
                                                              
                                </div>
                         <div class="col-md-3">
                              <asp:LinkButton runat="server" CssClass="btn btn-default btn-block" data-toggle="tooltip" style="height:150px; border-color:brown" >
                              <br /> <asp:ImageButton ID="ImageButton3" runat="server" PostBackUrl="~/com.ssis.storemanager/Store_ChangePurchaseOrder.aspx" style="height:100px; border-color:brown" ToolTip="Change Purchase Order" ImageUrl="~/images/change-purchase-order.png"  />
                               <br />   Change Purchase Order
                               </asp:LinkButton>                                 
                                </div>
                            
                         <div class="col-md-3">
                              <asp:LinkButton runat="server" CssClass="btn btn-default btn-block" data-toggle="tooltip" style="height:150px; border-color:brown" >
                              <br /> <asp:ImageButton ID="ImageButton1" runat="server" PostBackUrl="~/com.ssis.storemanager/Report_Dashboard.aspx" ImageUrl="~/images/report.png" style="height:100px; border-color:brown" ToolTip="Report" />
                               <br /> Report
                                  <br />
                               </asp:LinkButton>                             
                                </div>                         
                        </div>                           
                             <hr />                                                       
                        <div class="row">
                             <div class="col-md-3">
                              <asp:LinkButton runat="server" CssClass="btn btn-default btn-block" data-toggle="tooltip" style="height:150px; border-color:brown" >
                              <br /> <asp:ImageButton ID="ImageButton5" runat="server" PostBackUrl="~/com.ssis.storemanager/Store_ListofRequisitionForms.aspx" style="height:100px; border-color:brown" ToolTip="Requisition Form" ImageUrl="~/images/RequisitionForm.png"  />                                 
                               <br />   Requisition Form
                               </asp:LinkButton>
                                 
                                </div>
                             <div class="col-md-3">
                              <asp:LinkButton runat="server" CssClass="btn btn-default btn-block" data-toggle="tooltip" style="height:150px; border-color:brown" >
                              <br /> <asp:ImageButton ID="ImageButton6" runat="server" PostBackUrl="~/com.ssis.storemanager/Store_RetrivalForm.aspx" style="height:100px; border-color:brown" ToolTip="Retrieval List" ImageUrl="~/images/retrieval-list.png"  />                                 
                               <br />   Retrieval List
                               </asp:LinkButton>
                                 
                                </div>
                             <div class="col-md-3">
                              <asp:LinkButton runat="server" CssClass="btn btn-default btn-block" data-toggle="tooltip" style="height:150px; border-color:brown" >
                              <br />  <asp:ImageButton ID="ImageButton7" runat="server" PostBackUrl="~/com.ssis.storemanager/Store_Disbursement.aspx" style="height:100px; border-color:brown" ToolTip="Disbursement list" ImageUrl="~/images/disbursementicon.png"  />                                 
                               <br />  Disbursement List
                               </asp:LinkButton>
                                
                                </div>
                             <div class="col-md-3">
                              <asp:LinkButton runat="server" CssClass="btn btn-default btn-block" data-toggle="tooltip" style="height:150px; border-color:brown" >
                              <br /><asp:ImageButton ID="ImageButton8" runat="server" PostBackUrl="~/com.ssis.storemanager/Store_IOUList.aspx" style="height:100px; border-color:brown" ToolTip="IOU List" ImageUrl="~/images/IOU.jpg"  />
                               <br />   IOU List
                               </asp:LinkButton>
                                                                  
                                </div>

                        </div> 
                            <hr />                       
                        </div>   
                       
                    </div>
                    <br />                                     
                </div>

            </div>
        </div>
    </div>
   
   
</asp:Content>


