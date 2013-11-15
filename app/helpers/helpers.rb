helpers do
  def display_standard_result(result)
    "<div class='text-italic most-recent-response'>
    Constant Modifier: #{result[2]}#{result[3]}<br><br>
    Each Dice Rolled: [#{result[1]}]<br><br>
    >> OVERALL RESULT ---->
    <span style='color:red;'><strong>#{result[0]}</strong></span><br>
    =================================<br><br>
    </div>"
  end

  def display_10_again_result(result)
    "<div class='text-italic most-recent-response'>
    Each Dice Rolled: [#{result[2]}]<br><br>
    # Ones: #{result[1]}<br><br>
    >> # SUCCESSES ---->
    <span style='color:red;'><strong>#{result[0]}</strong></span><br>
    =================================<br><br>
    </div>"
  end
end