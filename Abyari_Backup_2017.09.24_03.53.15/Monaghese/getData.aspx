<%@ Page Title="" Language="C#" MasterPageFile="~/Design/Masters/Main.Master" AutoEventWireup="true" CodeBehind="getData.aspx.cs" Inherits="Abyari.Monaghese.getData" %>

<%@ Register Assembly="App_Web_uscimportfromexcel.ascx.cc671b29" Namespace="WebUtility.Controls" TagPrefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <link href="CSS/wizard.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="updatePanel_wizard">
        <ContentTemplate>


    <div class="container">
        <div class="row">
            <section>
                <div class="wizard">
                    <div class="wizard-inner">
                        <div class="connecting-line"></div>
                        <ul class="nav nav-tabs" role="tablist">

                            <li role="presentation" class="active">
                                <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="وارد کردن طرح ها">
                                    <span class="round-tab">
                                        <i class="fa fa-tasks"></i>
                                    </span>
                                </a>
                            </li>

                            <li role="presentation" class="disabled">
                                <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="بارگذاری فایل ها">
                                    <span class="round-tab">
                                        <i class="fa fa-eye"></i>
                                    </span>
                                </a>
                            </li>
                            <li role="presentation" class="disabled">
                                <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
                                    <span class="round-tab">
                                        <i class="glyphicon glyphicon-open"></i>
                                    </span>
                                </a>
                            </li>

                            <li role="presentation" class="disabled">
                                <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
                                    <span class="round-tab">
                                        <i class="glyphicon glyphicon-ok-circle"></i>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </div>

                    <div class="tab-content">
                        <div class="tab-pane active" role="tabpanel" id="step1">
                            <div class="step1">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">

                                        <uc1:ImportFromExcel ID="ImportFromExcel" runat="server"></uc1:ImportFromExcel>

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12 col-sm-12">

                                        <telerik:RadGrid ID="grdProjecs" runat="server" Skin="Sunset" AllowFilteringByColumn="false" AllowPaging="true">
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

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12 col-sm-12">

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
                                    </div>
                                </div>


                                <%--    <div class="col-md-6">
                                        <label for="exampleInputEmail1">Last Name</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Last Name">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="exampleInputEmail1">Confirm Email address</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="exampleInputEmail1">Mobile Number</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <div class="row">
                                            <div class="col-md-3 col-xs-3">
                                                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                                            </div>
                                            <div class="col-md-9 col-xs-9">
                                                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                            <ul class="list-inline pull-right">
                                <li>
                                    <%--<asp:Button ID="Button1" runat="server" Text="Button" />--%>
                                    <asp:Button runat="server" ID="btnSave" CssClass="btn btn-success" OnClick="btnSave_Click" Text="ذخیره" />
                                </li>
                                <li>
                                    <button type="button" id="btnGoToNextSteps" class="btn btn-primary next-step">مرحله بعد</button>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-pane" role="tabpanel" id="step2">
                            <div class="step2">
                                <div class="step_21">
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12">لطفا برای وارد کردن اطلاعات هر پروژه بر روی دکمه انتخاب کلیک کنید</div>
                                    </div>
                                </div>
                                <div class="step-22">


                                    <%--for DynamicRadGrid--%>

                                    <%--  <asp:HiddenField ID="hdfield" runat="server" OnInit="hdfield_Init" />

                                    <dynamic:DynamicRadGrid ID="grdShowProject" runat="server" AutoGenerateColumns="false" Skin="Windows7">
                                        <ExportSettings ExportOnlyData="true" HideStructureColumns="true" IgnorePaging="true" OpenInNewWindow="true">
                                        </ExportSettings>
                                        <ClientSettings>
                                            <Scrolling AllowScroll="true" ScrollHeight="700" />
                                            <Resizing AllowResizeToFit="true" AllowColumnResize="true" />
                                        </ClientSettings>
                                        <MasterTableView>
   
                                            <Columns>
                                                <telerik:GridTemplateColumn>
                                                    <ItemTemplate>
                                                        <button ID="btnSelect" class="click btn btn-sm btn-success" value= "اضافه کردن فایل های ضمیمه" onclick="openAttachmentModel();" />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                            </Columns>
                                        </MasterTableView>
                                    </dynamic:DynamicRadGrid>--%>
                                </div>
                            </div>
                            <ul class="list-inline pull-right">
                                <li>
                                    <button type="button" id="btnPrevToSlide1" class="btn btn-default prev-step">مرحله قبل</button></li>
                                <li>
                                    <asp:Button runat="server" ID="btnFinish" CssClass="btn btn-primary next-step" Text="اتمام مراحل" OnClick="btnFinish_Click" />
                                </li>
                            </ul>
                        </div>
                        <div class="tab-pane" role="tabpanel" id="step3">
                            <div class="step33">
                                <h5><strong>Basic Details</strong></h5>
                                <hr>
                                <div class="row mar_ned">
                                </div>
                                <div class="row mar_ned">
                                    <div class="col-md-4 col-xs-3">
                                        <p>
                                            Date of birth
                                        </p>
                                    </div>
                                    <div class="col-md-8 col-xs-9">
                                        <div class="row">
                                            <div class="col-md-4 col-xs-4 wdth">
                                            </div>
                                            <div class="col-md-4 col-xs-4 wdth">
                                            </div>
                                            <div class="col-md-4 col-xs-4 wdth">
                                                <select name="visa_status" id="visa_status" class="dropselectsec1">
                                                    <option value="">Year</option>
                                                    <option value="2">1990</option>
                                                    <option value="1">1991</option>
                                                    <option value="4">1992</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mar_ned">
                                    <div class="col-md-4 col-xs-3">
                                        <p>
                                            Marital Status
                                        </p>
                                    </div>
                                    <div class="col-md-8 col-xs-9">
                                        <label class="radio-inline">
                                            <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                            Single
                                   
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
                                            Married
                                   
                                        </label>
                                    </div>
                                </div>
                                <div class="row mar_ned">
                                    <div class="col-md-4 col-xs-3">
                                        <p align="right">
                                            <stong>Highest Education</stong>
                                        </p>
                                    </div>
                                    <div class="col-md-8 col-xs-9">
                                        <select name="highest_qualification" id="highest_qualification" class="dropselectsec">
                                            <option value="">Select Highest Education</option>
                                            <option value="1">Ph.D</option>
                                            <option value="2">Masters Degree</option>
                                            <option value="3">PG Diploma</option>
                                            <option value="4">Bachelors Degree</option>
                                            <option value="5">Diploma</option>
                                            <option value="6">Intermediate / (10+2)</option>
                                            <option value="7">Secondary</option>
                                            <option value="8">Others</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mar_ned">
                                    <div class="col-md-4 col-xs-3">
                                        <p align="right">
                                            <stong>Specialization</stong>
                                        </p>
                                    </div>
                                    <div class="col-md-8 col-xs-9">
                                        <input type="text" name="specialization" id="specialization" placeholder="Specialization" class="dropselectsec" autocomplete="off">
                                    </div>
                                </div>
                                <div class="row mar_ned">
                                    <div class="col-md-4 col-xs-3">
                                        <p align="right">
                                            <stong>Year of Passed Out</stong>
                                        </p>
                                    </div>
                                    <div class="col-md-8 col-xs-9">
                                        <select name="year_of_passedout" id="year_of_passedout" class="birthdrop">
                                            <option value="">Year</option>
                                            <option value="1980">1980</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mar_ned">
                                    <div class="col-md-4 col-xs-3">
                                        <p>
                                            Total Experience
                                        </p>
                                    </div>
                                    <div class="col-md-8 col-xs-9">
                                        <div class="row">
                                            <div class="col-md-6 col-xs-6 wdth">
                                            </div>
                                            <div class="col-md-6 col-xs-6 wdth">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mar_ned">
                                </div>
                            </div>
                            <ul class="list-inline pull-right">
                                <li>
                                    <button type="button" class="btn btn-default prev-step">Previous</button></li>
                                <li>
                                    <button type="button" class="btn btn-default next-step">Skip</button></li>
                                <li>
                                    <button type="button" class="btn btn-primary btn-info-full next-step">Save and continue</button></li>
                            </ul>
                        </div>
                        <div class="tab-pane" role="tabpanel" id="complete">
                            <div class="step44">
                                <h5>Completed</h5>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                </div>
            </section>
        </div>
    </div>




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

            </ContentTemplate>
    </asp:UpdatePanel>


    <script>



        function GoToNextStep() {
            var $active = $('.wizard .nav-tabs li.active');
            $active.next().removeClass('disabled');
            nextTab($active);
        }

        function GoToPrevStep() {
            var $active = $('.wizard .nav-tabs li.active');
            prevTab($active);
        }



        $(document).ready(function () {

            //document.getElementById("btnGoToNextSteps").disabled = true;

            //Initialize tooltips
            $('.nav-tabs > li a[title]').tooltip();

            //Wizard
            $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

                var $target = $(e.target);

                if ($target.parent().hasClass('disabled')) {
                    return false;
                }
            });


            $(".next-step").click(function (e) {

                var $active = $('.wizard .nav-tabs li.active');
                $active.next().removeClass('disabled');
                nextTab($active);

            });

            $(".prev-step").click(function (e) {

                var $active = $('.wizard .nav-tabs li.active');
                prevTab($active);

            });
        });

        function nextTab(elem) {
            $(elem).next().find('a[data-toggle="tab"]').click();
        }
        function prevTab(elem) {
            $(elem).prev().find('a[data-toggle="tab"]').click();
        }


        //according menu

        $(document).ready(function () {
            //Add Inactive Class To All Accordion Headers
            $('.accordion-header').toggleClass('inactive-header');

            //Set The Accordion Content Width
            var contentwidth = $('.accordion-header').width();
            $('.accordion-content').css({});

            //Open The First Accordion Section When Page Loads
            $('.accordion-header').first().toggleClass('active-header').toggleClass('inactive-header');
            $('.accordion-content').first().slideDown().toggleClass('open-content');

            // The Accordion Effect
            $('.accordion-header').click(function () {
                if ($(this).is('.inactive-header')) {
                    $('.active-header').toggleClass('active-header').toggleClass('inactive-header').next().slideToggle().toggleClass('open-content');
                    $(this).toggleClass('active-header').toggleClass('inactive-header');
                    $(this).next().slideToggle().toggleClass('open-content');
                }

                else {
                    $(this).toggleClass('active-header').toggleClass('inactive-header');
                    $(this).next().slideToggle().toggleClass('open-content');
                }
            });

            //return false;
        });


        //code for grid

        var selectedProjects = -2;



        function openAttachmentModel(btn) {


            var grd = $find("<%= grdProjecs.ClientID %>");
            var selectedkey = $(btn).data("idproje");
            selectedProjects = selectedkey;
            alert(selectedProjects);

            $('#modalAttachment').modal();

        }




    </script>


</asp:Content>
