<%@ Control Language="C#" CodeBehind="UserSelect_Edit.ascx.cs" Inherits="Abyari.DynamicData.FieldTemplates.UserSelect_EditField" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<telerik:RadComboBox ID="cmbUsers" runat="server" Filter="Contains" AppendDataBoundItems="true" SelectedValue="<%# FieldValueEditString %>" DataTextField="FullName" DataValueField="ID" SelectMethod="GetUser">
    <Items>
        <telerik:RadComboBoxItem Text="انتخاب کنید" Value="" />
    </Items>
</telerik:RadComboBox>
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="cmbUsers" Display="Dynamic" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="cmbUsers" Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="cmbUsers" Display="Dynamic" />
