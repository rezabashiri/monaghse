<%@ Control Language="C#" AutoEventWireup="true"  CodeBehind="UscAbyari.ascx.cs" Inherits="Abyari.Controls.UscAbyari" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
 <%@ Register TagPrefix="dynamic" Assembly="Abyari" Namespace="Telerik.Web.UI.DynamicData" %>
 
<%@ Register Assembly="App_Web_uscmahaleejra.ascx.cc671b29" Namespace="MPOInterface.Controls" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/UscEntekhabPaymankar.ascx" TagPrefix="uc2" TagName="UscEntekhabPaymankar" %>
<%@ Register Src="~/Controls/UscCheckNamayande.ascx" TagPrefix="uc2" TagName="UscCheckNamayande" %>
<%@ Register Src="~/Controls/uscMahaleEjra.ascx" TagPrefix="uc2" TagName="uscMahaleEjra" %>
<%@ Register Assembly="App_Web_uscimportfromexcel.ascx.cc671b29" Namespace="WebUtility.Controls" TagPrefix="uc1" %>




<uc1:MoroorgaranEntityDataSource ID="AbyariEntityDataSource" PreventSelectWhenParameterNull="true" Where="it.ID=@ID" Include="Sherkat,Paymankar,NoeProje" ConnectionString="name=AbyariEntities" OnInit="AbyariEntityDataSource_Init" DefaultContainerName="AbyariEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" runat="server">
    <WhereParameters>
        <uc1:CustomQueryStringParameter Name="ID"  Type="Int32" QueryStringField="ZirProjeId" />
     </WhereParameters>
</uc1:MoroorgaranEntityDataSource>


<div class ="row">
 
    <div class ="col-sm-12" style="float: right" dir="rtl">
        <em:JQLoader LoadJQScript="false" LoadUIScript="false" ID="loader"  runat="server" ></em:JQLoader>
        <asp:FormView ID="frmAbyari"  RenderOuterTable="false"  OnItemCreated="frmAbyari_ItemCreated" DefaultMode="ReadOnly" DataKeyNames="ID" OnItemInserting="frmAbyari_ItemInserting" OnItemUpdating="frmAbyari_ItemUpdating" OnItemUpdated="frmAbyari_ItemUpdated" OnItemInserted="frmAbyari_ItemInserted" OnModeChanging="frmAbyari_ModeChanging"  DataSourceID="AbyariEntityDataSource" runat="server"  >
            
            <EmptyDataTemplate>
                <div class="col-sm-12 text-center">
                <asp:Button ID="btnNew" CommandName="New" CssClass="btn btn-primary"  Text="جدید" runat="server" />
                    </div>
            </EmptyDataTemplate>
            <ItemTemplate>
                     <div class="row">   
                    <div class="col-sm-2 text-left">
                        نام طرح
                    </div>
                    <div class="col-sm-4 text-right">
                         <%# Eval("Name") %> 
                    </div>
                    <div class="col-sm-2 text-left">
                       سطح
                    </div> 
                                    <div class="col-sm-4 text-right">
                 <%# Eval("Sath") %> 

                                        </div>
                </div>
                          <div class="row">
                           <div class ="col-sm-12 col-md-2 text-left ">
                        کد پروژه
                    </div>
                    <div class="col-md-4 col-sm-10">
                         <%# Eval("Code") %> 

                    </div>
                        <div class ="col-sm-2 text-left">
                       نوع پمپ
                    </div>
                    <div class="col-sm-4">
                        <%# Eval("NoePomp") %> 

                    </div>
                </div>
                           <div class="row">
                    <div class="col-sm-2 text-left">
                        دبی
                    </div>
                    <div class="col-sm-4">
                         <%# Eval("Debi") %> 
                    </div>
                        <div class ="col-sm-2 text-left">
                        منابع تامین آب
                    </div>
                    <div class="col-sm-4">
                        <%# Eval("ManbaeTaminAb") %> 

                    </div>
               
                </div>
                <div class="row">
                                  <div class="col-sm-2 text-left">
                        نوع طرح
                    </div>
                    <div class="col-sm-4 text-right">
                        <%# Eval("TypeString") %> 
                    </div>
                    <div class="col-sm-2 text-left">
                       طراح
                    </div>
                  <div class="col-sm-4 text-right">
                    <%# Eval("TarahName") %>  
                  </div>
                    </div>
                            <div class="row">
                    <div class="col-md-2 col-sm-12 text-left">
                        مشتری
                    </div>
                    <div class="col-md-4 col-sm-12 text-right">
                        <%# Eval("CodeMeliMoshtary") %> 
                    </div>
              
                </div>
                      <div class="row">
                    <div class="col-md-2 col-sm-12 text-left">
                        تاریخ عقد قرارداد
                    </div>
                    <div class="col-md-4 col-sm-12 text-right">
                        <%# Eval( "ContractDate_Persian") %>                        
                    </div>
                        <div class ="col-sm-12 col-md-2 text-left ">
                          تاریخ ورود به انجمن
                        </div>
                    <div class="col-md-4 col-sm-10">
                       <%# Eval( "EntryDate_Persian") %> 

                    </div>
                </div>
               
                          <div class="row">
                    <div class="col-md-2 col-sm-12 text-left">
                        سهم دولت
                    </div>
                    <div class="col-md-4 col-sm-12 text-right">
                        <%# tkv.Utility.CurrencyHelpers.ShowValidCurrency( Eval("SahmeDolat")  ) %>                        
                    </div>
                        <div class ="col-sm-12 col-md-2 text-left ">
                            سهم بانک
                        </div>
                    <div class="col-md-4 col-sm-10">
                        <%#  tkv.Utility.CurrencyHelpers.ShowValidCurrency( Eval("SahmeBank") ) %> 

                    </div>
                </div>
                    <div class="row">
                    <div class="col-md-2 col-sm-12 text-left">
                        سهم متقاضی
                    </div>
                    <div class="col-md-4 col-sm-12 text-right">
                     <%#  tkv.Utility.CurrencyHelpers.ShowValidCurrency( Eval("SahmeMotaghazi"))  %>                     
                    </div>
                   
                </div>
                        <div class="row">
                         <div class="col-sm-12 text-left">
                   <asp:Button CausesValidation="False" ID="BtnDelete" runat="server" OnClientClick='return confirm ("آیا از حذف اطمینان دارید؟");' CssClass="btn btn-danger" Text="حذف " CommandName="Delete" />
                    <asp:Button CausesValidation="False" ID="btnEdit" CssClass="btn  btn-warning" runat="server" Text="ویرایش " CommandName="Edit" />
                    <asp:Button CausesValidation="False" ID="BtnNew" runat="server" CssClass="btn btn-success" Text="جدید " CommandName="New" />
                              
                    </div>
            </ItemTemplate>
            <InsertItemTemplate >
                <div class="row">
                        <uc2:uscMahaleEjra runat="server" IDShahrestan='<%# Bind("IDRoosta") %>' ID="uscMahaleEjra1" />
                </div>
                <div class="row">
                    <div class="col-sm-12 col-md-2 text-left">
                        نام طرح
                    </div>
                    <div class="col-md-4 col-sm-10">
                        <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>' CssClass ="form-control validate[required] "></asp:TextBox>
                    </div>
                        <div class ="col-sm-12 col-md-2 text-left">
                        سطح
                    </div>
                    <div class="col-md-4 col-sm-10">
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Sath") %>' CssClass ="form-control validate[required] float"></asp:TextBox>

                    </div>
               
                </div>
                <div class="row">
                       <div class ="col-sm-12 col-md-2 text-left ">
                        کد پروژه
                    </div>
                    <div class="col-md-4 col-sm-10">
                        <asp:TextBox ID="txtCode" runat="server" Text='<%# Bind("Code") %>' CssClass ="form-control validate[required] "></asp:TextBox>

                    </div>
                        <div class ="col-sm-12 col-md-2 text-left">
                       نوع پمپ
                    </div>
                    <div class="col-md-4 col-sm-10">
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("NoePomp") %>' CssClass ="form-control  "></asp:TextBox>

                    </div>
                </div>
                           <div class="row">
                    <div class="col-sm-12 col-md-2 text-left">
                        دبی
                    </div>
                    <div class="col-md-4 col-sm-10">
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Debi") %>' CssClass ="form-control   float"></asp:TextBox>
                    </div>
                        <div class ="col-sm-12 col-md-2 text-left ">
                        منابع تامین آب
                    </div>
                    <div class="col-md-4 col-sm-10">
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ManbaeTaminAb") %>' CssClass ="form-control  "></asp:TextBox>

                    </div>
               
                </div>
                <div class="row">
                    <div class="col-md-2 col-sm-12 text-left">
                        مشتری
                    </div>
                    <div class="col-md-4 col-sm-12 text-right">
                        <uc2:UscCheckNamayande runat="server"  CodeMelli='<%# Bind("CodeMeliMoshtary") %>' id="UscCheckNamayande" />
                    </div>
                      
                </div>
                    <div class="row">
                    <div class="col-md-2 col-sm-12 text-left">
                        تاریخ عقد قرارداد
                    </div>
                    <div class="col-md-4 col-sm-12 text-right">
                       <em:JQDatePicker ID="dteContract" DateFormat="YMD" CssClass="date" ChangeMonth="true" ChangeYear="true" Regional="fa" Date='<%# Bind( "ContractDate") %>' runat="server" CalendarType="Jalali"></em:JQDatePicker>
                    </div>
                        <div class ="col-sm-12 col-md-2 text-left ">
                          تاریخ ورود به انجمن
                        </div>
                    <div class="col-md-4 col-sm-10">
                  
                        <em:JQDatePicker ID="dteEntry" DateFormat="YMD" Regional="fa" CssClass="date" ChangeMonth="true" ChangeYear="true" Date='<%# Bind( "EntryDate") %>' runat="server" CalendarType="Jalali"></em:JQDatePicker>
                    </div>
                </div>
                          <div class="row">
                    <div class="col-md-2 col-sm-12 text-left">
                        سهم دولت
                    </div>
                    <div class="col-md-4 col-sm-12 text-right">
                        <asp:TextBox ID="txtDolat" runat="server"  Text='<%#  Bind("SahmeDolat")   %>' CssClass ="form-control validate[required] currency "></asp:TextBox>                        
                    </div>
                        <div class ="col-sm-12 col-md-2 text-left ">
                            سهم بانک
                        </div>
                    <div class="col-md-4 col-sm-10">
                        <asp:TextBox ID="txtBank" runat="server"  Text='<%#   Bind("SahmeBank")  %>' CssClass ="form-control validate[required] currency  "></asp:TextBox>

                    </div>
                </div>
                    <div class="row">
                    <div class="col-md-2 col-sm-12 text-left">
                        سهم متقاضی
                    </div>
                    <div class="col-md-4 col-sm-12 text-right">
                        <asp:TextBox ID="txtMotaghazi" runat="server"  Text='<%#  Bind("SahmeMotaghazi")  %>' CssClass ="form-control validate[required] currency  "></asp:TextBox>                        
                    </div>
                   
                </div>
                <div class="row">
                    <div class="col-sm-2 text-left">
                                 نوع سیستم
                    </div>
                    <div class="col-sm-4 text-right">
                               <telerik:RadComboBox skin="Windows7"  ID="cmbNoe" SelectMethod="GetNoe" DataTextField="Sharh" DataValueField="ID"  SelectedValue='<%# Bind("IDNoe") %>' AppendDataBoundItems="true" runat="server">
                            <Items>
                                <telerik:RadComboBoxItem Text="انتخاب کنید" Value="" />
                            </Items>
                        </telerik:RadComboBox>
                    </div>
                    <div class="col-md-2 col-sm-12 text-left">
                        طراح
                    </div>
                    <div class="col-md-4 col-sm-12 text-right">
                          <telerik:RadComboBox skin="Windows7"  ID="cmbTarah" DropDownAutoWidth="Enabled" DataValueField="ID" DataTextField="Name" SelectMethod="Get_Tarah" SelectedValue='<%# Bind("IDSherkatTarah") %>' AppendDataBoundItems="true" runat="server">
                            <Items>
                                <telerik:RadComboBoxItem Text="انتخاب کنید" Value="" />
                            </Items>
                        </telerik:RadComboBox>
                    </div>
                </div>
                <div class="row">
                     <div class="col-sm-12">
                    <uc1:RoleSelect RoleId='<%# Bind("RoleId") %>' UserId='<%# Bind("UserId") %>' ID="uscRoleSelect" runat="server"></uc1:RoleSelect>
                    </div>
                    </div>
                         <div class="row">
                    <div class="col-sm-6 text-left">
             
                                <uc1:MoroorgaranButton  CausesValidation="False" ValidateionType="cancel" ID="btnCancel" CssClass="notvalidatebtn btn  btn-danger" runat="server" Text="انصراف" CommandName="Cancel" />
                                 
                                 <uc1:MoroorgaranButton ID="BtnSave" ValidateionType="validate" CssClass="validatebtn btn btn-info" runat="server" Text="ثبت اطلاعات" CommandName="Insert" />
                    </div>
                </div>
             
       
            
                    
                    
            </InsertItemTemplate>
            <EditItemTemplate>
                     
                      
                <uc2:uscMahaleEjra runat="server" IDShahrestan='<%# Bind("IDRoosta") %>' ID="uscMahaleEjra1" />

                
                <div class="row">
                    <div class="col-sm-12 col-md-2 text-left">
                        نام طرح
                    </div>
                    <div class="col-md-4 col-sm-10">
                        <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>' CssClass ="form-control validate[required] "></asp:TextBox>
                    </div>
                        <div class ="col-sm-12 col-md-2 text-left">
                        سطح
                    </div>
                    <div class="col-md-4 col-sm-10">
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Sath") %>' CssClass ="form-control validate[required] float"></asp:TextBox>

                    </div>
               
                </div>
                <div class="row">
                         <div class ="col-sm-12 col-md-2 text-left ">
                        کد پروژه
                    </div>
                    <div class="col-md-4 col-sm-10">
                        <asp:TextBox ID="txtCode" runat="server" Text='<%# Bind("Code") %>' CssClass ="form-control validate[required] "></asp:TextBox>

                    </div>
                        <div class ="col-sm-12 col-md-2 text-left">
                       نوع پمپ
                    </div>
                    <div class="col-md-4 col-sm-10">
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("NoePomp") %>' CssClass ="form-control  "></asp:TextBox>

                    </div>
                </div>
                           <div class="row">
                    <div class="col-sm-12 col-md-2 text-left">
                        دبی
                    </div>
                    <div class="col-md-4 col-sm-10">
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Debi") %>' CssClass ="form-control   float"></asp:TextBox>
                    </div>
                        <div class ="col-sm-12 col-md-2 text-left ">
                        منابع تامین آب
                    </div>
                    <div class="col-md-4 col-sm-10">
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ManbaeTaminAb") %>' CssClass ="form-control  "></asp:TextBox>

                    </div>
               
                </div>
                <div class="row">
                    <div class="col-md-2 col-sm-12 text-left">
                        مشتری
                    </div>
                    <div class="col-md-4 col-sm-12 text-right">
                        <uc2:UscCheckNamayande runat="server"  CodeMelli='<%# Bind("CodeMeliMoshtary") %>' id="UscCheckNamayande" />
                    </div>
                      
                </div>
                  <div class="row">
                    <div class="col-md-2 col-sm-12 text-left">
                        تاریخ عقد قرارداد
                    </div>
                    <div class="col-md-4 col-sm-12 text-right">
                       <em:JQDatePicker ID="dteContract" DateFormat="YMD" CssClass="date" Regional="fa" ChangeMonth="true" ChangeYear="true" Date='<%# Bind( "ContractDate") %>' runat="server" CalendarType="Jalali"></em:JQDatePicker>
                    </div>
                        <div class ="col-sm-12 col-md-2 text-left ">
                          تاریخ ورود به انجمن
                        </div>
                    <div class="col-md-4 col-sm-10">
                  
                        <em:JQDatePicker ID="dteEntry" DateFormat="YMD" Regional="fa" CssClass="date" ChangeYear="true" ChangeMonth="true"  Date='<%# Bind( "EntryDate") %>' runat="server" CalendarType="Jalali"></em:JQDatePicker>
                    </div>
                </div>
                          <div class="row">
                    <div class="col-md-2 col-sm-12 text-left">
                        سهم دولت
                    </div>
                    <div class="col-md-4 col-sm-12 text-right">
                        <asp:TextBox ID="txtDolat" runat="server"  Text='<%#  Bind("SahmeDolat")   %>' CssClass ="form-control validate[required] currency "></asp:TextBox>                        
                    </div>
                        <div class ="col-sm-12 col-md-2 text-left ">
                            سهم بانک
                        </div>
                    <div class="col-md-4 col-sm-10">
                        <asp:TextBox ID="txtBank" runat="server"  Text='<%#   Bind("SahmeBank")  %>' CssClass ="form-control validate[required] currency  "></asp:TextBox>

                    </div>
                </div>
                    <div class="row">
                    <div class="col-md-2 col-sm-12 text-left">
                        سهم متقاضی
                    </div>
                    <div class="col-md-4 col-sm-12 text-right">
                        <asp:TextBox ID="txtMotaghazi" runat="server"  Text='<%#  Bind("SahmeMotaghazi")  %>' CssClass ="form-control validate[required] currency  "></asp:TextBox>                        
                    </div>
                   
                </div>
                <div class="row">
                    <div class="col-sm-2 text-left">
                                 نوع سیستم
                    </div>
                    <div class="col-sm-4 text-right">
                               <telerik:RadComboBox skin="Windows7"  ID="cmbNoe" SelectMethod="GetNoe" DataTextField="Sharh" DataValueField="ID"  SelectedValue='<%# Bind("IDNoe") %>' AppendDataBoundItems="true" runat="server">
                            <Items>
                                <telerik:RadComboBoxItem Text="انتخاب کنید" Value="" />
                            </Items>
                        </telerik:RadComboBox>
                    </div>
                    <div class="col-md-2 col-sm-12 text-left">
                        طراح
                    </div>
                    <div class="col-md-4 col-sm-12 text-right">
                          <telerik:RadComboBox skin="Windows7"  ID="cmbTarah" DropDownAutoWidth="Enabled" DataValueField="ID" DataTextField="Name" SelectMethod="Get_Tarah" SelectedValue='<%# Bind("IDSherkatTarah") %>' AppendDataBoundItems="true" runat="server">
                            <Items>
                                <telerik:RadComboBoxItem Text="انتخاب کنید" Value="" />
                            </Items>
                        </telerik:RadComboBox>
                    </div>
                                   <div class="row">
                    <div class="col-sm-6 text-left">
             
                                <uc1:MoroorgaranButton  ValidateionType="cancel" CausesValidation="False" ID="btnCancel" CssClass="notvalidatebtn btn  btn-danger" runat="server" Text="انصراف" CommandName="Cancel" />
                                <uc1:MoroorgaranButton  ValidateionType="validate" ID="BtnSave" CssClass="validatebtn btn btn-info" runat="server" Text="ثبت اطلاعات" CommandName="Update" />
                        
                    </div>
                </div>
          

            </EditItemTemplate>
        </asp:FormView>
 
    </div>
</div>
<div class="row">
        <div class="row col-sm-9">
  <uc1:RoleSelect  ID="uscRoleSelect" runat="server"></uc1:RoleSelect>

    </div>
    <div class ="col-sm-9"  >
        <uc1:ImportFromExcel ID="ImportFromExcel"  runat="server"></uc1:ImportFromExcel>
    </div>

</div>