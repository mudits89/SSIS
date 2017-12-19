<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_DeptRep.Master" AutoEventWireup="true" codefile="departmentrep_edit_delete.aspx.cs" Inherits="departmentrep_edit_delete" %>
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
                            <asp:Label ID="Label10" runat="server" Text="Requisition Details" CssClass="page-header"></asp:Label>
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
                            <asp:Label ID="Label1" runat="server" Text="Order ID:" Font-Size="Small" Font-Bold="true" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-2" style="padding-left: 40px;">
                            <asp:Label ID="requisitionlbl" runat="server" Font-Size="Small"></asp:Label>
                        </div>
                        <div class="col-md-8"></div>
                    </div>

                    <div class="row">
                    </div>

                    <br />

                    <div class="row">
                        <div class="col-md-2">
                            <asp:Label ID="Label6" runat="server" Text="Requisition Items:" Font-Size="Small" Font-Bold="true" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-1 visible-md visible-lg" style="width: 25px; padding: 0;"></div>
                        <div class="col-md-9">
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
                                <ContentTemplate>

                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Requisition_ID,Item_ID" DataSourceID="SqlDataSource1"
                                        GridLines="Horizontal" BorderWidth="0px" Width="90%"
                                        AllowPaging="True" AllowSorting="True" EmptyDataText="No records found." PageSize="5"
                                        CssClass="table table-striped table-hover">
                                        <HeaderStyle CssClass="gridhead-t3" />
                                        <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                                        <RowStyle BorderColor="LightGray" />
                                        <Columns>
                                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" Visible="false"/>
                                            <asp:BoundField DataField="Requisition_ID" HeaderText="Requisition_ID" ReadOnly="True" SortExpression="Requisition_ID" Visible="false" />
                                            <asp:BoundField DataField="Item_ID" HeaderText="Item_ID" ReadOnly="True" SortExpression="Item_ID" Visible="false" />
                                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" ReadOnly="True" />
                                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />

                                            <asp:TemplateField ShowHeader="False">
                                                <EditItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-link">
                                                        <span aria-hidden="true" class="glyphicon glyphicon-floppy-disk" title="Update"></span></asp:LinkButton>
                                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-link">
                                                        <span aria-hidden="true" class="glyphicon glyphicon-share-alt" title="Cancel" ></asp:LinkButton>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit Qty" Visible='<%# Eval("Status").ToString().Equals("Pending") %>' CssClass="btn btn-link">
                                                        <span aria-hidden="true" class="glyphicon glyphicon-edit" title="Edit" ></span></asp:LinkButton>
                                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                                        Visible='<%# Eval("Status").ToString().Equals("Pending") %>'
                                                        OnClientClick="return confirm('Do you want to delete the item');" CssClass="btn btn-link">
                                                    <span aria-hidden="true" class="glyphicon glyphicon-trash" title="Delete" ></span></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSISConnectionString %>" DeleteCommand="DELETE FROM [Requisition_Items] WHERE [Requisition_ID] = @Requisition_ID AND [Item_ID] = @Item_ID" InsertCommand="INSERT INTO [Requisition_Items] ([Requisition_ID], [Item_ID], [Quantity]) VALUES (@Requisition_ID, @Item_ID, @Quantity)" SelectCommand="GetOrderItems" UpdateCommand="UPDATE [Requisition_Items] SET [Quantity] = @Quantity WHERE [Requisition_ID] = @Requisition_ID AND [Item_ID] = @Item_ID" SelectCommandType="StoredProcedure">
                                <DeleteParameters>
                                    <asp:Parameter Name="Requisition_ID" Type="Int32" />
                                    <asp:Parameter Name="Item_ID" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Requisition_ID" Type="Int32" />
                                    <asp:Parameter Name="Item_ID" Type="String" />
                                    <asp:Parameter Name="Quantity" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="requisitionlbl" Name="OrderID" PropertyName="Text" Type="Int32" DefaultValue="18" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Quantity" Type="Int32" />
                                    <asp:Parameter Name="Requisition_ID" Type="Int32" />
                                    <asp:Parameter Name="Item_ID" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>


                <div class="panel-footer-t3">
                    <div class="row">
                        <div class="col-md-9 visible-md visible-lg" style="width: 800px; padding: 0;"></div>
                        <div class="col-md-3" style="position: static;">
                            <asp:Button ID="btnDone" runat="server" Text="Done" Width="150px" PostBackUrl="departmentrep_history.aspx"
                                CssClass="btn btn-primary" />
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

