$(document).ready(function() {

    // hBarChart = [{
    //     key: "Total Requests",
    //     values: [{
    //         "label": "2013-07-01",
    //         "value": 486
    //     }, {
    //         "label": "2013-08-01",
    //         "value": 999
    //     }, {
    //         "label": "2013-09-01",
    //         "value": 1142
    //     }, {
    //         "label": "2013-10-01",
    //         "value": 1137
    //     }, {
    //         "label": "2013-11-01",
    //         "value": 978
    //     }, {
    //         "label": "2013-12-01",
    //         "value": 836
    //     }],

    // }]


    var values = $('#data_chart').html();

    var newvalues = JSON.parse(values);

    var kv_hash = {}
    kv_hash.key = "Total Requests"
    kv_hash.values = newvalues;

    var historicalBarChart = []
    historicalBarChart.push(kv_hash)

    console.log(historicalBarChart);

    // historicalBarChart = [{
    //     key: "Cumulative Return",
    //     values: [{
    //         "label": "A",
    //         "value": 29.765957771107
    //     }, {
    //         "label": "B",
    //         "value": 0
    //     }, {
    //         "label": "C",
    //         "value": 32.807804682612
    //     }, {
    //         "label": "D",
    //         "value": 196.45946739256
    //     }, {
    //         "label": "E",
    //         "value": 0.19434030906893
    //     }, {
    //         "label": "F",
    //         "value": 98.079782601442
    //     }, {
    //         "label": "G",
    //         "value": 13.925743130903
    //     }, {
    //         "label": "H",
    //         "value": 5.1387322875705
    //     }]
    // }];




    nv.addGraph(function() {
        var chart = nv.models.discreteBarChart()
            .x(function(d) {
                return d.label
            })
            .y(function(d) {
                return d.value
            })
            .staggerLabels(true)
        //.staggerLabels(historicalBarChart[0].values.length > 8)
        .tooltips(false)
            .showValues(true)
            .transitionDuration(250);

        d3.select('#chart1 svg')
            .datum(historicalBarChart)
            .call(chart);

        nv.utils.windowResize(chart.update);

        return chart;
    });


});