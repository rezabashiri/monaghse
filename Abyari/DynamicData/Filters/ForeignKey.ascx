<%@ Control Language="C#" CodeBehind="ForeignKey.ascx.cs" Inherits="DynamicWebApp.ForeignKeyFilter" %>

<asp:DropDownList runat="server" ID="DropDownList1" AutoPostBack="True" CssClass="form-control text-right"
    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    <asp:ListItem Text="همه" Value="" />
</asp:DropDownList>

