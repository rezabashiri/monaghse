<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscSearchZirProject.ascx.cs" Inherits="Abyari.Controls.UscSearchZirProject" %>
<%@ Register Assembly="Heidarpour.WebControlUI" Namespace="Heidarpour.WebControlUI" TagPrefix="rhp" %>


<div class="panel panel-info">
    <div class="panel panel-heading text-right">
        <asp:Panel ID="PnlHeaderSearchZirProject" runat="server" Style="cursor: pointer; text-align: right">
            جستجوی زیر پروژه ها       
        </asp:Panel>
    </div>
    <asp:Panel runat="server" ID="PnlSearchZirProject">
        <div class="row">
            <div class="col-sm-12 form-group  input-group panel panel-primary panel-heading">
                  <div id="TrZirProject" runat="server" class="col-sm-12 ">
                    <div class="col-sm-3 text-left">
                        انتخاب زیر پروژه ها
                    </div>
                    <div class="col-sm-5">
                        <div class="col-sm-12 input-group  text-right">
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
                <div class="col-sm-12">
                    <div class="col-sm-2 text-left">
                        کد  زیر پروژه
                    </div>
                    <div class="col-sm-3 text-right ">
                        <asp:Label ID="Lblcode" runat="server"></asp:Label>
                    </div>
                    <div class="col-sm-3 text-left">
                        نام  پروژه
                    </div>
                    <div class="col-sm-4 text-right ">
                        <asp:Label ID="LblName" runat="server"></asp:Label>
                    </div>

                </div>
           
            </div>
        </div>

   


    </asp:Panel>


</div>




