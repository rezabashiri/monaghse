<%@ Control Language="C#" CodeBehind="ManyToMany.ascx.cs" Inherits="DynamicWebApp.ManyToManyField" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Repeater ID="Repeater1"    runat="server">
    <ItemTemplate>
      <asp:DynamicHyperLink ID="DynamicHyperLink1"  runat="server"></asp:DynamicHyperLink>
        <br />
    </ItemTemplate>
</asp:Repeater>

<telerik:RadComboBox AllowCustomText="true"  MarkFirstMatch="true"  EmptyMessage="برای مشاهده لیست کلیک نمایید" EnableTextSelection="true"  AppendDataBoundItems="false" ExpandDirection="Down"  DropDownAutoWidth="Enabled"  ID="cmbForignKeys" runat="server">
 <ClientItemTemplate>
     sdfsdfsdf
 </ClientItemTemplate>
 
 
<%--     <ItemTemplate>
    

      <asp:DynamicHyperLink ID="DynamicHyperLink1"  runat="server"></asp:DynamicHyperLink>
        <br />
    </ItemTemplate>--%>
</telerik:RadComboBox>
 