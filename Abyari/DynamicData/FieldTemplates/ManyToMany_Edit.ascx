<%@ Control Language="C#" CodeBehind="ManyToMany_Edit.ascx.cs" Inherits="DynamicWebApp.ManyToMany_EditField" %>
 
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

 
<script type="text/javascript">



    $(document).ready(function () {


        $(<%= cmbForignKeys.Header.FindControl("btncheckall").ClientID%>).click(function (e) { checkall<%= this.ClientID %>(this); e.preventDefault(); });
        $(<%= cmbForignKeys.Header.FindControl("btnUnCheckAll").ClientID%>).click(function (e) { uncheckall<%= this.ClientID %>(this); e.preventDefault(); });



    });


    function checkall<%= this.ClientID %>(evt) {
        var combobox = $find("<%= cmbForignKeys.ClientID %>");

         for (var i = 0; i < combobox.get_items().get_count() ; i++) {
             $telerik.findElement(combobox.get_items()._array[i].get_element(), "chk").checked = true;
         }
         return false;
     }
     function uncheckall<%= this.ClientID %>(evt) {
        var combobox = $find("<%= cmbForignKeys.ClientID %>");

                 for (var i = 0; i < combobox.get_items().get_count() ; i++) {
                     $telerik.findElement(combobox.get_items()._array[i].get_element(), "chk").checked = false;
                 }
             }
             function selectionFormValidationGroup(sender, args) {

                 args.IsValid = false;

                 var comboBoxes = $find("<%= cmbForignKeys.ClientID %>");

             for (var i = 0; i < comboBoxes.get_items().get_count() ; i++) {
                 if ($telerik.findElement(comboBoxes.get_items()._array[i].get_element(), "chk").checked == true) {
                     args.IsValid = true;

                     break;
                 }
             }

         }
 </script>
<div class ="col-sm-12" >
<telerik:RadComboBox EnableCheckAllItemsCheckBox="true" CausesValidation="true"   Filter="Contains"    EmptyMessage="برای مشاهده لیست کلیک نمایید"   AppendDataBoundItems="true"  DropDownAutoWidth="Enabled"     ID="cmbForignKeys" OnDataBound="cmbForignKeys_DataBound" runat="server">
    <ExpandAnimation Type="InOutBounce" />
    <HeaderTemplate>
 
          <asp:Button runat="server" ID="btnCheckall" CssClass="btn btn-xs btn-success" Text="انتخاب همه"  />
        <asp:Button runat="server" ID="btnUnCheckAll" CssClass="btn btn-xs btn-danger" Text="لغو انتخاب همه" />

  
    </HeaderTemplate>
    
 <ItemTemplate>
     <div id="checkboxes" class="col-sm-3">
          <asp:CheckBox runat="server"   ID="chk"    />
     </div>
   
 </ItemTemplate>
</telerik:RadComboBox>
    
     <asp:CustomValidator ID="CustomValidator1"  Display="Static" ValidateEmptyText="true" ControlToValidate="cmbForignKeys"  ErrorMessage="لطفا فیلدهای ستاره دار را تکمیل نمایید"  ClientValidationFunction="selectionFormValidationGroup"   runat="server" />
    <asp:DynamicValidator runat="server" ID="DynamicValidator2" CssClass="DDControl DDValidator" ControlToValidate="cmbForignKeys" Display="Static" />
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" CssClass="DDControl DDValidator" ControlToValidate="cmbForignKeys" Display="Static" Enabled="false" />
<%--    <cc1:DropDownCheckBoxes ID="DropDownCheckBoxes1"    CssClass="form-control"  ValidateRequestMode="Enabled" CausesValidation="true"  UseButtons="false" AutoPostBack="false" OnDataBound="cmbForignKeys_DataBound" Width="50px"  runat="server">
             <Style   DropDownBoxBoxWidth="290px"    ></Style>
        <Texts OkButton="انتخاب" CancelButton="انصراف" SelectBoxCaption="انتخاب" SelectAllNode="انتخاب همه" />
        
    </cc1:DropDownCheckBoxes>--%>
    </div>