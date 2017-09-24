<%@ Page Language="C#" MasterPageFile="~/Design/Masters/Main.Master" CodeBehind="List.aspx.cs" Inherits="DynamicWebApp.List" %>

<%@ Register src="~/DynamicData/Content/GridViewPager.ascx" tagname="GridViewPager" tagprefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <asp:DynamicDataManager ID="DynamicDataManager1" runat="server" AutoLoadForeignKeys="true">
        <DataControls>
            <asp:DataControlReference ControlID="GridView1" />
        </DataControls>
    </asp:DynamicDataManager>

    <h2 dir="rtl" class="DDSubHeader"><%= table.DisplayName%></h2>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row" style="float:right" dir="rtl">
            <div class="DD">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
                    HeaderText="List of validation errors" CssClass="DDValidator" />
                <asp:DynamicValidator runat="server" ID="GridViewValidator" ControlToValidate="GridView1" Display="None" CssClass="DDValidator" />

                <asp:QueryableFilterRepeater runat="server" ID="FilterRepeater">
                    <ItemTemplate>
                        <table id="list_querable" style="margin-bottom:10px;">
                            <tr>
                            <td>
                        <asp:Label runat="server" Text='<%# Eval("DisplayName") %>' OnPreRender="Label_PreRender" />
                                </td>
                            <td>
                        <asp:DynamicFilter runat="server" ID="DynamicFilter"  OnFilterChanged="DynamicFilter_FilterChanged" /><br />
                                
                                </td>
                                </tr>
                            </table>
                    </ItemTemplate>
                </asp:QueryableFilterRepeater>
                <br />
            </div>
                   </div>
              <%--  --%>.
                 <div class="row">
                     <div class="col-sm-12 text-right">
                <asp:DynamicHyperLink ID="InsertHyperLink" CssClass="form-group" runat="server" Action="Insert"><img id="Img1" runat="server" src="~/DynamicData/Content/Images/plus.gif" alt="Insert new item" />ورود رکورد جدید</asp:DynamicHyperLink>
            </div>
             </div>
                    <asp:Panel ID="Panel1" CssClass="col-sm-12 table-responsive" runat="server" ScrollBars="Auto"   >
          
                   
             <asp:GridView   ID="GridView1"  CssClass="mGrid " runat="server" Width="100%"  HorizontalAlign="Right" DataSourceID="GridDataSource" EnablePersistedSelection="True"
                AllowPaging="True" AllowSorting="True"   >
               
                
                                   
                
                <Columns>
                    <asp:TemplateField >
                        <ItemTemplate>
                            <asp:DynamicHyperLink ID="DynamicHyperLink1" runat="server" Action="Edit" Text=" ویرایش"
                            />&nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" Text=" حذف"
                                OnClientClick='return confirm("آیا در مورد حزف اطمینان دارید؟");'
                            />&nbsp;<asp:DynamicHyperLink ID="DynamicHyperLink2" runat="server" Action="Details" Text=" جزییات" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                
     

                <PagerTemplate>
                    <asp:GridViewPager ID="GridViewPager1" runat="server" />
                </PagerTemplate>
                <EmptyDataRowStyle Height="50px" />
                <EmptyDataTemplate>
                    مطلبی وجود ندارد . اضافه نمایید
                </EmptyDataTemplate>
                
               
            </asp:GridView>
                     
              
                </asp:Panel>



            <%--<asp:EntityDataSource ID="GridDataSource" runat="server" EnableDelete="true" />--%>
            <uc1:MoroorgaranEntityDataSource ID="GridDataSource" runat="server" EnableDelete="true" />
            <asp:QueryExtender TargetControlID="GridDataSource" ID="GridQueryExtender" runat="server">
                <asp:DynamicFilterExpression ControlID="FilterRepeater" />
            </asp:QueryExtender>

            <br />

           
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

