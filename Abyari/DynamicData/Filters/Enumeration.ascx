<%@ Control Language="C#" CodeBehind="Enumeration.ascx.cs" Inherits="DynamicWebApp.EnumerationFilter" %>

<asp:DropDownList runat="server" ID="DropDownList1" AutoPostBack="True" CssClass="form-control text-right"
    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
  <asp:ListItem Text="همه" Value="" />
</asp:DropDownList>

