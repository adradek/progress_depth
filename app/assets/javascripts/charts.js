$(document).on("turbolinks:load", function () {

  var overall_progress = document.getElementById('overall-progress-chart');
  var four_weeks = document.getElementById('four-weeks-chart');

  if (!!overall_progress || !!four_weeks) {
    google.charts.load('current', { 'packages': ['corechart'] });
    google.charts.setOnLoadCallback(drawCharts);
  };

  function drawCharts() {
    if (overall_progress) {
      start_asynch_process("/charts/overall_progress", overall_progress);
    };

    if (four_weeks) {
      start_asynch_process("/charts/last?days=24", four_weeks);
    };
  };

  function drawChart(stats, domObject) {
    var data = google.visualization.arrayToDataTable(stats);
    var options = {
      explorer: {
        axis: 'horizontal',
        keepInBounds: true,
      },
      curveType: 'function',
      legend: { position: 'bottom' }
    };

    var chart = new google.visualization.LineChart(domObject);
    chart.draw(data, options);
  };

  function start_asynch_process(url, domObject) {
    $.ajax({
      url: url,
      success: function(stats) {

        var goodStats = stats.map(function(item) {
          return [new Date(item[0]), item[1]];
        });

        console.log("stats: ", stats);
        console.log("good stats: ", goodStats);

        drawChart(goodStats, domObject);
      }
    });
  };
});
