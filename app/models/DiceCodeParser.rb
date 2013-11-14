class DiceCodeParser
  def self.parse(dice_code)
    unchained_regex = /^(\d*)[dD](\d+)([+-])?(\d*)?$/
    p dice_code.scan(unchained_regex)
  end

end