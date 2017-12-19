<%@ Page Language="C#" MasterPageFile="~/MasterPage_DeptHd.Master" AutoEventWireup="true" CodeFile="Assign_Authorized_Person.aspx.cs" Inherits="Assign_Authorized_Person" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/StyleSheet1.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1 visible-md visible-lg" style="width: 2%"></div>

        <div class="col-md-11" style="width: 96%;">
            <div class="panel panel-t3">
                <div class="panel-heading-t3">
                    <div class="row">
                        <div class="col-md-12" style="text-align: left; padding-top: 2%; padding-left: 3%;">
                            <asp:Label ID="Label1" runat="server" Text="Assign Authority" CssClass="page-header"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                    <div class="col-md-12">
                        <span class="underline-t3"></span>
                    </div>
                </div>
                </div>

                <br /><br />

                <div class="panel-body-t3" style="padding-left: 2%;">
                    <div class="row">
                        <div class="col-md-2">
                            <asp:Label ID="Label2" runat="server" Text="Employee List:" Font-Size="Small" Font-Bold="true" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-1 visible-md visible-lg" style="width:30px;padding:0;"></div>
                        <div class="col-md-5 input-group" style="text-align: left">
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EntityDataSource1" CssClass="form-control input-lg" Width="98%"
                                DataTextField="Name" DataValueField="Id">
                            </asp:DropDownList>
                            <span class="input-group-btn">
                            <asp:LinkButton ID="LinkButton1" runat="server" Width="100px"
                                OnClick="Button1_Click1" OnClientClick="return confirm('Are you sure you want to proceed?')"
                                CssClass="btn btn-primary"> <span aria-hidden="true" class="glyphicon glyphicon-plus-sign"></span>&nbsp;Add</asp:LinkButton>
                            </span>
                        </div>                        
                        <div class="col-md-4 visible-md visible-lg"></div>
                    </div>
                                        
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-md-2">
                            <asp:Label ID="Label3" runat="server" Text="Current Authorized Employee:" Font-Size="Small" Font-Bold="true" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-1 visible-md visible-lg" style="width:18px;padding:0;"></div>
                        <div class="col-md-9">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover"
                                GridLines="Horizontal" BorderWidth="0px" Width="90%" DataKeyNames="Id"
                                AllowPaging="True" AllowSorting="True" EmptyDataText="No authorized employee currently." PageSize="5"
                                OnRowCommand="GridView1_RowCommand">
                                <HeaderStyle CssClass="gridhead-t3" />
                                <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                                <RowStyle BorderColor="LightGray" />
                                <Columns>
                                    <asp:BoundField ItemStyle-Width="20%" DataField="Name" HeaderText="Name" SortExpression="Name" />
                                    <asp:BoundField ItemStyle-Width="20%" DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                                    <asp:BoundField ItemStyle-Width="40%" DataField="Address" HeaderText="Address" SortExpression="Address" />

                                    <asp:TemplateField ItemStyle-Width="20%" HeaderText="Remove">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="details" runat="server" CssClass="btn btn-link" CommandName="remove" OnClientClick="return confirm('Are you sure you want to proceed?')">
                                                <span aria-hidden="true" class="glyphicon glyphicon-remove-sign" title="Remove" ></span>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                </div>


                <div class="panel-footer-t3">

                    <div class="row">
                        <div class="col-md-12">
                            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=SSISEntities"
                                DefaultContainerName="SSISEntities" EnableFlattening="False" EntitySetName="Employees"
                                Select="it.[Id], it.[Name]"
                                EntityTypeFilter="Employee">
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
