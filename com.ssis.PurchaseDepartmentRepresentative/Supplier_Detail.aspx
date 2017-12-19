<%@ Page Language="C#" MasterPageFile="~/MasterPage_PurchaseDept.Master" AutoEventWireup="true" codefile="Supplier_Detail.aspx.cs" Inherits="Supplier_Detail" %>

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
                            <asp:Label ID="Label10" runat="server" Text="Supplier Details" CssClass="page-header"></asp:Label>
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
                            <asp:Label ID="Label2" runat="server" Text="Supplier Name:" Font-Size="Small" Font-Bold="true" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-2" style="padding-left: 40px;">
                            <asp:Label ID="Label1" runat="server" Text="" Font-Size="Small"></asp:Label>
                        </div>
                        <div class="col-md-8"></div>
                    </div>
                                   <br />   
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-6"></div>
                            
                        <div class="col-md-2">
                             <asp:LinkButton ID="Button1" runat="server" width="180px"
                                 OnCommand ="Button1_Click" OnClick="Button1_Click"                                
                                CssClass="btn btn-primary"> <span aria-hidden="true" class="glyphicon glyphicon-plus-sign"></span>&nbsp;Add Item</asp:LinkButton>
                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <br />

                    <div class="row">
                        <div class="col-md-2">
                            <asp:Label ID="Label3" runat="server" Text="Supplier Items:" Font-Size="Small" Font-Bold="true" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-1 visible-md visible-lg" style="width: 25px; padding: 0;"></div>
                        <div class="col-md-9">
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
                                <ContentTemplate>
                                    <asp:GridView ID="GridView1" runat="server" Width="90%" CssClass="table table-striped table-hover"
                                        AllowPaging="True" AllowSorting="True" PageSize="10" AutoGenerateColumns="false"
                                        GridLines="Horizontal" BorderWidth="0px" EmptyDataText="No records found."  
                                        OnPageIndexChanging="GridView1_PageIndexChanging">
                                    <HeaderStyle CssClass="gridhead-t3" />
                                    <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                                    <RowStyle BorderColor="LightGray" />  
    <Columns>
        
           <asp:BoundField DataField="Description" HeaderText="Description" />
           <asp:BoundField DataField="Price" HeaderText="Price" />

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
                        <div class="col-md-9 visible-md visible-lg" style="width: 800px; padding: 0;"></div>
                        <div class="col-md-3" style="position: static;">
                            <asp:Button ID="Button2" runat="server" Text="Done" Width="150px"
                                OnClick="Button2_Click" CssClass="btn btn-primary" />
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
