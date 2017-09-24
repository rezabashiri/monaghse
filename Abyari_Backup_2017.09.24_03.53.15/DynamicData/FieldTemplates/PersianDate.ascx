<%@ Control Language="C#" CodeBehind="PersianDate.ascx.cs" Inherits="Abyari.DynamicData.FieldTemplates.PersianDate" %>

<%@ Register assembly="Heidarpour.WebControlUI" namespace="Heidarpour.WebControlUI" tagprefix="rhp" %>



<asp:Label ID="Label1" CssClass=" text-right"  runat="server" Text="<%# GetDate(FieldValueString) %>"></asp:Label>