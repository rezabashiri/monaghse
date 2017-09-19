<%@ Control Language="C#" CodeBehind="Currency.ascx.cs" Inherits="Abyari.DynamicData.FieldTemplates.Currency" %>

<asp:Literal runat="server" ID="Literal1" Text="<%# tkv.Utility.CurrencyHelpers.ShowValidCurrency( FieldValueString )%>" />
