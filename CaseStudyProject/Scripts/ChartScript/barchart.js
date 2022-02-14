$.ajax({
    type: "POST",
    url: "Dashboard.aspx/GetBarChartData", //WebMethod to be called
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    async: false,   //execute script synchronously
    success: function (data) {
        //parsing json data
        var parsed = $.parseJSON(data.d);
        var population = [];
        //get each parsed json element and serialized it
        $.each(parsed, function (i, jsondata) {
            for (var i in jsondata) {
                var serial = new Array(i, parseFloat(jsondata[i])); //serialized array with province and population values
                population.push(serial); //build an array to be bind with values for HighCharts
            }
        });

        //Calling chart functions with population data
        DrawBarChart(population);

    },
    failure: function (response) {
        var r = jQuery.parseJSON(response.responseText);
        alert("Message: " + r.Message);
        alert("StackTrace: " + r.StackTrace);
        alert("ExceptionType: " + r.ExceptionType);
    }
});




//Function to draw Bar Chart
function DrawBarChart(population) {
    $('#barChartDiv').highcharts({
        chart: { type: 'column' },  //Bar Chart
        title: { text: 'Marka Bazlı Tüketim ' },
        subtitle: { text: '' },
        xAxis: { type: 'category', labels: { rotation: -90, style: { fontSize: '16px', fontFamily: 'Verdana, sans-serif' } } },
        yAxis: { min: 0, title: { text: null} },
        legend: { enabled: true },
        tooltip: { pointFormat: '' },
        series: [{
            name: 'Tüketim',
            data: population,  //Binding data
            dataLabels: {
                enabled: true, rotation: -0, color: '#FFFFFF', align: 'right', format: '{point.y:.1f}', y: 10,
                style: { fontSize: '16px', fontFamily: 'Verdana, sans-serif' }
            }
        }]
    });
}