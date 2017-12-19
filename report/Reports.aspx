<%@Page Title="" Language="C#" MasterPageFile="~/StoreManagerMaster.Master" AutoEventWireup="true" codefile="Reports.aspx.cs" Inherits="Reports" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-t3">
        <div class="panel-heading-t3">
            <div class="row">
                <div class="col-md-12" style="text-align: left">
                    <asp:Label ID="lblManageCollectionDetails" runat="server" Text="Report of Requisiton Items by Deparment" CssClass="page-header"></asp:Label>
                </div>
                <div class="panel-body-t3">

    <div>
    
       
        <br />
        <br />
            <div class="row">
                        <div class="col-md-2" >
         <asp:Label ID="Label1" runat="server" Font-Size="Small" Font-Bold="true">From Date:</asp:Label>
                            </div>
                <div class="col-md-6">
            <asp:DropDownList ID="fromdate" runat="server" DataSourceID="SqlDataSource1" DataTextField="Requisition_Date" DataValueField="Requisition_Date" CssClass="form-control input-lg" Width="15%">
        </asp:DropDownList>
                
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSISConnectionString %>" SelectCommand="SELECT DISTINCT [Requisition_Date] FROM [Stationery_Requisition]"></asp:SqlDataSource>
            </div>
                </div>
        <br />
        <br />
         <div class="row">
                        <div class="col-md-2" >
         <asp:Label ID="Label2" runat="server" Font-Size="Small" Font-Bold="true">To Date:</asp:Label>
                            </div>
             <div class="col-md-6">
        <asp:DropDownList ID="todate" runat="server" DataSourceID="SqlDataSource1" DataTextField="Requisition_Date" DataValueField="Requisition_Date" CssClass="form-control input-lg" Width="15%" >
        </asp:DropDownList>
                 </div>
             </div>
         <div class="row">
             <br />
             <br />
                        <div class="col-md-2" >
         <asp:Label ID="Label3" runat="server" Font-Size="Small" Font-Bold="true">Category:</asp:Label>
                            </div>
               <div class="col-md-6">
        <asp:DropDownList ID="CATDropDownList" runat="server" DataSourceID="SqlDataSource2" DataTextField="Category" DataValueField="Category" CssClass="form-control input-lg" Width="15%" >
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSISConnectionString %>" SelectCommand="SELECT DISTINCT [Category] FROM [Stationery_Catalogue]"></asp:SqlDataSource>
                   </div>
             </div>
        <br />
        <br />
          <div class="row">
                        <div class="col-md-2" style="padding-left:300px;" >
        <asp:Button ID="Processbtn" runat="server" OnClick="Processbtn_Click" Text="Process" Width="164px" CssClass="btn btn-primary" />
                            </div>
              </div>
        <br />
         <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True"  Height="1202px" ReportSourceID="CrystalReportSource1" ToolPanelView="ParameterPanel" ToolPanelWidth="200px" Width="1104px" />
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="IOUComparisonChart.rpt">
            </Report>
        </CR:CrystalReportSource>
    
    </div>
                    </div>
                </div>
            </div>
        </div>
 </asp:Content>
