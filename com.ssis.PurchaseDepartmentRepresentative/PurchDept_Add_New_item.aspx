<%@ Page Language="C#" MasterPageFile="~/MasterPage_PurchaseDept.Master" AutoEventWireup="true" codefile="PurchDept_Add_New_item.aspx.cs" Inherits="PurchDept_Add_New_item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-md-1" style="width: 2%"></div>

        <div class="col-md-11" style="width: 96%;">

            <div class="panel panel-t3">
                <div class="panel-heading-t3">
                    <div class="row">
                        <div class="col-md-12" style="text-align: left; padding-top: 2%; padding-left: 3%;">
                            <asp:Label ID="Label4" runat="server" Text="Add Supplier Item" CssClass="page-header"></asp:Label>
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
                            <asp:Label ID="Label1" runat="server" Text="Select new Item:" Font-Size="Small" Font-Bold="true" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-5">
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control input-lg" AutoPostBack="True" Width="100%"
                                DataSourceID="SqlDataSource1" DataTextField="Description" DataValueField="Description">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-md-3">
                            <asp:Label ID="Label2" runat="server" Text="Assign Rank:" Font-Size="Small" Font-Bold="true" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-5">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" CssClass="radio-btn"
                                RepeatDirection="Vertical" AutoPostBack="False">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-5">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="validator-t3"
                                ControlToValidate="TextBox1"
                                ErrorMessage="RequiredFieldValidator">Please enter the price.</asp:RequiredFieldValidator>
                            &nbsp;
                                                                <asp:CompareValidator ID="cValidator" ControlToValidate="TextBox1" CssClass="validator-t3"
                                                                    Type="Currency" Display="Dynamic" Operator="DataTypeCheck" runat="server" EnableClientScript="true"
                                                                    ForeColor="Red">"Not a valid price, enter a decimal number." </asp:CompareValidator>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <asp:Label ID="Label3" runat="server" Text="Price:" Font-Size="Small" Font-Bold="true" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-5">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control input-lg"></asp:TextBox>
                        </div>
                    </div>

                </div>
                <br />

                <div class="panel-footer-t3">
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-9" style="padding-left: 35px;">
                            <asp:Button ID="Button1" runat="server" Text="Save" Width="150px"
                                OnClick="Button1_Click" OnClientClick="return confirm('Are you sure you want to proceed?')"
                                CssClass="btn btn-primary" />
                            &nbsp;
                            <asp:Button ID="Button2" runat="server" Text="Cancel" Width="150px"
                                PostBackUrl="~/com.ssis.PurchaseDepartmentRepresentative/Supplier_Detail.aspx" CssClass="btn btn-outline" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSISConnectionString %>"
                                SelectCommand="Desc_Not_Included" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:QueryStringParameter DefaultValue="BANE" Name="supplier_ID" QueryStringField="suppliername" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                    </div>

                    <br />

                </div>
                <br />
                <br />
            </div>
        </div>
    </div>


</asp:Content>
