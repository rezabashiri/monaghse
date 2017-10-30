<%@ Page Title="" Language="C#" MasterPageFile="~/Design/Masters/Administrator.Master" AutoEventWireup="true" CodeBehind="SelectCompany.aspx.cs" Inherits="Abyari.Administrator.SelectCompany" %>

<%@ Register Src="~/Controls/UscSelectPaymankar.ascx" TagPrefix="uc2" TagName="UscSelectPaymankar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 
    

    <div class="panel panel-green">
        <div class="panel">
                <div class="row">
        <uc2:UscSelectPaymankar runat="server" ID="UscSelectPaymankar" />
           
                    <div class="col-md-3 col-sm-12 "  >
        <asp:Button   ID="btnSave" OnClick="btnSave_Click" Text="ثبت" runat="server" OnClientClick="return confirm('پس از ثبت امکان ویرایش وجود نخواهد داشت')" CssClass="btn btn-success" /> 

                        </div>
    </div>
        </div>
    </div>

  
</asp:Content>
