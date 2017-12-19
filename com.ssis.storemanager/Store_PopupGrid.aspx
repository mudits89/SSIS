<%@ Page Title="" Language="C#" MasterPageFile="~/StoreManagerMaster.Master" AutoEventWireup="true" CodeFile="Store_PopupGrid.aspx.cs" Inherits="Store_PopupGrid" %>

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
                             <asp:Label ID="Label1" CssClass="label-t3" runat="server" Font-Size="Large"></asp:Label>
                             
                        </div>

                    </div>
                </div>
              <div class="panel-body-t3">
                      <div class="row">
                            <div class="col-md-4">
                               <asp:Label ID="Label3"  CssClass="label-t3" runat="server" style="font-weight: 700" Text="Delivery Date:"></asp:Label>
                                  <asp:DropDownList ID="DropDownList2" runat="server" CssClass="input-lg" DataSourceID="EntityDataSource1" DataTextField="Delivery_Date" DataValueField="Delivery_Date" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

                                <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=SSISEntities" DefaultContainerName="SSISEntities" EnableFlattening="False" EntitySetName="Product_Disbursement" Select="Distinct(it.[Delivery_Date])"></asp:EntityDataSource>
                            </div>
                        
                          <br />   <br />
                        </div>
                   <div class="row">
                             <div class="col-md-12">
                                 <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="false" CssClass="table table-striped table-hover" EmptyDataText="No Record Found" Width="100%" BorderWidth="0px" GridLines="Horizontal" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                                     <Columns>
                                        <asp:TemplateField HeaderText="Product_Disbursement_ID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDepOrdId" runat="server" Text='<%#Eval("Product_Disbursement_ID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="DepartmentID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDepId" runat="server" Text='<%#Eval("Department_ID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Department" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDepName" runat="server" Text='<%#Eval("Department_Name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField  HeaderText="ItemId" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblItemId" runat="server" Text='<%#Eval("Item_ID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField  HeaderText="Description">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDesp" runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Requisition_Date" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRequestion" runat="server" Text='<%#Eval("Delivery_Date") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField  HeaderText="Requested Quantity ">
                                            <ItemTemplate>
                                                <asp:Label ID="lblrQty" runat="server" Text='<%#Eval("Requested_Quantity") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Issuing Quantity">
                                            <ItemTemplate>
                                                <asp:Label ID="lblfQty" runat="server" Text='<%#Eval("Delivery_Quantity") %>' ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Previous IOU Quantity">
                                            <ItemTemplate>
                                                <asp:Label ID="lblIouQty" runat="server" Text='<%#Eval("IOU_Quantity") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Return Quantity">
                                             <EditItemTemplate>  
                                                    <asp:TextBox ID="txt_rtQty" runat="server" CssClass=" input-lg" Text='<%#Eval("[Return_Quantity]") %>'></asp:TextBox>  
                                             </EditItemTemplate>  
                                            <ItemTemplate>
                                                <asp:Label ID="lblrtQty" runat="server" Text='<%#Eval("Return_Quantity") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Return Quantity">
                                            <ItemTemplate>
                                                 <asp:DropDownList ID="DropDownList1" runat="server" CssClass="input-lg">
                                                     <asp:ListItem>Damaged</asp:ListItem>
                                                     <asp:ListItem>Bad Condition</asp:ListItem>
                                                     <asp:ListItem>Wet</asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        

                                          <asp:TemplateField HeaderText="Total Receiving  Quantity ">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTotal" runat="server" CssClass=" input-lg" Text='<%#Eval("Total") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField>  
                                                <ItemTemplate>  
                                                    <asp:Button ID="btn_Edit" runat="server" Text="Add  Return Quantity" CssClass="btn btn-primary" CommandName="Edit" />  
                                                </ItemTemplate>  
                                                <EditItemTemplate>  
                                                    <asp:Button ID="btn_Update" runat="server" Text="Update" CssClass="btn btn-primary" CommandName="Update" OnClientClick="return confirm('Return Quantity will be recorded as IOU for last time?')"/>  
                                                    <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CssClass="btn btn-primary" CommandName="Cancel"/>  
                                                </EditItemTemplate>  
                                            </asp:TemplateField>  
                                     </Columns>
                                             <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>
                                             <HeaderStyle CssClass="gridhead-t3"/>
                                             <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                                             <RowStyle BorderColor="LightGray" />
                                 </asp:GridView>
                                 <hr />
                             </div>
                               
                                <br /><br /><br /><br />
                           </div>
                             <div class="row" style="text-align:right;">  
                                   <div class="col-md-9"> 
                                        <asp:Label ID="lblsign" runat="server" Text="Signature :"   CssClass="label-t3" ></asp:Label>
                                            <asp:Image ID="imgCover" runat="server"  Height="65px" BorderWidth="1px"  BorderStyle="Dotted" />            
                                   </div>
                                
                                 <div class="col-md-2" style="text-align:left;">
                                        <asp:FileUpload ID="FileUploadImg" runat="server"   CssClass=" input-lg" /> 
                                       <asp:Button ID="btnUpload"  CssClass="btn btn-primary"  runat="server" OnClick="btnUpload_Click" Text="Upload Image" CausesValidation="False" />
                                 </div>

                              
                                 <br /><br /> <br /><br /> <br /><br />
                             </div>
                           
                            <div class="row" style="text-align:right;">  
                                   <div class="col-md-10" style="text-align:right;">  
                                  
                                       </div>
                                 
                            
                             </div>

                             <div class="row">
                                   <div class="col-md-12" style="text-align:right;">
                                      <asp:Label ID="lbUploadMessage" runat="server"></asp:Label>
                                        <asp:Label ID="lblext" Visible="false" runat="server"></asp:Label>
                                     </div>
                                 
                            </div>

                            <div class="row">
                                   <div class="col-md-6" style="text-align:right;">  
                                       <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="Button2_Click"  CssClass="btn btn-primary"  />
                                   </div>
                                 <div class="col-md-6" style="text-align:left;">  
                                       <asp:Button ID="btnback" runat="server" Text="Back to Retrival List" PostBackUrl="~/com.ssis.storeclerk/Store_RetrivalForm.aspx" CssClass="btn btn-primary"  />
                                   </div>
                               <br /><br />
                            </div>
                        </div>   
                    </div>
                </div>
             </div>
</asp:Content>


