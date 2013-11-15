$(document).ready(function() {
  var INPUT_KEY_CODES = new Array(32, 8, 46, 107, 109, 110);
  for (var i = 48; i <= 57; i++){
    INPUT_KEY_CODES.push(i);
  }
  for (var i = 65; i <= 90; i++) {
    INPUT_KEY_CODES.push(i);
  }

  for(var i = 96; i <= 105; i++){
    INPUT_KEY_CODES.push(i);
  }

  // console.log(INPUT_KEY_CODES);

  $(document).on("keydown", function(event){
    keyCode = event.which;
    // TAB = 9
    // ENTER = 13
    // console.log(keyCode)
    if(keyCode == 9){
      event.preventDefault();

      currently_selected_rb = $('input[name=roll_type]:checked', '#roll_form');

      var last_rb = $("input[name=roll_type]").last()
      //TRY currently_selected_rb.get(0) == last_rb.get(0)
      // console.log(currently_selected_rb.get(0) == last_rb.get(0))

      if (currently_selected_rb.get(0) == last_rb.get(0)){
        $("input[name=roll_type]").first().prop("checked", true);
      }
      else {
        currently_selected_rb.next().next().prop("checked", true);
      }

    }
    else if (keyCode == 13){
      // $("#dice-box").focus();
      event.preventDefault();

      $("#roll_form").submit();
      $("#dice-box").val("");
    }
    else if (INPUT_KEY_CODES.indexOf(keyCode) != -1) {
      // console.log(event.which);
      $("#dice-box").focus();
    }
    else if (keyCode == 61) {
      event.preventDefault();
      $("#dice-box").val($("#dice-box").val() + "+");
    }
    else if (keyCode == 173) {
      event.preventDefault();
      $("#dice-box").val($("#dice-box").val() + "-");
    }
    else {
      // do nothing FOR NOW
    }
  });


  $("#roll_form").on("submit", function(event){
    event.preventDefault();

    var data = $(this).serialize();

    $.post("/roll", data, function(response){
      var box = $("#roll-results-history");
      box.val(box.val() + response);
      box.get(0).scrollTop = box.get(0).scrollHeight;
    });
  });
});
