<%@ Page Title="" Language="C#" MasterPageFile="~/Design/Masters/Main.Master" AutoEventWireup="true" CodeBehind="farmerProjects.aspx.cs" Inherits="Abyari.Monaghese.farmerProjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="modal fade" id="modalAttachment">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">

                    <h3 class="modal-title" style="text-align: center;">
                        <span class="label label-primary">مناقصه</span></h3>
                </div>
                <div class="modal-body">


                    <div class="row" style="margin: 0; padding: 0; text-align: center; border: 2px groove red;">

                        <div class="row">

                            <div class="col-sm-12 col-md-12">
                                نوع مناقصه
                            </div>

                        </div>
                        <div class="row">

                            <div class="col-sm-12 col-md-12">

                                <label class="btn btn-default dropdown-toggle">
                                    <%--<span class="caret"></span>--%>
                                    <select id="cmbMonagheseType">
                                        <option value="فقط قیمت اجرا توسط شرکت های پیمانکار ارائه گردد">فقط قیمت اجرا توسط شرکت های پیمانکار ارائه گردد</option>
                                        <option value="قیمت های اجرا و قیمت های لوله توسط شرکت های پیمانکار ارائه گردد">قیمت های اجرا و قیمت های لوله توسط شرکت های پیمانکار ارائه گردد</option>
                                        <option value="قیمت اجرا توسط شرکت های پیمانکار و قیمت های لوله توسط تولید کنندگان و نمایندگان مجاز ارائه گردد">قیمت اجرا توسط شرکت های پیمانکار و قیمت های لوله توسط تولید کنندگان و نمایندگان مجاز ارائه گردد</option>
                                    </select>
                                </label>

                            </div>

                        </div>

                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">بستن</button>
                    <button type="button" class="btn btn-success" onclick="startMonaghese();">ذخیره</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>


    <telerik:RadGrid ID="grdProjecsSelect" runat="server" Skin="Sunset" AllowFilteringByColumn="false" AllowPaging="false">
        <ClientSettings>
            <Scrolling AllowScroll="true" ScrollHeight="700" />
            <Resizing AllowResizeToFit="true" AllowColumnResize="true" />

        </ClientSettings>
        <MasterTableView DataKeyNames="Code" AutoGenerateColumns="false">
            <Columns>
                <telerik:GridTemplateColumn HeaderText="افزودن فایل">
                    <ItemTemplate>
                        <a class="link" href="#" data-idproje="<%# Eval("ID") %>" onclick="openAttachmentModel(this);">
                            <img src="../Design/Images/importExcel.jpg" width="40" />
                        </a>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>

                <telerik:GridBoundColumn DataField="Name" HeaderText="نام مجری"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CodeMeliMoshtary" HeaderText="کدملی"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Code" HeaderText="کد پروژه"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Shahrestan" HeaderText="شهرستان"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="NoeProje" HeaderText="عنوان کامل فعالیت"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Sath" HeaderText="سطح اجرا"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SahmeDolat" HeaderText="سهم دولت"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SahmeBank" HeaderText="سهم بانک"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SahmeMotaghazi" HeaderText="سهم متقاضی"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Mobile" HeaderText="تلفن"></telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>


    <script type="text/javascript">

        function startMonaghese() {

            var e = document.getElementById("cmbMonagheseType");
            var cmbMonagheseType = e.options[e.selectedIndex].value;

            var msg = "شما این پروژه را بصورت " + cmbMonagheseType + " وارد مناقصه خواهید کرد. آیا مطمئن هستید؟"

            var type = confirm("شما این پروژه با نوع را وارد مناقصه کردید" + cmbMonagheseType);
            if (type == true) {

            }
        }

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
