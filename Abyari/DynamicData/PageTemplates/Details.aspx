<%@ Page Language="C#" MasterPageFile="~/Design/Masters/Main.Master"  CodeBehind="Details.aspx.cs" Inherits="DynamicWebApp.Details" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:DynamicDataManager ID="DynamicDataManager1" runat="server" AutoLoadForeignKeys="true">
        <DataControls>
            <asp:DataControlReference ControlID="FormView1" />
        </DataControls>
    </asp:DynamicDataManager>

    <h2   class="text-center">جزییات برای  <%= table.DisplayName %></h2>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
                HeaderText="List of validation errors" CssClass="DDValidator" />
            <asp:DynamicValidator runat="server" ID="DetailsViewValidator" ControlToValidate="FormView1" Display="None" CssClass="DDValidator" />

            <asp:FormView runat="server" ID="FormView1" DataSourceID="DetailsDataSource" OnItemDeleted="FormView1_ItemDeleted" RenderOuterTable="false">
               <RowStyle ForeColor="Yellow" />
                
                <ItemTemplate>

                 <table class="text-right" style="direction:rtl;float:right" id="detailsTable" cellpadding="6">
                        <asp:DynamicEntity  ID="DynamicEntity1" runat="server" />
                        <tr class="td">
                            <td colspan="2">
                                <asp:DynamicHyperLink ID="DynamicHyperLink1" runat="server" Action="Edit" Text="ویرایش" />
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" Text="حذف"
                                    OnClientClick='return confirm("آیا در مورد حذف اطمینان دارید");' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <div class="DDNoItem">چنین موردی وجود ندارد</div>
                </EmptyDataTemplate>
            </asp:FormView>

            <%--<asp:EntityDataSource ID="DetailsDataSource" runat="server" EnableDelete="true" />--%>
            <uc1:MoroorgaranEntityDataSource ID="DetailsDataSource" runat="server" EnableDelete="true" />
            <asp:QueryExtender TargetControlID="DetailsDataSource" ID="DetailsQueryExtender" runat="server">
                <asp:DynamicRouteExpression />
            </asp:QueryExtender>

            <br />
                </div>
            <div class="row text-right form-group">
                <asp:DynamicHyperLink ID="ListHyperLink" runat="server" Action="List">نمایش تمام لیست</asp:DynamicHyperLink>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

