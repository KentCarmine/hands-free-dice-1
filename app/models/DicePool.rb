class DicePool

  def initialize(dice_code)
    # @rng = TrueRandom::Random.new
  end

  def self.roll(dice_code, ruleset="standard")
    if ruleset == "standard"
      self.standard_roll(dice_code)
    elsif ruleset == "10-again"
    elsif ruleset == "9-again"
    elsif ruleset == "8-again"
    else

    end
  end



  private

  def self.standard_roll(dice_code)
    # UPDATE .parse method AND REMOVE .flatten WHEN USING MULTIPE DICE IN 1 STRING
    parsed_code = DiceCodeParser.parse(dice_code).flatten
    @operation = generate_operation(parsed_code)
    @constant = generate_constant(parsed_code)

    @dice_collection = create_dice(parsed_code)

    roll_result = 0
    each_roll = []

    @dice_collection.each do |dice|
      roll = dice.roll()
      each_roll << roll
      roll_result += roll
    end

    if @operation == "+"
      roll_result += @constant
    else
      roll_result -= @constant
    end

    [roll_result, each_roll.join(", "), @operation, @constant]
  end

  def self.create_dice(parsed_code)
    num_dice = generate_num_dice(parsed_code)
    dice_size = parsed_code[1].to_i
    # add_or_subtract = generate_operation(parsed_code)
    # constant = generate_constant(parsed_code)

    dice_collection = []

    num_dice.times do
      dice_collection << Dice.new(:num_sides => dice_size)
    end

    dice_collection
  end

  def self.generate_num_dice(parsed_code)
    if parsed_code[0].nil? || parsed_code[0] == ""
      return 1
    else
      return parsed_code[0].to_i
    end
  end

  def self.generate_operation(parsed_code)
    if parsed_code[2].nil? || parsed_code[2].empty?
      return "+"
    else
      return parsed_code[2]
    end
  end

  def self.generate_constant(parsed_code)
    if parsed_code[3].nil? || parsed_code[3].empty?
      return 0
    else
      return parsed_code[3].to_i
    end
  end

end