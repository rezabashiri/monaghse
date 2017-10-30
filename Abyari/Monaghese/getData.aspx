<%@ Page Title="" Language="C#" MasterPageFile="~/Design/Masters/Administrator.Master" AutoEventWireup="true" CodeBehind="getData.aspx.cs" Inherits="Abyari.Monaghese.getData" %>

<%@ Register Src="~/Controls/UscGridWtihAttachment.ascx" TagPrefix="uc2" TagName="UscGridWtihAttachment" %>


<%--<%@ Register Assembly="App_Web_uscimportfromexcel.ascx.cc671b29" Namespace="WebUtility.Controls" TagPrefix="uc1" %>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <link href="../Design/Styles/wizard.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server" ID="updatepanel1">
        <ContentTemplate>

            <div class="demo-container">
                <div class="wizardHeader"></div>
                <telerik:RadWizard RenderMode="Lightweight" ID="RadWizard3" dir="rtl" runat="server" Localization-Next="مرحله بعد" Localization-Finish="اتمام" Localization-Cancel="انصراف" Localization-Previous="مرحله قبل" DisplayNavigationButtons="True" DisplayNavigationBar="True">
                    <WizardSteps>
                        <telerik:RadWizardStep BorderStyle="Groove" ImageUrl="~/Design/Images/DataImport2.png" ID="RadWizardStep4" Title="وارد کردن طرح" runat="server" StepType="Start" SpriteCssClass="accountInfo">

                            <div class="row" style="padding-right: 140px; padding-top: 20px;">
                                <uc1:RoleSelect ID="uscRoleSelect" runat="server"></uc1:RoleSelect>
                            </div>

                            <div class="row" style="margin: 0; padding: 0;">
                                <div class="col-md-12 col-sm-12" style="text-align: center; border: 2px groove red;">
                                    لطفا قالب اکسل جهت بارگذاری را مانند فایل نمونه وارد نمائید 
                                    <div style="padding-right: 10px; display: inline;">
                                        <a href="../Download/projectProperties.xlsx" download>اکسل نمونه</a>
                                    </div>
                                </div>
                            </div>


                            <div class="row ">
                                <div class="col-md-12 col-sm-12" style="text-align: center;">
                                    لطفا جهت آپلود فایل از این قسمت استفاده نمائید
                                </div>
                            </div>

                            <div class="row ">
                                <div class="col-md-12 col-sm-12" style="margin-right: 300px;">

                                    <uc1:ImportFromExcel ID="ImportFromExcel_projectProperties" runat="server"></uc1:ImportFromExcel>

                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-12 col-sm-12">

                                    <telerik:RadGrid ID="grdShowProjecs" OnDataBound="grdShowProjecs_DataBound" runat="server" Skin="Sunset" AllowFilteringByColumn="false" AllowPaging="false">
                                        <PagerStyle Mode="NextPrevAndNumeric" />

                                        <ClientSettings>
                                            <Scrolling AllowScroll="true" ScrollHeight="700" />
                                            <Resizing AllowResizeToFit="true" AllowColumnResize="true" />
                                        </ClientSettings>
                                    </telerik:RadGrid>
                                </div>
                            </div>

                            <%-- <div class="row">
                                <div class="col-md-12 col-sm-12">--%>

                            <%--for error gridview--%>

                            <%--     <telerik:RadGrid ID="grdError" runat="server" Skin="Sunset" AllowFilteringByColumn="false" AllowPaging="true">
                                <ClientSettings>
                                    <Scrolling AllowScroll="true" ScrollHeight="700" />
                                    <Resizing AllowResizeToFit="true" AllowColumnResize="true" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="false" DataKeyNames="ردیف">
                                    <Columns>
                                        <telerik:GridTemplateColumn HeaderText="افزودن فایل های مورد نیاز">
                                            <ItemTemplate>
                                                <input type="button" class="btn btn-small btn-success check" data-idproje="<%# Eval("ردیف") %>" onclick="openAttachmentModel(this);" value="افزودن" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>


                                        <telerik:GridBoundColumn DataField="ردیف" HeaderText="ردیف" ItemStyle-BackColor="YellowGreen"></telerik:GridBoundColumn>

                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>--%>

                            <%--       </div>
                            </div>--%>
                        </telerik:RadWizardStep>

                        <telerik:RadWizardStep ImageUrl="~/Design/Images/attach.jpg" BorderStyle="Groove" Title=" اضافه کردن فهرست بهای اجرا بصورت کلی" runat="server" StepType="Step" ValidationGroup="Confirmation" SpriteCssClass="confirmation">

                            <div class="row">
                                <div class="col-md-12 col-sm-12" style="text-align: center; padding-top: 20px;">
                                    <label>
                                        لطفا برای وارد کردن فهرست بهای اجرا بصورت کلی از قسمت زیر استفاده کنید
                                    </label>
                                </div>
                            </div>


                            <div class="row" style="margin: 0; padding: 0;">
                                <div class="col-md-12 col-sm-12" style="text-align: center; border: 2px groove red;">
                                    توسط این قسمت مطابق فایل اکسل نمونه، فایل مربوط به فهرست بهای اجرا را بصورت کلی وارد نمائید
                                    <div style="padding-right: 10px; display: inline;">
                                        <a href="../Download/fehrestBaha_general.xlsx" download>اکسل نمونه</a>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-12 col-sm-12" style="text-align: center;">
                                    لطفا جهت آپلود فایل از این قسمت استفاده نمائید
                                </div>
                            </div>

                            <div class="row ">
                                <div class="col-md-12 col-sm-12" style="margin-right: 300px;">

                                    <uc1:ImportFromExcel ID="ImportFromExcel_ProjectGeneral" runat="server"></uc1:ImportFromExcel>

                                </div>
                            </div>

                        </telerik:RadWizardStep>

                        <telerik:RadWizardStep ImageUrl="~/Design/Images/pipes.jpg" BorderStyle="Groove" Title="   اضافه کردن لوله های طرح بصورت کلی" runat="server" StepType="Step" ValidationGroup="Confirmation" SpriteCssClass="confirmation">

                            <div class="row">
                                <div class="col-md-12 col-sm-12" style="text-align: center; padding-top: 20px;">
                                    <label>
                                        لطفا برای وارد کردن مشخصات لوله های طرح بصورت کلی از قسمت زیر استفاده نمائید
                                    </label>
                                </div>
                            </div>


                            <div class="row" style="margin: 0; padding: 0;">
                                <div class="col-md-12 col-sm-12" style="text-align: center; border: 2px groove red;">
                                    توسط این قسمت مطابق فایل اکسل نمونه، فایل مربوط به لوله های طرح ها را بصورت کلی وارد نمائید
                                    <div style="padding-right: 10px; display: inline;">
                                        <a href="../Download/loleh_general.xlsx" download>اکسل نمونه</a>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-12 col-sm-12" style="text-align: center;">
                                    لطفا جهت آپلود فایل از این قسمت استفاده نمائید
                                </div>
                            </div>

                            <div class="row ">
                                <div class="col-md-12 col-sm-12" style="margin-right: 300px;">

                                    <uc1:ImportFromExcel ID="ImportFromExcel_LolehGeneral" runat="server"></uc1:ImportFromExcel>

                                </div>
                            </div>

                        </telerik:RadWizardStep>



                        <telerik:RadWizardStep ImageUrl="~/Design/Images/DataImportIcon.png" BorderStyle="Groove" Title="  اضافه کردن فهرست بهای اجرا و لوله های طرح بر اساس پروژه" runat="server" StepType="Finish" ValidationGroup="Confirmation" SpriteCssClass="confirmation">

                            <div class="row">
                                <div class="col-md-12 col-sm-12" style="text-align: center; padding-top: 20px;">
                                    <label>
                                        لطفا برای وارد کردن فهرست بهای اجرا و لوله های هر طرح بر روی عکس در جدول زیر کلیک کنید
                                    </label>
                                </div>
                            </div>

                            <div class="row">

                                <div class="col-md-12 col-sm-12">

                                    <%--for grid with attachment--%>
                                    <uc2:UscGridWtihAttachment runat="server" ID="UscGridWtihAttachment" />

                                </div>
                            </div>

                        </telerik:RadWizardStep>


                        <%--            <telerik:RadWizardStep StepType="Finish" Title="اتمام" ValidationGroup="Confirmation" SpriteCssClass="confirmation">
                            <p> با موفقیت مراحل را تمام کردید</p>
                    <%--        <p class="anti-spam-policy">
                                <asp:CheckBox ID="AcceptTermsCheckBox" runat="server" Text="I agree to the terms of use and will abide by the anti-spam policy." CausesValidation="true" ValidationGroup="Confirmation" />
                                <asp:CustomValidator ID="AcceptTermsCheckBoxCustomValidator" runat="server"
                                    EnableClientScript="true" ClientValidationFunction="AcceptTermsCheckBoxValidation" ValidationGroup="Confirmation"
                                    ErrorMessage="Please agree to the anti-spam policy" Display="Dynamic"
                                    CssClass="checkbox-validator" ForeColor="Red" />
                            </p>
                        </telerik:RadWizardStep>--%>

                        <telerik:RadWizardStep runat="server" StepType="Complete" CssClass="complete">
                            <div class="panel panel-success">
                                <div class="panel-heading">
                                    با موفقیت مراحل را تمام کردید

                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-6">
                                            <i class="fa fa-random"></i>
                                            تعداد پروژه های وارد شده:
                                        </div>
                                        <div class="col-sm-12 col-md-6">

                                            <asp:Label ID="lblProjectCount" runat="server"></asp:Label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-12 col-md-6">
                                            <i class="fa fa-empire"></i>
                                            تعداد فهرست بهای طرح وارد شده:
                                        </div>
                                        <div class="col-sm-12 col-md-6">
                                            <asp:Label ID="lblfehrestbahaCount" runat="server"></asp:Label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-12 col-md-6">
                                            <i class="fa fa-pied-piper"></i>
                                            تعداد لوله های طرح وارد شده:
                                        </div>
                                        <div class="col-sm-12 col-md-6">
                                            <asp:Label ID="lblLoolehaCount" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </telerik:RadWizardStep>

                    </WizardSteps>
                </telerik:RadWizard>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
