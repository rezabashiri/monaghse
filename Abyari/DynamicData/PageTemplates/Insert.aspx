<%@ Page Language="C#" MasterPageFile="~/Design/Masters/Main.Master" CodeBehind="Insert.aspx.cs" Inherits="DynamicWebApp.Insert" %>


<asp:Content  ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div dir="rtl">
    <asp:DynamicDataManager ID="DynamicDataManager1" runat="server" AutoLoadForeignKeys="true">
        <DataControls>
            <asp:DataControlReference ControlID="FormView1" />
        </DataControls>
    </asp:DynamicDataManager>

    <h2 class="DDSubHeader">اضافه نمودن به <%= table.DisplayName %></h2>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
                HeaderText="لطفا به اخطار ها توجه فرمایید" CssClass="text-right" Font-Bold="true" />
            <asp:DynamicValidator runat="server" ID="DetailsViewValidator" ControlToValidate="FormView1" Display="None" CssClass="DDValidator" />

            <asp:FormView runat="server" ID="FormView1" DataSourceID="DetailsDataSource" DefaultMode="Insert"
                OnItemCommand="FormView1_ItemCommand" OnItemInserted="FormView1_ItemInserted" RenderOuterTable="false" OnDataBound="FormView1_DataBound">
                <InsertItemTemplate>
                    <table id="detailsTable" >
                        <asp:DynamicEntity runat="server" ID="DynamicEntity" Mode="Insert" />
                        
                        <tr class="td">
                            <td colspan="2">
                                <asp:LinkButton runat="server" CommandName="Insert" Text="ورود" />
                                <asp:LinkButton runat="server" CommandName="Cancel" Text="انصراف" CausesValidation="false" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
            </asp:FormView>

            <%--<asp:EntityDataSource ID="DetailsDataSource" runat="server" EnableInsert="true" />--%>
            <uc1:MoroorgaranEntityDataSource PreventSelectWhenParameterNull="true"   ID="DetailsDataSource" runat="server" EnableInsert="true" />
        </ContentTemplate>
    </asp:UpdatePanel>
        </div>
</asp:Content>

