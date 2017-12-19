<%@ Page Title="" Language="C#" MasterPageFile="~/StoreManagerMaster.Master" AutoEventWireup="true" CodeFile="Store_ViewInvoice.aspx.cs" Inherits="Store_ViewInvoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1" style="width: 2%"></div>
        <div class="col-md-10" style="width: 96%">
            <div class="panel panel-t3">
                <div class="panel-heading-t3">
                    <div class="row" >
                    <div class="col-lg-9">
                     <div class="row" style="text-align:left">
                        <asp:Label ID="Label14" runat="server" Text=" INVOICE " CssClass="page-header"></asp:Label>
                         <asp:Image runat="server" ImageUrl="~/images/icon_invoice.png" style="font-size:xx-small; width:5%; height: 5%" />
                    </div>
                    <div class="row" style="text-align:left">
                        <div class="col-md-1" style="text-align:left; padding: 0px; width: 5%" >
                        <asp:Label ID="Label16" runat="server" Text="No. # "></asp:Label>
                        </div>
                        <div class="col-md-2">
                            &nbsp;<asp:Label ID="lblInvoice" runat="server" Text="Label"></asp:Label>
                        </div>
                    </div> 
                    <div class="row" style="text-align:left">
                        <asp:Label ID="lbldelivery" runat="server" Text="Label"></asp:Label>
                    </div>
                    </div>
                    <div class="col-lg-2">                        
                         <asp:LinkButton ID="lCatalogue" runat="server" OnClick="lCatalogue_Click" CssClass="btn bg-success">
                         <span class="glyphicon glyphicon-list-alt"> Stationery Catalogue</span>
                    </asp:LinkButton>
                    </div>
                    </div>
                    <br />
                    <div class="row" style="text-align:left">
                        
                           <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/supplierlogohere.png" Height="128px" Width="198px" />     
                        </div>
                    <br />
                        <div class="row" >
                            <div class="col-md-9" style="text-align:Left">
                                 <asp:Label ID="Label11" runat="server" CssClass="page-header" Text="LOGIC UNIVERSITY"></asp:Label>
                                 <hr />
                            </div>
                                <div class="col-md-1"  style="text-align:right; padding: 0px; width: 10%">
                                     <asp:Button ID="btnSendInvoice" runat="server" Text="Send Invoice" OnClick="btnSendInvoice_Click"
                                      CssClass="btn btn-primary" OnClientClick="return confirm('Will Your Invoice be forward ?');" />
                                       
                                 </div>
                                <div class="col-md-1" style="padding: 0px; width: 14%">
                                    <asp:Button ID="Button1" runat="server" 
                                    CssClass="btn btn-primary" OnClick="Button1_Click" Text="Back" />
                                    <br />
                                  
                                    <%--<asp:Button ID="printButton" runat="server" Text="Print" OnClientClick="javascript:window.print();" />--%>
                                </div>
                            </div>
                    <div class="row" style="text-align:Left">
                            <asp:Label ID="Label2" runat="server" Text=" Stationery Managing Department" CssClass="label-t3"></asp:Label>
                            <br />
                            <asp:Label ID="Label17" runat="server" Text="25 Heng Mui Keng Terrace"></asp:Label>
                            <br />
                            <asp:Label ID="Label18" runat="server" Text="Singapore 119615"></asp:Label>
                    </div> 
                    </div>                
                <div class="panel-body-t3">
		        <div class="row">
                        <div class="col-md-7">
                            <div class="row" >
                                <asp:Label ID="Label19" runat="server" Text="CLIENT INFORMATION : " CssClass="page-header"></asp:Label>
                                <asp:Label runat="server" CssClass="page-header"><span class="glyphicon glyphicon-info-sign" style="font-size:x-large"></span></asp:Label>
                             </div>
                             <div class="row">
                                 <asp:Label ID="lblName" runat="server" Text="Name" CssClass="label-t3"></asp:Label>
                            </div>
                             <div class="row">
                                 <asp:Label ID="lblPhone" runat="server" Text="Phone" CssClass="label-t3"></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-5">
                             <div class="row">
                                <asp:Label ID="Label15" runat="server" Text="Supplier Info:" CssClass="page-header"></asp:Label>                       
                                 <asp:Label runat="server" CssClass="page-header"><span class="glyphicon glyphicon-info-sign" style="font-size:x-large"></span></asp:Label>
                              </div>
                             <div class="row">
                                 <div class="col-md-4" >
                                     <asp:Label ID="Label3" runat="server" CssClass="label-t3" Text="SUPPLIER NAME : "></asp:Label>
                                 </div>
                                 <div class="col-md-4" >
                                      <asp:Label ID="lblsupname" runat="server" Text="Label" CssClass="label-t3"></asp:Label>
                                 </div>
                            </div>
                             <div class="row">
                                  <div class="col-md-4">
                                        <asp:Label ID="Label12" runat="server" CssClass="label-t3" Text="CONTANCT NUMBER:"></asp:Label>
                                 </div>
                                 <div class="col-md-2" >
                                        <asp:Label ID="lblcontanct" runat="server" Text="Label" CssClass="label-t3"></asp:Label>
                                 </div>
                            </div>
                             <div class="row">
                                  <div class="col-md-4">
                                       <asp:Label ID="Label13" runat="server" CssClass="label-t3" Text="FAX NUMBER :"></asp:Label>
                                 </div>
                                 <div class="col-md-2">
                                      <asp:Label ID="lblfax" runat="server" Text="Label" CssClass="label-t3"></asp:Label>
                                 </div>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-8">                        
                        <div class="row">
                            <asp:Label ID="Label4" runat="server" Text="ORDER INFO : " CssClass="label-t3"></asp:Label>
                            <asp:Label runat="server" CssClass="label-t3"><span class="glyphicon glyphicon-info-sign" style="font-size:medium"></span></asp:Label>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label ID="Label20" runat="server" Text="ORDER ID : " CssClass="label-t3"></asp:Label>
                                <br />
                                <asp:Label ID="Label5" runat="server" Text="STATUS : " CssClass="label-t3"></asp:Label>
                                <br />
                                <asp:Label ID="Label6" runat="server" Text="CATEGORY : " CssClass="label-t3"></asp:Label>
                                <br />
                                <asp:Label ID="Label7" runat="server" Text="DESCRIPTION : " CssClass="label-t3"></asp:Label>
                                <br />
                                <asp:Label ID="Label8" runat="server" Text="UNIT PRICE :" CssClass="label-t3"></asp:Label>
                                <br />
                                <asp:Label ID="Label9" runat="server" Text="QUANTITY :" CssClass="label-t3"></asp:Label>
                                <br />
                                <asp:Label ID="Label10" runat="server" Text="TOTAL AMOUNT :" CssClass="label-t3"></asp:Label>
                                <br />
                            </div>
                             <div class="col-md-4">
                                 <asp:Label ID="lblorderID" runat="server" Text="Label" CssClass="label-t3"></asp:Label>
                                 <br />
                                 <asp:Label ID="lblstatus" runat="server" Text="label" CssClass="label-warning"></asp:Label>
                                 <br />
                                 <asp:Label ID="lblcategory" runat="server" Text="Label" CssClass="label-t3"></asp:Label>
                                 <br />
                                 <asp:Label ID="lbldescription" runat="server" Text="Label" CssClass="label-t3"></asp:Label>
                                 <br />
                                 <asp:Label ID="lblunitprice" runat="server" Text="Label" CssClass="label-t3"></asp:Label>
                                 <br />
                                  <asp:Label ID="lblqty" runat="server" Text="Label" CssClass="label-t3"></asp:Label>
                                 <br />
                                 <asp:Label ID="lbltotal" runat="server" Text="Label" CssClass="label-t3"></asp:Label>
                                 <br />
                                 <br />
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="row" style="text-align:right">
                        <asp:Button ID="btnAddtoStock" runat="server" OnClick="btnAddtoStock_Click" 
                         CssClass="btn btn-primary"   ForeColor="White"  OnClientClick="return confirm('Do You want to add the Quantity ? ');" Text="Add to Stock" />
                    </div>
                    <br />
                </div>

            </div>
        </div>
    </div>
</asp:Content>

