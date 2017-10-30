<%@ Page Title="گزارشات مدیریتی" Language="C#" MasterPageFile="~/Design/Masters/Administrator.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Abyari.Reports.Report" %>

<%@ Register Src="~/Controls/UscPaymankarSearchParameter.ascx" TagPrefix="uc2" TagName="UscPaymankarSearchParameter" %>
<%@ Register Src="~/Controls/UscShowPaymankars.ascx" TagPrefix="uc2" TagName="UscShowPaymankars" %>
<%@ Register Src="~/Controls/UscReserveSearch.ascx" TagPrefix="uc2" TagName="UscReserveSearch" %>




<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        var invid = -1;
        function TotalReportDoubleClick(sender, eventArgs)
        {

            invid = eventArgs.getDataKeyValue("InvoiceID");
            $("#showpayment").modal('toggle');
        }
    </script>
      <em:JQLoader ID="loader" runat="server" LoadJQScript="false" LoadUIScript="false" LoadUICoreStyles="true" Theme="Flick" ></em:JQLoader>

 
    <telerik:RadTabStrip MultiPageID="RadMultiPage1" ID="tab" Skin="Windows7"  runat="server">
        <Tabs>
            <telerik:RadTab Text="گزارش تجمیعی" Selected="true" PageViewID="RadPageView1"></telerik:RadTab>
            <telerik:RadTab Text="گزارش درخواست" PageViewID="RadPageView2" ></telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="RadMultiPage1" SelectedIndex="0"  runat="server">
        <telerik:RadPageView ID="RadPageView1" runat="server">
            <uc2:UscPaymankarSearchParameter HideSearchBtn="true"  runat="server" ID="UscPaymankarSearchParameter" />


                   <div class="row">
                  <div class="col-md-2 col-sm-12 text-left">
                        از تاریخ
                    </div>

                    <div class="col-md-4 col-sm-12 text-right">
                       <em:JQDatePicker ID="dteFrom" DateFormat="YMD" ChangeMonth="true" EnableViewState="true"  IsRTL="true" CalendarType="Jalali"   ChangeYear="true" Regional="fa" Date='<%# Bind( "ContractDate") %>' runat="server"  ></em:JQDatePicker>
                    </div>
                        <div class ="col-sm-12 col-md-2 text-left ">
                        نوع صورت حساب
                        </div>
                    <div class="col-md-4 col-sm-10">
                  
                   <uc1:InvoiceTypes ID="InvoiceTypes" runat="server" ></uc1:InvoiceTypes> 

                    </div>
                </div>
     
            <div class="row">
                <div class="col-md-12 col-sm-12 text-center">
                    <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-lg  btn-info" Text="جستجو"   OnClick="btnSearch_Click" />
                </div> 
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12 text-center">
                    <telerik:RadGrid ID="grdTotalByPaymankar" runat="server" AllowSorting="true" OnSortCommand="grdTotalByPaymankar_SortCommand" Skin="Windows7" ShowFooter="true"  >
                        <ClientSettings>
                            <ClientEvents OnRowDblClick="TotalReportDoubleClick" />
                            <Scrolling AllowScroll="true" ScrollHeight="900" UseStaticHeaders="true" />
                        </ClientSettings>
                        <ExportSettings ExportOnlyData="true" FileName="گزارش کلی" IgnorePaging="true" HideStructureColumns="true" >
                              <Excel Format="Biff" />
                        </ExportSettings>

                        <MasterTableView AutoGenerateColumns="false" ClientDataKeyNames="InvoiceID" CommandItemDisplay="Top" >
                            <CommandItemSettings ShowExportToExcelButton="true"   ShowExportToPdfButton="true" ShowRefreshButton="false" ShowAddNewRecordButton="false" ShowExportToWordButton="true" />
                          
                            <Columns>
                      
                                <telerik:GridBoundColumn  DataField="NamePaymankar" FooterText="جمع کل" HeaderText="نام شرکت"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Rotbe" HeaderText="رتبه"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SatheMojazeSalane" HeaderText="ظرفیت سالانه مجاز"></telerik:GridBoundColumn>        
                                <telerik:GridBoundColumn DataField="SatheKol" HeaderText="کل مساحت قرارداد اجرایی" Aggregate="Sum"  DataFormatString="{0:N}" FooterAggregateFormatString="{0:N}"></telerik:GridBoundColumn>
                                <telerik:GridCalculatedColumn ItemStyle-BackColor="Yellow" FooterStyle-BackColor="Yellow" HeaderStyle-BackColor="Yellow" DataFields="SatheMojazeSalane,SatheKol" Aggregate="Sum" DataType="System.Double" DataFormatString="{0:N}" FooterAggregateFormatString="{0:N}"  Expression="{0} - {1} " HeaderText="مساحت باقی مانده"  ></telerik:GridCalculatedColumn>
                                <telerik:GridBoundColumn DataField="TedadKarMojaz" HeaderText="ظرفیت مجاز " ItemStyle-BackColor="Cyan" HeaderStyle-BackColor="Cyan" FooterStyle-BackColor="Cyan" Aggregate="Sum"  FooterAggregateFormatString="{0:N}"></telerik:GridBoundColumn>
                               
                                 <telerik:GridBoundColumn DataField="TedadJariBozorg" HeaderText="قراردادهای بزرگ جاری " Aggregate="Sum" ItemStyle-BackColor="Chocolate" HeaderStyle-BackColor="Chocolate" FooterStyle-BackColor="Chocolate"    FooterAggregateFormatString="{0:N}"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TedadJari" HeaderText="تمام قراردادهای جاری" Aggregate="Sum" ItemStyle-BackColor="LightBlue" HeaderStyle-BackColor="LightBlue" FooterStyle-BackColor="LightBlue"  FooterAggregateFormatString="{0:N}"  ></telerik:GridBoundColumn>
                                <telerik:GridCalculatedColumn DataFields="TedadKarMojaz,TedadJariBozorg" DataType="System.Double" ItemStyle-BackColor="Red" HeaderStyle-BackColor="Red" FooterStyle-BackColor="Red" HeaderText="ظرفیت باقی مانده" Expression="{0} - {1}"></telerik:GridCalculatedColumn>
                                <telerik:GridBoundColumn DataField="آبیاری_قطره_ای" HeaderText="آبیاری قطره ای" Aggregate="Sum"  DataFormatString="{0:N}" FooterAggregateFormatString="{0:#,0}"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="موضعی" HeaderText="موضعی" Aggregate="Sum"  DataFormatString="{0:N}" FooterAggregateFormatString="{0:N}"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="آبیاری_بارانی" HeaderText="آبیاری بارانی" Aggregate="Sum"  DataFormatString="{0:N}" FooterAggregateFormatString="{0:N}"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="آبیاری_بارانی_تیپ" HeaderText="آبیاری بارانی تیپ" Aggregate="Sum"  DataFormatString="{0:N}" FooterAggregateFormatString="{0:N}"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="آبیاری_کم_فشار" HeaderText="آبیاری کم فشار" Aggregate="Sum"  DataFormatString="{0:N}" FooterAggregateFormatString="{0:N}"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="آبیاری_کم_فشار_تیپ" HeaderText="آبیاری کم فشار تیپ" Aggregate="Sum"  DataFormatString="{0:N}" FooterAggregateFormatString="{0:N}"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TedadKol" HeaderText="تعداد کل قراردادها" Aggregate="Sum"   FooterAggregateFormatString="{0:N}"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TedadTahvilShode" HeaderText="قراردادهای تحویل شده" Aggregate="Sum"  FooterAggregateFormatString="{0:N}"></telerik:GridBoundColumn>


                                <telerik:GridBoundColumn DataField="TotalInvoice" HeaderText="مجموع صورت حساب" Aggregate="Sum" ItemStyle-BackColor="GreenYellow" FooterStyle-BackColor="GreenYellow" HeaderStyle-BackColor="GreenYellow"  DataFormatString="{0:N}" FooterAggregateFormatString="{0:N}"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TotalPayment" HeaderText="مجموع پرداختی" ItemStyle-BackColor="YellowGreen" HeaderStyle-BackColor="YellowGreen" FooterStyle-BackColor="YellowGreen" Aggregate="Sum"  DataFormatString="{0:N}" FooterAggregateFormatString="{0:N}"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TotalDue" HeaderText="مجموع بدهی" Aggregate="Sum" ItemStyle-BackColor="Salmon" FooterStyle-BackColor="Salmon" HeaderStyle-BackColor="Salmon"  DataFormatString="{0:N}" FooterAggregateFormatString="{0:N}" FooterText="بدهی"></telerik:GridBoundColumn>

                                
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>
            </div>
                                   <div class="modal fade" id="showpayment" tabindex="-1" role="dialog">
<div class="modal-dialog modal-lg" role="document" id="modalDrag">
<div class="modal-content persian">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">&times;</button>
<h5 class="modal-title"><i class="fa fa-pencil"></i>لیست پرداختهای شرکت</h5>
 
</div>
<div class="modal-body">
<div class="box-body">
    <uc2:UscShowPaymankars runat="server" ID="UscShowPaymankars" />
</div>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">بستن</button>
</div>
</div>
</div>
</div>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server">
            <uc2:UscReserveSearch runat="server" ID="UscReserveSearch" />
               <div class="col-sm-12 text-center ">
                    <asp:Button ID="SearchReserve" CssClass="btn  btn-success" OnClick="SearchReserve_Click" runat="server" Text="جستجو" />
                </div>
                 <telerik:RadGrid ID="grdReserve" runat="server" AllowSorting="true" OnSortCommand="grdReserve_SortCommand" Skin="Windows7" ShowFooter="true"  >
                        <ClientSettings>
                            
                            <Scrolling AllowScroll="true" ScrollHeight="900" UseStaticHeaders="true" />
                        </ClientSettings>
                        <ExportSettings ExportOnlyData="true" FileName="گزارش درخواستها" IgnorePaging="true" HideStructureColumns="true" >
                              <Excel Format="Biff" />
                        </ExportSettings>

                        <MasterTableView AutoGenerateColumns="false"   CommandItemDisplay="Top" >
                            <CommandItemSettings ShowExportToExcelButton="true"   ShowExportToPdfButton="true" ShowRefreshButton="false" ShowAddNewRecordButton="false" ShowExportToWordButton="true" />
                          
                            <Columns>
                      
                                <telerik:GridBoundColumn  DataField="NamePaymankar"   HeaderText="نام شرکت"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Rotbe" HeaderText="رتبه"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn  DataField="Name"   HeaderText="نام طرح"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn  DataField="PersianCreateDate" DataFormatString="{0:yyyy/MM/dd}" Exportable="false"  HeaderText="تاریخ رزرو"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn  DataField="Sharh"   HeaderText="نوع سیستم"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn  DataField="Shahrestan"   HeaderText="محل اجرا"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Sath" HeaderText="سطح هکتار" ItemStyle-BackColor="YellowGreen" HeaderStyle-BackColor="YellowGreen" FooterStyle-BackColor="YellowGreen" Aggregate="Sum"  DataFormatString="{0:N}" FooterAggregateFormatString="{0:N}"></telerik:GridBoundColumn>
                                <telerik:GridCheckBoxColumn DataField="Tavafogh" HeaderText="نوافق کشاورز"></telerik:GridCheckBoxColumn>
                                
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
</asp:Content>
