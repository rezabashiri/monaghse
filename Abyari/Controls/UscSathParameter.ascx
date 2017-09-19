<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscSathParameter.ascx.cs" Inherits="Abyari.Controls.UscSathParameter" %>


  <div class="col-md-4 col-sm-12 text-left ">
                       سطح  پروژه
                    </div>
                    <div class="col-md-5 col-sm-12   " style="direction: rtl">
                    <asp:DropDownList ID="comComparar" CssClass="form-control text-right" runat="server"   >
                       <asp:ListItem Value="" Text="همه"></asp:ListItem>
                       <asp:ListItem Value="more" Text="بزرگتر و مساوی"></asp:ListItem>
                       <asp:ListItem Value="less" Text="کوچکتر و مساوی"></asp:ListItem>
                       <asp:ListItem Value="equal" Text="برابر"></asp:ListItem>
                    </asp:DropDownList>

                    </div>
<div class="col-md-3 col-sm-12  ">
    <asp:TextBox ID="txtSath" Text="0" CssClass="form-control float" runat="server"></asp:TextBox>
</div>