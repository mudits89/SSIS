<%@ Page Title="" Language="C#" MasterPageFile="~/StoreManagerMaster.Master" AutoEventWireup="true" CodeFile="Store_DisbursementLists.aspx.cs" Inherits="Store_DisbursementLists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 100%;
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
                        <div class="col-md-12" style="text-align:left">
                             <asp:Label ID="txtName" runat="server"  Text="Collection Point List" CssClass="page-header"></asp:Label>    
                        </div>

                    </div>
                </div>

                   <div class="panel-body-t3">
                           
                       <div class="row">
                            <div class="auto-style1" style="text-align:left">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server"  CssClass="radio-btn" CellPadding="6"
                                      RepeatColumns = "5" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True" DataSourceID="EntityDataSource4" DataTextField="CollectionPoint_Name" DataValueField="CollectionPoint_ID">
                                 </asp:RadioButtonList>
                                 
                                 <hr />
                                <br />
                               
                            </div>
                       </div>
                     </div>
              </div>        
            <div class="panel panel-t3">
                        <div class="panel-heading-t3">
                            <div class="row">
                                <div class="col-md-12" style="text-align:left">
                                    <asp:Label ID="Label2" runat="server"  Text="Disbursement Item List  " CssClass="page-header"></asp:Label>
                                </div>
                             </div>
                        </div>
                <div class="panel-body-t3">
                           <div class="row">
                                <asp:GridView ID="GridView1" runat="server" ShowHeader="False" CssClass="table table-striped table-hover" AutoGenerateColumns="false" BorderWidth="0px" GridLines="Horizontal" >
                                   <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:HyperLink  ID="lnkView" Text='<%# Eval("[Department_Name]")  %>' NavigateUrl="javascript:;"  runat="server" />
                                                <input type="hidden" id="hiddenvalue" value="<%# Eval("[Department_Name]")  %>"/>   
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       </Columns>
                                      <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>
                                             <HeaderStyle Height="0px" />
                                             <PagerStyle HorizontalAlign="Right" CssClass="pagination-t3" />
                                             <RowStyle BorderColor="LightGray" />
                                </asp:GridView>
                               <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                                    <script type="text/javascript">
                                        $(function () {
                                            





                                            $("[id*=lnkView]").click(function () {
                                                <%--var rowIndex = $(this).closest("tr")[0].rowIndex;
                                                var cellIndex = $(this).closest("tr")[0].values;
                                                  var table = document.getElementById('<%=GridView1.ClientID %>');
                                                //var i = rowIndex + 1;
                                                //var row = table.rows[i];
                                                //var td = row.cells[1];
                                                //var CellValue = CellValue = td.children[0].attributes[0].value;
                                                //var rowI = $(this).closest("td")[0].value;
                                                ////var tagValue = document.getElementById("hiddenvalue").item.valueOf;
                                                //var deptName = document.getElementById("hiddenvalue");--%>
                                                var rowIndex = $(this).closest("tr")[0].rowIndex;

                                                var tbl = document.getElementById('<%=GridView1.ClientID%>').rows[rowIndex].cells[0].innerText;
                                               // var tbl_Cell = tbl.rows[rowIndex].cells[0].Text;
                                                window.open("Store_PopupGrid.aspx?DepartmentName=" + tbl, "Popup", "width=1500,height=900");
                                            });
                                        });
                                 </script>
                           </div>
                </div>
                <asp:EntityDataSource ID="EntityDataSource4" runat="server" ConnectionString="name=SSISEntities" DefaultContainerName="SSISEntities" EnableFlattening="False" EntitySetName="CollectionPoints" Select="it.[CollectionPoint_ID], it.[CollectionPoint_Name], it.[CollectionPoint_Time]">
                </asp:EntityDataSource>
                <asp:EntityDataSource ID="EntityDataSource5" runat="server" ConnectionString="name=SSISEntities" DefaultContainerName="SSISEntities" EnableFlattening="False" EntitySetName="Departments" Select="it.[Department_Name]">
                </asp:EntityDataSource>
            </div>
             
        </div>
      </div>

   
</asp:Content>


