<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Design/Masters/Main.Master"  CodeBehind="Default.aspx.cs" Inherits="Abyari.Default" %>

<%@ Register Src="~/Controls/UScListZirProje.ascx" TagPrefix="uc2" TagName="UScListZirProje" %>



<asp:Content ContentPlaceHolderID="MainContent" ID="Content" runat="server">
    
    <uc2:UScListZirProje runat="server" ID="UScListZirProje" />
   
</asp:Content>
