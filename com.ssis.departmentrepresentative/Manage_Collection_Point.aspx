<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_DeptRep.Master" AutoEventWireup="true" codefile="Manage_Collection_Point.aspx.cs" Inherits="Manage_Collection_Point" %>

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
                            <asp:Label ID="lblManageCollectionDetails" runat="server" Text="Manage Collection Point" CssClass="page-header"></asp:Label>
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
                        <div class="col-md-3">
                            <asp:Label ID="Label3" runat="server" Text="Collection Point | Time:" Font-Size="Small" Font-Bold="true" CssClass="label-t3"></asp:Label>
                        </div>
                        <div class="col-md-9">
                            <asp:RadioButtonList ID="rblCollectionPoint" runat="server" CssClass="radio-btn"
                                RepeatDirection="Horizontal" RepeatColumns="1" AutoPostBack="False">
                            </asp:RadioButtonList>
                        </div>
                    </div>
                </div>


                <div class="panel-footer-t3">
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-9" style="padding-left: 35px;">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" Width="150px"
                                OnClick="btnUpdate_Click" OnClientClick="return confirm('Are you sure you want to proceed?')"
                                CssClass="btn btn-primary" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=SSISEntities"
                                DefaultContainerName="SSISEntities" EnableFlattening="False" EntitySetName="CollectionPoints" EntityTypeFilter="CollectionPoint"
                                Select="it.[CollectionPoint_Name], it.[CollectionPoint_ID], it.[CollectionPoint_Time]">
                            </asp:EntityDataSource>
                        </div>
                    </div>
                </div>
                <br/><br/>
            </div>

        </div>
    </div>

</asp:Content>
