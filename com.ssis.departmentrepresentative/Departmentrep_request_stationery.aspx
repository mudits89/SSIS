<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_DeptRep.Master" AutoEventWireup="true" codefile="Departmentrep_request_stationery.aspx.cs" Inherits="Departmentrep_request_stationery" %>
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
                            <asp:Label ID="LblStationeryRequisition" runat="server" Text="Stationery Requisitions" CssClass="page-header"></asp:Label>
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
                            <asp:Label ID="LblStationeryCategory" runat="server" Text="Stationery Category:" Font-Size="Small" Font-Bold="true" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-1 visible-md visible-lg" style="width:20px;padding:0;"></div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="DropDownCategory" runat="server" AutoPostBack="True" CssClass="form-control input-lg" Width="100%"
                                OnSelectedIndexChanged="DropDownCategory_SelectedIndexChanged" >
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-3"></div>               
                        <div class="col-md-3" >                          
                            <asp:LinkButton ID="LinkButton1" runat="server" 
                                OnClick="ImgBtnCart_Click"
                                CssClass="btn btn-primary"> <span aria-hidden="true" class="glyphicon glyphicon-shopping-cart"></span>&nbsp;View Cart</asp:LinkButton>
                        </div>                        
                        
                    </div>
                                        
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-md-2">                            
                            <asp:Label ID="LblStioneryItem" runat="server" Text="Stationery Items:" Font-Size="Small" Font-Bold="true" CssClass="label-t3" Visible="False"></asp:Label>
                        </div>
                        <div class="col-md-1 visible-md visible-lg" style="width:18px;padding:0;"></div>
                        <div class="col-md-9">
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
                                <ContentTemplate>
                                    <asp:GridView ID="GridStationery" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover"
                                        GridLines="Horizontal" BorderWidth="0px" Width="90%"
                                        AllowPaging="True" AllowSorting="True" EmptyDataText="No stationery item selected." PageSize="5"
                                        OnRowCommand="addItem_RowCommand"
                                        OnPageIndexChanging="GridStationery_PageIndexChanging">
                                        <HeaderStyle CssClass="gridhead-t3" />
                                        <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                                        <RowStyle BorderColor="LightGray" />
                                        <Columns>
                                            <asp:BoundField DataField="Description" HeaderText="Description" ReadOnly="True"></asp:BoundField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Item_Number") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Price" HeaderText="Price"
                                                HeaderStyle-CssClass="visible-md visible-lg" ItemStyle-CssClass="visible-md visible-lg"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Quantity">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="Quantity" CssClass="form-control input-lg"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="Quantity" runat="server" CssClass="validator-t3"
                                                        ErrorMessage="Only numbers allowed" ValidationExpression="^[0-9]*$" SetFocusOnError="True"></asp:RegularExpressionValidator>
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
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>

                </div>

                <br />
            </div>
        </div>
    </div>


</asp:Content>
