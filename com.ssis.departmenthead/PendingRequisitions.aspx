<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_DeptHd.Master" AutoEventWireup="true" CodeFile="PendingRequisitions.aspx.cs" Inherits="PendingRequisitions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/StyleSheet1.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-md-1" style="width: 2%"></div>

        <div class="col-md-10" style="width: 96%">
            <div class="panel panel-t3">
                <div class="panel-heading-t3">
                    <div class="row">
                        <div class="col-md-12" style="text-align: left; padding-top: 2%; padding-left: 3%;">
                            <asp:Label ID="Label1" runat="server" Text="Pending Requisitions" CssClass="page-header"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <span class="underline-t3"></span>
                        </div>
                    </div>
                </div>

                <div class="row" style="height: 1px;">
                    <div class="col-md-8"></div>
                    <div class="col-md-3" style="padding: 0px;">
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1" runat="server" CssClass="validator-t3"
                            ControlToValidate="txtSearch"
                            ErrorMessage="Error! Invalid input provided"
                            ValidationExpression="^[A-Za-z0-9]{1,50}$"
                            Width="100%" SetFocusOnError="True"></asp:RegularExpressionValidator>
                    </div>
                </div>

                <div class="panel-body-t3">

                            <div class="row">
                                <div class="col-md-5 hidden-sm" style="padding: 0px; width: 575px"> </div>
                                <div class="col-md-1 visible-md visible-lg" style="padding: 0px; width: 140px">
                                    <asp:DropDownList ID="ddlSearchBy" runat="server" CssClass="form-control input-lg" Width="98%">
                                        <asp:ListItem Text="--Search By--" Value="Initial" />
                                        <asp:ListItem Value="it.[Requisition_Date]">Requisition Date</asp:ListItem>
                                        <asp:ListItem Value="it.[Employee].[Name]">Submitted By</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="col-md-4 input-group">
                                    <asp:TextBox ID="txtSearch" runat="server" TextMode="Search" Width="100%" CssClass="form-control input-lg"></asp:TextBox>
                                    <span class="input-group-btn"><asp:LinkButton ID="btnSearch2" runat="server" CssClass="btn btn-primary" OnClick="btnSearch_Click">
                                <span aria-hidden="true" class="glyphicon glyphicon-search" ></span></asp:LinkButton></span>
                                </div>

                            </div>

                    <br />
                    <br />

                    <div class="row">
                        <div class="col-md-1 visible-md visible-lg" style="width:40px;padding:0;"></div>
                        <div class="col-md-11" style="padding:0;margin:0;">
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
                                <ContentTemplate>
                                    <asp:GridView ID="dtgPendingRequisitions" runat="server" DataSourceID="EntityDataSource1" CssClass="table table-striped table-hover"
                                        AutoGenerateColumns="False" GridLines="Horizontal" BorderWidth="0px" Width="100%"
                                        AllowPaging="True" AllowSorting="True" EmptyDataText="No records found." PageSize="5"
                                        OnRowCommand="dtgPendingRequisitions_RowCommand"
                                        OnPageIndexChanging="dtgPendingRequisitions_PageIndexChanging">
                                        <HeaderStyle CssClass="gridhead-t3" />
                                        <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                                        <RowStyle BorderColor="LightGray" />
                                        <Columns>
                                            <asp:BoundField DataField="Requisition_ID" HeaderText="Requisition Form#" SortExpression="Requisition_ID" ReadOnly="True" Visible="false"></asp:BoundField>
                                            <asp:BoundField ItemStyle-Width="25%" DataField="Requisition_Date" HeaderText="Submission Date" SortExpression="Requisition_Date" ReadOnly="True" DataFormatString="{0:dd-MMMMM-yyyy}"></asp:BoundField>
                                            <asp:BoundField ItemStyle-Width="25%" DataField="Name" HeaderText="Submitted By" SortExpression="Name" ReadOnly="True"></asp:BoundField>
                                            <asp:BoundField ItemStyle-Width="30%" DataField="Status" HeaderText="Status" ReadOnly="True" SortExpression="Status" 
                                                HeaderStyle-CssClass="visible-md visible-lg" ItemStyle-CssClass="visible-md visible-lg"></asp:BoundField>
                                            <asp:TemplateField ItemStyle-Width="20%" HeaderText="Details">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="details" runat="server" CssClass="btn btn-link"
                                                        CommandName="details" CommandArgument='<%# Eval("[Requisition_ID]") + ";" + Eval("[Requisition_Date]") + ";" + Eval("[Name]") %>'>
                            <span aria-hidden="true" class="glyphicon glyphicon-eye-open" title="Details" ></span></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>

                    <div>
                        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=SSISEntities"
                            DefaultContainerName="SSISEntities" EnableFlattening="False" EntitySetName="Stationery_Requisition"
                            EntityTypeFilter="Stationery_Requisition" 
                            Select="it.[Requisition_ID], it.[Requisition_Date], it.[Employee].[Name], it.[Status]"
                            OrderBy="it.[Requisition_Date] DESC">

                            <WhereParameters>
                                <asp:ControlParameter ControlID="txtSearch" Name="SearchInput" Type="String" ConvertEmptyStringToNull="False" />
                            </WhereParameters>
                        </asp:EntityDataSource>
                    </div>

                </div>
                <br />
                <br />
                <br />
            </div>
        </div>
        <div class="col-md-1" style="width: 2%"></div>
    </div>

</asp:Content>
