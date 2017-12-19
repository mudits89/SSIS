<%@ Page Language="C#" MasterPageFile="~/MasterPage_Employee.Master" AutoEventWireup="true" CodeFile="StationeryCart.aspx.cs" Inherits="StationeryCart" %>

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
                            <asp:Label ID="LblCartDetails" runat="server" Text=" My Cart" CssClass="page-header"></asp:Label>
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

                    <br />

                    <div class="row">
                        <div class="col-md-2">
                            <asp:Label ID="Label5" runat="server" Text="Cart Items:" Font-Size="Small" Font-Bold="true" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-1 visible-md visible-lg" style="width: 25px; padding: 0;"></div>
                        <div class="col-md-9">
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
                                <ContentTemplate>
                                    <asp:GridView ID="GridStationeryCart" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover"
                                        GridLines="Horizontal" BorderWidth="0px" Width="90%"
                                        AllowSorting="True" PageSize="5" AllowPaging="True"
                                        OnRowCommand="remove_ItemRowCommand">
                                        <HeaderStyle CssClass="gridhead-t3" />
                                        <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                                        <RowStyle BorderColor="LightGray" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:HiddenField ID="HiddenItemNumber" runat="server" Value='<%# Eval("Item_Number") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Description" HeaderText="Description" ReadOnly="True"></asp:BoundField>
                                            <asp:BoundField DataField="Price" HeaderText="Price"
                                                HeaderStyle-CssClass="visible-md visible-lg" ItemStyle-CssClass="visible-md visible-lg"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Quantity">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="Quantity" OnTextChanged="Quantity_ChangeTextBox" Text='<%#Eval("Total_Quantity") %>' CssClass="form-control input-lg"></asp:TextBox>
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remove">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" CommandName="remove" CssClass="btn btn-link"
                                                        CommandArgument='<%# Eval("Item_Number") %>'>
                                  <span aria-hidden="true" class="glyphicon glyphicon-remove-sign" title="Remove" ></span>
                                                    </asp:LinkButton>
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                        </Columns>

                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>

                </div>

                <br />

                <div class="panel-footer-t3">
                    <div class="row">
                        <div class="col-md-8 visible-md visible-lg" style="width: 640px; padding: 0;"></div>
                        <div class="col-md-4" style="position: static;">
                            <asp:Button ID="BtnSubmit" runat="server" Text="Submit" Width="150px"
                                OnClientClick="return confirm('Are you sure you want to proceed?')" OnClick="BtnSubmit_Click" CssClass="btn btn-primary" />
                            &nbsp;
                                <asp:Button ID="BtnCancel" runat="server" Text="Back" Width="150px" PostBackUrl="~/com.ssis.employee/RequestStationery.aspx"
                                    CssClass="btn btn-outline" />
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
