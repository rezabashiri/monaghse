<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscMahaleEjra.ascx.cs" Inherits="Abyari.Controls.uscMahaleEjra" %>

 
       <div class="col-md-3 col-sm-12 text-left ">
           شهرستان
           </div>
    <div class="col-md-3 col-sm-12  text-right"  >
<telerik:RadComboBox ID="cmbShahrestan" Filter="Contains" AppendDataBoundItems="true" DataValueField="ID" DataTextField="Sharh" SelectMethod="GetData" runat="server">
    <Items>
        <telerik:RadComboBoxItem Text="انتخاب کنید" Value="" />
    </Items>
</telerik:RadComboBox>
            </div>
   
