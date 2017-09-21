<%@ Page Title="" Language="C#" MasterPageFile="~/Design/Masters/Main.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Abyari.test" %>

<%@ Register Src="~/Controls/UscShowPaymankars.ascx" TagPrefix="uc2" TagName="UscShowPaymankars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <uc2:UscShowPaymankars runat="server" ID="UscShowPaymankars" />

</asp:Content>
