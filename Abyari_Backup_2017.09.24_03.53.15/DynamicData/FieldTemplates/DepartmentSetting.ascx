<%@ Control Language="C#" CodeBehind="DepartmentSetting.ascx.cs" Inherits="Modiriat_Gharardadha.DynamicData.FieldTemplates.DepartmentSetting" %>

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
        <asp:Label ID="lblMin" runat="server"></asp:Label>
    </div>
</div>
