$(document).ready(function() {

    var testdata = [{
        key: "One",
        y: 5
    }, {
        key: "Two",
        y: 2
    }, {
        key: "Three",
        y: 9
    }, {
        key: "Four",
        y: 7
    }, {
        key: "Five",
        y: 4
    }, {
        key: "Six",
        y: 3
    }, {
        key: "Seven",
        y: .5
    }];


    nv.addGraph(function() {
        var width = 500,
            height = 500;

        var chart = nv.models.pieChart()
            .x(function(d) {
                return d.key
            })
            .y(function(d) {
                return d.y
            })
            .color(d3.scale.category10().range())
            .width(width)
            .height(height);

        d3.select("#test1")
            .datum(testdata)
            .transition().duration(1200)
            .attr('width', width)
            .attr('height', height)
            .call(chart);

        chart.dispatch.on('stateChange', function(e) {
            nv.log('New State:', JSON.stringify(e));
        });

        return chart;
    });

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