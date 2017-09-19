<%@ Control Language="C#" CodeBehind="DepartmentSetting_Edit.ascx.cs" Inherits="Modiriat_Gharardadha.DynamicData.FieldTemplates.DepartmentSetting_EditField" %>

<div class="row">
    <div class="col-sm-2 text-left">
        آیا در پسورد حروف کوچک وجود داشته باشد؟
    </div>
    <div class="col-sm-4 text-right">
        <asp:CheckBox ID="chkLower" runat="server" />
    </div>
    <div class="col-sm-2 text-left">
        آیا در پسورد حروف بزرگ وجود داشته باشد؟
    </div>
    <div class ="col-sm-4 text-right">
        <asp:CheckBox ID="chkUpper" runat="server" />
    </div>
</div>
<div class="row">
    <div class="col-sm-2 text-left">
        آیا در پسورد عدد وجود داشته باشد
    </div>
    <div class="col-sm-4 text-right">
        <asp:CheckBox ID="chkNumer" runat="server" />
    </div>
    <div class="col-sm-2 text-left">
        آیا پسورد شامل حروف خاص باشد؟
    </div>
    <div class="col-sm-4 text-right">
        <asp:CheckBox runat="server" ID="chkSign" />
    </div>
</div>
<div class="row">
    <div class="col-sm-2 text-left">
        حداقل کاراکتر مجاز برای پسورد:
    </div>
    <div class="col-sm-4 text-right">
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </div>
</div>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="TextBox1" Display="Dynamic" />
