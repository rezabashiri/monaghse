<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscPaymankarSearchParameter.ascx.cs" Inherits="Abyari.Controls.UscPaymankarSearchParameter" %>
    <div class="form-horizontal">

 <div class="row">
      <div class="form-group">

  <div class="col-md-2 col-sm-12 text-right ">
                       کد اقتصادی
                    </div>
                    <div class="col-md-3 col-sm-12  text-left"  >
                    <asp:TextBox ID="txtCodeEghtesadi" CssClass="form-control text-right  number" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3 col-sm-12 text-right ">
                        شماره شناسنامه/شماره ثبت
                    </div>
                    <div class="col-md-3 col-sm-12 text-left">
                        <asp:TextBox ID="txtSabt" CssClass="form-control text-right  number" runat="server"></asp:TextBox>
                    </div>
              </div>
      <div class="form-group">

                      <div class="col-md-2 col-sm-12 text-right ">
                      پیمانکار
                    </div>
                    <div class="col-md-3 col-sm-12  text-left" style="direction: rtl">
                        <telerik:RadComboBox ID="cmbPyamankar" runat="server" AppendDataBoundItems="true"  Skin="Windows7" DataTextField="Sharh" DataValueField="ID" SelectMethod="GetPaymankar"
                            EnableEmbeddedBaseStylesheet="true"
                            EnableEmbeddedSkins="true" DropDownAutoWidth="Enabled" Filter="Contains"
                            >
                            <Items>
                                <telerik:RadComboBoxItem Text="انتخاب کنید" Value="" />
                            </Items>
                        </telerik:RadComboBox>
                    </div>
                    <div class="col-md-3 col-sm-12 text-right ">
                   شناسه ملی/کد ملی
                    </div>
                    <div class="col-md-3 col-sm-12 text-left">
                        <asp:TextBox ID="txtShenaseMeli" CssClass="form-control text-right  LegalNationalCode" runat="server"></asp:TextBox>
                    </div>
          </div>
                       <div class="col-sm-12 text-center ">
                    <asp:Button ID="BtnSearch" CssClass="btn  btn-success" OnClick="BtnSearch_Click" runat="server" Text="جستجو" />
                </div>
                  </div>
             </div>