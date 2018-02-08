$(document).on("turbolinks:load", function () {

  var overall_progress = document.getElementById('overall-progress-chart');

  if (overall_progress) {

    $.ajax({
      url: "/charts/overall_progress",
      success: function(stats){

        var goodStats = stats.map(function(item) {
          return [new Date(item[0]), item[1]];
        });

        console.log("stats: ", stats);
        console.log("good stats: ", goodStats);

        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
          var data = google.visualization.arrayToDataTable(goodStats);
          var options = {
            explorer: {
              axis: 'horizontal',
              keepInBounds: true,
            },
            curveType: 'function',
            legend: { position: 'bottom' }
          };

          var chart = new google.visualization.LineChart(overall_progress);
          chart.draw(data, options);
        }
      }
    });
  }
});
