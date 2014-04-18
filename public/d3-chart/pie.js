$(document).ready(function() {

    var dr_data = $('#requests_YTD_by_phys').html();
    var pharm_data = $('#requests_YTD_by_pharm').html();

    var testdata = [{
        key: "Physician",
        y: dr_data
    }, {
        key: "Pharmacy",
        y: pharm_data
    }];


    console.log(testdata);

    nv.addGraph(function() {

        var width = 500,
            height = 500;

        var chart = nv.models.pieChart()
            .x(function(d) {
                return d.key
            })
        //.y(function(d) { return d.value })
        //.labelThreshold(.08)
        //.showLabels(false)
        .color(d3.scale.category10().range())
            .width(width)
            .height(height)
            .donut(true);

        chart.pie
            .startAngle(function(d) {
                return d.startAngle / 2 - Math.PI / 2
            })
            .endAngle(function(d) {
                return d.endAngle / 2 - Math.PI / 2
            });

        //chart.pie.donutLabelsOutside(true).donut(true);

        d3.select("#test2")
        //.datum(historicalBarChart)
        .datum(testdata)
            .transition().duration(1200)
            .attr('width', width)
            .attr('height', height)
            .call(chart);

        return chart;
    });
});