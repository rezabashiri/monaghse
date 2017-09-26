<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscConfig.ascx.cs" Inherits="Abyari.ScoringSystem.uscConfig" %>
<asp:UpdatePanel ID="pnlUpdate" runat="server" UpdateMode="Conditional">
    <ContentTemplate>

<div class="panel panel-primary">
    <div class="panel-heading">
        تنضیمات سیستم امتیاز دهی
    </div>
    <div class="panel-body">
                <div class="row">
            <div class="col-md-4 col-sm-12">
                موضوع
            </div>
            <div class="col-md-3 col-sm-12">
              نوع امتیاز
            </div>
           
            <div class="col-md-3 col-sm-12">
                
                امتیاز
            </div>
   
        </div>
        <div class="row">
            <div class="col-md-4 col-sm-12">
                <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-3 col-sm-12">
                <asp:DropDownList ID="drpType" runat="server" CssClass="validate[required] from-control">
                    <asp:ListItem Text="انتخاب کنید" Selected="True" Value="">
                    </asp:ListItem>
                </asp:DropDownList>
            </div>
           
            <div class="col-md-3 col-sm-12">
                
                <asp:TextBox ID="txtScore" runat="server" CssClass="validate[required] form-control"></asp:TextBox>
            </div>
            <div class="col-md-2 col-sm-12">
                <uc1:MoroorgaranButton ID="btkAdd" CssClass="btn btn-primary" ValidateionType="validate" Text="اضافه" OnClick="btkAdd_Click" runat="server" />
            </div>
        </div>
        <telerik:RadGrid ID="grdConfig" SelectMethod="GetData" runat="server">
            <MasterTableView AutoGenerateColumns="false">
                <Columns>
                    <telerik:GridBoundColumn DataField="Subject" HeaderText="موضوع"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ScoreTypeName" HeaderText="نوع امتیاز"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Score" HeaderText="امتیاز"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
</div>

    </ContentTemplate>
    <Triggers>
       <asp:AsyncPostBackTrigger ControlID="btkAdd" />
    </Triggers>
</asp:UpdatePanel>
        <div class="row">
    <div class="col-md-3 col-sm-5">
        مدت زمان انجام مناقصه
    </div>
    <div class="col-md-3 col-sm-6">
        <asp:TextBox ID="txtTime" CssClass="validate[required] form-control" runat="server">
        </asp:TextBox>
        
    </div>
            <div class="col-md-1 col-sm-1">
روز
                </div>
             <div class="col-md-2 col-sm-6">
       کد مرحله بعد از پایان مناقصه
    </div>
    <div class="col-md-3 col-sm-6">
        <asp:TextBox ID="txtWfName" CssClass="validate[required] form-control" runat="server">
        </asp:TextBox>
        
    </div>
            <div class="col-md-12 col-sm-12 text-center">
                <uc1:MoroorgaranButton ID="btnSave" CssClass="btn btn-lg btn-danger" ValidateionType="validate" Text="ثبت" OnClick="btnSave_Click" runat="server" />

                </div>
</div>
