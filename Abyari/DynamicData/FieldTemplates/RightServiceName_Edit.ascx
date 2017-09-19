<%@ Control Language="C#" CodeBehind="RightServiceName_Edit.ascx.cs" Inherits="Modiriat_Gharardadha.DynamicData.FieldTemplates.RightServiceName_EditField" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
 
<telerik:RadComboBox ID="drpServiceName" Skin="Web20"  SelectedValue="<%# this.FieldValueEditString %>"   runat="server"></telerik:RadComboBox>
<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="drpServiceName" Display="Dynamic" Enabled="false" />
 
