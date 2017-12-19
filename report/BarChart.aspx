<%@ Page Title="" Language="C#" MasterPageFile="~/StoreManagerMaster.Master" AutoEventWireup="true" codefile="BarChart.aspx.cs" Inherits="BarChart" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-t3">
        <div class="panel-heading-t3">
            <div class="row">
                <div class="col-md-12" style="text-align: left">
                    <asp:Label ID="lblManageCollectionDetails" runat="server" Text="Department Requisition Chart" CssClass="page-header"></asp:Label>
                </div>
                <div class="panel-body-t3">
                    <br />
                    <br />
    <link rel="stylesheet" href="http://jqueryui.com/themes/base/jquery.ui.all.css"/>
    <script src="http://jqueryui.com/jquery-1.6.2.js"></script>
    <script src="http://jqueryui.com/ui/jquery.ui.core.js"></script>
    <script src="http://jqueryui.com/ui/jquery.ui.widget.js"></script>
    <script src="http://jqueryui.com/ui/jquery.ui.datepicker.js"></script>
    <link rel="stylesheet" href="http://jqueryui.com/demos/demos.css"/>
    <script>
    $(function() {
        $( "#datepicker" ).datepicker();
    });
    </script>
    

   
                        <div class="row">
                        <div class="col-md-2" style="padding-left:110px;" >
        <asp:Label ID="Label1" runat="server" Font-Size="Small" Font-Bold="true">From Date:</asp:Label>
                            </div>
         <div class="col-md-7" style="padding-left:-10px;">
        <asp:DropDownList ID="fromdate" runat="server" DataSourceID="SqlDataSource2" DataTextField="Requisition_Date" DataValueField="Requisition_Date" CssClass="form-control input-lg" Width="15%">
        </asp:DropDownList>
             </div>
        </div>

        <br />
                      <div class="row">
                        <div class="col-md-2" style="padding-left:110px;" >
        <asp:Label ID="Label2" runat="server" Font-Size="Small" Font-Bold="true">To Date:</asp:Label>
                            </div>
                          <div class="col-md-7" style="padding-left:-10px;">
        <asp:DropDownList ID="todate" runat="server" DataSourceID="SqlDataSource2" DataTextField="Requisition_Date" DataValueField="Requisition_Date" CssClass="form-control input-lg" Width="15%" >
        </asp:DropDownList>
                              </div>
                          </div>
       
        <br />
                    <div class="row">
                        <div class="col-md-2" style="padding-left:110px;" >
        <asp:Label ID="Label3" runat="server" Font-Size="Small" Font-Bold="true">ITEM:</asp:Label>
                            </div>
                           <div class="col-md-7">
      <asp:DropDownList ID="CATDropDownList" runat="server" DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="Category" CssClass="form-control input-lg" Width="15%">
        </asp:DropDownList>
                               </div>
                        </div>
                    <br />
                    <br />
                     <div class="row">
                        <div class="col-md-2" style="padding-left:350px;" >
         <asp:Button ID="loadbtn" runat="server" OnClick="loadbtn_Click" Text="PROCESS" CssClass="btn btn-primary" />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSISConnectionString %>" SelectCommand="SELECT Requisition_Date FROM Stationery_Requisition ORDER BY Requisition_Date"></asp:SqlDataSource>
        <br />
                            </div>
                         </div>
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True"  Height="1202px" ReportSourceID="CrystalReportSource1"  ToolPanelWidth="200px" Width="1104px" EnableDatabaseLogonPrompt="False" ToolPanelView="None" />
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="CrystalReportProduct.rpt">
            </Report>
        </CR:CrystalReportSource>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSISConnectionString %>" SelectCommand="SELECT DISTINCT Stationery_Catalogue.Category FROM Stationery_Catalogue INNER JOIN Requisition_Items ON Stationery_Catalogue.Item_Number = Requisition_Items.Item_ID INNER JOIN Stationery_Requisition ON Requisition_Items.Requisition_ID = Stationery_Requisition.Requisition_ID AND Requisition_Items.Requisition_ID = Stationery_Requisition.Requisition_ID">
        </asp:SqlDataSource>
    
        </div>
                </div>
            </div>
        </div>
    
 </asp:Content>
