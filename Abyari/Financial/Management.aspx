<%@ Page Title="مدیریت پیمانکاران" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Design/Masters/Main.Master" AutoEventWireup="true" CodeBehind="Management.aspx.cs" Inherits="Abyari.Financial.Management" %>

<%@ Register Src="~/Controls/UscEntekhbProjeToInvoice.ascx" TagPrefix="uc2" TagName="UscEntekhbProjeToInvoice" %>
<%@ Register Src="~/Controls/UscPaymankarSearchParameter.ascx" TagPrefix="uc2" TagName="UscPaymankarSearchParameter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent"   runat="server">
   
    <asp:HiddenField ID="hdn" runat="server" OnInit="hdn_Init" />
    <uc2:UscPaymankarSearchParameter  runat="server" id="UscPaymankarSearchParameter" />
     
<script type="text/javascript">
    function pageLoad() {
        var grid = $find("<%= grdPaymankar.ClientID %>");
           var columns = grid.get_masterTableView().get_columns();
           for (var i = 0; i < columns.length; i++) {
               columns[i].resizeToFit(false, true);
           }
    }
    var invid = -1;
    var selectedpaymankar = -2;
    $(document).ready(function () {
     
        $(".link").on("click", function () {
            invid = $(this).data("idinvoice");
            var grd = $find("<%= grdPaymankar.ClientID %>");
            var selectedkey = grd.get_masterTableView().get_selectedItems()[0].getDataKeyValue("ID");

            selectedpaymankar = selectedkey;

           
        });
    });
    function SetID() {
   
    }
 </script>
 
    <div class="panel panel-yellow">
        <div class="panel-heading">
            مدیریت پیمانکاران
        </div>
        <div class="panel-body">
                <dynamic:DynamicRadGrid ID="grdPaymankar" runat="server" OnItemCommand="grdPaymankar_ItemCommand" AutoGenerateColumns="false"  
        skin="Windows7"
        >
            <ExportSettings ExportOnlyData="true" HideStructureColumns="true" IgnorePaging="true" OpenInNewWindow="true">
            
            </ExportSettings>
        <ClientSettings>
            <Scrolling AllowScroll="true" ScrollHeight="700" />
            <Resizing AllowResizeToFit="true" AllowColumnResize="true"  />
        </ClientSettings>
        <MasterTableView EditMode="InPlace"   CommandItemDisplay="Top" ClientDataKeyNames="ID"  DataKeyNames="InvoiceID,ID" 
                InsertItemPageIndexAction="ShowItemOnCurrentPage">
            <CommandItemSettings  />
            
            <Columns>
              <telerik:GridTemplateColumn>
                  <ItemTemplate>
                      <asp:Button ID="btnSelect" runat="server"    CssClass="click btn btn-sm btn-success" Text="صورت حساب های پیمانکار" CommandName="Select"/>
                  </ItemTemplate>
              </telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
    </dynamic:DynamicRadGrid>
      <uc1:UscInvoiceAndPayemnt OnInit="invoice_Init" runat="server" ID="invoice" />   
        </div>
    </div>

                       <div class="modal fade" id="setinvoice" tabindex="-1" role="dialog">
<div class="modal-dialog modal-lg" role="document" id="modalDrag">
<div class="modal-content persian">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">&times;</button>
<h5 class="modal-title"><i class="fa fa-pencil"></i>لیست پیمانکاران مجاز</h5>
 
</div>
<div class="modal-body">
<div class="box-body">
    <uc2:UscEntekhbProjeToInvoice runat="server" ID="UscEntekhbProjeToInvoice" />
</div>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">بستن</button>
</div>
</div>
</div>
</div>
</asp:Content>
 