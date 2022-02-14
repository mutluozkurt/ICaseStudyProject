$.ajax({
    type: "POST",
    url: "Dashboard.aspx/GetLineChartData", //WebMethod to be called
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    async: false,   //execute script synchronously
    data: {}
})
    .done(function (data) {

        DrawLineChart(data.d.series, data.d.period)
    });

function DrawLineChart(Series, Period) {
    $('#lineChartDiv').highcharts({
        chart: {
            type: 'line'
        },
        title: {
            text: 'Dönemlik Tüketim '
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            categories: Period
        },
        yAxis: {
            title: {
                text: ''
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true
                },
                enableMouseTracking: false
            }
        },
        series: Series
    });
}