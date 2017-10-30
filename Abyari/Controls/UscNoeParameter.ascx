<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscNoeParameter.ascx.cs" Inherits="Abyari.Controls.UscNoeParameter" %>

  <div class="col-md-2 col-sm-12 text-right ">
                      نوع پروژه
                    </div>
                    <div class="col-md-3 col-sm-12   " >
                    <asp:DropDownList ID="comNoe" DataTextField="Sharh" DataValueField="ID" AppendDataBoundItems="true" SelectMethod="GetData" CssClass="form-control text-right" runat="server"   >
                       <asp:ListItem Value="" Text="انتخاب کنید"></asp:ListItem>
                    </asp:DropDownList>

                    </div>
