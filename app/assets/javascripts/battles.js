$(function () {
  var now = new Date();
  var unixNow = Date.parse(now);
      $(".card").each(function(){
          var battleDate = $(this).data("date") * 1000;
          if (battleDate < unixNow){
          $(this).addClass("past-date");
      };
    }
  )}
 );