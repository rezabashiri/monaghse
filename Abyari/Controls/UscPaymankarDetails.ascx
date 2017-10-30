<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UscPaymankarDetails.ascx.cs" Inherits="Abyari.Controls.UscPaymankarDetails" %>
     <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-comments fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-left">
                                        <div class="huge"><asp:Label ID="lblAllowed" runat="server" ></asp:Label></div>
                                        <div>طرح حای قابل رزرو</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-right"><a href="/Default.aspx">رزرو طرح</a></span>
                                    <span class="pull-left"><a href="/Default.aspx"><i class="fa fa-arrow-circle-left"></i></a></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-tasks fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-left">
                                        <div class="huge"><asp:Label ID="lblReserved" runat="server"></asp:Label></div>
                                        <div>طرح های رزرو شده</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-right">عقد قرارداد شده</span>
                                    <span class="pull-left"><asp:Label ID="lblContracted" runat="server" ></asp:Label></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-left">
                                        <div class="huge"><asp:Label ID="lblInvoice" runat="server"></asp:Label></div>
                                        <div>کل صورت حسابهای صادر شده(ريال)</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <%--<span class="pull-left">View Details</span>--%>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-support fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-left">
                                        <div class="huge"><asp:Label ID="lblPayment" runat="server" ></asp:Label></div>
                                        <div>مبلغ پرداخت شده در سال جاری(ريال)</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-right">مبلغ بدهی تاکنون</span>
                                    <span class="pull-left"><asp:Label ID="lblDue" runat="server"></asp:Label></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>