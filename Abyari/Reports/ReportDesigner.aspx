<%@ Page Title="" Language="C#" MasterPageFile="~/Design/Masters/Administrator.Master" AutoEventWireup="true" CodeBehind="ReportDesigner.aspx.cs" Inherits="Abyari.Reports.ReportDesigner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
          <div class="panel panel-success">
           <div class="panel panel-heading text-right">
               ساخت و ویرایش گزارش
               </div>
               <%--<uc1:ReportShow ID="ReportShow1" ReportID="7b898480-f7e6-48de-ba47-a0a141b15b8f" runat="server" />
               <uc1:ReportShow ID="uscTayid" ReportID="c16c2b0b-546c-489c-8016-70589588952e" runat="server" />--%>
                <uc1:ReportDesign ID="rptDesigner" runat="server" /> 
           </div>
</asp:Content>
