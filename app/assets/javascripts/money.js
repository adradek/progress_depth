$(document).on("turbolinks:load", function(){

  function calculate(){
    var hours   = parseInt($("#upwork_hours").val().replace(",", ".")) || 0;
    var minutes = parseInt($("#upwork_minutes").val().replace(",", ".")) || 0;
    var rate    = parseFloat($("#upwork_rate").val().replace(",", ".")) || 0;
    var my      = parseFloat($("#upwork_my").val().replace(",", ".")) || 0;

    var time = (hours * 60.0 + minutes)/60.0;
    return time * rate * my;
  }

  $("#upwork_hours, #upwork_minutes, #upwork_rate, #upwork_my").change(function(){
    var money = calculate();
    $("#write_money").html("$" + money);
  });

  $("#write_money").click(function(){
    var money = Math.floor(calculate());

    $("#activity_title").val("бабки дня");
    $("#activity_description").val("$" + money);
    $("#activity_value").val(Math.round(money/10.0));
    $("#upwork_money_modal_form").modal("hide");
  });
});
