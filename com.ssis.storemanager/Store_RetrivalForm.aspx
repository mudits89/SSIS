<%@ Page Title="" Language="C#" MasterPageFile="~/StoreManagerMaster.Master" AutoEventWireup="true" CodeFile="Store_RetrivalForm.aspx.cs" Inherits="Store_RetrivalForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="row">
        <div class="col-md-1" style="width: 2%"></div>

        <div class="col-md-10" style="width: 96%">        
            <div class="panel panel-t3">
                        <div class="panel-heading-t3">
                            <div class="row">
                                <div class="col-md-12" style="text-align:left">
                                     <asp:Label ID="lbl2" runat="server"  Text="Retrieval List  " CssClass="page-header"></asp:Label>
                                    <asp:Label  runat="server" CssClass="page-header"><span class="glyphicon glyphicon-level-up"></span></asp:Label>
                                    
                                </div>

                            </div>
                        </div>

                       <div class="panel-body-t3">
                           <div class="row">
                                <div class="col-md-12" style="text-align:left">
                                    <asp:GridView ID="GridView1" runat="server" Font-Names="Tw Cen MT"  AutoGenerateColumns="False"    Width="100%" BorderWidth="0px" GridLines="Horizontal" OnPreRender="GridView1_PreRender" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="Department_Orders_ID" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                                        <Columns>
                                             <asp:TemplateField HeaderText="Id" Visible="false" >
                                                 <ItemTemplate>
                                                   <asp:Label ID="lblId" runat="server" CssClass="label-t3" Text='<%#Eval("Department_Orders_ID") %>' Font-Size="Medium"></asp:Label>
                                                 </ItemTemplate>
                                            </asp:TemplateField>
                                             
                                            <asp:BoundField DataField="Item" HeaderText="Item" ReadOnly="True" SortExpression="Item" ItemStyle-Width="15%" />
                                            <asp:BoundField DataField="Department_Name" HeaderText="Department_Name" ReadOnly="True" SortExpression="Department_Name" ItemStyle-Width="15%" />
                                           <%-- <asp:BoundField DataField="Requisition_Quantity" HeaderText="Needed Quantity" ReadOnly="True" SortExpression="Needed" />--%>
                                            <asp:TemplateField HeaderText="Needed Quantity" ItemStyle-Width="10%">
                                                 <ItemTemplate>
                                                        <asp:Label id="lblretirevaltotal" runat="server" Text='<%#Eval("Requisition_Quantity") %>'></asp:Label>
                                                </ItemTemplate> 
                                             </asp:TemplateField>
                                       <%--    <asp:BoundField DataField="Fulfilled_Quantity" HeaderText="Actual Reterival Quantity" ReadOnly="True" SortExpression="Actual" />--%>
                                            <asp:TemplateField HeaderText="Actual Reterival Quantity">
                                                <EditItemTemplate>  
                                                    <asp:TextBox ID="txt_rtQty" runat="server" CssClass=" input-lg" Text='<%#Eval("Fulfilled_Quantity") %>'></asp:TextBox>  
                                                </EditItemTemplate>  
    
                                                 <ItemTemplate>
                                                   <asp:Label ID="Label2" runat="server"  CssClass="label-t3" Text='<%#Eval("Fulfilled_Quantity") %>' Font-Size="Medium"></asp:Label>
                                                 </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="IOU_Quantity" HeaderText="Remaining IOU Quantity " ReadOnly="True" SortExpression="IOU" />
                                             <%--<asp:BoundField DataField="Total" HeaderText="Total Retrival Quantity" ReadOnly="True" SortExpression="Total" />--%>
                                             <asp:TemplateField HeaderText="Total Retrival Quantity" ItemStyle-Width="10%">
                                                 <ItemTemplate>
                                                        <asp:Label id="lblRetrieval" runat="server" Text='<%#Eval("Total") %>'></asp:Label>
                                                </ItemTemplate> 
                                             </asp:TemplateField>
                                             <%--<asp:BoundField DataField="Total_Quantity" HeaderText="InStock Quantity" ReadOnly="True" SortExpression="Total" />--%>
                                             <asp:TemplateField HeaderText="InStock Quantity">
                                                 <ItemTemplate>
                                                        <asp:Label id="lblqty" runat="server" Text='<%#Eval("Total_Quantity") %>'></asp:Label>
                                                </ItemTemplate> 
                                             </asp:TemplateField> 
                                             <asp:TemplateField HeaderText="Id"  visible="false">
                                                 <ItemTemplate>
                                                   <asp:Label ID="lblItemId" runat="server" CssClass="label-t3" Text='<%#Eval("Item_Id") %>' Font-Size="Medium"></asp:Label>
                                                 </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField ShowHeader="true" HeaderText="Reorder" >                                               
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnAddToCart" runat="server" CausesValidation="false" CommandName="AddToCart" CommandArgument='<%# Eval("Item_Id") %>' >
                                                    <span class="glyphicon glyphicon-shopping-cart" style="font-size:large; padding:0; ">
                                                     </span>
                                                    <asp:Label ID="LblCount" runat="server" style="vertical-align:top;" CssClass="glyphicon glyphicon-plus"  Font-Size="X-Small"/>
                                                    </asp:LinkButton></ItemTemplate></asp:TemplateField><asp:TemplateField>  
                                                <ItemTemplate>  
                                                    <asp:Button ID="btn_Edit" runat="server" Text="Change  Retrival Quantity" CssClass="btn btn-primary" CommandName="Edit" />  
                                                </ItemTemplate>  
                                                <EditItemTemplate>  
                                                    <asp:Button ID="btn_Update" runat="server" Text="Update" CssClass="btn btn-primary" CommandName="Update" OnClientClick="return confirm('Are you sure u want to update the quantity?')"/>  
                                                    <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CssClass="btn btn-primary" CommandName="Cancel"/>  
                                                </EditItemTemplate>  
                                            </asp:TemplateField>                                          
                                        </Columns>
                                        <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>
                                         <HeaderStyle CssClass="gridhead-t3"/>
                                         <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                                         <RowStyle BorderColor="LightGray" Height="50px" />
                                    </asp:GridView>
                                  </div>
                       
                            <asp:Button ID="btnApprove" runat="server" CssClass="btn btn-primary" Width="89%" Text="Go to Disbursement List"
                             OnClientClick="return confirm('Are you sure you want to proceed?')" OnClick="btnApprove_Click" />                              
                              <asp:LinkButton ID="lbtnReject" runat="server" CssClass="btn btn-primary"  PostBackUrl="~/com.ssis.storeclerk/Store_ListofRequisitionForms.aspx" >
                                  <span class="glyphicon glyphicon-chevron-left">Back</span>
                                  </asp:LinkButton><br /><br />
                           </div>
                            <div class="row" >
                         <div class="col-md-2">
                            
                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-danger" Font-Size="Small"  >
                        10
                         </asp:LinkButton>- Out of Stock </div><div class="col-md-2">
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-success" Font-Size="Small" >
                        50
                         </asp:LinkButton>-Sufficient Stock </div><div class="col-md-2">
                            <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-link">                       
                                    <span class="glyphicon glyphicon-shopping-cart" style="font-size:large; padding:0; width:19px;"></span>
                             <asp:Label ID="Label3" runat="server" style="vertical-align:top;" CssClass="glyphicon glyphicon-plus"  Font-Size="X-Small"/>                                   
                         </asp:LinkButton>- Add To Cart </div></div><br />
                            <br />
                           </div>
                        </div>
                  </div>
            </div>
           
       
</asp:Content>


