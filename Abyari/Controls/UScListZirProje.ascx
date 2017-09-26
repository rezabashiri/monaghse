<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UScListZirProje.ascx.cs" Inherits="Abyari.Controls.UScListZirProje" %>
<%@ Register Src="~/Controls/UscZirprojeSearchParameter.ascx" TagPrefix="uc2" TagName="UscZirprojeSearchParameter" %>

<script src="../Logic/ReserveByPaymankar.js"></script>
<script type="text/javascript">
    function pageLoad() {
        var grid = $find("<%= grdZirProjeData.ClientID %>");
        if (grid) {
            var columns = grid.get_masterTableView().get_columns();
            for (var i = 0; i < columns.length; i++) {
                columns[i].resizeToFit(false, true);
            }
        }
    }
</script>
<uc2:UscZirprojeSearchParameter runat="server" ID="UscZirprojeSearchParameter" />
<div class="row">


            <telerik:RadGrid  ID="grdZirProjeData" runat="server" Skin="Sunset" AllowFilteringByColumn="false">
                   <ClientSettings>
            <Scrolling AllowScroll="true" ScrollHeight="700" />
            <Resizing AllowResizeToFit="true" AllowColumnResize="true"  />
   
        </ClientSettings>
                <MasterTableView AutoGenerateColumns="false">
                    <Columns>
                          <telerik:GridTemplateColumn HeaderText="رزرو با توافق کشاورز" ItemStyle-Width="100px" >
                              <ItemTemplate >
                                  <input type="button" class="btn btn-small btn-success check "   value="باتوافق" onclick="reservewith(this,true);" data-reserved="<%# Eval("Reserved") %>" data-idproje="<%# Eval("ID") %>"  />
                              </ItemTemplate>
                          </telerik:GridTemplateColumn>
                          <telerik:GridTemplateColumn HeaderText="رزرو بدون توافق کشاورز" >
                              <ItemTemplate>
                                  <input type="button" class="btn btn-primary check"  value="بدون توافق" onclick="reservewith(this, false);" data-reserved="<%# Eval("Reserved") %>" data-idproje="<%# Eval("ID") %>"  />
                              </ItemTemplate>
                          </telerik:GridTemplateColumn>
                                   <telerik:GridTemplateColumn HeaderText="لغو رزرو" >
                              <ItemTemplate>
                                  <input type="button" class="btn btn-danger unreserve"  value="لغو" onclick="unreserve(this);" data-reserved="<%# Eval("Reserved") %>" data-idproje="<%# Eval("ID") %>"  />
                              </ItemTemplate>
                          </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="Code" HeaderText="کد طرح" ItemStyle-BackColor="YellowGreen"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Name" HeaderText="نام طرح" ItemStyle-BackColor="Salmon"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Sath" HeaderText="سطح" ItemStyle-BackColor="GreenYellow"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MeghdareEstesnaSath" HeaderText="مقداراستثنای سطح" ItemStyle-BackColor="Yellow"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NoeProje" HeaderText="نوع پروژه"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TedadDastgahAbyari" HeaderText="نعداد دستگاه آبیاری"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NoePomp" HeaderText="نوع پمپ"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Debi" HeaderText="دبی"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ManbaeTaminAb" HeaderText="منابع تامین آب"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CodeMeliMoshtary" HeaderText="کدملی مشتری"></telerik:GridBoundColumn>

                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
    </div>
 