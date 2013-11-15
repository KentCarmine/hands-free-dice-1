class DiceCodeParser
  def self.parse(dice_code)
    unchained_regex = /^(\d*)[dD](\d+)([+-])?(\d*)?$/
    dice_code.scan(unchained_regex)
  end

end