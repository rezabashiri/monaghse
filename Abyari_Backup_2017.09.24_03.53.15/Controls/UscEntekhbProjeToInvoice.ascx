<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscEntekhbProjeToInvoice.ascx.cs" Inherits="Abyari.Controls.UscEntekhbProjeToInvoice" %>
 <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript">
    function bind() {

        var code = $("#<%= TxtCode.ClientID %>").val();
        var codemeli = $("#<%= txtCodeMeli.ClientID %>").val();
        var idpay=selectedpaymankar;//just search projects of this paymankar
        
        $.ajax({
            type: "post",
            contentType: "application/json; charset=utf-8",
            url:"/ClientFunctions/ClientCalls.aspx/SearchZirProje",
            data: "{'codemeli':'" + codemeli + "','code':'" + code + "','IDPaymankar':'" +idpay+ "'}",
            success: function (data) {
                var rad = $find("<%= GrdZirPRoje.ClientID %>").get_masterTableView();
                rad.set_dataSource(data.d);
                rad.dataBind();
            },
            error: function (xhr, status, error) {

                alert(xhr.responseText);}

        });

    }
    function reserve(idproje){
        $.ajax({
            type: "post",
            contentType: "application/json; charset=utf-8",
            url:"/ClientFunctions/ClientCalls.aspx/SaveInvoiceExtraData",
            data: "{'invoiceid':'" + invid + "','idproje':'" + idproje + "'}",
            success: function (data) {
                alert(data.d);
                //$("#setinvoice").modal('hide');
            },
            error: function (xhr, status, error) {

                alert(xhr.responseText);}

            });
    }
</script>
<div class="row clean">


     <div class="col-md-3 col-sm-12 text-left ">
                        کد پروژه
                    </div>
                    <div class="col-md-3 col-sm-12 text-right">
                        <asp:TextBox ID="TxtCode" CssClass="form-control text-right  number" runat="server"></asp:TextBox>
                    </div>
         <div class="col-md-3 col-sm-12 text-left ">
                   کد ملی متقاضی
                    </div>
                    <div class="col-md-3 col-sm-12 text-right">
                        <asp:TextBox ID="txtCodeMeli" CssClass="form-control text-right  LegalNationalCode" runat="server"></asp:TextBox>
                    </div>
           <div class="col-sm-12 text-center ">
                    <asp:Button ID="BtnSearch" CssClass="btn  btn-success"  OnClientClick ="bind(); return false;" runat="server" Text="جستجو" />
                </div>
  
   <telerik:RadGrid runat="server" ID="GrdZirPRoje" Skin="Windows7" AllowFilteringByColumn="false" AllowAutomaticUpdates="true"
                        AutoGenerateColumns="false" AllowPaging="false" AllowSorting="true"
                         >
                        <ExportSettings ExportOnlyData="true"></ExportSettings>
                        <ClientSettings>
            <Scrolling AllowScroll="true" ScrollHeight="700" />
            <Resizing AllowResizeToFit="true" AllowColumnResize="true"  />
        </ClientSettings>
                        <MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID,IDPaymankar" AutoGenerateColumns="false" NoMasterRecordsText="اطلاعاتی برای نمایش وجود ندارد">
                          
                            <CommandItemSettings ShowExportToExcelButton="true"  ShowExportToPdfButton="true" ShowExportToWordButton="true" />
                            <Columns>
                                <telerik:GridTemplateColumn HeaderText="ثبت پروژه">
                                    <ClientItemTemplate >
                                      <input type ="button"   class="btn btn-sm btn-warning" value="صدور" onclick="reserve(#= ID #);" />

                                    </ClientItemTemplate>
                              
                                </telerik:GridTemplateColumn>
                          

                                <telerik:GridBoundColumn DataField="Code" HeaderText="کد پروژه"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Name" HeaderText="نام پروژه"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Sath" HeaderText="سطح"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="CodeMeliMoshtary" HeaderText="کدملی"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="NameMoshtary" HeaderText="نام مشتری"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Famil" HeaderText="نام خانوادگی"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SahmeDolat" HeaderText="سهم دولت"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SahmeBank" HeaderText="سهم بانک"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SahmeMotaghazi" HeaderText="سهم متقاضی"></telerik:GridBoundColumn>
                               
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
 
  </div>