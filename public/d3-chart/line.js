$(document).ready(function() {

    console.log($('#physician_line_data').html());

    var physData = JSON.parse($('#physician_line_data').html());
    var pharmData = JSON.parse($('#pharm_line_data').html());


    defaultChartConfig("chart9", lineData(physData, pharmData), false, true);


    //console.log(lineData(physData, pharmData));

    function defaultChartConfig(containerid, data, guideline, useDates, auxOptions) {
        if (auxOptions === undefined) auxOptions = {};
        if (guideline === undefined) guideline = true;
        nv.addGraph(function() {
            var chart;
            chart = nv.models.lineChart().useInteractiveGuideline(guideline);


            chart
                .x(function(d, i) {
                    return d.x;
                });

            if (auxOptions.width)
                chart.width(auxOptions.width);

            if (auxOptions.height)
                chart.height(auxOptions.height);

            if (auxOptions.forceY)
                chart.forceY([0]);

            var formatter;
            if (useDates !== undefined) {
                formatter = function(d, i) {
                    var format = d3.time.format("%Y-%m-%d");
                    return format(new Date(2013, d - 1, 1));
                }
            } else {
                formatter = d3.format(",.1f");
            }

            chart.margin({
                right: 40
            });

            chart.xAxis // chart sub-models (ie. xAxis, yAxis, etc) when accessed directly, return themselves, not the parent chart, so need to chain separately
            //.tickValues([6, 7, 8, 9, 10, 11, 12])
            .tickFormat(
                formatter
            );

            chart.yAxis
                .axisLabel('Requests')
                .tickFormat(d3.format(',.2f'));


            d3.select('#' + containerid + ' svg')
                .datum(data)
                .transition().duration(500)
                .call(chart);

            nv.utils.windowResize(chart.update);

            return chart;
        });
    }


    function lineData(phys, pharm) {
        return [{
            values: phys,
            area: true,
            color: "#22fb88",
            key: "Physician"
        }, {
            values: pharm,
            area: true,
            color: "#333333",
            key: "Pharmacy"
        }];
    }


});