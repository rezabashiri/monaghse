<%@ Page Title="" Language="C#" MasterPageFile="~/Design/Masters/Main.Master" AutoEventWireup="true" CodeBehind="Configurate.aspx.cs" Inherits="Abyari.Administrator.Configurate" %>

<%@ Register Src="~/ScoringSystem/uscConfig.ascx" TagPrefix="uc2" TagName="uscConfig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <uc2:uscConfig runat="server" ID="uscConfig" />
</asp:Content>
