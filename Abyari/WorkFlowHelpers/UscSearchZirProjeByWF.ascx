<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscSearchZirProjeByWF.ascx.cs" Inherits="Abyari.WorkFlowHelpers.UscSearchZirProjeByWF" %>

 
<script src="../Logic/ReserveByPaymankar.js"></script>
     <script  type="text/javascript">
         var ExecutingID;
         function RowDblClick(sender, eventArgs) {

             var grid = $find('<%=grdZirProjeData.ClientID %>');
             var index = eventArgs.get_itemIndexHierarchical();

             var masterTable = grid.get_masterTableView();
             var row = masterTable.get_dataItems()[index];
             var code = row.get_element().cells[3].innerHTML;
             ExecutingID = GetExecutingID(index);
             var url = "/WorkFlowHelpers/WorlFlowHistorypopup.aspx";
             ShowPopup(url);
         }
         function OnMouseOver(sender, eventargs) {
             var index = eventargs.get_itemIndexHierarchical();

         }
         function GetExecutingID(index) {
             var grid = $find('<%=grdZirProjeData.ClientID %>');

             var masterTable = grid.get_masterTableView();
             var row = masterTable.get_dataItems()[index];
             var exeid = $telerik.findElement(row.get_element(), "hdExecuting").value;
             return exeid;
         }
         function ShowPopup(url) {
             popup = window.open(url, "Popup", "toolbar=no,scrollbars=no,location=no,statusbar=no,menubar=no,resizable=0,width=800,height=600,left = 400,top = 200");
             popup.focus();
         }
 
    function pageLoad() {
        var grid = $find("<%= grdZirProjeData.ClientID %>");
        if (grid) {
            var columns = grid.get_masterTableView().get_columns();
            for (var i = 0; i < columns.length; i++) {
                columns[i].resizeToFit(false, true);
            }
        }
    }
 
 </script>
<div class="col-sm-6 text-right">
    به منظور مشاهده تاریخچه گردشکار بر روی سطر دلخواه دوبار کلیک نمایید
</div>
<div class="row" style="width:100%">


<telerik:RadGrid   OnDataBound="grdZirProjeData_DataBound"   AllowSorting="true"  OnItemCommand="grdZirProjeData_ItemCommand"  ID="grdZirProjeData" Skin="Windows7" AutoGenerateColumns="false"  runat="server">
    <ClientSettings >
         
        <ClientEvents OnRowDblClick="RowDblClick"  />
      <Scrolling AllowScroll="true" ScrollHeight="600" />
        <Resizing AllowResizeToFit="true" AllowColumnResize="true"  />
    </ClientSettings>
    
    <MasterTableView>
 
        <Columns>

        
                        <telerik:GridTemplateColumn HeaderText="مدیریت طرح" ItemStyle-Width="100px" >
                              <ItemTemplate >
                                  <input type="button" class="btn btn-small btn-success check "   value="رزرو باتوافق کشاورز" onclick="reservewith(this, true);" data-reserved="<%# Eval("Reserved") %>" data-idproje="<%# Eval("ID") %>"  />
                                  <input type="button" class="btn btn-primary check"  value="رزرو بدون توافق کشاورز" onclick="reservewith(this, false);" data-reserved="<%# Eval("Reserved") %>" data-idproje="<%# Eval("ID") %>"  />
                                  <input type="button" class="btn btn-danger unreserve"  value="لغو" onclick="unreserve(this);" data-reserved="<%# Eval("Reserved") %>" data-idproje="<%# Eval("ID") %>"  />
                              </ItemTemplate>
                          </telerik:GridTemplateColumn>
                       
                               
            <telerik:GridTemplateColumn  HeaderText=" مرحله کنونی" >
                <ItemTemplate >
                    <asp:HiddenField ID="hdColumn" runat="server" />
                    <asp:HiddenField ID="hdExecuting" runat="server" />

                    <asp:Label runat="server" ID="lblStepName" ></asp:Label>
                </ItemTemplate>
            </telerik:GridTemplateColumn>
             <telerik:GridBoundColumn DataField="Code" HeaderText="کد طرح" ItemStyle-BackColor="YellowGreen"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Name" HeaderText="نام طرح" ItemStyle-BackColor="Salmon"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Sath" HeaderText="سطح" ItemStyle-BackColor="GreenYellow"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MeghdareEstesnaSath" HeaderText="مقداراستثنای سطح" ItemStyle-BackColor="Yellow"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NoeProje" HeaderText="نوع پروژه"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TedadDastgahAbyari" HeaderText="نعداد دستگاه آبیاری"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NoePomp" HeaderText="نوع پمپ"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Debi" HeaderText="دبی"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ManbaeTaminAb" HeaderText="منابع تامین آب"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CodeMeliMoshtary" HeaderText="کدملی مشتری"></telerik:GridBoundColumn>
           
        </Columns>
    </MasterTableView>
</telerik:RadGrid >
    </div>