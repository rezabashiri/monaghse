<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscCheckNamayande.ascx.cs" Inherits="Abyari.Controls.UscCheckNamayande" %>
<script type="text/javascript">
    function Check() {


        //var code = document.getElementById("MainContent_FormView1_UscCheckNamayande_txtCodeMelli").value;
        var co = document.getElementById('<%=txtCodeMelli.ClientID %>').value;
        $("#loading").append('<img src="/Design/Images/loading.gif"></img>');
        CheckCodeMelli(co);


    }
    function SetVisibility(result) {

        $("#hdcode").val("1");
        if (result == "false") {

            var window = $find('<%=RadWindow1.ClientID %>');
            $("#loading").empty();
            window.show();
        }
        else {
            $("#loading").empty();
            $("#loading").append(result);
            //$("#loading").append('<img src="/Design/Images/check.png"></img>');

        }
    }
    function CheckCodeMelli(codemelli) {
        $.ajax({
            type: "POST",
            url: "/ClientFunctions/ClientCalls.aspx/CheckNamayande",
            data: '{"CodeMeli":"' + codemelli + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: function (msg) {
                SetVisibility(msg.d);

            },
            error: function (xhr, status, error) {

                alert(xhr.responseText);

            }
        });
    }
</script>
<input type="hidden" id="hdcode" value="0" />
  <div dir="rtl">
<div class ="col-sm-6">
    <asp:TextBox ID="txtCodeMelli" runat="server" CssClass="form-control   LegalNationalCode"></asp:TextBox> 
</div>
      <div class="col-sm-2">
    <input Class="btn btn-primary" type="button" onclick="Check()" value="جستجو" />
</div>
      <div class ="col-sm-4">
          <div id="loading"></div>
      </div>

<telerik:RadWindow  Modal="true"  Width="800px" Height="600px"  ID="RadWindow1" runat="server">
    <ContentTemplate>
     <uc1:MoroorgaranEntityDataSource PreventSelectWhenParameterNull="true"  ID="EntityDataSource1"    runat="server" EntitySetName="Moshtaries" ConnectionString="name=AbyariEntities" DefaultContainerName="AbyariEntities" EnableFlattening="False"    EnableInsert="True"   >

    </uc1:MoroorgaranEntityDataSource>
   
           <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
                HeaderText="لطفا به اخطار ها توجه فرمایید" CssClass="text-right" Font-Bold="true" />
    <asp:FormView ID="frmMoshtary"  OnItemInserting="frmMoshtary_ItemInserting" DefaultMode="Insert" RenderOuterTable="false" DataSourceID="EntityDataSource1" runat="server">
        <InsertItemTemplate>
         <div class="row">
             <div class ="col-sm-2">
                 نام 
             </div>
             <div class="col-sm-4">
                 <asp:TextBox Text='<%# Bind("Name") %>' ID="txtn" runat="server"></asp:TextBox>
             </div>
                  <div class ="col-sm-2">
                 نام خانوادگی
             </div>
             <div class="col-sm-4">
                 <asp:TextBox Text='<%# Bind("Famil") %>' ID="TextBox1" runat="server"></asp:TextBox>
             </div>
         </div>
                  <div class="row">
             <div class ="col-sm-2">
                 تلفن 
             </div>
             <div class="col-sm-4">
                 <asp:TextBox Text='<%# Bind("telephon") %>' ID="TextBox2" runat="server"></asp:TextBox>
             </div>
                  <div class ="col-sm-2">
               موبایل
             </div>
             <div class="col-sm-4">
                 <asp:TextBox Text='<%# Bind("Mobile") %>' ID="TextBox3" runat="server"></asp:TextBox>
             </div>
         </div>
                     <div class="row">
             <div class ="col-sm-2">
                 آدرس 
             </div>
             <div class="col-sm-4">
                 <asp:TextBox Text='<%# Bind("Address") %>' ID="TextBox4" runat="server"></asp:TextBox>
                 </div>
                 <div class="col-sm-6">
                                <asp:Button CssClass="btn btn-primary notvalidatebtn" ID="LinkButton1" runat="server" CommandName="Insert" Text="ورود" />

                 </div>
            
         </div>
                     

              
        </InsertItemTemplate>
    </asp:FormView>
        </ContentTemplate>
</telerik:RadWindow>
 </div>