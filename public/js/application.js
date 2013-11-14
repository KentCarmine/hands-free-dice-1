$(document).ready(function() {
  $("#roll_form").on("submit", function(event){
    event.preventDefault();

    var data = $(this).serialize();

    $.post("/roll", data, function(response){
      var box = $("#roll-results-history")
      box.val(box.val() + response)
    });
  });
});
