<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Design/Masters/Main.Master"  CodeBehind="Default.aspx.cs" Inherits="Abyari.Default" %>

<%@ Register Src="~/Controls/UScListZirProje.ascx" TagPrefix="uc2" TagName="UScListZirProje" %>
<%@ Register Src="~/WorkFlowHelpers/UscSearchZirProjeByWF.ascx" TagPrefix="uc2" TagName="UscSearchZirProjeByWF" %>
<%@ Register Src="~/Controls/UscZirprojeSearchParameter.ascx" TagPrefix="uc2" TagName="UscZirprojeSearchParameter" %>





<asp:Content ContentPlaceHolderID="MainContent" ID="Content" runat="server">
    
  
    <uc2:UscZirprojeSearchParameter runat="server" id="UscZirprojeSearchParameter" />
    <uc2:UscSearchZirProjeByWF  EntityTypeID="1" runat="server" id="UscSearchZirProjeByWF" />
</asp:Content>
