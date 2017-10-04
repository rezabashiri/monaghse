<%@ Page Title="" Language="C#" MasterPageFile="~/Design/Masters/Main.Master" AutoEventWireup="true" CodeBehind="getData.aspx.cs" Inherits="Abyari.Monaghese.getData" %>

<%@ Register Assembly="App_Web_uscimportfromexcel.ascx.cc671b29" Namespace="WebUtility.Controls" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <link href="../Design/Styles/wizard.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="modal fade" id="modalAttachment">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">

                    <h3 class="modal-title" style="text-align: right;">
                        <span class="label label-primary">قرار دادن فایل های ضمیمه</span></h3>
                </div>
                <div class="modal-body">


                    <div class="row">
                        <label class="col-md-6 col-sm-12">فایل اکسل مربوط به فهرست بهای اجرا و لوله های طرح </label>
                        <label class="col-md-6 col-sm-12">
                            <uc1:ImportFromExcel ID="ImportFromExcel_ProjectOne" runat="server"></uc1:ImportFromExcel>
                        </label>
                    </div>

                    <div class="row">
                        <label class="col-md-6 col-sm-12">PDF مربوط به لوازم، اتصالات و متعلقات</label>
                        <label class="col-md-6 col-sm-12">
                            <uc1:FileUpload RoleId='<%# uscFileUplaod.RoleId %>' UserId='<%# uscRoleSelect.UserId %>' ID="uscFileUplaod" runat="server" />
                        </label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success">ذخیره</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">بستن</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>



    <asp:UpdatePanel runat="server" ID="updatepanel1">
        <ContentTemplate>

            <div class="demo-container">
                <div class="wizardHeader"></div>
                <telerik:RadWizard RenderMode="Lightweight" ID="RadWizard3" RenderedSteps="Active" dir="rtl" runat="server" Localization-Next="مرحله بعد" Localization-Finish="اتمام" Localization-Cancel="انصراف" Localization-Previous="مرحله قبل" DisplayNavigationButtons="True" DisplayNavigationBar="True">
                    <WizardSteps>
                        <telerik:RadWizardStep ID="RadWizardStep4" Title="وارد کردن طرح" runat="server" StepType="Start" SpriteCssClass="accountInfo">

                            <div class="row col-sm-9">
                                <uc1:RoleSelect ID="uscRoleSelect"  runat="server"></uc1:RoleSelect>
                            </div>

                            <div class="row">
                                <div class="col-md-12 col-sm-12">

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

                            <telerik:RadGrid ID="grdError" runat="server" Skin="Sunset" AllowFilteringByColumn="false" AllowPaging="true">
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
                            </telerik:RadGrid>
                            <%--       </div>
                            </div>--%>
                        </telerik:RadWizardStep>

                        <telerik:RadWizardStep Title="اضافه کردن فایل" runat="server" StepType="Finish" ValidationGroup="Confirmation" SpriteCssClass="confirmation">

                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <label>
                                        لطفا برای وارد کردن اطلاعات هر پروژه بر روی دکمه انتخاب کلیک کنید یا تمامی آن ها را توسط قسمت زیر انتخاب کنید
                                    </label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    می توانید توسط این قسمت فایل اکسل مربوط به تمام فهرست بهای اجرا و لوله های طرح ها را وارد نمائید
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-12 col-sm-12">

                                    <uc1:ImportFromExcel ID="ImportFromExcel_ProjectGeneral" runat="server"></uc1:ImportFromExcel>

                                </div>
                            </div>

                            <div class="row">

                                <div class="col-md-12 col-sm-12">

                                    <telerik:RadGrid ID="grdProjecsSelect" runat="server" Skin="Sunset" AllowFilteringByColumn="false" AllowPaging="false">
                                        <ClientSettings>
                                            <Scrolling AllowScroll="true" ScrollHeight="700" />
                                            <Resizing AllowResizeToFit="true" AllowColumnResize="true" />

                                        </ClientSettings>
                                        <MasterTableView DataKeyNames="Code" AutoGenerateColumns="false">
                                            <Columns>
                                                <telerik:GridTemplateColumn HeaderText="افزودن فایل">
                                                    <ItemTemplate>
                                                        <input type="button" class="btn btn-small btn-success check" data-idproje="<%# Eval("Code") %>" onclick="openAttachmentModel(this);" value="افزودن" />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>

                                                <telerik:GridBoundColumn DataField="Name" HeaderText="نام مجری"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="CodeMeliMoshtary" HeaderText="کدملی"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Code" HeaderText="کد پروژه"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Shahrestan" HeaderText="شهرستان"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="NoeProje" HeaderText="عنوان کامل فعالیت"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Sath" ItemStyle-BackColor="Salmon" HeaderText="سطح اجرا"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="SahmeDolat" DataFormatString="{0:#,0}" Aggregate="Sum" ItemStyle-BackColor="Yellow" HeaderStyle-BackColor="Yellow" FooterStyle-BackColor="Yellow" HeaderText="سهم دولت"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="SahmeBank" DataFormatString="{0:#,0}" Aggregate="Sum" ItemStyle-BackColor="LightBlue" HeaderStyle-BackColor="LightBlue" FooterStyle-BackColor="LightBlue" HeaderText="سهم بانک"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="SahmeMotaghazi" DataFormatString="{0:#,0}" Aggregate="Sum" ItemStyle-BackColor="GreenYellow" FooterStyle-BackColor="GreenYellow" HeaderStyle-BackColor="GreenYellow" HeaderText="سهم متقاضی"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Mobile" HeaderText="تلفن"></telerik:GridBoundColumn>
                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>
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
                            <p> با موفقیت مراحل را تمام کردید</p>
                        </telerik:RadWizardStep>

                    </WizardSteps>
                </telerik:RadWizard>
            </div>



        </ContentTemplate>
    </asp:UpdatePanel>



    <script>

        //code for grid
        var selectedProjects = -2;

        function openAttachmentModel(btn) {


            var grd = $find("<%= grdProjecsSelect.ClientID %>");
            var selectedkey = $(btn).data("idproje");
            selectedProjects = selectedkey;
            $('#<%= selectedProjectID.ClientID %>').val(selectedProjects);

            //alert(selectedProjects);

            $('#modalAttachment').modal();
        }

    </script>

    <asp:HiddenField ID="selectedProjectID" runat="server" />


</asp:Content>
