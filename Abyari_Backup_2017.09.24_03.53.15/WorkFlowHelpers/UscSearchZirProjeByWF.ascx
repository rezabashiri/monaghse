<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscSearchZirProjeByWF.ascx.cs" Inherits="Abyari.WorkFlowHelpers.UscSearchZirProjeByWF" %>

 
 
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
 </script>
<div class="col-sm-6 text-right">
    به منظور مشاهده تاریخچه گردشکار بر روی سطر دلخواه دوبار کلیک نمایید
</div>
<div style="width:100%">


<telerik:RadGrid   OnDataBound="grdZirProjeData_DataBound" RenderMode="Mobile" AllowSorting="true"  OnItemCommand="grdZirProjeData_ItemCommand"  ID="grdZirProjeData" Skin="Web20" AutoGenerateColumns="false"  runat="server">
    <ClientSettings >
         
        <ClientEvents OnRowDblClick="RowDblClick"  />
      <Scrolling AllowScroll="true" ScrollHeight="600" />
    </ClientSettings>
    
    <MasterTableView>
 
        <Columns>

    <telerik:GridTemplateColumn  HeaderStyle-Width="40px"  HeaderText="مشاهده و ساخت گردش"  ItemStyle-HorizontalAlign="Center">
                
                <ItemTemplate >
                    <asp:ImageButton  ImageUrl="~/Design/Images/selection.gif" runat="server"  Visible="false" ID="btnGO" CommandName="GO" />
                </ItemTemplate>
            </telerik:GridTemplateColumn>
            <telerik:GridTemplateColumn  HeaderStyle-Width="40px" HeaderText="عملیات"   ItemStyle-HorizontalAlign="Center">
                <ItemTemplate >
                    <asp:ImageButton  ImageUrl="~/Design/Images/operation.gif" runat="server"   ID="btnSelect" CommandName="Select" />
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