<%@ Page Language="C#" MasterPageFile="~/MasterPage_PurchaseDept.Master" AutoEventWireup="true" codefile="MaintainSupplierInformation.aspx.cs" Inherits="MaintainSupplierInformation" %>

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
                            <asp:Label ID="Label1" runat="server" Text="Supplier Information" CssClass="page-header"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <span class="underline-t3"></span>
                        </div>
                    </div>
                </div>

                <br />
                <br />

                <div class="panel-body-t3" style="padding-left: 2%;">
                    <div class="row">
                        <div class="col-md-3">
                            <asp:Label ID="Label2" runat="server" Font-Size="Small" Font-Bold="true" CssClass="label-t3">Select Stationery Category: <span style="color:#ff0000">*</span></asp:Label>
                        </div>
                        <div class="col-md-5">
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EntityDataSource1" CssClass="form-control input-lg" Width="100%"
                                DataTextField="Category" DataValueField="Category" AutoPostBack="True"
                                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    </div>

                    <br />

                    <div class="row">
                        <div class="col-md-3">
                            <asp:Label ID="Label3" runat="server" Font-Size="Small" Font-Bold="true" CssClass="label-t3">Select Stationery Item: <span style="color:#ff0000">*</span></asp:Label>
                        </div>
                        <div class="col-md-5">
                            <asp:DropDownList ID="DropDownList2" runat="server" OnDataBound="Page_Load" CssClass="form-control input-lg" Width="100%">
                            </asp:DropDownList>
                        </div>
                    </div>

                    <br />
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-9">
                            <asp:LinkButton ID="Button" runat="server" Width="150px"
                                OnClick="Button1_Click" CssClass="btn btn-primary">
                                <span aria-hidden="true" class="glyphicon glyphicon-search" ></span>&nbsp;Search</asp:LinkButton>
                        </div>
                    </div>
                    
                    <br />
                    <br />

                    <div class="row">
                        <div class="col-md-9"></div>
                        <div class="col-md-2">
                            <asp:LinkButton ID="LinkButton3" runat="server" Width="150px"
                                OnClick="btnnewSupplier_Click"
                                CssClass="btn btn-primary"><span aria-hidden="true" class="glyphicon glyphicon-plus-sign"></span>&nbsp;Add Supplier</asp:LinkButton>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-3">
                            <asp:Label ID="Label6" runat="server" Text="Stationery Suppliers:" Font-Size="Small" Font-Bold="true" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-1 visible-md visible-lg" style="width: 18px; padding: 0;"></div>
                        <div class="col-md-9">
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
                                <ContentTemplate>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover"
                                        GridLines="Horizontal" BorderWidth="0px" Width="90%"
                                        AllowPaging="True" AllowSorting="True" EmptyDataText="No records found." PageSize="5"
                                        OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                                        OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand">
                                        <HeaderStyle CssClass="gridhead-t3" />
                                        <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                                        <RowStyle BorderColor="LightGray" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:HiddenField ID="SupplierID" runat="server" Value='<%#Eval("Supplier_ID")%>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:BoundField ItemStyle-Width="10%" DataField="Rank" HeaderText="Rank" ReadOnly="True" SortExpression="Rank" />
                                            <asp:BoundField DataField="Supplier_Name" HeaderText="Supplier Name" ReadOnly="True" SortExpression="Supplier_Name" />
                                            <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="True" SortExpression="Address" 
                                                HeaderStyle-CssClass="visible-md visible-lg" ItemStyle-CssClass="visible-md visible-lg" />
                                            <asp:BoundField DataField="Contact_Number" HeaderText="Contact Number" ReadOnly="True" SortExpression="Contact_Number" 
                                                HeaderStyle-CssClass="visible-md visible-lg" ItemStyle-CssClass="visible-md visible-lg" />
                                            <asp:BoundField DataField="Fax_Number" HeaderText="Fax Number" ReadOnly="True" SortExpression="Remarks" 
                                                HeaderStyle-CssClass="visible-md visible-lg" ItemStyle-CssClass="visible-md visible-lg" />
                                            <asp:TemplateField ItemStyle-Width="10%" HeaderText="Details">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="sid" runat="server" CssClass="btn btn-link"
                                                        CommandName="supid" CommandArgument='<%#Eval("Supplier_ID")%>'>
                                        <span aria-hidden="true" class="glyphicon glyphicon-eye-open" title="Details" ></span></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="10%" HeaderText="Remove">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-link"
                                                        OnClientClick="return confirm('Do you want to delete the Supplier');" CausesValidation="False"
                                                        CommandName="Delete">
                                        <span aria-hidden="true" class="glyphicon glyphicon-remove-sign" title="Remove" ></span></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>



                <div class="panel-footer-t3">

                    <div class="row">
                        <div class="col-md-12">
                            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=SSISEntities"
                                DefaultContainerName="SSISEntities" EnableFlattening="False" EntitySetName="Stationery_Catalogue"
                                Select="DISTINCT it.[Category]" EntityTypeFilter="">
                            </asp:EntityDataSource>
                        </div>
                        <div class="col-md-12">
                        </div>
                    </div>

                </div>
                <br />
            </div>
        </div>
    </div>

</asp:Content>
