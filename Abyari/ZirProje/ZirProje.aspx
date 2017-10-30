<%@ Page Title="جستجوی زیر پروژه" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Design/Masters/Administrator.Master" AutoEventWireup="true" CodeBehind="ZirProje.aspx.cs" Inherits="Abyari.ZirProje.ZirProje" %>

<%@ Register Src="~/Controls/UscSearchZirProject.ascx" TagPrefix="uc1" TagName="UscSearchZirProject" %>
<%@ Register Src="~/Controls/UscAbyari.ascx" TagPrefix="uc1" TagName="UscAbyari" %>






<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:UscSearchZirProject ID="uscSearch" runat="server" />
    <uc1:UscAbyari runat="server" id="UscAbyari" />
</asp:Content>
