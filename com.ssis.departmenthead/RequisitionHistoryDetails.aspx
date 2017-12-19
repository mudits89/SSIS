<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_DeptHd.Master" AutoEventWireup="true" CodeFile="RequisitionHistoryDetails.aspx.cs" Inherits="RequisitionHistoryDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/StyleSheet1.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-md-1" style="width: 2%"></div>

        <div class="col-md-11" style="width: 96%;">

            <div class="panel panel-t3">
                <div class="panel-heading-t3">
                    <div class="row">
                        <div class="col-md-12" style="text-align: left; padding-top: 2%; padding-left: 3%;">
                            <asp:Label ID="lblRequistionDetails" runat="server" Text="Requisition History Details" CssClass="page-header"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <span class="underline-t3"></span>
                        </div>
                    </div>
                </div>

                <br />

                <div class="panel-body-t3" style="padding-left: 2%;">
                    <div class="row">
                        <div class="col-md-2">
                            <asp:Label ID="Label1" runat="server" Text="Requisition Form ID:" Font-Size="Small" Font-Bold="true" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-2" style="padding-left: 40px;">
                            <asp:Label ID="lblRequistionFormID" runat="server" Font-Size="Small"></asp:Label>
                        </div>
                        <div class="col-md-8"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-2">
                            <asp:Label ID="Label2" runat="server" Text="Requistion Date:" Font-Size="Small" Font-Bold="true" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-2" style="padding-left: 40px;">
                            <asp:Label ID="lblRequistionDate" runat="server" Font-Size="Small"></asp:Label>
                        </div>
                        <div class="col-md-8"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-2">
                            <asp:Label ID="Label3" runat="server" Text="Submitted By:" Font-Size="Small" Font-Bold="true" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-2" style="padding-left: 40px;">
                            <asp:Label ID="lblSubmittedBy" runat="server" Font-Size="Small"></asp:Label>
                        </div>
                        <div class="col-md-8"></div>
                    </div>

                    <br />

                    <div class="row">
                        <div class="col-md-2">
                            <asp:Label ID="Label5" runat="server" Text="Requisition Items:" Font-Size="Small" Font-Bold="true" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-1 visible-md visible-lg" style="width: 25px; padding: 0;"></div>
                        <div class="col-md-9">
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
                                <ContentTemplate>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource1" CssClass="table table-striped table-hover"
                                        GridLines="Horizontal" BorderWidth="0px" Width="90%"
                                        AllowPaging="True" AllowSorting="True" EmptyDataText="No records found." PageSize="5">
                                        <HeaderStyle CssClass="gridhead-t3" />
                                        <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                                        <RowStyle BorderColor="LightGray" />
                                        <Columns>
                                            <asp:BoundField DataField="Description" HeaderText="Description" ReadOnly="True" SortExpression="Description" ItemStyle-Width="50%" />
                                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" ReadOnly="True" SortExpression="Quantity" ItemStyle-Width="25%" />
                                            <asp:BoundField DataField="Measure_Unit" HeaderText="Measure_Unit" ReadOnly="True" SortExpression="Measure_Unit" ItemStyle-Width="25%" />
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=SSISEntities"
                                DefaultContainerName="SSISEntities" EnableFlattening="False" EntitySetName="Requisition_Items"
                                EntityTypeFilter="Requisition_Items"
                                Select="it.[Stationery_Catalogue].[Description], it.[Quantity], it.[Stationery_Catalogue].[Measure_Unit]"
                                OrderBy="it.[Quantity]"
                                Where="it.[Requisition_ID]=@Requisition_ID">
                                <WhereParameters>
                                    <asp:SessionParameter Name="Requisition_ID" SessionField="Requisition_ID" Type="Int32" />
                                </WhereParameters>
                            </asp:EntityDataSource>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-2">
                            <asp:Label ID="Label4" runat="server" Text="Department Head's Comments:" Font-Size="Small" Font-Bold="true" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-1 visible-md visible-lg" style="width: 25px; padding: 0;"></div>
                        <div class="col-md-9">
                            <asp:TextBox ID="txtReason" runat="server" Width="70%" Height="100px"
                                TextMode="MultiLine" ReadOnly="true" CssClass="form-control input-lg"></asp:TextBox>
                        </div>
                    </div>

                </div>

                <br />

                <div class="panel-footer-t3">
                    <div class="row">
                        <div class="col-md-9 visible-md visible-lg" style="width: 800px; padding: 0;"></div>
                        <div class="col-md-3" style="position: static;">
                            <asp:Button ID="btnDone" runat="server" Text="Done" Width="150px"
                                OnClick="btnDone_Click" CssClass="btn btn-primary" />
                        </div>
                    </div>

                    <br />
                    <br />
                    <br />

                </div>

            </div>
        </div>
    </div>

</asp:Content>
