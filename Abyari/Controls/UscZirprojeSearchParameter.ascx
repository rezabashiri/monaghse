<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscZirprojeSearchParameter.ascx.cs" Inherits="Abyari.Controls.UscZirprojeSearchParameter" %>
<%@ Register Src="~/Controls/uscMahaleEjra.ascx" TagPrefix="uc2" TagName="uscMahaleEjra" %>
<%@ Register Src="~/Controls/UscSelectPaymankar.ascx" TagPrefix="uc2" TagName="UscSelectPaymankar" %>
<%@ Register Src="~/Controls/UscSathParameter.ascx" TagPrefix="uc2" TagName="UscSathParameter" %>
<%@ Register Src="~/Controls/UscNoeParameter.ascx" TagPrefix="uc2" TagName="UscNoeParameter" %>





    <div class="form-horizontal">
<div class="row">  
      <div class="form-group">
<uc2:uscMahaleEjra runat="server" ID="uscMahaleEjra" />
</div>
    <div class="form-group">
                        
                        <uc2:UscNoeParameter runat="server" ID="UscNoeParameter" />
                     
                    <div class="col-md-2 col-sm-12 text-right ">
                        کد پروژه
                    </div>
                    <div class="col-md-3 col-sm-12 text-left">
                        <asp:TextBox ID="TxtCode" CssClass="form-control text-right  number" runat="server"></asp:TextBox>
                    </div>
              </div>
    <div class="form-group">
                       <div class="col-md-2 col-sm-12 text-right ">
                      نام خانوادگی متقاضی
                    </div>
     <div class="col-md-3 col-sm-12   " style="direction: rtl">
                        <asp:TextBox ID="txtFamily" CssClass="form-control text-right  " runat="server"></asp:TextBox>
         </div>
                    <div class="col-md-2 col-sm-12 text-right ">
                   کد ملی متقاضی
                    </div>
        
                    <div class="col-md-3 col-sm-12 text-left">
                        <asp:TextBox ID="txtCodeMeli" CssClass="form-control text-right  LegalNationalCode" runat="server"></asp:TextBox>
                    </div>
        </div>
    <div class="form-group">

                    <div class="col-md-2 col-sm-12 text-right  ">
                      نام پروژه
                    </div>
                    <div class="col-md-3 col-sm-12  text-left" style="direction: rtl">
                        <asp:TextBox ID="txtName" CssClass="form-control text-right  " runat="server"></asp:TextBox>
                    </div>
                <asp:Panel ID="pnlStatus" runat="server">
                    
      
                        <div class="col-md-2 col-sm-12 text-right">
                      وضعیت پروژه
                    </div>
                    <div class="col-md-3 col-sm-12  text-left"  >
                        <telerik:RadComboBox ID="cmbSatus" runat="server" AppendDataBoundItems="true"  Skin="Windows7" 
                            EnableEmbeddedBaseStylesheet="true"
                            EnableEmbeddedSkins="true" DropDownAutoWidth="Enabled" Filter="Contains"
                            >
                            <Items>
                                <telerik:RadComboBoxItem Text="همه" Value="" />
                                <telerik:RadComboBoxItem Text="بدون عقد قرارداد" Value="none" />
                                <telerik:RadComboBoxItem Text="عقد قرارداد شده" Value="contract" />
                                <telerik:RadComboBoxItem Text="تحویل نشده" Value="nodelivery" />
                                <telerik:RadComboBoxItem Text="تحویل شده" Value="delivery" />

                            </Items>
                        </telerik:RadComboBox>
                    </div>
                              </asp:Panel>
        </div>
        <div class="form-group">
    <uc2:UscSelectPaymankar runat="server" ID="UscSelectPaymankar" />
    <div class="col-md-6 com-sm-12"> 
         <uc2:UscSathParameter runat="server" ID="UscSathParameter" />
    </div>
    </div>
    </div>
                <div class="col-sm-12 text-center ">
                    <asp:Button ID="BtnSearch" CssClass="btn  btn-success" OnClick="BtnSearch_Click" runat="server" Text="جستجو" />
                </div>
        </div>
      