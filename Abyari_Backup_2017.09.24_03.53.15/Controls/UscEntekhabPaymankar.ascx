<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscEntekhabPaymankar.ascx.cs" Inherits="Abyari.Controls.UscEntekhabPaymankar" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="dynamic" Assembly="Abyari" Namespace="Telerik.Web.UI.DynamicData" %>

<script type="text/javascript">
  
    function bind() {
        var cmb = $find("<%= cmbReshtes.ClientID %>");

        var ids = "",condition="";
        for (var i = 0; i < cmb.get_items().get_count() ; i++) {
            var val = cmb.get_items()._array[i].get_element()._item.get_value();
            ids = ids +"," + val;
        }
        condition=$("#<%= txtName.ClientID %>").val();
       
        $.ajax({
            type: "post",
            url: "/ClientFunctions/ClientCalls.aspx/SearchPaymankar",
            contentType: "application/json; charset=utf-8",
            data: "{'reshteid':'" + ids + "','condition':'"+condition+"','idproje':'"+idproje+"'}",
            success: function (data) {
                var rad = $find("<%= grdPaymankar.ClientID %>").get_masterTableView();
                rad.set_dataSource(data.d);
                rad.dataBind();
    
            },
           error: function (xhr, status, error) {

                       alert(xhr.responseText);}
    
        });
    }
    function reserve(id,tavafogh) {
       
        $.ajax({
            type: "post",
            url: "/ClientFunctions/ClientCalls.aspx/ZriprojeReserve",
            contentType: "application/json; charset=utf-8",
            data: "{idzirproje:'" + idproje + "',idpaymankar:'"+id+"',tavafogh:"+tavafogh+"}",
            success: function (data) {
                alert(data.d);    
    
            },
            error: function (xhr, status, error) {

                alert(xhr.responseText);}
    
             });

    }
    function checked(sender, eventArgs) {
        var item = eventArgs.get_item();
        sender.set_text("You checked " + item.get_value());
    }
    
    
</script>
<div class="row">
    <div class ="col-md-2 col-sm-12 text-left">
        رشته
    </div>
    <div class="col-md-4 col-sm-12 text-right">
        <telerik:RadComboBox ID="cmbReshtes" OnInit="cmbReshtes_Init"   DataValueField="ID" DataTextField="Sharh"  SelectMethod="Get_Data" Skin="Windows7" CheckBoxes="true" runat="server">
           
        </telerik:RadComboBox>
    </div>
   <div class="col-md-2 col-sm-12">
       نام شرکت
   </div>
    <div class="col-md-2 col-sm-12">
        <asp:TextBox CssClass="form-control" ID="txtName" runat="server"></asp:TextBox>
    </div>
    <div class="col-md-12 text-center">
        <asp:Button ID="brnSearch" runat="server" CssClass="btn btn-primary notvalidatebtn" OnClientClick="bind(); return false;" Text="جستجو" />
    </div>
</div>
<div class="row">
    <div class="col-sm-12" style="direction:rtl">
        <telerik:RadGrid ID="grdPaymankar" RenderMode="Lightweight" AutoGenerateColumns="false" OnDataBound="grdPaymankar_DataBound" Skin="Windows7" runat="server">
        
            <MasterTableView TableLayout="Fixed" NoMasterRecordsText="اطلاعاتی یافت نشد" >
                
                <Columns>
                    <telerik:GridTemplateColumn  >
                     <ClientItemTemplate>
            <input type ="button" data-idpay="#= IDPaymankar #" class="btn btn-sm btn-warning" value="رزرو با توافق کشاورز" onclick="reserve(#= IDPaymankar #,true);" />
            <input type ="button" data-idpay="#= IDPaymankar #" class="btn btn-sm btn-info" value="رزرو بدون توافق کشاورز" onclick="reserve(#= IDPaymankar #,false);" />
                     </ClientItemTemplate>
                      
                    </telerik:GridTemplateColumn>  
                   <telerik:GridBoundColumn DataField="NamePaymankar" HeaderText="نام"></telerik:GridBoundColumn>
                   <telerik:GridBoundColumn DataField="NameReshte" HeaderText="رشته"></telerik:GridBoundColumn>
                   <telerik:GridBoundColumn DataField="Rotbe" HeaderText="رتبه"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
</div>