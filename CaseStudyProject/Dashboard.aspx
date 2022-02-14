<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CaseStudyProject.Dashboard" %>

<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <title>Dashboard</title>
    <!-- Import jQuery Library -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.2.min.js"></script>
    <!-- Import HighCharts Library -->
    <script type="text/javascript" src="https://code.highcharts.com/highcharts.js"></script>
    <!-- Import HighCharts Export Library -->
    <script type="text/javascript" src="https://code.highcharts.com/modules/exporting.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="col-sm-6">
            <div class="card">
                <!-- BarChart -->
                <div class="card-body">
                    <div id="barChartDiv" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                </div>
                <!-- BarChart -->
            </div>
        </div>
        <div class="col-sm-6">
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">Veri Tablosu</h5>
                </div>
                <div class="card-body">
                    <div style="min-width: 310px; height: 350px; margin: 0 auto">
                        <!-- GridView -->
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                            <SettingsPager NumericButtonCount="12" PageSize="12">
                            </SettingsPager>
                            <SettingsPopup>
                                <HeaderFilter  MinHeight="140px"></HeaderFilter>
                            </SettingsPopup>
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="Donem" VisibleIndex="0" Width="300px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Marka" VisibleIndex="1" Width="300px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Tuketim" VisibleIndex="2" Width="300px">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Donem], [Marka], [Tuketim] FROM [CSProjectTable]"></asp:SqlDataSource>
                        <!-- GridView -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- LineChart -->
    <div id="lineChartDiv" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
    <!-- LineChart -->
    <br />
    <!-- Top5LineChart -->
    <div id="topLineChartDiv" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
    <!-- Top5LineChart -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
    <!-- Script -->
    <script src="Scripts/ChartScript/barchart.js"></script>
    <script src="Scripts/ChartScript/linechart.js"></script>
    <script src="Scripts/ChartScript/toplinechart.js"></script>
    <!-- Script -->
</asp:Content>
