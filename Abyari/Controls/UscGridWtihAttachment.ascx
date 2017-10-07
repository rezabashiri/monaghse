<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscGridWtihAttachment.ascx.cs" Inherits="Abyari.Controls.UscGridWtihAttachment" %>

<div class="modal fade" id="modalAttachment">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">

                <h3 class="modal-title" style="text-align: center;">
                    <span class="label label-primary">قرار دادن فایل های ضمیمه</span></h3>
            </div>
            <div class="modal-body">


                <div class="row" style="margin: 0; padding: 0; text-align: center; border: 2px groove red;">
                    <div class="col-md-12 col-sm-12">
                        توسط این قسمت مطابق فایل اکسل نمونه، فایل مربوط به فهرست بهای اجرای هر طرح را وارد نمائید
                    </div>

                    <div>
                        <a href="../Download/fehrestBaha_jozee.xlsx" download>اکسل نمونه فهرست بهای اجرای هر طرح</a>
                    </div>
                </div>

                <div class="row" style="margin: 0; padding: 0;">
                    <div class="col-md-12 col-sm-12" style="margin-right: 30px;">
                        <uc1:ImportFromExcel ID="ImportFromExcel_ProjectOne" runat="server"></uc1:ImportFromExcel>
                    </div>
                </div>
                <div class="row" style="margin: 0; padding: 0; text-align: center; border: 2px groove red;">
                    <div class="col-md-12 col-sm-12">
                        توسط این قسمت مطابق فایل اکسل نمونه، فایل مربوط به لوله های هر طرح را وارد نمائید
                    </div>
                    <div>
                        <a href="../Download/loleh_jozee.xlsx" download>اکسل نمونه لوله های هر طرح</a>
                    </div>
                </div>


                <div class="row" style="margin: 0; padding: 0;">
                    <div class="col-md-12 col-sm-12" style="margin-right: 30px;">
                        <uc1:ImportFromExcel ID="ImportFromExcel_lolehProjectOne" runat="server"></uc1:ImportFromExcel>
                    </div>
                </div>

                <div class="row">
                    <label class="col-md-12 col-sm-12" style="text-align: center;">PDF مربوط به لوازم، اتصالات و متعلقات</label>
                </div>
                <div class="row">
                    <label class="col-md-12 col-sm-12" style="margin-right: 30px;">
                        <uc1:FileUpload ID="uscFileUplaod" runat="server" />
                    </label>
                </div>
            </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">بستن</button>
            <button type="button" class="btn btn-success">ذخیره</button>
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
                    <a class="link" href="#" data-idproje="<%# Eval("Code") %>" onclick="openAttachmentModel(this);">
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

    //code for grid
    var selectedProjects = -2;

    function openAttachmentModel(btn) {

        //alert('salam');

        var grd = $find("<%= grdProjecsSelect.ClientID %>");
        var selectedkey = $(btn).data("idproje");
        selectedProjects = selectedkey;
        $('#<%= selectedProjectID.ClientID %>').val(selectedProjects);

        //alert(selectedProjects);

        $('#modalAttachment').modal();
    }

</script>

<asp:HiddenField ID="selectedProjectID" runat="server" />
