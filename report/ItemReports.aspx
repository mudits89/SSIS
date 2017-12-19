<%@ Page Title="" Language="C#" MasterPageFile="~/StoreManagerMaster.Master" AutoEventWireup="true" codefile="ItemReports.aspx.cs" Inherits="ItemReports" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-t3">
        <div class="panel-heading-t3">
            <div class="row">
                <div class="col-md-12" style="text-align: left">
                    <asp:Label ID="lblManageCollectionDetails" runat="server" Text="Report of Requisition Item List Per Deparment" CssClass="page-header"></asp:Label>
                </div>
                <div class="panel-body-t3">
    <div>
    
        
        <br />
        <br />
        <br />
                    
                    <div class="row">
                        <div class="col-md-2" >
        <asp:Label ID="Label1" runat="server" Font-Size="Small" Font-Bold="true">From Date:</asp:Label>
                            </div>
                        <div class="col-md-7" style="padding-left:-50px;">
        <asp:DropDownList ID="fromdate" runat="server" DataSourceID="SqlDataSource2" DataTextField="Requisition_Date" DataValueField="Requisition_Date" CssClass="form-control input-lg" Width="15%" >
        </asp:DropDownList>
                           
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSISConnectionString %>" SelectCommand="SELECT DISTINCT [Requisition_Date] FROM [Stationery_Requisition]"></asp:SqlDataSource>
                             </div>
                        </div>
        <br />
                        <div class="row">
                        <div class="col-md-2" >
         <asp:Label ID="Label2" runat="server" Font-Size="Small" Font-Bold="true">To Date:</asp:Label>
                            </div>
                             <div class="col-md-7" style="padding-left:-10px;">
        <asp:DropDownList ID="todate" runat="server" DataSourceID="SqlDataSource2" DataTextField="Requisition_Date" DataValueField="Requisition_Date" CssClass="form-control input-lg" Width="15%" >
        </asp:DropDownList>
                                 </div>
                            </div>
        <br />
        <br />
     
                        <div class="row">
                        <div class="col-md-2" style="padding-left:225px;" >
         <asp:Label ID="Label3" runat="server" Font-Size="Small" Font-Bold="true">Category:</asp:Label>
                            </div>
                            <div class="col-md-7" style="padding-left:-10px;">
        <asp:DropDownList ID="CATDropDownList" runat="server" DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="Category" CssClass="form-control input-lg" Width="15%">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSISConnectionString %>" SelectCommand="SELECT DISTINCT [Category] FROM [Stationery_Catalogue]"></asp:SqlDataSource>
                                </div>
                            </div>
        <br />
        <br />
        <div class="row">
                        <div class="col-md-2" style="padding-left:300px;" >
        <asp:Button ID="processbtn" runat="server" OnClick="processbtn_Click" Text="PROCESS" Width="208px" CssClass="btn btn-primary" />
                            </div>
            </div>
    <br />
        <br />
        
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True" Height="1202px" ReportSourceID="CrystalReportSource1"  ToolPanelWidth="200px" Width="1104px" />
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="ItemComparisonChart.rpt">
            </Report>
        </CR:CrystalReportSource>
    </div>
                    </div>
                </div>
            </div>
        </div>
 </asp:Content>