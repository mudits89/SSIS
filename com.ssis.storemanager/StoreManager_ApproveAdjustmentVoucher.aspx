<%@ Page Title="" Language="C#" MasterPageFile="~/StoreManagerMaster.Master" AutoEventWireup="true" CodeFile="StoreManager_ApproveAdjustmentVoucher.aspx.cs" Inherits="StoreManager_ApproveAdjustmentVoucher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link href="../style/StyleSheet1.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1" style="width: 2%"></div>
        <div class="col-md-10" style="width: 96%">
            <div class="panel panel-t3">
            <div class="panel-heading-t3">               
                <div class="col-md-10" style="text-align:left" >
                 <asp:Label ID="Label1" runat="server" Text="Approve Adjustment Voucher" CssClass="page-header"></asp:Label>
                 </div>
                </div>
                
         <div  class="panel-body-t3">
         <div class="row">                   
          <div class="col-md-12" >      
        <asp:GridView ID="GridVoucherRequest" runat="server" AutoGenerateColumns="False" GridLines="Horizontal" BorderWidth="0px" Width="100%" AllowPaging="True" AllowSorting="True" 
                         PageSize="5" CssClass="table table-striped table-hover" ShowFooter="True" OnRowCommand="Voucher_RowCommand"  EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataText="There is No Result Found" >
                        <RowStyle BorderColor="LightGray" />
                        <HeaderStyle CssClass="gridhead-t3"/>
                        <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />        
             <Columns>
               <asp:BoundField DataField="Stationery_Catalogue.Description" HeaderText="Item Name" ReadOnly="True"></asp:BoundField>
                  <asp:BoundField DataField="Quantity" HeaderText="Quantity" ReadOnly="True"></asp:BoundField>
                  <asp:BoundField DataField="Reason" HeaderText="Reason" ReadOnly="True"></asp:BoundField>
                    <asp:TemplateField>
                    <ItemTemplate>
                    <asp:HiddenField ID="LblVoucherId" runat="server" Value='<%#Eval("Voucher_ID") %>'></asp:HiddenField>
                    </ItemTemplate>
                    </asp:TemplateField>  
                   <asp:TemplateField HeaderText="Amount">
                    <ItemTemplate>
                    <asp:Label ID="LblAmount" runat="server" Text='<%# Convert.ToInt32(Eval("Stationery_Catalogue.Price"))*Convert.ToInt32(Eval("Quantity"))%>'>></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>  
                       <asp:TemplateField HeaderText="Approve">
                    <ItemTemplate>
                    <asp:Button ID="BtnApprove" runat="server" CommandName="Approve" CssClass="btn btn-primary" 
                        CommandArgument='<%# Container.DataItemIndex%>' OnClientClick="return confirm('Do you want to approve?');"  Text="Approve"> </asp:Button>
                    </ItemTemplate>
                    </asp:TemplateField>  
                  <asp:TemplateField HeaderText="Reject">
                    <ItemTemplate>
                    <asp:Button ID="BtnReject" runat="server" CommandName="Reject" CssClass="btn btn-primary" 
                        CommandArgument='<%# Container.DataItemIndex%>' OnClientClick="return confirm('Do you want to reject?');" Text="Reject"> </asp:Button>
                    </ItemTemplate>
                    </asp:TemplateField> 
             </Columns>
              <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>  
        </asp:GridView>
        </div>
        </div>
        </div>
    </div>
    </div>
    </div>
</asp:Content>
