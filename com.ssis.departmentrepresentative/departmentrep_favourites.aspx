<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_DeptRep.Master" AutoEventWireup="true" CodeFile="departmentrep_favourites.aspx.cs" Inherits="departmentrep_favourites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-t3">
        <div class="panel-heading-t3">
            <div class="row">
                <div class="col-md-12" style="text-align: left">
                    <asp:Label ID="lblManageCollectionDetails" runat="server" Text="Favourites" CssClass="page-header"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <span class="underline-t3"></span>
                </div>
            </div>
        </div>

        <div class="panel-body-t3">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowCommand="addItem_RowCommand" PageSize="5"
                AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" AllowSorting="True" Width="100%" GridLines="Horizontal" BorderWidth="0px" CssClass="table table-striped table-hover">
                <HeaderStyle CssClass="gridhead-t3" />
                <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                <RowStyle BorderColor="LightGray" />
                 <Columns>

                    <asp:BoundField DataField="item" HeaderText="item" SortExpression="item" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="Quantity" CssClass="form-control input-lg"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="Quantity" runat="server" CssClass="validator-t3"
                                ErrorMessage="Only numbers allowed" ValidationExpression="^[0-9]*$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("item") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Add">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="Add" CssClass="btn btn-link" CommandName="AddItem"
                                CommandArgument='<%# Container.DataItemIndex%>'>
                                                <span aria-hidden="true" class="glyphicon glyphicon-plus-sign" title="Add" ></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:LinkButton ID="LinkButton1" runat="server"
                OnClick="Button1_Click"
                CssClass="btn btn-primary"> <span aria-hidden="true" class="glyphicon glyphicon-shopping-cart"></span>&nbsp;View Cart</asp:LinkButton>
            <%--  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
ErrorMessage="RegularExpressionValidator" ControlToValidate="Quantity"
ValidationExpression="[1-9][0-9][0-9]"
ForeColor="Red">Invalid Quantity</asp:RegularExpressionValidator>--%>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSISConnectionString %>" SelectCommand="GetFavourites" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="employeeid" SessionField="&quot;Mysession&quot;" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
        <br />
        <br />
    </div>
</asp:Content>
