<%@ Page Title="" Language="C#" MasterPageFile="~/Design/Masters/Main.Master" AutoEventWireup="true" CodeBehind="getData.aspx.cs" Inherits="Abyari.Monaghese.getData" %>

<%@ Register Assembly="App_Web_uscimportfromexcel.ascx.cc671b29" Namespace="WebUtility.Controls" TagPrefix="uc1" %>
<%--<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="qsf" Namespace="Telerik.QuickStart" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <style>
        html .demo-container .redColor {
            color: red;
        }

        /*Wizard wrapper*/
        #example .demo-container {
            width: 725px;
            margin: 40px auto 80px;
            padding: 0 80px;
            border: 0;
            background: url(Images/shadow.png) no-repeat 0 bottom;
        }

        .demo-container .wizardHeader {
            width: 100%;
            height: 50px;
            background: url(Images/header.jpg) no-repeat 0 0;
        }

        /*Wizard*/
        .demo-container .RadWizard {
            padding: 20px;
            border: 1px solid #f1f1f1;
            border-bottom: 0;
            box-shadow: 0 0 0 1px #fff;
        }

        .background-black .demo-container .RadWizard,
        .background-blackmetrotouch .demo-container .RadWizard,
        .background-glow .demo-container .RadWizard,
        .background-office2010black .demo-container .RadWizard {
            border: 0;
            box-shadow: 0;
        }

        .demo-container .RadWizard_Material .rwzBreadCrumb .rwzText:before {
            display: none;
        }

        .demo-container .RadWizard_Material .rwzBreadCrumb .rwzLink {
            padding-left: 0;
        }


        .rwzImage {
            background-image: url(Images/bread-crumb-icons.png);
        }

        html .RadWizard .rwzBreadCrumb span.rwzImage {
            width: 24px;
            height: 24px;
        }

        .demo-container .accountInfo.rwzImage {
            background-position: 0 0;
        }

        .demo-container .rwzSelected .accountInfo.rwzImage {
            background-position: -25px 0;
        }

        .demo-container .rwzDisabled .accountInfo.rwzImage {
            background-position: -50px 0;
        }


        .demo-container .personalInfo.rwzImage {
            background-position: 0 -25px;
        }

        .demo-container .rwzSelected .personalInfo.rwzImage {
            background-position: -25px -25px;
        }

        .demo-container .rwzDisabled .personalInfo.rwzImage {
            background-position: -50px -25px;
        }


        .demo-container .contactDetails.rwzImage {
            background-position: 0 -50px;
        }

        .demo-container .rwzSelected .contactDetails.rwzImage {
            background-position: -25px -50px;
        }

        .demo-container .rwzDisabled .contactDetails.rwzImage {
            background-position: -50px -50px;
        }


        .demo-container .confirmation.rwzImage {
            background-position: 0 -75px;
        }

        .demo-container .rwzSelected .confirmation.rwzImage {
            background-position: -25px -75px;
        }

        .demo-container .rwzDisabled .confirmation.rwzImage {
            background-position: -50px -75px;
        }


        .demo-container .RadWizard .rwzContent {
            overflow: hidden;
            background-color: #f5f5f6;
            line-height: 2em;
            margin: 0 -20px;
            padding: 0 20px;
        }

        .background-black .demo-container .rwzContent,
        .background-blackmetrotouch .demo-container .rwzContent,
        .background-glow .demo-container .rwzContent,
        .background-office2010black .demo-container .rwzContent {
            background-color: transparent;
            background-color: rgba(255,255,255,0.1);
        }

        .background-silver .demo-container .rwzContent {
            background-color: transparent;
            background-color: rgba(255,255,255,0.5);
        }

        .background-sunset .demo-container .rwzContent {
            background: #f9f5f0;
        }

        /*Wizard content*/
        .demo-container .inputWapper {
            display: inline-block;
            *display: inline;
            width: 320px;
            position: relative;
            zoom: 1;
        }

            .demo-container .inputWapper.first {
                margin-right: 35px;
            }

            .demo-container .inputWapper label {
                display: block;
                margin: 5px 0 0;
            }

        .demo-container .validator {
            color: #ff0000;
            position: absolute;
            top: 10px;
            right: 0;
        }

        .demo-container .anti-spam-policy {
            margin-top: 40px;
        }

        .demo-container .conditions {
            display: block;
            color: #a7a7a7;
            font-size: 0.857em;
        }

        .demo-container .inputWapper.date .riLabel {
            position: absolute;
        }

        .demo-container .RadWizard .rwzStep {
            height: 100%;
            position: relative;
        }

        .demo-container .RadWizard.rwzComplete {
            padding-top: 95px;
        }

        .demo-container .rwzStep p {
            margin: 0;
            padding: 10px 0;
        }

        .demo-container .RadWizard .complete {
            height: auto;
            padding: 75px 0;
            text-align: center;
        }
    </style>

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
                        <label class="col-md-6 col-sm-12">فایل اکسل مربوط به لوله های طرح </label>
                        <label class="col-md-6 col-sm-12">
                            <uc1:ImportFromExcel ID="ImportFromExcel1" runat="server"></uc1:ImportFromExcel>
                        </label>
                    </div>

                    <div class="row">
                        <label class="col-md-6 col-sm-12">فایل اکسل مربوط به فهرست بهای اجرا</label>
                        <label class="col-md-6 col-sm-12">
                            <uc1:ImportFromExcel ID="ImportFromExcel2" runat="server"></uc1:ImportFromExcel>
                        </label>
                    </div>

                    <div class="row">
                        <label class="col-md-6 col-sm-12">PDF مربوط به لوازم، اتصالات و متعلقات</label>
                        <label class="col-md-6 col-sm-12">
                            <uc1:ImportFromExcel ID="ImportFromExcel3" runat="server"></uc1:ImportFromExcel>
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





    <%-- <asp:UpdatePanel runat="server" ID="updatepanel1">
        <ContentTemplate>--%>

    <div class="demo-container">
        <div class="wizardHeader"></div>
        <telerik:RadWizard RenderMode="Lightweight" ID="RadWizard3" RenderedSteps="Active" dir="rtl" runat="server" Localization-Next="مرحله بعد" Localization-Finish="اتمام" Localization-Cancel="انصراف" Localization-Previous="مرحله قبل" DisplayNavigationButtons="True" DisplayNavigationBar="True">
            <WizardSteps>
                <telerik:RadWizardStep ID="RadWizardStep4" Title="وارد کردن طرح" runat="server" StepType="Start" SpriteCssClass="accountInfo">

                    <div class="row col-sm-9">
                        <uc1:RoleSelect ID="uscRoleSelect" runat="server"></uc1:RoleSelect>
                    </div>

                    <div class="row">
                        <div class="col-md-12 col-sm-12">

                            <uc1:ImportFromExcel ID="ImportFromExcel" runat="server"></uc1:ImportFromExcel>

                        </div>
                    </div>



                    <div class="row">
                        <div class="col-md-12 col-sm-12">

                            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" RequestQueueSize="5">
                                <AjaxSettings>
                                    <telerik:AjaxSetting AjaxControlID="grdShowProjecs">
                                        <UpdatedControls>
                                            <telerik:AjaxUpdatedControl ControlID="grdShowProjecs" LoadingPanelID="RadAjaxLoadingPanel1" />

                                        </UpdatedControls>
                                    </telerik:AjaxSetting>
                                </AjaxSettings>
                            </telerik:RadAjaxManager>

                            <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" />

                            <telerik:RadGrid ID="grdShowProjecs" runat="server" Skin="Sunset" AllowFilteringByColumn="false" AllowPaging="true">
                                <PagerStyle Mode="NextPrevAndNumeric" />
                                <%--<GroupingSettings CaseSensitive="false" />--%>

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

                <telerik:RadWizardStep Title="اضافه کردن فایل" runat="server" StepType="Step" SpriteCssClass="personalInfo">

                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            لطفا برای وارد کردن اطلاعات هر پروژه بر روی دکمه انتخاب کلیک کنید
                        </div>
                    </div>


                    <div class="row">

                        <div class="col-md-12 col-sm-12">

                            <telerik:RadGrid ID="grdProjecsSelect" runat="server" Skin="Sunset" AllowFilteringByColumn="false" AllowPaging="true">
                                <ClientSettings>
                                    <Scrolling AllowScroll="true" ScrollHeight="700" />
                                    <Resizing AllowResizeToFit="true" AllowColumnResize="true" />

                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="false" DataKeyNames="کدپروژه">
                                    <Columns>
                                        <telerik:GridTemplateColumn HeaderText="افزودن فایل های مورد نیاز">
                                            <ItemTemplate>
                                                <input type="button" class="btn btn-small btn-success check" data-idproje="<%# Eval("کدپروژه") %>" onclick="openAttachmentModel(this);" value="افزودن" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>


                                        <telerik:GridBoundColumn DataField="کدپروژه" HeaderText="کد پروژه" ItemStyle-BackColor="YellowGreen"></telerik:GridBoundColumn>

                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>

                        </div>

                    </div>

                </telerik:RadWizardStep>

                <telerik:RadWizardStep Title="Contact Details" runat="server" StepType="Step" SpriteCssClass="contactDetails">
                    <%-- <div class="inputWapper first">
                        <asp:Label Text="Street Address: *" runat="server" AssociatedControlID="StreetAddressTextBox" />
                        <telerik:RadTextBox RenderMode="Lightweight" ID="StreetAddressTextBox" runat="server" ValidationGroup="ContactDetails" Width="320px"></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="StreetAddressTextBox" EnableClientScript="true" ValidationGroup="ContactDetails" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="inputWapper">
                        <asp:Label Text="City: *" runat="server" AssociatedControlID="CityTextBox" />
                        <telerik:RadTextBox RenderMode="Lightweight" ID="CityTextBox" runat="server" ValidationGroup="ContactDetails" Width="320px"></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CityTextBox" EnableClientScript="true" ValidationGroup="ContactDetails" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="inputWapper first">
                        <asp:Label Text="Country: *" runat="server" AssociatedControlID="CountryTextBox" />
                        <telerik:RadTextBox RenderMode="Lightweight" ID="CountryTextBox" runat="server" ValidationGroup="ContactDetails" Width="320px"></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="CountryTextBox" EnableClientScript="true" ValidationGroup="ContactDetails" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="inputWapper">
                        <asp:Label Text="State:" runat="server" AssociatedControlID="StateTextBox" />
                        <telerik:RadTextBox RenderMode="Lightweight" ID="StateTextBox" runat="server" Width="320px"></telerik:RadTextBox>
                    </div>
                    <div class="inputWapper first">
                        <asp:Label Text="Zip Code:" runat="server" AssociatedControlID="ZipCodeTextBox" />
                        <telerik:RadTextBox RenderMode="Lightweight" ID="ZipCodeTextBox" runat="server" Width="320px"></telerik:RadTextBox>
                    </div>--%>
                </telerik:RadWizardStep>

                <telerik:RadWizardStep StepType="Finish" Title="Confirmation" ValidationGroup="Confirmation" SpriteCssClass="confirmation">
                    <p>Make sure you review our anti-spam, privacy and terms of use policies before you create an account. We take spam very seriously and have a strict permission policy you and your clients will need to abide by.</p>
                    <p class="anti-spam-policy">
                        <asp:CheckBox ID="AcceptTermsCheckBox" runat="server" Text="I agree to the terms of use and will abide by the anti-spam policy." CausesValidation="true" ValidationGroup="Confirmation" />
                        <asp:CustomValidator ID="AcceptTermsCheckBoxCustomValidator" runat="server"
                            EnableClientScript="true" ClientValidationFunction="AcceptTermsCheckBoxValidation" ValidationGroup="Confirmation"
                            ErrorMessage="Please agree to the anti-spam policy" Display="Dynamic"
                            CssClass="checkbox-validator" ForeColor="Red" />
                    </p>
                </telerik:RadWizardStep>

                <telerik:RadWizardStep runat="server" StepType="Complete" CssClass="complete">
                    <p>Congratulations, you have registered successfully!</p>
                    <telerik:RadButton RenderMode="Lightweight" ID="NewRegistrationButton" runat="server" OnClick="NewRegistrationButton_Click" Text="Create a new registration"></telerik:RadButton>
                </telerik:RadWizardStep>

            </WizardSteps>
        </telerik:RadWizard>
    </div>



    <%--     </ContentTemplate>
    </asp:UpdatePanel>--%>









    <script>



        (function () {

            //window.pageLoad = function () {
            //    var $ = $telerik.$;
            //    var cssSelectors = ["accountInfo", "personalInfo", "contactDetails", "confirmation"];
            //    var breadCrumbButtons = $(".rwzBreadCrumb .rwzLI");

            //    for (var i = 0; i < cssSelectors.length; i++) {
            //        $(breadCrumbButtons[i]).addClass(cssSelectors[i]);
            //    }
            //}

            //window.OnClientLoad = function (sender, args) {
            //    for (var i = 1; i < sender.get_wizardSteps().get_count() ; i++) {
            //        sender.get_wizardSteps().getWizardStep(i).set_enabled(false);
            //    }
            //}

            //window.OnClientButtonClicking = function (sender, args) {


            //    if (!args.get_nextActiveStep().get_enabled()) {
            //        args.get_nextActiveStep().set_enabled(true);
            //    }
            //}

            window.AcceptTermsCheckBoxValidation = function (source, args) {
                var termsChecked = $telerik.$("input[id*='AcceptTermsCheckBox']")[0].checked;
                args.IsValid = termsChecked;
            }
        })();




        //code for grid

        var selectedProjects = -2;



        function openAttachmentModel(btn) {


            var grd = $find("<%= grdProjecsSelect.ClientID %>");
            var selectedkey = $(btn).data("idproje");
            selectedProjects = selectedkey;
            alert(selectedProjects);

            $('#modalAttachment').modal();

        }




    </script>


</asp:Content>
