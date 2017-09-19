<%@ Control Language="C#" CodeBehind="Password_Edit.ascx.cs" Inherits="Modiriat_Gharardadha.DynamicData.FieldTemplates.Password_EditField" %>

<script type="text/javascript">
    var validate = false;
    $(document).ready(function () {
        //'/DynamicData/PageTemplates/ListDetails.aspx/CheckPolicy'
        var combobox = document.getElementById("<%= TextBox1.ClientID %>");
      
        combobox.onchange = function (te) {
            var textbox = document.getElementById("<%= TextBox1.ClientID %>");
            $.ajax
            (
            {
                type: "POST",
                url: '/Administrator/CreateUser.aspx/CheckPolicy',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: '{"value":"' + textbox.value + '"}',
                success: function (data) {
                   
                    Page_IsValid = data.d;
                    validate = data.d;
                },
                error: function (xhr, status, error) {

                    alert(xhr.responseText);

                }
            });
        }

    });
    function validating(sender, args) {

        args.IsValid = validate;

    }
</script>
<asp:TextBox ID="TextBox1" runat="server"  ></asp:TextBox>
 
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1"  ControlToValidate="TextBox1"   Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="TextBox1" Display="Dynamic" />
 <asp:CustomValidator ID="CusValidator" runat="server"  ValidateEmptyText="true" EnableClientScript="true"  ControlToValidate="TextBox1" Enabled="true" ClientValidationFunction="validating" ErrorMessage="رمز عبور سیاست های تعریف شده را تامین نمی کند،لطفا با مدیر سایت تماس بگیرید"  ></asp:CustomValidator>