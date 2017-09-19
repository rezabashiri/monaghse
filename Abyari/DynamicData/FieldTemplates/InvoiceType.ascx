<%@ Control Language="C#" CodeBehind="InvoiceType.ascx.cs" Inherits="Abyari.DynamicData.FieldTemplates.InvoiceType" %>

<asp:Literal runat="server" ID="Literal1"  Text="<%# GetDisplayString() %>"></asp:Literal>
 

<asp:Literal runat="server" ID="Markup"  Text="<%# GetMarkup() %>"></asp:Literal>
