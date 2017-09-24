<%@ Control Language="C#" CodeBehind="UserSelect.ascx.cs" Inherits="Abyari.DynamicData.FieldTemplates.UserSelect" %>

<asp:HyperLink ID="HyperLink1" runat="server" Target="_parent"
    Text="<%# GetDisplayString() %>"
    NavigateUrl="<%# GetNavigateUrl() %>"  />
