helpers do
  def display_result(result)
    "<div class='text-italic most-recent-response'>
    Constant Modifier: #{result[2]}#{result[3]}<br><br>
    Each Dice Rolled: [#{result[1]}]<br><br>
    >> OVERALL RESULT ---->
    <span style='color:red;'><strong>#{result[0]}</strong></span><br>
    =================================<br><br>
    </div>"
  end
end