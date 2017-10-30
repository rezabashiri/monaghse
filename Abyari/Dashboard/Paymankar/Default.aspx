<%@ Page Title="" Language="C#" MasterPageFile="~/Design/Masters/Administrator.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Abyari.Dashboard.Paymankar.Default" %>
<%@ Register Src="~/Controls/UscPaymankarDetails.ascx" TagPrefix="uc2" TagName="UscPaymankarDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <uc2:UscPaymankarDetails runat="server" id="UscPaymankarDetails" />
        <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">نسبت طرحهای رزرو شده به عقد قرارداد </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                    در 5 سال گزشته
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="flot-chart"  >
                                <div class="flot-chart-content"   id="flot-pie-chart"></div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                </div>
        <script src="../flot/excanvas.js"></script>
    <script src="../flot/jquery.flot.js"></script>
    <script src="../flot/jquery.flot.pie.js"></script>
    <script src="../flot/jquery.flot.resize.js"></script>
    <script src="../flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
    <script src="../chart.js"></script>
    <script type="text/javascript">
        statistics();
    </script>
</asp:Content>
