﻿<%@ Control Language="C#" CodeBehind="InvoiceType_Edit.ascx.cs" Inherits="Abyari.DynamicData.FieldTemplates.InvoiceType_EditField" %>
 

<asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control text-right">
</asp:DropDownList>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="DDControl DDValidator" ControlToValidate="DropDownList1" Display="Static" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" CssClass="DDControl DDValidator" ControlToValidate="DropDownList1" Display="Static" />

