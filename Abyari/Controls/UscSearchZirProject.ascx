<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscSearchZirProject.ascx.cs" Inherits="Abyari.Controls.UscSearchZirProject" %>
<%@ Register Assembly="Heidarpour.WebControlUI" Namespace="Heidarpour.WebControlUI" TagPrefix="rhp" %>


<div class="panel panel-info">
    <div class="  panel-heading text-left">
        <asp:Panel ID="PnlHeaderSearchZirProject" runat="server" Style="cursor: pointer; text-align: right">
            جستجوی زیر پروژه ها       
        </asp:Panel>
    </div>
    <asp:Panel runat="server" ID="PnlSearchZirProject">
         
            <div class="panel-body">
                  <div id="TrZirProject" runat="server" class="col-sm-12 ">
                    <div class="col-md-3 col-sm-12 text-right">
                        انتخاب طرح
                    </div>
                    <div class="col-md-5 col-sm-12">
                        <div class=" input-group ">
                            <span class="input-group-addon">
                                <a style="text-decoration: none;" rel="nofollow" class="thickbox" href="<%= SetPathSearch()  %>">
                                    <i class="fa fa-search"></i>
                                </a>
                                                </span>
                            <asp:TextBox  Text='<%#  Abyari.Helpers.ContextHelpers.GetZirProjeId() %>' ID="TxtEntekhabZirProject" CssClass="text-right form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
              
            </div>
            <div id="DivNemayesh" visible="false" runat="server" class="col-sm-12 form-group input-group ">
              
                    <div class="col-md-2 col-sm-6 text-right">
                        کد  طرح
                    </div>
                    <div class="col-md-3 col-sm-6 ">
                        <asp:Label ID="Lblcode" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-3 col-sm-6 text-right">
                        نام  طرح
                    </div>
                    <div class="col-md-4 col-sm-6 text-left ">
                        <asp:Label ID="LblName" runat="server"></asp:Label>
                    </div>

               
           
            </div>
   

   


    </asp:Panel>


</div>




