class Dice

  def initialize(params)
    @num_sides = params[:num_sides]
  end


  def roll(random_generator=nil)
    # rand(1..@num_sides) #USE RANDOM.ORG API WHEN REST OF CODE WORKS
    if random_generator
      random_generator.integer(1, 1, @num_sides)
    else
      rand(1..@num_sides)
    end
  end
end