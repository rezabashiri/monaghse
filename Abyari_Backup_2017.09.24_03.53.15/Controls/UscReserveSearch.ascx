<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscReserveSearch.ascx.cs" Inherits="Abyari.Controls.UscReserveSearch" %>
<%@ Register Src="~/Controls/uscMahaleEjra.ascx" TagPrefix="uc2" TagName="uscMahaleEjra" %>
<%@ Register Src="~/Controls/UscSelectPaymankar.ascx" TagPrefix="uc2" TagName="UscSelectPaymankar" %>


<em:JQLoader ID="loader" runat="server" LoadJQScript="false" LoadUIScript="false" LoadUICoreStyles="true" Theme="Flick" ></em:JQLoader>

     <div class="row">
         <asp:Panel ID="pnlEnable" runat="server" >
            <uc2:uscMahaleEjra runat="server" ID="uscMahaleEjra" />
                  <div class="col-md-2 col-sm-12 text-left">
                        از تاریخ
                    </div>

                    <div class="col-md-4 col-sm-12 text-right">
                       <em:JQDatePicker ID="dteFrom" DateFormat="YMD" ChangeMonth="true" EnableViewState="true"    ChangeYear="true" Regional="fa"   runat="server"  ></em:JQDatePicker>
                    </div>
         <uc2:UscSelectPaymankar runat="server" ID="UscSelectPaymankar" />
              <div class ="col-sm-12 col-md-2 text-left ">
                      تا تاریخ
                        </div>
                    <div class="col-md-4 col-sm-10">
                       <em:JQDatePicker ID="dteTo" DateFormat="YMD" ChangeMonth="true" EnableViewState="true"    ChangeYear="true" Regional="fa"   runat="server"  ></em:JQDatePicker>
                    </div>
          <div class="col-md-3 col-sm-12 text-left   ">
                      وضعیت طرح
                    </div>
                    <div class="col-md-3 col-sm-12  text-right" style="direction: rtl">
                        <telerik:RadComboBox ID="cmbStatus" runat="server" AppendDataBoundItems="true"  Skin="Windows7"  
                            EnableEmbeddedBaseStylesheet="true"
                            EnableEmbeddedSkins="true" DropDownAutoWidth="Enabled" Filter="Contains"
                            >
                            <Items>
                                <telerik:RadComboBoxItem Text="همه" Value="" />
                                
                                <telerik:RadComboBoxItem Text="رزرو شده و عدم قرارداد" Value="wreserve" />
                                <telerik:RadComboBoxItem Text="رزرو شده و قرارداد" Value="contract" />

                            </Items>
                        </telerik:RadComboBox>
                    </div>
             </asp:Panel>
              <div class ="col-sm-12 col-md-2 text-left ">
                        گزارش پروژه های منقضی
                        </div>
                    <div class="col-md-4 col-sm-10">
                        <asp:CheckBox ID="chkexpired" Checked="false" OnCheckedChanged="chkexpired_CheckedChanged" AutoPostBack="true" runat="server" />
                    </div>
         </div>