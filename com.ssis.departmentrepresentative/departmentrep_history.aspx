<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_DeptRep.Master" AutoEventWireup="true" codefile="departmentrep_history.aspx.cs" Inherits="departmentrep_history" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row">
        <div class="col-md-1" style="width: 2%"></div>

        <div class="col-md-10" style="width: 96%">
            <div class="panel panel-t3">
                <div class="panel-heading-t3">
                    <div class="row">
                        <div class="col-md-12" style="text-align: left; padding-top: 2%; padding-left: 3%;">
                            <asp:Label ID="Label1" runat="server" Text="My Requisitions" CssClass="page-header"></asp:Label>
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

                    </div>
                </div>

                <br/><br/>

                <div class="panel-body-t3">

                    <div class="row">
                        <div class="col-md-1 visible-md visible-lg" style="width:30px;padding:0;"></div>
                        <div class="col-md-2" style="padding-top: 5px;">
                            <asp:Label ID="LblStationeryCategory" runat="server" Text="Requisition Status:" Font-Size="Small" Font-Bold="true" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-1 visible-md visible-lg" style="width:20px;padding:0;"></div>
                        <div class="col-md-3">
                            <asp:DropDownList ID="searchtxt" runat="server" AutoPostBack="true"  CssClass="form-control input-lg" OnSelectedIndexChanged="Button_click">
                                <asp:ListItem>Approved</asp:ListItem>
                                <asp:ListItem>Rejected</asp:ListItem>
                                <asp:ListItem>Pending</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-3"></div>               
                        <div class="col-md-2" ></div>                        
                        
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
                                    <asp:GridView ID="GridView2" runat="server" DataKeyNames="Requisition_ID" DataSourceID="SqlDataSource1"
                                        AutoGenerateColumns="False" GridLines="Horizontal" BorderWidth="0px" Width="100%"
                                        AllowPaging="True" AllowSorting="True" EmptyDataText="No records found." PageSize="5"
                                        CssClass="table table-striped table-hover">
                                        <HeaderStyle CssClass="gridhead-t3" />
                                        <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                                        <RowStyle BorderColor="LightGray" />
                                        <Columns>

                                            <asp:BoundField DataField="Requisition_ID" HeaderText="Requisition_ID" ReadOnly="true" InsertVisible="False" SortExpression="Requisition_ID" Visible="false" />
                                            <asp:BoundField DataField="Requisition_Date" HeaderText="Requisition_Date" SortExpression="Requisition_Date" DataFormatString="{0:dd-MMMMM-yyyy}"/>
                                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" 
                                                HeaderStyle-CssClass="visible-md visible-lg" ItemStyle-CssClass="visible-md visible-lg"/>
                                            <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" 
                                                HeaderStyle-CssClass="visible-md visible-lg" ItemStyle-CssClass="visible-md visible-lg"/>
                                            <asp:TemplateField ItemStyle-Width="10%" ShowHeader="False" HeaderText="Details">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CssClass="btn btn-link"
                                                        CommandName="Select" OnClick="RequisitionDetails_Click" CommandArgument='<%#Eval("Requisition_ID") %>' >
                                                        <span aria-hidden="true" class="glyphicon glyphicon-eye-open" title="Details" ></span></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="10%" ShowHeader="False" HeaderText="Cancel">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CssClass="btn btn-link"
                                                        CommandName="Delete" Visible='<%# Eval("Status").ToString().Equals("Pending") %>' OnClientClick="return confirm('Do you want to delete this order?');" >
                                                        <span aria-hidden="true" class="glyphicon glyphicon-remove-sign" title="Cancel" ></span></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>

                    <div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSISConnectionString %>" 
                            SelectCommand="SELECT * FROM [Stationery_Requisition] WHERE ([User_ID] = @User_ID)">
                            
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="2" Name="User_ID" SessionField="MySession" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
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
