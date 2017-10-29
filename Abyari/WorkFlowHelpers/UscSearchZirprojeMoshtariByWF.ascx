<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscSearchZirprojeMoshtariByWF.ascx.cs" Inherits="Abyari.WorkFlowHelpers.UscSearchZirprojeMoshtariByWF" %>
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
<script type="text/javascript">
    function pageLoad() {
        var grid = $find("<%= grdProjecsSelect.ClientID %>");
            if (grid) {
                var columns = grid.get_masterTableView().get_columns();
                for (var i = 0; i < columns.length; i++) {
                    columns[i].resizeToFit(false, true);
                }
            }
    }
    function startMonaghese() {

        var e = document.getElementById("cmbMonagheseType");
        var cmbMonagheseType = e.options[e.selectedIndex].value;

        var msg = " شما طرح خود را بصورت " + cmbMonagheseType + " وارد مناقصه خواهید کرد. آیا مطمئن هستید؟"

        var type = confirm(msg);
        if (type == true) {

        }
    }

    //code for grid
    var selectedProjects = -2;

    function openAttachmentModel(btn) {

        var grd = $find("<%= grdProjecsSelect.ClientID %>");
            var selectedkey = $(btn).data("idproje");
            selectedProjects = selectedkey;
     

            //alert(selectedProjects);
            $('#modalAttachment').modal();
        }
</script>

  <telerik:RadGrid ID="grdProjecsSelect" runat="server" OnDataBound="grdProjecsSelect_DataBound" Skin="Windows7" AllowFilteringByColumn="false" AllowPaging="false">
        <ClientSettings>
            <Scrolling AllowScroll="true" ScrollHeight="400" />
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
                          <telerik:GridTemplateColumn HeaderText="مدیریت طرح" ItemStyle-Width="100px" >
                              <ItemTemplate >
                                 <a class="link" href="#" data-idproje="<%# Eval("ID") %>" onclick="openAttachmentModel(this);">
                            <img src="../Design/Images/importExcel.jpg" width="40" />
                        </a>
                              </ItemTemplate>
                          </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="Name" HeaderText="نام طرح"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CodeMeliMoshtary" HeaderText="کدملی بهره بردار"></telerik:GridBoundColumn>
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