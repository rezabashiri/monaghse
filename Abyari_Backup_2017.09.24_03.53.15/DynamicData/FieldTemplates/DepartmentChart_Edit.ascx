<%@ Control Language="C#" CodeBehind="DepartmentChart_Edit.ascx.cs" Inherits="Modiriat_Gharardadha.DynamicData.FieldTemplates.DepartmentChart_EditField" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <div class="panel panel-primary" style="width:900px">
            <div class="row">
        <div class="col-sm-8 text-right" >
            <div class ="row">
                <div class="col-sm-3">
                    نام واحد سازمانی
                </div>
                <div class="col-sm-3 ">
                    <telerik:RadDropDownList Skin="Web20" SelectMethod="FillOrganizationRoles"  AppendDataBoundItems="true" ID="cmbOrganizationRoles" DataTextField="OrganizationRoleName" DataValueField="ID" runat="server">
                        <Items>
                            <telerik:DropDownListItem Text="انتخاب کنید" Value="" />
                        </Items>
                    </telerik:RadDropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <asp:Button ID="btnDelete" OnClick="btnDelete_Click" CausesValidation="false" CssClass="btn-primary" runat="server" OnClientClick="confirm('آیا از حذف اطمینان دارید؟')" Text="حذف از چارت" />
                   </div>
                    <div class="col-sm-3">
                         <asp:Button ID="btnAddNode" OnClick="btnAddNode_Click"   CausesValidation="true" CssClass="btn-primary" runat="server" Text="اضافه به چارت" />
                </div>
            </div>
        </div>
        <div class ="col-sm-4 text-right" dir="rtl">
            <div class="row">
           
            
            <telerik:RadTreeView ID="trvChart" Skin="Web20"  OnNodeClick="RadTreeView1_NodeClick"     runat="server">
                <ExpandAnimation Type="InOutQuart" Duration="200" />
                
                        <DataBindings>
                    <telerik:RadTreeNodeBinding DataMember="Node" TextField="Text" ImageUrlField="ImageUrl"
                        ExpandedField="Expanded"></telerik:RadTreeNodeBinding>
                            
                </DataBindings>
                
            </telerik:RadTreeView>
             </div>  
        </div>
                </div>
    
    </div>

        </ContentTemplate></asp:UpdatePanel>