<%@ Page Title="" Language="C#" MasterPageFile="~/Design/Masters/Administrator.Master" AutoEventWireup="true" CodeBehind="SearchWf.aspx.cs" Inherits="Abyari.Monaghese.SearchWf" %>

<%@ Register Src="~/WorkFlowHelpers/UscSearchZirprojeMoshtariByWF.ascx" TagPrefix="uc2" TagName="UscSearchZirprojeMoshtariByWF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <uc2:UscSearchZirprojeMoshtariByWF runat="server" EntityTypeID="2" id="UscSearchZirprojeMoshtariByWF" />
</asp:Content>
