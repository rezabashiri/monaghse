﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Design/Masters/Main.Master" AutoEventWireup="true" CodeBehind="WorkFlowManagement.aspx.cs" Inherits="Abyari.Administrator.WorkFlowManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:WorkFlowDefinition ID="UscWfDefinition" runat="server" />
</asp:Content>
