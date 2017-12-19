<%@ Page Language="C#" MasterPageFile="~/MasterPage_PurchaseDept.Master" AutoEventWireup="true" codefile="Add_New_supplier.aspx.cs" Inherits="Add_New_supplier" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-t3">
        <div class="panel-heading-t3">
            <div class="row">
                <div class="col-md-12" style="text-align: left">
                    <asp:Label ID="lblManageCollectionDetails" runat="server" Text="Add New Supplier" CssClass="page-header"></asp:Label>
                </div>
                </div>
                                <div class="row">
                        <div class="col-md-12">
                            <span class="underline-t3"></span>
                        </div>
                    </div>
            </div>

                <div class="panel-body-t3">                  
                   
        <br />
        <br />
                                
                    <div class="row">
                        <div class="col-md-2" style="padding-left:25px;">
        <asp:Label ID="Label1" runat="server" Font-Size="Small" Font-Bold="true">Supplier Name<span style="color:red">*</span></asp:Label>
                            </div>                      
                        <div class="col-md-5">
        <asp:TextBox ID="tbx_name" runat="server" style="margin-left: 0px" CssClass="form-control input-lg"></asp:TextBox>
                            </div>
                        <div class="col-md-5">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
ControlToValidate="tbx_name" ForeColor="Red"
ErrorMessage="RequiredFieldValidator">Name is required</asp:RequiredFieldValidator>


                          </div>
                        </div>
                    </div>
        <br />
        <br />
                    <div class="row">
                        <div class="col-md-2" style="padding-left:50px;">
        <asp:Label ID="Label2" runat="server" Font-Size="Small" Font-Bold="true">Supplier ID<span style="color:red">*</span></asp:Label>
                            </div>
                     
       <div class="col-md-5"> 
        <asp:TextBox ID="tbx_id" runat="server" Width="263px" CssClass="form-control input-lg"></asp:TextBox>
                            </div>
                     <div class="col-md-5">        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
ControlToValidate="tbx_id" ForeColor="Red"
ErrorMessage="RequiredFieldValidator">ID is required</asp:RequiredFieldValidator>
                         </div>
                          <div class="col-md-5">
        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server"
ErrorMessage="RegularExpressionValidator" ControlToValidate="tbx_id"
ValidationExpression="[A-Z]{4}"
ForeColor="Red">Invalid Supplier ID</asp:RegularExpressionValidator>
                              </div>
                        <asp:Label ID="lblexcep" runat="server"></asp:Label>
        <br />                
        <br />
        <br />
                   <br />
                    <div class="row">
                        <div class="col-md-2" style="padding-left:90px;">
        <asp:Label ID="Label3" runat="server" Font-Size="Small" Font-Bold="true">Address</asp:Label>
                            </div>
                   
                        <div class="col-md-5" style="padding-left:25px;">
 <asp:TextBox ID="tbx_address" runat="server" Height="600px" style="margin-top: 0px"
     TextMode="MultiLine" CssClass="form-control input-lg" ></asp:TextBox>
                            </div>
                             <br />
        <br />
                        <br />
                        <br />
                        

                    <div class="row">
                        <div class="col-md-2" style="padding-left:40px;">
        <asp:Label ID="Label4" runat="server" Font-Size="Small" Font-Bold="true">Contact Number<span style="color:red">*</span></asp:Label>
                            </div>
                        <div class="col-md-5" style="padding-left:35px;">
        <asp:TextBox ID="tbx_contactno" runat="server" Width="265px"  CssClass="form-control input-lg"></asp:TextBox>
                            </div>
                        <div class="col-md-5">
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
ErrorMessage="RegularExpressionValidator" ControlToValidate="tbx_contactno"
ValidationExpression="[0-9]{8}"
ForeColor="Red">Invalid Phone Number</asp:RegularExpressionValidator>
                            </div>
                        
        <br />
        <br />
                        <br />
                        <br />
                    <div class="row">
                        <div class="col-md-2" style="padding-left:75px;">
        <asp:Label ID="Label5" runat="server" Font-Size="Small" Font-Bold="true">Contact Name</asp:Label>
                            </div>
                        
                   
       
                        <div class="col-md-5" style="padding-left:45px;">
        <asp:TextBox ID="tbx_cntctname" runat="server" Width="273px" CssClass="form-control input-lg"></asp:TextBox>
                            </div>
                          </div>
        <br />
        <br />
                      <div class="row">
                        <div class="col-md-2" style="padding-left:90px;">
        <asp:Label ID="Label6" runat="server" Font-Size="Small" Font-Bold="true">Fax Number<span style="color:red">*</span></asp:Label>
                            </div>                                              
                   <div class="col-md-5" style="padding-left:45px;">
        <asp:TextBox ID="tbx_fax" runat="server" Width="266px" CssClass="form-control input-lg"></asp:TextBox>
                            </div>                        
                         <div class="col-md-5">
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
ErrorMessage="RegularExpressionValidator" ControlToValidate="tbx_fax"
ValidationExpression="[0-9]{7}"
ForeColor="Red">Invalid fax Number</asp:RegularExpressionValidator>
                             </div>
                          </div>
        <br />
        <br />
                      <div class="row">
                        <div class="col-md-2" style="padding-left:85px;">
        <asp:Label ID="Label7" runat="server" Font-Size="Small" Font-Bold="true">GST Number</asp:Label>
                            </div>
                     
                      
                        <div class="col-md-5" style="padding-left:45px;">
        <asp:TextBox ID="tbx_gst" runat="server" Width="264px" CssClass="form-control input-lg"></asp:TextBox>
                            </div>
                          </div>
        <br />
        <br />
        <br />
                      <div class="row">
                        <div class="col-md-2" style="padding-left:60px;">
        <asp:Label ID="Label9" runat="server" Font-Size="Small" Font-Bold="true">Choose Product<span style="color:red">*</span></asp:Label>
                            </div>
                         
 
       <div class="col-md-5" style="padding-left:45px;">
        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="EntityDataSource1" DataTextField="Description" DataValueField="Item_Number" Height="98px" Width="285px" selectionmode ="Multiple"></asp:ListBox>
           </div>
           <div class="col-md-5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ListBox1" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Select atleast one Product</asp:RequiredFieldValidator>
        <br />
               </div>
                          </div>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=SSISEntities" DefaultContainerName="SSISEntities" EnableFlattening="False" EntitySetName="Stationery_Catalogue" Select="it.[Item_Number], it.[Description]">
        </asp:EntityDataSource>

        <br />
        <br />

        <br />
                      <div class="row">
                        <div class="col-md-2"  style="padding-left:120px;">
        <asp:Label ID="Label8" runat="server" Font-Size="Small" Font-Bold="true">Remarks</asp:Label>
                            </div>
                       
       
                        <div class="col-md-10" style="padding-left:40px;">
        <asp:TextBox ID="tbx_remark" runat="server" Width="60%" Height="600px" TextMode="MultiLine" CssClass="form-control input-lg"></asp:TextBox>
 
                            </div>
                          </div>

        <br />
        <br />
                        <div class="panel-footer-t3">
                            <div class="row">
                                <div class="col-md-9 visible-md visible-lg" style="width: 800px; padding: 0;"></div>
                                <div class="col-md-3" style="position: static;">
                                    <asp:Button ID="btn_add_new_suppl" runat="server" Text="Save" Width="150px" 
                                        OnClick="btn_add_new_suppl_Click" OnClientClick="return confirm('Are you sure you want to proceed?')" 
                                         CssClass="btn btn-primary" />
                                </div>
                            </div>

                            <br />
                            <br />
                            <br />

                        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
   
                </div>
            </div>
        </div>
    </div>
</asp:Content>