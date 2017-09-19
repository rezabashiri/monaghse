<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscNoeParameter.ascx.cs" Inherits="Abyari.Controls.UscNoeParameter" %>

  <div class="col-md-6 col-sm-12 text-left ">
                      نوع پروژه
                    </div>
                    <div class="col-md-6 col-sm-12   " style="direction: rtl">
                    <asp:DropDownList ID="comNoe" DataTextField="Sharh" DataValueField="ID" AppendDataBoundItems="true" SelectMethod="GetData" CssClass="form-control text-right" runat="server"   >
                       <asp:ListItem Value="" Text="انتخاب کنید"></asp:ListItem>
                    </asp:DropDownList>

                    </div>
