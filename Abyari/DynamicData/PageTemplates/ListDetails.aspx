<%@ Page Title="" Language="C#" MasterPageFile="~/Design/Masters/Administrator.Master" AutoEventWireup="true" EnableViewStateMac="true"  EnableViewState="true" ViewStateMode="Enabled" ValidateRequest="false" CodeBehind="ListDetails.aspx.cs" Inherits="Abyari.DynamicData.PageTemplates.ListDetails" %>

<%@ Register Src="~/DynamicData/Content/GridViewPager.ascx" TagName="GridViewPager" TagPrefix="asp" %>
<%--<%@ Register src="~/DynamicData/Content/FilterUserControl.ascx" tagname="DynamicFilter" tagprefix="asp" %>--%>
<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="dynamic" Assembly="Abyari" Namespace="Telerik.Web.UI.DynamicData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <asp:DynamicDataManager ID="DynamicDataManager1" runat="server" AutoLoadForeignKeys="true" />

    <h1 style="float: right"><%= GridDataSource.GetTable().DisplayName %></h1>

    <asp:ScriptManagerProxy runat="server" ID="ScriptManagerProxy1" />
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
        <ContentTemplate>--%>
    <div class="row col-sm-12" style="float: right" dir="rtl">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
            HeaderText="List of validation errors" />
        <asp:DynamicValidator runat="server" ID="GridViewValidator" ControlToValidate="GridView1" Display="None" />


        <asp:QueryableFilterRepeater runat="server" ID="FilterRepeater">
            <ItemTemplate>
                <table id="list_querable" style="margin-bottom: 10px;">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("DisplayName") %>' OnPreRender="Label_PreRender" />
                        </td>
                        <td>
                            <asp:DynamicFilter runat="server" ID="DynamicFilter" OnFilterChanged="DynamicFilter_FilterChanged" />
                            <br />

                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:QueryableFilterRepeater>

    </div>
    
    <div class="row col-sm-12" style="float: right" dir="rtl">
        <dynamic:DynamicRadGrid ID="GridView1" AllowPaging="true" AllowSorting="True" Width="100%"  
            ShowFooter="true" ShowGroupPanel="true" AllowFilteringByColumn="true"
            EnableHeaderContextFilterMenu="false" EnableHeaderContextMenu="true" 
            Skin="Telerik" AllowAutomaticInserts="true" Height="600px"  
            AutoGenerateColumns="false" runat="server" DataSourceID="GridDataSource">
            <ExportSettings ExportOnlyData="true" HideStructureColumns="true" IgnorePaging="true" OpenInNewWindow="true">
            
            </ExportSettings>
            
            <GroupPanel Text="به منظور دسته بندی ستونها را در اینجا رها نمایید"></GroupPanel>
            <GroupingSettings  ShowUnGroupButton="true"></GroupingSettings>
            <PagerStyle Mode="NextPrevAndNumeric" Position="Top" AlwaysVisible="true" PageSizeControlType="RadDropDownList" />
            <ClientSettings AllowDragToGroup="true" >
                <Scrolling FrozenColumnsCount="2" AllowScroll="true" SaveScrollPosition="true" ScrollHeight="120%" />
                <Selecting AllowRowSelect="true" />
               
            </ClientSettings>

            <MasterTableView UseAllDataFields="true" CommandItemDisplay="Top"   AutoGenerateColumns="false" NoMasterRecordsText="اطلاعاتی برای نمایش وجود ندارد">
                <%--        <CommandItemTemplate>
                    <div style="padding: 5px 5px; direction:rtl;text-align:right">
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="InitInsert" Visible='<%# !GridView1.MasterTableView.IsItemInserted %>' CssClass="fa-2x fa fa-plus" ForeColor="Red"> اضافه نمودن</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandName="RebindGrid" CssClass="fa-refresh fa fa-2x" ForeColor="Blue"> بارگذاری مجدد</asp:LinkButton>
                    </div>
                </CommandItemTemplate>--%>
                <EditFormSettings  EditColumn-InsertText="افزودن">
                    <EditColumn UpdateText="ویرایش" CancelText="انصراف"></EditColumn>
                </EditFormSettings>

                <CommandItemStyle HorizontalAlign="Center" VerticalAlign="Middle"  />
                <CommandItemSettings CancelChangesText="انصراف"  ShowExportToPdfButton="true" ExportToExcelText="خروجی" ShowExportToCsvButton="true" ShowExportToExcelButton="true" RefreshText="بارگذاری مجدد" AddNewRecordText="اضافه نمودن رکورد"  />

                <NestedViewTemplate>

                    <uc1:MoroorgaranEntityDataSource ID="GridDetailDataSource" runat="server"
                        EnableDelete="true" EnableUpdate="true" PreventSelectWhenParameterNull="true" OnSelecting="GridDetailDataSource_Selecting" />

                    <dynamic:DynamicRadGrid runat="server" ID="DetailGridView" Skin="Sunset" 
                        OnInit="DetailGridView_Init" OnItemCommand="GridDetailDataSource_ItemCommand"
                        AllowFilteringByColumn="true" SelectedItemStyle-BackColor="LightBlue" ShowGroupPanel="true"
                        DataSourceID="GridDetailDataSource" AllowAutomaticUpdates="true" AllowMultiRowSelection="false"
                        AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true">
                        <ClientSettings AllowDragToGroup="true">
                            <Scrolling AllowScroll="true" FrozenColumnsCount="2" UseStaticHeaders="false" />
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <PagerStyle Mode="Advanced" />
                        <MasterTableView UseAllDataFields="true">
                            <Columns>
                                <telerik:GridEditCommandColumn InsertText="افزودن" CancelText="انصراف" EditText="ویرایش" ButtonType="ImageButton" UpdateText="بروز رسانی" />
                                <telerik:GridButtonColumn CommandName="Delete" Text="حذف" ButtonType="ImageButton" ConfirmText="آیا از حذف اطمینان دارید؟" />
                                <telerik:GridButtonColumn CommandName="Select" Text="انتخاب" />
                            </Columns>
                        </MasterTableView>
                    </dynamic:DynamicRadGrid>

                </NestedViewTemplate>
                <Columns>

                    <telerik:GridEditCommandColumn CancelText="انصراف" EditText="ویرایش" ButtonType="ImageButton" UpdateText="بروز رسانی" />
                    <telerik:GridButtonColumn CommandName="Delete" Text="حذف" ButtonType="ImageButton" ConfirmTitle="حذف" ConfirmText="آیا از حذف اطمینان دارید؟" />


                </Columns>
            </MasterTableView>
        </dynamic:DynamicRadGrid>

        <uc1:MoroorgaranEntityDataSource PreventSelectWhenParameterNull="true" ID="GridDataSource" AutoGenerateWhereClause="false" OnSelecting="GridDataSource_Selecting" OnInserted="GridDataSource_Inserted" EnableInsert="true" runat="server" EnableDelete="true" EnableUpdate="true">
        </uc1:MoroorgaranEntityDataSource>
    </div>
    <%--          <asp:Panel ID="DetailsPanel" runat="server">
              <br /><br />

                  <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="DetailsDataSource"
                  AutoGenerateEditButton="true" AutoGenerateDeleteButton="true" AutoGenerateInsertButton="true"
                  OnModeChanging="OnDetailsViewModeChanging" OnPreRender="OnDetailsViewPreRender"
                  OnItemDeleted="OnDetailsViewItemDeleted" OnItemUpdated="OnDetailsViewItemUpdated" OnItemInserted="OnDetailsViewItemInserted">
              </asp:DetailsView>
              
              <ef:EntityDataSource ID="DetailsDataSource" runat="server" EnableDelete="true" EnableInsert="true" EnableUpdate="true">
                  <WhereParameters>
                      <asp:DynamicControlParameter ControlID="GridView1" />
                  </WhereParameters>
              </ef:EntityDataSource>

            </asp:Panel>--%>
    <asp:QueryExtender TargetControlID="GridDataSource" ID="GridQueryExtender" runat="server">
        <asp:DynamicFilterExpression ControlID="FilterRepeater" />
    </asp:QueryExtender>
    <%--      </ContentTemplate>
        
    </asp:UpdatePanel>--%>
</asp:Content>
