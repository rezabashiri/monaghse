<%@ Page Language="C#" Title="ورود اعضا" AutoEventWireup="true" CodeBehind="LoginUser.aspx.cs" MasterPageFile="~/Design/Masters/Sitepopup.Master" Inherits="Abyari.LoginUser" %>

 <asp:Content ContentPlaceHolderID="MainContent" runat="server" ID="ContentPlaceHolder1">
        <div class="row">
        <div style="background: url('/Design/Images/backg2.jpg') ; padding: 0;   image-rendering: optimizespeed;  background-size:cover; min-height:700px " >
                        <div id="divLogin" runat="server" style=" min-width:60%; background: none repeat scroll 0 0 rgba(24, 107, 123, 0.7);  border-radius: 3px; box-shadow: 0 6px 6px rgba(0, 0, 0, 0.3); overflow: hidden; margin:0 auto;position:absolute;top:10%;left:20%"  >
                <div class="row">
                    <div class="  text-center">
                <span style=" text-align:justify;  font-size: 30px;color:white">  سامانه جامع انجمن صنفی پیمانکاران آبیاری تحت فشار استان اصفهان   </span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-sm-12 text-center">
               
                    <uc1:SignUp ID="SignUpControl" GroupName="پیمانکاران"  runat="server" />
                    </div>
                        <div class="col-md-6 col-sm-12 text-center">
               
                    <uc1:Login runat="server" ID="LoginControl"></uc1:Login>
    

                    </div>
                </div>
         
            </div>


        </div>

 </div>

     </asp:Content>
