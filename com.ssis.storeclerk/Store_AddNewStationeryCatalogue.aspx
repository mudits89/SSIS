<%@ Page Title="" Language="C#" MasterPageFile="~/StoreClerk_MasterPage.master" AutoEventWireup="true" CodeFile="Store_AddNewStationeryCatalogue.aspx.cs" Inherits="Store_AddNewStationeryCatalogue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Add New Stationery Catalogue</title>
    <link href="style/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 50%;
            left: 0px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
         
            <div class="col-md-1" style="width: 2%"></div>
            <div class="col-md-10" style="width: 96%">
            <div class="panel panel-t3">
                    <div class="panel-heading-t3">
                        <div class="row">
                        <div class="col-md-10" style="text-align:left">
                                 <asp:Label ID="Label1" runat="server" Text="Add New Stationery Forms" Font-Bold="True" Font-Italic="False" Font-Names="Tahoma" CssClass="page-header" ></asp:Label>
                        </div>
                        </div>
                      </div>
              
                <div class="panel-body-t3">
                    <div class="row">
                        <div class="col-md-3" style="width: 30%"></div>
                        <div class="col-md-2" style="padding: 0px; width: 15%">
                            <asp:Label ID="Label10" runat="server" Text="Item Number :" CssClass="label-t3" ForeColor="Black"/>
                        </div>
                        <div class="col-md-5" style="padding: 0px; width: 20%">
                            <asp:TextBox ID="txtItemNumber" runat="server" Width="300px" placeholder="Initial will be added by system !" CssClass="input-lg" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtItemNumber" ForeColor="Red" ErrorMessage="RequiredFieldValidator"> * </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row" >
                        <div class="col-md-3" style="width: 30%"></div>
                        <div class="col-md-3" style="padding: 0px; width: 15%">
                            <asp:Label ID="Label11" runat="server" Text="Category :" CssClass="label-t3" ForeColor="Black" />
                        </div>
                        <div class="col-md-6" style="padding: 0px; width: 20%">
                             <asp:DropDownList ID="dropCategory" runat="server" DataSourceID="EntityDataSource1" DataTextField="Category" DataValueField="Category" Width="300px" AutoPostBack="True" OnSelectedIndexChanged="dropCategory_SelectedIndexChanged" CssClass="input-lg" >
                       
                             </asp:DropDownList>
                        </div>
                    </div>
                   <br />
                    <div class="row">
                        <div class="col-md-3" style="width: 30%"></div>
                        <div class="col-md-3" style="padding: 0px; width: 15%">
                                <asp:Label ID="Label12" runat="server" Text="Description :" CssClass="label-t3" ForeColor="Black" />
                        </div>
                        <div class="col-md-6" style="padding: 0px; width: 20%">
                                <asp:TextBox ID="txtDescription" runat="server" Width="300px" CssClass="input-lg"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtDescription" ForeColor="Red" ErrorMessage="RequiredFieldValidator"> * </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row" >
                        <div class="col-md-3" style="width: 30%"></div>
                        <div class="col-md-3" style="padding: 0px; width: 15%">
                            <asp:Label ID="Label13" runat="server" Text="Reorder Level :" CssClass="label-t3" ForeColor="Black" />
                        </div>
                        <div class="col-md-6" style="padding: 0px; width: 20%">
                             <asp:TextBox ID="txtReorderLevel" runat="server" Width="300px" CssClass="input-lg"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtReorderLevel" ForeColor="Red" ErrorMessage="RequiredFieldValidator"> * </asp:RequiredFieldValidator></td>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3" style="width: 30%"></div>
                        <div class="col-md-3" style="padding: 0px; width: 15%">
                                <asp:Label ID="Label14" runat="server" Text="Reorder Quantity :" CssClass="label-t3" ForeColor="Black" />
                        </div>
                        <div class="col-md-6" style="padding: 0px; width: 20%">
                                 <asp:TextBox ID="txtReorderQuantity" runat="server" Width="300px" CssClass="input-lg"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtReorderQuantity" ForeColor="Red" ErrorMessage="RequiredFieldValidator"> * </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3" style="width: 30%"></div>
                        <div class="col-md-3" style="padding: 0px; width: 15%">
                                <asp:Label ID="Label15" runat="server" Text="Unit of Measure :" CssClass="label-t3" ForeColor="Black" />
                        </div>
                        <div class="col-md-6" style="padding: 0px; width: 20%">
                                <asp:DropDownList ID="UnitMeasure" runat="server" Height="19px" Width="300px" DataSourceID="EntityDataSource2" DataTextField="Measure_Unit" DataValueField="Measure_Unit" CssClass="input-lg">

                                </asp:DropDownList>
                        </div>
                    </div>
                    <br />
                     <div class="row">
                        <div class="col-md-3" style="width: 30%"></div>
                        <div class="col-md-3" style="padding: 0px; width: 15%">
                                <asp:Label ID="Label16" runat="server" Text="Price :" CssClass="label-t3" ForeColor="Black" />
                        </div>
                        <div class="col-md-6" style="padding: 0px; width: 20%">
                                  <asp:TextBox ID="txtPrice" runat="server" Width="300px" CssClass="input-lg"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtPrice" ForeColor="Red" ErrorMessage="RequiredFieldValidator"> * </asp:RequiredFieldValidator>
                        </div>
                    </div>
                     <div class="row" >
                        <div class="col-md-3" style="width: 30%"></div>
                        <div class="col-md-3" style="padding: 0px; width: 15%">
                                <asp:Label ID="Label17" runat="server" Text="Total Quantity :" CssClass="label-t3" ForeColor="Black" />
                        </div>
                        <div class="col-md-6" style="padding: 0px; width: 20%">
                                <asp:TextBox ID="txtTotal" runat="server" Width="300px" CssClass="input-lg"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtTotal" ForeColor="Red" ErrorMessage="RequiredFieldValidator"> * </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4" style="width: 30%"></div>
                        <div class="col-md-3" style="padding: 0px; width: 15%">
                            <a href="Store_StationeryCatalogue.aspx" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-chevron-left"><span class="glyphicon glyphicon-chevron-left"> Back</span></span></a>
                        </div>                                
                        <div class="col-md-3" style="padding: 0px; width: 15%">
                              <asp:LinkButton ID="LButton1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" >
                            <span class="glyphicon glyphicon-plus-sign"> ADD </span>
                            </asp:LinkButton>
                        </div>
                         <div class="col-md-2" style="padding: 0px; width: 20%">
                             <a href="Store_AddNewStationeryCatalogue.aspx" role="button" class="btn btn-primary"><span class="glyphicon glyphicon-remove-sign"></span> Clear </a>                             
                        </div>
                    </div>

                </div>
                </div>
                <div>
                     <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=SSISEntities" DefaultContainerName="SSISEntities" Select="DISTINCT it.[Category]" EnableFlattening="False" EntitySetName="Stationery_Catalogue">
                     </asp:EntityDataSource>
        
                </div>
                <div>
                     <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=SSISEntities" DefaultContainerName="SSISEntities" EnableFlattening="False" EntitySetName="Stationery_Catalogue" Select="DISTINCT it.[Measure_Unit]">
                     </asp:EntityDataSource>
                </div>
              
              </div>
              </div>     
     
</asp:Content>

