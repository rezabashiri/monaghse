<%@ Page Title="جستجوی زیر پروژ ها " Language="C#" EnableEventValidation="false" MasterPageFile="~/Design/Masters/Administrator.Master" AutoEventWireup="true" CodeBehind="SearcZirProject.aspx.cs" Inherits="Abyari.ZirProje.SearcZirProject" %>

<%@ Register TagPrefix="dynamic" Assembly="Abyari" Namespace="Telerik.Web.UI.DynamicData" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Src="~/Controls/UscEntekhabPaymankar.ascx" TagPrefix="uc2" TagName="UscEntekhabPaymankar" %>
<%@ Register Src="~/Controls/UscZirprojeSearchParameter.ascx" TagPrefix="uc2" TagName="UscZirprojeSearchParameter" %>
 


<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        var idproje = -1,idcontract=-1;
        function pageLoad() {
            var grid = $find("<%= GrdZirPRoje.ClientID %>");
            if (grid ) {
                var columns = grid.get_masterTableView().get_columns();
                //for (var i = 0; i < columns.length; i++) {
                //    columns[i].resizeToFit(false, true);
                //}
            }
        }
        function decontract(btn,idpay) {
            var grid = $find("<%= GrdZirPRoje.ClientID %>");
            var idproje = grid.get_masterTableView().get_selectedItems()[0].getDataKeyValue("ID");
            $.ajax({
                type: "Post",
                contentType: "application/json; charset=utf-8",
                url: "/ClientFunctions/ClientCalls.aspx/ZriprojeDeContract",
                data: "{idzirproje:" + idproje + "}",
                success: function (data) {
                    alert(data.d);
                    btn.disabled = true;
                }
              , error: function (xhr, status, error) {

                  alert(xhr.responseText);
              }
            });
        }
        function contract(btn) {
        
            var grid = $find("<%= GrdZirPRoje.ClientID %>");
            var paymangrd = $find("<%= grdReserved.ClientID %>"); //we cant retrive selected value of grdreserver becouse it hasnt selected yet
            var idproje = grid.get_masterTableView().get_selectedItems()[0].getDataKeyValue("ID");
            var idpaymankar = grid.get_masterTableView().get_selectedItems()[0].getDataKeyValue("IDPaymankar");
            var element = btn;
            var date = $("#<%= contractdate.ClientID %>").datepicker('getDate').format("yyyy/MM/dd");
            var entry = $("#<%= entrydate.ClientID %>").datepicker('getDate').format("yyyy/MM/dd");
            if (!idpaymankar) { //if it's null we havent contracted yet so possible to contract 
                $.ajax({
                    type: "Post",
                    contentType: "application/json; charset=utf-8",
                    url: "/ClientFunctions/ClientCalls.aspx/ZriprojeContract",
                    data: "{idzirproje:" + idproje + ",idpaymankar:" + idcontract + ",date:'"+date +"',entry:'"+entry+"'}",
                    success: function (data) {
                        alert(data.d);
                        element.disabled = true;
                    }
                    , error: function (xhr, status, error) {

                        alert(xhr.responseText);
                    }
                });
            }
            else
                alert("پروژه عقد قرارداد شده است");
        }
        function delivery(btn,idp) {
            var grid = $find("<%= GrdZirPRoje.ClientID %>");
            var id = grid.get_masterTableView().get_selectedItems()[0].getDataKeyValue("ID");
            alert(id);
            alert(idp);
            $.ajax({
                type:"post",
                contentType: "application/json; charset=utf-8",
                url: "/ClientFunctions/ClientCalls.aspx/DeliveryProje",
                data: "{'idproje':'"+id+"'}",
                success: function (data) {
                    alert("تحویل موقت پروژه انجام شد");
                }
               , error: function (xhr, status, error) {
                   alert(xhr.responseText);
               }
            });
        }
        function RowCreated(sender, eventArgs) {
            var grid = $find("<%= GrdZirPRoje.ClientID %>");
            var idpaymankar = grid.get_masterTableView().get_selectedItems()[0].getDataKeyValue("IDPaymankar");
            var current=eventArgs.getDataKeyValue("IDPaymankar");
            if (idpaymankar == current) {
                eventArgs.get_gridDataItem().get_element().cells[0].className = "disabled";
            }
            else {
                eventArgs.get_gridDataItem().get_element().cells[3].className = "disabled";
            }
     
        }
        function setidpaymankar(idpaymankar) {
            idcontract = idpaymankar;
        }
        $(document).ready(function () {
            $(".link").on("click", function () {
                var id = $(this).data("idproje");
                idproje = id;
            });
            $(".link").each(function () {
                var idp = $(this).data("idpaymankar");
                if (idp != "") {
                    $(this).attr('disabled', 'disabled');
                    $(this).text("قرارداد عقد شده است");
                }
            });
            $("#paymankardetail").on("hidden.bs.modal", function () {
                var grid = $find("<%= GrdZirPRoje.ClientID %>").get_masterTableView();
                grid.rebind();
            });
        });
 </script>

    <asp:Panel runat="server" ID="PnlContent">
        <div class="panel panel-warning">
            <div class="panel panel-heading text-left">
                <asp:Panel ID="PnlHeader"  runat="server" Style="cursor: pointer;">
                    جستجوی  پروژ ها 
                </asp:Panel>
            </div>
            <div class="panel panel-body">
       
                <uc2:UscZirprojeSearchParameter ShowStatus="true" ShowCompany="true" runat="server" ID="UscZirprojeSearchParameter" />

                <div class="col-sm-12 text-right" style="width: 100%; direction: rtl">
                    <telerik:RadGrid runat="server" ID="GrdZirPRoje" Skin="Windows7" AllowFilteringByColumn="false" AllowAutomaticUpdates="true" ActiveItemStyle-Wrap="false"
                        AutoGenerateColumns="false" AllowPaging="false" AllowSorting="true"  ShowFooter="true" OnDataBound="GrdZirPRoje_DataBound"
                        OnItemCommand="GrdZirPRoje_ItemCommand"  >
                        <ExportSettings ExportOnlyData="true" FileName="پروژه ها" IgnorePaging="true" HideStructureColumns="true" >
                            <Excel Format="Biff"  />
                        </ExportSettings>
                        <ClientSettings>
            <Scrolling AllowScroll="true"  ScrollHeight="700" />
            <Resizing AllowResizeToFit="true" AllowColumnResize="true"  />
                         
        </ClientSettings>
                        <HeaderStyle Width="130px" />
                        <MasterTableView  DataKeyNames="ID"   ClientDataKeyNames="ID,IDPaymankar" CommandItemDisplay="Top" AutoGenerateColumns="false" NoMasterRecordsText="اطلاعاتی برای نمایش وجود ندارد">
                            
                            <CommandItemSettings ShowExportToExcelButton="true"  ShowExportToPdfButton="true" ShowRefreshButton="false" ShowAddNewRecordButton="false" ShowExportToWordButton="true" />
                            <Columns >
                                <telerik:GridTemplateColumn  Exportable="false" HeaderText="چاپ">
                                    <ItemTemplate>
                                        <uc1:ReportShowButton ID="RepShow" runat="server" CommandName="ReportShow" ReportID="7b898480-f7e6-48de-ba47-a0a141b15b8f" OpenAsModal="true"  ViewerURL="Reports/ReportShow.aspx" ButtonType="ReportShow" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Exportable="false" HeaderText="پیمانکاران ثبت شده">
                                     
                                    <ItemTemplate>
                                        <asp:Button runat="server" Text="انتخاب"   Visible="<%# setvisible() %>"  CssClass="btn btn-sm  btn-info" ID="Button1" CommandName="Close"  />
                                        <asp:Button runat="server" Text="مشاهده پیمانکاران"     CssClass="btn btn-sm  btn-info" ID="BtnSelect" CommandName="Select" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn  Exportable="false" HeaderText="رزرو پیمانکار">
                                 <ItemTemplate>
                                        <a class="link"  data-toggle="modal" href="#" data-idpaymankar="<%# Eval("IDPaymankar") %>" data-idproje="<%# Eval("ID") %>" data-target="#paymankardetail" ><img src="/Design/Images/view-details.png" width="40" /></a>

                                 </ItemTemplate>
                             </telerik:GridTemplateColumn>

                                <telerik:GridBoundColumn Exportable="false" DataField="Code" HeaderText="کد پروژه"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Name" FooterText="جمع کل" HeaderText="نام پروژه"></telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="تحویل/عدم تحویل"> 
    <ItemTemplate> 
        <asp:Label ID="Label11" runat="server" Text='<%# Convert.ToBoolean(Eval("Tahvil")) == true ? "بله" : "خیر" %>'></asp:Label> 
    </ItemTemplate> 
</telerik:GridTemplateColumn>
                                 <telerik:GridBoundColumn DataField="PersianContractedDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="تاریخ عقد قرارداد"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Sath" DataFormatString="{0:N}" Aggregate="Sum" DataType="System.Double" ItemStyle-BackColor="Salmon" FooterStyle-BackColor="Salmon" HeaderStyle-BackColor="Salmon"  HeaderText="سطح"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="NoeProje" HeaderText="نوع سیستم آبیاری"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Shahrestan" HeaderText="شهرستان"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="NamePaymankar" HeaderText="نام شرکت"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn   DataField="CodeMeliMoshtary" HeaderText="کدملی"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn Exportable="false" DataField="NameMoshtary" HeaderText="نام "></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn   DataField="Famil" HeaderText="نام خانوادگی"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn   DataField="Mobile" HeaderText="تلفن"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SahmeDolat" DataFormatString="{0:#,0}" Aggregate="Sum" ItemStyle-BackColor="Yellow" HeaderStyle-BackColor="Yellow" FooterStyle-BackColor="Yellow" HeaderText="سهم دولت"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SahmeBank" DataFormatString="{0:#,0}" Aggregate="Sum" ItemStyle-BackColor="LightBlue" HeaderStyle-BackColor="LightBlue" FooterStyle-BackColor="LightBlue" HeaderText="سهم بانک"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SahmeMotaghazi" DataFormatString="{0:#,0}" Aggregate="Sum" ItemStyle-BackColor="GreenYellow" FooterStyle-BackColor="GreenYellow" HeaderStyle-BackColor="GreenYellow" HeaderText="سهم متقاضی"></telerik:GridBoundColumn>
                               
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <uc1:MoroorgaranEntityDataSource ID="En1" Where="it.IDZirProje=@id" Include="Paymankar" EntitySetName="ZirProjeReservations" runat="server" PreventSelectWhenParameterNull="true" EnableFlattening="false" DefaultContainerName="AbyariEntities" ConnectionString="name=AbyariEntities" EnableDelete="true">
                        <WhereParameters>
                            <uc1:CustomControlParameter ControlID="GrdZirPRoje" Type="Int32" Name="id" />
                        </WhereParameters>
                    </uc1:MoroorgaranEntityDataSource>
                    <telerik:RadGrid ID="grdReserved" DataSourceID="En1" runat="server" Skin="Windows7" AllowAutomaticDeletes="true" >
                 <ClientSettings>
                     <ClientEvents OnRowCreated="RowCreated"  />
                 </ClientSettings>
                        <MasterTableView AutoGenerateColumns="false" DataKeyNames="IDPaymankar,IDZirProje" ClientDataKeyNames="IDPaymankar"  >
                            <Columns>
                                <telerik:GridTemplateColumn >
                                    
                                    <ItemTemplate>
                                        <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-sm btn-danger" Text="حذف" CommandName="Delete" OnClientClick="return confirm('از حذف رزرو اطمینان دارید');" />
                                    </ItemTemplate> 
                                </telerik:GridTemplateColumn>
                                  <telerik:GridTemplateColumn >
                                    <ItemTemplate>
                                        <input type="button" onclick="<%# "decontract(this,"+ Eval("IDPaymankar")  +"); " %>" class="btn btn-sm btn-warning" value="لغو قرارداد" />

                                    </ItemTemplate>
                                  </telerik:GridTemplateColumn>
                                             <telerik:GridTemplateColumn >
                                    <ItemTemplate>
                                        
                                        <input type="button"  data-toggle="modal" data-target="#contractbtn" onclick="<%# "setidpaymankar("+ Eval("IDPaymankar")  +")" %>" class="btn btn-sm btn-success" value="عقد قرارداد" />
                                    </ItemTemplate> 
                               
                                </telerik:GridTemplateColumn>
                                 <telerik:GridTemplateColumn >
                                    <ItemTemplate>
                                        <input type="button" onclick="<%# "delivery(this,"+ Eval("IDPaymankar")  +"); " %>" class="btn btn-sm btn-info" value="تحویل موقت" />
                                        </ItemTemplate>
                                     </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn>
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" Text='<%# Eval("PaymankerName") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>
            </div>
<div class="modal fade" id="contractbtn" tabindex="-1" role="dialog">
<div class="modal-dialog modal-lg" role="document" id="Div2">
<div class="modal-content persian">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">&times;</button>
<h5 class="modal-title"><i class="fa fa-pencil"></i>تاریخ قرارداد را ثبت نمایید</h5>

</div>
<div class="modal-body">
<div class="box-body">
    <em:JQLoader LoadJQScript="false" LoadUIScript="false" ID="loader" runat="server"></em:JQLoader>
           <div class="col-sm-3 text-center">
        تاریخ ورود به انجمن
               </div>
           <div class="col-sm-9 text-center">

     <em:JQDatePicker ID="entrydate" runat="server" ChangeMonth="true" ChangeYear="true" Regional="fa" DateFormat="YMD" CalendarType="Jalali"></em:JQDatePicker>
        </div>
    <div class="col-sm-3 text-center">
        تاریخ قرارداد
        </div>
           <div class="col-sm-9 text-center">

     <em:JQDatePicker ID="contractdate" runat="server" ChangeMonth="true" ChangeYear="true" Regional="fa" DateFormat="YMD" CalendarType="Jalali"></em:JQDatePicker>
        </div>

    <div class="col-sm-12 text-center">

    <input type="button" onclick="contract(this);"   class="btn btn-sm btn-success" value="ثبت" /> 
        </div>
</div>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">بستن</button>
</div>
</div>
</div>
</div>

<div class="modal fade" id="paymankardetail" tabindex="-1" role="dialog">
<div class="modal-dialog modal-lg" role="document" id="modalDrag">
<div class="modal-content persian">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">&times;</button>
<h5 class="modal-title"><i class="fa fa-pencil"></i>لیست پیمانکاران مجاز</h5>
 
</div>
<div class="modal-body">
<div class="box-body">
    <uc2:UscEntekhabPaymankar runat="server" ID="UscEntekhabPaymankar" />
</div>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">بستن</button>
</div>
</div>
</div>
</div>
        </div>
   
    </asp:Panel>
</asp:Content>
