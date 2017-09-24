<%@ Control Language="C#" CodeBehind="Currency_Edit.ascx.cs" Inherits="Abyari.DynamicData.FieldTemplates.Currency_EditField" %>

<asp:TextBox ID="TextBox1" runat="server" CssClass="currency" Text='<%# tkv.Utility.CurrencyHelpers.ShowValidCurrency( FieldValueEditString ) %>'></asp:TextBox>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<%--<asp:DynamicValidator runat="server" ID="DynamicValidator1" ControlToValidate="TextBox1" Display="Dynamic" />--%>
