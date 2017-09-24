<%@ Page Title="" Language="C#" MasterPageFile="~/Design/Masters/Main.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Abyari.Reports.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <em:JQLoader ID="loader" runat="server" LoadJQScript="false" LoadUIScript="false" LoadUICoreStyles="true" Theme="Flick" ></em:JQLoader>
 <em:JQDatePicker CssClass=" text-right" ID="DatePicker1" DateFormat="YMD" Regional="fa" ShowSelectButton="true" ChangeYear="true" ChangeMonth="true"   runat="server"></em:JQDatePicker>

 

                   <div class="row">
                    <div class="col-md-2 col-sm-12 text-left">
                        از تاریخ
                    </div>
                    <div class="col-md-4 col-sm-12 text-right">
                       <em:JQDatePicker ID="dteFrom" DateFormat="YMD" ChangeMonth="true"  ShowSelectButton="true" ChangeYear="true" Regional="fa" Date='<%# Bind( "ContractDate") %>' runat="server"  ></em:JQDatePicker>
                    </div>
                        <div class ="col-sm-12 col-md-2 text-left ">
                         تا تاریخ
                        </div>
                    <div class="col-md-4 col-sm-10">
                  
                        <em:JQDatePicker ID="dteEnd" DateFormat="YMD" Regional="fa" ChangeMonth="true" ChangeYear="true" Date='<%# Bind( "EntryDate") %>' runat="server"  ></em:JQDatePicker>
                    </div>
                </div>
</asp:Content>
