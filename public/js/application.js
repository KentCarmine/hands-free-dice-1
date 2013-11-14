$(document).ready(function() {

  $(document).on("keydown", function(event){
    keyCode = event.which;
    // TAB = 9
    // ENTER = 13
    // console.log(keyCode)
    if(keyCode == 9){
      event.preventDefault();

      currently_selected_rb = $('input[name=roll_type]:checked', '#roll_form');
      debugger;
      if (currently_selected_rb == $("input[name=roll_type]").last()){
        $("input[name=roll_type]").first().prop("checked", true);
      }
      else {
        currently_selected_rb.next().next().prop("checked", true);
      }

    }
    else if (keyCode == 10){

    }
    else {
      // do nothing FOR NOW
    }
  });


  $("#roll_form").on("submit", function(event){
    event.preventDefault();

    var data = $(this).serialize();

    $.post("/roll", data, function(response){
      var box = $("#roll-results-history")
      box.val(box.val() + response)
    });
  });
});
