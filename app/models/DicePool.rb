class DicePool

  def initialize(dice_code)
    # @rng = TrueRandom::Random.new
  end

  def self.roll(dice_code, ruleset="standard")
    # puts "RULESET: "
    # puts ruleset
    if ruleset == "standard"
      # puts "USING STANDARD RULSET"
      self.standard_roll(dice_code)
    elsif ruleset == "10_again"
      # puts "USING 10-AGAIN RULSET"
      self.ten_again_roll(dice_code)
    elsif ruleset == "9_again"
    elsif ruleset == "8_again"
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

  def self.ten_again_roll(dice_code)
    num_dice = dice_code.to_i

    roll_result = 0
    all_rolls = []

    @dice_collection = self.created_d_tens(num_dice)

    @dice_collection.each do |dice|
      all_rolls << self.roll_single_dice_again_on(10, dice)
    end

    all_rolls.flatten!.sort!
    num_ones = self.count_ones(all_rolls)
    num_successes = self.count_successes(all_rolls, 8)

    [num_successes, num_ones, all_rolls.join(", ")]
  end

  def self.roll_single_dice_again_on(reroll_num, dice)
    results = []

    while true
      roll = dice.roll()
      results << roll

      if roll < reroll_num
        break
      end
    end

    results
  end

  def self.count_successes(rolls, threshold = 8)
    rolls.count {|roll| roll >= threshold}
  end

  def self.count_ones(rolls)
    rolls.count {|roll| roll <= 1}
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

  def self.created_d_tens(num_d_tens)
    dice_collection = []

    num_d_tens.times do
      dice_collection << Dice.new(:num_sides => 10)
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