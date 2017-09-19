<%@ Control Language="C#" CodeBehind="ForeignKey.ascx.cs" Inherits="DynamicWebApp.ForeignKeyField" %>

<asp:HyperLink ID="HyperLink1" runat="server" Target="_parent"
    Text="<%# GetDisplayString() %>"
    NavigateUrl="<%# GetNavigateUrl() %>"  />

