<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscShowPaymankars.ascx.cs" Inherits="Abyari.Controls.UscShowPaymankars" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
 

<script type="text/javascript">
    $("#showpayment").on('shown.bs.modal', function () {
        var grid = $find("<%= grdPayment.ClientID %>");
        if (grid) {
            $.ajax({
                type: "post",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({'invoiceid':invid}) ,
                url: "/ClientFunctions/ClientCalls.aspx/GetPaymentsBasedOnInvoice",
                success: function (data) {
                    grid.get_masterTableView().set_dataSource(data.d);
                    grid.get_masterTableView().dataBind();
                },
                error:   function (xhr, status, error) {

                    alert(xhr.responseText);}
            });

        }
    });
       
</script>

<telerik:RadGrid ID="grdPayment" Skin="Windows7" runat="server"   AutoGenerateColumns="false">
    <MasterTableView>
       
        <Columns>
            <telerik:GridBoundColumn DataField="Sharh"   HeaderText="نوع پرداخت" ></telerik:GridBoundColumn >           
            <telerik:GridBoundColumn DataField="Price"   DataType="System.Decimal" DataFormatString="{0:N,0}"  HeaderText="مبلغ پرداخت شده" ></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="PaymentTime_P" DataType="System.String" DataFormatString="{0:yyyy/MM/dd}" HeaderText="زمان پرداخت"></telerik:GridBoundColumn>
             
        
        </Columns>
    </MasterTableView>
</telerik:RadGrid>

