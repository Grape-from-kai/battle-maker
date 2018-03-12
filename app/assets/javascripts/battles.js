$(function(){
    var battleDate = $("#battle").data("data-date");
    var now = new Date();
    if(battleDate < now){
        $("#battle").addClass("past-date");
  }
});